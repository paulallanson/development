object PBRPJBDraftFrm: TPBRPJBDraftFrm
  Left = 60
  Top = 44
  Caption = 'Draft Sales Invoice Print'
  ClientHeight = 741
  ClientWidth = 1028
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 13
  object qrpDetails: TQuickRep
    Left = 8
    Top = 8
    Width = 794
    Height = 1123
    ShowingPreview = False
    BeforePrint = qrpDetailsBeforePrint
    DataSet = GetOrdHedQuery
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
      200.000000000000000000
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
    object PageHeaderQRBand: TQRBand
      Left = 0
      Top = 19
      Width = 794
      Height = 398
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        1053.041666666667000000
        2100.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object ReportTitleQRLabel: TQRLabel
        Left = 456
        Top = 288
        Width = 91
        Height = 20
        Size.Values = (
          52.916666666666670000
          1206.500000000000000000
          762.000000000000000000
          240.770833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Job Bag No'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object OrdNumQRLabel: TQRLabel
        Left = 566
        Top = 288
        Width = 115
        Height = 20
        Size.Values = (
          52.916666666666670000
          1497.541666666667000000
          762.000000000000000000
          304.270833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Order Number:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object OrdDateQRLabel: TQRLabel
        Left = 456
        Top = 190
        Width = 70
        Height = 17
        Size.Values = (
          44.979166666666670000
          1206.500000000000000000
          502.708333333333300000
          185.208333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Order Date'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object SalesOrdDateQRLabel: TQRLabel
        Left = 566
        Top = 190
        Width = 68
        Height = 17
        Size.Values = (
          44.979166666666670000
          1497.541666666667000000
          502.708333333333300000
          179.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Order Date:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object CustomerAddmemo: TQRMemo
        Left = 64
        Top = 193
        Width = 313
        Height = 119
        Size.Values = (
          314.854166666666700000
          169.333333333333300000
          510.645833333333300000
          828.145833333333200000)
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
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLblWho: TQRLabel
        Left = 456
        Top = 214
        Width = 86
        Height = 17
        Size.Values = (
          44.979166666666670000
          1206.500000000000000000
          566.208333333333300000
          227.541666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Your Contact:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLblCntct: TQRLabel
        Left = 565
        Top = 214
        Width = 194
        Height = 17
        Size.Values = (
          44.979166666666670000
          1494.895833333333000000
          566.208333333333400000
          513.291666666666800000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Contact'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLblCustRef: TQRLabel
        Left = 456
        Top = 239
        Width = 55
        Height = 17
        Size.Values = (
          44.979166666666670000
          1206.500000000000000000
          632.354166666666700000
          145.520833333333300000)
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
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLblRef: TQRLabel
        Left = 566
        Top = 239
        Width = 195
        Height = 17
        Size.Values = (
          44.979166666666670000
          1497.541666666667000000
          632.354166666666800000
          515.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = '123456789012345678901234'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLblReqDt: TQRLabel
        Left = 566
        Top = 263
        Width = 68
        Height = 17
        Size.Values = (
          44.979166666666670000
          1497.541666666667000000
          695.854166666666700000
          179.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Order Date:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLblDtReq: TQRLabel
        Left = 456
        Top = 263
        Width = 92
        Height = 17
        Size.Values = (
          44.979166666666670000
          1206.500000000000000000
          695.854166666666700000
          243.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date Required'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel12: TQRLabel
        Left = 654
        Top = 377
        Width = 38
        Height = 17
        Size.Values = (
          44.979166666666670000
          1730.375000000000000000
          997.479166666666700000
          100.541666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Value'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel7: TQRLabel
        Left = 503
        Top = 377
        Width = 34
        Height = 17
        Size.Values = (
          44.979166666666670000
          1330.854166666667000000
          997.479166666666700000
          89.958333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Price'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object OrdQtyQRLabel: TQRLabel
        Left = 555
        Top = 377
        Width = 63
        Height = 17
        Size.Values = (
          44.979166666666670000
          1468.437500000000000000
          997.479166666666700000
          166.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Price Unit'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel3: TQRLabel
        Left = 390
        Top = 377
        Width = 68
        Height = 17
        Size.Values = (
          44.979166666666670000
          1031.875000000000000000
          997.479166666666900000
          179.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Quantity'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object DescQRLabel: TQRLabel
        Left = 24
        Top = 377
        Width = 72
        Height = 17
        Size.Values = (
          44.979166666666670000
          63.500000000000000000
          997.479166666666700000
          190.500000000000000000)
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
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel2: TQRLabel
        Left = 740
        Top = 377
        Width = 27
        Height = 17
        Size.Values = (
          44.979166666666670000
          1957.916666666667000000
          997.479166666666700000
          71.437500000000000000)
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
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel1: TQRLabel
        Left = 24
        Top = 336
        Width = 50
        Height = 17
        Size.Values = (
          44.979166666666670000
          63.500000000000000000
          889.000000000000000000
          132.291666666666700000)
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
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object lblJobBagDescription: TQRLabel
        Left = 86
        Top = 336
        Width = 122
        Height = 17
        Size.Values = (
          44.979166666666670000
          227.541666666666700000
          889.000000000000000000
          322.791666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'lblJobBagDescription'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblRevenueCentre: TQRLabel
        Left = 456
        Top = 320
        Width = 107
        Height = 17
        Size.Values = (
          44.979166666666670000
          1206.500000000000000000
          846.666666666666700000
          283.104166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Revenue Centre:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblRevenueCentreData: TQRLabel
        Left = 565
        Top = 320
        Width = 194
        Height = 17
        Size.Values = (
          44.979166666666670000
          1494.895833333333000000
          846.666666666666600000
          513.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Revenue Centre'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object imgReport: TQRImage
        Left = 80
        Top = 17
        Width = 633
        Height = 136
        Enabled = False
        Size.Values = (
          359.833333333333400000
          211.666666666666700000
          44.979166666666670000
          1674.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Stretch = True
      end
      object qrlblReportTitle: TQRLabel
        Left = 640
        Top = 16
        Width = 130
        Height = 35
        Size.Values = (
          92.604166666666670000
          1693.333333333333000000
          42.333333333333330000
          343.958333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Proforma'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -29
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 22
      end
    end
    object FooterQRBand: TQRBand
      Left = 0
      Top = 462
      Width = 794
      Height = 243
      AfterPrint = FooterQRBandAfterPrint
      AlignToBottom = True
      BeforePrint = FooterQRBandBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        642.937500000000000000
        2100.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRLabel14: TQRLabel
        Left = 542
        Top = 62
        Width = 58
        Height = 20
        Size.Values = (
          52.916666666666670000
          1434.041666666667000000
          164.041666666666700000
          153.458333333333300000)
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
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object GoodsValueLbl: TQRLabel
        Left = 604
        Top = 62
        Width = 89
        Height = 21
        Size.Values = (
          55.562500000000000000
          1598.083333333333000000
          164.041666666666700000
          235.479166666666700000)
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
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel15: TQRLabel
        Left = 536
        Top = 86
        Width = 63
        Height = 20
        Size.Values = (
          52.916666666666670000
          1418.166666666667000000
          227.541666666666700000
          166.687500000000000000)
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
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object VATValueLbl: TQRLabel
        Left = 617
        Top = 86
        Width = 76
        Height = 20
        Size.Values = (
          52.916666666666670000
          1632.479166666667000000
          227.541666666666700000
          201.083333333333300000)
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
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object TotalValueLbl: TQRLabel
        Left = 614
        Top = 110
        Width = 79
        Height = 20
        Size.Values = (
          52.916666666666670000
          1624.541666666667000000
          291.041666666666700000
          209.020833333333300000)
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
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel16: TQRLabel
        Left = 526
        Top = 110
        Width = 72
        Height = 20
        Size.Values = (
          52.916666666666670000
          1391.708333333333000000
          291.041666666666700000
          190.500000000000000000)
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
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel1: TQRLabel
        Left = 739
        Top = 126
        Width = 34
        Height = 20
        Size.Values = (
          52.916666666666670000
          1955.270833333333000000
          333.375000000000000000
          89.958333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'e&oe'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrshpPaymentNotes: TQRShape
        Left = 24
        Top = 164
        Width = 750
        Height = 77
        Size.Values = (
          203.729166666666700000
          63.500000000000000000
          433.916666666666700000
          1984.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object memPayment: TQRMemo
        Tag = 1
        Left = 28
        Top = 167
        Width = 741
        Height = 66
        Size.Values = (
          174.625000000000000000
          74.083333333333330000
          441.854166666666700000
          1960.562500000000000000)
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
        Font.Height = -12
        Font.Name = 'Formata'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object gtQRShape1: TQRShape
        Left = 24
        Top = 68
        Width = 441
        Height = 93
        Size.Values = (
          246.062500000000000000
          63.500000000000000000
          179.916666666666700000
          1166.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRMemo1: TQRMemo
        Tag = 1
        Left = 28
        Top = 71
        Width = 429
        Height = 82
        Size.Values = (
          216.958333333333300000
          74.083333333333330000
          187.854166666666700000
          1135.062500000000000000)
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
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'NOTE'
          
            'This pro forma invoice is an approximate figure based on the inf' +
            'ormation '
          
            'received at this time. Any additions or subtractions to this fig' +
            'ure will be '
          
            'noted on your actual invoice. We look forward to receiving your ' +
            'payment '
          'by return in order to proceed with your order.')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object gtQRLabel2: TQRLabel
        Left = 158
        Top = 6
        Width = 445
        Height = 33
        Size.Values = (
          87.312500000000000000
          418.041666666666700000
          15.875000000000000000
          1177.395833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'IMMEDIATE PAYMENT REQUIRED'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 20
      end
    end
    object qrsbdJBLines: TQRSubDetail
      Left = 0
      Top = 420
      Width = 794
      Height = 22
      AlignToBottom = False
      BeforePrint = qrsbdJBLinesBeforePrint
      TransparentBand = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        58.208333333333330000
        2100.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpDetails
      DataSet = GetDetsQuery
      PrintBefore = False
      PrintIfEmpty = True
      object lblDescription: TQRLabel
        Left = 24
        Top = 1
        Width = 361
        Height = 16
        Size.Values = (
          42.333333333333340000
          63.500000000000000000
          2.645833333333333000
          955.145833333333500000)
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
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object lblSellPrice: TQRLabel
        Left = 471
        Top = 1
        Width = 66
        Height = 17
        Size.Values = (
          44.979166666666670000
          1246.187500000000000000
          2.645833333333333000
          174.625000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblSellPrice'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object lblSellUnit: TQRLabel
        Left = 560
        Top = 1
        Width = 59
        Height = 17
        Size.Values = (
          44.979166666666670000
          1481.666666666667000000
          2.645833333333333000
          156.104166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblSellUnit'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object lblValue: TQRLabel
        Left = 645
        Top = 1
        Width = 47
        Height = 17
        Size.Values = (
          44.979166666666670000
          1706.562500000000000000
          2.645833333333333000
          124.354166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblValue'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object lblVat: TQRLabel
        Left = 734
        Top = 1
        Width = 34
        Height = 17
        Size.Values = (
          44.979166666666670000
          1942.041666666667000000
          2.645833333333333000
          89.958333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblVat'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object lblQuantity: TQRLabel
        Left = 393
        Top = 1
        Width = 65
        Height = 17
        Size.Values = (
          44.979166666666670000
          1039.812500000000000000
          2.645833333333333000
          171.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'lblQuantity'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrmDescription: TQRRichText
        Left = 24
        Top = 1
        Width = 369
        Height = 16
        Size.Values = (
          42.333333333333340000
          63.500000000000000000
          2.645833333333333000
          976.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AutoStretch = False
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        HiresExport = False
        Transparent = False
        YIncrement = 50
      end
    end
    object pogroupheader: TQRGroup
      Left = 0
      Top = 417
      Width = 794
      Height = 3
      AlignToBottom = False
      BeforePrint = pogroupheaderBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        7.937500000000000000
        2100.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'GetOrdHedQuery.Sel1'
      FooterBand = FooterQRBand
      Master = qrpDetails
      ReprintOnNewPage = True
    end
    object qrsbdAddCharges: TQRSubDetail
      Left = 0
      Top = 442
      Width = 794
      Height = 20
      AlignToBottom = False
      BeforePrint = qrsbdAddChargesBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.916666666666670000
        2100.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrsbdJBLines
      DataSet = qryPOLineChgs
      PrintBefore = False
      PrintIfEmpty = True
      object lblAddDescription: TQRLabel
        Left = 24
        Top = 1
        Width = 369
        Height = 17
        Size.Values = (
          44.979166666666670000
          63.500000000000000000
          2.645833333333333000
          976.312500000000000000)
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
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object lblAddValue: TQRLabel
        Left = 645
        Top = 1
        Width = 47
        Height = 17
        Size.Values = (
          44.979166666666670000
          1706.562500000000000000
          2.645833333333333000
          124.354166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblValue'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object lblAddVAT: TQRLabel
        Left = 734
        Top = 1
        Width = 34
        Height = 17
        Size.Values = (
          44.979166666666670000
          1942.041666666667000000
          2.645833333333333000
          89.958333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblVat'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
  end
  object GetDetsDataSource: TDataSource
    DataSet = GetOrdHedQuery
    Left = 560
    Top = 35
  end
  object GetDetsQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Job_Bag_Line_Dets.Job_Bag,'
      '        Job_Bag_Line_Dets.Job_Bag_Line,'
      '        Job_Bag_Line_Dets.Job_Bag_Line_Type,'
      '        Job_Bag_Line_Dets.Purchase_Order,'
      '        Job_Bag_Line_Dets.Line,'
      '        Job_Bag_Line_Dets.Job_Bag_Line_Descr,'
      '        Job_Bag_Line_Dets.Job_Bag_Line_Cost,'
      '        Job_Bag_Line_Dets.Job_Bag_Line_Sell,'
      '        Job_Bag_Line_Dets.Job_Bag_Line_Invoiced,'
      '        Job_Bag_Line_Dets.Job_Bag_Quantity,'
      '        Job_Bag_Line_Dets.VAT_Code,'
      '        Job_Bag_Line_Dets.Currency_Code,'
      '        Purchase_OrderLine.Selling_Price,'
      '        Vat_Code.Vat_Rate,'
      '        Vat_Code.Description,'
      '        Purchase_OrderLine.Qty_Invoiced,'
      '        Purchase_OrderLine.Quantity,'
      '        Purchase_OrderLine.Sell_Unit,'
      '        Job_Bag_Line_Dets.Price_unit,'
      '        Job_Bag_Line_Dets.Selling_Price as Unit_Price,'
      '        Job_Bag_Line_Dets.Sales_Order,'
      '        Job_Bag_Line_Dets.Sales_Order_Line_no,'
      '        Job_Bag_Line_Dets.Product_Type as JB_Product_Type,'
      '        (select Product_type'
      '         from Purchase_OrderLine'
      
        '         where Purchase_OrderLine.Purchase_Order = Job_Bag_Line_' +
        'Dets.Purchase_Order and'
      
        '               Purchase_OrderLine.Line = Job_Bag_Line_Dets.Line)' +
        ' as Product_Type,'
      
        '        (Purchase_OrderLine.Quantity - Purchase_OrderLine.Qty_In' +
        'voiced) as Invoice_qty,'
      #9'      Job_Bag.Customer,'
      #9'      Job_Bag.Branch_No,'
      #9'      Job_Bag.Date_Point,'
      #9'      Job_Bag.Contact_no,'
      #9'      Job_Bag.Cust_Order_No,'
      #9'      Job_Bag.Goods_Required as Date_Required,'
      '        Job_Bag.Job_Bag_Descr,'
      '        Job_Bag.Invoice_location,'
      '        Customer_Branch.Inv_To_Customer,'
      '        Customer_Branch.Inv_To_Branch,'
      '        (select Invoice_Location_Descr'
      '         from Invoice_Location'
      
        '         where Invoice_Location.Invoice_Location = Job_bag.Invoi' +
        'ce_Location) as Revenue_Centre'
      'FROM Customer_Branch'
      '      INNER JOIN (Vat_Code'
      '      INNER JOIN (Purchase_OrderLine'
      '      RIGHT JOIN (Job_Bag'
      
        '      INNER JOIN Job_Bag_Line_Dets ON Job_Bag.Job_Bag = Job_Bag_' +
        'Line_Dets.Job_Bag)'
      
        '        ON (Purchase_OrderLine.Line = Job_Bag_Line_Dets.Line) AN' +
        'D (Purchase_OrderLine.Purchase_Order = Job_Bag_Line_Dets.Purchas' +
        'e_Order))'
      '        ON Vat_Code.Vat_Code = Job_Bag_Line_Dets.VAT_Code)'
      
        '        ON (Customer_Branch.Branch_no = Job_Bag.Branch_No) AND (' +
        'Customer_Branch.Customer = Job_Bag.Customer)'
      'WHERE Job_Bag_Line_Dets.Job_Bag = :sel1 and'
      '('
      '(((Purchase_OrderLine.purch_ord_line_status < 30) and'
      '(Purchase_OrderLine.Inactive <> '#39'Y'#39') or'
      '(Purchase_orderLine.Inactive is null)) or'
      'Job_Bag_Line_Dets.Purchase_order is null)'
      ') and'
      
        '((Job_Bag_Line_Dets.Job_Bag_Line_Sell > 0) or (:Show_Zero_Values' +
        ' = '#39'Y'#39')) and'
      '((Job_Bag_Line_Dets.Job_Bag_Line_Invoiced is null) or'
      '(Job_Bag_Line_Dets.Job_Bag_Line_Invoiced = '#39'N'#39') or'
      '(Job_Bag_Line_Dets.Job_Bag_Line_Invoiced = '#39'P'#39')) and'
      '(Job_Bag_Line_Dets.Ready_to_invoice = '#39'Y'#39') AND'
      
        '((Job_Bag_Line_Dets.Inactive is null) OR (Job_Bag_Line_Dets.inac' +
        'tive = '#39'N'#39'))'
      
        'ORDER BY Job_Bag_line_dets.Job_Bag, Job_Bag_line_dets.Sequence_n' +
        'o, Job_Bag_Line ')
    Left = 249
    Top = 124
    ParamData = <
      item
        Name = 'sel1'
      end
      item
        Name = 'Show_Zero_Values'
      end>
  end
  object GetOrdHedQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Sel1, text100'
      'from'
      '  Int_Sel'
      'where'
      '  (Int_Sel_Code = :Int_Sel_Code) and'
      '  (Sel1 <> 0) and'
      '  (select count(job_bag_Line)'
      '    from Job_Bag_line_dets'
      
        '    where Job_Bag = text100 and ((Ready_to_invoice = '#39'Y'#39') and (J' +
        'ob_bag_line_invoiced <> '#39'Y'#39'))) > 0'
      'order by'
      '  Sel1'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 462
    Top = 32
    ParamData = <
      item
        Name = 'Int_Sel_Code'
        DataType = ftInteger
      end>
  end
  object GetSOAddQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Customer.Name as DelNam,'
      '          Customer_Branch.Building_no_Name as DelAdd1,'
      '          Customer_Branch.Street as DelAdd2,'
      '          Customer_Branch.Locale as DelAdd3,'
      '          Customer_Branch.Town as DelAdd4,'
      '          Customer_Branch.Postcode as DelAdd5,'
      '          Customer_Branch.Phone as DelAdd6,'
      '          Customer_Branch.Fax_number as DelAdd7'
      'from Sales_order, Customer, Customer_Branch'
      'where Sales_Order.SAles_Order = :Sales_order and'
      '('
      '(Sales_order.Delivery_Customer = Customer_branch.Customer) and'
      '(Sales_order.Delivery_Branch = Customer_branch.Branch_no)'
      ') and'
      '(Customer_branch.Customer = Customer.Customer)'
      ' ')
    Left = 238
    Top = 41
    ParamData = <
      item
        Name = 'Sales_order'
      end>
  end
  object CompSRC: TDataSource
    DataSet = GetCompSQL
    Left = 96
    Top = 79
  end
  object GetCompSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select * from Company'
      'Where Company = 1')
    Left = 96
    Top = 126
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
      '        Phone,'
      '        Fax_Number,'
      '        Email'
      'from Customer_Branch, Customer'
      'where ((Customer_Branch.Customer = :Customer) and'
      #9#9#9'(Branch_no = :Branch_no)) and'
      '        Customer_Branch.Customer = Customer.Customer'
      ' ')
    Left = 406
    Top = 289
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end>
  end
  object AddressSRC: TDataSource
    DataSet = CustSQL
    Left = 352
    Top = 343
  end
  object GetContactSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Customer_Contact.Name as Contact_Name'
      'From  Customer_Contact'
      'Where (Customer_Contact.Contact_No = :Contact_No) and'
      '      (Customer_Contact.Customer = :Customer) and'
      '      (Customer_Contact.Branch_No = :Branch_No)'
      ' '
      ' '
      ' '
      ' ')
    Left = 336
    Top = 42
    ParamData = <
      item
        Name = 'Contact_No'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_No'
      end>
  end
  object GetNarrSQL: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select Narrative_Text'
      'From Narrative_Line'
      'Where (Narrative = :Narrative)'
      'Order By Narrative_Line'
      '')
    Left = 454
    Top = 98
    ParamData = <
      item
        Name = 'Narrative'
      end>
  end
  object qrySOLinePart: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select Sales_Order_Line.Part,'
      '  Part.Price_unit, Part.Part_Description'
      'from Sales_Order_Line, Part'
      'where Sales_Order = :Sales_order and'
      'Sales_order_line_no = :Sales_Order_Line_no and'
      'sales_order_line.Part = Part.Part'
      ' '
      '')
    Left = 240
    Top = 360
    ParamData = <
      item
        Name = 'Sales_order'
      end
      item
        Name = 'Sales_Order_Line_no'
      end>
  end
  object qryGetPriceUnit: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Price_unit'
      'where Price_Unit = :Price_Unit')
    Left = 536
    Top = 248
    ParamData = <
      item
        Name = 'Price_Unit'
      end>
  end
  object qrySOLine: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Sales_Order_Line.Part,'
      
        '      (Quantity_Delivered - Quantity_Invoiced) as Qty_Outstandin' +
        'g,'
      '      Sell_Pack_quantity,'
      '      Quantity_Ordered,'
      '      Quantity_Delivered,'
      '      Part_Sales_Price'
      'from Sales_Order_Line'
      'where Sales_Order = :Sales_order and'
      'Sales_order_line_no = :Sales_Order_Line_no'
      ' ')
    Left = 360
    Top = 384
    ParamData = <
      item
        Name = 'Sales_order'
      end
      item
        Name = 'Sales_Order_Line_no'
      end>
  end
  object qryJBLineChgs: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Job_Bag_Line_Dets.Job_Bag,'
      '        Purchase_OrderLine.Purchase_Order,'
      '        Purchase_OrderLine.Line,'
      '        Purch_Ord_Line_Add_Chg.Additional_charge,'
      '        Purch_Ord_Line_Add_Chg.Details,'
      '        Purch_Ord_Line_Add_Chg.Amount,'
      '        Purch_Ord_Line_Add_Chg.Quotation_Price,'
      '        Product_Type.Nominal,'
      '        Purchase_OrderLine.Customer,'
      '        Customer.VAT_Code_Def AS Vat_Code,'
      '        Purch_Ord_Line_Add_Chg.Vat_Code,'
      '        Vat_Code.Vat_Rate,'
      '        Vat_Code_1.Vat_Rate as Customer_Vat_Rate'
      'FROM Vat_Code AS Vat_Code_1'
      '      INNER JOIN (Vat_Code'
      '      RIGHT JOIN (Product_Type'
      '      INNER JOIN (((Purchase_OrderLine'
      
        '      INNER JOIN Customer ON Purchase_OrderLine.Customer = Custo' +
        'mer.Customer)'
      
        '      INNER JOIN Job_Bag_Line_Dets ON (Purchase_OrderLine.Line =' +
        ' Job_Bag_Line_Dets.Line)'
      
        '        AND (Purchase_OrderLine.Purchase_Order = Job_Bag_Line_De' +
        'ts.Purchase_Order))'
      
        '      INNER JOIN Purch_Ord_Line_Add_Chg ON (Purchase_OrderLine.L' +
        'ine = Purch_Ord_Line_Add_Chg.Line)'
      
        '        AND (Purchase_OrderLine.Purchase_Order = Purch_Ord_Line_' +
        'Add_Chg.Purchase_Order))'
      
        '        ON Product_Type.Product_Type = Purchase_OrderLine.Produc' +
        't_Type)'
      '        ON Vat_Code.Vat_Code = Purch_Ord_Line_Add_Chg.Vat_Code)'
      '        ON Vat_Code_1.Vat_Code = Customer.VAT_Code_Def'
      'WHERE job_bag = :Job_Bag and'
      ' Purch_Ord_Line_Add_Chg.Quotation_Price <> 0 and'
      ' Purchase_orderLine.purch_ord_line_Status <= 25'
      ' ')
    Left = 136
    Top = 368
    ParamData = <
      item
        Name = 'Job_Bag'
      end>
  end
  object qryPOLineChgs: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Job_Bag_Line_Dets.Job_Bag,'
      '        Purchase_OrderLine.Purchase_Order,'
      '        Purchase_OrderLine.Line,'
      '        Purch_Ord_Line_Add_Chg.Additional_charge,'
      '        Purch_Ord_Line_Add_Chg.Details,'
      '        Purch_Ord_Line_Add_Chg.Amount,'
      '        Purch_Ord_Line_Add_Chg.Quotation_Price,'
      '        Product_Type.Nominal,'
      '        Purchase_OrderLine.Customer,'
      '        Customer.VAT_Code_Def AS Vat_Code,'
      '        Purch_Ord_Line_Add_Chg.Vat_Code,'
      '        Vat_Code.Vat_Rate,'
      '        Vat_Code_1.Vat_Rate as Customer_Vat_Rate'
      'FROM Vat_Code AS Vat_Code_1'
      '      INNER JOIN (Vat_Code'
      '      RIGHT JOIN (Product_Type'
      '      INNER JOIN (((Purchase_OrderLine'
      
        '      INNER JOIN Customer ON Purchase_OrderLine.Customer = Custo' +
        'mer.Customer)'
      
        '      INNER JOIN Job_Bag_Line_Dets ON (Purchase_OrderLine.Line =' +
        ' Job_Bag_Line_Dets.Line)'
      
        '        AND (Purchase_OrderLine.Purchase_Order = Job_Bag_Line_De' +
        'ts.Purchase_Order))'
      
        '      INNER JOIN Purch_Ord_Line_Add_Chg ON (Purchase_OrderLine.L' +
        'ine = Purch_Ord_Line_Add_Chg.Line)'
      
        '        AND (Purchase_OrderLine.Purchase_Order = Purch_Ord_Line_' +
        'Add_Chg.Purchase_Order))'
      
        '        ON Product_Type.Product_Type = Purchase_OrderLine.Produc' +
        't_Type)'
      '        ON Vat_Code.Vat_Code = Purch_Ord_Line_Add_Chg.Vat_Code)'
      '        ON Vat_Code_1.Vat_Code = Customer.VAT_Code_Def'
      'WHERE job_bag = :Job_Bag and Job_Bag_Line = :Job_Bag_Line AND'
      ' Purch_Ord_Line_Add_Chg.Quotation_Price <> 0 and'
      ' Purchase_orderLine.purch_ord_line_Status <= 25'
      ' ')
    Left = 496
    Top = 480
    ParamData = <
      item
        Name = 'Job_Bag'
      end
      item
        Name = 'Job_Bag_Line'
      end>
  end
  object qryGetProductType: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'select Product_Type.Description, Category.Description as Categor' +
        'y_Description'
      'from Product_Type, Category'
      'where Product_Type = :Product_Type and'
      'Product_Type.Category = Category.Category')
    Left = 696
    Top = 171
    ParamData = <
      item
        Name = 'Product_Type'
      end>
  end
  object qryInvLocation: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT * '
      'FROM Invoice_location'
      'ORDER BY Invoice_Location')
    Left = 664
    Top = 40
  end
end
