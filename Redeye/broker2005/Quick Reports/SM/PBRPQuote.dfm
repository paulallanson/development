object frmPBRPQuote: TfrmPBRPQuote
  Left = 251
  Top = 12
  Caption = 'Quote Print'
  ClientHeight = 845
  ClientWidth = 1142
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Scaled = False
  TextHeight = 13
  object qrpDetails: TQuickRep
    Left = 142
    Top = 64
    Width = 992
    Height = 1403
    ShowingPreview = False
    BeforePrint = qrpDetailsBeforePrint
    DataSet = qryReport
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
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Continuous = False
    Page.Values = (
      100.000000000000000000
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
    object qrbPageHeader: TQRBand
      Left = 24
      Top = 47
      Width = 945
      Height = 394
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        833.966666666666700000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object qrlblQuoteCaption: TQRLabel
        Left = 10
        Top = 0
        Width = 177
        Height = 51
        Size.Values = (
          107.950000000000000000
          21.166666666666670000
          0.000000000000000000
          374.650000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Quotation'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -37
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 22
      end
      object QRDBText2: TQRDBText
        Left = 906
        Top = 315
        Width = 36
        Height = 20
        Size.Values = (
          42.333333333333330000
          1917.700000000000000000
          666.750000000000000000
          76.200000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Quote'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
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
      object QRLabel3: TQRLabel
        Left = 724
        Top = 315
        Width = 60
        Height = 20
        Size.Values = (
          42.333333333333330000
          1532.466666666667000000
          666.750000000000000000
          127.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Quote No:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRDBText5: TQRDBText
        Left = 100
        Top = 314
        Width = 511
        Height = 20
        Size.Values = (
          42.333333333333330000
          211.666666666666700000
          664.104166666666700000
          1082.145833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = qryReport
        DataField = 'Description'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
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
      object gtQRLabel1: TQRLabel
        Left = 10
        Top = 355
        Width = 50
        Height = 20
        Size.Values = (
          42.333333333333330000
          21.166666666666670000
          751.416666666666700000
          105.833333333333300000)
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
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtQRDBText2: TQRDBText
        Left = 100
        Top = 355
        Width = 50
        Height = 20
        Size.Values = (
          42.333333333333330000
          211.666666666666700000
          751.416666666666700000
          105.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Quantity'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
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
      object qrmAddress: TQRMemo
        Left = 10
        Top = 78
        Width = 327
        Height = 134
        Size.Values = (
          283.104166666666700000
          21.166666666666670000
          164.041666666666700000
          693.208333333333300000)
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
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object qrlblContactName: TQRLabel
        Left = 10
        Top = 57
        Width = 115
        Height = 20
        Size.Values = (
          42.333333333333330000
          21.166666666666670000
          120.650000000000000000
          243.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblContactName'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRDBText3: TQRDBText
        Left = 814
        Top = 364
        Width = 127
        Height = 20
        Size.Values = (
          42.333333333333330000
          1722.966666666667000000
          770.466666666666700000
          268.816666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Office_Contact_Name'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
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
      object gtQRLabel2: TQRLabel
        Left = 752
        Top = 339
        Width = 32
        Height = 20
        Size.Values = (
          42.333333333333330000
          1591.733333333333000000
          717.550000000000000000
          67.733333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Date:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtQRDBText7: TQRDBText
        Left = 876
        Top = 339
        Width = 65
        Height = 20
        Size.Values = (
          42.333333333333330000
          1854.200000000000000000
          717.550000000000000000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Date_Point'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
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
      object QRLabel4: TQRLabel
        Left = 697
        Top = 364
        Width = 87
        Height = 20
        Size.Values = (
          42.333333333333330000
          1475.316666666667000000
          770.466666666666700000
          184.150000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Office Contact:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtQRLabel5: TQRLabel
        Left = 10
        Top = 314
        Width = 59
        Height = 20
        Size.Values = (
          42.333333333333330000
          21.166666666666670000
          664.633333333333300000
          124.883333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Reference'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRMemoCmpnyNm: TQRMemo
        Left = 708
        Top = 92
        Width = 124
        Height = 173
        Size.Values = (
          366.183333333333300000
          1498.600000000000000000
          194.733333333333300000
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
      object qrlblEndUser: TQRLabel
        Left = 10
        Top = 224
        Width = 59
        Height = 20
        Size.Values = (
          42.333333333333330000
          21.166666666666670000
          474.133333333333300000
          124.883333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'End User:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlblEndUserName: TQRDBText
        Left = 96
        Top = 224
        Width = 511
        Height = 20
        Size.Values = (
          42.333333333333330000
          203.729166666666700000
          473.604166666666700000
          1082.145833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = qryReport
        DataField = 'End_User_Name'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
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
    object qrgQuote: TQRGroup
      Left = 24
      Top = 441
      Width = 945
      Height = 3
      AlignToBottom = False
      BeforePrint = qrgQuoteBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        6.350000000000000000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'Quote'
      FooterBand = qrgfQuote
      Master = qrpDetails
      ReprintOnNewPage = False
    end
    object qrgfQuote: TQRBand
      Left = 24
      Top = 652
      Width = 945
      Height = 4
      AlignToBottom = False
      BeforePrint = qrgfQuoteBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        8.466666666666667000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
    end
    object ReportImage: TQRImage
      Left = 510
      Top = 48
      Width = 458
      Height = 88
      Size.Values = (
        186.266666666666700000
        1079.500000000000000000
        101.600000000000000000
        969.433333333333300000)
      XLColumn = 0
      XLNumFormat = nfGeneral
      ActiveInPreview = False
      Stretch = True
    end
    object qrbOvers: TQRChildBand
      Left = 24
      Top = 841
      Width = 945
      Height = 225
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        476.250000000000000000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = qrbNotes
      PrintOrder = cboAfterParent
      object gtQRLabel13: TQRLabel
        Left = 10
        Top = 8
        Width = 41
        Height = 21
        Size.Values = (
          44.450000000000000000
          21.166666666666670000
          16.933333333333330000
          86.783333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Overs:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtQRLabel14: TQRLabel
        Left = 10
        Top = 30
        Width = 572
        Height = 21
        Size.Values = (
          44.450000000000000000
          21.166666666666670000
          63.500000000000000000
          1210.733333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          'Please confirm how you would like us to deal with any print over' +
          's by ticking the relevant box below:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtQRLabel15: TQRLabel
        Left = 10
        Top = 60
        Width = 408
        Height = 20
        Size.Values = (
          42.333333333333330000
          21.166666666666670000
          127.000000000000000000
          863.600000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'DELIVER ALL/PART OVERS BACK TO THE CLIENT @ '#163'60 per pallet'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtQRLabel16: TQRLabel
        Left = 10
        Top = 90
        Width = 548
        Height = 21
        Size.Values = (
          44.450000000000000000
          21.166666666666670000
          190.500000000000000000
          1159.933333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          'RETURN ALL/PART OVERS BACK TO SERVICE GRAPHIC STOCK @ '#163'5 per pal' +
          'let per week'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtQRLabel17: TQRLabel
        Left = 10
        Top = 120
        Width = 277
        Height = 21
        Size.Values = (
          44.450000000000000000
          21.166666666666670000
          254.000000000000000000
          586.316666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'DESTROY ALL/PART OVERS @ '#163'20 per pallet'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtQRLabel18: TQRLabel
        Left = 10
        Top = 150
        Width = 742
        Height = 21
        Size.Values = (
          44.450000000000000000
          21.166666666666670000
          317.500000000000000000
          1570.566666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          'If you would like to place the order, please sign, date, confirm' +
          ' your Purchase order and email back to us. Thank you.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtQRShape1: TQRShape
        Left = 580
        Top = 54
        Width = 81
        Height = 30
        Size.Values = (
          63.500000000000000000
          1227.666666666667000000
          113.770833333333300000
          171.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape2: TQRShape
        Left = 580
        Top = 83
        Width = 81
        Height = 30
        Size.Values = (
          63.500000000000000000
          1227.666666666667000000
          174.625000000000000000
          171.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape3: TQRShape
        Left = 580
        Top = 111
        Width = 81
        Height = 30
        Size.Values = (
          63.500000000000000000
          1227.666666666667000000
          235.479166666666700000
          171.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel19: TQRLabel
        Left = 10
        Top = 200
        Width = 424
        Height = 21
        Size.Values = (
          44.450000000000000000
          21.166666666666670000
          423.333333333333300000
          897.466666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          'Signature:  ....................................................' +
          '.....................................'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtQRLabel20: TQRLabel
        Left = 480
        Top = 200
        Width = 188
        Height = 21
        Size.Values = (
          44.450000000000000000
          1016.000000000000000000
          423.333333333333300000
          397.933333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date:  .....................................'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtQRLabel21: TQRLabel
        Left = 740
        Top = 200
        Width = 200
        Height = 21
        Size.Values = (
          44.450000000000000000
          1566.333333333333000000
          423.333333333333300000
          423.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'PO No:  .....................................'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
    end
    object qrbPostage: TQRChildBand
      Left = 24
      Top = 1066
      Width = 945
      Height = 6
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        12.700000000000000000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = qrbOvers
      PrintOrder = cboAfterParent
    end
    object qrbPageFooter: TQRBand
      Left = 24
      Top = 1072
      Width = 945
      Height = 213
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        450.850000000000000000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageFooter
      object gtQRLabel6: TQRLabel
        Left = 177
        Top = 6
        Width = 574
        Height = 21
        Size.Values = (
          44.450000000000000000
          374.650000000000000000
          12.700000000000000000
          1214.966666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          'Full Terms & Conditions available on Southern Mail'#8217's website at ' +
          'https://southernmail.co.uk'
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
        FontSize = 8
      end
      object gtQRLabel32: TQRLabel
        Left = 177
        Top = 26
        Width = 594
        Height = 39
        Size.Values = (
          82.020833333333330000
          375.708333333333300000
          55.562500000000000000
          1256.770833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 
          'All prices are subject to sight of materials supplied, machine s' +
          'uitability, machine space/timings and our machine specifications' +
          ' which requires a minimum of 15mm clearance where applicable.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Lato Light'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object gtQRLabel33: TQRLabel
        Left = 177
        Top = 64
        Width = 536
        Height = 20
        Size.Values = (
          42.333333333333330000
          374.650000000000000000
          135.466666666666700000
          1134.533333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          'All deliveries, collections and additional storage requirements ' +
          'are charged as extra.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Lato Light'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object gtQRLabel34: TQRLabel
        Left = 177
        Top = 83
        Width = 362
        Height = 20
        Size.Values = (
          42.333333333333330000
          374.650000000000000000
          175.683333333333300000
          766.233333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'All prices are exclusive of VAT and are valid for 30 days.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Lato Light'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object gtQRLabel4: TQRLabel
        Left = 177
        Top = 101
        Width = 38
        Height = 19
        Size.Values = (
          40.216666666666670000
          374.650000000000000000
          213.783333333333300000
          80.433333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'E&OE'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato Light'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrmRegNumber: TQRMemo
        Left = 241
        Top = 173
        Width = 703
        Height = 16
        Size.Values = (
          33.866666666666670000
          510.116666666666700000
          366.183333333333300000
          1488.016666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
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
      object qrmRegOffice: TQRMemo
        Left = 637
        Top = 192
        Width = 307
        Height = 16
        Size.Values = (
          33.866666666666670000
          1348.316666666667000000
          406.400000000000000000
          649.816666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -12
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
    end
    object qrbDeptHeader: TQRGroup
      Left = 24
      Top = 444
      Width = 945
      Height = 31
      AlignToBottom = False
      TransparentBand = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold, fsUnderline]
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        65.616666666666670000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'Process_group_Description'
      Master = qrbDeptDetail
      ReprintOnNewPage = False
      object gtQRDBText8: TQRDBText
        Left = 10
        Top = 10
        Width = 531
        Height = 21
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          21.166666666666670000
          1124.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = qryReportDepts
        DataField = 'Process_Group_Description'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
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
    object qrbDeptDetail: TQRSubDetail
      Left = 24
      Top = 475
      Width = 945
      Height = 26
      AlignToBottom = False
      BeforePrint = qrbDeptDetailBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        55.033333333333330000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpDetails
      DataSet = qryReportDepts
      FooterBand = qrbDeptFooter
      PrintBefore = False
      PrintIfEmpty = True
      object SpecMemo: TQRMemo
        Left = 10
        Top = 3
        Width = 921
        Height = 20
        Size.Values = (
          42.333333333333330000
          21.166666666666670000
          5.291666666666667000
          1949.979166666667000000)
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
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
    end
    object qrbDeptFooter: TQRBand
      Left = 24
      Top = 501
      Width = 945
      Height = 31
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.Width = 2
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        65.616666666666670000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object gtQRLabel11: TQRLabel
        Left = 10
        Top = 6
        Width = 66
        Height = 20
        Size.Values = (
          42.333333333333330000
          21.166666666666670000
          12.700000000000000000
          139.700000000000000000)
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
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtlblQuantity: TQRLabel
        Left = 500
        Top = 6
        Width = 50
        Height = 20
        Size.Values = (
          42.333333333333330000
          1058.333333333333000000
          12.700000000000000000
          105.833333333333300000)
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
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtlblUnitPrice: TQRLabel
        Left = 586
        Top = 6
        Width = 58
        Height = 20
        Size.Values = (
          42.333333333333330000
          1240.366666666667000000
          12.700000000000000000
          122.766666666666700000)
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
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtlblTotalPrice: TQRLabel
        Left = 780
        Top = 6
        Width = 63
        Height = 20
        Size.Values = (
          42.333333333333330000
          1651.000000000000000000
          12.700000000000000000
          133.350000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total Price'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtlblVat: TQRLabel
        Left = 906
        Top = 6
        Width = 26
        Height = 20
        Size.Values = (
          42.333333333333330000
          1917.700000000000000000
          12.700000000000000000
          55.033333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'VAT'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtlblPriceUnit: TQRLabel
        Left = 676
        Top = 6
        Width = 58
        Height = 20
        Size.Values = (
          42.333333333333330000
          1430.866666666667000000
          12.700000000000000000
          122.766666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Price Unit'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
    end
    object qrbLineHeader: TQRGroup
      Left = 24
      Top = 532
      Width = 945
      Height = 34
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        71.966666666666670000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'Product_Type_Description'
      Master = qrbLineDetail
      ReprintOnNewPage = False
      object gtQRDBText5: TQRDBText
        Left = 10
        Top = 10
        Width = 531
        Height = 21
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          21.166666666666670000
          1124.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = qryReportlines
        DataField = 'Product_Type_Description'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
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
    object qrbLineDetail: TQRSubDetail
      Left = 24
      Top = 566
      Width = 945
      Height = 25
      AlignToBottom = False
      BeforePrint = qrbLineDetailBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.916666666666670000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpDetails
      DataSet = qryReportlines
      PrintBefore = False
      PrintIfEmpty = True
      object gtlblQuoteUnitPrice: TQRLabel
        Left = 536
        Top = 3
        Width = 113
        Height = 20
        Size.Values = (
          42.333333333333330000
          1134.533333333333000000
          6.350000000000000000
          239.183333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'gtlblQuoteUnitPrice'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtlblQuoteQuantity: TQRDBText
        Left = 483
        Top = 3
        Width = 79
        Height = 20
        Size.Values = (
          42.333333333333330000
          1021.291666666667000000
          5.291666666666667000
          166.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReportlines
        DataField = 'Quantity'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
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
      object gtlblQuoteVat: TQRLabel
        Left = 855
        Top = 3
        Width = 80
        Height = 20
        Size.Values = (
          42.333333333333330000
          1809.750000000000000000
          6.350000000000000000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'gtlblQuoteVat'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtQRDBText1: TQRDBText
        Left = 10
        Top = 3
        Width = 491
        Height = 20
        Size.Values = (
          42.333333333333330000
          21.166666666666670000
          5.291666666666667000
          1039.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = qryReportlines
        DataField = 'Quote_Line_Description'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
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
      object gtlblQuoteTotalPrice: TQRLabel
        Left = 734
        Top = 3
        Width = 118
        Height = 20
        Size.Values = (
          42.333333333333330000
          1553.633333333333000000
          6.350000000000000000
          249.766666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'gtlblQuoteTotalPrice'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtlblQuotePriceUnit: TQRDBText
        Left = 665
        Top = 3
        Width = 79
        Height = 20
        Size.Values = (
          42.333333333333340000
          1407.583333333333000000
          5.291666666666667000
          166.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReportlines
        DataField = 'Price_Unit_Description'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
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
    object qrbSupplyHeader: TQRBand
      Left = 24
      Top = 591
      Width = 945
      Height = 36
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        76.200000000000000000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupHeader
      object gtQRLabel9: TQRLabel
        Left = 10
        Top = 10
        Width = 65
        Height = 21
        Size.Values = (
          44.450000000000000000
          21.166666666666670000
          21.166666666666670000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'To Supply'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
    end
    object qrbSupplyLines: TQRSubDetail
      Left = 24
      Top = 627
      Width = 945
      Height = 25
      AlignToBottom = False
      BeforePrint = qrbSupplyLinesBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.916666666666670000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpDetails
      DataSet = qryReportSupply
      HeaderBand = qrbSupplyHeader
      PrintBefore = False
      PrintIfEmpty = True
      object gtlblSupplyVat: TQRLabel
        Left = 850
        Top = 3
        Width = 85
        Height = 20
        Size.Values = (
          42.333333333333330000
          1799.166666666667000000
          6.350000000000000000
          179.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'gtlblSupplyVat'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtQRDBText6: TQRDBText
        Left = 10
        Top = 3
        Width = 491
        Height = 20
        Size.Values = (
          42.333333333333330000
          21.166666666666670000
          5.291666666666667000
          1039.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = qryReportSupply
        DataField = 'Quote_Supply_Description'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
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
      object gtlblSupplyQuantity: TQRDBText
        Left = 483
        Top = 3
        Width = 79
        Height = 20
        Size.Values = (
          42.333333333333330000
          1021.291666666667000000
          5.291666666666667000
          166.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReportSupply
        DataField = 'Quantity'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
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
      object gtlblSupplyUnitPrice: TQRDBText
        Left = 576
        Top = 3
        Width = 79
        Height = 20
        Size.Values = (
          42.333333333333330000
          1219.729166666667000000
          5.291666666666667000
          166.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReportSupply
        DataField = 'Unit_Price'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
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
      object gtlblSupplyTotalPrice: TQRLabel
        Left = 730
        Top = 3
        Width = 123
        Height = 20
        Size.Values = (
          42.333333333333330000
          1545.166666666667000000
          6.350000000000000000
          260.350000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'gtlblSupplyTotalPrice'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtlblSupplyPriceUnit: TQRDBText
        Left = 666
        Top = 3
        Width = 79
        Height = 20
        Size.Values = (
          42.333333333333340000
          1410.229166666667000000
          5.291666666666667000
          166.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReportSupply
        DataField = 'Price_Unit_Description'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
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
    object qrbQuoteFooter: TQRBand
      Left = 24
      Top = 656
      Width = 945
      Height = 125
      Frame.DrawTop = True
      AlignToBottom = False
      BeforePrint = qrbQuoteFooterBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        264.583333333333300000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object gtlblTotalGross: TQRLabel
        Left = 841
        Top = 64
        Width = 96
        Height = 21
        Size.Values = (
          44.450000000000000000
          1780.116666666667000000
          135.466666666666700000
          203.200000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'gtlblTotalGross'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtlblPackTotalGross: TQRLabel
        Left = 809
        Top = 95
        Width = 127
        Height = 19
        Size.Values = (
          40.216666666666670000
          1712.383333333333000000
          201.083333333333300000
          268.816666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'gtlblPackTotalGross'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtlblPackUnitPrice: TQRLabel
        Left = 505
        Top = 95
        Width = 118
        Height = 19
        Size.Values = (
          40.216666666666670000
          1068.916666666667000000
          201.083333333333300000
          249.766666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'gtlblPackUnitPrice'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtQRLabel10: TQRLabel
        Left = 749
        Top = 4
        Width = 58
        Height = 21
        Size.Values = (
          44.450000000000000000
          1585.383333333333000000
          8.466666666666667000
          122.766666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Total Net'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtlblTotalSales: TQRLabel
        Left = 840
        Top = 4
        Width = 96
        Height = 21
        Size.Values = (
          44.450000000000000000
          1778.000000000000000000
          8.466666666666667000
          203.200000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'gtlblTotalSales'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtQRLabel7: TQRLabel
        Left = 745
        Top = 34
        Width = 63
        Height = 21
        Size.Values = (
          44.450000000000000000
          1576.916666666667000000
          71.966666666666670000
          133.350000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Total VAT'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtQRLabel8: TQRLabel
        Left = 735
        Top = 64
        Width = 72
        Height = 21
        Size.Values = (
          44.450000000000000000
          1555.750000000000000000
          135.466666666666700000
          152.400000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Total Gross'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtlblTotalVat: TQRLabel
        Left = 854
        Top = 34
        Width = 82
        Height = 21
        Size.Values = (
          44.450000000000000000
          1807.633333333333000000
          71.966666666666670000
          173.566666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'gtlblTotalVat'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtlblPackPriceUnit: TQRLabel
        Left = 400
        Top = 95
        Width = 118
        Height = 19
        Size.Values = (
          40.216666666666670000
          846.666666666666700000
          201.083333333333300000
          249.766666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'gtlblPackPriceUnit'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtlblPackVat: TQRLabel
        Left = 679
        Top = 95
        Width = 81
        Height = 19
        Size.Values = (
          40.216666666666670000
          1437.216666666667000000
          201.083333333333300000
          171.450000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'gtlblPackVat'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtlblPackPriceVat: TQRLabel
        Left = 651
        Top = 95
        Width = 27
        Height = 19
        Size.Values = (
          40.216666666666670000
          1377.950000000000000000
          201.083333333333300000
          57.150000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'VAT'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtlblPackPriceGross: TQRLabel
        Left = 772
        Top = 95
        Width = 36
        Height = 19
        Size.Values = (
          40.216666666666670000
          1634.066666666667000000
          201.083333333333300000
          76.200000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Gross'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtNotesShape: TQRShape
        Left = 10
        Top = 10
        Width = 701
        Height = 71
        Size.Values = (
          150.812500000000000000
          21.166666666666670000
          21.166666666666670000
          1484.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Color = clNavy
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object memPayment: TQRMemo
        Left = 20
        Top = 21
        Width = 661
        Height = 21
        Size.Values = (
          44.979166666666670000
          42.333333333333340000
          44.979166666666670000
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
        Font.Name = 'Lato'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object gtQRMemo1: TQRMemo
        Left = 20
        Top = 51
        Width = 661
        Height = 21
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          108.479166666666700000
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
        Font.Name = 'Lato'
        Font.Style = [fsBold, fsItalic]
        Lines.Strings = (
          
            'All postage payable prior to release unless agreed with a Direct' +
            'or.')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
    end
    object qrbNotes: TQRChildBand
      Left = 24
      Top = 781
      Width = 945
      Height = 60
      AlignToBottom = False
      BeforePrint = qrbNotesBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        127.000000000000000000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = qrbQuoteFooter
      PrintOrder = cboAfterParent
      object memNotes: TQRMemo
        Left = 10
        Top = 36
        Width = 921
        Height = 19
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          76.729166666666670000
          1949.979166666667000000)
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
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object gtQRLabel12: TQRLabel
        Left = 10
        Top = 8
        Width = 40
        Height = 21
        Size.Values = (
          44.450000000000000000
          21.166666666666670000
          16.933333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Notes:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Lato'
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
  object qryReport: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'SELECT  Quote.*,'
      '        Operator.Name AS Office_Contact_Name,'
      '        Price_Unit.Price_unit_Factor,'
      '        Price_Unit.Description AS Price_unit_Description,'
      '        End_User.Name as End_User_Name'
      'FROM Customer AS End_User'
      '      RIGHT JOIN (Price_Unit'
      '      RIGHT JOIN (Operator'
      '      INNER JOIN Quote'
      '        ON Operator.Operator = Quote.Office_Contact)'
      '        ON Price_Unit.Price_Unit = Quote.Price_unit)'
      '        ON End_User.Customer = Quote.End_User_Customer'
      'where Quote.Quote = :Quote')
    Left = 371
    Top = 46
    ParamData = <
      item
        Name = 'Quote'
      end>
  end
  object qryCustomer: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select Customer.Name as Customer_Name,'
      'Building_no_name,'
      'Street,'
      'Locale,'
      'Town,'
      'Postcode,'
      'Delivery_Narrative,'
      'Account_Code,'
      'Customer_Branch.Name as Branch_Name,'
      'Customer_Branch.Use_Branch_Name,'
      'Customer_Is_Acquired,'
      '(Select Payment_Terms.Payment_Terms_Description'
      ' from Payment_Terms'
      
        ' where Payment_Terms.Payment_Terms = Customer.Payment_Terms) as ' +
        'Payment_Terms_Description'
      'from'
      '  Customer_Branch, Customer'
      'where'
      '  ((Customer_Branch.Customer = :Customer) and'
      '   (Branch_no = :Branch_no)) and'
      '  Customer_Branch.Customer = Customer.Customer')
    Left = 528
    Top = 126
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end>
  end
  object dtsAddress: TDataSource
    Left = 432
    Top = 48
  end
  object qryContact: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select Customer_Contact.Name as Contact_Name,'
      '        Customer_Contact.Email,'
      '        Customer_Contact.Phone,'
      '        Customer_Contact.Fax_Number,'
      '        Customer_Contact.Mobile_no,'
      '        Customer_Branch.Name as Branch_Name,'
      '        Customer_Branch.Phone as Branch_Phone,'
      '        Customer_Branch.Fax_Number as Branch_Fax_number'
      'from Customer_Contact, Customer_Branch'
      'where Customer_Contact.Customer = :Customer and'
      '      Customer_Contact.Branch_no = :Branch_no and'
      '      Customer_Contact.Contact_no = :Contact_no and'
      '      ('
      '      (Customer_Contact.Customer = Customer_Branch.Customer) and'
      '      (Customer_Contact.Branch_no = Customer_Branch.Branch_no)'
      '      )')
    Left = 8
    Top = 48
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
      end
      item
        Name = 'Branch_no'
        DataType = ftInteger
      end
      item
        Name = 'Contact_no'
        DataType = ftInteger
      end>
  end
  object qryReportlines: TFDQuery
    MasterSource = dtsReport
    ConnectionName = 'pb'
    SQL.Strings = (
      'SELECT Quote_Line.*,'
      '        Price_Unit.Price_Unit_factor,'
      '        Product_Type.Description as Product_Type_Description,'
      '        Vat_Code.Vat_Code,'
      '        Vat_Code.Vat_Rate,'
      '        Vat_Code.Description as Vat_Description,'
      '        Price_Unit.Description as Price_unit_description'
      'FROM Vat_Code'
      '  RIGHT JOIN (Product_Type'
      '  INNER JOIN (Price_Unit'
      '  INNER JOIN Quote_Line'
      '    ON Price_Unit.Price_Unit = Quote_Line.Price_Unit)'
      '    ON Product_Type.Product_Type = Quote_Line.Product_Type)'
      '    ON Vat_Code.Vat_Code = Quote_Line.Vat_Code'
      'WHERE (Quote = :Quote) AND'
      
        '      ((Quote_Line.Line_Is_Internal_Cost is NULL) or (Quote_Line' +
        '.Line_Is_Internal_Cost = '#39'N'#39'))'
      'ORDER BY Quote_Line.Sequence_no'
      '')
    Left = 368
    Top = 112
    ParamData = <
      item
        Name = 'Quote'
      end>
  end
  object dtsReport: TDataSource
    DataSet = qryReport
    Left = 290
    Top = 46
  end
  object qrygetNotes: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select *'
      'from Narrative_line'
      'where narrative = :Narrative'
      'order by narrative, narrative_line')
    Left = 174
    Top = 45
    ParamData = <
      item
        Name = 'Narrative'
      end>
  end
  object GetNarrSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Narrative_Text'
      'From Narrative_Line'
      'Where (Narrative = :Narrative)'
      'Order By Narrative_Line')
    Left = 560
    Top = 125
    ParamData = <
      item
        Name = 'Narrative'
      end>
  end
  object qryProspect: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select'
      'Ad_Hoc_Address.Name as Customer_Name,'
      'Building_no_name,'
      'Street,'
      'Locale,'
      'Town,'
      'Postcode,'
      'Customer_Is_Acquired,'
      #39#39' as Payment_Terms_Description'
      'from'
      '  Ad_Hoc_Address'
      'where'
      '  Ad_Hoc_Address.Ad_hoc_Address = :Ad_hoc_Address')
    Left = 512
    Top = 112
    ParamData = <
      item
        Name = 'Ad_hoc_Address'
      end>
  end
  object qryReportSupply: TFDQuery
    MasterSource = dtsReport
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT '#9'Quote_Supply.Quote,'
      #9'Quote_Supply.Quote_Supply_No,'
      #9'Quote_Supply.Enquiry,'
      #9'Quote_Supply.Line,'
      '  Quote_Supply.Line_Converted,'
      #9'Quote_Supply.Quantity,'
      #9'Quote_Supply.Quote_Supply_Description,'
      #9'Quote_Supply.Unit_Cost,'
      #9'Quote_Supply.Unit_Price,'
      #9'Quote_Supply.Price_Unit,'
      '  Price_Unit.Price_Unit_Factor,'
      '  Price_Unit.Description as Price_Unit_Description,'
      #9'EnquiryLine.Form_Description,'
      '  Vat_Code.Vat_Rate,'
      '  Vat_Code.Description as Vat_Description'
      'FROM Vat_Code'
      '    RIGHT JOIN (Price_Unit'
      '    INNER JOIN (EnquiryLine'
      '    RIGHT JOIN Quote_Supply'
      
        '      ON (EnquiryLine.Enquiry = Quote_Supply.Enquiry) AND (Enqui' +
        'ryLine.Line = Quote_Supply.Line))'
      
        '      ON Price_Unit.Price_Unit = Quote_Supply.Price_Unit) ON Vat' +
        '_Code.Vat_Code = Quote_Supply.Vat_Code'
      'WHERE Quote_Supply.Quote =  :Quote'
      'ORDER BY Quote_Supply.Quote_Supply_No')
    Left = 499
    Top = 190
    ParamData = <
      item
        Name = 'Quote'
      end>
  end
  object oldqryReportSupply: TFDQuery
    MasterSource = dtsReport
    ConnectionName = 'PB'
    SQL.Strings = (
      'select'
      '    Quote_Supply.Quote,'
      '    Quote_Supply.Quote_Supply_no,'
      '    Quote_Supply.Enquiry,'
      '    Quote_Supply.Line,'
      '    Quote_Supply.Line_Converted,'
      '    Quote_Supply.Quantity,'
      '    EnquiryLine.Form_Description,'
      '    EnquiryLine.Product_Type,'
      '    Enquiry_LineQuantity.Price_Unit,'
      '    Enquiry_LineQuantity.Supplier_Price,'
      '    Enquiry_LineQuantity.Quotation_Price,'
      '    Price_Unit.Price_Unit_Factor,'
      '    Price_Unit.Description as Price_Unit_Description,'
      '    Product_Type.Description as Product_Type_Description'
      
        'from Quote_Supply, EnquiryLine, Enquiry_LineQuantity, Price_Unit' +
        ', Product_type'
      'where Quote = :Quote and'
      '      ('
      '      (Quote_Supply.Enquiry = EnquiryLine.Enquiry) and'
      '      (Quote_Supply.Line = EnquiryLine.Line)'
      '      ) and'
      '      ('
      '      (Quote_Supply.Enquiry = Enquiry_LineQuantity.Enquiry) and'
      '      (Quote_Supply.Line = Enquiry_LineQuantity.Line) and'
      '      (Quote_Supply.Quantity = Enquiry_LineQuantity.Quantity)'
      '      ) and'
      
        '      (Enquiry_LineQuantity.Price_Unit = Price_unit.Price_Unit) ' +
        'and'
      '      (EnquiryLine.Product_Type = Product_Type.Product_Type)'
      'order by Quote_Supply.Quote_Supply_No'
      '')
    Left = 347
    Top = 166
    ParamData = <
      item
        Name = 'Quote'
      end>
  end
  object qryReportDepts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select'
      '    Quote_Process_Group.Quote,'
      '    Quote_process_Group.Process_Group,'
      '    Quote_Process_group.Quote_Specification,'
      '    Quote_Process_group.Quote_Specification_ID,'
      '    Process_group.Process_group_Description,'
      '    Process_Group.Sequence_no'
      'From  Quote_Process_Group,'
      '      Process_Group'
      'Where Quote_Process_group.Quote = :Quote and'
      
        '      Quote_process_group.Process_group = Process_group.Process_' +
        'group'
      'Order By Process_group.Sequence_no')
    Left = 416
    Top = 192
    ParamData = <
      item
        Name = 'Quote'
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
      '        Email,'
      '        Company_Reg_No,'
      '        Registered_Office_Address,'
      '        VAT_Registration_No'
      'from Company'
      'where Company = 1'
      ' ')
    Left = 173
    Top = 128
  end
  object qryReportOld: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select  Quote.*,'
      '        Operator.Name as Office_Contact_Name,'
      '        Price_Unit.Price_unit_Factor,'
      '        Price_unit.Description as Price_unit_Description'
      'FROM Price_Unit'
      '      RIGHT JOIN (Operator'
      '      INNER JOIN Quote'
      '          ON Operator.Operator = Quote.Office_Contact)'
      '          ON Price_Unit.Price_Unit = Quote.Price_unit'
      'where Quote.Quote = :Quote')
    Left = 371
    Top = 278
    ParamData = <
      item
        Name = 'Quote'
      end>
  end
end
