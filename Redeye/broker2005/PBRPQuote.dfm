object frmPBRPQuote: TfrmPBRPQuote
  Left = 252
  Top = 0
  Caption = 'Quote Print'
  ClientHeight = 827
  ClientWidth = 896
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  
  TextHeight = 13
  object qrpDetails: TQuickRep
    Left = 32
    Top = 32
    Width = 794
    Height = 1123
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
      Left = 19
      Top = 38
      Width = 756
      Height = 179
      Frame.DrawBottom = True
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        473.604166666666700000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object qrlblQuoteCaption: TQRLabel
        Left = 8
        Top = 0
        Width = 136
        Height = 38
        Size.Values = (
          100.541666666666700000
          21.166666666666670000
          0.000000000000000000
          359.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Estimate'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -32
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 24
      end
      object QRDBText2: TQRDBText
        Left = 719
        Top = 100
        Width = 30
        Height = 15
        Size.Values = (
          39.687500000000000000
          1902.354166666667000000
          264.583333333333300000
          79.375000000000000000)
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
      object QRLabel3: TQRLabel
        Left = 581
        Top = 100
        Width = 60
        Height = 15
        Size.Values = (
          39.687500000000000000
          1537.229166666667000000
          264.583333333333300000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Estimate No:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRDBText5: TQRDBText
        Left = 30
        Top = 155
        Width = 403
        Height = 15
        Size.Values = (
          39.687500000000000000
          79.375000000000000000
          410.104166666666700000
          1066.270833333333000000)
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
      object gtQRLabel1: TQRLabel
        Left = 440
        Top = 155
        Width = 49
        Height = 15
        Size.Values = (
          39.687500000000000000
          1164.166666666667000000
          410.104166666666700000
          129.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Quantity:'
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
      object gtQRDBText2: TQRDBText
        Left = 496
        Top = 155
        Width = 46
        Height = 15
        Size.Values = (
          39.687500000000000000
          1312.333333333333000000
          410.104166666666700000
          121.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Quantity'
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
      object qrmAddress: TQRMemo
        Left = 80
        Top = 62
        Width = 262
        Height = 83
        Size.Values = (
          219.604166666666700000
          211.666666666666700000
          164.041666666666700000
          693.208333333333200000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object qrlblContactName: TQRLabel
        Left = 80
        Top = 46
        Width = 85
        Height = 15
        Size.Values = (
          39.687500000000000000
          211.666666666666700000
          121.708333333333300000
          224.895833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblContactName'
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
      object QRDBText3: TQRDBText
        Left = 642
        Top = 139
        Width = 107
        Height = 15
        Size.Values = (
          39.687500000000000000
          1698.625000000000000000
          367.770833333333300000
          283.104166666666700000)
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
      object gtQRLabel2: TQRLabel
        Left = 615
        Top = 119
        Width = 26
        Height = 15
        Size.Values = (
          39.687500000000000000
          1627.187500000000000000
          314.854166666666700000
          68.791666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object gtQRDBText7: TQRDBText
        Left = 697
        Top = 119
        Width = 52
        Height = 15
        Size.Values = (
          39.687500000000000000
          1844.145833333333000000
          314.854166666666700000
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
      object QRLabel4: TQRLabel
        Left = 567
        Top = 139
        Width = 74
        Height = 15
        Size.Values = (
          39.687500000000000000
          1500.187500000000000000
          367.770833333333300000
          195.791666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Office Contact:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object gtQRLabel8: TQRLabel
        Left = 8
        Top = 44
        Width = 13
        Height = 15
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          116.416666666666700000
          34.395833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'To'
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
      object gtQRLabel5: TQRLabel
        Left = 7
        Top = 155
        Width = 18
        Height = 15
        Size.Values = (
          39.687500000000000000
          18.520833333333330000
          410.104166666666700000
          47.625000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Re:'
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
    end
    object qrgQuote: TQRGroup
      Left = 19
      Top = 217
      Width = 756
      Height = 2
      AlignToBottom = False
      BeforePrint = qrgQuoteBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        5.291666666666667000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'Quote'
      FooterBand = qrgfQuote
      Master = qrpDetails
      ReprintOnNewPage = False
    end
    object qrbPageFooter: TQRBand
      Left = 19
      Top = 454
      Width = 756
      Height = 46
      Frame.DrawTop = True
      AlignToBottom = False
      BeforePrint = qrbPageFooterBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        121.708333333333300000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object gtQRLabel37: TQRLabel
        Left = 469
        Top = 13
        Width = 136
        Height = 17
        Size.Values = (
          44.979166666666670000
          1240.895833333333000000
          34.395833333333330000
          359.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TOTAL QUOTE PRICE'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtlblQuoteTotalSales: TQRLabel
        Left = 580
        Top = 13
        Width = 134
        Height = 17
        Size.Values = (
          44.979166666666670000
          1534.583333333333000000
          34.395833333333330000
          354.541666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'gtlblQuoteTotalSales'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object qrgfQuote: TQRBand
      Left = 19
      Top = 451
      Width = 756
      Height = 3
      AlignToBottom = False
      BeforePrint = qrgfQuoteBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        7.937500000000000000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
    end
    object ReportImage: TQRImage
      Left = 434
      Top = 39
      Width = 343
      Height = 82
      Size.Values = (
        216.958333333333400000
        1148.291666666667000000
        103.187500000000000000
        907.520833333333400000)
      XLColumn = 0
      XLNumFormat = nfGeneral
      ActiveInPreview = False
      Stretch = True
    end
    object qrbOvers: TQRChildBand
      Left = 19
      Top = 500
      Width = 756
      Height = 176
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        465.666666666666700000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = qrbPageFooter
      PrintOrder = cboAfterParent
      object gtQRLabel13: TQRLabel
        Left = 8
        Top = 8
        Width = 37
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          21.166666666666670000
          97.895833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Overs:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtQRLabel14: TQRLabel
        Left = 8
        Top = 24
        Width = 484
        Height = 15
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          63.500000000000000000
          1280.583333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          'Please confirm how you would like us to deal with any print over' +
          's by ticking the relevant box below:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
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
      object gtQRLabel15: TQRLabel
        Left = 8
        Top = 48
        Width = 325
        Height = 15
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          127.000000000000000000
          859.895833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'DELIVER ALL/PART OVERS BACK TO THE CLIENT @ '#163'60 per pallet'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
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
      object gtQRLabel16: TQRLabel
        Left = 8
        Top = 72
        Width = 370
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          190.500000000000000000
          978.958333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'RETURN ALL/PART OVERS BACK TO FMM STOCK @ '#163'5 per pallet per week'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
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
      object gtQRLabel17: TQRLabel
        Left = 8
        Top = 96
        Width = 224
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          254.000000000000000000
          592.666666666666800000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'DESTROY ALL/PART OVERS @ '#163'20 per pallet'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
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
      object gtQRLabel18: TQRLabel
        Left = 8
        Top = 120
        Width = 524
        Height = 15
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          317.500000000000000000
          1386.416666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          'Should you wish to proceed to the order stage then please sign, ' +
          'date & confirm your PO No & send/fax back'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
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
      object gtQRShape1: TQRShape
        Left = 464
        Top = 43
        Height = 24
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
        Left = 464
        Top = 66
        Height = 24
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
        Left = 464
        Top = 89
        Height = 24
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
        Left = 8
        Top = 156
        Width = 323
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          412.750000000000000000
          854.604166666666800000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          'Signature:  ....................................................' +
          '.....................................'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
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
      object gtQRLabel20: TQRLabel
        Left = 384
        Top = 156
        Width = 143
        Height = 17
        Size.Values = (
          44.979166666666670000
          1016.000000000000000000
          412.750000000000000000
          378.354166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date:  .....................................'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
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
      object gtQRLabel21: TQRLabel
        Left = 592
        Top = 156
        Width = 151
        Height = 17
        Size.Values = (
          44.979166666666670000
          1566.333333333333000000
          412.750000000000000000
          399.520833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'PO No:  .....................................'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
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
    object qrbPostage: TQRChildBand
      Left = 19
      Top = 676
      Width = 756
      Height = 215
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        568.854166666666700000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = qrbOvers
      PrintOrder = cboAfterParent
      object gtQRLabel32: TQRLabel
        Left = 8
        Top = 112
        Width = 663
        Height = 28
        Size.Values = (
          74.083333333333340000
          21.166666666666670000
          296.333333333333400000
          1754.187500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 
          '                                        to sight of materials su' +
          'pplied, machine suitability, machine space/timings and our machi' +
          'ne specifications which requires a minimum of 15mm clearance whe' +
          're applicable.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
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
      object gtQRLabel31: TQRLabel
        Left = 8
        Top = 80
        Width = 663
        Height = 28
        Size.Values = (
          74.083333333333340000
          21.166666666666670000
          211.666666666666700000
          1754.187500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 
          '                       not despatched on the clients own postage' +
          ' docket i.e. going on Formpromm'#39's postage docket WILL NOT be des' +
          'patched until cleared postage funds are in Formpromm'#39's postage a' +
          'ccount & will incur a 3% handling surcharge.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
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
      object gtQRLabel25: TQRLabel
        Left = 8
        Top = 62
        Width = 72
        Height = 15
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          164.041666666666700000
          190.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Variable data'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
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
      object gtQRLabel22: TQRLabel
        Left = 8
        Top = 8
        Width = 49
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          21.166666666666670000
          129.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Postage:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtQRLabel23: TQRLabel
        Left = 8
        Top = 24
        Width = 605
        Height = 15
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          63.500000000000000000
          1600.729166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          'For a real alternative to Royal Mail please email: postalservice' +
          's@formpromm.co.uk for a free Down Stream Access data audit'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
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
      object gtQRLabel24: TQRLabel
        Left = 8
        Top = 43
        Width = 363
        Height = 15
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          113.770833333333300000
          960.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'PLEASE READ THE FOLLOWING IMPORTANT NOTES & CONDITIONS'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsItalic, fsUnderline]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtQRLabel26: TQRLabel
        Left = 8
        Top = 80
        Width = 65
        Height = 15
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          211.666666666666700000
          171.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'All mailings'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
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
      object gtQRLabel27: TQRLabel
        Left = 8
        Top = 112
        Width = 118
        Height = 15
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          296.333333333333400000
          312.208333333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'All prices are subject'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
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
      object gtQRLabel28: TQRLabel
        Left = 8
        Top = 144
        Width = 73
        Height = 15
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          381.000000000000000000
          193.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'All deliveries'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
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
      object gtQRLabel29: TQRLabel
        Left = 8
        Top = 163
        Width = 74
        Height = 15
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          431.270833333333300000
          195.791666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'All prices are'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
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
      object gtQRLabel30: TQRLabel
        Left = 8
        Top = 189
        Width = 61
        Height = 15
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          500.062500000000000000
          161.395833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Our TERMS'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
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
      object gtQRLabel12: TQRLabel
        Left = 84
        Top = 62
        Width = 523
        Height = 15
        Size.Values = (
          39.687500000000000000
          222.250000000000000000
          164.041666666666700000
          1383.770833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          'is required as ASCII comma or piped delimited format or fixed fi' +
          'eld and can be received via Email, CD or SFPT'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
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
      object gtQRLabel33: TQRLabel
        Left = 77
        Top = 144
        Width = 341
        Height = 15
        Size.Values = (
          39.687500000000000000
          203.729166666666700000
          381.000000000000000000
          902.229166666666800000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          ', collections and additional storage requirements are charged as' +
          ' extra.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
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
      object gtQRLabel34: TQRLabel
        Left = 82
        Top = 163
        Width = 212
        Height = 15
        Size.Values = (
          39.687500000000000000
          216.958333333333300000
          431.270833333333300000
          560.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'exclusive of VAT and are valid for 30 days.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
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
      object gtQRLabel35: TQRLabel
        Left = 72
        Top = 189
        Width = 348
        Height = 15
        Size.Values = (
          39.687500000000000000
          190.500000000000000000
          500.062500000000000000
          920.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          'of payment are STRICTLY 30 days unless otherwise previously agre' +
          'ed.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
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
    object qrbDeptDetail: TQRSubDetail
      Left = 19
      Top = 242
      Width = 756
      Height = 19
      AlignToBottom = False
      BeforePrint = qrbDeptDetailBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        50.270833333333330000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpDetails
      DataSet = qryReportDepts
      FooterBand = qrbDeptFooter
      PrintBefore = False
      PrintIfEmpty = True
      object SpecMemo: TQRMemo
        Left = 9
        Top = 2
        Width = 736
        Height = 17
        Size.Values = (
          44.979166666666670000
          23.812500000000000000
          5.291666666666667000
          1947.333333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
    end
    object qrbLineDetail: TQRSubDetail
      Left = 19
      Top = 312
      Width = 756
      Height = 19
      AlignToBottom = False
      BeforePrint = qrbLineDetailBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        50.270833333333330000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpDetails
      DataSet = qryReportlines
      PrintBefore = False
      PrintIfEmpty = True
      object gtQRDBText3: TQRDBText
        Left = 456
        Top = 1
        Width = 57
        Height = 15
        Size.Values = (
          39.687500000000000000
          1206.500000000000000000
          2.645833333333333000
          150.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReportlines
        DataField = 'Quantity'
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
      object gtQRDBText4: TQRDBText
        Left = 520
        Top = 1
        Width = 55
        Height = 15
        Size.Values = (
          39.687500000000000000
          1375.833333333333000000
          2.645833333333333000
          145.520833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReportlines
        DataField = 'unit_price'
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
      object gtQRDBText1: TQRDBText
        Left = 8
        Top = 1
        Width = 457
        Height = 15
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          2.645833333333333000
          1209.145833333333000000)
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
      object gtlblTotalPrice: TQRLabel
        Left = 647
        Top = 1
        Width = 67
        Height = 15
        Size.Values = (
          39.687500000000000000
          1711.854166666667000000
          2.645833333333333000
          177.270833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'gtlblTotalPrice'
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
      object gtQRDBText12: TQRDBText
        Left = 592
        Top = 1
        Width = 63
        Height = 15
        Size.Values = (
          39.687500000000000000
          1566.333333333333000000
          2.645833333333333000
          166.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReportlines
        DataField = 'Price_Unit_Description'
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
      object gtlblReference: TQRLabel
        Left = 727
        Top = 1
        Width = 71
        Height = 15
        Size.Values = (
          39.687500000000000000
          1923.520833333333000000
          2.645833333333333000
          187.854166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'gtlblReference'
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
    object qrbSupplyHeader: TQRBand
      Left = 19
      Top = 377
      Width = 756
      Height = 28
      AlignToBottom = False
      BeforePrint = qrbSupplyHeaderBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        74.083333333333330000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupHeader
      object gtQRLabel9: TQRLabel
        Left = 8
        Top = 7
        Width = 55
        Height = 15
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          18.520833333333330000
          145.520833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'To Supply'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
    end
    object qrbSupplyLines: TQRSubDetail
      Left = 19
      Top = 405
      Width = 756
      Height = 19
      AlignToBottom = False
      BeforePrint = qrbSupplyLinesBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        50.270833333333330000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpDetails
      DataSet = qryReportSupply
      FooterBand = qrbSupplyFooter
      HeaderBand = qrbSupplyHeader
      PrintBefore = False
      PrintIfEmpty = True
      object gtQRDBText6: TQRDBText
        Left = 8
        Top = 1
        Width = 457
        Height = 15
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          2.645833333333333000
          1209.145833333333000000)
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
      object gtQRDBText9: TQRDBText
        Left = 456
        Top = 1
        Width = 57
        Height = 15
        Size.Values = (
          39.687500000000000000
          1206.500000000000000000
          2.645833333333333000
          150.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReportSupply
        DataField = 'Quantity'
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
      object gtQRDBText10: TQRDBText
        Left = 520
        Top = 1
        Width = 55
        Height = 15
        Size.Values = (
          39.687500000000000000
          1375.833333333333000000
          2.645833333333333000
          145.520833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReportSupply
        DataField = 'Unit_price'
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
      object gtlblSupplyPrice: TQRLabel
        Left = 637
        Top = 1
        Width = 77
        Height = 15
        Size.Values = (
          39.687500000000000000
          1685.395833333333000000
          2.645833333333333000
          203.729166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'gtlblSupplyPrice'
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
      object gtQRDBText13: TQRDBText
        Left = 592
        Top = 1
        Width = 63
        Height = 15
        Size.Values = (
          39.687500000000000000
          1566.333333333333000000
          2.645833333333333000
          166.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReportSupply
        DataField = 'Price_Unit_Description'
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
    object qrbDeptFooter: TQRBand
      Left = 19
      Top = 261
      Width = 756
      Height = 23
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.Width = 2
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        60.854166666666670000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object gtQRLabel3: TQRLabel
        Left = 8
        Top = 5
        Width = 55
        Height = 15
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          13.229166666666670000
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
      object gtQRLabel4: TQRLabel
        Left = 468
        Top = 5
        Width = 41
        Height = 15
        Size.Values = (
          39.687500000000000000
          1238.250000000000000000
          13.229166666666670000
          108.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Quantity'
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
      object gtQRLabel6: TQRLabel
        Left = 528
        Top = 5
        Width = 46
        Height = 15
        Size.Values = (
          39.687500000000000000
          1397.000000000000000000
          13.229166666666670000
          121.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Unit Price'
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
      object gtQRLabel7: TQRLabel
        Left = 661
        Top = 5
        Width = 51
        Height = 15
        Size.Values = (
          39.687500000000000000
          1748.895833333333000000
          13.229166666666670000
          134.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total Price'
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
      object gtQRLabel11: TQRLabel
        Left = 592
        Top = 5
        Width = 46
        Height = 15
        Size.Values = (
          39.687500000000000000
          1566.333333333333000000
          13.229166666666670000
          121.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Price Unit'
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
      object gtQRLabel36: TQRLabel
        Left = 725
        Top = 5
        Width = 21
        Height = 15
        Size.Values = (
          39.687500000000000000
          1918.229166666667000000
          13.229166666666670000
          55.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Ref.'
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
    object qrbLineQHeader: TQRGroup
      Left = 19
      Top = 284
      Width = 756
      Height = 2
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        5.291666666666667000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'Quote'
      FooterBand = qrbLineQFooter
      Master = qrbLineDetail
      ReprintOnNewPage = False
    end
    object qrbDeptHeader: TQRGroup
      Left = 19
      Top = 219
      Width = 756
      Height = 23
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        60.854166666666670000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'Process_group_Description'
      Master = qrbDeptDetail
      ReprintOnNewPage = False
      object gtQRDBText8: TQRDBText
        Left = 8
        Top = 6
        Width = 425
        Height = 15
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          15.875000000000000000
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
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
    object qrbLineHeader: TQRGroup
      Left = 19
      Top = 286
      Width = 756
      Height = 26
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        68.791666666666670000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'Product_Type_Description'
      Master = qrbLineDetail
      ReprintOnNewPage = False
      object gtQRDBText5: TQRDBText
        Left = 8
        Top = 7
        Width = 425
        Height = 15
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          18.520833333333330000
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
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
    object qrbLineQFooter: TQRBand
      Left = 19
      Top = 331
      Width = 756
      Height = 46
      AlignToBottom = False
      BeforePrint = qrbLineQFooterBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        121.708333333333300000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object gtQRLabel10: TQRLabel
        Left = 547
        Top = 5
        Width = 59
        Height = 15
        Size.Values = (
          39.687500000000000000
          1447.270833333333000000
          13.229166666666670000
          156.104166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Total Price'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtlblTotalSales: TQRLabel
        Left = 632
        Top = 5
        Width = 82
        Height = 15
        Size.Values = (
          39.687500000000000000
          1672.166666666667000000
          13.229166666666670000
          216.958333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'gtlblTotalSales'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtlblUnitPrice: TQRLabel
        Left = 640
        Top = 26
        Width = 74
        Height = 15
        Size.Values = (
          39.687500000000000000
          1693.333333333333000000
          68.791666666666670000
          195.791666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'gtlblUnitPrice'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtlblPriceUnit: TQRLabel
        Left = 532
        Top = 26
        Width = 74
        Height = 15
        Size.Values = (
          39.687500000000000000
          1407.583333333333000000
          68.791666666666670000
          195.791666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qtlblUnitPrice'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
    end
    object qrbSupplyFooter: TQRBand
      Left = 19
      Top = 424
      Width = 756
      Height = 27
      AlignToBottom = False
      BeforePrint = qrbSupplyFooterBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        71.437500000000000000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object gtQRLabel38: TQRLabel
        Left = 461
        Top = 5
        Width = 145
        Height = 15
        Size.Values = (
          39.687500000000000000
          1219.729166666667000000
          13.229166666666670000
          383.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Total Supplied items Price'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtlblTotalSupplied: TQRLabel
        Left = 614
        Top = 5
        Width = 100
        Height = 15
        Size.Values = (
          39.687500000000000000
          1624.541666666667000000
          13.229166666666670000
          264.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'gtlblTotalSupplied'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
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
    Top = 46
    ParamData = <
      item
        Name = 'Quote'
        DataType = ftFloat
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
      'Customer_Branch.Use_Branch_Name'
      'from'
      '  Customer_Branch, Customer'
      'where'
      '  ((Customer_Branch.Customer = :Customer) and'
      '   (Branch_no = :Branch_no)) and'
      '  Customer_Branch.Customer = Customer.Customer')
    Left = 464
    Top = 48
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
    Left = 72
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
      '        Price_unit.Description as Price_unit_Description,'
      '        Product_Type.Description as Product_Type_Description'
      'FROM Quote_Line, Price_Unit, Product_Type'
      'WHERE Quote = :Quote and'
      '(Quote_Line.Price_Unit = Price_Unit.Price_Unit) and'
      '(Quote_Line.Product_Type = Product_Type.Product_Type)'
      'ORDER BY Quote_Line.Sequence_no'
      '')
    Left = 368
    Top = 112
    ParamData = <
      item
        Name = 'Quote'
        DataType = ftFloat
      end>
    object qryReportlinesQuote: TFloatField
      FieldName = 'Quote'
    end
    object qryReportlinesQuote_Line_no: TIntegerField
      FieldName = 'Quote_Line_no'
    end
    object qryReportlinesQuote_Line_description: TWideStringField
      FieldName = 'Quote_Line_description'
      FixedChar = True
      Size = 255
    end
    object qryReportlinesUnit_Cost: TCurrencyField
      FieldName = 'Unit_Cost'
      DisplayFormat = '##0.00'
    end
    object qryReportlinesUnit_Price: TCurrencyField
      FieldName = 'Unit_Price'
      DisplayFormat = #163'##,##0.00'
    end
    object qryReportlinesPrice_Unit: TIntegerField
      FieldName = 'Price_Unit'
    end
    object qryReportlinesQuantity: TFloatField
      FieldName = 'Quantity'
    end
    object qryReportlinesProduct_Type: TIntegerField
      FieldName = 'Product_Type'
    end
    object qryReportlinesLine_Converted: TWideStringField
      FieldName = 'Line_Converted'
      FixedChar = True
      Size = 2
    end
    object qryReportlinesSequence_No: TIntegerField
      FieldName = 'Sequence_No'
    end
    object qryReportlinesUnit_SSP: TCurrencyField
      FieldName = 'Unit_SSP'
      DisplayFormat = '##0.00'
    end
    object qryReportlinesNo_of_hours: TFloatField
      FieldName = 'No_of_hours'
    end
    object qryReportlinesUnit_Cost_plus_OHD: TCurrencyField
      FieldName = 'Unit_Cost_plus_OHD'
      DisplayFormat = '##0.00'
    end
    object qryReportlinesUnit_SSP_Original: TCurrencyField
      FieldName = 'Unit_SSP_Original'
      DisplayFormat = '##0.00'
    end
    object qryReportlinesWork_Centre_Group: TIntegerField
      FieldName = 'Work_Centre_Group'
    end
    object qryReportlinesWork_Centre: TIntegerField
      FieldName = 'Work_Centre'
    end
    object qryReportlinesTeam_Count: TIntegerField
      FieldName = 'Team_Count'
    end
    object qryReportlinesProcess: TIntegerField
      FieldName = 'Process'
    end
    object qryReportlinesCosting_Tool_Flag: TWideStringField
      FieldName = 'Costing_Tool_Flag'
      FixedChar = True
      Size = 2
    end
    object qryReportlinesCost_Number: TIntegerField
      FieldName = 'Cost_Number'
    end
    object qryReportlinesCategory_Number: TIntegerField
      FieldName = 'Category_Number'
    end
    object qryReportlinesSub_Category: TIntegerField
      FieldName = 'Sub_Category'
    end
    object qryReportlinesPrice_Unit_factor: TFloatField
      FieldName = 'Price_Unit_factor'
    end
    object qryReportlinesPrice_unit_Description: TWideStringField
      FieldName = 'Price_unit_Description'
      FixedChar = True
      Size = 80
    end
    object qryReportlinesProduct_Type_Description: TWideStringField
      FieldName = 'Product_Type_Description'
      FixedChar = True
      Size = 80
    end
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
      #9'EnquiryLine.Form_Description'
      'FROM EnquiryLine'
      #9'RIGHT JOIN (Price_Unit'
      #9'INNER JOIN Quote_Supply'
      #9#9'ON Price_Unit.Price_Unit = Quote_Supply.Price_Unit)'
      
        #9#9'ON (EnquiryLine.Line = Quote_Supply.Line) AND (EnquiryLine.Enq' +
        'uiry = Quote_Supply.Enquiry)'
      'WHERE Quote_Supply.Quote =  :Quote'
      'ORDER BY Quote_Supply.Quote_Supply_No')
    Left = 323
    Top = 342
    ParamData = <
      item
        Name = 'Quote'
        DataType = ftFloat
      end>
    object qryReportSupplyQuote: TFloatField
      FieldName = 'Quote'
    end
    object qryReportSupplyQuote_Supply_No: TIntegerField
      FieldName = 'Quote_Supply_No'
    end
    object qryReportSupplyEnquiry: TIntegerField
      FieldName = 'Enquiry'
    end
    object qryReportSupplyLine: TIntegerField
      FieldName = 'Line'
    end
    object qryReportSupplyLine_Converted: TWideStringField
      FieldName = 'Line_Converted'
      FixedChar = True
      Size = 2
    end
    object qryReportSupplyQuantity: TFloatField
      FieldName = 'Quantity'
    end
    object qryReportSupplyQuote_Supply_Description: TWideStringField
      FieldName = 'Quote_Supply_Description'
      FixedChar = True
      Size = 255
    end
    object qryReportSupplyUnit_Cost: TCurrencyField
      FieldName = 'Unit_Cost'
    end
    object qryReportSupplyUnit_Price: TCurrencyField
      FieldName = 'Unit_Price'
      DisplayFormat = #163'##,##0.00'
    end
    object qryReportSupplyPrice_Unit: TIntegerField
      FieldName = 'Price_Unit'
    end
    object qryReportSupplyPrice_Unit_Factor: TFloatField
      FieldName = 'Price_Unit_Factor'
    end
    object qryReportSupplyPrice_Unit_Description: TWideStringField
      FieldName = 'Price_Unit_Description'
      FixedChar = True
      Size = 80
    end
    object qryReportSupplyForm_Description: TWideStringField
      FieldName = 'Form_Description'
      FixedChar = True
      Size = 160
    end
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
      'Postcode'
      'from'
      '  Ad_Hoc_Address'
      'where'
      '  Ad_Hoc_Address.Ad_hoc_Address = :Ad_hoc_Address')
    Left = 560
    Top = 48
    ParamData = <
      item
        Name = 'Ad_hoc_Address'
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
    Left = 427
    Top = 230
    ParamData = <
      item
        Name = 'Quote'
      end>
  end
  object qryReportDepts: TFDQuery
    MasterSource = dtsReport
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select'
      '    Quote_Process_Group.Quote,'
      '    Quote_process_Group.Process_Group,'
      '    Quote_Process_group.Quote_Specification,'
      '    Process_group.Process_group_Description,'
      '    Process_Group.Sequence_no'
      'From  Quote_Process_Group,'
      '      Process_Group'
      'Where Quote_Process_group.Quote = :Quote and'
      
        '      Quote_process_group.Process_group = Process_group.Process_' +
        'group'
      'Order By Process_group.Sequence_no')
    Left = 344
    Top = 176
    ParamData = <
      item
        Name = 'Quote'
      end>
  end
  object qryCosts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Process_Cost'
      'where Customer = :Customer and '
      'Process = :Process and '
      'Cost_Number = :Cost_Number')
    Left = 643
    Top = 49
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Process'
      end
      item
        Name = 'Cost_Number'
      end>
  end
end
