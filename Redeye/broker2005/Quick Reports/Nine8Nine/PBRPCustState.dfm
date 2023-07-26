object PBRPCustStateFrm: TPBRPCustStateFrm
  Left = 170
  Top = 103
  Width = 996
  Height = 738
  HorzScrollBar.Range = 1200
  VertScrollBar.Range = 2000
  Caption = 'Customer Statement'
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
    DataSet = GetCompSQL
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
    DataSet = GetCompSQL
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
    Left = 48
    Top = 10
    Width = 992
    Height = 1403
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
      Left = 0
      Top = 522
      Width = 992
      Height = 5
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
        2099.733333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'SalesInvSQL.Account_Code'
      FooterBand = GrpFootQRBand
      Master = InvDetailBand
      ReprintOnNewPage = False
    end
    object InvDetailBand: TQRSubDetail
      Left = 0
      Top = 527
      Width = 992
      Height = 29
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
        61.383333333333330000
        2099.733333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = InvoiceReport
      DataSet = SalesInvSQL
      PrintBefore = False
      PrintIfEmpty = True
      object CustRefQRDBText: TQRDBText
        Left = 144
        Top = 0
        Width = 308
        Height = 25
        Size.Values = (
          52.916666666666700000
          304.270833333333000000
          0.000000000000000000
          650.875000000000000000)
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
        Font.Height = -17
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object lblGoods: TQRLabel
        Left = 662
        Top = 0
        Width = 66
        Height = 25
        Size.Values = (
          52.916666666666670000
          1401.233333333333000000
          0.000000000000000000
          139.700000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblGoods'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
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
      object LblTotal: TQRLabel
        Left = 887
        Top = 1
        Width = 61
        Height = 25
        Size.Values = (
          52.916666666666670000
          1877.483333333333000000
          2.116666666666667000
          129.116666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'LblTotal'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
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
      object lblVat: TQRLabel
        Left = 784
        Top = 3
        Width = 44
        Height = 25
        Size.Values = (
          52.916666666666670000
          1659.466666666667000000
          6.350000000000000000
          93.133333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblVat'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
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
      object lblCustomerRef: TQRLabel
        Left = 470
        Top = 1
        Width = 161
        Height = 25
        Size.Values = (
          52.916666666666700000
          994.833333333333000000
          2.645833333333330000
          341.312500000000000000)
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
      object QRDBText1: TQRDBText
        Left = 35
        Top = 0
        Width = 126
        Height = 25
        Size.Values = (
          52.916666666666670000
          74.083333333333330000
          0.000000000000000000
          266.700000000000000000)
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
        Font.Height = -17
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object QRBand1: TQRBand
      Left = 0
      Top = 24
      Width = 992
      Height = 498
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
        1054.100000000000000000
        2099.733333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object lblRundate: TQRLabel
        Left = 751
        Top = 280
        Width = 79
        Height = 25
        Size.Values = (
          52.916666666666670000
          1589.616666666667000000
          592.666666666666700000
          167.216666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'lblRundate'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
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
      object lblInvoiceNo: TQRLabel
        Left = 751
        Top = 239
        Width = 91
        Height = 25
        Size.Values = (
          52.916666666666670000
          1589.616666666667000000
          505.883333333333300000
          192.616666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'lblInvoiceNo'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
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
      object QRLabel2: TQRLabel
        Left = 640
        Top = 380
        Width = 47
        Height = 25
        Size.Values = (
          52.916666666666670000
          1354.666666666667000000
          804.333333333333300000
          99.483333333333330000)
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
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object lblPage: TQRLabel
        Left = 751
        Top = 380
        Width = 56
        Height = 25
        Size.Values = (
          52.916666666666670000
          1589.616666666667000000
          804.333333333333300000
          118.533333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'lblPage'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
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
      object QRLabel4: TQRLabel
        Left = 640
        Top = 240
        Width = 96
        Height = 25
        Size.Values = (
          52.916666666666670000
          1354.666666666667000000
          508.000000000000000000
          203.200000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Statement No'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel5: TQRLabel
        Left = 640
        Top = 280
        Width = 110
        Height = 25
        Size.Values = (
          52.916666666666670000
          1354.666666666667000000
          592.666666666666700000
          232.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Statement Date'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel8: TQRLabel
        Left = 756
        Top = 200
        Width = 85
        Height = 29
        Size.Values = (
          61.383333333333330000
          1600.200000000000000000
          423.333333333333300000
          179.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Statement'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -20
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRMemoCmpnyNm: TQRMemo
        Left = 620
        Top = 15
        Width = 128
        Height = 151
        Size.Values = (
          319.616666666666700000
          1312.333333333333000000
          31.750000000000000000
          270.933333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoStretch = True
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Garamond'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object QRLabel3: TQRLabel
        Left = 150
        Top = 200
        Width = 134
        Height = 25
        Size.Values = (
          52.916666666666670000
          317.500000000000000000
          423.333333333333300000
          283.633333333333300000)
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
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object CustomerAddMemo: TQRMemo
        Left = 150
        Top = 222
        Width = 421
        Height = 145
        Size.Values = (
          306.916666666666700000
          317.500000000000000000
          470.958333333333300000
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
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
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
        Top = 323
        Width = 68
        Height = 25
        Size.Values = (
          52.916666666666670000
          1354.666666666667000000
          683.683333333333300000
          143.933333333333300000)
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
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object LblAccountCode: TQRDBText
        Left = 751
        Top = 323
        Width = 103
        Height = 25
        Size.Values = (
          52.916666666666670000
          1589.616666666667000000
          683.683333333333300000
          218.016666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = SalesInvSQL
        DataField = 'Account_Code'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel10: TQRLabel
        Left = 144
        Top = 473
        Width = 84
        Height = 25
        Size.Values = (
          52.916666666666670000
          304.800000000000000000
          1001.183333333333000000
          177.800000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Description'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel13: TQRLabel
        Left = 848
        Top = 473
        Width = 97
        Height = 25
        Size.Values = (
          52.916666666666670000
          1794.933333333333000000
          1001.183333333333000000
          205.316666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total Amount'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel11: TQRLabel
        Left = 470
        Top = 473
        Width = 65
        Height = 25
        Size.Values = (
          52.916666666666670000
          994.833333333333300000
          1001.183333333333000000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Your Ref'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel12: TQRLabel
        Left = 36
        Top = 473
        Width = 58
        Height = 25
        Size.Values = (
          52.916666666666670000
          76.200000000000000000
          1001.183333333333000000
          122.766666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Our Ref'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel17: TQRLabel
        Left = 651
        Top = 473
        Width = 80
        Height = 25
        Size.Values = (
          52.916666666666670000
          1377.950000000000000000
          1001.183333333333000000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total Price'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel14: TQRLabel
        Left = 794
        Top = 473
        Width = 33
        Height = 24
        Size.Values = (
          50.800000000000000000
          1680.633333333333000000
          1001.183333333333000000
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
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object imgReport: TQRImage
        Left = 50
        Top = 20
        Width = 325
        Height = 131
        Size.Values = (
          277.812500000000000000
          105.833333333333300000
          42.333333333333340000
          687.916666666666800000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Picture.Data = {
          07544269746D617086C10100424D86C10100000000003604000028000000F401
          0000E4000000010008000000000050BD01000000000000000000000100000001
          0000101010001818180021212100292929003131310039393900424242004A4A
          4A00525252005A5A5A00636363006B6B6B00737373007B7B7B00848484008C8C
          8C00949494009C9C9C00A5A5A500ADADAD00B5B5B500BDBDBD00C6C6C600CECE
          CE00D6D6D600DEDEDE00E7E7E700EFEFEF00F7F7F7000008FF000010FF000810
          FF000818FF001018FF000821FF001021FF001829FF002129FF002131FF002939
          FF003139FF002942FF003142FF003942FF00394AFF00424AFF004A4AFF003952
          FF004252FF004A52FF005252FF004A5AFF00525AFF005A63FF006363FF005A6B
          FF00636BFF006B73FF007373FF006B7BFF00737BFF007B84FF008484FF007B8C
          FF00848CFF008C94FF009494FF00949CFF009CA5FF00A5A5FF00ADB5FF00B5B5
          FF00BDBDFF00BDC6FF00C6C6FF00C6CEFF00CECEFF00CED6FF00D6D6FF00DEDE
          FF00E7DEFF00DEE7FF00E7E7FF00EFEFFF00F7EFFF00EFF7FF00F7F7FF00FFF7
          FF00F7FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959171616161616161616
          161616161616161616161616161616161616161616161616595959595959594A
          4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4A4959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5918060001010101010101010101010101010101010101010101010101010101
          010101010101010101010101595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D38595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959591B03010101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D35535959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959452F1E1D1D1D1E1D303F4B595959595959595959595959595959
          595959595959595959594A381E1D1D1E1D2D4259595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959591800010100010101010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101595959595959591D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1E1E1D1D1D1D214F5959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959591D1E1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1E1D1D3C595959595959595959595959595959595959
          5959491D1D1D1D1D1D1E59595959595959595959591D1D1D1D1D1D1D2C595959
          595959595959595959595959595959595959595959594D1E1D1D1D1D1D1D1E1E
          1E1D1D1E1E1E1D1E1E1E394C595959595959595959595959595959211E1D1E1E
          1D1E1E1D1E1E1D1D1D1D3C595959595959595959595959595959251D1D1E1D1D
          1E1D1E1E1E1E1D1D2C4159595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959590501010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          0101010101010101595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D24595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D2559595959595959595959595959595959594A1D1D1D1D1D1D1D5959
          5959595959595959591D1D1D1D1D1D1D2D595959595959595959595959595959
          5959595959595959561E1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          595959595959595959595959591D1E1E1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1E3D59595959595959595959531E1D1D1D1D1D1D1D1D1D1D1D1D1D1D1E1E5959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595917010101010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010159595959
          5959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1E595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1E1D4F5959595959
          595959595959595959594A1D1D1D1D1D1D1D59595959595959595959591D1D1D
          1D1D1D1D2D59595959595959595959595959595959595959595959591D1E1E1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D595959595959595959595959
          211E1D1E1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D59595959595959595959
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D5959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959595959595959595959595959595959595959591A010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          01010101010101010101010101010101595959595959591D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1E1D59595959595959595959595959595959595959
          59595959595959595959595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1E1D2859595959595959595959595959594A1D
          1D1D1D1D1D1D59595959595959595959591D1D1D1D1D1D1D2D59595959595959
          5959595959595959595959595959591D1E1E1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1E2C5959595959595959595959281E1D1E1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1E3E595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D5959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959591C01010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          01010101595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1E595959595959595959595959595959595959595959595959595959595959
          59595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D4D595959595959595959595959594A1D1D1D1D1D1D1D595959595959
          59595959591D1D1D1D1D1D1D2D59595959595959595959595959595959595959
          59594A1D1D1D1E1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D3E59595959
          5959595959594E1D1E1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1E495959
          59595959595959391D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1E1D1D595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595901
          0101010101010101010101010101010101010101010101010101010101010101
          010101010101010101010101010101010101010101010101595959595959591D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1E1E1E1D445959595959595959
          595959595959595959595959595959595959595959595959595959591D1D1D1D
          1D1D1E1D1D1D1D1D1D1D1D1D1E1E1D1D1E1D1D1D1D1D1D1E1D36595959595959
          5959595959594A1D1D1D1D1D1D1D59595959595959595959591D1D1D1D1D1D1D
          2D5959595959595959595959595959595959595959591E1E1D1D1D1D1D1D1E1E
          3D59595959594A49403C2D1D1D1D1F46595959595959595959591D1E1E1D1D1D
          1E1D1D1D384A59594F3E201E1D1E1E1D1E595959595959595959591D1D1D1D1D
          1D1D1E1E1E1D1D1D1E1D1E1D1D3B595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          59595959595959595959595959595959591C0001000101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          010101010101010101010101595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1E1E1E3759595959595959595959595959595959595959
          595959595959595959595959595959591D1D1D1D1D1D1D1E5959595959595959
          5959421E1D1D1D1D1D1D1D1E1D1E5959595959595959595959594A1D1D1D1D1D
          1D1D59595959595959595959591D1D1D1D1D1D1D2D5959595959595959595959
          5959595959595959591E1E1E1D1D1D1E1D1E5959595959595959595959595959
          595959575959595959595959594D1D1E1D1D1D1D1D1D59595959595959595959
          5959341D1D595959595959595959591D1D1D1D1D1D1D1D595959595959595959
          4959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959010101010101010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1E1D1E1D1D
          1E35595959595959595959595959595959595959595959595959595959595959
          595959591D1D1D1D1D1D1E1D5959595959595959595959592D1D1D1D1D1D1D1D
          1D1D2D59595959595959595959594A1D1D1D1D1D1D1D59595959595959595959
          591D1D1D1D1D1D1D2D59595959595959595959595959595959595959591E1E1D
          1D1D1D1D1D595959595959595959595958595959595959595959595959595959
          59251D1E1E1D1D1D1D3459595959595959595959595959594259595959595959
          5959591D1D1D1D1D1D1D41595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959590101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101595959595959591D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D45595959595959595959
          5959595959595959595959595959595959595959595959591D1D1D1D1D1D1D1E
          59595959595959595959595959591E1E1D1D1D1D1D1D1D4F5959595959595959
          59594A1D1D1D1D1D1D1D59595959595959595959591D1D1D1D1D1D1D2D595959
          59595959595959595959595959595959591D1D1D1D1D1D1D2659595959595959
          5959595959595959595959595959595959595959591E1D1D1D1D1D1D1D595959
          59595959595959595959595959595959595959595959591D1D1D1D1D1D1D5959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959130101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          0101010101010101595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D4C5959595959595959595959595959595959595959
          5959595959595959595959591D1D1D1D1D1D1D1E595959595959595959595959
          59593E1E1D1D1D1D1D1D1D26595959595959595959594A1D1D1D1D1D1D1D5959
          5959595959595959591D1D1D1D1D1D1D2D595959595959595959595959595959
          59595959531D1D1D1D1D1D1E4E59595959595959595959595959595959595959
          5959595959595959511E1D1D1D1D1D1D1E595959595959595959595959595959
          59595959595959595959591D1D1D1D1D1D1D5959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959590801
          0101010101010101010101010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010159595959
          5959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          5959595959595959595959595959595959595959595959595959595959595959
          1D1D1D1D1D1D1D1E5959595959595959595959595959591E1D1D1D1D1D1D1D1D
          595959595959595959594A1D1D1D1D1D1D1D59595959595959595959591D1D1D
          1D1D1D1D2D595959595959595959595959595959595959593F1D1D1D1D1D1D1D
          59595959595959595959595959595959595959595959595959595959381E1D1D
          1D1D1D1D4059595959595959595959595959595959595959595959595959591D
          1D1D1D1D1D1D5959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          59595959595959595959595959595959591C0101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          01010101010101010101010101010101595959595959591D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1E1D5959595959595959595959
          59595959595959595959595959595959595959591D1D1D1D1D1D1D1E59595959
          59595959595959595959593A1D1D1D1D1D1D1D1D595959595959595959594A1D
          1D1D1D1D1D1D59595959595959595959591D1D1D1D1D1D1D2D59595959595959
          5959595959595959595959592A1D1D1D1D1D1D1D595959595959595959595959
          595959595959595959595959595959591F1D1D1D1D1E1D1D5359595959595959
          595959595959595959595959595959595959591D1D1D1D1D1D1D595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959010101010101010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          01010101595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1E1D1D4959595959595959595959595959595959595959595959
          59595959595959591D1D1D1D1D1D1D1E59595959595959595959595959595959
          1D1D1D1D1D1D1D1D595959595959595959594A1D1D1D1D1D1D1D595959595959
          59595959591D1D1D1D1D1D1D2D59595959595959595959595959595959595959
          1E1D1D1D1D1D1D1D595959595959595959595959595959595959595959595959
          595959591E1E1D1D1D1D1D1D5959595959595959595959595959595959595959
          595959595959591D1D1D1D1D1D1D595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959590100010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          010101010101010101010101010101010101010101010101595959595959591D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1E1D1E1E4959
          595959595959595959595959595959595959595959595959595959591D1D1D1D
          1D1D1D1E595959595959595959595959595959591D1D1D1D1D1D1D1D49595959
          5959595959594A1D1D1D1D1D1D1D59595959595959595959591D1D1D1D1D1D1D
          2D595959595959595959595959595959595959591D1D1D1D1D1D1D1D59595959
          5959595959595959595959595959595959595959595959591D1E1D1D1D1D1D1D
          5959595959595959595959595959595959595959595959595959591D1D1D1D1D
          1D1D595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959590101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          010101010101010101010101595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1E1E59595959595959595959595959
          595959595959595959595959595959591D1D1D1D1D1D1D1E5959595959595959
          59595959595959571D1D1D1D1D1D1D1D405959595959595959594A1D1D1D1D1D
          1D1D59595959595959595959591D1D1D1D1D1D1D2D5959595959595959595959
          59595959595959591D1D1D1D1D1D1D1D59595959595959595959595959595959
          5959595959595959595959591D1D1D1D1D1E1D1D595959595959595959595959
          5959595959595959595959595959591D1D1D1D1D1D1D59595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595901
          0101010101010101010101010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1E1D4F595959595959595959595959595959595959595959595959
          595959591D1D1D1D1D1D1D1E595959595959595959595959595959591D1D1D1D
          1D1D1D1E2E5959595959595959594A1D1D1D1D1D1D1D59595959595959595959
          591D1D1D1D1D1D1D2D595959595959595959595959595959595959591D1D1D1D
          1D1D1D1E2C2D2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2D2D5959595959595959
          1D1D1D1D1D1E1D1D595959595959595959595959595959595959595959595959
          5959591D1D1D1D1D1D1D59595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595901010101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101595959595959591D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1E1E59595959
          5959595959595959595959595959595959595959595959591D1D1D1D1D1D1D1E
          595959595959595959595959595959591D1D1D1D1D1D1D1D2C59595959595959
          59594A1D1D1D1D1D1D1D59595959595959595959591D1D1D1D1D1D1D2D595959
          595959595959595959595959595959591D1D1D1D1D1D1D1D1E1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1E59595959595959591D1D1D1D1D1E1D1D59595959
          59595959595959595959595959595959595959595959591D1D1D1D1D1D1D5959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959590800010101010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          0101010101010101595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D37595959595959595959595959595959
          5959595959595959595959591D1D1D1D1D1D1D1E595959595959595959595959
          595959591D1D1D1D1D1D1D1D2C5959595959595959594A1D1D1D1D1D1D1D5959
          5959595959595959591D1D1D1D1D1D1D2D595959595959595959595959595959
          595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          59595959595959591D1D1D1D1D1E1D1D59595959595959595959595959595959
          59595959595959595959591D1D1D1D1D1D1D5959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959595959595959595959595959595959595959591A000101010101
          0101010101010101010101010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010159595959
          5959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D595959595959595959595959595959595959595959595959595959
          1D1D1D1D1D1D1D1E595959595959595959595959595959591D1D1D1D1D1D1D1D
          2C5959595959595959594A1D1D1D1D1D1D1D59595959595959595959591D1D1D
          1D1D1D1D2D595959595959595959595959595959595959591D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D59595959595959591D1D1D1D
          1D1E1D1D5959595959595959595959595959595959595959595959595959591D
          1D1D1D1D1D1D5959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595905010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          01010101010101010101010101010101595959595959591D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D59595959595959
          59595959595959595959595959595959595959591D1D1D1D1D1D1D1E59595959
          5959595959595959595959591D1D1D1D1D1D1D1D2C5959595959595959594A1D
          1D1D1D1D1D1D59595959595959595959591D1D1D1D1D1D1D2D59595959595959
          5959595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D59595959595959591D1D1D1D1D1E1D1D5959595959595959
          595959595959595959595959595959595959591D1D1D1D1D1D1D595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5900010101010101010101010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          01010101595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1E25595959595959595959595959595959595959
          59595959595959591D1D1D1D1D1D1D1E59595959595959595959595959595959
          1D1D1D1D1D1D1D1D2C5959595959595959594A1D1D1D1D1D1D1D595959595959
          59595959591D1D1D1D1D1D1D2D59595959595959595959595959595959595959
          1D1D1D1D1D1D1D1E3D3D3F3F3F3F3F3F3F3F3F3D3D1D1E1D1D1D1D1D59595959
          595959591D1D1D1D1D1D1E1E5959595959595959595959595959595959595959
          595959595959591D1D1D1D1D1D1D595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959590101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          010101010101010101010101010101010101010101010101595959595959591D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1E1D59595959595959595959595959595959595959595959595959591D1D1D1D
          1D1D1D1E595959595959595959595959595959591D1D1D1D1D1D1D1D2C595959
          5959595959594A1D1D1D1D1D1D1D59595959595959595959591D1D1D1D1D1D1D
          2D595959595959595959595959595959595959591E1D1D1D1D1D1D1E59595959
          5959595959595959591E1D1D1D1D1D1D59595959595959591D1D1D1D1D1E1E1D
          5959595959595959595959595959595959595959595959595959591D1D1D1D1D
          1D1D595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          59595959595959590A0101000101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          010101010101010101010101595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1E1D59595959595959595959
          595959595959595959595959595959591D1D1D1D1D1D1D1E5959595959595959
          59595959595959591D1D1D1D1D1D1D1D2C5959595959595959594A1D1D1D1D1D
          1D1D59595959595959595959591D1D1D1D1D1D1D2D5959595959595959595959
          59595959595959591E1D1D1D1D1D1D1D595959595959595959595959591E1D1D
          1D1D1D1D59595959595959591D1D1D1D1D1D1E1E595959595959595959595959
          5959595959595959595959595959591D1D1D1D1D1D1D59595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595901010101
          0101010101010101010101010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D45595959595959595959595959595959595959595959
          595959591D1D1D1D1D1D1D1E595959595959595959595959595959591D1D1D1D
          1D1D1D1D2C5959595959595959594A1D1D1D1D1D1D1D59595959595959595959
          591D1D1D1D1D1D1D2C595959595959595959595959595959595959592D1D1D1D
          1D1D1D1D595959595959595959595959591E1E1D1D1D1D1D5959595959595959
          271D1D1D1D1D1D1D4A5959595959595959595959595959595959595959595959
          5959591D1D1D1D1D1D1D59595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595901010101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101595959595959591D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1E1D2459
          5959595959595959595959595959595959595959595959591D1D1D1D1D1D1D1E
          595959595959595959595959595959591D1D1D1D1D1D1D1D2C59595959595959
          59594A1D1D1D1D1D1D1D59595959595959595959591D1D1D1D1D1D1E1D595959
          595959595959595959595959595959593C1D1D1D1D1D1D1E5959595959595959
          59595959591D1D1D1D1D1D1D5959595959595959371E1D1D1D1D1D1D40595959
          59595959595959595959595959595959595959595959591D1D1D1D1D1D1D5959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959590B01010101010101010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          0101010101010101595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1E1D1E59595959595959595959595959
          5959595959595959595959591D1D1D1D1D1D1D1E595959595959595959595959
          595959591D1D1D1D1D1D1D1D2C5959595959595959594A1D1D1D1D1D1D1D5959
          5959595959595959591D1D1D1D1D1D1D1D595959595959595959595959595959
          59595959521D1D1D1D1D1D1E595959595959595959595959391D1D1D1D1D1D1E
          59595959595959594C1E1D1D1D1D1D1D1E595959595959595959595959595959
          59595959595959595959591D1D1D1D1D1D1D5959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010159595959
          5959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D59595959595959595959595959595959595959595959595959
          1D1D1D1D1D1D1D1E595959595959595959595959595959591D1D1D1D1D1D1D1D
          2C5959595959595959594A1D1D1D1D1D1D1D59595959595959595959591D1D1D
          1D1D1D1D1D22595959595959595959595959595959595959591E1E1D1D1D1D1D
          3859595959595959595959591D1D1D1D1D1D1D1E5959595959595959591D1D1D
          1D1D1D1D1E59595959595959595959595959595959595959595959595959591E
          1D1D1D1D1D1D5959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959020101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          01010101010101010101010101010101595959595959591D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D4559595959
          59595959595959595959595959595959595959591D1D1D1D1D1D1D1E59595959
          5959595959595959595959591D1D1D1D1D1D1D1D2C5959595959595959594A1D
          1D1D1D1D1D1D59595959595959595959401D1D1D1D1D1D1D1E1E385959595959
          59561D1E1D2D4C5959595959591D1E1D1D1D1D1D1E595959595959595959593C
          1E1D1D1D1D1D1E28595959595959595959211D1D1D1D1D1D1D38595959595959
          59595959595959594D595959595959595959591E1D1D1D1D1D1D595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595901
          0101010101010101010101010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          01010101595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D2D59595959595959595959595959595959
          59595959595959591D1D1D1D1D1D1D1E59595959595959595959595959595959
          1D1D1D1D1D1D1D1D2C5959595959595959594A1D1D1D1D1D1D1D595959595959
          595959591D1D1D1D1D1D1D1D1E1D1D1D59595959591D1D1D1D1D1E1D1E595959
          59261D1D1D1D1D1E1D1D4E59595959595959411D1E1E1E1D1D1D1D5959595959
          5959595959591D1D1D1D1D1D1E1D3759595959595959595953381D1D1D595959
          595959595959591E1D1D1D1D1D1D595959595959595959595958595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595901010101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          010101010101010101010101010101010101010101010101595959595959591D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1E1D1E1E1E1D1E1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D5959595959595959595959595959595959595959595959591D1D1D1D
          1D1D1D1E595959595959595959595959595959591D1D1D1D1D1D1D1D2C595959
          5959595959594A1D1D1D1D1D1D1D595959595959595959591D1D1D1D1D1E1E1E
          1E1D1D1E1D2D5959341D1D1D1D1D1D1E1D59595959541D1D1D1D1D1D1D1D1E33
          4A59595946251E1D1D1D1D1D1D1E2359595959595959595959591D1D1D1D1D1D
          1D1D1D1D445959595946321D1D1D1D1D1D59595959591D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D2D59595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595901010101010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010100010101
          010101010101010101010001595959595959581D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1E1D1D1E1E1E1D1D1E1E1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D5959595959595959
          595959595959595959595959595959591D1D1D1D1D1D1D1E5959595959595959
          59595959595959591D1D1D1D1D1D1D1D2C5959595959595959594A1D1D1D1D1D
          1D1D595959595959595959591D1D1D1D1E1D1E1E1D1D1E1D1D1E1D1E1D1D1D1D
          1D1D1D1D435959595959421E1D1D1D1D1D1D1D1D1D1D1E1D1E1D1E1D1D1D1D1D
          1E1D595959595959595959595959461D1E1D1D1D1D1D1D1D1E1D1E1E1E1D1D1E
          1D1D1D1D1E4C595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          2D59595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959590101010101
          0101010101010101010101010101010101010101010101010101010101010101
          0101010101010101011159595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595951381D1D
          1E1D1E1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D5959595959595959595959595959595959595959
          595959591D1D1D1D1D1D1D1E595959595959595959595959595959591D1D1D1D
          1D1D1D1D2C5959595959595959594A1D1D1D1D1D1D1D59595959595959595959
          1E1D1D1D1D1D1D3B1D1D1E1E1D1E1D1D1D1D1D1D1D1D1D1E595959595959591D
          1D1D1D1D1D1D1E1D1D1D1D1D1D1D1E1D1D1D1D1D1D1D59595959595959595959
          595959281D1D1D1D1D1D1D1D1D1D1E1E1D1D1D1D1D1D1D1D1D3D595959591D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D2D5959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959590101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010115595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959595959595959595959595959595959241D1E1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          5959595959595959595959595959595959595959595959591D1D1D1D1D1D1D1E
          595959595959595959595959595959591D1D1D1D1D1D1E1D2C59595959595959
          5959491D1D1D1D1D1D1D5959595959595959594A1E1D1D1D1D1D2959591E1D1D
          1E1E1D1D1D1D1D1D1E1E1E1F59595959595959591D1D1E1D1E1D1D1D1D1D1D1D
          1D1D1D1D1E1D1D1E37595959595959595959595959595959211D1E1D1D1D1E1D
          1D1D1D1D1D1D1E1D1D1D1D1D1D1D595959591E1D1D1D1E1E1D1D1D1D1D1D1D1D
          1E1D1D1D1D1D1D1E2D5959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959590101010101010101010101010101010101010101010101010101010101
          0101010101010101010100015959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          59595959595959595959591E1E1E1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D595959595959595959595959
          5959595959595959595959591D1D1D1D1D1D1D1E595959595959595959595959
          595959591D1D1D1D1D1D1E1D2C595959595959595959491D1D1D1D1D1D1D5959
          59595959595959201E1D1D1D1D1E4E5959591D1D1D1D1D1D1D1D1D1D1D1D3759
          585959595959595959331D1D1D1D1D1D1D1D1D1D1D1D1D1D1E1E1D4E59595959
          59595959595959595959595959411D1F1E1E1E1D1D1D1D1D1D1D1D1D1D1D1D1E
          2359595959591D1E1D1D1D1D1D1D1D1D1D1D1D1E1D1D1D1D1D1D1D1E2C595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959010101010101010101
          0101010101010101010101010101010101010101010101010101010101010159
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          1E1E1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D595959595959595959595959595959595959595959595959
          1D1D1D1D1D1D1D1E595959595959595959595959595959591D1D1D1D1D1D1D1E
          30595959595959595959481D1D1D1D1D1D1D5959595959595959591E1D1D1D1D
          1D1E5959595959381D1E1D1D1D1D1D1D1E23595959595959595959595959451D
          1E1E1D1D1D1D1D1D1D1D1D1D1D20515959595959595959595959595959595959
          595959201E1D1E1D1D1D1D1D1D1D1D1D1E1D33565959595959591D1D1D1D1D1E
          1D1D1D1D1D1D1D1D1E1D1D1D1D1D1D1D2D575959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959010101010101010101010101010101010101010101
          0101010101010101010101010101010201015959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959431D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D59595959
          59595959595959595959595959595959595959591D1D1D1D1D1D1D1E59595959
          5959595959595959595959591D1D1D1D1D1D1D1E405959595959595959595959
          595959595959595959595959595959595959595959595959595959595959341D
          1D1D244A5959595959595959595959595959595959533D271D1D1D1E1D2D4459
          595959595959595959595959595959595959595959595959595946381D1E1E1E
          1E2D40595959595959595959595959595959591D1D1D1D1D1D1D595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595901
          0101010101010101010101010101010101010101010101010101010101010101
          0101010101015959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D59595959595959595959595959595959
          59595959595959591D1D1D1D1D1D1D1E59595959595959595959595959595959
          1D1D1D1D1D1D1D1D4A5959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959575959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959591D1D1D1D1D1D1D595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595901010101010101010101010101
          0101010101010101010101010101010101010101010101010259595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959251D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D5959595959595959595959595959595959595959595959591D1D1D1D
          1D1D1D1E595959595959595959595959595959591D1D1D1D1D1D1D1D59595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959591D1D1D1D1D
          1D1D595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595901010101010101010101010101010101010101010101010101
          0101010101010101010101010959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D5959595959595959
          595959595959595959595959595959591D1D1D1D1D1D1D1E5959595959595959
          59595959595959281D1D1D1D1D1D1D1D59595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959591D1D1D1D1D1D1D59595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959590101010101
          0101010101010101010101010101010101010101010101010101010101010101
          1859595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959591D1E1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D5959595959595959595959595959595959595959
          595959591D1D1D1D1D1D1D1E5959595959595959595959595959591E1D1D1D1D
          1D1D1D1D59595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959591D1D1D1D1D1D1D59595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959590101010101010101010101010101010101
          0101010101010101010101010101010101010101595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          59595959595959595959595959595959595959595959595959592D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          5959595959595959595959595959595959595959595959591D1D1D1D1D1D1D1E
          5959595959595959595959595959331E1D1D1D1D1D1D1E375859595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          59595959595959595959595959595959595959595959591D1D1D1D1D1D1D5959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959590101010101010101010101010101010101010101010101010101010101
          0101010101010101595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959441D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D595959595959595959595959
          5959595959595959595959591D1D1D1D1D1D1D1E595959595959595959595959
          59511D1D1D1D1D1D1D1D1D595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          59595959595959595959591D1D1D1D1D1D1D5959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959010101010101010101
          0101010101010101010101010101010101010101010101010101010159595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959591D1E1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D595959595959595959595959595959595959595959595959
          1D1D1D1D1D1D1D1D5959595959595959595947241D1D1E1D1D1D1D1D1E1E4659
          595959595959595959592B1D1D1D1D1D1D1D4959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959595959595959595959595959595959595959595959595959591E
          1D1D1E1D1D1D5959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959010101010101010101010101010101010101010101
          0101010101010101010101010101010159595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          59595959595959595959595959595959595959595959591D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D59595959
          59595959595959595959595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1E1D1E1D1D1D1D1D1D1D1E1E1E5959595959595959595959592D1D
          1D1D1D1D1D1D4A59595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959595959595959595959595959593B1D1D1D1D1D1D595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595901
          0101010101010101010101010101010101010101010101010101010101010101
          0101010159595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          59595959595959595959591E1E1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D59595959595959595959595959595959
          59595959595959591D1D1D1D1D1D1E1D1D1D1D1D1D1D1D1D1E1D1D1E1E1D1D1D
          1D1D1D1E1D595959595959595959595959592C1D1D1D1D1D1D1D495959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          59595959595959595946241D1D1D595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595901010101010101010101010101
          0101010101010101010101010101010101010101010101015959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959595959595959595959595959595959595959595959595959591D
          1E1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D5959595959595959595959595959595959595959595959591D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1E1E1D1D5959595959595959
          5959595959592D1D1D1D1D1D1D1D4A5959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          594C595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595901010101010101010101010101010101010101010101010101
          0101010101010101010101015959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959595959595959595959595959591E1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D5959595959595959
          595959595959595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D5959595959595959595959595959592D1D1D1D1D1D
          1D1D4A5959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959590101010101
          0101010101010101010101010101010101010101010101010101010101010101
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959591D1E1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D5959595959595959595959595959595959595959
          595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D595959
          59595959595959595959595959592D1D1D1D1D1D1D1D4A595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959590101010101010101010101010101010101
          0101010101010101010101010101010101010101595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959591D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          5959595959595959595959595959595959595959595959591D1E1E1D1D1D1D1D
          1D1D1D1D1D1D1D1E1D1E1D1D1E1E315959595959595959595959595959595959
          59592D1D1D1D1D1D1D1D4A595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959590101010101010101010101010101010101010101010101010101010101
          0101010101010101595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959595959595959595959595959595959592D1D1D1D1D1D1D1D4A59
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959010101010101010101
          0101010101010101010101010101010101010101010101010101010159595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959595959592D1D1D1D1D1D1D1D4A59595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959010101010101010101010101010101010101010101
          0101010101010101010101010101010159595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          59595959595959595959595959595959595959595959591D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D59595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959592C1D
          1D1D1D1D1D1E4A59595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595901
          0101010101010101010101010101010101010101010101010101010101010101
          0101010159595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          59595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D59595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595901010101010101010101010101
          0101010101010101010101010101010101010101010101015959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959595959595959595959595959595959595959595959595959591D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D59595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595901010101010101010101010101010101010101010101010101
          0101010101010101010101015959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959595959595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D5959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959590101010101
          0101010101010101010101010101010101010101010101010101010101010101
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D5959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959590101010101010101010101010101010101
          0101010101010101010101010101010101010101595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959591D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959590101010101010101010101010101010101010101010101010101010101
          0101010101010101595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959010101010101010101
          0101010101010101010101010101010101010101010101010101010159595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959010101010101010101010101010101010101010101
          0101010101010101010101010101010159595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          59595959595959595959595959595959595959595959591D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D59595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595901
          0101010101010101010101010101010101010101010101010101010101010101
          0101010159595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          59595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D59595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595901010101010101010101010101
          0101010101010101010101010101010101010101010101015959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959595959595959595959595959595959595959595959595959591D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D59595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595901010101010101010101010101010101010101010101010101
          0101010101010101010101015959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959595959595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D5959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959590101010101
          0101010101010101010101010101010101010101010101010101010101010101
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D5959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959590101010101010101010101010101010101
          0101010101010101010101010101010101010101595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959591D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959590101010101010101010101010101010101010101010101010101010101
          0101010101010101595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595913
          080201080A175959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959591B120808010102080F5959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959595910080101060D175959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959010101010101010101
          0101010101010101010101010101010101010101010101010101010159595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D595959595959595959595959595959595959595959595959
          1716161616161616161616161616161616161616161616161616161616161616
          161616595959595959595959595959590D01010101010101010101011A595959
          5959595959161616161616161616595959595959595959595959595959595959
          0F010101010101010808111C5959595959595959595959595959595959595959
          5959591404010101010101010101010101011459595959595959595959595959
          5959591616171616161616161659595959595959595959595959595959591616
          1616161616161616595959595959595959595959595959595913010101010101
          0101010101155959595959595959161616161616161616595959595959595959
          5916161616161616161716595959595959595959595959595917161616161616
          1616165959595959595959595959595959161616161616161616595959595959
          5959595959595959595959010101010101010101010101010101010101010101
          0101010101010101010101010101010159595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          59595959595959595959595959595959595959595959591D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D59595959
          5959595959595959595959595959595959595959010101010101010101010101
          0101010101010101010101010101010101010101010101595959595959595959
          59590D010101010101010101010101010101031B595959595901010101010101
          0101595959595959595959595959595959190001010101010101010101010101
          0101010101010C595959595959595959595959591C0101000101010101010101
          010101010101000101051A595959595959595959595959020001010101010101
          0159595959595959595959595959595959590101010101010101010159595959
          5959595959595959595959050101010101010101010101010101010159595959
          5917010101010101010101595959595959595959590101010101010101010159
          5959595959595959595959595901010101010101010101595959595959595959
          5959595959010101010101010101595959595959595959595959595959595901
          0101010101010101010101010101010101010101010101010101010101010101
          0101010159595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          59595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D59595959595959595959595959595959
          5959595959595959010001010101010101010101010101010101010101010101
          0101010101010101010100595959595959595959590101010101010101010101
          01010101010101011A5959591601010101010101010C59595959595959595959
          5959595913010101010001010101010101010101000101010101065959595959
          5959595959595918010101010101010101010101010101010101010101010103
          1859595959595959595959010101010101010101015959595959595959595959
          5959595959590101010101010101010159595959595959595959595959590601
          0100010101010101010101010101010100115959590801010101010101010159
          5959595959595959590101010101010101010159595959595959595959595959
          5901010101010101010101595959595959595959595959595901010101010101
          0101595959595959595959595959595959595901010101010101010101010101
          0101010101010101010101010101010101010101010101015959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959595959595959595959595959595959595959595959595959591D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D59595959595959595959595959595959595959595959595901010101
          0101010101010101010101010101010101010101010101010101010101010159
          5959595959595959000101010101010101010101010101010101010101065959
          02010101010101010159595959595959595959595959591A0101010101010101
          0101010101010101010101010101165959595959595959595959010101010101
          0101010101010101010101010101010101010101011159595959595959595901
          0101010101010101015959595959595959595959595959595959010101010101
          0101010159595959595959595959595959010101010101010101010101010101
          0101010101010159590101010101010100011159595959595959595959010101
          0101010101010159595959595959595959595959590101010101010101010159
          5959595959595959595959595901010101010101010159595959595959595959
          5959595959595901010101010101010101010101010101010101010101010101
          0101010101010101010101015959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959595959595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D5959595959595959
          5959595959595959595959595959595901010101010101010101010101010101
          0101010101010101010101010101010101010159595959595959590101010101
          0101010101010101010101010101010101010159010101010101010101595959
          5959595959595959595959010101010101010101010101010101010101010101
          0101595959595959595959591A01010101010101010101010101010101010101
          0101010101010101015959595959595959595901010101010101010101595959
          5959595959595959595959595959010101010101010101015959595959595959
          5959595901010101010101010101010101010101010101010101010159010101
          0101010101015959595959595959595959010101010101010101015959595959
          5959595959595959590101010101010101010159595959595959595959595959
          5901010101010101010159595959595959595959595959595959590101010101
          0101010101010101010101010101010101010101010101010101010101010101
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D5959595959595959595959595959595959595959
          5959595901010101010101010101010101010101010101010101010101010101
          0101010101010159595959595959140100010101010101010101010101010101
          0101010101000106010101010101010101595959595959595959595959595901
          0101010101010101010101010101010101010101010159595959595959595959
          0101010101010101010101010101010101010101010101010101010101595959
          5959595959595901010101010101010101595959595959595959595959595959
          5959010101010101010101015959595959595959595959590101010101010101
          0101010101010101010101010101010001010101010101010000595959595959
          5959595959010101010101010101015959595959595959595959595959010101
          0101010101010159595959595959595959595959590101010101010101015959
          5959595959595959595959595959590101010101010101010101010101010101
          0101010101010101010101010101010101010101595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959591D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          5959595959595959595959595959595959595959595959590101010101010101
          0101010101010101010101010101010101010101010101010101015959595959
          5959010101010101010101010101010100010101010101010101010101010101
          0101010101595959595959595959595959590D00010101010101010101010101
          0101010101000101010159595959595959595908010101010101010101010101
          0101010101010100010101010101010100595959595959595959590101010101
          0101010101595959595959595959595959595959595901010101010101010101
          5959595959595959595959010101010101010101010101010101010101010101
          010101010101010101010101010B595959595959595959595901010101010101
          0101015959595959595959595959595959010101010101010101015959595959
          5959595959595959590101010101010101015959595959595959595959595959
          5959590101010101010101010101010101010101010101010101010101010101
          0101010101010101595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D595959595959595959595959
          5959595959595959595959590101010101010101010101010101010101010101
          0101010101010101010101010101015959595959595901010101010101010101
          0101010808010101010101010101010101010101010101010959595959595959
          5959595959590100010101010101000101010101000102010100010101015959
          5959595959595901010101010101010101010101010008080601010100010101
          0101010101595959595959595959590101010101010101010159595959595959
          5959595959595959595901010101010101010101595959595959595959591200
          0101010101010100010001010808010101010101010101010101010101010101
          0118595959595959595959595901010101010101010101595959595959595959
          5959595959010101010101010101015959595959595959595959595959010101
          0101010101015959595959595959595959595959595959010101010101010101
          0101010101010101010101010101010101010101010101010101010159595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D595959595959595959595959595959595959595959595959
          0101010101010101010107080808080808080808080808080808080808080808
          0808085959595959590501010101010101010101595959595959595908010101
          0101010101010101010101015959595959595959595959595959010001010101
          01010100010A1A59591C160E0801000101035959595959595959150101010101
          0101010101011659595959595959595959590A01010101010159595959595959
          5959590101010101010101010159595959595959595959595959595959590101
          0101010101010101595959595959595959590101010101010101010101595959
          59595959590F0101010101010101010101010101015959595959595959595959
          5901010101010101010101595959595959595959595959595901010101010101
          0101015959595959595959595959595959010101010101010101595959595959
          5959595959595959595959010101010101010101010101010101010101010101
          0101010101010101010101010101010159595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          59595959595959595959595959595959595959595959591D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D59595959
          5959595959595959595959595959595959595959010101010101010101011659
          5959595959595959595959595959595959595959595959595959595959010101
          010101010101001C5959595959595959591B0101010101010101010101010101
          5959595959595959595959595959010101010101010101011359595959595959
          59595959591C5959595959595959010101010101010101010118595959595959
          59595959595959591C0101010159595959595959595959010101010101010101
          0159595959595959595959595959595959590101010101010101010159595959
          5959595959590101010101010101010159595959595959595959150101010101
          0101010101010101005959595959595959595959590101010101010101010159
          5959595959595959595959595901010101010101010101595959595959595959
          5959595959010101010101010101595959595959595959595959595959595901
          0101010101010101010101010101010101010101010101010101010101010101
          0101010159595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          59595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D59595959595959595959595959595959
          5959595959595959010101010101010101011659595959595959595959595959
          595959595959595959595959595959591B010101010101010101115959595959
          5959595959595902010101010101010101010103595959595959595959595959
          5959010101010101010101045959595959595959595959595959595959595959
          5919010101010101010101011159595959595959595959595959595959595959
          1759595959595959595959010101010101010101015959595959595959595959
          5959595959590101010101010101010159595959595959595959010101010101
          0101010259595959595959595959595901010101010101010101010101595959
          5959595959595959590101010101010101010159595959595959595959595959
          5901010101010101010101595959595959595959595959595901010101010101
          0101595959595959595959595959595959595901010101010101010101010101
          0101010101010101010101010101010101010101010101015959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959595959595959595959595959595959595959595959595959591D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D59595959595959595959595959595959595959595959595901010101
          0101010101011659595959595959595959595959595959595959595959595959
          595959590F010101010101010101595959595959595959595959595901010101
          010101010101011659595959595959595959595959590101010101010101010F
          5959595959595959595959595959595959595959590300010101010101010108
          5959595959595959595959595959595959595959595959595959595959595901
          0101010101010101015959595959595959595959595959595959010101010101
          0101010159595959595959595959010101010101010101175959595959595959
          5959595959020101010101010101010107595959595959595959595959010101
          0101010101010159595959595959595959595959590101010101010101010159
          5959595959595959595959595901010101010101010159595959595959595959
          5959595959595901010101010101010101010101010101010101010101010101
          0101010101010101010101015959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959595959595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D5959595959595959
          5959595959595959595959595959595901010101010101010101165959595959
          5959595959595959595959595959595959595959595959590801010101010101
          010159595959595959595959595959591B010101010101010101011659595959
          595959595959595959590101010101010101010F595959595959595959595959
          5959595959595959590101010101010101010159595959595959595959595959
          5959595959595959595959595959595959595901010101010101010101595959
          5959595959595959595959595959010101010101010101015959595959595959
          5916010101010101010101595959595959595959595959595959010101010101
          0101010108595959595959595959595959010101010101010101015959595959
          5959595959595959590101010101010101010159595959595959595959595959
          5901010101010101010159595959595959595959595959595959590101010101
          0101010101010101010101010101010101010101010101010101010101010101
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D5959595959595959595959595959595959595959
          5959595901010101010101010101165959595959595959595959595959595959
          5959595959595959595959590801010101010101010159595959595959595959
          5959595959010101010101010101011659595959595959595959595959590101
          010101010101010F595959595959595959595959595959595959595959000101
          0101010101010059595959595959595959595959595959595959595959595959
          5959595959595901010101010101010101595959595959595959595959595959
          5959010101010101010101015959595959595959591601010101010101010159
          5959595959595959595959595959080101010101010101010859595959595959
          5959595959010101010101010101015959595959595959595959595959010101
          0101010101010159595959595959595959595959590101010101010101015959
          5959595959595959595959595959590101010101010101010101010101010101
          0101010101010101010101010101010101010101595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959591D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          5959595959595959595959595959595959595959595959590101010101010101
          0101165959595959595959595959595959595959595959595959595959595959
          0801010101010101010159595959595959595959595959595914010101010101
          0101011659595959595959595959595959590101010101010101010F59595959
          5959595959595959595959595959595959010101010101010101015959595959
          5959595959595959595959595959595959595959595959595959590101010101
          0101010101595959595959595959595959595959595901010101010101010101
          5959595959595959590F01010101010101010159595959595959595959595959
          5959590101010101010101010859595959595959595959595901010101010101
          0101015959595959595959595959595959010101010101010101015959595959
          5959595959595959590101010101010101015959595959595959595959595959
          5959590101010101010101010101010101010101010101010101010101010101
          0101010101010101595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D595959595959595959595959
          5959595959595959595959590101010101010101010116595959595959595959
          5959595959595959595959595959595959595959080101010101010101015959
          5959595959595959595959595917010101010101010101165959595959595959
          5959595959590101010101010101010F59595959595959595959595959595959
          5959595959010101010101010101015959595959595959595959595959595959
          5959595959595959595959595959590101010101010101010159595959595959
          5959595959595959595901010101010101010101595959595959595959160101
          0101010101010159595959595959595959595959595959010101010101010101
          0859595959595959595959595901010101010101010101595959595959595959
          5959595959010101010101010101015959595959595959595959595959010101
          0101010101015959595959595959595959595959595959010101010101010101
          0101010101010101010101010101010101010101010101010101010159595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D595959595959595959595959595959595959595959595959
          0101010101010101010116595959595959595959595959595959595959595959
          59595959595959590D0101010101010101015959595959595959595959595959
          5916010101010101010101165959595959595959595959595959010101010101
          0101010F59595959595959595959595959595959595959595901010101010101
          0101015959595959595959595959595959595959595959595959595959595959
          5959590101010101010101010159595959595959595959595959595959590101
          01010101010101015959595959595959591A0101010101010101015959595959
          5959595959595959595959010101010101010101085959595959595959595959
          5901010101010101010101595959595959595959595959595901010101010101
          0101015959595959595959595959595959010101010101010101595959595959
          5959595959595959595959010101010101010101010101010101010101010101
          0101010101010101010101010101010159595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          59595959595959595959595959595959595959595959591D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D59595959
          5959595959595959595959595959595959595959010101010101010101011659
          5959595959595959595959595959595959595959595959595959595911010101
          0101010101015959595959595959595959595959591601010101010101010116
          59595959595959595959595959590101010101010101010F5959595959595959
          5959595959595959595959595901010101010101010107595959595959595959
          5959595959595959595959595959595959595959595959010101010101010101
          0159595959595959595959595959595959590101010101010101010159595959
          5959595959590101010101010101011659595959595959595959595959595901
          0101010101010101085959595959595959595959590101010101010101010159
          5959595959595959595959595901010101010101010101595959595959595959
          5959595959010101010101010101595959595959595959595959595959595901
          0101010101010101010101010101010101010101010101010101010101010101
          0101010159595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          59595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D59595959595959595959595959595959
          5959595959595959010101010101010101011659595959595959595959595959
          5959595959595959595959595959595959010101010101010101135959595959
          5959595959595959591601010101010101010116595959595959595959595959
          59590101010101010101010F5959595959595959595959595959595959595959
          5901010101010101010108595959595959595959595959595959595959595959
          5959595959595959595959010101010101010101015959595959595959595959
          5959595959590101010101010101010159595959595959595959010101010101
          0101010559595959595959595959595959595901010101010101010108595959
          5959595959595959590101010101010101010159595959595959595959595959
          5901010101010101010101595959595959595959595959595901010101010101
          0101595959595959595959595959595959595901010101010101010101010101
          0101010101010101010101010101010101010101010101015959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959595959595959595959595959595959595959595959595959591D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D59595959595959595959595959595959595959595959595901010101
          0101010101011659595959595959595959595959595959595959595959595959
          5959595959010101010101010101015959595959595959595959595959160101
          010101010101011659595959595959595959595959590101010101010101010F
          5959595959595959595959595959595959595959590101010101010101010859
          5959595959595959595959595959595959595959595959595959595959595901
          0101010101010101015959595959595959595959595959595959010101010101
          0101010159595959595959595959010101010101010101015959595959595959
          5959595959595901010101010101010108595959595959595959595959010101
          0101010101010159595959595959595959595959590101010101010101010159
          5959595959595959595959595901010101010101010159595959595959595959
          5959595959595901010101010101010101010101010101010101010101010101
          0101010101010101010101015959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959595959595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D5959595959595959
          5959595959595959595959595959595901010101010101010101165959595959
          5959595959595959595959595959595959595959595959595906010101010101
          0101010659595959595959595959595959160101010101010101011659595959
          595959595959595959590101010101010101010F595959595959595959595959
          5959595959595959590101010101010101010859595959595959595959595959
          5959595959595959595959595959595959595901010101010101010101595959
          5959595959595959595959595959010101010101010101015959595959595959
          5959010101010101010101011459595959595959595959595959590101010101
          0101010108595959595959595959595959010101010101010101015959595959
          5959595959595959590101010101010101010159595959595959595959595959
          5901010101010101010159595959595959595959595959595959590101010101
          0101010101010101010101010101010101010101010101010101010101010101
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D5959595959595959595959595959595959595959
          5959595901010101010101010101165959595959595959595959595959595959
          5959595959595959595959595959010101010101010101010559595959595959
          5959595959160101010101010101011659595959595959595959595959590101
          010101010101010F595959595959595959595959595959595959595959010101
          0101010101010859595959595959595959595959595959595959595959595959
          5959595959595901010101010101010101595959595959595959595959595959
          5959010101010101010101015959595959595959595917010101010101010101
          0101595959595959595959595959590101010101010101010859595959595959
          5959595959010101010101010101015959595959595959595959595959010101
          0101010101010159595959595959595959595959590101010101010101015959
          5959595959595959595959595959590101010101010101010101010101010101
          0101010101010101010101010101010101010101595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959591D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          5959595959595959595959595959595959595959595959590101010101010101
          0101165959595959595959595959595959595959595959595959595959595959
          59590101000001010101010101010B5959595959595959595916000101010101
          0101011659595959595959595959595959590101010101010101010F59595959
          5959595959595959595959595959595959010101010101010101085959595959
          5959595959595959595959595959595959595959595959595959590101010101
          0101010101595959595959595959595959595959595901010101010101010101
          5959595959595959595959010101010101010101010101061C59595959595959
          5959590100010101010101010859595959595959595959595901010101010101
          0101015959595959595959595959595959010101010101010101015959595959
          5959595959595959590101010101010101015959595959595959595959595959
          5959590101010101010101010101010101010101010101010101010101010101
          0101010101010101595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D595959595959595959595959
          5959595959595959595959590101010101010101010116595959595959595959
          5959595959595959595959595959595959595959595918010101010101010101
          0101000100010101010101010101010101010101010101165959595959595959
          5959595959590101010101010101010F59595959595959595959595959595959
          5959595959010101010101010101085959595959595959595959595959595959
          5959595959595959595959595959590101010101010101010159595959595959
          5959595959595959595901010101010101010101595959595959595959595959
          0101010101010101010101010101010101010101010101010001010101010101
          0859595959595959595959595901010101010101010101595959595959595959
          5959595959010101010101010101015959595959595959595959595959010101
          0101010101015959595959595959595959595959595959010101010101010101
          0101010101010101010101010101010101010101010101010101010159595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D595959595959595959595959595959595959595959595959
          0101010101010101010116595959595959595959595959595959595959595959
          5959595959595959595959010101010101010101010101010101010101010101
          0101010101010101010101165959595959595959595959595959010101010101
          0101010F59595959595959595959595959595959595959595901010101010101
          0101085959595959595959595959595959595959595959595959595959595959
          5959590101010101010101010159595959595959595959595959595959590101
          0101010101010101595959595959595959595959010001010101010101010100
          0101010101010101010101010101010101010101085959595959595959595959
          5901010101010101010101595959595959595959595959595901010101010101
          0101015959595959595959595959595959010101010101010101595959595959
          5959595959595959595959010101010101010101010101010101010101010101
          0101010101010101010101010101010159595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          59595959595959595959595959595959595959595959591D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D59595959
          5959595959595959595959595959595959595959010101010101010101011659
          5959595959595959595959595959595959595959595959595959595959595959
          0201010001010101010101010101010101010101010101010101010101010116
          59595959595959595959595959590101010101010101010F5959595959595959
          5959595959595959595959595901010101010101010108595959595959595959
          5959595959595959595959595959595959595959595959010101010101010101
          0159595959595959595959595959595959590101010101010101010159595959
          5959595959595959590101010101000101010101010101010101010101010101
          0101010101010101085959595959595959595959590101010101010101010159
          5959595959595959595959595901010101010101010101595959595959595959
          5959595959010101010101010101595959595959595959595959595959595901
          0101010101010101010101010101010101010101010101010101010101010101
          0101010159595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          59595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D59595959595959595959595959595959
          5959595959595959010101010101010101011659595959595959595959595959
          5959595959595959595959595959595959595959590F01010101010101010101
          0101010101010101010101010101010101010116595959595959595959595959
          59590101010101010101010F5959595959595959595959595959595959595959
          5901010101010101010108595959595959595959595959595959595959595959
          5959595959595959595959010101010101010101015959595959595959595959
          5959595959590101010101010101010159595959595959595959595959591801
          0101010101010101010101010101010101010101010101010101010108595959
          5959595959595959590101010101010101010159595959595959595959595959
          5901010101010101010101595959595959595959595959595901010101010101
          0101595959595959595959595959595959595901010101010101010101010101
          0101010101010101010101010101010101010101010101015959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959595959595959595959595959595959595959595959595959591D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D59595959595959595959595959595959595959595959595901010101
          0101010101011659595959595959595959595959595959595959595959595959
          5959595959595959595959000101010101010101010101010101010101010101
          010101010101011659595959595959595959595959590101010101010101010F
          5959595959595959595959595959595959595959590101010101010101010859
          5959595959595959595959595959595959595959595959595959595959595901
          0101010101010101015959595959595959595959595959595959010101010101
          010101015959595959595959595959595959591C030101010101010101010101
          0101010101010101010101010101010108595959595959595959595959010101
          0101010101010159595959595959595959595959590101010101010101010159
          5959595959595959595959595901010101010101010159595959595959595959
          5959595959595901010101010101010101010101010101010101010101010101
          0101010101010101010101015959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959595959595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D5959595959595959
          5959595959595959595959595959595901010101010101010101165959595959
          5959595959595959595959595959595959595959595959595959595959595959
          591C080100010101010101010101010101010101010101010101011659595959
          595959595959595959590101010101010101010F595959595959595959595959
          5959595959595959590101010101010101010959595959595959595959595959
          5959595959595959595959595959595959595901010101010101010101595959
          5959595959595959595959595959010101010101010101015959595959595959
          59595959595959595959590A0101010101010101010101010101000101010101
          0101010108595959595959595959595959010101010101010101015959595959
          5959595959595959590101010101010101010159595959595959595959595959
          5901010101010101010159595959595959595959595959595959590101010101
          0101010101010101010101010101010101010101010101010101010101010101
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D5959595959595959595959595959595959595959
          5959595901010101010101010101165959595959595959595959595959595959
          59595959595959595959595959595959595959595959595959591A1616161616
          1616161616110101010101010101011659595959595959595959595959590101
          010101010101010F595959595959595959595959595959595959595959010101
          0101010101000159595959595959595959595959595959595959595959595959
          5959595959595901010101010101010101595959595959595959595959595959
          5959010101010101010101015959595959595959595959595959595959595959
          5959595917161616161616161616160101010101010101010859595959595959
          5959595959010101010101010101015959595959595959595959595959010101
          0101010101010159595959595959595959595959590101010101010101015959
          5959595959595959595959595959590101010101010101010101010101010101
          0101010101010101010101010101010101010101595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959591D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          5959595959595959595959595959595959595959595959590101010101010101
          0101165959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595916010101010101
          0101011659595959595959595959595959590101010101010101010F59595959
          5959595959595959595959595959595959010101010101010100015959595959
          5959595959595959595959595959595959595959595959595959590101010101
          0101010101595959595959595959595959595959595900010101010101010101
          5959595959595959595959595959595959595959595959595959595959595959
          5959590101010101010101010859595959595959595959595901010101010101
          0101015959595959595959595959595959010101010101010101015959595959
          5959595959595959590101010101010101015959595959595959595959595959
          5959590101010101010101010101010101010101010101010101010101010101
          0101010101010101595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D595959595959595959595959
          5959595959595959595959590101010101010101010116595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595915010101010101010101165959595959595959
          5959595959590101010101010101010F59595959595959595959595959595959
          5959595959010101010101010101015959595959595959595959595959595959
          5959595959595959595959595959590101010101010101010159595959595959
          5959595959595959595901010101010101010101595959595959595959595959
          5959595959595959595959595959595959595959595959010001010101010101
          0859595959595959595959595901010101010101010101595959595959595959
          595959595901010101010101010101595959595959595959595959591C010101
          0101010101015959595959595959595959595959595959010101010101010101
          0101010101010101010101010101010101010101010101010101010159595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D595959595959595959595959595959595959595959595959
          0101010101010101010116595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          590F010101010101010101165959595959595959595959595959010101010101
          0101010F59595959595959595959595959595959595959595901010101010101
          0101015959595959595959595959595959595959595959595959595959595959
          5959590101010101010101010159595959595959595959595959595959590101
          0101010101010101595959595959595959595959595959595959595959595959
          5959595959595959595959010101010101010101085959595959595959595959
          5901010101010101010101595959595959595959595959595900010101010101
          0101015959595959595959595959595916010101010101010101595959595959
          5959595959595959595959010101010101010101010101010101010101010101
          0101010101010101010101010101010159595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          59595959595959595959595959595959595959595959591D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D59595959
          5959595959595959595959595959595959595959010101010101010101011659
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959590B01010101010101010116
          59595959595959595959595959590101010101010101010F5959595959595959
          5959595959595959595959595901010101010101010101595959595959595959
          5959595959595959595959595959595959595959595959010101010101010101
          0159595959595959595959595959595959590101010101010101010059595959
          5959595959595959595959595959595959595959595959595959595959591801
          0101010101010101095959595959595959595959590101010101010101010159
          5959595959595959595959595901010101010101010101595959595959595959
          595959590E010101010101010101595959595959595959595959595959595901
          0101010101010101010101010101010101010101010101010101010101010101
          0101010159595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          59595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D59595959595959595959595959595959
          5959595959595959010101010101010101011659595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959590501010101010101010159595959595959595959595959
          59590101010101010101010F5959595959595959595959595959595959595959
          5901010101010101010101165959595959595959595959595959595959595959
          5959595959595959595959010101010101010101015959595959595959595959
          5959595959590101010101010101010159595959595959595959595959595959
          595959595959595959595959595959595959130101010101010101010F595959
          5959595959595959590101010101010101010159595959595959595959595959
          5901010101010101010100595959595959595959595959590201010101010101
          0001595959595959595959595959595959595901010101010101010101010101
          0101010101010101010101010101010101010101010101015959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959595959595959595959595959595959595959595959595959591D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D59595959595959595959595959595959595959595959595901010101
          0101010101011659595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959010101
          010101010101015959595959595959595959595959590101010101010101010F
          5959595959595959595959595959595959595959590F01010101010101010100
          5959595959595959595959595959595959595959595959595959595959595901
          0101010101010101000112595959595959595959595959595905010101010101
          0100010359595959595959595959595959595959595959595959595959595959
          5959595959590101010101010101010117595959595959595959595959010101
          010101010101010C595959595959595959595959130101010101010101010112
          5959595959595959595959590101010101010101010159595959595959595959
          5959595959595901010101010101010101010101010101010101010101010101
          0101010101010101010101015959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959595959595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D5959595959595959
          5959595959595959595959595959595901010101010101010101165959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959010101010101010101015959595959
          595959595959595959590101010101010101010F595959595959595959595959
          5959595959595959595901010101010101010001025959595959595959595959
          595959595959590F08595959595959595959590101010101010101010101011A
          5959595959595959595959591B01010101010101010101105959595959595959
          5959595959595959595959595959595959595959595959595959010101010101
          0101010059595959595959595959595959010101010101010101010108595959
          59595959595959590201010101010101010001010B5959595959595959595959
          0101010101010101010059595959595959595959595959595959590101010101
          0101010101010101010101010101010101010101010101010101010101010101
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D5959595959595959595959595959595959595959
          5959595901010101010101010101165959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595901010101010101010101015959595959595959595959595959590101
          010101010101010F595959595959595959595959595959595959595959590601
          0101010101010101010459595959595959595959595959590401010100595959
          5959595959595901010101010101010101010101011659595959595959595959
          0101010101010101010101595959595959595959595959595959595959595959
          5959595959595959595959595906010101010101000101015959595959595959
          5959595959010101010101010101010101001B59595959595959590301010101
          0101010101010101010059595959595959595902010101010101010100015959
          5959595959595959595959595959590101010101010101010101010101010101
          0101010101010101010101010101010101010101595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959590101010101010101
          0101165959595959595959595959595959595959595959595959595959595959
          5959595959591701010916595959595959595959595906010101010101010101
          01010A59595959595959590F0101010101010101010101010101010101010101
          0101010101010101015959595959595959595901010101010101010101010201
          175959595959180C010101000101010101595959595959595959590101010101
          0101010101010101010101000D595959590F0100010101010101010101010959
          595959595959595959595959595959080101081759595959595959595959590C
          0101010101010101000101015959595959595959595959591101010101010101
          010101010101010113595959590B010101010101010101010101010101010100
          15595959590A0101010101010101010100185959595959595959595959595959
          5959590101010101010101010101010101010101010101010101010101010101
          0101010101010101595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959590101010101010101010116595959595959595959
          59595959595959595959595959595959595959595959595959590E0101010101
          010101080808080101010101010101010101010101015959595959595959590F
          0101010101000101010101010101010101010101010101010101010101595959
          5959595959595901010101010101010101010101010101010100010101010101
          0101010001595959595959595959590101010101010101010101010101010101
          0101010101010101010101010101010101015959595959595959595959595959
          5959590100010101010101010808080801010101010101010101010101010112
          5959595959595959595959590501010101010101010101010101010101010100
          0101010101010101010101010101010101000101010101010101010101010101
          0101010101595959595959595959595959595959595959010101010101010101
          0101010101010101010101010101010101010101010101010101010159595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          0101010101010101010116595959595959595959595959595959595959595959
          5959595959595959595959595959010101010101010101010101010101010101
          010101010101010101015959595959595959590F010101010101010101010101
          0101010101010101010101010101010101595959595959595959595901000101
          0101010101010101010101010101010101010101010101010159595959595959
          5959590101010101010101010101010101010101010101010101010101010101
          0101010001015959595959595959595959595959595959010101010101010101
          0101010101010101010101010101010101010459595959595959595959595959
          0100010101010101010100010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101000101010159595959595959
          5959595959595959595959010101010101010101010101010101010101010101
          0101010101010101010101010101010159595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959010101010101010101011659
          5959595959595959595959595959595959595959595959595959595959595959
          5959000101010101010101010101010101010101010101010101010201185959
          595959595959590F010101010101010101010101010101010101010101010101
          0101010101595959595959595959595903010101000101010101010101010101
          0101010101010101010101010159595959595959595959010101010101010101
          0101010101010101010101010101010101010101010101010116595959595959
          5959595959595959595959010101010101010101010101010101010101010101
          0101010101015959595959595959595959595959010101010101010101010001
          0101010101010101010101010101010101010001010100010101010101010101
          0101010101010101010101011759595959595959595959595959595959595901
          0101010101010101010101010101010101010101010101010101010101010101
          0101010159595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959010101010101010101011659595959595959595959595959
          5959595959595959595959595959595959595959595901010101010101010101
          010101010101010101010101010101011C595959595959595959590F01010101
          0101010101010101010101010101010101010101010101010159595959595959
          5959595959180101010101010101010101010101010101010101010101010101
          0116595959595959595959010101010101010101010101010101010101010101
          0101010101010101010102010359595959595959595959595959595959595901
          0101010101010101010101010101010101010101010101010014595959595959
          595959595959595901010101010101010F010101010101010101010101010101
          01010101010101061B0001000101010101010101010101010101010101010111
          5959595959595959595959595959595959595901010101010101010101010101
          0101010101010101010101010101010101010101010101015959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595949
          4949494949494949494949494949494949494949494949494949494949494949
          4949494A59595959595959595959595959595959595959595959595901010101
          0101010101011659595959595959595959595959595959595959595959595959
          5959595959595959591301000101010101010101010101010101010101010101
          0001015959595959595959595959590F01010101010001010101010101010101
          01010101010101010101010101595959595959595959595959591C0101000101
          0101010101010101010101010101010101010101001959595959595959595901
          0101010101010101010A01010101010101010101010101010101010100010113
          5959595959595959595959595959595959595901010101010101010101010101
          0101010101010101010101005959595959595959595959595959591601010101
          0101010159590A01010001010001010101010101010101010101135959590401
          0101010101010101010101010101000101010759595959595959595959595959
          5959595959595901010101010101010101010101010101010101010101010101
          0101010101010101010101015959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959595959595959595959595959591E1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D5959595959595959
          5959595959595959595959595959595901010101010101010101165959595959
          5959595959595959595959595959595959595959595959595959595959080101
          0101010101010101010101010101010101010101010059595959595959595959
          5959590F01010101010001010101010101010101010101010101010101010101
          0159595959595959595959595959595901010101000101010101010101010101
          0101010001010117595959595959595959595901010101010101010101591B01
          0101010101010101010101010101010101010859595959595959595959595959
          5959595959591601010001010001010101010101010101010101010101000059
          5959595959595959595959595959590A01010101010101015959590801010101
          0101010101010101010100010102595959595906000100010101000101010101
          01010101010B5959595959595959595959595959595959595959590101010101
          0101010101010101010101010101010101010101010101010101010101010101
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959591E1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D5959595959595959595959595959595959595959
          5959595901010101010101010101165959595959595959595959595959595959
          5959595959595959595959595959595959591303010001010101010101010101
          010101010101010C5959595959595959595959595959590F0101010101020101
          0101010101010101000101010101010101010101025959595959595959595959
          5959595959591201010101010101010101010101000100045959595959595959
          5959595959595901010101010101010101595959590C01010101010101010101
          010101000E595959595959595959595959595959595959595959590F06010101
          0101010101010101010101010101010107595959595959595959595959595959
          5959590101010101010100015959595959170100000101010101010101010004
          5959595959595959591601010101010101010101010101025959595959595959
          5959595959595959595959595959590101010101010101010101010101010101
          0101010101010101010101010101010101010101595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959591D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          5959595959595959595959595959595959595959595959590101010101010101
          0101165959595959595959595959595959595959595959595959595959595959
          595959595959595959591A110801010101010101010101010618595959595959
          5959595959595959595959595959595959590101010101010101010F59595959
          59595959595959595959595959595959595959595959595959595959590E0101
          01010101010101010F1A59595959595959595959595959595959590101010101
          01010101015959595959591A0601010101010101010114595959595959595959
          5959595959595959595959595959595959595959100800010101010101010101
          0103145959595959595959595959595959595959595959595959595959595959
          595959595959591C0601010101010101010B5959595959595959595959595959
          0800010101010101010859595959595959595959595959595959595959595959
          5959590101010101010101010101010101010101010101010101010101010101
          0101010101010101595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D595959595959595959595959
          5959595959595959595959590101010101010101010116595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959590101010101010101010F59595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959590101010101010101010159595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959010101010101010101
          0101010101010101010101010101010101010101010101010101010159595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D595959595959595959595959595959595959595959595959
          0101010101010101010116595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959010101010101
          0101010F59595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959590101010101010101010159595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959010101010101010101010101010101010101010101
          0101010101010101010101010101010159595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          59595959595959595959595959595959595959595959591D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D59595959
          5959595959595959595959595959595959595959010101010101010101011659
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          59595959595959595959595959590101010101010101010F5959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959010101010101010101
          0159595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595901
          0101010101010101010101010101010101010101010101010101010101010101
          0101010159595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          59595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D59595959595959595959595959595959
          5959595959595959010101010101010101011659595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          59590101010101010101010F5959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959010101010101010101015959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595901010101010101010101010101
          0101010101010101010101010101010101010101010101015959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959595959595959595959595959595959595959595959595959591D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D59595959595959595959595959595959595959595959595901010101
          0101010101011659595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959595959595959595959595959595959590101010101010101010F
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595901
          0101010101010101015959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595901010101010101010101010101010101010101010101010101
          0101010101010101010101015959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959595959595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D5959595959595959
          5959595959595959595959595959595901010101010101010101165959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959595959590101010101010101010F595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595901010101010101010101595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959590101010101
          0101010101010101010101010101010101010101010101010101010101010101
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D5959595959595959595959595959595959595959
          5959595901010101010101010101165959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959590101
          010101010101010F595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595901010101010101010101595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959590101010101010101010101010101010101
          0101010101010101010101010101010101010101595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959591D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          5959595959595959595959595959595959595959595959590101010101010101
          0101165959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959590101010101010101010F59595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959590101010101
          0101010101595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959590101010101010101010101010101010101010101010101010101010101
          0101010101010101595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D595959595959595959595959
          5959595959595959595959590101010101010101010116595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959590101010101010101010F59595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959590101010101010101010159595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959010101010101010101
          0101010101010101010101010101010101010101010101010101010159595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D595959595959595959595959595959595959595959595959
          0101010101010101010116595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959000101010101
          0101010F59595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959590101010101010101010159595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959010101010101010101010101010101010101010101
          0101010101010101010101010101010159595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          59595959595959595959595959595959595959595959591D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D59595959
          5959595959595959595959595959595959595959010101010101010101011659
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          59595959595959595959595959595959070001010101010F5959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959010101010101010101
          0159595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595901
          0101010101010101010101010101010101010101010101010101010101010101
          0101010159595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          59595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D59595959595959595959595959595959
          5959595959595959010101010101010101011659595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          59595959595959590901010F5959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959010101010101010101015959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595901010101010101010101010101
          0101010101010101010101010101010101010101010101015959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959595959595959595959595959595959595959595959595959591D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D59595959595959595959595959595959595959595959595901010101
          0101010101011659595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959595959595959595959595959595959595959595959595959180F
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595901
          0101010101010101015959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595901010101010101010101010101010101010101010101010101
          0101010101010101010101015959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959595959595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D5959595959595959
          5959595959595959595959595959595901010101010101010101165959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595901010101010101010101595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959590101010101
          0101010101010101010101010101010101010101010101010101010101010101
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D5959595959595959595959595959595959595959
          5959595901010101010101010101165959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595901010101010101010101595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959590101010101010101010101010101010101
          0101010101010101010101010101010101010101595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959591D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          5959595959595959595959595959595959595959595959590101010101010101
          0101175959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959590101010101
          0101010101595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959590101010101010101010101010101010101010101010101010101010101
          0101010101010101595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D595959595959595959595959
          5959595959595959595959590101000101010101010117595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959590101010101010101010159595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959010101010101010101
          0101010101010101010101010101010101010101010101010101010159595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959590101010101010101010159595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959010101010101010101010101010101010101010101
          0101010101010101010101010101010159595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          59595959595959595959595959595959595959595959591D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D59595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959010101010101010101
          0159595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595901
          0101010101010101010101010101010101010101010101010101010101010101
          0101010159595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          59595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D59595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959010101010101010101015959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595901010101010101010101010101
          0101010101010101010101010101010101010101010101015959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959595959595959595959595959595959595959595959595959591D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D59595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595908
          0808080808080808085959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595901010101010101010101010101010101010101010101010101
          0101010101010101010101015959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959595959595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D5959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959590101010101
          0101010101010101010101010101010101010101010101010101010101010101
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D5959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959590101010101010101010101010101010101
          0101010101010101010101010101010101010101595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959591D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959590101010101010101010101010101010101010101010101010101010101
          0101010101010101595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959010101010101010101
          0101010101010101010101010101010101010101010101010101010159595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959010101010101010101010101010101010101010101
          0101010101010101010101010101010159595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          59595959595959595959595959595959595959595959591D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D59595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595901
          0101010101010101010101010101010101010101010101010101010101010101
          0101010159595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          59595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D59595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595901010101010101010101010101
          0101010101010101010101010101010101010101010101015959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959595959595959595959595959595959595959595959595959591D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D59595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595901010101010101010101010101010101010101010101010101
          0101010101010101010101015959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959595959595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D5959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959590101010101
          0101010101010101010101010101010101010101010101010101010101010101
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D5959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959590101010101010101010101010101010101
          0101010101010101010101010101010101010101595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959591D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959590101010101010101010101010101010101010101010101010101010101
          0101010101010101595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959010101010101010101
          0101010101010101010101010101010101010101010101010101010159595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959010101010101010101010101010101010101010101
          0101010101010101010101010101010159595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          59595959595959595959595959595959595959595959591D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D59595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595901
          0101010101010101010101010101010101010101010101010101010101010101
          0101010159595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          59595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D59595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595901010101010101010101010101
          0101010101010101010101010101010101010101010101015959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959595959595959595959595959595959595959595959595959591D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D59595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595901010101010101010101010101010101010101010101010101
          0101010101010101010101015959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959595959595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D5959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959590101010101
          0101010101010101010101010101010101010101010101010101010101010101
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D5959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959590101010101010101010101010101010101
          0101010101010101010101010101010101010101595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959591D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959590101010101010101010101010101010101010101010101010101010101
          0101010101010101595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959010101010101010101
          0101010101010101010101010101010101010101010101010101010159595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959010101010101010101010101010101010101010101
          0101010101010101010101010101010159595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          59595959595959595959595959595959595959595959591D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D59595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595901
          0101010101010101010101010101010101010101010101010101010101010101
          0101010159595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          59595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D59595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595901010101010101010101010101
          0101010101010101010101010101010101010101010101015959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959595959595959595959595959595959595959595959595959591D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D59595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595901010101010101010101010101010101010101010101010101
          0101010101010101010101015959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959595959595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D5959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959590101010101
          0101010101010101010101010101010101010101010101010101010101010101
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D5959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959590101010101010101010101010101010101
          0101010101010101010101010101010101010101595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959591D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959590101010101010101010101010101010101010101010101010101010101
          0101010101010101595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959010101010101010101
          0101010101010101010101010101010101010101010101010101010159595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959010101010101010101010101010101010101010101
          0101010101010101010101010101010159595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          59595959595959595959595959595959595959595959591D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D59595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595901
          0101010101010101010101010101010101010101010101010101010101010101
          0101010159595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          59595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D59595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595901010101010101010101010101
          0101010101010101010101010101010101010101010101015959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959595959595959595959595959595959595959595959595959591E
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D59595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595901010101010101010101010101010101010101010101010101
          0101010101010101010101015959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959595959595959595959595959591E1E1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D5959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959590101010101
          0101010101010101010101010101010101010101010101010101010101010101
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D5959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959590101010101010101010101010101010101
          0101010101010101010101010101010101010101595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959591E1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959590101010101010101010101010101010101010101010101010101010101
          0101010101010101595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959010101010101010101
          0101010101010101010101010101010101010101010101010101010159595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959010101010101010101010101010101010101010101
          0101010101010101010101010101010159595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          59595959595959595959595959595959595959595959591E1E1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D59595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595901
          0101010101010101010101010101010101010101010101010101010101010101
          0101010159595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          59595959595959595959431D1E1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D59595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595901010101010101010101010101
          0101010101010101010101010101010101010101010101015959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959595959595959595959595959595959595959595959595959211D
          1E1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D59595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595901010101010101010101010101010101010101010101010101
          0101010101010101010101015959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959591E1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D5959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959590101010101
          0101010101010101010101010101010101010101010101010101010101010101
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          59595959594E1E1E1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D5959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959590101010101010101010101010101010101
          0101010101010101010101010101010101010101595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          59595959595959595959595959595959595959595959595959231D1D1E1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959590101010101010101010101010101010101010101010101010101010101
          0101010101010101595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959010101010101010101
          0101010101010101010101010101010101010101010101010101010159595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959010101010101010101010101010101010101010101
          0101010101010101010101010101010159595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          59595959595959595959595959595959595959551D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D59595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595901
          0101010101010101010101010101010101010101010101010101010101010101
          0101010159595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959211D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1E59595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595901010101010101010101010101
          0101010101010101010101010101010101010101010101015959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          59595959595959595959595959595959595959595959595950211D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D59595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595901010101010101010101010101010101010101010101010101
          0101010101010101010101015959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595954472B1D1E1D1D1E1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D5959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959590101010101
          0101010101010101010101010101010101010101010101010101010101010101
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1E1E1E1D1E1E1D1E1E1D
          1D1E1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D5959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959590101010101010101010101010101010101
          0101010101010101010101010101010101010101595959595959595959595959
          5959595959595959595959595959595959595959595959595959591D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959590101010101010101010101010101010101010101010101010101010101
          0101010101010101595959595959595959595959595959595959595959595959
          5959595959595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D34595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959010101010101010101
          0101010101010101010101010101010101010101010101010101010159595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D45595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595917010101010101010101010101010101010101010101
          0101010101010101010101010101010159595959595959595959595959595959
          59595959595959595959595959595959595959595959591D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1E1E1E5959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959591100
          0001010101010101010101010101010101010101010101010101010101010101
          0101010159595959595959595959595959595959595959595959595959595959
          59595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1E5959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959590401010101010101010101010101
          0101010101010101010101010101010101010101010101015959595959595959
          595959595959595959595959595959595959595959595959595959595959591D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1E275959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959590101010101010101010101010101010101010101010101010101
          0101010101010101010101015959595959595959595959595959595959595959
          595959595959595959595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D53595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959000101010101
          0101010101010101010101010101010101010101010101010101010101010101
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1E1E59595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959010101010101010101010101010101010101
          0101010101010101010101010101010101010101595959595959595959595959
          5959595959595959595959595959595959595959595959595959591D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D5959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5908010101010101010101010101010101010101010101010101010101010101
          0101010101010101595959595959595959595959595959595959595959595959
          5959595959595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D265959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959160101010101010101010101
          0101010101010101010101010101010101010101010101010101010159595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1E595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959010101010101010101010101010101010101010101010101
          0101010101010101010101010101010159595959595959595959595959595959
          59595959595959595959595959595959595959595959591D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D59595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959590901010101
          0101010101010101010101010101010101010101010101010101010101010101
          0101010159595959595959595959595959595959595959595959595959595959
          59595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1E1E4059595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959010001010101010101010101010101010101
          0101010101010101010101010101010101010101010101015959595959595959
          595959595959595959595959595959595959595959595959595959595959591D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1E1E
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5901010101010101010101010101010101010101010101010101010101010101
          0101010101010101010101085959595959595959595959595959595959595959
          595959595959595959595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1E1E56595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959591400010101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010110
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1E1E59595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959591716
          100F020001000101010101010101010101010101010101010101010101010101
          0101010101010101010101010101010101010159595959595959595959595959
          5959595959595959595959595959595959595959595959595959591D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959590101010001010101010001010101
          0101010101010101010101010101010101010101010101010101010101010101
          0101010101010159595959595959595959595959595959595959595959595959
          5959595959595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D4D595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959590101010101010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010001005959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1E1D
          2059595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          0101010101010101010101010100015959595959595959595959595959595959
          59595959595959595959595959595959595959595959591D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1E595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          01010E5959595959595959595959595959595959595959595959595959595959
          59595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1E51595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959010101010101010101010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010159595959595959595959
          595959595959595959595959595959595959595959595959595959595959591D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595901010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          0101010101010101010C59595959595959595959595959595959595959595959
          595959595959595959595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1E45575959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595901010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010101595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959590101
          0101010101010101010101010101010101010101010101010101010101010101
          0101010101010101010101010101010102595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959591D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1E1D1D1D1D1D1E4E595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959590101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          0101010159595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1E1E1D1D1E205959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959590101010101010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1E59595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          0101010101010101010018595959595959595959595959595959595959595959
          59595959595959595959595959595959595959595959591D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1E1D1D1E1E1D1E595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959010101010101010101010101010101010101
          0101010101010101010101010101010101010101010101010101010101185959
          5959595959595959595959595959595959595959595959595959595959595959
          59595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1E1E1E1D1E1E35595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959010101010101010101010101010101010101010101010101010101010101
          010101010101010101010101010101001C595959595959595959595959595959
          595959595959595959595959595959595959595959595959595959595959591D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1E1D1E1D2D5659595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595901010101010101010101
          0101010101010101010101010101010101010101010101010101010101010101
          01010F5959595959595959595959595959595959595959595959595959595959
          595959595959595959595959595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1E1E1D1D1D1D1E1D1D1E43
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595901010101010101010101010101010101010101010101
          0101010101010101010101010101010101010101011659595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959591D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1E1D1D1D1D1E1E1D1E2741595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959590101
          0101010101010101010101010101010101010101010101010101010101010101
          0101010101010659595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          5959595959595959595959595959595959595959595959595959595959595959
          595959595959595959595959595959595959}
        Stretch = True
      end
    end
    object GrpFootQRBand: TQRBand
      Left = 0
      Top = 556
      Width = 992
      Height = 353
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
        747.183333333333300000
        2099.733333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object memDefPayment: TQRMemo
        Left = 10
        Top = 10
        Width = 551
        Height = 211
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
        Font.Height = -13
        Font.Name = 'Times New Roman'
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
      object QRLabel1: TQRLabel
        Left = 710
        Top = 59
        Width = 67
        Height = 25
        Size.Values = (
          52.916666666666670000
          1502.833333333333000000
          124.883333333333300000
          141.816666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total Net'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel15: TQRLabel
        Left = 710
        Top = 99
        Width = 74
        Height = 25
        Size.Values = (
          52.916666666666670000
          1502.833333333333000000
          209.550000000000000000
          156.633333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total VAT'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel16: TQRLabel
        Left = 710
        Top = 139
        Width = 113
        Height = 25
        Size.Values = (
          52.916666666666670000
          1502.833333333333000000
          294.216666666666700000
          239.183333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Statement Total'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object TotGoodsQRLbl: TQRLabel
        Left = 825
        Top = 59
        Width = 119
        Height = 25
        Size.Values = (
          52.916666666666660000
          1746.250000000000000000
          124.354166666666700000
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
      object TotVatQRLbl: TQRLabel
        Left = 825
        Top = 99
        Width = 119
        Height = 25
        Size.Values = (
          52.916666666666660000
          1746.250000000000000000
          209.020833333333300000
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
        Font.Height = -17
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object InvTotQrLbl: TQRLabel
        Left = 825
        Top = 139
        Width = 119
        Height = 25
        Size.Values = (
          52.916666666666660000
          1746.250000000000000000
          293.687500000000000000
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
        Font.Height = -17
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRMemo2: TQRMemo
        Left = 171
        Top = 290
        Width = 700
        Height = 21
        Size.Values = (
          44.979166666666670000
          362.479166666666700000
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
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        Lines.Strings = (
          
            'Registered Office: Unit 1, Western Drive, Hengrove, Bristol. BS1' +
            '4 0AF')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object gtQRMemo1: TQRMemo
        Left = 171
        Top = 310
        Width = 700
        Height = 21
        Size.Values = (
          44.979166666666670000
          362.479166666666700000
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
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = []
        Lines.Strings = (
          'Registered in England & Wales No 06695717. Vat No: 942 1859 12')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object qrshpPayment: TQRShape
        Left = 20
        Top = 4
        Width = 571
        Height = 228
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
      object memPayment: TQRRichText
        Left = 30
        Top = 10
        Width = 551
        Height = 213
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
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        HiresExport = False
        Transparent = False
        YIncrement = 50
        Lines.Strings = (
          'memPayment')
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
  object GetCompSQL: TQuery
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
    Left = 512
    Top = 55
  end
  object SalesInvSQL: TQuery
    DatabaseName = 'PB'
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
      '        Sales_Invoice.Sales_Invoice,'
      '        Sales_Invoice.Invoice_or_Credit'
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
        DataType = ftUnknown
        Name = 'Int_Sel'
        ParamType = ptUnknown
      end>
  end
  object UpSalesInvSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'update Sales_invoice'
      'set Statement_reference = :Statement_reference,'
      'Statement_Date = :Statement_Date,'
      'Statement_From = :Statement_From,'
      'Statement_To = :Statement_To'
      'where Sales_Invoice = :Sales_Invoice')
    Left = 622
    Top = 62
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Statement_reference'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Statement_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Statement_From'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Statement_To'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Invoice'
        ParamType = ptUnknown
      end>
  end
  object UpCustSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'update Customer_Branch'
      'set Last_Statement_ref = :Last_statement_Ref'
      'where Customer = :Customer and'
      'Branch_no = :Branch_no')
    Left = 518
    Top = 81
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Last_statement_Ref'
        ParamType = ptUnknown
      end
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
  object qryGetPO: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Cust_Order_No'
      'from Purchase_orderLine'
      'where Purchase_Order = :Purchase_Order and'
      'Line = :Line')
    Left = 416
    Top = 141
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
  object qryGetSO: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Cust_Order_No'
      'from Sales_Order'
      'where Sales_order = :sales_order')
    Left = 416
    Top = 205
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'sales_order'
        ParamType = ptUnknown
      end>
  end
  object qryGetJB: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Cust_Order_No'
      'from Job_Bag'
      'where Job_Bag = :Job_Bag')
    Left = 416
    Top = 85
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end>
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
end
