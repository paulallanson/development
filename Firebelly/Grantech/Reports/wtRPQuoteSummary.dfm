object frmwtRPQuoteSummary: TfrmwtRPQuoteSummary
  Left = 2
  Top = 0
  Caption = 'frmwtRPQuoteSummary'
  ClientHeight = 695
  ClientWidth = 1087
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  
  OnCreate = FormCreate
  TextHeight = 13
  object qrpDetails: TQuickRep
    Left = 216
    Top = 58
    Width = 794
    Height = 1123
    ShowingPreview = False
    BeforePrint = qrpDetailsBeforePrint
    DataSet = qryReport
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE'
      'QRBLOOP')
    Functions.DATA = (
      '0'
      '0'
      #39#39
      '0')
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
    ReportTitle = 'Quotation print'
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
    object qrgQuote: TQRGroup
      Left = 38
      Top = 385
      Width = 718
      Height = 2
      AlignToBottom = False
      BeforePrint = qrgQuoteBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        5.291666666666667000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'quote'
      FooterBand = qrbQFooter
      Master = qrpDetails
      ReprintOnNewPage = False
    end
    object qrbPageHeader: TQRBand
      Left = 38
      Top = 38
      Width = 718
      Height = 347
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        918.104166666666700000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object gtQRShape4: TQRShape
        Left = 400
        Top = 168
        Width = 313
        Height = 87
        Size.Values = (
          230.187500000000000000
          1058.333333333333000000
          444.500000000000000000
          828.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape2: TQRShape
        Left = 8
        Top = 166
        Width = 353
        Height = 149
        Size.Values = (
          394.229166666666700000
          21.166666666666670000
          439.208333333333300000
          933.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrlblQuoteCaption: TQRLabel
        Left = 552
        Top = 8
        Width = 161
        Height = 43
        Size.Values = (
          113.770833333333300000
          1460.500000000000000000
          21.166666666666670000
          425.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Quotation'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -37
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 28
      end
      object QRDBText5: TQRDBText
        Left = 8
        Top = 327
        Width = 697
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          865.187500000000000000
          1844.145833333333000000)
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
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qriHeadLogo: TQRImage
        Left = 8
        Top = 3
        Width = 300
        Height = 62
        Size.Values = (
          164.041666666666700000
          21.166666666666670000
          7.937500000000000000
          793.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Stretch = True
      end
      object qrmemCompanyAdd: TQRMemo
        Left = 8
        Top = 70
        Width = 353
        Height = 83
        Size.Values = (
          219.604166666666700000
          21.166666666666670000
          185.208333333333300000
          933.979166666666700000)
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
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object qrmAddress: TQRMemo
        Left = 40
        Top = 180
        Width = 233
        Height = 121
        Size.Values = (
          320.145833333333300000
          105.833333333333300000
          476.250000000000000000
          616.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object gtQRShape6: TQRShape
        Left = 400
        Top = 63
        Width = 313
        Height = 90
        Size.Values = (
          238.125000000000000000
          1058.333333333333000000
          166.687500000000000000
          828.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape9: TQRShape
        Left = 400
        Top = 93
        Width = 313
        Height = 3
        Size.Values = (
          7.937500000000000000
          1058.333333333333000000
          246.062500000000000000
          828.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape8: TQRShape
        Left = 400
        Top = 120
        Width = 313
        Height = 7
        Size.Values = (
          18.520833333333330000
          1058.333333333333000000
          317.500000000000000000
          828.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel2: TQRLabel
        Left = 405
        Top = 100
        Width = 30
        Height = 17
        Size.Values = (
          44.979166666666670000
          1071.562500000000000000
          264.583333333333300000
          79.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel3: TQRLabel
        Left = 405
        Top = 71
        Width = 56
        Height = 17
        Size.Values = (
          44.979166666666670000
          1071.562500000000000000
          187.854166666666700000
          148.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Quote No:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel4: TQRLabel
        Left = 405
        Top = 132
        Width = 46
        Height = 17
        Size.Values = (
          44.979166666666670000
          1071.562500000000000000
          349.250000000000000000
          121.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Contact:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRDBText1: TQRDBText
        Left = 634
        Top = 100
        Width = 74
        Height = 17
        Size.Values = (
          44.979166666666670000
          1677.458333333333000000
          264.583333333333300000
          195.791666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Date_Raised'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
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
      object QRDBText2: TQRDBText
        Left = 674
        Top = 68
        Width = 34
        Height = 17
        Size.Values = (
          44.979166666666670000
          1783.291666666667000000
          179.916666666666700000
          89.958333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Quote'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
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
      object QRDBText3: TQRDBText
        Left = 568
        Top = 132
        Width = 140
        Height = 17
        Size.Values = (
          44.979166666666670000
          1502.833333333333000000
          349.250000000000000000
          370.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Account_Manager_Name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
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
      object gtQRShape13: TQRShape
        Left = 494
        Top = 63
        Width = 9
        Height = 90
        Size.Values = (
          238.125000000000000000
          1307.041666666667000000
          166.687500000000000000
          23.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRShape3: TQRShape
        Left = 400
        Top = 223
        Width = 313
        Height = 7
        Size.Values = (
          18.520833333333330000
          1058.333333333333000000
          590.020833333333300000
          828.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel5: TQRLabel
        Left = 405
        Top = 233
        Width = 89
        Height = 16
        Size.Values = (
          42.333333333333330000
          1071.562500000000000000
          616.479166666666700000
          235.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Your Reference:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRDBText4: TQRDBText
        Left = 504
        Top = 233
        Width = 204
        Height = 17
        Size.Values = (
          44.979166666666670000
          1333.500000000000000000
          616.479166666666700000
          539.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Reference'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object gtQRShape7: TQRShape
        Left = 400
        Top = 197
        Width = 313
        Height = 3
        Size.Values = (
          7.937500000000000000
          1058.333333333333000000
          521.229166666666700000
          828.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape10: TQRShape
        Left = 494
        Top = 168
        Width = 9
        Height = 87
        Size.Values = (
          230.187500000000000000
          1307.041666666667000000
          444.500000000000000000
          23.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRLabel2: TQRLabel
        Left = 405
        Top = 175
        Width = 68
        Height = 16
        Size.Values = (
          42.333333333333330000
          1071.562500000000000000
          463.020833333333300000
          179.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Your Phone:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object gtQRLabel3: TQRLabel
        Left = 405
        Top = 205
        Width = 64
        Height = 16
        Size.Values = (
          42.333333333333330000
          1071.562500000000000000
          542.395833333333300000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Your Email:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object gtQRShape5: TQRShape
        Left = 400
        Top = 288
        Width = 313
        Height = 27
        Size.Values = (
          71.437500000000000000
          1058.333333333333000000
          762.000000000000000000
          828.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel4: TQRLabel
        Left = 405
        Top = 294
        Width = 74
        Height = 16
        Size.Values = (
          42.333333333333330000
          1071.562500000000000000
          777.875000000000000000
          195.791666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Lead Source:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qrlblYourPhone: TQRLabel
        Left = 643
        Top = 175
        Width = 65
        Height = 16
        Size.Values = (
          42.333333333333330000
          1701.270833333333000000
          463.020833333333300000
          171.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Your Phone'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qrlblYourEmail: TQRLabel
        Left = 504
        Top = 205
        Width = 204
        Height = 16
        Size.Values = (
          42.333333333333330000
          1333.500000000000000000
          542.395833333333300000
          539.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Your Email'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object gtQRShape12: TQRShape
        Left = 400
        Top = 262
        Width = 313
        Height = 27
        Size.Values = (
          71.437500000000000000
          1058.333333333333000000
          693.208333333333300000
          828.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape14: TQRShape
        Left = 494
        Top = 262
        Width = 9
        Height = 53
        Size.Values = (
          140.229166666666700000
          1307.041666666667000000
          693.208333333333300000
          23.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRLabel6: TQRLabel
        Left = 405
        Top = 268
        Width = 44
        Height = 16
        Size.Values = (
          42.333333333333330000
          1071.562500000000000000
          709.083333333333300000
          116.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Material'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object gtQRDBText2: TQRDBText
        Left = 500
        Top = 268
        Width = 208
        Height = 17
        Size.Values = (
          44.979166666666670000
          1322.916666666667000000
          709.083333333333300000
          550.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Material_Description'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object gtQRDBText1: TQRDBText
        Left = 501
        Top = 294
        Width = 207
        Height = 17
        Size.Values = (
          44.979166666666670000
          1325.562500000000000000
          777.875000000000000000
          547.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Sales_Lead_Source_Descr'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
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
    object qrsdQElements: TQRSubDetail
      Left = 38
      Top = 387
      Width = 718
      Height = 24
      AlignToBottom = False
      BeforePrint = qrsdQElementsBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.500000000000000000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpDetails
      DataSet = qryQElements
      PrintBefore = False
      PrintIfEmpty = True
      object lblWorktopSize: TQRLabel
        Left = 327
        Top = 4
        Width = 82
        Height = 17
        Size.Values = (
          44.979166666666670000
          865.187500000000000000
          10.583333333333330000
          216.958333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblWorktopSize'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object lblWorktopArea: TQRLabel
        Left = 478
        Top = 4
        Width = 84
        Height = 17
        Size.Values = (
          44.979166666666670000
          1264.708333333333000000
          10.583333333333330000
          222.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblWorktopArea'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
    end
    object qrsdQEdges: TQRSubDetail
      Left = 38
      Top = 411
      Width = 718
      Height = 26
      AlignToBottom = False
      BeforePrint = qrsdQEdgesBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        68.791666666666670000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpDetails
      DataSet = qryQEdges
      PrintBefore = False
      PrintIfEmpty = True
      object qrlblLength: TQRLabel
        Left = 499
        Top = 4
        Width = 63
        Height = 17
        Size.Values = (
          44.979166666666670000
          1320.270833333333000000
          10.583333333333330000
          166.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblLength'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qrlblEdgeDescription: TQRLabel
        Left = 293
        Top = 4
        Width = 117
        Height = 17
        Size.Values = (
          44.979166666666670000
          775.229166666666700000
          10.583333333333330000
          309.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblEdgeDescription'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
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
    object qrsdQCutOuts: TQRSubDetail
      Left = 38
      Top = 437
      Width = 718
      Height = 25
      AlignToBottom = False
      BeforePrint = qrsdQCutOutsBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        66.145833333333330000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpDetails
      DataSet = qryQCutOuts
      PrintBefore = False
      PrintIfEmpty = True
      object qrlblQuantity: TQRLabel
        Left = 493
        Top = 4
        Width = 69
        Height = 17
        Size.Values = (
          44.979166666666670000
          1304.395833333333000000
          10.583333333333330000
          182.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblQuantity'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qrlblCutOut: TQRLabel
        Left = 347
        Top = 4
        Width = 63
        Height = 17
        Size.Values = (
          44.979166666666670000
          918.104166666666700000
          10.583333333333330000
          166.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblCutOut'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
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
    object qrsdQExtras: TQRSubDetail
      Left = 38
      Top = 462
      Width = 718
      Height = 26
      AlignToBottom = False
      BeforePrint = qrsdQExtrasBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        68.791666666666670000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpDetails
      DataSet = qryQExtras
      PrintBefore = False
      PrintIfEmpty = True
      object qrlblExtraDescription: TQRLabel
        Left = 295
        Top = 4
        Width = 115
        Height = 17
        Size.Values = (
          44.979166666666670000
          780.520833333333300000
          10.583333333333330000
          304.270833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblExtraDescription'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qrlblExtraQuantity: TQRLabel
        Left = 457
        Top = 4
        Width = 105
        Height = 17
        Size.Values = (
          44.979166666666670000
          1209.145833333333000000
          10.583333333333330000
          277.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblExtraQuantity'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
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
    object qrbQFooter: TQRBand
      Left = 38
      Top = 548
      Width = 718
      Height = 34
      Frame.DrawTop = True
      AfterPrint = qrbQFooterAfterPrint
      AlignToBottom = False
      BeforePrint = qrbQFooterBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        89.958333333333330000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRLabel6: TQRLabel
        Left = 172
        Top = 8
        Width = 68
        Height = 17
        Size.Values = (
          44.979166666666670000
          455.083333333333300000
          21.166666666666670000
          179.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Fixing Team'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel7: TQRLabel
        Left = 345
        Top = 8
        Width = 119
        Height = 17
        Size.Values = (
          44.979166666666670000
          912.812500000000000000
          21.166666666666670000
          314.854166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Surveying/Templating'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel8: TQRLabel
        Left = 580
        Top = 8
        Width = 44
        Height = 17
        Size.Values = (
          44.979166666666670000
          1534.583333333333000000
          21.166666666666670000
          116.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Delivery'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qrlblInstallation: TQRLabel
        Left = 249
        Top = 8
        Width = 85
        Height = 17
        Size.Values = (
          44.979166666666670000
          658.812500000000000000
          21.166666666666670000
          224.895833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblInstallation'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qrlblSurvey: TQRLabel
        Left = 473
        Top = 8
        Width = 61
        Height = 17
        Size.Values = (
          44.979166666666670000
          1251.479166666667000000
          21.166666666666670000
          161.395833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblSurvey'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qrlblDelivery: TQRLabel
        Left = 634
        Top = 8
        Width = 68
        Height = 17
        Size.Values = (
          44.979166666666670000
          1677.458333333333000000
          21.166666666666670000
          179.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblDelivery'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object gtQRLabel9: TQRLabel
        Left = 9
        Top = 8
        Width = 96
        Height = 17
        Size.Values = (
          44.979166666666670000
          23.812500000000000000
          21.166666666666670000
          254.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Charges include:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
    end
    object qrcbAvailability: TQRChildBand
      Left = 38
      Top = 634
      Width = 718
      Height = 47
      AfterPrint = qrcbAvailabilityAfterPrint
      AlignToBottom = False
      BeforePrint = qrcbAvailabilityBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        124.354166666666700000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = qrcbNotes
      PrintOrder = cboAfterParent
      object QRLabel9: TQRLabel
        Left = 0
        Top = 7
        Width = 85
        Height = 17
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          18.520833333333330000
          224.895833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'AVAILABILITY'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsUnderline]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrrchTextAvailability: TQRRichText
        Left = 0
        Top = 26
        Width = 713
        Height = 17
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          68.791666666666670000
          1886.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AutoStretch = False
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        HiresExport = False
        Transparent = False
        YIncrement = 50
      end
    end
    object qrcbNotes: TQRChildBand
      Left = 38
      Top = 582
      Width = 718
      Height = 52
      AlignToBottom = False
      BeforePrint = qrcbNotesBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        137.583333333333300000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = qrbQFooter
      PrintOrder = cboAfterParent
      object qrlNotes: TQRLabel
        Left = 0
        Top = 8
        Width = 45
        Height = 17
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          21.166666666666670000
          119.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'NOTES'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsUnderline]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrrchTextNotes: TQRRichText
        Left = 0
        Top = 26
        Width = 713
        Height = 22
        Size.Values = (
          58.208333333333330000
          0.000000000000000000
          68.791666666666670000
          1886.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AutoStretch = False
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        HiresExport = False
        Transparent = False
        YIncrement = 50
      end
    end
    object qrcbPriceMatch: TQRChildBand
      Left = 38
      Top = 733
      Width = 718
      Height = 160
      AlignToBottom = False
      BeforePrint = qrcbPriceMatchBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        423.333333333333300000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = qrcbTerms
      PrintOrder = cboAfterParent
      object qrlblTotalAreaCaption: TQRLabel
        Left = 445
        Top = 6
        Width = 162
        Height = 17
        Size.Values = (
          44.979166666666670000
          1177.395833333333000000
          15.875000000000000000
          428.625000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total Worktop Area (sqm)'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
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
      object qrlblTotalArea1: TQRLabel
        Left = 614
        Top = 6
        Width = 99
        Height = 17
        Size.Values = (
          44.979166666666670000
          1624.541666666667000000
          15.875000000000000000
          261.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblTotalArea1'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
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
      object qriPriceMatch: TQRImage
        Left = 192
        Top = 8
        Width = 281
        Height = 137
        Size.Values = (
          362.479166666666700000
          508.000000000000000000
          21.166666666666670000
          743.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Picture.Data = {
          0A544A504547496D61676529E70000FFD8FFE000104A46494600010101012C01
          2C0000FFED199450686F746F73686F7020332E30003842494D04040000000000
          1A1C02000002000D1C0250000E437261696720436861726C746F6E3842494D04
          25000000000010CD770CBA78B6EA42B0001EE77CB9720E3842494D03ED000000
          000010012C000000010002012C0000000100023842494D042600000000000E00
          0000000000000000003F8000003842494D040D00000000000400000078384249
          4D04190000000000040000001E3842494D03F300000000000900000000000000
          0001003842494D271000000000000A000100000000000000023842494D03F500
          0000000048002F66660001006C66660006000000000001002F6666000100A199
          9A0006000000000001003200000001005A000000060000000000010035000000
          01002D000000060000000000013842494D03F80000000000700000FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E800000000FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFF03E800000000FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF03E800000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF03E800003842494D04080000000000100000000100000240000002
          40000000003842494D041E000000000004000000003842494D041A0000000003
          4B00000006000000000000000000000381000007240000000B00500052004900
          4300450020004D00410054004300480000000100000000000000000000000000
          0000000000000100000000000000000000072400000381000000000000000000
          0000000000000001000000000000000000000000000000000000001000000001
          0000000000006E756C6C0000000200000006626F756E64734F626A6300000001
          000000000000526374310000000400000000546F70206C6F6E67000000000000
          00004C6566746C6F6E67000000000000000042746F6D6C6F6E67000003810000
          0000526768746C6F6E670000072400000006736C69636573566C4C7300000001
          4F626A6300000001000000000005736C6963650000001200000007736C696365
          49446C6F6E67000000000000000767726F757049446C6F6E6700000000000000
          066F726967696E656E756D0000000C45536C6963654F726967696E0000000D61
          75746F47656E6572617465640000000054797065656E756D0000000A45536C69
          63655479706500000000496D672000000006626F756E64734F626A6300000001
          000000000000526374310000000400000000546F70206C6F6E67000000000000
          00004C6566746C6F6E67000000000000000042746F6D6C6F6E67000003810000
          0000526768746C6F6E67000007240000000375726C5445585400000001000000
          0000006E756C6C54455854000000010000000000004D73676554455854000000
          01000000000006616C74546167544558540000000100000000000E63656C6C54
          657874497348544D4C626F6F6C010000000863656C6C54657874544558540000
          0001000000000009686F727A416C69676E656E756D0000000F45536C69636548
          6F727A416C69676E0000000764656661756C740000000976657274416C69676E
          656E756D0000000F45536C69636556657274416C69676E000000076465666175
          6C740000000B6267436F6C6F7254797065656E756D0000001145536C69636542
          47436F6C6F7254797065000000004E6F6E6500000009746F704F75747365746C
          6F6E67000000000000000A6C6566744F75747365746C6F6E6700000000000000
          0C626F74746F6D4F75747365746C6F6E67000000000000000B72696768744F75
          747365746C6F6E6700000000003842494D042800000000000C000000023FF000
          00000000003842494D0414000000000004000000043842494D040C0000000013
          C100000001000000A00000004F000001E000009420000013A500180001FFD8FF
          E000104A46494600010200004800480000FFED000C41646F62655F434D0001FF
          EE000E41646F626500648000000001FFDB0084000C08080809080C09090C110B
          0A0B11150F0C0C0F1518131315131318110C0C0C0C0C0C110C0C0C0C0C0C0C0C
          0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C010D0B0B0D0E0D100E0E1014
          0E0E0E14140E0E0E0E14110C0C0C0C0C11110C0C0C0C0C0C110C0C0C0C0C0C0C
          0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC0001108004F00A00301
          2200021101031101FFDD0004000AFFC4013F0000010501010101010100000000
          000000030001020405060708090A0B0100010501010101010100000000000000
          010002030405060708090A0B1000010401030204020507060805030C33010002
          110304211231054151611322718132061491A1B14223241552C16233347282D1
          4307259253F0E1F163733516A2B283264493546445C2A3743617D255E265F2B3
          84C3D375E3F3462794A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6
          E6F637475767778797A7B7C7D7E7F71100020201020404030405060707060535
          0100021103213112044151617122130532819114A1B14223C152D1F0332462E1
          728292435315637334F1250616A2B283072635C2D2449354A317644555367465
          E2F2B384C3D375E3F34694A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6
          C6D6E6F62737475767778797A7B7C7FFDA000C03010002110311003F00F55492
          4925292492494A587F5BBAFBFA174AFB45218EC9B5E2AA43F80482E7D8E682D7
          3B631BFE7ADC5C6FD6A1F6FF00ADFD0FA5812DA8FDA6C04FB4B777A8E6EDFF00
          8BC37FFDB8999491035B9A88FF0009B5C862864CE3DC178F1C659720FEA628F1
          FF00CE5F16CFF191F626E4B9B8B639CEDE31EE01976D3115B833D3A18DFF00AE
          7AFF00BEA56FD71EBF8103AA741B5AD6FF003B752E2E601E45B5DB57FECC227D
          7EEAF9B818D83474FB5F4E564DE4B5CC204B5836B98EDDEDDBEA5D4A1F51EA1F
          5BFEAED1F6BCDBB13A96135E03DCE068B882386ECDB4B78D8DFE7DFF00F06A22
          78490253F4D714B49C5BD088CB0C79278396FD799FB58C1C9CB649704B87D128
          7EABFC76E627D7FF00AB591535F6641C67B891E9DAC3223BB9D4FAB5B5AEFCDF
          7ADBC3EA1839CC2FC2C8AB25AD8DC6A787C4FEFEC3ED5CBF55FACFF560DF4B33
          BA7BB24E5E2B2E16B6BADF6359734BCD567B9B6B7F43EEB3D27AA58FD0FEA0F5
          BB5B5F4BCAB31B20EADA98F734B9C3DDA3331AF759B3FE01E88C92BA0613FAF0
          498E5C9E130E3963E639789F57170C799C318FF58C7DA9C5EF525C68FAB1F5BB
          A79DDD2BAE1B9BA8F4F2812009FA2DF53ED8CFFA3522B7AD7D76E9C01EA3D29B
          9D5EC30EC4D5FBE4EDDFE9BAEF6FF5684FF72BE684A3F4E21FF35AE79212FE67
          98C597B478BD9C9FE266E0FF00A4F5A92E630FFC60745B416E6B6DC0BEB136D5
          6B098FDED9E9EEB2CDBFF15EA7F84F4FD35B583D6BA4F5004E165D5710DDCE63
          5C3786FEF3EA7458CE7F39A9D1C9096D2058B2F29CC62BE3C53881FA55E8FF00
          1FE46EA49249CC0A4924925292492494FF00FFD0F554924925292492494A5CDE
          074ECCBBEB766753CAC7AEAAB19AEA687ED21EF2F157A790DB7D36B6D67D99AE
          A7F9EB3D1B3D45BF9590CC6C6BB26C706B2963AC739D300346E25DB439CB0BEA
          6F4DB70F172EEBC875995905C2C170C8DCC635B535DEBB3631DFA4177F83AEDF
          F4C992D6511D8F17D9B36701E0C39E7601944628F797B87F59C3FE034FAF743C
          8EBBF59B08B9ADBBA463376651658D96BC6FB1F558C6BDB737D5FD5EBF62B23E
          A1F4765AD751765D15349231D96FE8FDC1D5BE3D46596377D6F7B37B6CF5173F
          D08FD9FABE1F56CBA5D897E6E6E7B332D7BE1B019BDB5595BBDB5FA791EAFF00
          DB1FF6DDB1F593AEE7F5DC07E0DADABA667DE6BA31F6B5CE7D14387DA72EDDED
          3657EAFE9BD3FE6FF99FF83F52C841C7ACA51B94A5E67F46BFC174A78F9B1C38
          B16610C58714B5F931F142597DC8FA7DDE3CBFABCBEAFF0036D3E963ABE57D67
          EA99DD02BC58C32286B2E9D9E9B47D9719B47A70E6FE8B17FD256C517D997D53
          EB863FED3A69E977F4C68C9C90DF7978A76E5FD361735FBD9B767BFF004557A9
          F4FF009A5B5D47EB574FE89D42EC6E9DD39B6D1539A7A9E450056DAECB1DB46F
          732BD96DDF4BE9BFF9CFD1FF00A550EBD8BD0B07AB676466656462DFD5711D41
          B9D51B686FA8198FFA335337FAAD651EFADCFF00A167F395A0622A84AF865730
          7482F8E6999832C071FB983DAE5A711EE731E98E384B8E30F9BD13F73D78BFCD
          B8783D76DE93D1F37A9D35B5BD53ABE5ED6D961221A58CCAB2EF44FE876D4FCB
          FD13B77F87FD37F35E9ADE762FD7CC3C0FB7BBA957917D6D36DD82EA985A5AD1
          BDD5B6EA9AC73ACFE457E97FC6ACFBBEAB559DF56F0EAE8D994E666F4E7D9607
          545A0586D77A9B4EE2EF4EEFD1D5E9FADFE8FDEB5F3BEB375DC7C16B2BE8F73B
          AAB9EE616358FB68018769C96D950F7576FF0083AFF46FFF00ADFA6FB944103D
          6640088E1E1EE7E6F93F4919E709CA3EC4314E72CB38E619E30E3E087A30FF00
          3FEBC587D98FE87C88E9FAEBD2F23A153D4BA863EE365C70EDA5A1AE01E59BAC
          7FE9CB3F577D0EF7FF00C6FA4A8D6CFA83D4B20E1359774BCFC93E83F1E2CC77
          4920FA1656DDF87EEB18CFD13FFC2AAFF595A736DE958FD53271FA7F559F5322
          AADBFA3ACDCF6FEB36DD61F45EEAB1F1763E97DDFCEFF376FA6B72BC7FACF6D9
          8F5F50ABA7756C073DA1F70045819C3B221E3D1DFF00E13652D46E5234409550
          F96FFBD7FB8C6638B1404F1CA786590E49F0C731C718C612FD57B729C3DBE671
          B91D5FEAE755E8185FB4BA2F55C97518A039D8EF74C573F4DAD1FABDACAF77F3
          4FA3E82EA7EACF567F58E8D8F9D6B432E76E65CD6F01EC258E3FC9DFB7D4DBF9
          8A87D7DCD18BF56B21BB8B5D92E650C23F947D4B3FF01AED5A3F56F0CE1741C1
          C6733D37B69697B22087BC7A966E1FBDBDFEF4F8C7872911BE1E1B23A713067C
          A72F230C994039BDE30864A11C92C5187AF8F87E7F5C9D2492494CE6A9249249
          4FFFD1F554924925292492494E37D6FC8C5A3EAF660C9B850DB986A638B4B8B9
          CE04B6B631AE66E7BF6FEFFB3F9CB3F46A18995FB23EAB61D996CB6FB1B4D159
          A5B1EA1B2DD95B691BDCC6FB1F66CFA69BEB9747CAEADD2057853F6AC7B5B7D2
          D0434B8B4399B43CC6C76DB37B3F96B37A7759CBEA3D28F4DEBBD1732F3B4557
          BDB5FB5E0716B85AFA2D65BBABF77A1BFF004DFCDFF8350C89190F4B8D40F474
          31638CB9481044C4737167C7C518E48C6A318F00970FCFFDE5643F09BD3EEE95
          9B4DD855E0B9877F4FC976419C870A9D4D96BC32FF005EE7653F7D3934FE92BF
          D352ACF50E964753BB2FA6E46355978180DA31EAB9A43319AE73B6E47A83D463
          7F4032767E87FE33F42A3D4307A07DB2E0FEA070FAA39D4DF5D99361306B73AF
          C6F49B92E636FC6DEFDAFAA9B7D3FD0FFA7AD2CAFAB1D4F2ACBAC3998EFF00B7
          58CBF35E697ECB05018DC2C3FB38BFFA2FF3B6643FED3EA59FA34083AFA44BC8
          F6F957C6701C24E4962E2049192339427C7EDFB9F37B9C509FEBBFCA7ADC8CCF
          A99D5F0FEAEE4D58D9A32BD70CBF2715B487BACB0163DCEA32FF00A43B6EDFD1
          FB3F49FF005E57FEB4753B1BF52718DED78C8CF6D14DAC702D78740BB206C7ED
          76EFD0D95A81C2EBD5D38EDB710554F4AC5B77554E45F535E4BDE1A3172319F7
          6439ECC7C5A1D4D7735FFD23D3B7F312C6FAC390EAF0996D8CCCC3AADA2ACBCA
          BAA707597E412FA71A86FE929AACE9B5163B2ECBAEF577FF00C37F38DA88040B
          87147875D7FE933F1E5C92C7397067F6729CC78387199748C78B17147D5EDE1F
          E5FCD9FEB2536E0E374EE91D28BB1DF9D736BBF2EAAC7A9B3F438F6DF6594B6B
          6B6DB3D4A3D5B3753EA6CF4D133FEAFF0052E9D8F4E47D5CC8B9D978FB4598F7
          59355ED0363BD5A9FE9E3FAFB7FC27E87FEDFF00D226CCEA587D6199D8BD47A7
          5F63702EDD8ACC725D6DED65AFC1B6DC7D9E93BD9635CCC8FD27B2AB157637A3
          DD9C71FA967E76EC3F6D98D9A0863769B323D7B32D8C75157ABE9576E35CCC9A
          AEF4E9F4FD4FD35B5A71A24F63423AF0F0D3140E48C2008F563329E68F07BF1C
          DEE70FCDC1F347867EDFAF83DBFF0068CEACCE9BD6BEB2E6E0F51C6C27D38AD6
          32B75C1BF6836FB7D4A6B7BFF9CA6A7B6E6BF67FE8C4FD33A6FD5DC5FADD6627
          4E664E3656255EB5AC63FF005670780DDB635EE75BEDFB4B1EC67F3697D5FF00
          AB3D2F2B172EFEA470FAB6466643EDB3231C87B5BBBF32BB5B0FABDDBDEED897
          D49E8EFC1CDEAD90EC67E352EBBD1C365A1C1C2A639EEF69B65D656E63E9FD27
          FC1A0048985C41B265C5D62139278630E6063CB388C78E18862F971E5C92E084
          A7EA97ABFCA4B87DA6B7D7F2ECFEA1D23A1D6E339166FB1A3901C5B4D767F65B
          F695DA810001C05C4B01EA9FE329E7734D7D2EAE0EB3B5BB61B1F9ECC9CCDDFD
          85DBA7E3D65925DE5C3FE235F9DF461E530FEEE2F765FDFE665C7FF438149249
          295A2A49249253FFD2F554924925292492494A51731AE0438483CA924929C9CE
          FAABF57F3E4E461B373BF3D92C70D2347565AB299F50EBC27FABD1FA8E4E1580
          B5C0176F61876E77AB533D0F55AEFA3B37AEAD24C38E04D988BEE342D9873BCC
          C23C232C8C3F725FAC87F89938A2F2F7E3FD7BC1BC1C5CAC7EA74BFB5F58ACB5
          C65CEF655B1DE9FF00A3FD62C41CDFAD193454DC6EBFD0AC7D0F6CDCFAC36EA4
          96B9DB7631DBABDBFA3AECFD2DCCB19FF822EB9243DB3FA3223CFD63FE72E1CD
          C0D7B9831CABF4B1DF2F93CFF55FABFF00C69E331FAD7D47CE1855D790EC0761
          5A6EA6B76EAFE93BD6B69BAD70B297537DBB6CB2BF5BF3168E7F42767F4DEA2D
          C3C8AB21FD5AEAB20D84ED69A1BE88AE96DD4FADECF4E877A777A7FE116AE7F4
          5E93D44119B8955C4E9B9CD1BF8DBA5AD8B1BFE7AC5CBFA83D2EDBDB938D9395
          89915802BB1969716ED01B5ED75BBED6B6B6B7D9B2D4D309D104465E5E8FEAB3
          433F2E651947265C241E2FD608F350BE3F77E68FB593F9CF549A7D43A5670654
          6FC4B2C0EB1EFC9BB6B721E1EC6D75E1DB3D37F65E7E4D2CAEDCDD8FFE955BFF
          00EDB5BDD270DF4534E6DF917CFD9F6D94BECB5D50971BCDFB3387DB596FE67E
          9ECFD155FA158C3A17D78C13181D659955F3196D25C7F93363729DFF00833157
          EA16FF008C3CEC77E0DBD371C536FB2D7D6F0DDEC3F499AE56F6D56B7D976DFD
          2FA7FE8D00786CF04AFCB8BF18324B1FBB18C23CC60E0BD4F19C5E93FEAB98E1
          F53A1F52EDE9B9ECCCEA98D55C2FB6F7B6CB321CD7968738E47D9F1DEC0CD94F
          E97D77D5B3F9EB7F9CB974CAB74EC7BB1B0AAA2F7B5F6B1B0E2C686301FDCAAB
          686ECA6AFE6A9FF816315952C054403F5687339064CD3947E5BA88E2E3F48F97
          D525249249CC2A49249253FFD3F41C9EB5662DAEAEEC0CA70687B83EA60B5A58
          CDDB0EEACFD3B5B5BDCCABFF004A314EEEB059943199879363858CADD67A6E15
          81616FE945D1B1EC66EFD26DFA0B452428F764E3C7A7EAFA7EF1DDCA775E68DE
          1B85965CC658F8356D07D36BEC6B7739DFE1BD3FD0EDFF00D2893BAFB1A1AEFB
          16616B8BDBFCCBB702CF4B9AFE96CB3D6F659F43F44F5AA8198DCC754061BD95
          D93A9B0170883E1FCBD9FEBEF42A5DFF00048962240E0AF3916937AF56E7868C
          2CCD4C071A48100B586CD4FD0F7FFE06A4FEBB4D62E73B1B283697066EF48C3D
          C6C6E306D3FE93DEF6BBFA886EA3EB30FA3978CE90666A70DA76C30361EEDFEF
          FA5FEB5A9FD9FAF9658D39540710D35582A3A125FEB35D597BB731B5FA5E8FBB
          FE310B978FD8C9C3874D63D3F4E7DFFD9B3ABACD6FB994D98D914BAC76DDD656
          5AC120399BECFA3FA4DED633FE17F45FE0AD43AFAEB2D7B1ACC3CB02C2E873E9
          734431AFB1DF4BFE2BD3637FC27A8A7F67EB632BD419751C773D85D53ABD4306
          B68A9ED2DDAF7BBFD27AC82CC3FAC6DAFD37F50A9E40D2DF4407920F0EFF0004
          DFE5BDB57F52BA92B978FD811C38BBC761FA53EBFF0053FD164CEBA5E5CE6E06
          5FA6D66F693516B9C4B995FA6DAACD9EEFD26EFEA5693BAFB4076CC1CC796F6F
          44B64C073EB66F2DF7B27FA9FCB49D89F58658599F57B6ADAF0EA747DBEEFD37
          B5C367F82F633FE1BFE0D4FECFD73D17839557AFEAB5F5BC3219E9801AFA1F5F
          D3FCDF5377ADEA7BFF00D1A572F1FB027870FF0050FF008593F1F432B3AD535E
          41A0E3E4C07B2AF5BD270AF759E9B6BF7BB6FD27DCD67F23FC220D7F58F16D69
          7D78D94FA8120DADA4B9B0D2F6177B373BE957FEBEF4998FF594587765639612
          5C47A67833FA266ADDBB3F32D7FA889F65EB7ED69CC6161A7658ED803FD5D8F6
          7AD5E9B1BFA5F4EEDAE67FC1A572F1FB15C3840D4C4F8F1CBFF55ACDEB81C1FB
          70B2C3D95BEC01D539A1C1807B1AEFF48FDDB595FD34C3AEEEA5D60C1CA0EACB
          7D463AA2D30E7D95B9CCDDFCE6CF4BD5F6FF00837D49FECDD7FB66D30D769349
          24B04EDDFF00A41FA477B37ED51BB1FEB1B98E1565E3D6EF4DAD07D224FA9B76
          DB64976D6B7D5F7D5FA3B3FE13D44AE5E3F60570E1FEA7F8D93FEF17B3AE6C75
          47EC3966BB0125C2A717360D8CF7D6D05CDFE6F77F52D49DF5831DAFD871B2B7
          8632C814B8E9637D46CED9DBB61FBF77B37D767EE29598FD73D577A195536B2E
          7387A95979DBEDF4D9B5AEAB66DDBB1FFA4B37FE92CFF0BFAB0ABC4FAC8D1273
          A97B8F67552D124BB4D9E9B9DFEBFF001C95CBC7EC508E1ABF4FF8F3FF00D56C
          DBD737D761AF072FD4AD8E78ADF56DDC5BB3F46D7496EFFD27FE7CFF00088957
          586D97B69FB265337121D63AA218D81BBDEE9FFA85630999CCADCDCDB5973F77
          B1F5B4B3DB0DFA6D977BF7EF561117DFF06391C6090217E2245CBAFAFD0F6927
          172AB8A9D735AFA4B5CE6B7D3DFB1BFBCD75D5B3FF0051FBD2ABAE8B1ED61C1C
          C617BC3584D5A6BB5BB9EEDDB2ADAE77BB7FF5D6A248D1EFF8238F1FF9BFF9CF
          FFD9003842494D042100000000005500000001010000000F00410064006F0062
          0065002000500068006F0074006F00730068006F00700000001300410064006F
          00620065002000500068006F0074006F00730068006F00700020004300530034
          00000001003842494D04060000000000070008000000010100FFE114F7457869
          6600004D4D002A000000080008011200030000000100010000011A0005000000
          010000006E011B00050000000100000076012800030000000100020000013100
          020000001C0000007E01320002000000140000009A013B00020000000F000000
          AE8769000400000001000000C0000000EC0000012C000000010000012C000000
          0141646F62652050686F746F73686F70204353342057696E646F777300323031
          393A30313A30382031353A33343A343000437261696720436861726C746F6E00
          0000000003A00100030000000100010000A00200040000000100000724A00300
          0400000001000003810000000000000006010300030000000100060000011A00
          05000000010000013A011B000500000001000001420128000300000001000200
          0002010004000000010000014A0202000400000001000013A500000000000001
          2C000000010000012C00000001FFD8FFE000104A464946000102000048004800
          00FFED000C41646F62655F434D0001FFEE000E41646F626500648000000001FF
          DB0084000C08080809080C09090C110B0A0B11150F0C0C0F1518131315131318
          110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
          0C0C0C0C010D0B0B0D0E0D100E0E10140E0E0E14140E0E0E0E14110C0C0C0C0C
          11110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C
          0C0C0C0C0CFFC0001108004F00A003012200021101031101FFDD0004000AFFC4
          013F0000010501010101010100000000000000030001020405060708090A0B01
          00010501010101010100000000000000010002030405060708090A0B10000104
          01030204020507060805030C3301000211030421123105415161132271813206
          1491A1B14223241552C16233347282D14307259253F0E1F163733516A2B28326
          4493546445C2A3743617D255E265F2B384C3D375E3F3462794A485B495C4D4E4
          F4A5B5C5D5E5F55666768696A6B6C6D6E6F637475767778797A7B7C7D7E7F711
          0002020102040403040506070706053501000211032131120441516171221305
          32819114A1B14223C152D1F0332462E1728292435315637334F1250616A2B283
          072635C2D2449354A317644555367465E2F2B384C3D375E3F34694A485B495C4
          D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F62737475767778797A7B7C7FF
          DA000C03010002110311003F00F554924925292492494A587F5BBAFBFA174AFB
          45218EC9B5E2AA43F80482E7D8E682D73B631BFE7ADC5C6FD6A1F6FF00ADFD0F
          A5812DA8FDA6C04FB4B777A8E6EDFF008BC37FFDB8999491035B9A88FF0009B5
          C862864CE3DC178F1C659720FEA628F1FF00CE5F16CFF191F626E4B9B8B639CE
          DE31EE01976D3115B833D3A18DFF00AE7AFF00BEA56FD71EBF8103AA741B5AD6
          FF003B752E2E601E45B5DB57FECC227D7EEAF9B818D83474FB5F4E564DE4B5CC
          204B5836B98EDDEDDBEA5D4A1F51EA1F5BFEAED1F6BCDBB13A96135E03DCE068
          B882386ECDB4B78D8DFE7DFF00F06A2278490253F4D714B49C5BD088CB0C7927
          8396FD799FB58C1C9CB649704B87D1287EABFC76E627D7FF00AB591535F6641C
          67B891E9DAC3223BB9D4FAB5B5AEFCDF7ADBC3EA1839CC2FC2C8AB25AD8DC6A7
          87C4FEFEC3ED5CBF55FACFF560DF4B33BA7BB24E5E2B2E16B6BADF6359734BCD
          567B9B6B7F43EEB3D27AA58FD0FEA0F5BB5B5F4BCAB31B20EADA98F734B9C3DD
          A3331AF759B3FE01E88C92BA0613FAF0498E5C9E130E3963E639789F57170C79
          9C318FF58C7DA9C5EF525C68FAB1F5BBA79DDD2BAE1B9BA8F4F2812009FA2DF5
          3ED8CFFA3522B7AD7D76E9C01EA3D29B9D5EC30EC4D5FBE4EDDFE9BAEF6FF568
          4FF72BE684A3F4E21FF35AE79212FE6798C597B478BD9C9FE266E0FF00A4F5A9
          2E630FFC60745B416E6B6DC0BEB136D56B098FDED9E9EEB2CDBFF15EA7F84F4F
          D35B583D6BA4F5004E165D5710DDCE635C3786FEF3EA7458CE7F39A9D1C9096D
          2058B2F29CC62BE3C53881FA55E8FF001FE46EA49249CC0A4924925292492494
          FF00FFD0F554924925292492494A5CDE074ECCBBEB766753CAC7AEAAB19AEA68
          7ED21EF2F157A790DB7D36B6D67D99AEA7F9EB3D1B3D45BF9590CC6C6BB26C70
          6B2963AC739D300346E25DB439CB0BEA6F4DB70F172EEBC875995905C2C170C8
          DCC635B535DEBB3631DFA4177F83AEDFF4C992D6511D8F17D9B36701E0C39E76
          01944628F797B87F59C3FE034FAF743C8EBBF59B08B9ADBBA463376651658D96
          BC6FB1F558C6BDB737D5FD5EBF62B23EA1F4765AD751765D15349231D96FE8FD
          C1D5BE3D46596377D6F7B37B6CF5173FD08FD9FABE1F56CBA5D897E6E6E7B332
          D7BE1B019BDB5595BBDB5FA791EAFF00DB1FF6DDB1F593AEE7F5DC07E0DADABA
          667DE6BA31F6B5CE7D14387DA72EDDED3657EAFE9BD3FE6FF99FF83F52C841C7
          ACA51B94A5E67F46BFC174A78F9B1C38B16610C58714B5F931F142597DC8FA7D
          DE3CBFABCBEAFF0036D3E963ABE57D67EA99DD02BC58C32286B2E9D9E9B47D97
          19B47A70E6FE8B17FD256C517D997D53EB863FED3A69E977F4C68C9C90DF7978
          A76E5FD361735FBD9B767BFF004557A9F4FF009A5B5D47EB574FE89D42EC6E9D
          D39B6D1539A7A9E450056DAECB1DB46F732BD96DDF4BE9BFF9CFD1FF00A550EB
          D8BD0B07AB676466656462DFD5711D41B9D51B686FA8198FFA335337FAAD651E
          FADCFF00A167F395A0622A84AF8657307482F8E6999832C071FB983DAE5A711E
          E731E98E384B8E30F9BD13F73D78BFCDB8783D76DE93D1F37A9D35B5BD53ABE5
          ED6D961221A58CCAB2EF44FE876D4FCBFD13B77F87FD37F35E9ADE762FD7CC3C
          0FB7BBA957917D6D36DD82EA985A5AD1BDD5B6EA9AC73ACFE457E97FC6ACFBBE
          AB559DF56F0EAE8D994E666F4E7D9607545A0586D77A9B4EE2EF4EEFD1D5E9FA
          DFE8FDEB5F3BEB375DC7C16B2BE8F73BAAB9EE616358FB68018769C96D950F75
          76FF0083AFF46FFF00ADFA6FB944103D6640088E1E1EE7E6F93F4919E709CA3E
          C4314E72CB38E619E30E3E087A30FF003FEBC587D98FE87C88E9FAEBD2F23A15
          3D4BA863EE365C70EDA5A1AE01E59BAC7FE9CB3F577D0EF7FF00C6FA4A8D6CFA
          83D4B20E1359774BCFC93E83F1E2CC774920FA1656DDF87EEB18CFD13FFC2AAF
          F595A736DE958FD53271FA7F559F5322AADBFA3ACDCF6FEB36DD61F45EEAB1F1
          763E97DDFCEFF376FA6B72BC7FACF6D98F5F50ABA7756C073DA1F70045819C3B
          221E3D1DFF00E13652D46E5234409550F96FFBD7FB8C6638B1404F1CA786590E
          49F0C731C718C612FD57B729C3DBE671B91D5FEAE755E8185FB4BA2F55C97518
          A039D8EF74C573F4DAD1FABDACAF77F34FA3E82EA7EACF567F58E8D8F9D6B432
          E76E65CD6F01EC258E3FC9DFB7D4DBF98A87D7DCD18BF56B21BB8B5D92E650C2
          3F947D4B3FF01AED5A3F56F0CE1741C1C6733D37B69697B22087BC7A966E1FBD
          BDFEF4F8C7872911BE1E1B23A713067CA72F230C994039BDE30864A11C92C518
          7AF8F87E7F5C9D2492494CE6A92492494FFFD1F554924925292492494E37D6FC
          8C5A3EAF660C9B850DB986A638B4B8B9CE04B6B631AE66E7BF6FEFFB3F9CB3F4
          6A18995FB23EAB61D996CB6FB1B4D159A5B1EA1B2DD95B691BDCC6FB1F66CFA6
          9BEB9747CAEADD2057853F6AC7B5B7D2D0434B8B4399B43CC6C76DB37B3F96B3
          7A7759CBEA3D28F4DEBBD1732F3B4557BDB5FB5E0716B85AFA2D65BBABF77A1B
          FF004DFCDFF8350C89190F4B8D40F47431638CB9481044C4737167C7C518E48C
          6A318F00970FCFFDE5643F09BD3EEE959B4DD855E0B9877F4FC976419C870A9D
          4D96BC32FF005EE7653F7D3934FE92BFD352ACF50E964753BB2FA6E463559781
          80DA31EAB9A43319AE73B6E47A83D4637F4032767E87FE33F42A3D4307A07DB2
          E0FEA070FAA39D4DF5D99361306B73AFC6F49B92E636FC6DEFDAFAA9B7D3FD0F
          FA7AD2CAFAB1D4F2ACBAC3998EFF00B758CBF35E697ECB05018DC2C3FB38BFFA
          2FF3B6643FED3EA59FA34083AFA44BC8F6F957C6701C24E4962E204919233942
          7C7EDFB9F37B9C509FEBBFCA7ADC8CCFA99D5F0FEAEE4D58D9A32BD70CBF2715
          B487BACB0163DCEA32FF00A43B6EDFD1FB3F49FF005E57FEB4753B1BF52718DE
          D78C8CF6D14DAC702D78740BB206C7ED76EFD0D95A81C2EBD5D38EDB710554F4
          AC5B77554E45F535E4BDE1A3172319F76439ECC7C5A1D4D7735FFD23D3B7F312
          C6FAC390EAF0996D8CCCC3AADA2ACBCABAA707597E412FA71A86FE929AACE9B5
          163B2ECBAEF577FF00C37F38DA88040B87147875D7FE933F1E5C92C7397067F6
          729CC78387199748C78B17147D5EDE1FE5FCD9FEB2536E0E374EE91D28BB1DF9
          D736BBF2EAAC7A9B3F438F6DF6594B6B6B6DB3D4A3D5B3753EA6CF4D133FEAFF
          0052E9D8F4E47D5CC8B9D978FB4598F759355ED0363BD5A9FE9E3FAFB7FC27E8
          7FEDFF00D226CCEA587D6199D8BD47A75F63702EDD8ACC725D6DED65AFC1B6DC
          7D9E93BD9635CCC8FD27B2AB157637A3DD9C71FA967E76EC3F6D98D9A0863769
          B323D7B32D8C75157ABE9576E35CCC9AAEF4E9F4FD4FD35B5A71A24F63423AF0
          F0D3140E48C2008F563329E68F07BF1CDEE70FCDC1F347867EDFAF83DBFF0068
          CEACCE9BD6BEB2E6E0F51C6C27D38AD632B75C1BF6836FB7D4A6B7BFF9CA6A7B
          6E6BF67FE8C4FD33A6FD5DC5FADD66274E664E3656255EB5AC63FF005670780D
          DB635EE75BEDFB4B1EC67F3697D5FF00AB3D2F2B172EFEA470FAB6466643EDB3
          231C87B5BBBF32BB5B0FABDDBDEED897D49E8EFC1CDEAD90EC67E352EBBD1C36
          5A1C1C2A639EEF69B65D656E63E9FD27FC1A0048985C41B265C5D62139278630
          E6063CB388C78E18862F971E5C92E084A7EA97ABFCA4B87DA6B7D7F2ECFEA1D2
          3A1D6E339166FB1A3901C5B4D767F65BF695DA810001C05C4B01EA9FE329E773
          4D7D2EAE0EB3B5BB61B1F9ECC9CCDDFD85DBA7E3D65925DE5C3FE235F9DF461E
          530FEEE2F765FDFE665C7FF438149249295A2A49249253FFD2F5549249252924
          92494A51731AE0438483CA924929C9CEFAABF57F3E4E461B373BF3D92C70D234
          7565AB299F50EBC27FABD1FA8E4E1580B5C0176F61876E77AB533D0F55AEFA3B
          37AEAD24C38E04D988BEE342D9873BCCC23C232C8C3F725FAC87F89938A2F2F7
          E3FD7BC1BC1C5CAC7EA74BFB5F58ACB5C65CEF655B1DE9FF00A3FD62C41CDFAD
          193454DC6EBFD0AC7D0F6CDCFAC36EA496B9DB7631DBABDBFA3AECFD2DCCB19F
          F822EB9243DB3FA3223CFD63FE72E1CDC0D7B9831CABF4B1DF2F93CFF55FABFF
          00C69E331FAD7D47CE1855D790EC07615A6EA6B76EAFE93BD6B69BAD70B29753
          7DBB6CB2BF5BF3168E7F42767F4DEA2DC3C8AB21FD5AEAB20D84ED69A1BE88AE
          96DD4FADECF4E877A777A7FE116AE7F45E93D44119B8955C4E9B9CD1BF8DBA5A
          D8B1BFE7AC5CBFA83D2EDBDB938D939589915802BB1969716ED01B5ED75BBED6
          B6B6B7D9B2D4D309D104465E5E8FEAB3433F2E651947265C241E2FD608F350BE
          3F77E68FB593F9CF549A7D43A56706546FC4B2C0EB1EFC9BB6B721E1EC6D75E1
          DB3D37F65E7E4D2CAEDCDD8FFE955BFF00EDB5BDD270DF4534E6DF917CFD9F6D
          94BECB5D50971BCDFB3387DB596FE67E9ECFD155FA158C3A17D78C13181D6599
          55F3196D25C7F93363729DFF00833157EA16FF008C3CEC77E0DBD371C536FB2D
          7D6F0DDEC3F499AE56F6D56B7D976DFD2FA7FE8D00786CF04AFCB8BF18324B1F
          BB18C23CC60E0BD4F19C5E93FEAB98E1F53A1F52EDE9B9ECCCEA98D55C2FB6F7
          B6CB321CD7968738E47D9F1DEC0CD94FE97D77D5B3F9EB7F9CB974CAB74EC7BB
          1B0AAA2F7B5F6B1B0E2C686301FDCAAB686ECA6AFE6A9FF816315952C054403F
          5687339064CD3947E5BA88E2E3F48F97D525249249CC2A49249253FFD3F41C9E
          B5662DAEAEEC0CA70687B83EA60B5A58CDDB0EEACFD3B5B5BDCCABFF004A314E
          EEB059943199879363858CADD67A6E1581616FE945D1B1EC66EFD26DFA0B4524
          28F764E3C7A7EAFA7EF1DDCA775E68DE1B85965CC658F8356D07D36BEC6B7739
          DFE1BD3FD0EDFF00D2893BAFB1A1AEFB16616B8BDBFCCBB702CF4B9AFE96CB3D
          6F659F43F44F5AA8198DCC754061BD95D93A9B0170883E1FCBD9FEBEF42A5DFF
          00048962240E0AF3916937AF56E7868C2CCD4C071A48100B586CD4FD0F7FFE06
          A4FEBB4D62E73B1B283697066EF48C3DC6C6E306D3FE93DEF6BBFA886EA3EB30
          FA3978CE90666A70DA76C30361EEDFEFFA5FEB5A9FD9FAF9658D39540710D355
          82A3A125FEB35D597BB731B5FA5E8FBBFE310B978FD8C9C3874D63D3F4E7DFFD
          9B3ABACD6FB994D98D914BAC76DDD6565AC120399BECFA3FA4DED633FE17F45F
          E0AD43AFAEB2D7B1ACC3CB02C2E873E9734431AFB1DF4BFE2BD3637FC27A8A7F
          67EB632BD419751C773D85D53ABD4306B68A9ED2DDAF7BBFD27AC82CC3FAC6DA
          FD37F50A9E40D2DF4407920F0EFF0004DFE5BDB57F52BA92B978FD811C38BBC7
          61FA53EBFF0053FD164CEBA5E5CE6E065FA6D66F693516B9C4B995FA6DAACD9E
          EFD26EFEA5693BAFB4076CC1CC796F6F44B64C073EB66F2DF7B27FA9FCB49D89
          F58658599F57B6ADAF0EA747DBEEFD37B5C367F82F633FE1BFE0D4FECFD73D17
          839557AFEAB5F5BC3219E9801AFA1F5FD3FCDF5377ADEA7BFF00D1A572F1FB02
          7870FF0050FF008593F1F432B3AD535E41A0E3E4C07B2AF5BD270AF759E9B6BF
          7BB6FD27DCD67F23FC220D7F58F16D697D78D94FA8120DADA4B9B0D2F6177B37
          3BE957FEBEF4998FF5945877656396125C47A67833FA266ADDBB3F32D7FA889F
          65EB7ED69CC6161A7658ED803FD5D8F67AD5E9B1BFA5F4EEDAE67FC1A572F1FB
          15C3840D4C4F8F1CBFF55ACDEB81C1FB70B2C3D95BEC01D539A1C1807B1AEFF4
          8FDDB595FD34C3AEEEA5D60C1CA0EACB7D463AA2D30E7D95B9CCDDFCE6CF4BD5
          F6FF00837D49FECDD7FB66D30D76934924B04EDDFF00A41FA477B37ED51BB1FE
          B1B98E1565E3D6EF4DAD07D224FA9B76DB64976D6B7D5F7D5FA3B3FE13D44AE5
          E3F60570E1FEA7F8D93FEF17B3AE6C7547EC3966BB0125C2A717360D8CF7D6D0
          5CDFE6F77F52D49DF5831DAFD871B2B78632C814B8E9637D46CED9DBB61FBF77
          B37D767EE29598FD73D577A195536B2E7387A95979DBEDF4D9B5AEAB66DDBB1F
          FA4B37FE92CFF0BFAB0ABC4FAC8D1273A97B8F67552D124BB4D9E9B9DFEBFF00
          1C95CBC7EC508E1ABF4FF8F3FF00D56CDBD737D761AF072FD4AD8E78ADF56DDC
          5BB3F46D7496EFFD27FE7CFF00088957586D97B69FB265337121D63AA218D81B
          BDEE9FFA85630999CCADCDCDB5973F77B1F5B4B3DB0DFA6D977BF7EF561117DF
          F06391C6090217E2245CBAFAFD0F6927172AB8A9D735AFA4B5CE6B7D3DFB1BFB
          CD75D5B3FF0051FBD2ABAE8B1ED61C1CC617BC3584D5A6BB5BB9EEDDB2ADAE77
          BB7FF5D6A248D1EFF8238F1FF9BFF9CFFFD9FFE20C584943435F50524F46494C
          4500010100000C484C696E6F021000006D6E74725247422058595A2007CE0002
          0009000600310000616373704D53465400000000494543207352474200000000
          00000000000000010000F6D6000100000000D32D485020200000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000001163707274000001500000003364657363000001840000006C
          77747074000001F000000014626B707400000204000000147258595A00000218
          000000146758595A0000022C000000146258595A0000024000000014646D6E64
          0000025400000070646D6464000002C400000088767565640000034C00000086
          76696577000003D4000000246C756D69000003F8000000146D6561730000040C
          0000002474656368000004300000000C725452430000043C0000080C67545243
          0000043C0000080C625452430000043C0000080C7465787400000000436F7079
          7269676874202863292031393938204865776C6574742D5061636B6172642043
          6F6D70616E790000646573630000000000000012735247422049454336313936
          362D322E31000000000000000000000012735247422049454336313936362D32
          2E31000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000058595A20000000000000F351
          00010000000116CC58595A200000000000000000000000000000000058595A20
          0000000000006FA2000038F50000039058595A2000000000000062990000B785
          000018DA58595A2000000000000024A000000F840000B6CF6465736300000000
          0000001649454320687474703A2F2F7777772E6965632E636800000000000000
          000000001649454320687474703A2F2F7777772E6965632E6368000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000064657363000000000000002E4945432036313936362D322E
          312044656661756C742052474220636F6C6F7572207370616365202D20735247
          4200000000000000000000002E4945432036313936362D322E31204465666175
          6C742052474220636F6C6F7572207370616365202D2073524742000000000000
          0000000000000000000000000000000064657363000000000000002C52656665
          72656E63652056696577696E6720436F6E646974696F6E20696E204945433631
          3936362D322E3100000000000000000000002C5265666572656E636520566965
          77696E6720436F6E646974696F6E20696E2049454336313936362D322E310000
          0000000000000000000000000000000000000000000000007669657700000000
          0013A4FE00145F2E0010CF140003EDCC0004130B00035C9E0000000158595A20
          00000000004C09560050000000571FE76D656173000000000000000100000000
          0000000000000000000000000000028F00000002736967200000000043525420
          63757276000000000000040000000005000A000F00140019001E00230028002D
          00320037003B00400045004A004F00540059005E00630068006D00720077007C
          00810086008B00900095009A009F00A400A900AE00B200B700BC00C100C600CB
          00D000D500DB00E000E500EB00F000F600FB01010107010D01130119011F0125
          012B01320138013E0145014C0152015901600167016E0175017C0183018B0192
          019A01A101A901B101B901C101C901D101D901E101E901F201FA0203020C0214
          021D0226022F02380241024B0254025D02670271027A0284028E029802A202AC
          02B602C102CB02D502E002EB02F50300030B03160321032D03380343034F035A
          03660372037E038A039603A203AE03BA03C703D303E003EC03F9040604130420
          042D043B0448045504630471047E048C049A04A804B604C404D304E104F004FE
          050D051C052B053A05490558056705770586059605A605B505C505D505E505F6
          060606160627063706480659066A067B068C069D06AF06C006D106E306F50707
          0719072B073D074F076107740786079907AC07BF07D207E507F8080B081F0832
          0846085A086E0882089608AA08BE08D208E708FB09100925093A094F09640979
          098F09A409BA09CF09E509FB0A110A270A3D0A540A6A0A810A980AAE0AC50ADC
          0AF30B0B0B220B390B510B690B800B980BB00BC80BE10BF90C120C2A0C430C5C
          0C750C8E0CA70CC00CD90CF30D0D0D260D400D5A0D740D8E0DA90DC30DDE0DF8
          0E130E2E0E490E640E7F0E9B0EB60ED20EEE0F090F250F410F5E0F7A0F960FB3
          0FCF0FEC1009102610431061107E109B10B910D710F511131131114F116D118C
          11AA11C911E81207122612451264128412A312C312E313031323134313631383
          13A413C513E5140614271449146A148B14AD14CE14F01512153415561578159B
          15BD15E0160316261649166C168F16B216D616FA171D17411765178917AE17D2
          17F7181B18401865188A18AF18D518FA19201945196B199119B719DD1A041A2A
          1A511A771A9E1AC51AEC1B141B3B1B631B8A1BB21BDA1C021C2A1C521C7B1CA3
          1CCC1CF51D1E1D471D701D991DC31DEC1E161E401E6A1E941EBE1EE91F131F3E
          1F691F941FBF1FEA20152041206C209820C420F0211C2148217521A121CE21FB
          22272255228222AF22DD230A23382366239423C223F0241F244D247C24AB24DA
          250925382568259725C725F726272657268726B726E827182749277A27AB27DC
          280D283F287128A228D429062938296B299D29D02A022A352A682A9B2ACF2B02
          2B362B692B9D2BD12C052C392C6E2CA22CD72D0C2D412D762DAB2DE12E162E4C
          2E822EB72EEE2F242F5A2F912FC72FFE3035306C30A430DB3112314A318231BA
          31F2322A3263329B32D4330D3346337F33B833F1342B3465349E34D83513354D
          358735C235FD3637367236AE36E937243760379C37D738143850388C38C83905
          3942397F39BC39F93A363A743AB23AEF3B2D3B6B3BAA3BE83C273C653CA43CE3
          3D223D613DA13DE03E203E603EA03EE03F213F613FA23FE24023406440A640E7
          4129416A41AC41EE4230427242B542F7433A437D43C044034447448A44CE4512
          4555459A45DE4622466746AB46F04735477B47C04805484B489148D7491D4963
          49A949F04A374A7D4AC44B0C4B534B9A4BE24C2A4C724CBA4D024D4A4D934DDC
          4E254E6E4EB74F004F494F934FDD5027507150BB51065150519B51E65231527C
          52C75313535F53AA53F65442548F54DB5528557555C2560F565C56A956F75744
          579257E0582F587D58CB591A596959B85A075A565AA65AF55B455B955BE55C35
          5C865CD65D275D785DC95E1A5E6C5EBD5F0F5F615FB36005605760AA60FC614F
          61A261F56249629C62F06343639763EB6440649464E9653D659265E7663D6692
          66E8673D679367E9683F689668EC6943699A69F16A486A9F6AF76B4F6BA76BFF
          6C576CAF6D086D606DB96E126E6B6EC46F1E6F786FD1702B708670E0713A7195
          71F0724B72A67301735D73B87414747074CC7528758575E1763E769B76F87756
          77B37811786E78CC792A798979E77A467AA57B047B637BC27C217C817CE17D41
          7DA17E017E627EC27F237F847FE5804780A8810A816B81CD8230829282F48357
          83BA841D848084E3854785AB860E867286D7873B879F8804886988CE89338999
          89FE8A648ACA8B308B968BFC8C638CCA8D318D988DFF8E668ECE8F368F9E9006
          906E90D6913F91A89211927A92E3934D93B69420948A94F4955F95C99634969F
          970A977597E0984C98B89924999099FC9A689AD59B429BAF9C1C9C899CF79D64
          9DD29E409EAE9F1D9F8B9FFAA069A0D8A147A1B6A226A296A306A376A3E6A456
          A4C7A538A5A9A61AA68BA6FDA76EA7E0A852A8C4A937A9A9AA1CAA8FAB02AB75
          ABE9AC5CACD0AD44ADB8AE2DAEA1AF16AF8BB000B075B0EAB160B1D6B24BB2C2
          B338B3AEB425B49CB513B58AB601B679B6F0B768B7E0B859B8D1B94AB9C2BA3B
          BAB5BB2EBBA7BC21BC9BBD15BD8FBE0ABE84BEFFBF7ABFF5C070C0ECC167C1E3
          C25FC2DBC358C3D4C451C4CEC54BC5C8C646C6C3C741C7BFC83DC8BCC93AC9B9
          CA38CAB7CB36CBB6CC35CCB5CD35CDB5CE36CEB6CF37CFB8D039D0BAD13CD1BE
          D23FD2C1D344D3C6D449D4CBD54ED5D1D655D6D8D75CD7E0D864D8E8D96CD9F1
          DA76DAFBDB80DC05DC8ADD10DD96DE1CDEA2DF29DFAFE036E0BDE144E1CCE253
          E2DBE363E3EBE473E4FCE584E60DE696E71FE7A9E832E8BCE946E9D0EA5BEAE5
          EB70EBFBEC86ED11ED9CEE28EEB4EF40EFCCF058F0E5F172F1FFF28CF319F3A7
          F434F4C2F550F5DEF66DF6FBF78AF819F8A8F938F9C7FA57FAE7FB77FC07FC98
          FD29FDBAFE4BFEDCFF6DFFFFFFE114D8687474703A2F2F6E732E61646F62652E
          636F6D2F7861702F312E302F003C3F787061636B657420626567696E3D22EFBB
          BF222069643D2257354D304D7043656869487A7265537A4E54637A6B63396422
          3F3E203C783A786D706D65746120786D6C6E733A783D2261646F62653A6E733A
          6D6574612F2220783A786D70746B3D2241646F626520584D5020436F72652034
          2E322E322D633036332035332E3335323632342C20323030382F30372F33302D
          31383A31323A31382020202020202020223E203C7264663A52444620786D6C6E
          733A7264663D22687474703A2F2F7777772E77332E6F72672F313939392F3032
          2F32322D7264662D73796E7461782D6E7323223E203C7264663A446573637269
          7074696F6E207264663A61626F75743D222220786D6C6E733A7064663D226874
          74703A2F2F6E732E61646F62652E636F6D2F7064662F312E332F2220786D6C6E
          733A786D703D22687474703A2F2F6E732E61646F62652E636F6D2F7861702F31
          2E302F2220786D6C6E733A786D704D4D3D22687474703A2F2F6E732E61646F62
          652E636F6D2F7861702F312E302F6D6D2F2220786D6C6E733A73744576743D22
          687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F73547970
          652F5265736F757263654576656E74232220786D6C6E733A73745265663D2268
          7474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F7354797065
          2F5265736F75726365526566232220786D6C6E733A64633D22687474703A2F2F
          7075726C2E6F72672F64632F656C656D656E74732F312E312F2220786D6C6E73
          3A70686F746F73686F703D22687474703A2F2F6E732E61646F62652E636F6D2F
          70686F746F73686F702F312E302F2220786D6C6E733A746966663D2268747470
          3A2F2F6E732E61646F62652E636F6D2F746966662F312E302F2220786D6C6E73
          3A657869663D22687474703A2F2F6E732E61646F62652E636F6D2F657869662F
          312E302F22207064663A50726F64756365723D224D6963726F736F6674C2AE20
          576F726420666F72204F6666696365203336352220786D703A43726561746F72
          546F6F6C3D224D6963726F736F6674C2AE20576F726420666F72204F66666963
          65203336352220786D703A437265617465446174653D22323031392D30312D30
          385431353A32353A35305A2220786D703A4D6F64696679446174653D22323031
          392D30312D30385431353A33343A34305A2220786D703A4D6574616461746144
          6174653D22323031392D30312D30385431353A33343A34305A2220786D704D4D
          3A446F63756D656E7449443D22757569643A31373343343336362D393946382D
          343239412D393744382D3833373443424233314442332220786D704D4D3A496E
          7374616E636549443D22786D702E6969643A4432383332464241354131334539
          3131423041374244443230434143373346302220786D704D4D3A4F726967696E
          616C446F63756D656E7449443D22757569643A31373343343336362D39394638
          2D343239412D393744382D383337344342423331444233222064633A666F726D
          61743D22696D6167652F6A706567222070686F746F73686F703A436F6C6F724D
          6F64653D2233222070686F746F73686F703A49434350726F66696C653D227352
          47422049454336313936362D322E312220746966663A4F7269656E746174696F
          6E3D22312220746966663A585265736F6C7574696F6E3D22333030303030302F
          31303030302220746966663A595265736F6C7574696F6E3D2233303030303030
          2F31303030302220746966663A5265736F6C7574696F6E556E69743D22322220
          746966663A4E61746976654469676573743D223235362C3235372C3235382C32
          35392C3236322C3237342C3237372C3238342C3533302C3533312C3238322C32
          38332C3239362C3330312C3331382C3331392C3532392C3533322C3330362C32
          37302C3237312C3237322C3330352C3331352C33333433323B33453637443343
          384642413242374139463634363944444235333443414643372220657869663A
          506978656C5844696D656E73696F6E3D22313832382220657869663A50697865
          6C5944696D656E73696F6E3D223839372220657869663A436F6C6F7253706163
          653D22312220657869663A4E61746976654469676573743D2233363836342C34
          303936302C34303936312C33373132312C33373132322C34303936322C343039
          36332C33373531302C34303936342C33363836372C33363836382C3333343334
          2C33333433372C33343835302C33343835322C33343835352C33343835362C33
          373337372C33373337382C33373337392C33373338302C33373338312C333733
          38322C33373338332C33373338342C33373338352C33373338362C3337333936
          2C34313438332C34313438342C34313438362C34313438372C34313438382C34
          313439322C34313439332C34313439352C34313732382C34313732392C343137
          33302C34313938352C34313938362C34313938372C34313938382C3431393839
          2C34313939302C34313939312C34313939322C34313939332C34313939342C34
          313939352C34313939362C34323031362C302C322C342C352C362C372C382C39
          2C31302C31312C31322C31332C31342C31352C31362C31372C31382C32302C32
          322C32332C32342C32352C32362C32372C32382C33303B443433444446443741
          4431383637414644393339463432394646433430383939223E203C786D704D4D
          3A486973746F72793E203C7264663A5365713E203C7264663A6C692073744576
          743A616374696F6E3D227361766564222073744576743A696E7374616E636549
          443D22786D702E6969643A434638333246424135413133453931314230413742
          4444323043414337334630222073744576743A7768656E3D22323031392D3031
          2D30385431353A33333A32305A222073744576743A736F667477617265416765
          6E743D2241646F62652050686F746F73686F70204353342057696E646F777322
          2073744576743A6368616E6765643D222F222F3E203C7264663A6C6920737445
          76743A616374696F6E3D2264657269766564222073744576743A706172616D65
          746572733D22636F6E7665727465642066726F6D206170706C69636174696F6E
          2F766E642E61646F62652E70686F746F73686F7020746F20696D6167652F6A70
          6567222F3E203C7264663A6C692073744576743A616374696F6E3D2273617665
          64222073744576743A696E7374616E636549443D22786D702E6969643A443038
          3332464241354131334539313142304137424444323043414337334630222073
          744576743A7768656E3D22323031392D30312D30385431353A33333A32305A22
          2073744576743A736F6674776172654167656E743D2241646F62652050686F74
          6F73686F70204353342057696E646F7773222073744576743A6368616E676564
          3D222F222F3E203C7264663A6C692073744576743A616374696F6E3D22736176
          6564222073744576743A696E7374616E636549443D22786D702E6969643A4431
          3833324642413541313345393131423041374244443230434143373346302220
          73744576743A7768656E3D22323031392D30312D30385431353A33333A35355A
          222073744576743A736F6674776172654167656E743D2241646F62652050686F
          746F73686F70204353342057696E646F7773222073744576743A6368616E6765
          643D222F222F3E203C7264663A6C692073744576743A616374696F6E3D227361
          766564222073744576743A696E7374616E636549443D22786D702E6969643A44
          3238333246424135413133453931314230413742444432304341433733463022
          2073744576743A7768656E3D22323031392D30312D30385431353A33343A3430
          5A222073744576743A736F6674776172654167656E743D2241646F6265205068
          6F746F73686F70204353342057696E646F7773222073744576743A6368616E67
          65643D222F222F3E203C2F7264663A5365713E203C2F786D704D4D3A48697374
          6F72793E203C786D704D4D3A4465726976656446726F6D2073745265663A696E
          7374616E636549443D22786D702E6969643A4346383332464241354131334539
          313142304137424444323043414337334630222073745265663A646F63756D65
          6E7449443D22757569643A31373343343336362D393946382D343239412D3937
          44382D383337344342423331444233222073745265663A6F726967696E616C44
          6F63756D656E7449443D22757569643A31373343343336362D393946382D3432
          39412D393744382D383337344342423331444233222F3E203C64633A63726561
          746F723E203C7264663A5365713E203C7264663A6C693E437261696720436861
          726C746F6E3C2F7264663A6C693E203C2F7264663A5365713E203C2F64633A63
          726561746F723E203C2F7264663A4465736372697074696F6E3E203C2F726466
          3A5244463E203C2F783A786D706D6574613E2020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020202020202020202020202020203C3F787061636B657420656E64
          3D2277223F3EFFDB0043000503040404030504040405050506070C0807070707
          0F0B0B090C110F1212110F111113161C1713141A1511111821181A1D1D1F1F1F
          13172224221E241C1E1F1EFFDB0043010505050706070E08080E1E1411141E1E
          1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E
          1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1EFFC000110800E001C903011100021101
          031101FFC4001F00000105010101010101000000000000000001020304050607
          08090A0BFFC400B5100002010303020403050504040000017D01020300041105
          122131410613516107227114328191A1082342B1C11552D1F02433627282090A
          161718191A25262728292A3435363738393A434445464748494A535455565758
          595A636465666768696A737475767778797A838485868788898A929394959697
          98999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3
          D4D5D6D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01
          00030101010101010101010000000000000102030405060708090A0BFFC400B5
          1100020102040403040705040400010277000102031104052131061241510761
          711322328108144291A1B1C109233352F0156272D10A162434E125F11718191A
          262728292A35363738393A434445464748494A535455565758595A6364656667
          68696A737475767778797A82838485868788898A92939495969798999AA2A3A4
          A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9
          DAE2E3E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F
          00FB2E800A002800A002800A002800A002800A002800A002800A002800A0064F
          345042F34D22471A296777601540EA493D0526D2576546329C9462AED9C1EAFF
          0017BC0B60E50F886C1D81C10242587FC04027F4AE4963A8C7ED23E8B0FC2999
          D557F64D2F43A2D2FC57A1DF6916BAAA6A56896774A5A199A6554907B1247E5D
          456B1AF092BA67975F2CC4D2AB2A5C8DCA3BAB6A5BD3B5ED1F519648AC753B3B
          892201A448E6566407A1201E01EC7BD691AB0968998D6C16228252A90693EE99
          A21811904107BD59CB6B0B400500140050014005001400500140050014005001
          4005001400500140050014005001400500140050014005001400500140050014
          0050014005001400500140050014005001400500140050014005001400500140
          050014005000781401F237ED3DF10B57D4FC6B79E15B2B9B8B5D2B4D22292346
          28279B00B3363A819000E9C13DEBE6F34C649D474D3D11FB5F0370FD1A3828E3
          2A4539CF54FB2E897E6FEE3C64BB3058DCB4923B6D50AA4B313D0003AD792A2E
          6F43F409D5A7429DE6ED63AAB7F877E3BB8D296EBFE112F103DB4633121B473C
          1E4908791EBC0AE8784C45BE17F71E27F6FE4F0AAED5E0A4FCD7E263D95DEB9E
          18D5BCDB49EFB44D402953B37412007A820E323A7045669D5A2EFB33BA50C0E6
          B4AD2E59C7E4D1D8E8BF19BE20E97246B73AA9BE48C602DCA60E074F9970C7F1
          CD74C333AF0DDDCF0F13C1796622EE30E5BF6FF277476565FB4978891C48747B
          2991576B44CED82DEA1F82BF421ABAA39C545BA3C1ABE1D61269A84DDFBFFC0D
          BF23ADF0EFED35E1F9E15FEDED0750B090F05ED996E23FD76B7E86BB29E6F4E5
          A4D58F0317E1CE369AE6A13525E7A3FD51E97E15F89DE0AF1244EDA6EB708923
          50D2C570AD0BC63DC301C7B824577D3C552A9F0B3E5F30E1ACCB2F7FBEA4ECF6
          6B55F81D847247246B246EAE8C32194E411F5AE8B9E1B4D3B31D4082800A0028
          00A002800A002800A002800A002800A002800A002800A002800A002800A00280
          0A002800A002800A002800A002800A002800A002800A002800A002800A002800
          A002800A002800A002800A0028032BC5FAAB687E15D575958C4AD63672DC8427
          018A21603F1C5675A7ECE0E5D8ECCBB0AB178BA5876EDCF24BEF763F3EF56D46
          7D43519F53BC779E7BA95A6B863C96763927F126BE2A4DD59DDEECFE9EA30860
          A92A705EEC55BE48FB0FE037C30D3FC1BE1FB6D4EFAD2397C417712C93CB22E5
          AD830C88933F7719F988E49CF6C57D4E0B06A84137B9F80F14F11D5CD3152853
          76A49E8BBF9BF5E9D91EA60773D6BD03E4CA9A969DA7EA71791A8D8DADEC5FDC
          B885645FC981A994232D1AB9B52C455A0EF4A4E2FC9DBF2383D6BE08FC35D4F7
          37FC23A963230237D8CCF0633DF683B73F85724F2FC3CF789F4384E30CE30AB9
          6359B5E693FC77FC4F3DF10FECCB13EF7D07C593C631F2C37D6E1F27DDE320FF
          00E3A6B86AE4F17F048FA9C1F8955E36588A49F9A76FC1DFF33CF35DF809F12B
          4ADE61D32C3578C0277D8DC8CFFDF126D39FA66B8AA6555E1F0EA7D2E0FC41CB
          712AD55B83F34FF4B9C8C765E26F05EBB6FA8DFE8D77A7CF6CE1952FAD1D6290
          704AB762BD3A1F4AE550AD425768F72B623059C5074E955524FB3572D0F887E3
          993546D46DBC4DA94770559156DA52B1AA939D8A83E5C6718E09F7A7F5BC4735
          D364478772A8D1F6752945ADF55ADFBDF73A8B5F8E7F15B41BFF00B06AB7304B
          716A364B6D7F62AAD9C7058AED6CF7EBCD752CCF134DFBCFF03C35C159263A1C
          D45357D6F1969F2BDD1DD785FF0069C05C47E25F0DEC538CCDA7CA485F728FFD
          0D75D2CE63F6D7DC7CFE3FC37947FDD6B5FCA4BF55FE47B0D9FC4DF03CFE1EB3
          D75FC47616F677676A19A50ACAE3EF2B2F50477CF15E9AC5D17152E6D19F0F53
          87B328579D0F64DCA3D974EFF33A1D235AD2757B713E97A95A5EC4C321A0943F
          F2ADA15233578BB9E7623075F0D2E5AD0717E6AC5FC8F5AB3982800A002800A0
          02800A002800A002800A002800A002800A002800A002800A002800A002800A00
          2800A002800A002800A002800A002800A002800A002800A002800A002800A002
          800A002803C7BF6B5D4AFACFE187D96CD5BCBBCBB8E3B960D8C4439C1F505B60
          C57999AC9AA165D4FBBF0F70F4AA66BCF53ECA6D7AEDF82B9F317C28D29F5CF8
          93E1DD305B178E4D421694019FDDA36F6CFB6D535E0E0E1CF5E2BCCFD6B89716
          B0D95D79EDEEBB7ABD17E2CFBEFB74AFB13F9A8AFAA5DC161A6DCDFDD36D82DA
          179A53E8AAA58FE82A672518B6CD28D2956A91A71DDB497CCF94F48FDA4BC6B0
          C8CD7BA4E8B7D13B975508F0BA293C2E431078F6AF9F59BD44F548FD8A5E1BE1
          2A534E352517F26BF147A1689FB4AF84EE762EADA2EB1A6B31C16455B8451EA4
          A90DFF008ED75D3CDE94BE24D1F318BF0F730A6FF7338CFEF4FF0055F89DFF00
          87BE28F8035E9628F4DF1569CD34BF76199FC9909C671B5C03DABBA18CA33F86
          48F9BC5F0DE6984BBAB46565D56ABEF573B20EAEA1948607A11C8AE84EE78B66
          B71B2224A8D148AAE8C30CAC3208F4229B4119B4EF17A9CAEA9F0D7C09A8DEA5
          F5CF85F4D1728C19668A2F29810720FC98AE696128CDDDC4F5A9F106634A9FB3
          55A5CBD9BBFE6707E39FD9EF42F10EAF77AC5BEBFAADA5FDDBEF90CDB6E23CE3
          18C1C363000FBDC57256CAA9D4774DA3E8F29E3CC565F495174A2E2BB5D3FD57
          E079A6B9FB38F8CEC55E4D2AEF49D59474512B41230FA382BFF8F579D3C9EAAF
          85A67D8E17C47CBA697B5A728CBE4D7E1AFE079E7887C05E33D01665D5FC29AB
          5B291B5E68E032C7C7FB69918AE3A983AF4F78B3E9309C4795E357B956377E76
          7F73B339FB6B9BAB5468ED6EEE210EA16511CC57781C80718E95CF195489EC55
          C3E1EAA574A5EA75DE1EF8B7F11B440A969E25BC9225E3C9BC6FB42E3D017C9F
          C8D75C331AF4FED1E162F8432BC62BCA828BF2D3F23D23C33FB4C6B50C11C3AF
          E856B773F9801960630864FC4B73F862BBA9672EDEFAB9F278DF0E70F29FFB3D
          471F5D75FC0F45F0F7ED05E08D4634FB77DB74E94E432B45E6AAE3FDA5FF000A
          EEA79A519EFA1F318DE02CCF0EDFB3B4D7969F9FF99E83A1F8CFC2BADDBC53E9
          7E20D3AE56519402E155CF38FBA70C39F6AEC862294D5E3247CCE2728C7615B5
          5A9495BC9DBEFD8DEC8AD8F382800A002800A002800A002800A002800A002800
          A002800A002800A002800A002800A002800A002800A002800A002800A002800A
          002800A002800A002800A002800A002803E6BFDB375C93ED3A1F872392448C46
          F7B3A87F95F2DB1011EDB58FE35E0E7357E187CCFD6BC35CBE32856C54B7BA8A
          FCDFDF74731FB216986FFE255D6A0C3F77A6583B0F67948451FF007CEFAC328A
          7CD51CBB1E9788D8CF6597C30EB7935F72D7FC8FAE3AF4AFA53F123CF7F68BD5
          BFB27E10EB8CB398A7BB896D21C75669180207FC077D71661539284BEE3EA383
          F07F5ACE28C6D7517CCFE5FF0006C7C51651CDA8DF436502132CF2A44811792C
          CC14607E35F2708F34AC7F41622BAA549D47B4537F723E99D63F666D19AD87F6
          37896FEDE65001FB5C49346C4753F2ED619E7B9C57BF3C9A9B5EEC8FC8B07E25
          E2A94FF7D4938F9369FE373CCBC67F017C73E1EB29F508E3B2D5ED20469657B4
          9097551C9FDDB004FAE066B86AE575A9ABAD51F5397F1D6598E9A84EF0937D56
          9F7AFD6C73FF000FFC71E31F00DDD95EE9F25E8D3AE819459DD6E16D751EEC31
          507807A8DCBD0FAF4AC6862AB619AEC7A39AE4996E774E54D25CEBAAB5D3E97F
          F267D889E34D3A5F868FE39B5466B31A6B5F2C6E70DF2A93B0E3383B86D3EF5F
          4CB111747DAADAD73F0D794D68663FD9F2F8B9B97F1DFF0053C7F41FDA6ED591
          135CF0B5C237F1496372AC0FFC064DA47E66BCC86710BFBD13EE6BF86F88B274
          6AA6FB35FAABFE47A068BF1C7E19EA8513FE1215B191B1F25EC0F0E33D8B11B7
          F5AED8663879FDA3E6F15C199C61AEDD1E65E4D3FC37FC0EFB4ED4F4ED4E2F37
          4DD42D2F23EBBADE659063EAA4D76467196CEE7CE56C356A0ED560E2FCD35F99
          6863B1FAE2998EA636BDE13F0D6BF1B26B3A0E997FB8759ED919BF06C647E06B
          39D1A73F895CEDC36658BC234E8D4947D1B3CFBC41FB3EF80351F30D847A868E
          EDC8FB25C6501FF75C30C7B0C57154CAA84F6563EA307C7B9B61ECA72535E6BF
          5563CF35EFD99359404689E27B0BA40F944BD81A260BEEC9B813F80AE19E4AFE
          C48FA8C2789746D6C45169F934FF003B7E679DF88BE107C45D0F74B3786AE67B
          7504B4964EB72081ECA777E95C3532EC453DE27D46178D72AC4AB46A24FB3D3F
          3D3F1303C59A03F86EEECED27BD124F71669713AB40D1790E49CC477FDEC6072
          38E6B19C274F73D1CB733A58D8CDB8D95DA5AA775DF4D8EAFC17F16B5DF0E68C
          D6AD2EA177730AA2D81374440A9DC48BD5F030073D0638EB5D14B1D529C773C6
          CD38470F8CAEA718A517F169AFC9F4F33A8F097ED1BE2AB1BA6FF8482CACF54B
          63D1224F26551CF47C907B7519F7AE8A39C544FDF5747998FF000EB055A3FECD
          270979EABEEFF267B17827E38782BC4D6EF896E74FBC8C0DD6B7280331FF0060
          83861F91F6AF56966346A2DEC7C1665C17996065F0A947BAFD7B1D968DE2FF00
          0E6ACA0D9EAB6DBF91E5C8DB1B8EBC36338C76CD74C3114E7B33C2C46558BC3B
          B4E0FE5AFE46E2B2B2860C0A91907B1AD8E069AD05A041400500140050014005
          0014005001400500140050014005001400500140050014005001400500140050
          0140050014005001400500140050014001A00F893F691F15C1E29F89D79F6385
          522D347D823719CCA6366DCC7FE04580F61EF5F299955F6B5DDB65A1FD03C139
          6BC06551537EF4FDEB76BA565F75AFE67B27EC6BA4ADBF81F54D69A3649AFEFB
          CAE7182912E063FE04CFF957AB9453E5A4E5DD9F01E22E35D6C7C28FF247F16F
          FC923DD31D6BD63F3D3E7BFDB375775D33C3FE1F8655DD34F25E489DC845D8BC
          FF00C0DFF2AF1738A968A89FA7786983E6C4D5C435B2497CF57F923C03C13AB5
          8E85E30D2759BFB26BCB7B2BA49E5863600BED391D78C838383E9DBAD78587A8
          A9D45292BA4CFD4738C254C5E0AAE1E94B96524D27EBFD58FABFC3FF001F7E1B
          6AC5165D52E74B7638C5F5B32283EEEBB947D49AFA8A798D0975B1F8662B82F3
          6C3C5C953E64BB3FD1D99B5E2CF89BE0BD37C2D79A95BF89748BE610B8820B6B
          A499E69369DAA154E793F80EF5A55C5D28C1CB991C59770EE6189C54297B2925
          7576D3492EAEECF8E356B4F175DF84F4DF10EA2F3BE8B0CADA7593BCA0AC2CBF
          3140BD557AE0FB63B0AF98A9CD38A93D8FDC705570787C654C2D1B2A96E67A6F
          D2EDF53DA3C537771E1BFD8F745D3EE184575AB144551D4C724AD391FF007C01
          9FAD7AB36E8E0147BFFC39F09858C730E2FA9556D0FCE2947F33C33C39A4DFF8
          875AD3F4CB1B7224BDB94B68E420F97E6363AB7B0E48F4AF1E8D0756492EA7E9
          398669470509D49ED157FEBF23D5B5CFD9C7C69628D2E957DA4EA8370F916468
          24618F471B7FF1EEF5E8CF28AABE1699F1586F11B015656AD0947F1FCB5FC0F3
          FD63C1DE35F054BFDA1A9E87AA691B4ED5BB88908A7D04919C0FC4F35C53A188
          C3EAD347D3E1733C9F3997B28D48CDBE9FF01FF91D2F807E36F8DFC357D1ADFE
          A73EBFA7EE5592DAF5B73EDFF6243F329FAE47B57450CCEAC1AE6D51E4665C0D
          96E369C9525C93E8D68BE6B67F81F5A699E2BD1AFF00C149E2F8AE48D25ACCDE
          348C39445525830FEF2E0823D457D246B4654FDA2D8FC52B65B88A18B78392F7
          D3B7CFA7DE79F689FB44FC3ABF655BD9F51D218F7BBB5253FEFA8CB63F1C571C
          333A1276BD8FA2C5F0366B878F328A92F27FA3B1EB76D3C3736F1DC5BCA93432
          A078E446CAB2919041EE08AF413BEA8F90945C1B8C959A1C5467240C8A622AEA
          5A7586A96FF67D46CAD6F21CE7CBB885645FC98115328A968CD2956A949F3424
          D3F276386F107C17F873AC1691BC3D1584CDD64D3DDADCFE4BF2FE95C9530142
          7BC4FA0C2716E6D85B28D66D2EFAFE7AFE279DF897F665824566F0FF008AA68B
          8CAC57F6E24C9CFF007E32A40FF809AE1A99343EC48FAAC27895888B5EDE927D
          F95DBF077FCCE035DF805F1034A694DA69D65AC22F2AD6772A09E07F049B4FF3
          AE19E55888BD353EA30BE206555BF88DC5BE8D7EAAE36FFC03F11357F86EDACF
          891E3D2ECBC2F6CF1D9D9DE5BB472CAB9DCE781EE0063D71C71CD3961ABBA779
          E891CF87CF32AC3E62A9609734EB35769DD2E8BFCDA5B7E0715E1FF19F8C3440
          D0E85E22D56D902EC31C7704A28CF653903F0AE48622B52F864CFAAC664D9662
          DA55A9464FBDB5FBF73D2BC0FF001F7C6D6BE24D2AD3C493DA5E69CD2243704D
          BAA485490BBF702064673E8706BBF0D9AD5E74A7AA3E4B39E03CB961EA4F0C9C
          6766D6ADAEF6B76E87B7FC4BF8BDA0F8135CB0D3352B3BCBAFB4C466792DB69F
          2937150769233920D7AB5F30A7464A2FA9F9EE4BC298ACDE84EB52925CAED677
          D7A9A3E11F8ADE05F13C67FB3B5D86399503BDBDC830C8A3E8DD71DF04E2B5A5
          8CA357E191C99870CE67807FBDA4DAEEB55F87EB63A8D375AD2352447D3B54B2
          BB57FBA609D5F3F4C1ADE35232D99E4D6C257A0ED560E3EA9A2FE6ACE70A0028
          00A002800A002800A002800A002800A002800A002800A002800A002800A00280
          0A002800A002800A002800A002800A00CDF146A90E89E1CD4757B8CF95676D24
          ED8EA76A938A8A92E48B9763A309879626BC28C77934BEF3E44F8BBE21D21A7B
          AB23E07D292FAFA186F62D50395BA40E0336F5007CE70460F1CE70735F2B88AD
          1727A1FB5F0FE5F88E5856588972C1B8F2FD9D34D1F63EA2F84DA245A07C3BD1
          74D896252B6AB249E58214BC9F3B119E7AB57D361A0A14A28FC8F3EC64B1998D
          5AAFBB5F25A2FC8EA71C1ADCF20F8DFF006ABD5DB50F8BB736B13EF1A5D9436C
          00E81D8191B1EFF38AF98CDA77AD6EC7EEBE1EE1D50CA9D4B6B26DFE9FA0DFD9
          E3E1869FF101B599B58BABEB5B7B111A46D6AEAACD2BEE249DC082001D3DE965
          D838E22EE5B20E32E24AD92BA50C3A4E52BB77ECADF9DCEBB5FF00D99F55883B
          E85E27B4B9192561BCB73093F5742C33FF00011F8574D4C99FD891E3613C4C83
          4A389A2D79A77FC1DBF3383D4BE087C4BB19C88FC302E067225B4BA8581FCD81
          FD2B96796E223B2B9F45478DF25AB1D6A72FAA6BF43BBF873F083C73ACD869BA
          2F8E847A5F85B4EBB7BB16024469EE646EA0B21385EA324E70C40EC475E172FA
          92B2ABA25D0F95CEB8AF2EA156788CBEF2AD34A3CDAD925EBFA75DFCD3F6C5D4
          546A3E1CF0D5A85486D6DE4BA7854008377EEE318ED8547C7B1A59BCEDCB4D1D
          1E1B615CFDB6327AB6D2D7EF7F9A3CDFE1278DD7C2BE22D1DB576B8B8D0AC2F2
          5BB3690A296599E231890679623238CFAD79F82C52A335CDB1F51C4DC3F3C7D1
          9CB0CED524947D5277B1F52E83F193E1CEB05228BC496F673119F2EF91ADC8F6
          CB80BFAD7D1D3C7D09FDAFBF43F1EC5F0966F854DCA8B6BFBBAFE5AFE0687C41
          F13F846D3C0BAA5DEADA8E9F71A7496AE86359D1FED1B94808A013B8927031F5
          ED575EAD254DB93D0E5CAB038E96369C68C5A9A6B5B356B757E87C1EAA05B29C
          82EC7AE7F9D7C74B567F494629414CFA39EE67F0C7EC7F14170A209B562D05BA
          B0C931DC4CCD9C7A98C31FC457D026E9E0527D7F53F269429E61C5EE51778C2C
          DFAC6297E67937C26F0247F113C4573A4B6BB6BA54B147BF6489BE49C670E106
          472A327DB8E3AE3CAC1E17DB5471BD8FBAE28E20FECBC3C6B2A6E69E9E4B4D2E
          7D99AFEB7A0F813C23F6DD4EE45AE9D63124318EACD80151147F131C7007F2AF
          AA9CE346177B23F03C2E131199E2BD9D257949FF00C3B7E47CEBE2BFDA53C457
          3330F0E69165A75B67E57B91E7CC473C9190ABDB8C37D6BC3AD9BC9BB4158FD4
          B01E1C61E9252C64DCBC968BF57F91896FFB41FC48898334BA45C293F75EC71F
          FA0B0AC239B574F5B7DC7AB3F0EF2AA9A47997FDBDFE68EBBC31FB4ECE1A38BC
          47E17490646F9F4F9B6ED1DCF96F9CFF00DF55D74F39E9389F3F8EF0D6CAF85A
          DAF692FD57F91EE5E06F1C7867C69626E740D4E2B9645066818EC9A1CFF7D0F2
          3EBD0F635EBD1C442B2BC59F9CE6594E2B2DA8E9E2216F3E8FD19D11C1AD8F35
          88C88F134722AB2B02A4119047A115364F429392775B9C7EBFF0BBE1F6B8AFF6
          FF0009E97BDC60CB0422193FEFA4C1AE7960E8CF78A3D9C2F1166785FE1D697C
          DDD7E373CF7C47FB34F85AF22FF8926B3A9E99273C4C45CC78EC3070C3F3AE3A
          B945296B0763EA303E22E3E8AE5AF0535F73FD57E070BE23FD9D7C676D87D3F5
          4B1D71963DAA5E43048028C2AFCF9046381F3718AE1AB9455E8EE7D2E5FE2165
          CFDDA94DD3F95D6BBED6FC8F38D63E1FF8E344B961A978575AB6D8A434B1C0D2
          C4011FDF8F2391EF5C553095E96F167D461788B2AC635ECEAC75EED2FC1D99CF
          A5D5DC1731BA4EF0CF6EC36B29292C6C3A73C3022B053A91773D9F6787AD1E5D
          1A7F347A67803E3878D3C397D17F695E4FAE69C70B25BDEC9BA40077493A838F
          5C83DFD6BD0A19A55A6FDED51F239BF02E5F8D83F60BD9CFBADBE6B6FBAC7D6D
          E0FF0011697E2AF0F5AEBBA3CE66B4B95CA9230CA41C32B0ECC08208F6AFA4A5
          563560A71D8FC471F81AD80C44B0F595A51FEAEBC99AF5A1C614005001400500
          1400500140050014005001400500140050014005001400500140050014005001
          40050014005001401C77C68D2752D73E1AEB3A66952471DDCB082A5D880C1583
          15C8E990B8F4E79AE6C64652A3251DCF7387315470999D2AD595E29FE6ADF85E
          E7CB9F0B7C0A7E285CDEDDEA9E308AD352F3E3FDC4F1EE96E63232CC32C3385C
          018C8E39C0AF9CC260FDBCAED9FAF67F9FCF23846950A17A767AAD93E9D1FE36
          F23ED186348A258A350A8AA1554740070057D5A563F06949C9DD8ADF77DA98AE
          7C91F147E0DFC4ABEF17EB3ADDBE9F6FABC3777735C23DBDCA2BEC66CA8D8E41
          C85C0C0CF4AF9BC5E5D889D4725A9FB4643C659461B054B0F26E2E292774F7F5
          57EA7B3FECD5E12BEF0A7C3D31EAD64F67A8DF5DC97334521F9D578540C3B1DA
          A0E3DEBD5CBF0EE852B4B73E078C336A799E60E749DE31492FCDFE27A7B63D2B
          BCF941300F614586078ED49E807C49FB456AABABFC63D75E39418AD1E3B3423F
          E99A00C3FEFA2D5F2799CF9B10CFE83E07C2AA393D3BEF2BBFBDFF00958D0F83
          1F07A7F889A0EA5AACBABB696904E2DED9BECE25591C0DCFB86E070015E9EBED
          5AE0701EDE2E4DD8E3E27E2FFEC4C453A34E1CCDABBD6D65B2E9EA69788FF677
          F1DD82B7F653E99ACC6C7FE594DE4C9F5DB271FF008F55D5CA2B2D60EE73E0BC
          45CB6AAB578B83F4BAFC3FC8F27D7344D4741D5A7D2B5AD365D3EFADF1E6432C
          6A08F4208E181EC4641F5AF3AAD3A949F24CFB2CBF1D84C7D2F6D41A713D17F6
          78F02F867C75E27BA835FBBB82B651A5CA58C636ADD2E70DB9FAED04AE54609D
          DD6BB72CC3C2B4DF3F43E4F8DF3BC665B868AC3AD24ECDF6EDA7DFF76C7A37ED
          6DE217D1E4F0968FA53C50CB6939D4563DAA550460246361E31CBF5E38AEECDA
          AF228C17A9F2DC01964719F58AF5F66B96FEBABD7EE3CDBF67D8AE7C4FF1D2C3
          53BB6133A493EA372EB85DCC15883C7FB6CBC570E5D194B129BF53EB78C7D8E0
          B2295286DEEC63FD7A2659FDA93C5B3EBBF1066D1ADE673A7E8BFE8F1A03F2B4
          F8FDEB9F719D99F453EB5599E21CAB7227A232E04C9A387CBD62651F7EA6B7F2
          E9FE7F333FE10FC25F12F8E5ADAFD956C34032B092F9F69760A7E658D339249E
          3246073D718A8C1E5F2ADEF3D8E9E24E2EA19527420F9AAF6ED7EEFF00A67D27
          A6FC15F86967662DFF00E118B6BA3B70D35CC8F248DEFBB3C1FA62BDD8E5F412
          B729F93D7E2ECE2ACF9FDB35E4AC97F5EA79DFC5AFD9F34C5D2AE357F02ACF05
          DC285DB4E96632473281922366CB2B7A02483D38EB5C58BCAE0E2E54F467D2F0
          F71E6229D68D2C6BE68BD39B66BD7A58F9EFC35AFEAFE1BD6A0D6743BC7B4BDB
          7E524E31B7BAB03D54F753FCEBC3A15674669A67EAB99E070D8EC2CA962217B9
          F747C39F155A78C3C13A7F88E00B08B88BF7F16EFF0053229C4887E841FC306B
          EBE8565529A9A3F9C734CBA780C5CF0F2E8F4F35D19E2B6DFB426B3AC789B4FD
          2FC3FA05ACA92CED0BFDB25D8672CC426D6538401704939CD791FDAD2E7B247D
          DC780E953C24F1189AAD24AFA2DB4D74EBF817346FDA4ED229E5B5F12786A48A
          4819A37934EB95994B06C70AFB78E0F218D690CDE37B4D7DC4D6F0E6BCE0A784
          A89A76D24ADF95FF0023D0349F8D3F0D351611A78A6D6DDC8071771BC03F3750
          3F5AEE8E3A84BED1F3389E11CDF0EFDEA2DFA59FE4CEDB4DD474FD4ED85CE9B7
          D6B7B0138F36DE559133E99524575466A4AF1773C0AD42A50972D48B8BECD5BF
          32E75E9C55196A709F153E18F873C77A748B756D1DAEA814F91A8C4804A8D8E3
          77F7D7D54FE1835C78AC1C2BC755AF73DFC8F88F1794554E9BBC3AC5EDF2ECFC
          D7CCF8B7C47A4DFF008735DBBD1B558C2DD594CD048149C641EAA4F623041F42
          2BE52B519529B8B3FA13018EA58DC2C31349DD495CF72FD8D359BB8B55D63437
          B946B2991274859FE6594643328FEE95001F7DB5EBE4F59F33833F39F1272FA6
          A952C4C56BAA6FCBB3F9EDF33E9EAFA03F220A002800A002800A002800A00280
          0A002800A002800A002800A002800A002800A002800A002800A002800A002800
          A00E37C7BE3983C2F33C4F60F7823B47BB995255575850FCEC14F5C0F719240A
          E5AF898D27667B396E513C6C39D4ADAD969D5EC8E4BE0978C7E1E789B57BFB1F
          0AF86D749B883376AD25A2234C18857752A4EDC120633D08C56184AF46A49C60
          AC7AFC439666B84A10A98BAAE517A6EDDBAA5E7EA7AEFA57A27C79E51FB48FC4
          0D63C0BA269274392DE2BDBEBA605A787CC02345CB606719CB2FEB5E6E638B9E
          1E29C3767D9F066414338AF51622FCB15D1DB56F4FC99E77E1FF00DA5F538630
          9E20F0CDA5D74FDED8DC18891DCEC70C3F515C70CE1DBDF89F4F89F0D2326DE1
          6B5BC9ABFE2ADF91F46E87A85BEADA459EAB68C5ADAF204B884B0C128EA18647
          D0D7B70929C549753F2BC4509E1EACA8D4DE2DA7EAB42E93566226E03D280072
          40C8E4F61EB49A056BEA7C21E33F06F8EACB55BFBCD6FC2FAB44D3DC4B2BCD1D
          B19222CCE58E19323193C74AF91C461ABA9F34A27F466519DE533C3C68D1ACB4
          4ADAD9EDD9EA7D73F03FC2B2F83FE1B697A3DDEC37A435C5CB2671E64877639E
          E0617F0AFA6C1D2F654545EE7E1DC4798FF68E633ACB55B2F45A7E3B9DBE33C6
          6BA4F0D9F2C7ED9B2DB378D340B7458C4F1E9F234CDFC451A4F957F30C47D4D7
          CF672D73C575B1FB1F8694E7F57AD27F0F32FCB5FD0C8FD91ED2E26F8A4F3C4C
          0C16DA7CCF2E7D1B628C7E27A7B5659445FB6BF647A3E21D48D2CA953BFC5256
          F95D99BFB4E6B5FDADF183508D0C7245A6C515926E5EEA37B83EDB9C8A8CCEA2
          9621F9686FC0F96CA964D1BFFCBCBCBEFD17E091E97FB2B48FE22F1678A7C613
          E9965A7E63B7B28A1B48F6C49C65801EB848F3F5AEFCAFF792954B7647C771BD
          F0785C3E01C9CACE5277777E5F9B3E75D7EEE7D47C41A9DFDDBFEF2EAF269A43
          DB2CEC4FF3AF0ABCB9AA36CFD5F2D846960E95386C925F248FABFF0064AB6961
          F84C2592E24956E3509DE3466C888021703D32549FA9AFA4CA93F617F33F16E3
          F9C659B38A56B457CFAFEB63D7D170BEF5E99F0E9585C7E740CF9A7C6FFB376A
          736A37FA8F8735BB1996E279268ED2EE3687CA0C49DA1D77038CE0640AF0ABE5
          0E4DCA123F56CABC46A746942962693D12574EF7F3B69F9B377C2FA7F893E15F
          ECE9E273AEAC305FA3CEF6891CEB208FCD091AF238FBE4B62B6A709E13092E7D
          FF00CCF2B1B89C3710F11517417BAED7D3B5DBFC343E5912163F22166C6176F5
          DDD01F7ED5F39BC8FDA67151A3A6C7D5DA97ECE7E15BDD0ACA3D3EF2FB4AD452
          DD567989F39667DA325D18F073FDD22BE8E594D29415B467E2D86F10B1F42BC9
          CD2941B765B597935FADCF3BF10FECE1E36B4666D2F51D2B558B3D0CAD0487FE
          02C0AFFE3D5C55328AABE0773E9F09E23606A3B57A6E3F8AFC3FC8DFF827A6F8
          B7E166A5A8AF89BC3DAA43A46A0AB133DAC1F682932676B8F28B6010CC338F4F
          4ADB054ABE19B535A33C9E2BC6E5D9E429BC2544E71D75D347BAD6C7D19A3C4D
          0E996D13CB71295894179CE643C7F174E6BDC8EDA9F9855779BB1680CF5AA443
          3E3BFDADC403E2C49E515DED616ED301DDBE6193EFB42FE42BE6336FE37C91FB
          AF8777FECA77FE67F769FADCB5FB23E89777DF119B5B8A37163A65B3877C614B
          CAA55579EF8C9A7945293ABCFD8C7C44C752A797AC37DA9B5F72776CFAF173B4
          67AD7D31F88316800A002800A002800A002800A002800A002800A002800A0028
          00A002800A002800A002800A002800A002800A000F4A00F95BF684D06DBC49E3
          0D6F57D37C4F672DD582A5ADC69A643BC0503E55C75C64B1041190727B57CC66
          7695594AFB1FAE707E33EA985A74AB517695DA974D7BFE4BF23A8FD8E74EB48B
          42D7B525B606E0DEADB0B923EF46B186D83D002727D723D2BBB28A6941CBA9E6
          788F8C94F114692768F2DEDE776AFF00723DF862BD93F363E46FDAEF541A97C4
          FB6D2D65022D36CA347EA4249212EC481FECECE9CD7CDE6D3BD651EC8FDAFC3F
          C1BA595CEBA5ACA4FEE5A7E77357E23FC2FF0002E89F042DBC4DA06A31DCDF44
          62917503292350DE76B4613A0F50B8CAEC20F7ABC4E128C70AA717F3EE70E41C
          459A57CFA586AD1B2775CBFCB6D6EDF5F37B3BE9D0F65FD9EAFBEDFF0007BC3A
          E6457782D8DB3807EE98DD931F8002BD4CBE5CD4227C1F1650F639BD756B5DDF
          EF57357E28F8CAC7C0DE0EBBD7AF0091D3F776B06706798FDD4FA7524F600D6B
          89AF1A10726726499555CDB171C3D3EBBBECBABFF2F33E44B5F8B9F11E2D46E2
          F62F15DFEF9E5F31D5B6BC41BB0546042AE3F84638FCEBE69E635D4AEA47EE6B
          83F26749519D2574AD7EBF7AB7E27BE7ECDFF12FC4FE3AB9D56C75D86C644D3E
          28DC5D43198DCB3B1C2B28F97A29E463A77AF672EC654C45F9BA1F9971A70DE0
          B26F672A0DDE57D1EBA25BF73DA318F6AF52C7C1DCC5BAF167862D75C3A25CF8
          834B87530066D64BA45979191F293D71CE2B175E0A5C8DAB9DB1CB7173A3EDE3
          4E4E1DECEC6CAB060ACA41523208E86B5B9C4D35B9E15F1EBE0C6BFE35F162F8
          8B44D5AC0136B1C125ADE6E4DBB09E55D41EBB8F0475AF2B1D97CB113E78B3F4
          0E16E2FA194E1FEAF5A0ED76EEBCFCB413F669F875E28F04F88B5C9BC43A5DBC
          11CB6F1C305C24EB26FC392C171CED2319CE0E40E2A72EC1D4A13939A2F8CF88
          B079B50A51C349E8DB6AD6E9D4F9DFE25FF6847F1135D3AE433DBDF497D2BCA8
          E318258E31EAB8C608EA315E2E3232F6D2E6EE7EA190D6A0F0147EAEEF1514BF
          0FCFB9F53FECA7A59D3BE1059DCBA157D46EA6BB391C91BB629FFBE507E75F43
          95C3930EBCF53F1DE3AC5FD67379ABDF9525FABFC59F327C59F0E5D785BE216A
          FA55DC4557ED0D35AC84604D0BB16465F6E4838E8548AF9EC6D1746AB4CFD878
          5F35A5996069D45A34927EA91EC7FB2278E2CADECEE7C15A9CE905C3DCB5CE9E
          CE4012EE037C59FEF023701DC13E95EB653898F2FB27F23F3EF10B23ADEDBEBF
          0578B56979767E9D3FE1CFA481AF70FCBB6394F899E39D2BC07E1E6D5B53DD2B
          BB7976B6A8C0497127A0CF400725BB0FC01E7C46223423CD23D6C9B26C466D89
          5428FCDF44BFAD8E0B41FDA37C077DE52EA516A9A4C8E76B99A01246A7D77212
          71F857253CD68CF47747D1637C3FCD30F7941C66BC9D9FDCFF00CCA1FB5D6BC8
          3E1CE91656922490EAB7892EF0DF2BC489BC7D412C86B3CDAA2F6292EA75F87D
          819BCCAA4E4B5826BD1B76FD19F336A9A56A5A4DBE9779736AD6D0DFC3F69B49
          0B8F9D376030F4391DEBE7FD9B8D9B3F5DA798D1C44A74A0EFC8F95FA9EC7E08
          FDA07C4F69A66A527886FB4ABF9208A3FB1C525B98E5B8727046F8FE5E0609C8
          CF5AF5A8E6B351F7B53F3CCE38130BF588470A9A52DF54D2F93D4ED7C35FB4A7
          87EEE36FEDDD06FF004E75032D6F22DC213EDF75BF435D30CE29BF893478B8BF
          0E71F4D5E8CD4979E9FE68F4FF000378F3C27E35495BC37AC4578F1286962DAD
          1CB183C72AC01EBC67A57A147114EB7C0CF90CC726C6E5B6789A6E29ECF74FE6
          8EA074E6BA0F2B70CF1C5033E11F8DBAB8D7FE2B788B524612422EDA08D97A6C
          8808C1FC7693F8D7C863EA7B4AD267F4770A60BEA79551835AB577EAF5FD4FA1
          BF641863FF008561338538975499B04FF75231F8D7B3942FDC7CFF00C8FCBFC4
          49B79A25DA0BF16D9ED75EB1F021400500140050014005001400500140050014
          00500140050014005001400500140050014005001400500140050057D4AEE1B1
          D3EE2F6E1C2436F134B231E8AAA0927F214A52514DB2E9537526A11DDBB1F3DF
          8B7E10E9DE3DB2B0F18F80B52B786E35491A5BE79E57D8E1C92CE00C9570720A
          77CF3822BC4AF828E2529D37B9FA3E57C5353259CF098DA7751DBBE9B76BA7D1
          9EA5F053C1EBE08F015AE8ED72B73334B24F34AA9B5599CF61D7000039AF4707
          43D8D2513E4788F36FED4C74ABDACB4497A1DB30E3D2BA8F0EC7C29F1AE3D6FF
          00E164EBFA8EB3A65E69EF737924902DC2152F0A9D8854F461B5472322BE4B1E
          A7EDDB92DCFE8AE14AB8559552A74669F2A57B3EAF57E9AF73D7BE3A785A6D27
          F671F09D9C487769135B35CFCDD0C91B2B9F7F9DF1F8D7A78EA2E1828AED63E1
          385B318D7E25AD3BFC7CD6F9356FC11B3FB23EB36D17C32D623BBB958A2D36FE
          49A4773858A268D5C927D321CD565157F70F9BA339FC44C13FED5A7ECD5DCE29
          7ABBB5FAA3C77E2A78AB54F8B3F11ADADB45124F69E67D974AB2190704F32303
          C066C6493F7540F435E762EBCF1755463B743ECB87F2AA1C3B97BC457694AD79
          BEDE4BD365DDFA95BE37786B4DF065FE8FE16B50B2DDDAE9C92DFDD2823CF9E4
          662587B00A00F622B3C7508D0718ADEDA9D3C2799D6CD156C555D23297BABB24
          97F4FCCF72FD8F3485B4F87F7FACBA309B52BF60188E1A38942AE3D7E62F5EC6
          514B968F37767E7DE23633DB6671A49E918AFBDFFC0B1D9FC6DF1F5B7803C212
          5FA88E5D4EE49874F81FA3498FBEC3FBAA393F80EF5D78CC5470F4EFD7A1F3BC
          3991CF38C5AA7F623AC9F976F57D3EFE87C53336A5AACD7FA94D04F7F2293737
          B7063DFB4BB60BB9E832C71F8D7C949CE72733FA0E9C70D8654F0FA27B457A2D
          97A23DB7F635D6EEA2F126A9E1D9EF246B79ECFED1042D212A8F1B8076827032
          1F9C7F7457B194566EA4A0DF43F3AF11B2E8470D4B1118A4D3B37E4D75F9AFC4
          FA03E26789D3C1DE07D4FC44D0ACEF6910F2A266C0925660A8A4FA1622BD9C45
          6F634DCFB1F9A651973CC3194F0C9DB99EFD96ECF1FF000F7ED3162F1EDD7FC3
          17504A38DD633AC81BDC2BED23F335E5D3CE62FE389F738CF0DF1107FECF553F
          26ACFF000B9DBE9BF147E1478CAD563BBD474E208F9A0D5EDBCBDBEC4C836E79
          EC4F7AEC58CC355D1B5F33E72B70FE7796BE68C24BCE2FFCB5FBD1E85A50B05D
          3E04D2D6DFEC48812116DB7CB5503002EDE303DABB63CB6F74F9BAFED7DA3756
          FCCF7BEFF3B9CBFC53F877A2F8FF004A4B6D40B5B5EC1936B7B12032439EA307
          EF29EEA7EBC1AE6C56121888D99ECE43C4189C9AB7B4A5AC5EF17B3FF27E6782
          5EFECFFACE8D67E23BDD4AF9B50B5B1B069F4C6B18FF007D713F501939200C73
          83DC107835E34B2CA94AED3B9FA1AE3FA78CA9460A16E69252E6D92F27A1ADF0
          C3C6DE38F0778393FE134B3D6174FBDB9F2F4BD46FA4F9626DBC249BFE754247
          048F5E82B48623114295E49DBA1E767595E5B98E36D8271E64AF28AEBE6ADA5D
          75B1E1DAF6BDAB7897587BDD63509F55BA76F2D6479B79FF007500E003D801CD
          7955AAD5ACEEF53F48CB70785CBA8F2D34A2BCBF5FF827A6FC15F82DAA789357
          B5D5BC49652DA787E0712F973028F7A7A850A79087BB1C64703AE47A180CBA73
          6A75169F99F27C53C6187C3507430B2BD57A69B47CEFDFB2FBCF67F88DF127C0
          BA4789EE3C1FE2ED252E60874F4BC4678166491C92042108F95B00104903E95E
          AE2315429CB92AA3E0326C8B34C55158AC0C9A6DB5A369DBBDFB1E75F015340F
          15FC72D635AD1F4D96CF48B0B00D67677256431B390A703242A83BC800F1BBDE
          B8B02A9D5C439C5688FA4E26A98DCBF28861310EF394B56B4BDB5F2BF4FB8F66
          F117C2EF87FE20677D47C2BA6B4CEBB4CD0C7E4C831D0864C735EA54C2519EF1
          47C4E1788733C234E159E9DF55F8DCE0B5CFD9ABC29720B693AC6ABA6C9D8485
          2E107E0406FF00C7AB86A6514A5F0B6BF13EA707E23E6345FEFA119AF9A7FAAF
          C0D7F817F092E3E1D6A7AADF5E6B516A2F771243108A068C2A2B1624E49E49C7
          03D2B7C1E0BEAEDBBDEE797C4DC53FDB50845439796EF7B9EB5D2BD03E40CBF1
          6EAD1E87E16D5359959556CAD25B8C9FF65491FAE2B3AB3F670727D0EAC061DE
          2B134E8AFB4D2FBD9F9F0F752C92BCB2C858C859E420E4331E49AF8995DCB53F
          A82828C146DB58FB87E02E8D7BA17C2ED0AC3508C4172B6ED2C9163053CC7690
          03EE030CFBD7D76069BA746317FD5CFE78E2CC6D3C666D5AA527757B27E892FB
          AEB43BDAEC3E702800A002800A002800A002800A002800A002800A002800A002
          800A002800A002800A002800A002800A002800A00E23E3B6A274CF851E20B810
          4F3EEB4688A42DB5B0FF002939EC06EC93E82B971B2E5A127E47BDC3187F6F9A
          D18DD2D53D7CB5FC7A1F39FC009EC353B4B9F0DF887C4DA8DB69B35E4220D1EC
          5D924BA99C60B12A3704181900F2464F4E7C3CBE6A5EE49E97DBB9FA4F18E1EA
          51A8B1386A49C945DE4F68A5EBA5FB1F5EC31A43024310DA88A1546738006057
          D2A5647E33293936D8B236D46620E1413803345C12BBB1F38F8F7C59A1FC51F1
          7785BC289E19D7ACEFED75B4798EA36C212B6FD64F972490C14751C63DEBC8C4
          CA35EA421CBD4FD0F26C1D6C9B0B89C4FB68B8B83B72BBDE5D35F2FD4F5DF8D5
          63A66A1F0BF5D8F5686592CE1B6372C226DAE3CB21C6D3D8F15DD8C8A9D09267
          CAF0F62AAE1B32A53A5BDEDF7E87CE1AC49E0AF0DFC38D7B42D2F5CD52DEEF56
          5B5BA584AEF5B9453908580036FDEDC41F6E7A57CF292A746504F73F50C3BC66
          3B34A388AB4D38C2E9BEDE7F95BF43D2BF660F8616FA3D92F8E3548643A95F46
          4D8C72803ECF0B0FBFFEF38FC971EA6BD4CB309C90F6925AF43E5F8E7881E271
          32C1D197B89FBD6EAD74F45F9FA1E2BF143EDBE2CF8BDE266D3E092F2E46A0F0
          2471297F922FDD8E075C04CE2BC7C5F354C4CACBA9FA070EE230F82C9A8A9492
          B475BF77AFEA7D61A1CB63F0FF00E1369CFADBADAC3A469910B9C000EF083728
          1DD8B1C01DC9AFA584A387A0B9F4B23F18C553AB9CE6B3543DE7526EDE97D1FA
          25F81F1D7C42F16EADE3FF0017C9A9DE44ED24D2086CED54E561427091AFAB12
          464F7249F4C7CBE22BCB1552E7EF39565787C8700A9AE9AC9F77D5FF0097647D
          21A4FC308BC2BF017C41A398D65D6B51D3249AF1B00FEF9632CB1A9FEEA1181E
          A493DEBDD8E0952C2CA3D5A3F25C4F1354CC33EA388BDA109251F4BD9B7E6FAF
          DC783FECE9A98D37E30F87E63208E2BA91ADA4CF7F32360067FDE2BFA578F974
          F97108FD238D70BEDF259B4AED24FEE6BF4B9F6BEA16567A958CB657F6905D5A
          CCBB658668C3A38F420F06BEADC54959A3F01A556A519A9D36D35B35B9E67E32
          F829F0D2E34FB8BF3A33694F6F0BC8D3584A63C05524FC87287A7A57155C061F
          95BE5B7A1F5180E2CCDE35A11F69CFAA5696BD7BEE7CC7E03F0C5FF88EF1349B
          6960B69AFC1FB1BDD4BE50638C9E7079C7418E79AF99A5479EA28C5EA7EC59C6
          6D1C1D175AA2BA8EF6573DEFE19FC2BF12695E2B87FE125FB38D26C2D54E9A74
          ABF9225499597975E198B0C9EE3A835F4186C1CE12BCB6F23F2BCEF88F0B8AC3
          B585BF349EBCD157B793D5687ADBDFCFA50D4F51F116A1A75A69B1C80DBB17D8
          238C0E4BB363E6273C0E98E2BBF9B91394DE87C8AA2ABB853C3C5B9BDFD7C92E
          87969FDA1B46BFF1141A2F86BC35AB6B325C4FE44122C91C22562700A8639C1E
          B96C71CD702CD29CA7C914D9F5F2E04C551C23C5622A46292BBDDDBD7FE05C9E
          FF00E347849F509FC37E38F0C6A7A5BA4E209D2F2D52EADD587232549CF62080
          7D6AE58EA5CDC95158E6870A63942389C15552BABAB3717FD7CCEDBC097DF0F7
          598DEE7C1C34293CA625C59DBA472467D5976865EBD48AE9A33A1357A763C5CC
          A8667867C98DE65EADB5F7DEC75C4727F9D749E31F347C69F82DE3BD7FC67AB7
          89749B8D3B538AEE4578EDDEE0C332A055508030D9C01FDE19AF0B179754AD55
          D44EE7EADC3DC6B80CBF034F093838B8EEF75BDEFA6BAFA1E49A9F82BE21F856
          F7ED7278775DD36446D91DCDB2B1C36463E78891C9C639EB5E77D57114257B33
          ED259EE4F9A53D6A464ADB3B5FEE675B79F12FE2AF807C42DE1DBDF1347A9DC5
          A2279E9791099017456C1620392338CE715D0F1D88A0ECDDFD4F0B0BC3393673
          8755E9D3E4BDF54EDB3B6DAAD7D0EABC3FFB4CEA90A30F117866D2E485C07B09
          CC449CF757DC31F8D6F4F3AFE789E6637C3786F86ACD7AABFE563DDBE1AF8D34
          BF1E786C6B7A545750C6B298648E740192450091904823E61C83F957B187AF1A
          F0E689F9DE719456CA712F0F5AD7B5F4EC74E39ED5B9E51E53FB536AC34EF849
          79681F649A9DC4566A41E705B7B71DFE5423F1AF3734A9C941DBAE87D970260F
          EB19C424F68272FD17E2CF92BC21043378B748B4B852BBEFA25236E43E645C0F
          C6BE768A52A91BF73F6FCCA7ECF0751C74B45FE4CFD0B8C601F726BED0FE5F63
          A810500140050014005001400500140050014005001400500140050014005001
          4005001400500140050014005001401C17C6DB5F10EADE129BC3FE1BD223BDBA
          D4A296269E7942456C9B79273C966CED51EBC9C62B8F1B194E938C56ACF7787A
          BD0C2E2E388AF3B2834F4DDFFC05BB3E5EFD9E74DBD93E376876E4BDACD6B34D
          25C63EF011C6E190FD4FCA6BC0CB69BFAC2F23F62E33C5D3FEC39CD2BF325F8B
          567FA9F6DA8C28AFAB3F00109C0E4D26D20DCE0FFE16FF00C343A99B06F1769F
          F68490C5B995C206CE0FEF0AEDC7BE715CBF5DA1CD6E63DF5C2F9BAA7ED3D83B
          7CAFF75EFF0081D5BFF64F88F439A059ADF51D36FA1785DA1943A488C0AB00CA
          71D09E95BFBB517933C7FDF612B26D38CA2EFAAD57C99E69AAFC09F0E5FF008B
          F49D55AF265D274EB78E11A518C346CB19CA2EEEBB0924B02093EBC9AE0965B4
          E55149BD1743EAF0DC698BA183A942315CF36DF375D77D3BF6EC7A9DF9B88B4F
          B8363107B94858C11E428670A768E781CE2BD16DA5A1F234D4655173BD2FAFEA
          7C93E06D2BC6C9E39F09E89A8F862EED2E2D75B3A8CF7325A3A4936E60D2991F
          EEB2A807183DC57CED2A559578DE3ADCFD873096552C057C452AC9A70E54AEAC
          9EB6B2DEED977F695F8892F8A353B9F0A58A2C7A46957643CC3992E2E10329FA
          2292463072413E946678B94DFB34B442E09E1E8E169C71B397BF35B764F5FBDF
          FC0395F097C19F1AF8A7C309E20D1EDED56DA427C88E7B931493007EF2E46319
          CE092338E2B9E865F5AA43DA44F6B32E30CBF038A784AF776DDA574BD75FD0D4
          D4AD7E3A7846CE682E5BC4B05A18CC6E6390DDC241183D37E09CF5E2B571C6D1
          4EF7B7DE7242B70B66734E1C9CDBAD395FE8799E8179FD99AB586A4370367711
          4E7672708E18E3D7A579F4A4E15133ECB194162707282EB16BEF563F44ADA649
          E049A33949143A9F62323F9D7DB277573F9727170938BE8709FB41EB6DA1FC23
          D6EE6223CF9E35B5854FF1348E17F9163F857263EA7250933E838530AF159AD2
          8F44EEFE5AFE763C27F675F0C69DE30F12DAEAB7571756D71A2DDA5CB5B79598
          A523E640AC7A7CC3711E83A739AF172EA0AAD4E66F63F44E31CD2A60B0F2A718
          A6AA2B5EFAAE8FF03EB26F9467AD7D33D8FC63667C83FB51F8CA5D7FC7175A0C
          331934CD1FF71E529F95A7233248477233B07A60FAD7CD6698872A9C89E88FDC
          380B28A785C0FD66A2F7EA6BE69745F3DFFE18E93E0DFC05D4679ADB5FF15DDD
          C69889B27B5B6B39C2CE4E032B3483EE0E9C0F9BD48ADB05963D275343C9E27E
          38A2D4B0B825CCB66DAD3D12EBF3D3D4F5CF1C7C2AD07C4DE131A135D5FD9B25
          C9BB4BA598C923CC4105A4DDFEB3838E79C01822BD2AF82A7563CA7C3659C478
          9C062962124F4B5B656ECADB7F573E4DF12E95E26F863E3B7B2371259EA56A04
          905E5B311E6C4D9DAE87FBA704153DC10735F35569D4C1D4DCFDBF058EC0712E
          0EEA175D53E8FB7F5EA8FACFE0D78FA3F1AF80175ABB022BCB32D0EA000C2F98
          8A18BAFA2B290DED923B57D2E1315EDE9733DFA9F88F116452CAF1EE82F865AC
          7D1BB7E0F43CB5BF683D7349D5605BED3747D6ACAFE359E05D3E6649600EC42C
          6E4E4170319181D6B8A79A384EC95D1F554781A96268B6A72A728E8F995D3B75
          5B3B1F47AF232015CD7B3D0FCD3AD8C4F11F843C31E2253FDBBA069BA8B94D9E
          64F6EACE17D03E370FC0D653A14EA7C4AE7760F33C660BF8151C7D1E9F76C79E
          6BBFB3BFC3FBF677B0FED4D20B745B6B8DD1AFFC0640DFCEB8AA653879BBAD0F
          A9C271FE6B422A13E59AF35AFDE9AFC8EEBE17F836CBC09E128740B1B896E952
          479649E450AD23B9C9240E07181F415D987A11A10E447CEE739B55CDB14F1351
          59BB2B7648EA2B73CA3E69FDB3F57325D787FC3909059564BD9573EBFBB4FE4F
          5E06735358C3E67EB3E1A60DA8D6C53F28AFCDFE879CFECFBE1A4F10FC4BD345
          DBAF916327DA648C8CB485016C0F419039FA570E5D4B9EBABEC8FABE32C7CB05
          95CD47792B7DFA1F6D40BB2145008C281835F58B63F9F24EEC7D310500140050
          0140050014005001400500140050014005001400500140050014005001400500
          140050014005001401E35F1DBE30DBF83A79341D1945CEBA630C59D3315AEEE4
          3373F336390BEE327B1F2B1F8F541F24773EEB85784279AA588AEF9695FE72B6
          F6ECBCFEE383FD8E74E96F7C55E22F115CB3BCB040B00665FBCF3397739F5FDD
          8FFBEAB93288B7394D9F43E23E2214F0D87C2D3DAEDFA59597E7F81F4FFB57D0
          1F921F37FED1FE38F14D97C48D2FC39E19D52E2C1E3863E213812CB3B151BB8E
          4001703B64D78798E2AA46B2A707FD33F4FE0EC8F075B2EAB8AC541496BBF451
          57D0ED2CBE0A7C32D0BC2BE56B96714EF145FE95AA5E5DB46C58F05F76E0A832
          781FCCD75FD470F087BCBE67CF7FADB9C56C47FB3CDA57D22927F2B59DFCCE2F
          E1D7833C61E04F8A11CFE10BA1AD7836FAE009A486EE378CC2DDE400F1226721
          C0F980F7C57361E855A35AF4DDE07BD9B66D97E6B96C96321ECF1315A68D6ABB
          793ECF6F95CD9F137C50F14C5FB4358F827476B3934C17505B5C44D082ED940F
          236EEA3018E31FDDAD2A6327F5A54A3B1C584E1AC23C8258FAD7E7B36B5ECECB
          4F3FD4F6FBA9E2B5B696EE77D90C48D23B1ECA0649FC857A97B2BB3E0A34DCE6
          A31DDE872BF0DFE22F867C7B1DD9D027B92F69B4CD0DC42636556CED6EE08383
          D0FD6B0A189A75EFCAF63D7CDB22C6654E3F595652DACEFB17FC43E0AF08EBF0
          4D16AFE1ED36EC4F209656300577703EF175C3138E339E955528539FC4AE7361
          335C6615A746AB56F3D3EED8DDB3820B4B486D6D624860851638E345C2A2A8C0
          503B00062B64945591C33A92A92739BBB7AB24F71C1A2C2B9F157C6EF00F89F4
          AF1C6BFA8C5E1DBF7D2EE2F25B886E2DA06922F2DC96EAA0EDC64E41C63E95F2
          F8CC1D555A524B43F7AE1CE23C0D4CB29519555ED1249A6ECEEB4EBB9F557C1B
          D465D4FE16786AF27491656D3A257F301DC5946C24E7D76E7F1AFA1C2C9BA31B
          F63F1ACFA8AA398D68C76E67F8EBFA9E51FB686A9E5E8FE1DD1D09679AEA5BA2
          A0F408814647D643F957999CD44A1189F71E1A6193C456AEFA24BEF77FD0CEFD
          8E0EA973AB788659661F61821857CA2BFF002D98B7CC0F63B54838EB9159E4C9
          BE67D0EBF129D382A31B7BCEFF0072FF0082CFA539C0FA8AF78FC98F81BC79AC
          EABAAEB172B736D6F13DB5F5D84B81062498B4A49DEC7EF11803D81AF8FC449C
          EA3BF73FA2F21C252C3E1938C9DDC63A5F45A745D2E7DABF0C1767C37F0D219D
          E7234AB6CC8E7963E52D7D5E1B4A51F447E0D9D3BE615DDADEFCBF3674791D2B
          63CDD0F3EF8ABF09FC3DF106EEDEFEFEEAFEC6FADE1F2566B575F99325806560
          41C12718C1E4D71E2F054F11F16E7D2E41C518BC95495149C65D1FE96389B9F0
          84BF077E0978D47F6C8D49AF86CB76F27CA2A645108C824E5BE624E38E2B97D8
          2C1E1E7AEFFF000C7B91CDE7C499D615B85B977D6FB3E6F2EC7CFDF09A1D367F
          89DE1E5D4AE60B4B25BF8E49649982AAED3B82927A64A819F7AF0F09CAEBC79B
          6B9FA9F1229ACAEBBA31BCB95AB2DF5D3F0DCFBD2DA78278FCD8268E543FC51B
          061F98AFB1BA67F36CA1283B4958ABE21D462D2742BFD5266023B3B692E18F5C
          0452DFD2A6A4B962E5D8DB0941E22BC28C77934BEF763E15F08789FC5AFE29B6
          5D3FC43ABDBDE5F5E20DE974E72F2B804952769C96CE08E71CD7C9D1AF55D556
          93D59FD098FCAF010C0545528C5A8C7B2D92FBD1F7C460AA00CC58818C9EFEF5
          F5E8FE747B8E66005023E26FDA5759FED8F8BBACECB8262B0D965111918F2D41
          61FF007D97AF93CCEA73E25F9687EFFC1583787C96175672BCBEFDBF0B1E99FB
          21E83746CB50D7A4B65489DBCAB4BAEA586E1E6AFD3E41F9D7A194527CAE67CA
          78898F83A94F0D195EDAB5F2D3F33E8FAF70FCAC2800A002800A002800A00280
          0A002800A002800A002800A002800A002800A002800A002800A002800A002800
          A0047CEC38EB8E281ADCF83BE373349F15FC53927E6D4650091CF1C75AF8EC73
          FF006997A9FD21C31876F27C3FF851F487ECC5E25F0CEB1E16B9D3B41D063D12
          E2C0C42F22570E676298136EEAD928473C8C0AF7B2DAB0942D156B1F9071A65B
          8CC1E2954C454E752BD9ED6D76B6DD4F5FEBD2BD33E34F9F3F69AF879AEDF6BB
          69E3BF0CC52DD4D691C6B73040BBA5431B1649557F880E01039E01F5C78B9961
          2729AAB4FA1FA5704F10E168D0965D8B972A93766F6D559A7DBC8DDF137C4AF0
          BCFF0008B4FBCF891A1DDC11EB68F1FD81626CCCD1E0EF524A940480549C1191
          F5ADA58B83A29D55BF43C7C36458986693A797544FD9B5EF76BF7DEFE678C7EC
          E56CF73F1C2CE4D1C5DE9F6518B8B996012127ECE14EC493A6FE590648F7AF33
          2F72F6F68EC7DF719429D3C9F9EAA529BB2BF9F56BEE66FF00ECF31C5E27FDA0
          352F12DCF12C69777E892119CBBEC1C7A85735AE01FB5C539BF3671717C56078
          7E950A7AA7CB1BAF257FC5A3DBBF685D65B46F843AECD148126B88459C7EE656
          087FF1D2D5EB63EA7250979E9F79F03C1F83FADE71462D689F33FF00B755FF00
          3B1C3FEC9B6D0E85F0C358F126A52A5B5B4F76F2B48C385861400B67B8CEFF00
          CAB932B82A7465397F563DFE3EAD531B9AD3C2C15E4924979C9FFC31E69E2BD6
          7C63F187C5BA9EA5E194BD8F4FD0E1692CE28646468D09C03C75964C138F418E
          DCF057AB5B15372A7B2FEBEF3EA30382CB786B0B4E8E2ECE751EADEBAFFF0022
          BFE0F53DDBF670D5F5CD53E1D6CF11BDE3EA3617D359C86EC1F370B820313C92
          37633CF4EB5EC65D39CA95A7BA3F39E2EA584A79839611250924F4DAFD6C54F1
          AFC4FD7F43F8B16FE0BD33C2F6FAE2DD5BC724421BB31CEA4EEDDBB20A8002E7
          9C71CD4D5C5B856F6715766B97F0F51C565D2C655ABECD26D5DABAE9F3EB6F52
          2D27E3F783A7D4E4D2F55B3D6746BD80BADC2CD6BE62C4549CE4A12C00C6492A
          00A50CC6937CB2BA66B88E0BC753A7ED694A338BD559DAF7F5D3F13D4F4BD42C
          B54D3E0D434DBB86EED2E103C5342E191D4F70475AEF8CA325747C955A53A527
          09AB35BA6719F137E15F86FC7F7305EEAD36A36B770446149AD270B95C920156
          054E093DBBD73623074EBB4E67BB92F12E332884A9D0B35277D57F958B9F09FC
          01A7FC3DD0AE74CB0BB9AF0DCDCB5C492CAA149E028181D8003F124D561B0D1A
          0AD131CEF3BAD9C568D5ACADCAADA7DE7623245749E29F387C724F17780B50D4
          6EF4BB5B2BDF0A6AB234D8BAB259D6CAE24FF5801FE0DC7E604FCB924751CFCE
          E6342709734568FF0003F4FE16FECFCD610A75E6E35A165A36B992DBD6DB3EA5
          CF85DF1A2EB4FF0009594BE35D1DE1D28486D2D353B48B218A019568C73C0CE5
          97D3A5746171FCB04AA2D3B98E7FC214A78B9AC054BCFE2716FBF54FCFB3FBCE
          DBC5FF001BFC03E1EB5949D426BDBD11874B482DDC3BE465725800A0F1C93DFA
          57655CC28C16F767CEE0383F32C64AEA1CB1EADB5FA36D9C347F117C7D7BF0C4
          7C42D0B50B1BB68EFE44D4B4C92DC3ADBA160B1A478C3370509E7277647715C8
          F1B5254D4E1F347D0FF60E594F32796E222D5E29C657DDDAEDBE9DFCB423FDA7
          BC49AB1F859E17B1D5ADA3B0D4F5471737B6D1B12B198D01DBCF380CEBF4231C
          D4669565EC629EEF73AB8032FA1FDAB5EAD37CD1A6AD17EAF7FB93FBCF1DF84F
          F0E757F88B75A8DBE9B75696874F8D24792E771590B92157E5191F75B9F6AF33
          0983789BF2BB58FB5CFB8969E4B183AB072726F6ECBA9D21F857F17BC18D25CE
          916D7F1E0E4CDA25F673F545DACDFF007C9AE9783C5D1D61F81E3D2E24E1CCCE
          3CB89B26FF009A3FAEABF13335BF88FF00139348BEF0B7886FB5136F790989D3
          50B211CC572372872A1B9E8739E3D2B2AD8CC4A8384FA9DF97F0F64753170C56
          0E29F2EBA3D3CB4BBDBA0EFD9BB497D5FE31E90304476064BC978CF08A76FF00
          E3CCB4B2C839D74DF4D4D38E3171C36515545EB2B47EF7FE499F6C81C62BEB0F
          E7D21BEB88ACECE6BB9D82C5046D2393D95464FE82949F2ABB2E9C1D49A84777
          A1F9DFA9DF49AAEABA86A7227EF2F679276CB742EC5BFAD7C4559F3CDB7D4FEA
          3C050861B0B0A4BA24BEE563EC4FD9674F7B1F83FA6990B7FA4CD35C2AB9E541
          6DBD3B02549C7BD7D465B0E5C3A3F09E39ACAA671512FB292FC2FF00A9EAB5E8
          1F1E140050014005001400500140050014005001400500140050014005001400
          500140050014005001400500140050006803E43FDABBC291E8BE3A8B57B66090
          EAEAF3BE739F38101C0F518DA71D7935F359AE1F92A73AEA7EE5E1E66B2C5E0D
          E1E6F5A7A2F4E9FA9C17C2FF001C6A1E02F14C5ADD9C5E7A63C9BAB7CE05C424
          82573D8820107B11E84D71E13152A152E8FA0E22C8E9E718374A6ED25AA7E67D
          89E0FF0089DE09F1459C72E9FAEDAC53B805AD2EDC413A13FC25188C9F75C8F7
          AFA8A58CA357691F83E3B87B31C0C9AAB49D9754AEBEF5FA9D7F18DDEBDC5749
          E2DAC57D434FB0D41112FACADAED51B7A89E25902B7A8DC0E0FBD4B8C5EE8D29
          56A949DE126BD1D8AF0E83A341AFCBAFC3A75BC7AA4D02DBC974AB8768C1C853
          F8E3DF81E82A5538A9395B5369E37112A0B0F29B704EE974B9E47E3EF829A837
          899BC59F0EF5E5D0F55694CCD1484AC61CE77146504A86E72A415393D2BCEAD9
          7BE7F6945D99F6595F1842384FA8E654FDA53DBCFCAF7DEDDEE99CBF897E1B7C
          71F1C4D6763E2CD6B486B3B6218159408F7742E523405DC0CF5C75E31935CF57
          078BAED2A8D58F632FE21E1DCA14AAE129CB9DDFA7E176F4455F8CB6BAFE9DA7
          E83F077C27A56AADA744918927F21B6EA12B1DFC3FDD0A18966C9C64FA2D462E
          35A318E1E9AD3F335E1CAD84AF5AB6778D9C79F5B2BFC2B6DB7BDB45E5E6CB1E
          1EF0E7C70F861A45E5A685A568DAA584C5A765B702695242A06E00EC66C01D30
          C38F7AAA7471585A6D4126618CCC787F3FC5C6A579CA0D69AE8ADF8A5EBA1BDF
          B31FC45BCD62C3C4561E21BA4964D3C36A3E6B80B26C62C650DD070403EDBB1E
          95B65B8A94A32553A6BFE670F1A641470B5684F08B49FBB65B5F4B7DE79DF83B
          C45AC1F19C9F1474CB1BBF166AF3B4E97DA7470480D9C2C02C643206C7CA3006
          0E07E75C74AACD5675A2B999F4198E5D41619655564A8C15AD26D7BCD6AF476E
          BAEE773E27F8A3AB789AC6E7C3FE1BF87FA958F8B6EED9FCDFB5409BE2B5651B
          9D49019B70C01900671D4E0574E23152A8B96306A4CF0B2FE1EC3E0AA47118BC
          4C65422FA37AC93D13DD7DDF81D77C17B19BE197C176B8F17C82C2381E5BC922
          66DC6DD1C80B1F1C6E246768EEF8EB9AEBC2A786A17A9EA78FC415619E671C98
          18DEF68AF36B77E9E7D95CF13D7FE25FC46D7F59BCF1769BAB6A3A1E8105E456
          A0C4F982D158E177A72247C659B83D40E062BCA9E32BCE7ED13B44FBCA5C3994
          E0A82C0D5829D769BF376DECFA2E8BFE1CFAE747BEB4D434BB6BEB1BB8AF6DA7
          8C3C77119056407F88638AFA2A72528A927A1F8D626854A15654AA479649EA9F
          43CA7C29F1FF00C35AD78B17409B4DBDB113DD9B5B6BA2E9245236FDAA5B182A
          18F4EA3A735C14F33A73A9ECCFAFC6703E3B0F83FADC5A924AED6A9EDAFADBE4
          7AD5F476B359CD1DEA4325B32112A4CA0A15C72181E318EB9AF4256B6A7C6D39
          4E334E17BF4B6E715E2BF871E13F18E83A35944CD67A6E9F379D6A9A5B2242CA
          7EF2E002B83CF239E4D724F094AAA5D12EC7BF97F1063B2BAD56A7C539AB3E6B
          B7E5E7A193E3EF83DA378BFC75A778965BA16E90855BFB5306F5BB543F2739F9
          4E0052707200A8AF97C6B4D4EE75651C5B88CB707530B18DF9AF677F86FBF4D7
          BFA9ADE13F84FE13F0CF896FB5DD3E1B932DDCDE6ADBBCBFE8D6E739F923000E
          0F20B648ED8AD69E0E9D3973247063B88B1B8DA31A555FC2AD7EAFD5FE76DFA9
          E19FB5E1D566F88368F25A5D269769A6AAC53189BCB676766721BA13C28F5E2B
          C9CDA139D4565A1FA3F8793C3D0C0CE729AE6949DD5F5D124B4DFB9EA7FB2CF8
          566F0FFC3A5D46E5E333EB4EB78153931C5B404563DCF52476CE2BBF2BC3BA54
          6EFAEA7C7F1CE6F1CC7305182B2A6B97D5DEEDFE9F23D731EB5E91F167CD9FB6
          A6A80C9E1BD1140CE26BB724F207CA8B8FFC7BF2AF0B3A9AB4627EADE1961DB9
          D6ADE8BF57FA0DFD8BB4C0D73E24D69A34F9561B44931F364967700F61F733F8
          519342FCD21F899894BD8E1D3EAE4FF04BF53E951D6BDD3F28384F8FBAC7F637
          C24F105C2B6259EDBEC9100704B4A4271EE0313F8571E3AA7B3A127FD6A7D0F0
          AE13EB59B51835A2777F2D4F886DE1924995620C5E47D891A8DCECC78000EE4F
          615F2315CD2B1FD135671A70E693B247E80780F485D07C1FA3E8E00CD959450B
          1F570A371FCF35F6B421ECE9A8F63F99735C5FD731B56BFF00349BF95F4FC0DC
          AD4F3C2800A002800A002800A002800A002800A002800A002800A002800A0028
          00A002800A002800A002800A002800A0028030BC6BE15D0FC5DA33E97AF5825D
          DB93B949E1E26ECE8DD54FB8ACAB518568F2CD1DF96E6589CBABAAD8795A5F83
          F26BA9F2EF8FBE03F88F4ED42E67F0CC11EB1651907C9864FDF264F00AB633F8
          13D2BE76B657522DFB3D51FB2651C7781AF18AC6BE49776B47F35FE48A1A67C1
          2F16AF89345B6D7F470BA7DD4EA2E4C7749B9231CB8CF66C74C03CD4C32DACA6
          B99686F5F8D32F9E16BCA8CEF34BDDBA7ABE9F8FA1E9BE13F829E2AD16F750FE
          CBF8957FA444921FECF8ED4B4A361390668D885CE3E5C0CF2339ED5E952C0D4A
          6DDAA58F83CC38AF098B8C1D6C2A93FB4DE9F73B5FFAB1EB1616DE28D37C1DE5
          FF006B5B788B5C8607D93CD10B78AE24E7686D99DA3A0CD77A538C37BB3E4EB5
          4C256C5DD41D3A6DAD13BB4BAEFB9E7137C7B8B42D624D13C6DE11D4B4AD4200
          A255B5952707238700EDF90F6209AE3FED2E4972D58D99F514F82278DA4AB602
          B29C5F74D7F9EABE475DA37C63F86DA9F9691F8A6CEDA57E3CBBC0D6E54FA1DE
          001F9D74C31D425B48F1F13C279BE19372A2DA5DACFF002D4EE6D2E6DAF2D52E
          6D2E22B88241B92589C3AB0F504704575269EA8F02A539D3938CD59AEFA1328F
          434C80207A77CD00B43CBA3F82BE1BB1B9F105DE837DA969936B5613D9C88B20
          78A2129DC59548CF5EC4D704F0506DB5A5CFA78F1462A50A34EB25254E4A4BBE
          9E7FF00BDF043E1D9F879A35FDADC5EC37B7579722469A28CA008ABB517924FF
          0078FF00C08D560F0BF578B572789B883FB6ABC2A28F2A8AB59BBEBD5FF5D8F3
          AFDACEDFC4C9AC689A9F872D35846165716D3DED823F0ACCA763B27200E48CF1
          C9C77AE3CCA351CE2E08F7B82A5829E1EB52C4CA376D349DBA27AAB9C7FC57F1
          66B3F12B5CD2FC0FE11F3F51B2B6444281B6BDE5C2AFCD236EC611403F7B1CE4
          9ED5C98CAD3C4CD51A7A9F4BC3D94E1F21C3CF32C6B5193BFF00DBA9BD12B757
          E5E9DCDDF8B36BA9783BE0368DE081E15919EE2249F52D41177436F3ABAB1259
          460BB1E32C40C7033DB7C541D1C22A7CBEA79D9056A79A67F531CEB6CDA8C5EE
          D34D6CFA2DECBA9B3F07BC4CBA7FECC9AF5E0610CBA50BC890EEEB2380C9FF00
          8F4A055E0EB72E0A4FB5CE3E26CB3DAF13D1A6F555391BF45A3FC11E29E1DF01
          6A97BF0B356F1C59CEE06957491085072C8A0192407D54B21FC1BD2BCAA58794
          E94ABAE8CFBBC7E774B078FA595B5A4E2FEF7B2F9D9FE07D43E21B9D6BC6BF01
          10E80B6BA9EABABD8410C9B250B10662A27DC4F4030E08EBD457D0C9CABE1AF1
          D5B5FF000E7E3B4A9D3CAF396AB5E31849BD77B2F87EFD2C723E18F841E308BE
          17C5A12F8B2E7C39AA45A84B704D9CCCD13A636AA928CA40E33C7A92413D39E8
          E0EAFB2E572B3B9EEE61C4D97CB3375E34154838A5AAD6FBBDD3F4FC8E2E3F88
          5F187C29E359BC18753B6F135FC370B0451C96E2433B150D8561B187079C9E30
          6B93EB989A759D1DD9EF54E1EC931B96473151749357DED6D6DB6ABEE3D37C2D
          F167C490DAEAF3FC40F00EA5A05BE9969F686BB48DBCB94EE0BB143FF11278C3
          1E8738EB5DF1C6CE29BAB06AC7C7E2B8730F52A53A797E21547376B697DAF7D3
          B7A234B42F8E5F0CF59B7027D73FB39DF20C1A8C0D11C7B9E508FC6B4863E84F
          ED5BD4E7C4F08E6D869694F9BCE2EFFF0007F03BDD0355D1754B08E6D0B50D3E
          F6D02E11ACE647400761B4E063D2BAE138C97BAF43C0C461EBD29BF6F169F9A7
          FA9A1EBCF35473D99E03FB427C23F1878D3C5EBE20D12EB4EB8823B24816D669
          4C522952C4807054E4B67248AF231F80A95E7CD167E8BC23C5984CA30AE8568B
          4DB6EE95D6B6F9F43BBFD9EBC1B7BE0AF8791E9DAAC221D46E6E64B9B98F2A4A
          138555CA920FCAA3BF7AEBC0E1DD0A5CAF73E7B8AB37866B8F75A9FC2924BF3F
          CD9E8BDABB4F9B3C17F6CDD563B6F0768FA6ADE6CB8B8BFF0037ECFF00F3D234
          420B1F4C332E33DEBC8CDA5FBB513F41F0F694BEBD3ADCB7495AFD9B7FAA4CF1
          EFD9DD2DEE3E2EE8B6B25B7DA525326091831154670E3DC6DFD6BC7CBA29E222
          99FA2F19CA71CA2AD58BB6DF8B4ADF89F6DC0004C850BB8E4E2BEB923F9E5EAE
          E3E9805001400500140050014005001400500140050014005001400500140050
          014005001400500140050014005001400500140115CDB41728527892453D9866
          9349970A9383BC5D8892C628ADD6DED99EDE25E8B19C6284921BAB293E696AC8
          2F6C77334B0C5994E06E594A1381DCE0E7F2A9946E546AC92B7438CD63C0D1C8
          F2CFA6DD6A1A55FB6596ED242510F5C6D5233CF7C572CF0CB75A33DFC3E74E2A
          31AD18CE3DADAFDED7EA792F8BBE0778A75A13EB5378ABFB6B56998F99E62105
          95461465B078E9D00AF3EBE5B3ABEF395D9F6F95F1B607056A10A1ECE1FD76BF
          F99E61E2EF853E35F0D4515C5FE92D2C329DA65B7265556F4638E3FAF4AF36AE
          02BD2D5A3EC701C519566126A9D4B3ECF4FB8E534ED42FB49BB66D3EFAEACE55
          2537DBCED1153FF012315CEA5520F4763D79D2C1E2E3CB38A92F349AFC4EF740
          F8D9F12B479238BFB7C5FC2847C97B0ACBB80EC5B01FD89CE6BAE9E6788875BF
          A9F3B8DE08C9F137B53E57DE2DAFC36FC0F6AF829F1B350F1B788E4D0B58D22C
          2CA64B56B81710DC15572AC015DAFF005CF53D2BD5C2666EB3B4958FCEF89F83
          6194D255A8CDC9376B35FAAFF237EC7E3AFC3BB8D4AE6C6EF52B9D39E091A3DF
          776CCA92156209565DDC71DF15D11CC70EDB4DD8F2DF05E6CE946AC29F327D9A
          BFDCEC777A1788741D76DFCFD1758B0D4232719B69D5F0719C100E41AEB85585
          4578BB9E062B0189C1CB96BD3717E69A34F8EF91FA568721563D374E8F507D42
          3B0B54BC75D8F70B0A89197D0B63247B66A14229DEDA9ABC45594152727CABA5
          DDBEE1BAEE996DAC68D7BA4DD83F67BCB77825DBD76B29071EFCD13829C5C5F5
          2B0D889E1EB46AC378B4D7C8F10BBF819AE697F0FF00C41E1CF0F78A22BB6D52
          EADE7097B0794BB6224ED2533824E39039DA3815E6CF00D5395383DCFB7A3C65
          4EA63E962F114F5826AE9DF7FB8F44F847E0D7F0B7C32B3F0C6AEB6F713B2CA6
          F150EE4632312CB9C0C80A42E7BE2BAB0B87F6545537F33E7F3FCE5E61994B19
          4DB5B5BBE8BFCF53E68D5FC41E37F835E23D67C15A4EA8D6F692CCD2DAF9F006
          12230C249116FE22300E3F897DABC472C4E0E6E9C363F53A34727E25A14B1989
          5EFA567ADB6DD3B6EAFB7933EBAF0E477563E16D3A2D4AE649EEA0B3885CCD2B
          6E6770837B13DCE735F450BA82B9F8C62DC2A62A7EC55A2E4ECBCAFA1F367ECE
          09FF00095FC74D6FC573B338896E6ED0B76333EC407E88587E15E165EFDB62A5
          53D4FD5B8C12CB720A382EADC57DCAEFF1B1DD7ED87AB7D8FE1CD9E911332BEA
          37E80A8380638C16607F1295D99BD451A4A3DD9F3BE1E612557309574B4847F1
          7A7E573C93E1CF893E0DDA784ED349F1CF842E64D404AEEFA84685C480B70432
          BAB00060600238CF735E7E1E7858D3E5AB1D7B9F5D9DE0F3CA98D956C062172D
          97BBDBEF4D7CCF5CF869E1EF84DA5DD6A5E3AF03EB935CC7A65AC9F6887ED24A
          440C64E583A87E403804E320F715E850A3878DEA5296C7C667599E735A9C7018
          EA697335ADB7D7A59DBEED4C0F0FE93FB424B6716AFA5F8C34FB886E956E956E
          AE52552B27CD8C18C85C03D0100638ACA31C6DEF19A68F4B138BE15E5F653A12
          525A5D26B6F9EBF77A9B907C44F8BFA26A56963E25F862DA8472CCB0B5CE985B
          6F2402DC175F7E768FA56F1C4E260ED529FDC7975724C92BD27530B8BB35ADA5
          FD27F99B57BF192CED7E2EC5E017D0EEF2661049708C2472ECA1A36545C9D98F
          BC4F23D3835A3C65AAFB3B1C31E1994F2C78EF68BBDB6F5D5F5EC7AAF6AEF4EE
          7CABD0F95BF689F1A3D87C679163D1B4ED4069BA67D8CC37B1798AFE6AF98CE0
          678237000FB1AF9DCCABFEFF0096DB23F60E13C93DAE4AAA7B471E697368ECFD
          D76B7E0751FB3D7C27BCF0F6B09E28F116C8EFC41BAD2CA060DE509060BB374D
          D8240519039E7B56F97E0BD9BF692DCF378B38B163683C161FE0BEADF5B745E5
          E67D0A380057B67E641400500140050014005001400500140050014005001400
          5001400500140050014005001400500140050014005001400500140050014005
          0014011CD0C532149635707B30CD26932A3394766466CD3188E4962E9F71FD29
          7296AABEA9332AF7C396B3CF3DC9B7B196697F8A4B550D9F765C31EDD4F6ACE5
          462FA1D54B1F52094799A4BA27FA3D0E2A4F839E0E9A1BE5BAF0DDA235D15769
          6291E57DE3AEDDC7283AF00F7AE49E028B4EF13DE8716E630945C6AB76F45F7F
          73CF63FD9C34F1E23B8DFE28BB8B4F753F6744B33E7213D1598E5703D7A9F6AE
          3FECA873BF7B4F43E9EA78835A7878BF629CD6FEF69F25B94FC6BF00AC744D0A
          E2E74B7D7353BE86D1A484C488CB2CA18614A0FBABB4FAF6CFB5675B2AE48B71
          7734CB78F2B626BC63554231BEBBEDEBD59E13A858EA5A3DEAC7A9D95D69F76A
          C420951A37E3FBA7BFE06BCA71A94DD99FA4D0C560F154EEAD25F79D4E83F117
          E216888A2D7C5DAAA42A30229A6132A81DB6C81B1D2B78E3B114F44D9E362B85
          B26C6CAEA11BF969F958F5DF047ED017E9E18D5B51F158D2E6B9B37852D6D60C
          C17173BF218E0E4607A81EB9ED5E951CD65CADCD1F0F9B701C238BA7470ADA52
          BDDBD52B6DD9EA745A0FED23E0BBB9521D534FD5F4B638DD2344B344B9F52877
          7FE3B5D14F36A32DEE8F3319E1E66541FEE9C67E8ECFF1D3F13D07C3BF10FC13
          E2297C9D1FC4DA6DCCC067CAF376498FF75F06BB69E2A8D4F8648F98C664598E
          0F5AD464BE575F7AB9D5023008390475ED5D0793E4CAF75676976C8D736B04E6
          33943246ADB4E41C8C8E3900FE149A4CB8549C2EA2EC2DFDB4779633DA4A5C47
          3C6D1B9462AD86041C11C83CF5A251BAB0A9CDD3929ADD6A71BF0A7E1AE8DF0E
          D7525D26EAF2EBEDF2212D7454B222021532A067962738F4AE5C36121876F97A
          9EDE75C438ACE234D574BDC4F6F3EBF823CFBF6A5F03F8CFC5DA8E8B3681A69D
          46C2D20956448A655912466193B588046D030464F07DAB8F33C2D5AFCAE0AF63
          E9F81B3AC065B1AB0C4CF95C9AD6CED65E9E645A17C51361636BE1AF8A7F0E2E
          748B38A1117DA9EC4C969B554004A329C0E0FDD271C52862F922A188A765E9A0
          627877DB55962728C5A9C9EB6E6B4B5D774FF3B0CF881A9F8020FD9EFC417DE0
          7B0874D87599A3B26115B185DA52EBC107B04DC7038C1F7A756AD1FAB4A5495A
          E6597E0F30AB9DD2A38F9F338A6EF7BE96FF0032AF80FC127C57E02D1BC41F0F
          FC51A8785757B3B716971025C3490C92C648632283919C92382304715961B0EA
          AD35528CACCE8CCF1EB2AC754C2E61455583774ED6767DBF27E7D4EE7E1B597C
          65D33C4C2CFC67A968FAC68AD1397BB8C812A30C6D0A1514F24F420F00F3D33D
          B4238953B5469A3C2CDAA645570DCF838CA152EB47B79F57F81E80DA0E8AFAB4
          7AB1D2AC7FB4227674B9F2144AACCBB58EEC6791C5767B38DEF6D4F9D58BAFEC
          DD2E67CAFA5F4FB8D2C551CE786AFC4AF869E2CF1EC7E1B9FC2C9771DFCE607D
          46F214E66070800397DA7180723191C726BC858BC3D5ADC8D6E7E82F86F3AC06
          01E2A356CA0AFCA9BDB77E57FBFD4F5FF0D9D224B12BA3F96D6D04AD07CB9215
          A33B4A8CFA118E38AF529A8DBDD3E1F13ED54FF7BBBD7EF35EB43982800A0028
          00A002800A002800A002800A002800A002800A002800A002800A002800A00280
          0A002800A002800A002800A002800A002800A002800A002800A002800A008DA2
          183B3E527F1A4F51DF5D4CDD6F451A9C71ABDC85689B746CD6F1C850FA8DCA71
          F8544E9F3753A68629D16F956FBEAD5FEE336E7C2F149049E75BDB5ECF2021E4
          97E52C0F55C608C7E1CD43A29AD753A6398D44D72B714BB7F573CDBC4FF053C2
          F7DA35F6747874AD4655261B8823768E220823E543CE7D36D70D5CBE94D3B2B3
          3EAB03C638EA7561CD3E782DD36AEFE6D7EA7946B7F01BC6115CC89A21B5D5E1
          41CBC52AA38C8CE19588209EDD6BCC9E55557C1A9F7385E3ECBA715F584E0FD1
          BFC51C4F887C0BE2AD22786DF52F0EDF249261542C45D8B1ED85CF3F4CD724F0
          95A0ECD1F4186CEB2DC5273A7555979D8874BD7BC5BE14BA6874DD4759D1E68C
          8678FCD78F39E9946E08FA8A215AB517A368AC465F96E651BCA119AEF64FF1FF
          0082777E1DFDA07E21E947CBBFB8B1D653D2EEDF6B8FF8147B7F506BAE9E6D5A
          1BEBEA7CDE2FC3ECAAB3F76F0FF0BFF3B9EA7F0FBF682B6D7756B1D1B54F0CDE
          C17B79308636B1613A649E095386000E4919C609AF4B0B9A2AD25071B33E333D
          E039E5D46588A5554A2B7BE8FEFDBF23D4F5AF19F85743D620D235AD7F4ED3AF
          6E2332C515C4C23DC99C672780383D4F35E84ABD383B49D8F8CC3E598CC541D4
          A34DC92ECAE6BD85F596A1079D63776F7717F7E191645FCD49AD14A32D5339AA
          D0A9425CB522E2FCD5BF3276547528C14A9182A7907F0A7A3334DA77460F88BC
          1BE16D7F444D1756D12D27D3E39BCE48157CB55939F986CC60FCC7EB93594E85
          39C7964B43BF0B9AE2F095BDBD2A8D4AD6BEFA7CEE7996A1FB3A787A3B8FB678
          6FC45AEE8776A7742F1CAAE2361F77070AD81FEF67DEB86595D34EF4DB4CFA9A
          5C778B94793154E3523E6ADFE6BF03AAF849E17F885E1CBBBE5F1878D13C4164
          D1A2DA21563223679666619E9C6327F0C5746168D6A77F692BA3C7CEF30CB718
          A2F0943D9CBAF6FB97F923D105761F3CD9CBFC57D6CF877E1D6BDAC46E52682C
          9C42C182912B0D89827BEE615862AAFB2A529763D4C9309F5CCC29516AE9C95F
          D16AFF0003E18B1D175BBD826BCD3B4BBEBB86D90C92CD144C5102900B6EC7AF
          A735F230A339FBE91FD1B8ACCB098692A339A4E5A5AE7DCDF09B473A17C3CD07
          4C2AE8F1D8C6F30933BFCD71BE4CE7FDA635F5B86838538A7D8FE74CEF111C4E
          3EAD48ECE4EDDACB45F81D5D741E485001400500140050014005001400500140
          0500140050014005001400500140050014005001400500140050014005001400
          5001400500140050014005001400500140050014005001400C9618E518740452
          6932949AD9908B348E311C0C638C67098CAF3F5FAD2E529D56DDDEE626AFE13D
          2F5378DEFB49D2EF1D37056960E42B7503A8FCF8ACA74213DD267A187CD71187
          BAA752514FB3EC799F893E01784B519C4D026A3A561CB32DB2C6D1904FDDE067
          E871C735C1532BA52EE8FADC171F661415A6A33F5BDFD77FF8738CD2BE1178EF
          C19E20BCBCF05EBFA45EDEF9124500972B308D88C901D762B018E777E95CF0CB
          EA516E549A6CF6B13C5D966694634F1D4E71574DDB5575E8EED7C8F3FF001BF8
          1BE299BBB8D5BC4FA06B57B70E999AEB1F69C851C64C65B000FA0AE1AF85C54A
          5CD34CFA7CB33DC8A14A3470952314B65B7E7638CD2B52BFD1AE527B1BCBCD36
          F23E566824681FF1C6322B954EA527A687BD570F87C6C396AA535E6AE7A35AFC
          7DF88B6F3C3236A9693EC8C218A6B3428F8FE23B70DBBAE482073D2BB619A575
          BB3E66AF0064F513E48B57F37A7E7A1DAF877F69BBD595935FF0BC12A1C6D7B0
          9CA15F5CAC9907F315D70CE6DF144F9DC57869FF003E2B7DEBFCBFC8EF7C3BFB
          41FC3CD4D48BFBABCD1641D16F6DC907E8D1EE1F9E2BB69667427BBB1F318DE0
          6CDB0DAC62A6BC9FE8EC7A3681E24D035D812E346D6AC3504750C3C8B857383E
          A01C83EC457642AC2A7C2EE7CCE270189C2BB56A6E3EA99A17B756D676ED7177
          7115BC2BF7A495C228FC4D5CA4A2AED9CF4E94EACB960AEFCB53E70F8D7E35B2
          F1F78AF4EF00D8EB16FA2E8825135DEAB7C0A452C8A09555071951D892016F4C
          73E2E2F111C44D5252B2EACFD3F87328AB9361AA66556939D4B59456AD27FAF7
          B5EC8EDFE1AF89BC329E295F869A24925DE9FA1D9A2C3768C1E3B8973F3EE23B
          82D9C8E09DDE82B7C34E1ED3D8C3647CFE7596E39E1FFB5710B96551BBAD9A5D
          3F05D7C8F5E4CF53F857AA7C68EA002800A002800A002800A002800A002800A0
          02800A002800A002800A002800A002800A002800A002800A002800A002800A00
          2800A002800A002800A002800A002800A002800A002800A002800A002800A006
          BA23A9565041A069B5B1524D2EC9836C88C2CC305E1731B7E60D4B8266B1AF35
          E7EBA99BAAF856C3528161BC586F95062317F6D1DCECE31C6F19E7BF359CE8A9
          EFAFAAB9D587CC6AE1E5CD4DB8FF0085B8FE479FEBDF01BC15A9FCCBA48D2A4C
          1FDEE9B3328EBC7EE9C3293EFC57254CB68CBA5BD0FA5C271BE65867FC4E7F29
          2FD5599E6DAAFECE17CAF70DA3F89E3631E488F50B268323B0DEA5813D89C0AE
          09E537F865F79F5785F11968ABD1DFAC5DFF000D3F3397BCF819E3E8E2965B78
          B4BBE118DDE5D9DEACB20EBD881E9FFEBAE5795D75F0D9FCCF6E971BE55524A3
          579A37EB28B4BF5380D5B42D7B48549B57D3AEF4F22431A9B8431B2B01923079
          1C739AE3951AB4FE2563E928E3F0588D28CD4BD355FE457BCD42EEE4C4CF7F35
          C7969B15A59CBED03B286350E527BB2E185A6BE0825E8ADF90EB482F75DBA86C
          2167BAB973B630D26E27FF00ADD4D1084A52D0BAD52850A4E752C923ECAF823E
          04B7F0BF8234F85F4F8AC757963F3350997066762490A5BF8571B7E51D3F335F
          5783A1ECA9A56D7A9F81713E755330C64DA9B9534ED15D179DBABF33D2D46000
          3B5771F2E1400500140050014005001400500140050014005001400500140050
          0140050014005001400500140050014005001400500140050014005001400500
          1400500140050014005001400500140050014005001400500140050014001008
          C1008A03623F221C7FAB51F418A5CA8AE797729DEE916976852E6086ED38DB1D
          D462545EDC035328266D4F133A6EF16D7A3B19D1784B428D1E34F0EF87911FEF
          2A69C8037D78E6A3D853FE55F71D2F34C5377F6D3FFC09FF00993E97E1CD2B4D
          B85B8B1D1B46B394670F6D64B1B7A751CD38D28C5DE29232AD8FC4578F2D4A92
          92F36D9AF0C4B12E14924F524E49AD12B1C8DB6C7D3105001400500140050014
          0050014005001400500140050014005001400500140050014005001400500140
          0500140050014005001400500140050014005001400500140050014005001400
          5001400500140050014005001400500140050014005001400500140050014005
          001400500140050014005001400500140050014005001401C6F8CF56F1958F8B
          742B3D07458EF74AB89317F391CC439CF71DB9EDC8032738AE7AB3AAA7151575
          D4F630186C0D4C3559D7A9CB35F0AEFF0087CBFE1AE72A3E2C6A106AFA2E9977
          A75A79D26B577A76AED196DB6A91DC2C114832780ED2C5C9CF53587D6DA9462D
          7569FDF63D4FF5769CA954AB093B284650DB56E2E4D7C9264F67F19F47B3D1F4
          FBBF1142F04D7D13DEAADB85C43666E1A28646DEE0B1600121031FBC71814D63
          62A29CFAEBF2BE844F85EBD4AB3861DDD45A8EBD65CA9C92B2D2DB5DD96DA9D3
          78DFE21E83E0F9EE61D5E3BDCC1A7FF6803144184A9E6AC45532465C33A123D1
          81CD6D57130A5F176BFE879B97E4B88C7C54A8B5ACB9757B3B3777A6D64FE68E
          73C65F13D603A8A787E45636561A9B869AD77C73CD6D6D14C0A3871855F34039
          5F98E4023193955C5DAFC9D13FC1267A181C81CB91E217C52A7B3D529C9C7556
          DDDB4D74F3363C31E33B89B4BF176A9ACAA1B6D0A6C816F1E18C4B6714EDD4F2
          D976C74ED5A53AEDA9CA5D3FCAE7262F2B8C6A61E951DEA2EBDF9DC57E4882D7
          E2CE85736F214D2B5D4BCF3AD61B7B192D5567B93708CF0941BF6E0AA39CB15C
          0539C54AC641AD9DF4D3D762E7C3B888495E71E5B49B95DD972B4A57D2FA3696
          89DEFA0BA3FC4B8B58F17E93A2D8681A9B5BDF5ADCC934F22AA35ACB04C22923
          75DDFC2C70C413D57190490E38AE79A8A5BDFF000157C89E1F0B52B54A91BC5C
          525AEAA4AE9A76EAB6F9DEC40BF123FB3FE206B7A0EB16575F608353B4B1B5BD
          86DC7930B4F0232ACCE5B396762010B8008CE3353F59E5A928C96974BEF5D4D1
          E47ED7054ABD192E671949A6F57CB26BDD56E89757AF4353C0BF127C3BE31D52
          6D3B48370254B7FB546640989A1DFB378DAC4AF38F95C2B60838C1AD28E2A155
          DA27366391E2B2FA6AA56B5AF6D2FA3B5EDAA57F5575E673BE12F8BB687416B8
          F15DADDD94A91DFDC2DD2DB016F731DB4EC8CB17CC58B85299C800927158D3C6
          2E5BD4D37FC19E863786E7EDB970AD497B8AD7D539453D744ACDDFE4693FC5CF
          0FAE8375AC0D3F51922B29DA1BB447B62612231267779BB1F2AD901199890463
          20D5FD721CAE56DBD3FCCE65C398975A347995E4AEBE2D75B6DCB75AEF74975B
          D8857E2DE9B16A3E21FB76977B0E97A54768F0DE8DA45CFDA154C6A1491B4B17
          18CF1804B15C52FAE45395D68ADF896F872ACA1479269CE7CD75AE9CB7BBF3B5
          B5F3D15C74DF18BC38BA74779069BACDE12976F2C56B0C72B402D4A898B30936
          9003AB02AC411D09240A3EBB0B5D27D7F0DC51E19C53A8E129C57C366DB57E7B
          F2DB4BEB6B59A4D753A1D77C69A6E9B6DA43DBD9EA1AADC6B0A5EC6D6CA25696
          5458FCC67F9D95400A4672472401926B69D78C52B2BDF63CFC3E5756B4AA2949
          4553F89B7A277B25A26F57E4618F8BBE1A76B6782CF58B8B49A2B49A4BB8ED94
          C36E972E6388C84B647CE0A900139F5009ACBEB90D2C9DB4FC4EEFF57314B994
          A51524E4AD7D5F2ABBB69DB534BC6BF10B4AF0AEA2F6377A76AD7924560DA8CC
          6CE05758ADD5F6BC8C4B0E17A9EF8E99ABAB888D27669ED7F91CD80C9AB6369F
          B484A293972ABB6AF26AE92D1EE66EA5F122DA6BA92DB4A82F224B5D62D34E9E
          F67B40F6F234B2463CB422407715914EE230A0E483D2A25894DDA3DD23A29647
          38C54AAB4EF094924ECD593D5E8F4BAB5BA923FC55D05343FEDA7D3F558EC26B
          94B6D3E79638E34BF666700C4CCE005FDDB1264D9C60F714FEB70E5E6B3B74F3
          FEBCC4B87B10EB7B1528F324DC92BB71B5B7B2DF54BDDBEBA1D47847C41A778A
          7C3B69AF694D235A5D0629BD70CA558AB29C12321948E091C7048ADA9548D48A
          94763CCC760EAE0ABCA855F897EAAEBF0395D43E2CF87F4EB8D5EDEFEC355826
          D2E0171247E5C4ED247E72C395092120EE75F95F6B60E71584B1908B69A7A7FC
          31EA52E1DC4D68D3953945A9BB2DD59D9CBAA5D13D55D5FA892FC54D28DB7970
          68BAF3EA86EE7B3FECE16AA6E11E189647661BF6EC08E878624EE000CF147D6E
          36D13BED6F405C3F5B9AF29C792CA5CD776B49B496D7BDD3E9D2FB167C3BE3B8
          57C0FE10D67C423CB975E8630D34280431CAD034BF364E54108C075E71550C47
          EEE129F5FF00233C5651278CC451C3EAA9B7A3DDAE64BF5D4CD1F15B49D5A0D1
          9F423729F6E9AC5A469ED03848EE2E9A011B61C6D90B23F3C8017383D2A3EB71
          95B97ADBF1763A7FD5EAD41D455EDEEA9ECEDAC63CD7DB5566BB5F6D087E1678
          EB5CF126BF6F63A92DA08A4D266BB6F2A22A7CC5BF9A01C9278D91AF1EB93ED4
          B0F889D4959F6FD5A2F38CA30F83A0E74EF7524B57D1D38CBF37F712CFF19741
          8E39651A0789648522B99D644B342B2476EE527753BFA211C938CE40193C5378
          D8767D7F0DC88F0CE21B4BDA42F78AB5DE8E4AF15B75E9F8E86ADF7C47D2ADB5
          D8B465D3F509A7BA81A5B264F2B6DD1101982AAEFDE32A080CCA1490466ADE26
          2A5CB6FEAD73969E475A745D672492767BE9EF72EBA5B7E89B76E853F09FC4F8
          75BD3F41CF877571A96AB68B78F6B022482DE02CA9E73316198CB3718F98804E
          DE2A69E294D47DD777AFFC136C66432C3CEAFEF63CB07CB7775776BF2ECF5B6F
          D3CC67C2AF88AFE2416DA66AF63736FA9CC9772C5388025ADC24370633E59DC4
          92A0A672064938A30F89F6968C96BAFA68C79CE4AB07CD52949382E54D5FDE4E
          51BEBA2DF5B17354F89BA2697AAEABA75FD96A30CBA759DC5E31C44DE7470637
          955590B29C3023785DC391552C5422DA6B6BBFB8C68E4388AD4E9D4A724D49C6
          3D7472DAFA5BD6CDD84D3BE28681737896B7567AAE9921BC5B4717B02C7E533C
          0678D9B0C70AE8A71DF23040A238A837669AFF0086B8EAE41898479E328C95AF
          EEB6EF6972BB69BA6F5FC2E59D47E21E9165E11D1FC492596A2D06B0A1AD20D9
          1A4A57CA6972DB9C22FC885B96E780324E29CB1315053B6E674B25AD5313530C
          A4AF0DDEB6DD2E89B7ABB6DF819D07C5EF0ACBA9E996063BE8A4D416D08F3163
          5F24DD730ABAEFDC4B02A4EC0C1772EE23350B194DB4BBDBF1D8E8970DE3234E
          75346A3CDDF5E4F8ACED6D3CDABD9DAE416DF19BC33369F717EFA6EBB0411597
          DB63696D547DA2213AC0C63F9F9DAEEA0E71D7232292C6D36AF67DFF001B173E
          18C5466A9A9C5B6F9746F47CAE4AFA754BFCCB5AEFC45B2B1D7D2D6332A5BDA5
          D5EDB5F235AEE694C1662E4F96DBC051B587241C9E38EB553C4A8CADDAF7F92B
          9961B24A9568B93DE4A0E3AEDCD3E4D55B5D7B3D37D76218FE307868E9D3DDCF
          65AB5A3A35A0860BA85227B817218C2CA59F685211C92ECB8DA738A5F5D85AED
          3E9F8EC5BE1AC57B4508CA2FE2BB4DB4B92DCC9E97BEAB64EF7D0B3AA78F23BC
          F02695E28F0E6D686FB55B4B322E13950F74B04AA7071B87CC01048EE3229CB1
          17A6A70EAD2FC6C65472874F19530B88DE3194B4F28F32FD3CCC0B3F8A92C1E2
          2D2ED2FF006DDDBEA105E24115ADA6C9EE2EA3BFFB3A222B39180818924E30A5
          B8E9592C5DA493EB7FBEF63D09F0F29509CE9E8E2E376DDD28BA7CCDBB2EF6B6
          9D6DAEE74FA1FC4BF0DEB1E307F0C59BCE6E849711472B6CF2E5780E2500062E
          31CE0B2A86C1DA4E2B7862A139F22FEAC79988C8B1587C2AC4CED6D1B5ADD296
          DD2DF736D75B181A2FC4BBE6F11EBF6FA8E957F288B583A5693A7DADA279D334
          71799236F32E0FCBF31CED0AA57049240C618A7CD24D75B25FD33BF119153542
          94A9CD2BC39E526DD95DD969CBDF45BB6EFA248DFF000F7C48D175FD634ED334
          9B0D5AE24BDB217A65FB3858EDA3DF24644A4B65583C4CA40079C6323246B0C5
          4672518A7AEA7062723AF85A53AB56514A2F96D7D5BB27A69AAB34CE6F58F887
          ACD9EB3ACD92BDA2FD96FEFEDED50DA3399041A725CAE5B78DA7793938391C71
          D6B29E264A4D79BFC15CF46864B42A52A73D758C1BD76E6A8E0F4B6BA79AB6FA
          EC5CD1BE2EE8B2783B4ED5EF23B89A5B868AD0342238E2B9BAF24493089A4755
          0887702CC40C8C024D547191E4527FD3B6A655F86EBAC54E8C1A495DEB76D479
          AD1BA49BBBDD249BB6AEC6F5C7C40D117C25A3F88ED21BFD421D6A48E1D3EDED
          A10679A470C76ED6200202B1249006D3CD6AF111E4535ADF6382393621E26A61
          E6D45D34DC9B7A24BAE97DEEADA753362F8B5E1A934B9F50FB26AC91C1A65C6A
          5223DBAAB88A1B8681D705B87DEA783DBB8E950B190B5ECF6BFDCEC74CB87314
          AA2A778DDC9477D2F28A92E9B59962EBE25E931EA935841A66AD7012EA5B18AE
          9214F226BC8E3321B7562C0EFC29009017208CD378A8DEC93EDF3EC670C8AB3A
          6AA4A715A2935777516EDCCF4DBE77B74312DBE356870786347D575BD36FAC2E
          350B137CF6E1A23E5400A83282CEBBD496F94282E403F2F159AC741414A4AD75
          7FEBFAB9D93E17C44B115295192928CB96FAEAFB689D9F76FDD5A6A75FE17F19
          69BE23D6355D3B4E82EBFE259298669A4D814B838202EEDE3D41650187209ADE
          9D68D4934BA1E4E332CAB84A54EA546BDF574B5DBD6D6F5B36D7538CF07FC51B
          CBABE68759D1F5369B51D5EEECF4CB5B6B340628EDDF6B991CCA738072C78008
          6033C679E9629B7692DDB4BE5F33D9C764108439A8CE368C232936DEAE4AEACB
          97AF4DFA5EDA9A9FF0B77C362C2E35096C3598AC92CA4BFB69DED942DEDBC722
          A3BC5F364E0BA9C305241040ABFAE42D7B3B6FEA8E5FF56F15CEA9A945CAEA2D
          5DFBADA6D27A793DAFAE858D2BE27E937DAEC1A44BA2EBF6134B7C74F692EED5
          5238AE3CB32AC6C439E5906E18070319C538E2A2E5CB66B5B7CCCEB6435A9D17
          59548C928F368DDDC6F66D69D1E9F95CD2D67C71A6691E2DB0F0EDF5A5EC72DF
          CA904171FBB31B48EA4A8DBBFCCC7046ED9B41E33572AF18CD41ADCE7A194D5A
          F8696220D5A29B6B5BD97CADF2BDEDD0E7F4EF8CBE19BCB5176DA7EB76B6ED6F
          15D4725C5AAAAC903CEB019461CFCA8ECBBB38E0E4645651C6D36AF67FD3B1DF
          57863174E5C9CD16EED5937A35172B6DBB4B4FB9D8E826F1D68B1786352F113C
          779F61B0BD92CB2B16E6B8952510E2200FCC1A43B41E327D056AF1115073E8B4
          FD0E08E535E588861D35CD24A5BEC9AE6D7B596ACC397E282BEB9A3E956BE19D
          60CF77A9C9A75EC332C692D9BAC3E68C80C55B2A436436368639C8DA73FADFBC
          A2A2F5767E5A5CED5903546A559558DA31524D5ED24E5CBDAEB5D355BDBA6A66
          783BE30593F869EEFC556B77697105ADD5E1B84B6C5BDCC715C794443F312581
          68C738C93C71514B18B92F3F3FCEDA1D38EE1A9AC428615A69B8AB5F54DC79BD
          ED36D1BF435EC3E2C6837F358DAD969BAB5D5E5DDECB642DEDD2295A39234476
          2CCB2142A1240DB9588C023A8C55AC5C256493BBD0E4A9C3B88A4A529CA2A314
          A5777574DB4B46AF7BAB59A5F71E835D67801401C56ABF0C3C29A95DF88AEAE6
          DEE7CDF102449785272B8F2CA9529FDC3B91493DC815CD2C2D393937F68F668E
          7D8CA31A308B56A57B69DEFBF7D1B44D77F0F74296E74DB9B596FF004F9B4FB2
          8EC237B4B8D864B743958DF20E403939183C9E79A6F0D0BA6B4B69F22219D621
          46719252526E5AADA4F76BFAB17FC51E0ED0BC4BA9E95A86AD6CD34DA5C8EF6E
          37E14EF001561FC4BC29C7A8157528C2A34E5D0C30799623074EA53A4ECA76BF
          CBB76316D7E15784EDB42B4D1A28AF05B5ADA5F5A213704BB25D80262CD8E5B0
          060F6C566B094D4547D7F1DCED9F10E3275A559B576E0F6EB0F86DFAF73621F0
          6E8D0E93AEE988B71F67D7030BCCCBC9DD02C0769FE1F9107E3CD68A8C54651E
          FF00E5638E599D7955A555DAF4F6D3FBCE5AFCD99B77F0D3C37705E406FE0B82
          2CFCAB886E4AC9035AA3A44E871C36D91C1CE41CF22B378583FC3F03A619EE2A
          165A35EF5D35A3E769B4FCAE95BB1634BF00685A65E691796326A10DC698270B
          20BA62D73E7B8797CE27EFEE7018FB8F4E2AA387845A6BA7EBDCCEB67188AD1A
          909A4D4EDD36E5565CBDACB423BEF873E1EBDF15C9E23B87D41E796EE1BC9ADF
          ED6C2DA59A140913347D0ED0A08F7EB9E309E1A0E7CEFD7CB42A9E7789A78658
          78DAC938A76F79293BB49F996FC1BE0CD33C29BE3D2AE750FB2EDD90DACD3EF8
          A05DDBB6A0C671F5278E2AA9508D2F87632C7667571D67552E6EAD2B37EBFF00
          02C63DBFC26F09471DC413AEA3796D35B5C5BA5BDCDE3BC702DC3EF98C63F819
          980391E9C639ACD6129ECFCFF1DCEB9711631B528D934E2EE92BBE5568DFBA48
          5D47E16E83A9585BDAEA3A86B574D079C12692EC799E5CD1AA491E4281B4AA8E
          833D4E79344B09092B36FF00E1C297106228CDCA9C62AF6D2DA5E2EE9EFBDDFA
          7912DCFC2FF0C4FF006C0DFDA023BCB4B6B69635BA60B9B7DBE4CA07691762E1
          BEB91CD3785A6EFE76FC362639FE2E3CBB5E2E4D69FCD7E65E8EFB165FE1FE8D
          340B1DE5D6A578E2C6EEC4CD35C0DED15CEDF33A0033F28C600C53FABC5AD7B3
          5F7992CE2BC657824BDE8CAC96978DEDD7CF5EE4FACF82349D4B4FD22D84FA85
          94DA3A79763776972639E253188D86EEE19400723B03C1AA9508C925B5B62286
          6B5A8CEA4ACA4A7AC93574F5BEDE4F629A7C33F0AC7A7CD6105BDC436D341650
          18D273C25A48648B04F39DC4927BD4FD569DADE9F81ABCF716E6AA49A6D39BDB
          ACD59FE1B762AF8CFE1D43E2AF190D5351D42E62D31B487D3E6B7B59DE1926DD
          30765761D632A082BD6A6AE1955A9CCDE96B1AE033A782C27B2A714E7CFCC9B4
          9A5656D3CD3D99ABFF00082681E4DC4223B8549F588B586025E04F1F97B71C70
          9FBA5F96B4FABC3F1B9CBFDAD88BA77575070DBA3BDFE7ABD4CE5F85DE1C4D31
          B4D8EE7574B68EE92EAC63FB6B11A7C8ACC47900E428F9D81041C838E80547D5
          216B6BE5AEDE8743CFF14EA7B46A3769A969F1276F8BBECBB7735FC3FE1B9F4A
          D69EF1F5ABFBBB65B28ED20B69A4242E1DDDE57ECCEC580C8030AA055C2938CA
          F7E8726271D1AF49415349DDB6D7A2492EC95BBBBB7739E8FE0F784238AF221F
          DA462BA85A0F2CDD9C471B5C2DC155E33FEB141C9C9E48CD65F52A7AFF005D6E
          7A0F8971ADC5E974EFB6ED45C75F93F434354F86DE1EBFBC96F4C9A95B5DCB7F
          25F19EDAEDA290349124522023A23246A08F6C822AE586849DFADEE73D1CF313
          4A2A164E2A2A366AEB46DA7EA9B658D5BE1FF87753F015B782AEA2B83A55AC71
          470ED988950478DA43F5CE0609F4269CB0F095354DEC451CE313471B2C6C1AE7
          77BE9A6BBE8416DF0D7C2D6D7375716F6D3C4F75AA5BEA920594802681F7C600
          EC81893B7FDA3496169A6DAEE9FDC5CF3CC5CE318C9DED170DBA4959FCEDD4B7
          E16F02E85E1BBF8EFB4D5BA12C768F68BE64C58796D70F39E3D77C8DCFA6053A
          787853775FD6B732C666D88C641C2A5ACDA7B755151FC91507C36F0D0D3C58EC
          BBF24595FD97FAFE7CBBC937CDCE3AE7A1ED4BEAD0B5BD57DFB9AFF6E62B9F9F
          4BDE12DBAC15A3FF00046D9FC35F0E5A788A1D6E137DE74328996237198BCCFB
          3FD9CB118C92630075C719007342C2C14B997F5A587533CC54E83A2ED66AD7B6
          B6E6E6B7DE334CF865A0E9874B7B1BED6E0934C8CC10C897EC19ADF78716EE7F
          8A205460751CF3C9A51C2C236B37A79F4EC3AB9EE22B73A9C62D4F57EEAF8AD6
          E65D9F99A3A0781F43D12EB4DB8B15B90FA74575141BE5DC36DC4A25933EBF30
          18F41C55C28420D35D2FF89CF89CD711898CE33B7BCE2DE9FCAACBF032A4F855
          E1692E751998EA1B6FE3BC8E48FED3F220BA20CFB78C82C467249C76E38ACFEA
          94EEDF7BFE3B9D4B88316A308E9EEF2BDBF93E1BFA1078F7E1869DAFE81ADD85
          93F9173ACCB64D3CD333308C5BED50500E8DE5823DC9E6956C2C671925D6DF81
          A65B9F55C2D6A539EAA9A9592EBCD77AF95C9BE27F8167F1369FA2DA69D25A43
          06973B482DA5DE88E3CA68D4064E576E738C1CE31C53C461DD4514BA119466D1
          C1CEACEA26DCD6EACFAA6F47BDC9F43F87F0D9DED8EB17BAC6A13EB2905BA6A1
          710B88A3BF784615A44C1EDC7046470734E18749A937AF5F3B1188CE655212A3
          08254EEF953D5C54B749FF009F5D88FF00E155F84CE911E96D15E3DB47A64BA6
          2837072229265989CFF783A2907B628FAA53E5E5F2B7EA3FF58319ED5D54D5DC
          94B6EA938FDD66117C2DF0D2C4C92CDAADCC8F2DCCD24D3DEB3C923DC5B0B691
          998F5CA0E3D0F4F4A3EA90F3EBF8AB0DF1062AF74A295A2AC9592519732FC7EF
          24BBF865E19B884A15BD49045651C5325C61E13681C42EA71F780760739073C8
          A1E169BFC3F0D88867B8B83BE96BC9B56D1F3DB993F2D15BB1AF3F8574FB9F0F
          D9E8D773DE5CC369730DD24B2CD991A48A512A96200C8DC07181C715A3A49C54
          5F4392398548569568249C93564B4B3567F818973F0AFC2B3AC5B92F96481651
          04AB7255E1692E85D191180E1C48383D864720D66F094DFF005E773B61C418C8
          DED6B3B5D5B4768F259F95B75DF535342F06699A26B975AA69F737F12DCCB2CC
          F6867CDB89243B9DC2E32093938CE01270055C2846127247362334AB88A31A55
          1276495EDAD96CAFFF0002E55BFF00879A15CB4F34736A367772EA8FAA2DDDB5
          C949A19DE2113946C70A5060A90454BC341FADEE6B4F3AC442C9A4E2A2A166AE
          9A4EEAFE69EB72DF867C15A0F872F22BAD2A09A278F4F4D3D434A5818D647932
          73C962F2392C7AE6AA9D0853778F6B18E2F34C462E0E355DEF272DBAB497DD64
          AC8A9A87C3BF0EDF6A1717D3ADDF9D7171737126D9C81BE7B616D26063A79606
          3D0F3532C3424EEFCFF15635A59D6269414236B2515B748CB9D7E3F814D7E15F
          8622B316D68DA85A08E78AE60786E30D0CD1C3E49917208CBA70F90431E48CF3
          53F54A69597F5D0D9F1062E53E69D9DD34EEB74DF359FA3DBB1B1ADF83B4DD5F
          41D3F49BBBAD441D3A68E7B5BB8EE4A5CC72A0203EF1DC866078C104D693A319
          C545F4FBCE4C3E67568569D5825EF269AB68D3E96FB8E474DF837A33F86EDB4C
          D66F2FE49618EF2DA492D2F248BCFB79AE5E611C87ABE0B03CF520E720D611C1
          4795464FBFDCDDCF5AAF13D755E5568C559F2BD52769462A375DB6FB8E8E0F87
          BE1F87C4675A537C7FD29EF56CDAE58DB2DCBA1469C47FDF2A4F3D3924006B55
          86829737CFCAFDCF3A59CE26543D8E9B28DEDEF72A7751BF6B946DFE16787ED6
          DF4E8ACEFB59B6934F85EDADE74BCCC82DD9837924907280818EE3B1E6A56120
          92B37A7F56379710626729B9C62D49DDAB69CDB736FBBEBD1F637349F08E9BA7
          F8AEF3C4C26BDB9D46E6136FBEE26DE2288BEFF2D0607CBBB1D7246303038AD6
          346319B9F538AB66556AE1A386B2514EFA2DDDAD77F2F420D3BC0BA1586A765A
          8C0973E7595CDEDCC5BA5CAEFBB6DD2E47719E83B528D0845A6BA5FF0012EAE6
          D88AB4E54E56B49453D3A436FF00826447F097C28BA7DE69E5B5392D67B47B28
          6292F5996D20770ED1C20FDC05957D4E0019C7159FD4E9D9AD7B7A7A1D6F88F1
          8E71A9EEF326A4DD97BCD2B272EFA37F99B327827447D50EA4CB71E79D5D357E
          25E3ED0B079238FEEECEDEB5A7B08DEFE77F9DAC71ACD6BAA7ECF4B72386DD1C
          B9BEFB95750F879E1FBDF180F144A6F56F7ED305D3224F889A6850A2395C7653
          8C671DF19E6A6586839F3F5FF234A59D6269E17EAAADCB66B6D6D2776BEFF994
          67F863A1DBF8766D3F4B8D8CABA0CFA2DB7DAE5678C45236FF009C0E490F8391
          CE3A54BC2C146D1ED6378E7D88957552ABD39D4DD959DD69A7C8D0D3BC0BA547
          F0CECFC0F7C1A7B482D628A4923731BB4A843F9AA472ADE60DE0FAD5C70F1F64
          A9339EAE6D59E612C6C34936DEBAE8F4B79AB684507C39D0E15B4905D6ACD7B6
          FA97F691BE6BC26E2598A79677B639531E13680063A6292C3415B7BDEF72E59D
          6225CCAD1E571E5E5B6895EFA2EF7D6FDC8CFC2FF09BE9716992DBDCCB6B159D
          CD9AA34E7FD5CF3099F9EBB83A820F6C52FAAD3B72F4D57DFA95FDBF8C551D54
          D26DC65B758AE55F86FDCBDA5F8234DB2BFD32FE4BDD4EF6EB4C79DEDE5B99C3
          1FDF22A30200008C28C71D727BD54684534EEDB5FA9856CD6AD484E9A8A8A9DA
          E92FE56DAEAFB9D456E79814005001400500140050014005001400500731E2EF
          145DE93ADE95A1E95A31D5B52D4639A658CDCAC089145B77B1620E4E5D4018E7
          3C90066B1AB55C64A31576CF4F0580857A552BD5A9C908D96D77777B69F2777F
          99CD5D7C57FB3CD3CEFE1C9CE9664D420B3BBFB5A6E9E6B38E47915A3C6515BC
          A9006C9E9C819158BC5DB5E5D35FC0F4A1C3DCE945555CFEE36ACF453692D7AB
          57575A7932B699F172FAE75082DEE7C1B3DAC2D71A7C734DFDA11BF9497B8103
          ED032C739DCA3A01D4D4C718DBB38F6EBDF634ADC394E10728D74DDA6D2E56AE
          E9FC4BFC9F525B2F8B4D2A2CD79E1E1636B736D7D2D95C4DA8A0495AD24F2E55
          73B7F76B9390C739F4E996B197DE36DEDAF622A70E72BE5854E669C14928BBAE
          75756D75F4FC4861F8BB73730C1158F851AE75096F6F2D0C02FC2461ADE1498B
          077404A94718CA8391D3BD258C6F68EBAF5EDA972E1B8C1B73AD68A5177E5BBF
          79B8DAC9BD535DD9774DF8B16D7FA8E97A7C5A1DC2DD6ABFD9F2D946D3AE65B7
          B989A479BA7022F2E40C39E5473F30AA8E3149A56D5DADE8FF00C8C6AF0ECE95
          39D47515A1CE9E9B4A0D24BFEDEBAB7AF909AFF8F6EF43F18EB1A7C76777AA32
          DC697696B6A658A24592E84C0156DB9EA833B89F6C7392788709B56BEDF8DC78
          6C9E189C2D3A8E4A3A546DD9B76872F4BDBAE96F989E21F889AAAFC21B9F18E9
          3A34316A16F746D65B4B99B7A44E973E43FCCB8DE3238231D41ED8A278997B07
          522B5FF8360C2E4B45E671C1D59DE2D5D34B74E3CCB47B7999F65F10F5ED3BE2
          0EA9A6EB3A53CBA749AB58582BA5CA11612CF6A8FB00DA1A41BF712DC7518F41
          0B1338D56A4B4BA5E9747454C970F57034EA519DA4A3396CFDE519357DECB4D9
          1BDF0D3E232F8D6F1E38742BDB3B57B51776D72FB991D37EDDAC4A00B2630DB5
          4B0C1EBC1AD68627DB3DAC7066D927F6742EEA26EF66BADED7BAD5B6BA5DA5AF
          4387D07E2878A1F53D3F4BD59ED639751D7C0B29560C09EC1669A1963C740E8D
          1AE4F5C3A9AE6862AA5D465D5FE17699EDE2720C22A73AB4AED469EAAFB4F963
          28BF469FDE99BB27C63783463AADCF852E63B7B8D37FB4F4D02F519AE60F3E38
          8EE007EEDFF7A8C07CC3071906B5FAEDA3CCE3D2EBEFB1C2B8654AAFB28D64DA
          972CB47A3E572D3BAD1AE9E86678CBE2178E60B4F18C0748B6D21F48B3D3E68A
          486E9669639269402872BB5B700C3381B71DF2319D5C4D54A6AD6B5BF13AB039
          2E5F2961A5CEE6A6E69DD349A8ADF7BAB69EBF23AD1E2CD735BF0378B26D3B4E
          3A47883456B8B6585A45B95F3922595304001830651D3824D747B69CE9CDA566
          BE6793FD9D430D8CC3C6A4B9E9D4B3BEAB46DA7F758E0EEFE2FEBB7375AA4BA6
          7D9BEC57BA5C71E84DE5825B5022DB7AFF00B58374BC1E3F76DEF5CAF1B36DDB
          66B4F5D3FCCF761C35878460AADF9A326E7FE0F7ECFF00F24FC51D6A7C5390EB
          BA8E9369E19D53555D3DEEAD8CF6A8CCF2DC5BC7B986C09B555981553BC92D8F
          946456FF005BF79C545BB5FEF4792F87D7B18559D58C79B95D9EC949D96B7BB6
          96AF4DBA8681F1135AD73C5DE1EB1B2D234D6D3B51B4BA96E9E3BE2EF0B43246
          A4728A415DE328CA0E5BB6DE5C31329CE292D1DFA862725A186C3569CE6F9A2E
          297BB64F9937DDEF6D1A76D3CF4E87E295EF89AC7C30973E15B7967B81751FDA
          BECF0A4D3A5B73E63431B10AEE38C03EA7AD6B8895450BC3FA5E479F9452C254
          C438E29D959DAEDA5CDD149AD52F339DD37E295A8D0A5B98924D652D2D34D94D
          E002DFED26EEE0C1CC783B0AB292467B103158C716B96FBDADF8BB1E8D5C827E
          D945FB9CCE6ADBDB923CDBF5BAD8C283E25EB963A3EB36BABDADCE5A4D7069DA
          A433445F759995C2794570BB517019B392BC8C1C9CD62A718B52FEF59FA1DB2C
          8B0F56AD39516BFE5D7345A7F6ECAF7BEB76F54ADA3D19B76BF15E18F584D324
          D1EFEE6DAD9224BDBE4059A376B6139728A9B7600402DB87CC785C735A2C5AE6
          B5BD5FCAE714F8764E93A8A69377B47BAE6E5B5DBBDFAA567A75B87FC2C0F16D
          CDC783A6B6F09DAC167E21B9F904BA8ABBB406DDA556E17E46C0C907238C03CE
          41F58A8DC2D1D25E7E570FEC6C1C238852ACDCA92E91D2FCCA2FAEABA2DBBF4B
          3B7E2DF1F6A7E1CF1F5E585CE970CBA0D9787E4D5A79925FDF8D8C47CABD0E48
          0BB78EB9CE062AAA62254EA34D6895CCB0593D2C5E0A35233B54954504BA6ABF
          A77F958D3F0B78A751F115C6AFA1DDE98DA06AF696B0CE844E974812757F2DC1
          0002C0A36548C71D4839ABA756551B8B566BE7B9CD8CCBE961153AF09FB4849B
          5B38BBC6D75D7477D1FE4719A2F8EBC43A1E99AA6A7E21D53FB6CA78865D02CA
          D52CD2DD5A457C095DD03301B5589015BD81AE78622704E5377D6C7B388CA70D
          89A90A5878727EED546EEDE8D6C93B2DEDD5799AF07C55BA9D9447E10BC8C45A
          34DAB5EFDA2E0446048DE542A159773EE6886D381956CE06306D62DBFB3D2FF9
          9C92E1E8477ACB59A82B2BDDB517BA76564F5F3562BE9BF176F6E2EE28EEBC1B
          35ADB9974F13CDFDA11BF9515E90207DA0658E73B947403393D294718DBD63DB
          AF7D8BABC370845B8D7BBB4ECB95EAE9FC4BFC9F53A6F0578DBFE12187587B8D
          3574C974C72B25ACF7389D00DF832A32AF9790B9072CA41C86E0D6D4ABFB4BDD
          5AC79B8FCABEA8E9A8CB994FAA5A74D9DDDED7D7677E873369F185AE619921F0
          E2DC5E2DF58DA4296FA8068A6FB587F2D964645E01420F18E4104D62B1B7FB3A
          DD75EE7A53E1AE469BAB68DA6DDE3AAE4B5D5AEFBE9ADFBA451F13FC58D52E7C
          1F7E342D066B7D623D22FEEEE58DDC78B0FB3CAF0175254898891490303207A9
          C54D4C5C9C1F2AD6CDFA5B4F99BE13876943150F6F52F073825A3F7B992959EB
          EEE8EDEA745E2CD7B5F7D57C1FE19D23518B4EB9D7209A79F507B75999161891
          8AA21C29662FDFA0078AD6A549DE108BB5FAFA1E7E0B078754F1189AD1E654DA
          4A37B7C4DABB7BD95BE6C8EEFE205EE89A94DA55E69A7558B499AC6CF57D511D
          60DB35C9508C907CC587CE85BE618DDC67068788707CAD5ED64DFAF9150C9A9E
          229AAB0972B9A9CA11D5E91BDEF2D2DB3B69D35B19B0FC6654D3AE350BFF000B
          DCDB5AFD86E2EECD96ED2437061B85B7642303665DD704F6C9ED51F5DD2EE3D1
          FE0EC744B861BA8A9D3AA9BE68A7A356E68B927E7A27A14A0F1C78B53C4F7B6D
          7B6F25BDCAEAF2DBC3A6ADC44F1009A5F9E11A5D992A5C6E04608CE0F03152AB
          D4E769F7DBFEDDB9B4B29C1BC3C650775C89B959DF5ABCB74AFBA5A755DBB869
          BF14F54B7D3F4BD675DB1984975E194BFF00B0DABC6619A592E6186260CC3721
          6328E0B15504E7246688E2E49294974BDBE690EAF0FD29CE7468496951C799DE
          E928CA4FAD9DADDAEDF646C4FF0013F538AF97461E1067D745F4D6725A0D4904
          6AC96CB70184A57054A37A0208C62B478A95F97975BDB7F2B9C71C8694A1EDBD
          B7EEF954AFCAEFAC9C6D6BEE9F997BC2FF001263D7B5FD234F4D21ECADF54D3A
          2BDB79EEA7D866DF1972912EDC4853186F9811D70473554F13CF24AD6BAB9862
          F23786A352A39F33849C5A4B6B3B5DEB757E9A35D2F73BFAEA3C10A002800A00
          2800A002800A002800A002800A002800A002800A002800A002800A0028031BC4
          FE15D03C4C2D86B9A6C5786D5CBC0CCCCAC85861802A41C11C11D0F706B3A946
          152DCC8ECC266189C1F37B09DAFBFF004FB747D0A27C01E0E3A95EEA2741B537
          37C9324EDF36184ABB652173852E38665009EE6A7EAF4AEDDB737FED8C6FB38D
          3F68ED1B5BE5AAF376E89E88B0BE0DF0CAB975D2200C5AD189CB75B539B7EFFC
          1DBF5CD3F634FB76FC3633799E29AB39BFB5FF0093FC5F7985E19F853E13D2B4
          CBAB5BCB08B539EF1678EEAE27520C91CB3190AEDCE17AA8CAE09D8A4F4ACA9E
          129C534D5EE7762F887195EA4650972A8D9A4BA34AD7F3F9F766C69DE05F0A58
          491496BA3C4B2452CD32C8D23BBF9934623918B33124B228049CF4AD2387A71D
          91C75736C6554D4A7A34974DA2EE968BA37720B5F02E9369E2DD1F5CB544862D
          1B4B7D3ACAD563E23562BF36F27270A3681FED31EF49508A9A92E8AC5CF36AD3
          C354A12D5D492937DEDE5B6FAFC91A379E15F0FDE6A8FA9DCE970C978F3DBDC3
          4A4B64C96FBBC96EBD577B63EB56E8C1BE66B5D3F0D8C29E6189A74FD946768D
          A4ADE52B737DF642CBE15F0FCBE1EBBF0FC9A5C0FA5DDBC8F3DB9CED7691CBB9
          EB904B12783C1E98A3D941C5C2DA314730C4C6BC710A6F9E36B3F4565F868411
          782FC31132B2E9316E5B9B7BA0CCEEC7CE810244E4939255540E7F1CD25429AE
          9DBF0D8B96698B96F3E925D3693BB5F364BE1EF0A683E1F9E69B47B016865041
          4495CC6A0B6EC22162A8327385029C28C29FC289C566188C524AB4AF6F257F9B
          B5DFCC6AF83FC32ABA6A8D1EDBFE2597525DD91209304B231676539EECC49EDF
          90A5EC61A69B0DE658A6E6F9DFBE927E692B25F2450B7F86FE07B786F2187C3B
          6891DE2849932D8D82412045E7E45DE036D5C0C8E952B0D495D72EE6F2CF31F2
          7193AAEF1DB6ED6BBEEEDA5DDD97359F05F86358D42E6FF52D221B8B8BAB75B6
          B872CC3CD8D5C3A86008070C0107191EB8AA950A736DB5B98D0CD317878469D3
          9D92775B68DAB3FC0D3D3B4AD3F4F96FA5B3B5485EFEE0DCDD1193E6C85554B1
          CFB2A8FC2AE308C6F6EA7355C454AAA2A6EFCAACBC95EFFA98B67E00F06DA5B6
          9B6D6DE1FB38E2D2EEDAF2C9403FB9989C971CF5CE3AF1C0F4159AC3D24924B6
          3B279C636A4A729546DCD59F9AEC4D2F82BC3326A779A89D3765C5E87FB498E7
          911642CBB598A2B05DE471BB1BBDE9BA14EEDDB72639A629538D3E7D236B689D
          ACEE95DABDBCB62387C09E1387EC263D1A20F6324D2C12798E5C3CBFEB4B316C
          B96C0CEE27381E94961E9AB69B152CDF192E6BCFE2B27B5B4DACADA5BA5AC4F7
          DE0FF0E5EF876CFC3F71A629D36C820B6852474F2B6A955DACAC187048EBD09A
          6E8C251506B44674F32C553AF2C4467EFCB77A3BDF5D9AB14EE7E1D7826E26B2
          965F0ED9EEB186382DB686511A236E4180403B5B241392327D4D4BC35276F776
          3686758F8292555FBCDB7E6DAB3FBD1435EF861E1ABCB2D5FF00B2ECE1D2B51D
          5209E096F96332B2ACE7F7E5559B68670482C39E9D801533C2D369F2AB37D7D7
          737C367D8AA73A7ED65CD1834D2DBE1F8754AF65D8D6B4F04786EDB5087514B0
          26F238A389A5F35C094247E5A9910108EC178CB03C55AA104EF6D4E59E6B8A9C
          1D372F75B6ED65A5DDDD9EEB5D746416BF0EBC196B6715A5BE871470C3769791
          2ACB266395410A54EECA80091B47CB8246292C3524AC979973CEB1D3939CAA6A
          D72BD16A9F7D3F1DCD1D5FC2DE1FD5F558754D4B4B82E6EE1B792D9647CF30C8
          0878D8670CA727860455CA9424F99AD4E7A19862685374A9CDA8B69FCD6CD767
          E81E16F0B681E178668B42D363B313B29958333B3ED185059892401C019C01D2
          8A74A14FE1418CCC3118D69D795EDB7CF7D169AF5EE4575E0FF0D5CE9B75A74D
          A4C26DAEAF5AFE550CCA4DCB36E32860772BE79CA918A4E8C1A6ADE7F32A199E
          2A1523514F58AE55FE1DAD6D9AF5083C1FE1C852555D315BCEB06D3A46925776
          7B7666631966624825D8E739E7AD0A8C174E96F904B33C549ABCF69732D12F7A
          C95F45E4845F0678614305D1E00185A03CB73F6539B7EFFC07A7EB9A3D853EDD
          BF0D86F33C5BDE6FED7FE4FF0017DE4BA47853C3FA52DF8B2D3635FED050B746
          47690CAA010109724EC019B0BD064E0734E34611BD96E4D7CC3135F939E5F0ED
          B2B79E96D74DF728699F0F7C1DA684FB1E890A149ADE7526491C8783779272CC
          4FC9B8803A01C7402A2386A51D976FC3637AB9CE36B7C753A4974DA5F16CBADB
          51BA97C3AF056A30C70DEF87EDA648DA72A0B38FF5CE5E4070790CC7760E403C
          8C512C35296EBFA614B3AC7516DC2A357B76FB2ACBA745A7A1A3E21F0AF87FC4
          1A75BD86AFA6457305AB06B7CB32B4440C02AEA4329C71C1AB9D284D5A48E7C2
          E6189C2D47528CECDEFE7EA9E8CA4BE00F072EA365A82E836AB7162912C0C0B0
          03CAFF00564AE70C573F296048EC6A7EAF4AE9DB63779C635C254DD47695EFF3
          DFCD5FAA5A3241E06F09FD852C4E876AD6C96D3DAAC6DB8A88A670F2AF27F898
          03EB91C628F614ED6B7F4C9FED6C673F3FB477BA77F38AB27F25A09A4F817C27
          A5342F61A34313433B5C2317763E634462672589C9284A9CE73F5A23429C7641
          5B36C657BAA93BDD5BA6D7BDBEFD48ADFE1E782E0B13629E1FB536C6D1ECFCB7
          2CE3C97712320DC4E06F5523D30318C52586A495ADE45CB3AC74A7CEEA3BDD4B
          A2D52B5FEED3CFA93E99E08F0B69BF65365A3C31B5A4D2CF1397767124A9E5C8
          E5892598A7CB96278C7A538D0A71B596C675B35C5D6E6E79FC4927B6C9DD2B74
          B3D74174DF0578634EBEB1BDB3D29229B4F844369FBC76585426C1B54B150DB7
          E5DD8DD8E334E3429C5A696C15734C5D584A139DD49DDEDAEB7D5DAF6BEB6DAE
          7435A9E7850014005001400500140050014005001401FFD9}
        Stretch = True
      end
    end
    object qrcbTerms: TQRChildBand
      Left = 38
      Top = 681
      Width = 718
      Height = 52
      AlignToBottom = False
      BeforePrint = qrcbTermsBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        137.583333333333300000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = qrcbAvailability
      PrintOrder = cboAfterParent
      object QRLabel10: TQRLabel
        Left = 0
        Top = 6
        Width = 141
        Height = 19
        Size.Values = (
          50.270833333333330000
          0.000000000000000000
          15.875000000000000000
          373.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'TERMS & CONDITIONS'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsUnderline]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrrchtextTerms: TQRRichText
        Left = 0
        Top = 26
        Width = 713
        Height = 22
        Size.Values = (
          58.208333333333330000
          0.000000000000000000
          68.791666666666670000
          1886.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AutoStretch = False
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        HiresExport = False
        Transparent = False
        YIncrement = 50
      end
    end
    object qrbPageFooter: TQRBand
      Left = 38
      Top = 1205
      Width = 718
      Height = 15
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        39.687500000000000000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageFooter
    end
    object qrcbNotesDirection: TQRChildBand
      Left = 38
      Top = 893
      Width = 718
      Height = 312
      AlignToBottom = False
      Enabled = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        825.500000000000000000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = qrcbPriceMatch
      PrintOrder = cboAfterParent
      object gtQRLabel7: TQRLabel
        Left = 134
        Top = 22
        Width = 93
        Height = 33
        Size.Values = (
          87.312500000000000000
          354.541666666666700000
          58.208333333333330000
          246.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'NOTES'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 20
      end
      object gtQRLabel8: TQRLabel
        Left = 464
        Top = 22
        Width = 151
        Height = 33
        Size.Values = (
          87.312500000000000000
          1227.666666666667000000
          58.208333333333330000
          399.520833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'DIRECTION'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 20
      end
      object gtQRShape15: TQRShape
        Left = 0
        Top = 56
        Width = 717
        Height = 9
        Size.Values = (
          23.812500000000000000
          0.000000000000000000
          148.166666666666700000
          1897.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape16: TQRShape
        Left = 356
        Top = 0
        Width = 9
        Height = 313
        Size.Values = (
          828.145833333333300000
          941.916666666666700000
          0.000000000000000000
          23.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
    end
    object qrsdQOptions: TQRSubDetail
      Left = 38
      Top = 524
      Width = 718
      Height = 24
      AlignToBottom = False
      BeforePrint = qrsdQOptionsBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.500000000000000000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpDetails
      DataSet = qryQOptions
      HeaderBand = qrcbDiscount
      PrintBefore = False
      PrintIfEmpty = True
      object lblOptionDescription: TQRLabel
        Left = 296
        Top = 4
        Width = 113
        Height = 17
        Size.Values = (
          44.979166666666670000
          783.166666666666700000
          10.583333333333330000
          298.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblOptionDescription'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object lblQuoteOption: TQRLabel
        Left = -1
        Top = 4
        Width = 82
        Height = 17
        Size.Values = (
          44.979166666666670000
          -2.645833333333333000
          10.583333333333330000
          216.958333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblWorktopSize'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object lblOptionComplete: TQRLabel
        Left = 448
        Top = 4
        Width = 104
        Height = 17
        Size.Values = (
          44.979166666666670000
          1185.333333333333000000
          10.583333333333330000
          275.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblOptionComplete'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object lblOptionVAT: TQRLabel
        Left = 553
        Top = 4
        Width = 71
        Height = 17
        Size.Values = (
          44.979166666666670000
          1463.145833333333000000
          10.583333333333330000
          187.854166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblOptionVAT'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object lblOptionTotal: TQRLabel
        Left = 624
        Top = 4
        Width = 77
        Height = 17
        Size.Values = (
          44.979166666666670000
          1651.000000000000000000
          10.583333333333330000
          203.729166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblOptionTotal'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
    end
    object qrcbDiscount: TQRBand
      Left = 38
      Top = 488
      Width = 718
      Height = 36
      Frame.DrawBottom = True
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        95.250000000000000000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupHeader
      object gtQRLabel1: TQRLabel
        Left = 8
        Top = 17
        Width = 81
        Height = 16
        Size.Values = (
          42.333333333333330000
          21.166666666666670000
          44.979166666666670000
          214.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Price Options:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object gtQRLabel5: TQRLabel
        Left = 360
        Top = 17
        Width = 47
        Height = 16
        Size.Values = (
          42.333333333333330000
          952.500000000000000000
          44.979166666666670000
          124.354166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Material'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object gtQRLabel10: TQRLabel
        Left = 671
        Top = 17
        Width = 29
        Height = 16
        Size.Values = (
          42.333333333333330000
          1775.354166666667000000
          44.979166666666670000
          76.729166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object gtQRLabel11: TQRLabel
        Left = 529
        Top = 17
        Width = 24
        Height = 16
        Size.Values = (
          42.333333333333330000
          1399.645833333333000000
          44.979166666666670000
          63.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Nett'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object gtQRLabel12: TQRLabel
        Left = 599
        Top = 17
        Width = 24
        Height = 16
        Size.Values = (
          42.333333333333330000
          1584.854166666667000000
          44.979166666666670000
          63.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'VAT'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
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
  object qryReport: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Quote.*,'
      '        Operator.Operator_Name,'
      '        Operator.Telephone_number,'
      '        Account_Manager.Operator_Name AS Account_Manager_Name,'
      '        Account_Manager.Telephone_number AS AM_Telephone_Number,'
      '        Vat.Vat_rate,'
      '        Sales_Lead_Source.Sales_Lead_Source,'
      '        Sales_Lead_Source.Sales_Lead_Source_Descr,'
      '        Material_Type.Material_Type,'
      '        Material_Type.Description as Material_Description'
      'FROM Material_Type'
      '      INNER JOIN (Vat'
      '      INNER JOIN (Sales_Lead_Source'
      '      INNER JOIN (Operator AS Account_Manager'
      '      RIGHT JOIN (Operator'
      '      INNER JOIN Quote'
      '        ON Operator.Operator = Quote.Operator)'
      '        ON Account_Manager.Operator = Quote.Account_Manager)'
      
        '        ON Sales_Lead_Source.Sales_Lead_Source = Quote.Sales_Lea' +
        'd_Source)'
      '        ON Vat.Vat = Quote.Vat)'
      '        ON Material_Type.Material_Type = Quote.Material_Type'
      'WHERE quote = :Quote')
    Left = 547
    Top = 278
    ParamData = <
      item
        Name = 'Quote'
        DataType = ftInteger
      end>
  end
  object qryQElements: TFDQuery
    MasterSource = dtsReport
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Quote_Element.*,'
      '        Thickness.Thickness_mm,'
      '        Worktop.Description,'
      '        Material_Use.Use_Description'
      'FROM Thickness'
      '      INNER JOIN (Worktop'
      '      INNER JOIN (Worktop_thickness'
      '      INNER JOIN (Material_Use'
      '      RIGHT JOIN Quote_Element'
      
        '        ON Material_Use.Material_Use = Quote_Element.Material_Us' +
        'e)'
      
        '        ON (Worktop_thickness.Thickness = Quote_Element.Thicknes' +
        's) AND (Worktop_thickness.Worktop = Quote_Element.Worktop))'
      '        ON Worktop.Worktop = Worktop_thickness.Worktop)'
      '        ON Thickness.Thickness = Worktop_thickness.Thickness'
      'WHERE Quote = :Quote'
      'ORDER BY Element_number')
    Left = 208
    Top = 16
    ParamData = <
      item
        Name = 'Quote'
        DataType = ftInteger
      end>
  end
  object dtsReport: TDataSource
    DataSet = qryReport
    Left = 160
    Top = 16
  end
  object qryQCutOuts: TFDQuery
    MasterSource = dtsReport
    ConnectionName = 'WT'
    SQL.Strings = (
      'select Quote_CutOut.*, CutOut.Description'
      'from Quote_CutOut, CutOut'
      'where Quote = :Quote and'
      'Quote_CutOut.CutOut = CutOut.CutOut')
    Left = 198
    Top = 78
    ParamData = <
      item
        Name = 'Quote'
        DataType = ftInteger
      end>
  end
  object qryQEdges: TFDQuery
    MasterSource = dtsReport
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Quote_Edge.*, Edge_Profile.Description'
      'from Quote_Edge, Edge_Profile'
      'where Quote = :Quote and'
      'Quote_Edge.Edge_Profile = Edge_Profile.Edge_Profile'
      'order by Edge_number')
    Left = 190
    Top = 126
    ParamData = <
      item
        Name = 'Quote'
        DataType = ftInteger
      end>
  end
  object qryQExtras: TFDQuery
    MasterSource = dtsReport
    ConnectionName = 'WT'
    SQL.Strings = (
      'select Quote_Extra.*, Extra_Charge.Description'
      'from Quote_Extra, Extra_Charge'
      'where Quote = :Quote and'
      'Quote_Extra.Extra_Charge = Extra_Charge.Extra_Charge')
    Left = 222
    Top = 89
    ParamData = <
      item
        Name = 'Quote'
        DataType = ftInteger
      end>
  end
  object qryAddress: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select Address, Address_name,'
      'Street,'
      'Locale,'
      'Town_City,'
      'County_State,'
      'postcode,'
      'Telephone_Number,'
      'Email_Address,'
      'Web_Address,'
      'Fax_Number'
      'from Address'
      'where Address = :Address')
    Left = 526
    Top = 59
    ParamData = <
      item
        Name = 'Address'
      end>
  end
  object qryCustomer: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select Customer, Customer_name,'
      'Street,'
      'Locale,'
      'Town_City,'
      'County_State,'
      'postcode,'
      'Vat_Rate,'
      'Telephone_Number,'
      'Email_Address,'
      'Credit_Status'
      'from Customer, VAT'
      'where Customer = :Customer and'
      'Customer.VAT = Vat.Vat')
    Left = 454
    Top = 286
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
      end>
  end
  object dtsAddress: TDataSource
    Left = 566
    Top = 67
  end
  object qryCompany: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * from company'
      'where company = 1')
    Left = 542
    Top = 103
  end
  object qrygetNotes: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from Notes'
      'where notes_code = :Notes_Code'
      'order by notes_code, notes_line')
    Left = 662
    Top = 285
    ParamData = <
      item
        Name = 'Notes_Code'
      end>
  end
  object qryUpQuote: TFDQuery
    ConnectionName = 'wT'
    SQL.Strings = (
      'update Quote'
      'set Quote_Status = :Quote_Status'
      'Where Quote = :Quote')
    Left = 358
    Top = 293
    ParamData = <
      item
        Name = 'Quote_Status'
      end
      item
        Name = 'Quote'
      end>
  end
  object qryEndUser: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select End_User, End_User_name,'
      'Street,'
      'Locale,'
      'Town_City,'
      'postcode,'
      'County_State,'
      'Vat_Rate'
      'from End_User, VAT'
      'where End_User = :End_User and'
      'End_User.VAT = Vat.Vat')
    Left = 246
    Top = 278
    ParamData = <
      item
        Name = 'End_User'
      end>
  end
  object qryQOptions: TFDQuery
    MasterSource = dtsReport
    ConnectionName = 'Wt'
    SQL.Strings = (
      'SELECT DISTINCT'
      '  Quote.Quote,'
      '  Quote.Nett_Price,'
      '  Quote.Discount_Value,'
      '  Quote.Quote_Number,'
      '  Quote.Markup_Value,'
      '  Quote.Installation_Price,'
      '  Quote.Survey_Price,'
      '  Quote.Delivery_Price,'
      '  Quote.Original_Quote,'
      '  Worktop.Description as Worktop_Description,'
      '  Material_Type.Description as Material_Description,'
      '  Vat.Vat_Rate'
      'FROM Vat'
      '      INNER JOIN (Material_Type'
      '      INNER JOIN (Quote'
      '      INNER JOIN ((Quote_Element'
      '      INNER JOIN Worktop'
      '          ON Quote_Element.Worktop = Worktop.Worktop)'
      '      INNER JOIN Thickness'
      '          ON Quote_Element.Thickness = Thickness.Thickness)'
      '          ON Quote.Quote = Quote_Element.Quote)'
      
        '          ON Material_Type.Material_Type = Worktop.Material_Type' +
        ')'
      '          ON Vat.Vat = Quote.Vat'
      'WHERE Quote.Original_Quote = :Original_Quote AND'
      '      (Quote_Element.Element_Number < 1000)'
      'ORDER BY Quote.Quote_Number')
    Left = 254
    Top = 171
    ParamData = <
      item
        Name = 'Original_Quote'
      end>
  end
end
