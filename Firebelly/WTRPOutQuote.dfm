object frmwtRPOutQuote: TfrmwtRPOutQuote
  Left = 49
  Top = 110
  Caption = 'Outstanding Quote Report'
  ClientHeight = 576
  ClientWidth = 1252
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  
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
    ReportTitle = 'Outstanding Quote Report'
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
        Left = 427
        Top = 8
        Width = 181
        Height = 19
        Size.Values = (
          50.270833333333330000
          1129.770833333333000000
          21.166666666666670000
          478.895833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Outstanding Quote Report'
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
      object QRSysData1: TQRSysData
        Left = 968
        Top = 8
        Width = 69
        Height = 17
        Size.Values = (
          44.979166666666670000
          2561.166666666667000000
          21.166666666666670000
          182.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
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
        Left = 448
        Top = 57
        Width = 52
        Height = 17
        Size.Values = (
          44.979166666666670000
          1185.333333333333000000
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
        Left = 590
        Top = 57
        Width = 45
        Height = 17
        Size.Values = (
          44.979166666666670000
          1561.041666666667000000
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
        Left = 653
        Top = 57
        Width = 28
        Height = 17
        Size.Values = (
          44.979166666666670000
          1727.729166666667000000
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
        Left = 704
        Top = 57
        Width = 36
        Height = 17
        Size.Values = (
          44.979166666666670000
          1862.666666666667000000
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
        Left = 917
        Top = 57
        Width = 32
        Height = 17
        Size.Values = (
          44.979166666666670000
          2426.229166666667000000
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
        Left = 760
        Top = 57
        Width = 40
        Height = 17
        Size.Values = (
          44.979166666666670000
          2010.833333333333000000
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
        Left = 888
        Top = 57
        Width = 24
        Height = 17
        Size.Values = (
          44.979166666666670000
          2349.500000000000000000
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
        Left = 832
        Top = 57
        Width = 23
        Height = 17
        Size.Values = (
          44.979166666666670000
          2201.333333333333000000
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
        Left = 475
        Top = 32
        Width = 74
        Height = 17
        Size.Values = (
          44.979166666666670000
          1256.770833333333000000
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
      object gtQRLabel1: TQRLabel
        Left = 376
        Top = 57
        Width = 48
        Height = 17
        Size.Values = (
          44.979166666666670000
          994.833333333333300000
          150.812500000000000000
          127.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Follow up'
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
      object gtQRLabel3: TQRLabel
        Left = 1010
        Top = 43
        Width = 39
        Height = 29
        Size.Values = (
          76.729166666666670000
          2672.291666666667000000
          113.770833333333300000
          103.187500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Re-quotes'
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
      object gtQRLabel4: TQRLabel
        Left = 976
        Top = 43
        Width = 33
        Height = 31
        Size.Values = (
          82.020833333333330000
          2582.333333333333000000
          113.770833333333300000
          87.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Last Event'
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
      Height = 32
      AlignToBottom = False
      BeforePrint = qrgCustomerHeadBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        84.666666666666670000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'Customer_Name'
      FooterBand = qrbCustomerFooter
      Master = qrpDetails
      ReprintOnNewPage = False
      object QRLabel2: TQRLabel
        Left = 0
        Top = 8
        Width = 47
        Height = 17
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          21.166666666666670000
          124.354166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer'
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
        Left = 56
        Top = 8
        Width = 80
        Height = 17
        Size.Values = (
          44.979166666666670000
          148.166666666666700000
          21.166666666666670000
          211.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
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
      object QRLabel15: TQRLabel
        Left = 224
        Top = 8
        Width = 74
        Height = 17
        Size.Values = (
          44.979166666666670000
          592.666666666666700000
          21.166666666666670000
          195.791666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Phone Number:'
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
      object gtQRLabel2: TQRLabel
        Left = 520
        Top = 8
        Width = 74
        Height = 17
        Size.Values = (
          44.979166666666670000
          1375.833333333333000000
          21.166666666666670000
          195.791666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Office Contact:'
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
      object gtQRDBText2: TQRDBText
        Left = 600
        Top = 8
        Width = 77
        Height = 17
        Size.Values = (
          44.979166666666670000
          1587.500000000000000000
          21.166666666666670000
          203.729166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryQuotes
        DataField = 'Operator_Name'
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
      object qrlblTelephone: TQRLabel
        Left = 304
        Top = 8
        Width = 74
        Height = 17
        Size.Values = (
          44.979166666666670000
          804.333333333333300000
          21.166666666666670000
          195.791666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Phone Number:'
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
    object qrsbDetails: TQRSubDetail
      Left = 38
      Top = 145
      Width = 1047
      Height = 19
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
        50.270833333333330000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpDetails
      PrintBefore = False
      PrintIfEmpty = True
      object qrlblEvent: TQRLabel
        Left = 970
        Top = 0
        Width = 48
        Height = 15
        Size.Values = (
          39.687500000000000000
          2566.458333333333000000
          0.000000000000000000
          127.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'qrlblEvent'
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
      object QRDBText11: TQRDBText
        Left = 732
        Top = 0
        Width = 70
        Height = 15
        Size.Values = (
          39.687500000000000000
          1936.750000000000000000
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
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRDBText2: TQRDBText
        Left = 8
        Top = 1
        Width = 30
        Height = 15
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
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
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRDBText5: TQRDBText
        Left = 448
        Top = 1
        Width = 137
        Height = 15
        Size.Values = (
          39.687500000000000000
          1185.333333333333000000
          2.645833333333333000
          362.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryQuotes
        DataField = 'Reference'
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
        DataField = 'Description'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRDBText10: TQRDBText
        Left = 674
        Top = 0
        Width = 66
        Height = 15
        Size.Values = (
          39.687500000000000000
          1783.291666666667000000
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
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlTotal: TQRLabel
        Left = 870
        Top = 0
        Width = 43
        Height = 15
        Size.Values = (
          39.687500000000000000
          2301.875000000000000000
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
        Left = 600
        Top = 0
        Width = 81
        Height = 15
        Size.Values = (
          39.687500000000000000
          1587.500000000000000000
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
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlComplete: TQRLabel
        Left = 577
        Top = 0
        Width = 57
        Height = 15
        Size.Values = (
          39.687500000000000000
          1526.645833333333000000
          0.000000000000000000
          150.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlComplete'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlVat: TQRLabel
        Left = 825
        Top = 0
        Width = 30
        Height = 15
        Size.Values = (
          39.687500000000000000
          2182.812500000000000000
          0.000000000000000000
          79.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlVat'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtQRDBText1: TQRDBText
        Left = 376
        Top = 1
        Width = 72
        Height = 15
        Size.Values = (
          39.687500000000000000
          994.833333333333300000
          2.645833333333333000
          190.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryQuotes
        DataField = 'Date_Required'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlblRequote: TQRLabel
        Left = 1036
        Top = 0
        Width = 61
        Height = 15
        Size.Values = (
          39.687500000000000000
          2741.083333333333000000
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
        Left = 918
        Top = 0
        Width = 43
        Height = 15
        Size.Values = (
          39.687500000000000000
          2428.875000000000000000
          0.000000000000000000
          113.770833333333300000)
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
      Top = 164
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
        Left = 754
        Top = 7
        Width = 87
        Height = 17
        Size.Values = (
          44.979166666666670000
          1994.958333333333000000
          18.520833333333330000
          230.187500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer Total'
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
        Left = 834
        Top = 7
        Width = 79
        Height = 17
        Size.Values = (
          44.979166666666670000
          2206.625000000000000000
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
        Left = 752
        Top = -1
        Width = 161
        Height = 8
        Size.Values = (
          21.166666666666670000
          1989.666666666667000000
          -2.645833333333333000
          425.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
    object QRBand2: TQRBand
      Left = 38
      Top = 193
      Width = 1047
      Height = 32
      AfterPrint = QRBand2AfterPrint
      AlignToBottom = False
      BeforePrint = QRBand2BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        84.666666666666670000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRLabel10: TQRLabel
        Left = 754
        Top = 7
        Width = 68
        Height = 17
        Size.Values = (
          44.979166666666670000
          1994.958333333333000000
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
        Left = 823
        Top = 7
        Width = 90
        Height = 17
        Size.Values = (
          44.979166666666670000
          2177.520833333333000000
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
        Left = 752
        Top = -1
        Width = 161
        Height = 8
        Size.Values = (
          21.166666666666670000
          1989.666666666667000000
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
      'SELECT  Quote.*,'
      '        Customer.Customer_Name as Customer_Name_Actual,'
      '        Customer.Is_Retail_Customer,'
      '        Customer.Is_Commercial_Customer,'
      '        Quote_Status_Description,'
      '        Vat_Rate,'
      '        Customer.telephone_number,'
      '        Operator.Operator_Name,'
      '        Address.Telephone_Number as Retail_Telephone,'
      '        Address.Email_Address as Retail_Email_Address,'
      '        (SELECT TOP 1 Quote_Internal_Note.Date_Time_Entered'
      '         FROM Quote_Internal_Note'
      '         WHERE Quote_Internal_Note.Quote = Quote.Quote'
      '         ORDER BY Internal_Note DESC) as Last_Event,'
      '        (SELECT Count(ReQuote.Quote)'
      '         FROM Quote ReQuote'
      
        '         WHERE (ReQuote.Original_Quote = Quote.Original_Quote) a' +
        'nd'
      '                (ReQuote.Quote <> ReQuote.Original_Quote) and'
      
        '                ((ReQuote.Original_Quote <> 0) and (ReQuote.Orig' +
        'inal_Quote <> NULL))) as Requote_Count'
      'FROM Address'
      '      RIGHT JOIN (Operator'
      '      INNER JOIN (Vat'
      '      INNER JOIN (Quote_Status'
      '      INNER JOIN (Customer'
      '      INNER JOIN Quote'
      '        ON Customer.Customer = Quote.Customer)'
      '        ON Quote_Status.Quote_Status = Quote.Quote_Status)'
      '        ON Vat.Vat = Quote.Vat)'
      '        ON Operator.Operator = Quote.Operator)'
      '        ON Address.Address = Quote.Address'
      'WHERE'
      '    (Quote.inactive = '#39'N'#39') AND'
      
        '    ((Quote.Contract_Quote IS NULL) OR (Quote.Contract_Quote = '#39 +
        'N'#39')) AND'
      '    ((Quote.Customer = :Customer) or (0 = :Customer)) and'
      '    ((Quote.Operator = :Operator) or (0 = :Operator)) and'
      
        '    ((Quote.Date_Required >= :Date_From) and (Quote.Date_Require' +
        'd <= :Date_To)) and'
      '    (Quote.Quote_Status < 23) AND'
      
        '    (((Customer.Is_Retail_Customer = :Is_Retail_Customer) AND (C' +
        'ustomer.Is_Commercial_Customer = :Is_Commercial_Customer)) or (:' +
        'Is_Retail_Customer = '#39'A'#39'))'
      'ORDER BY Quote.Customer_Name, Quote.Quote_Number, Quote.Quote')
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
        Name = 'Operator'
      end
      item
        Name = 'Operator'
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
  end
  object qryReQuote: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      
        'SELECT Sum(Quote.Nett_Price - Quote.Discount_Value + Quote.Marku' +
        'p_Value + Quote.Waste_Value) as Total_Complete,'
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
  object qryEvent: TFDQuery
    Left = 328
    Top = 240
  end
end
