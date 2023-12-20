object frmwtRPQuoteDecline: TfrmwtRPQuoteDecline
  Left = 49
  Top = 110
  Caption = 'Quote Decline Reason Report'
  ClientHeight = 579
  ClientWidth = 1157
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Scaled = False
  TextHeight = 13
  object qrpDetails: TQuickRep
    Left = 16
    Top = 16
    Width = 1123
    Height = 794
    ShowingPreview = False
    BeforePrint = qrpDetailsBeforePrint
    DataSet = qryQuotes
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
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
    Page.Orientation = poLandscape
    Page.PaperSize = A4
    Page.Continuous = False
    Page.Values = (
      100.000000000000000000
      2100.000000000000000000
      100.000000000000000000
      2970.000000000000000000
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
    ReportTitle = 'Quotation Report'
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
    object QRBand1: TQRBand
      Left = 38
      Top = 38
      Width = 1047
      Height = 75
      Frame.DrawBottom = True
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        198.437500000000000000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object qrlblCaption: TQRLabel
        Left = 412
        Top = 8
        Width = 209
        Height = 19
        Size.Values = (
          50.270833333333330000
          1090.083333333333000000
          21.166666666666670000
          552.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Quote Decline Reason Report'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRLabel3: TQRLabel
        Left = 8
        Top = 57
        Width = 30
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          150.812500000000000000
          79.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Quote'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
      object QRLabel4: TQRLabel
        Left = 48
        Top = 57
        Width = 23
        Height = 17
        Size.Values = (
          44.979166666666670000
          127.000000000000000000
          150.812500000000000000
          60.854166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
      object QRLabel5: TQRLabel
        Left = 112
        Top = 57
        Width = 55
        Height = 17
        Size.Values = (
          44.979166666666670000
          296.333333333333300000
          150.812500000000000000
          145.520833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Description'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
      object QRLabel6: TQRLabel
        Left = 376
        Top = 57
        Width = 52
        Height = 17
        Size.Values = (
          44.979166666666670000
          994.833333333333300000
          150.812500000000000000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Reference'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
      object QRLabel7: TQRLabel
        Left = 526
        Top = 57
        Width = 45
        Height = 17
        Size.Values = (
          44.979166666666670000
          1391.708333333333000000
          150.812500000000000000
          119.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Complete'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
      object QRLabel8: TQRLabel
        Left = 589
        Top = 57
        Width = 28
        Height = 17
        Size.Values = (
          44.979166666666670000
          1558.395833333333000000
          150.812500000000000000
          74.083333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Install'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
      object QRLabel9: TQRLabel
        Left = 640
        Top = 57
        Width = 36
        Height = 17
        Size.Values = (
          44.979166666666670000
          1693.333333333333000000
          150.812500000000000000
          95.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Survey'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
      object QRLabel11: TQRLabel
        Left = 864
        Top = 57
        Width = 32
        Height = 17
        Size.Values = (
          44.979166666666670000
          2286.000000000000000000
          150.812500000000000000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Status'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
      object QRLabel1: TQRLabel
        Left = 696
        Top = 57
        Width = 40
        Height = 17
        Size.Values = (
          44.979166666666670000
          1841.500000000000000000
          150.812500000000000000
          105.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Delivery'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
      object QRLabel12: TQRLabel
        Left = 824
        Top = 57
        Width = 24
        Height = 17
        Size.Values = (
          44.979166666666670000
          2180.166666666667000000
          150.812500000000000000
          63.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
      object QRLabel14: TQRLabel
        Left = 768
        Top = 57
        Width = 23
        Height = 17
        Size.Values = (
          44.979166666666670000
          2032.000000000000000000
          150.812500000000000000
          60.854166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'VAT'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
      object qrlblDateRange: TQRLabel
        Left = 476
        Top = 32
        Width = 74
        Height = 17
        Size.Values = (
          44.979166666666670000
          1259.416666666667000000
          84.666666666666670000
          195.791666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'qrlblDateRange'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
      object QRSysData2: TQRSysData
        Left = 980
        Top = 8
        Width = 56
        Height = 17
        Size.Values = (
          44.979166666666670000
          2592.916666666667000000
          21.166666666666670000
          148.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsDateTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
        Transparent = False
        ExportAs = exptText
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRSysData1: TQRSysData
        Left = 968
        Top = 24
        Width = 69
        Height = 17
        Size.Values = (
          44.979166666666670000
          2561.166666666667000000
          63.500000000000000000
          182.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = 'Page: '
        Transparent = False
        ExportAs = exptText
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtQRLabel1: TQRLabel
        Left = 992
        Top = 57
        Width = 47
        Height = 17
        Size.Values = (
          44.979166666666670000
          2624.666666666667000000
          150.812500000000000000
          124.354166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Requotes'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
    object qrgCustomerHead: TQRGroup
      Left = 38
      Top = 113
      Width = 1047
      Height = 26
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        68.791666666666670000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'Inactive_Reason_Descr'
      FooterBand = qrbCustomerFooter
      Master = qrpDetails
      ReprintOnNewPage = False
      object QRLabel2: TQRLabel
        Left = 8
        Top = 8
        Width = 76
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          21.166666666666670000
          201.083333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Decline Reason'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
        Left = 88
        Top = 8
        Width = 116
        Height = 17
        Size.Values = (
          44.979166666666670000
          232.833333333333300000
          21.166666666666670000
          306.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryQuotes
        DataField = 'Inactive_Reason_Descr'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
    end
    object qrsbDetails: TQRSubDetail
      Left = 38
      Top = 139
      Width = 1047
      Height = 26
      AfterPrint = qrsbDetailsAfterPrint
      AlignToBottom = False
      BeforePrint = qrsbDetailsBeforePrint
      TransparentBand = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        68.791666666666670000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpDetails
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText11: TQRDBText
        Left = 667
        Top = 0
        Width = 70
        Height = 15
        Size.Values = (
          39.687500000000000000
          1764.770833333333000000
          0.000000000000000000
          185.208333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryQuotes
        DataField = 'Delivery_Price'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
      object QRDBText2: TQRDBText
        Left = 9
        Top = 1
        Width = 30
        Height = 15
        Size.Values = (
          39.687500000000000000
          23.812500000000000000
          2.645833333333333000
          79.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryQuotes
        DataField = 'Quote'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
      object QRDBText3: TQRDBText
        Left = 48
        Top = 1
        Width = 62
        Height = 15
        Size.Values = (
          39.687500000000000000
          127.000000000000000000
          2.645833333333333000
          164.041666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryQuotes
        DataField = 'Date_Raised'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
      object QRDBText5: TQRDBText
        Left = 376
        Top = 1
        Width = 145
        Height = 15
        Size.Values = (
          39.687500000000000000
          994.833333333333400000
          2.645833333333333000
          383.645833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryQuotes
        DataField = 'Reference'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
      object QRDBText6: TQRDBText
        Left = 112
        Top = 17
        Width = 257
        Height = 15
        Size.Values = (
          39.687500000000000000
          296.333333333333400000
          44.979166666666670000
          679.979166666666800000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryQuotes
        DataField = 'Description'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
      object QRDBText10: TQRDBText
        Left = 610
        Top = 0
        Width = 66
        Height = 15
        Size.Values = (
          39.687500000000000000
          1613.958333333333000000
          0.000000000000000000
          174.625000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryQuotes
        DataField = 'Survey_price'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
      object qrlTotal: TQRLabel
        Left = 807
        Top = 0
        Width = 43
        Height = 15
        Size.Values = (
          39.687500000000000000
          2135.187500000000000000
          0.000000000000000000
          113.770833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlTotal'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
      object QRDBText8: TQRDBText
        Left = 535
        Top = 0
        Width = 81
        Height = 15
        Size.Values = (
          39.687500000000000000
          1415.520833333333000000
          0.000000000000000000
          214.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryQuotes
        DataField = 'Installation_price'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
      object qrlComplete: TQRLabel
        Left = 513
        Top = 0
        Width = 57
        Height = 15
        Size.Values = (
          39.687500000000000000
          1357.312500000000000000
          0.000000000000000000
          150.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlComplete'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
      object qrlVat: TQRLabel
        Left = 761
        Top = 0
        Width = 30
        Height = 15
        Size.Values = (
          39.687500000000000000
          2013.479166666667000000
          0.000000000000000000
          79.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlVat'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
      object QRDBText9: TQRDBText
        Left = 112
        Top = 1
        Width = 257
        Height = 15
        Size.Values = (
          39.687500000000000000
          296.333333333333400000
          2.645833333333333000
          679.979166666666800000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryQuotes
        DataField = 'Customer_Name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
      object qrlblRequote: TQRLabel
        Left = 1004
        Top = 0
        Width = 61
        Height = 15
        Size.Values = (
          39.687500000000000000
          2656.416666666667000000
          0.000000000000000000
          161.395833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblRequote'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
      object qrlblStatus: TQRLabel
        Left = 868
        Top = 0
        Width = 125
        Height = 15
        Size.Values = (
          39.687500000000000000
          2296.583333333333000000
          0.000000000000000000
          330.729166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlblStatus'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
    object qrbCustomerFooter: TQRBand
      Left = 38
      Top = 165
      Width = 1047
      Height = 29
      AfterPrint = qrbCustomerFooterAfterPrint
      AlignToBottom = False
      BeforePrint = qrbCustomerFooterBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        76.729166666666670000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRLabel13: TQRLabel
        Left = 650
        Top = 7
        Width = 28
        Height = 17
        Size.Values = (
          44.979166666666670000
          1719.791666666667000000
          18.520833333333330000
          74.083333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Total'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
      object qrlblCustTotal: TQRLabel
        Left = 770
        Top = 7
        Width = 79
        Height = 17
        Size.Values = (
          44.979166666666670000
          2037.291666666667000000
          18.520833333333330000
          209.020833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblCustTotal'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
      object QRShape1: TQRShape
        Left = 688
        Top = -1
        Width = 161
        Height = 8
        Size.Values = (
          21.166666666666670000
          1820.333333333333000000
          -2.645833333333333000
          425.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel15: TQRLabel
        Left = 890
        Top = 7
        Width = 70
        Height = 17
        Size.Values = (
          44.979166666666670000
          2354.791666666667000000
          18.520833333333330000
          185.208333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Quote Count'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
      object qrlblCount: TQRLabel
        Left = 951
        Top = 7
        Width = 59
        Height = 17
        Size.Values = (
          44.979166666666670000
          2516.187500000000000000
          18.520833333333330000
          156.104166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblCount'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
      object QRDBText7: TQRDBText
        Left = 532
        Top = 7
        Width = 111
        Height = 17
        Size.Values = (
          44.979166666666670000
          1407.583333333333000000
          18.520833333333330000
          293.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryQuotes
        DataField = 'Reason_Description'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
    end
    object QRBand2: TQRBand
      Left = 38
      Top = 194
      Width = 1047
      Height = 26
      AfterPrint = QRBand2AfterPrint
      AlignToBottom = False
      BeforePrint = QRBand2BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        68.791666666666670000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRLabel10: TQRLabel
        Left = 690
        Top = 7
        Width = 68
        Height = 17
        Size.Values = (
          44.979166666666670000
          1825.625000000000000000
          18.520833333333330000
          179.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Report Total'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
      object qrlblReportTotal: TQRLabel
        Left = 759
        Top = 7
        Width = 90
        Height = 17
        Size.Values = (
          44.979166666666670000
          2008.187500000000000000
          18.520833333333330000
          238.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblReportTotal'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
      object QRShape2: TQRShape
        Left = 688
        Top = -1
        Width = 161
        Height = 8
        Size.Values = (
          21.166666666666670000
          1820.333333333333000000
          -2.645833333333333000
          425.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
  end
  object qryQuotes: TFDQuery
    ConnectionName = 'Wt'
    SQL.Strings = (
      'select Quote.*,'
      '  Customer.Customer_Name as Customer_Name_Actual,'
      '  Customer.telephone_number,'
      '  Quote_Status_Description,'
      '  Vat_Rate,'
      '  Inactive_Reason.Inactive_Reason_Descr,'
      '  Customer.Is_Retail_Customer,'
      '  Customer.Is_Commercial_Customer,'
      '  (SELECT Count(ReQuote.Quote)'
      '   FROM Quote ReQuote'
      '   WHERE (ReQuote.Original_Quote = Quote.Original_Quote) and'
      '         (ReQuote.Quote <> ReQuote.Original_Quote) and'
      
        '         ((ReQuote.Original_Quote <> 0) and (ReQuote.Original_Qu' +
        'ote <> NULL))) as Requote_Count'
      'FROM Inactive_Reason'
      '      RIGHT JOIN (Vat'
      '      INNER JOIN (Quote_Status'
      '      INNER JOIN (Customer'
      '      INNER JOIN Quote ON'
      '        Customer.Customer = Quote.Customer) ON'
      '        Quote_Status.Quote_Status = Quote.Quote_Status) ON'
      '        Vat.Vat = Quote.Vat) ON'
      '        Inactive_Reason.Inactive_Reason = Quote.Inactive_Reason'
      'WHERE'
      '(Quote.inactive = '#39'Y'#39') AND'
      
        '((Quote.Contract_Quote IS NULL) OR (Quote.Contract_Quote = '#39'N'#39'))' +
        ' AND'
      '((Quote.Customer = :Customer) or (0 = :Customer)) and'
      '((Quote.Inactive_Reason = :Code) or (0 = :Code)) and'
      
        '((Quote.Date_Raised >= :Date_From) and (Quote.Date_Raised <= :Da' +
        'te_To)) AND'
      
        '(((Customer.Is_Retail_Customer = :Is_Retail_Customer) AND (Custo' +
        'mer.Is_Commercial_Customer = :Is_Commercial_Customer)) or (:Is_R' +
        'etail_Customer = '#39'A'#39'))'
      'ORDER BY Inactive_Reason_Descr, Quote.Quote_Number, Quote.Quote')
    Left = 208
    Top = 184
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
      end
      item
        Name = 'Customer'
        DataType = ftInteger
      end
      item
        Name = 'Code'
      end
      item
        Name = 'Code'
      end
      item
        Name = 'Date_From'
        DataType = ftDateTime
      end
      item
        Name = 'Date_To'
        DataType = ftDateTime
      end
      item
        Name = 'Is_Retail_Customer'
      end
      item
        Name = 'Is_Commercial_Customer'
      end
      item
        Name = 'Is_Retail_Customer'
      end>
    object qryQuotesQuote: TIntegerField
      FieldName = 'Quote'
    end
    object qryQuotesDate_Required: TDateTimeField
      FieldName = 'Date_Required'
    end
    object qryQuotesDate_Raised: TDateTimeField
      FieldName = 'Date_Raised'
    end
    object qryQuotesCustomer: TIntegerField
      FieldName = 'Customer'
    end
    object qryQuotesDescription: TWideStringField
      FieldName = 'Description'
      Size = 255
    end
    object qryQuotesOperator: TIntegerField
      FieldName = 'Operator'
    end
    object qryQuotesInstallation_price: TFloatField
      FieldName = 'Installation_price'
      DisplayFormat = '0.00'
    end
    object qryQuotesDelivery_Price: TFloatField
      FieldName = 'Delivery_Price'
      DisplayFormat = '0.00'
    end
    object qryQuotesSurvey_price: TFloatField
      FieldName = 'Survey_price'
      DisplayFormat = '0.00'
    end
    object qryQuotesExtra_Notes: TIntegerField
      FieldName = 'Extra_Notes'
    end
    object qryQuotesAvailability: TIntegerField
      FieldName = 'Availability'
    end
    object qryQuotesPayment_terms: TIntegerField
      FieldName = 'Payment_terms'
    end
    object qryQuotesReference: TWideStringField
      FieldName = 'Reference'
      Size = 30
    end
    object qryQuotesQuote_Status: TIntegerField
      FieldName = 'Quote_Status'
    end
    object qryQuotesNett_Price: TFloatField
      FieldName = 'Nett_Price'
      DisplayFormat = '0.00'
    end
    object qryQuotesInactive: TWideStringField
      FieldName = 'Inactive'
      Size = 1
    end
    object qryQuotesInactive_reason: TIntegerField
      FieldName = 'Inactive_reason'
    end
    object qryQuotesMaterial_Type: TIntegerField
      FieldName = 'Material_Type'
    end
    object qryQuotesAddress: TIntegerField
      FieldName = 'Address'
    end
    object qryQuotesContact_Name: TWideStringField
      FieldName = 'Contact_Name'
      Size = 50
    end
    object qryQuotesVat: TIntegerField
      FieldName = 'Vat'
    end
    object qryQuotesDiscount_Rate: TFloatField
      FieldName = 'Discount_Rate'
    end
    object qryQuotesDiscount_Value: TFloatField
      FieldName = 'Discount_Value'
      DisplayFormat = '0.00'
    end
    object qryQuotesCustomer_Name: TWideStringField
      FieldName = 'Customer_Name'
      Size = 50
    end
    object qryQuotesTemplate_Date: TDateTimeField
      FieldName = 'Template_Date'
    end
    object qryQuotesTemplate_Date_Actual: TDateTimeField
      FieldName = 'Template_Date_Actual'
    end
    object qryQuotesDeposit_Terms: TFloatField
      FieldName = 'Deposit_Terms'
    end
    object qryQuotesDeposit_Amount: TFloatField
      FieldName = 'Deposit_Amount'
      DisplayFormat = '0.00'
    end
    object qryQuotesInstall_Address: TIntegerField
      FieldName = 'Install_Address'
    end
    object qryQuotesDate_Accepted: TDateTimeField
      FieldName = 'Date_Accepted'
    end
    object qryQuotesCustomer_Name_Actual: TWideStringField
      FieldName = 'Customer_Name_Actual'
      Size = 50
    end
    object qryQuotesQuote_Status_Description: TWideStringField
      FieldName = 'Quote_Status_Description'
      Size = 50
    end
    object qryQuotesVat_Rate: TFloatField
      FieldName = 'Vat_Rate'
    end
    object qryQuotestelephone_number: TWideStringField
      FieldName = 'telephone_number'
      Size = 30
    end
    object qryQuotesMarkup_Value: TFloatField
      FieldName = 'Markup_Value'
    end
    object qryQuotesInactive_Reason_Descr: TWideStringField
      FieldName = 'Inactive_Reason_Descr'
      Size = 100
    end
    object qryQuotesQuote_Number: TFloatField
      FieldName = 'Quote_Number'
    end
    object qryQuotesOriginal_Quote: TIntegerField
      FieldName = 'Original_Quote'
    end
    object qryQuotesRequote_Count: TIntegerField
      FieldName = 'Requote_Count'
    end
    object qryQuotesIs_Retail_Customer: TWideStringField
      FieldName = 'Is_Retail_Customer'
      Size = 1
    end
  end
  object qryReQuote: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      
        'SELECT Sum(Quote.Nett_Price - Quote.Discount_Value + Quote.Marku' +
        'p_Value) as Total_Complete,'
      '        Sum(Installation_Price) as Total_Install,'
      '        Sum(Survey_Price) as Total_Survey,'
      '        Sum(Delivery_Price) as Total_Delivery,'
      '        max(Quote_Status) as Requote_Status'
      'FROM Quote'
      
        'WHERE ((Quote.Original_Quote = :Original_Quote) or (Quote.Quote ' +
        '= :Original_Quote)) and'
      '      (Quote.Quote <> :Quote)')
    Left = 326
    Top = 180
    ParamData = <
      item
        Name = 'Original_Quote'
      end
      item
        Name = 'Original_Quote'
      end
      item
        Name = 'Quote'
      end>
  end
end
