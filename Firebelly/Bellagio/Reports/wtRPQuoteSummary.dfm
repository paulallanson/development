object frmwtRPQuoteSummary: TfrmwtRPQuoteSummary
  Left = 2
  Top = 0
  Caption = 'Quote Summary'
  ClientHeight = 695
  ClientWidth = 1220
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Scaled = False
  OnCreate = FormCreate
  TextHeight = 13
  object qrpDetails: TQuickRep
    Left = 216
    Top = 13
    Width = 992
    Height = 1403
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
      'QRLOOPBAND1')
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
    PrevInitialZoom = qrZoom100
    PreviewDefaultSaveType = stPDF
    PreviewLeft = 0
    PreviewTop = 0
    object qrgQuote: TQRGroup
      Left = 47
      Top = 481
      Width = 898
      Height = 3
      AlignToBottom = False
      BeforePrint = qrgQuoteBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        6.350000000000000000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'quote'
      FooterBand = qrbQFooter
      Master = qrpDetails
      ReprintOnNewPage = False
    end
    object qrbPageHeader: TQRBand
      Left = 47
      Top = 47
      Width = 898
      Height = 434
      AlignToBottom = False
      BeforePrint = qrbPageHeaderBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        918.633333333333300000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object gtQRShape2: TQRShape
        Left = 10
        Top = 220
        Width = 441
        Height = 171
        Size.Values = (
          362.479166666666700000
          21.166666666666670000
          465.666666666666700000
          933.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrlblQuoteCaption: TQRLabel
        Left = 620
        Top = 10
        Width = 279
        Height = 54
        Size.Values = (
          114.300000000000000000
          1312.333333333333000000
          21.166666666666670000
          590.550000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'QUOTATION'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -47
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
        Left = 10
        Top = 409
        Width = 871
        Height = 21
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
        Font.Height = -17
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
      object qrmAddress: TQRMemo
        Left = 50
        Top = 231
        Width = 291
        Height = 151
        Size.Values = (
          320.145833333333300000
          105.833333333333300000
          489.479166666666700000
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
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object gtQRShape6: TQRShape
        Left = 520
        Top = 89
        Width = 371
        Height = 231
        Size.Values = (
          489.479166666666700000
          1100.666666666667000000
          187.854166666666700000
          785.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape9: TQRShape
        Left = 520
        Top = 126
        Width = 371
        Height = 4
        Size.Values = (
          7.937500000000000000
          1100.666666666667000000
          267.229166666666700000
          785.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape8: TQRShape
        Left = 520
        Top = 160
        Width = 371
        Height = 9
        Size.Values = (
          18.520833333333330000
          1100.666666666667000000
          338.666666666666700000
          785.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape12: TQRShape
        Left = 520
        Top = 199
        Width = 371
        Height = 9
        Size.Values = (
          18.520833333333330000
          1100.666666666667000000
          420.687500000000000000
          785.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel2: TQRLabel
        Left = 526
        Top = 135
        Width = 36
        Height = 21
        Size.Values = (
          44.450000000000000000
          1113.366666666667000000
          285.750000000000000000
          76.200000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
      object QRLabel3: TQRLabel
        Left = 526
        Top = 99
        Width = 67
        Height = 21
        Size.Values = (
          44.450000000000000000
          1113.366666666667000000
          209.550000000000000000
          141.816666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Quote No:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
      object QRLabel4: TQRLabel
        Left = 526
        Top = 175
        Width = 56
        Height = 21
        Size.Values = (
          44.450000000000000000
          1113.366666666667000000
          370.416666666666700000
          118.533333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Contact:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
      object QRLabel16: TQRLabel
        Left = 526
        Top = 215
        Width = 47
        Height = 21
        Size.Values = (
          44.450000000000000000
          1113.366666666667000000
          455.083333333333300000
          99.483333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Phone:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
      object QRDBText1: TQRDBText
        Left = 799
        Top = 135
        Width = 86
        Height = 21
        Size.Values = (
          44.450000000000000000
          1691.216666666667000000
          285.750000000000000000
          182.033333333333300000)
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
        Font.Height = -15
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
        Left = 844
        Top = 95
        Width = 41
        Height = 21
        Size.Values = (
          44.450000000000000000
          1786.466666666667000000
          201.083333333333300000
          86.783333333333330000)
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
        Font.Height = -15
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
        Left = 720
        Top = 175
        Width = 165
        Height = 21
        Size.Values = (
          44.450000000000000000
          1524.000000000000000000
          370.416666666666700000
          349.250000000000000000)
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
        Font.Height = -15
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
      object QRDBText6: TQRDBText
        Left = 730
        Top = 215
        Width = 155
        Height = 21
        Size.Values = (
          44.450000000000000000
          1545.166666666667000000
          455.083333333333300000
          328.083333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'AM_Telephone_number'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
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
        Left = 634
        Top = 89
        Width = 11
        Height = 231
        Size.Values = (
          489.479166666666700000
          1341.437500000000000000
          187.854166666666700000
          23.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRShape3: TQRShape
        Left = 520
        Top = 239
        Width = 371
        Height = 9
        Size.Values = (
          18.520833333333330000
          1100.666666666667000000
          505.354166666666700000
          785.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel5: TQRLabel
        Left = 526
        Top = 291
        Width = 107
        Height = 21
        Size.Values = (
          44.450000000000000000
          1113.366666666667000000
          615.950000000000000000
          226.483333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Your Reference:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
      object gtQRShape4: TQRShape
        Left = 520
        Top = 279
        Width = 371
        Height = 9
        Size.Values = (
          18.520833333333330000
          1100.666666666667000000
          590.020833333333300000
          785.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRLabel2: TQRLabel
        Left = 526
        Top = 254
        Width = 42
        Height = 20
        Size.Values = (
          42.333333333333330000
          1113.366666666667000000
          537.633333333333300000
          88.900000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Email:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
      object qrlblAMEmail: TQRLabel
        Left = 843
        Top = 254
        Width = 42
        Height = 20
        Size.Values = (
          42.333333333333330000
          1784.350000000000000000
          537.633333333333300000
          88.900000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Email:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
      object gtQRShape5: TQRShape
        Left = 520
        Top = 351
        Width = 371
        Height = 40
        Size.Values = (
          84.666666666666670000
          1100.666666666667000000
          743.479166666666700000
          785.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRMemo1: TQRMemo
        Left = 526
        Top = 361
        Width = 356
        Height = 20
        Size.Values = (
          42.333333333333330000
          1113.895833333333000000
          764.645833333333300000
          754.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Lines.Strings = (
          'Quote valid for 30 days from date above.')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object qrlblReference: TQRLabel
        Left = 816
        Top = 291
        Width = 69
        Height = 21
        Size.Values = (
          44.450000000000000000
          1727.200000000000000000
          615.950000000000000000
          146.050000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Reference'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
      object qriHeadLogo: TQRImage
        Left = 10
        Top = 0
        Width = 275
        Height = 81
        Size.Values = (
          171.979166666666700000
          21.166666666666670000
          0.000000000000000000
          582.083333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Stretch = True
      end
    end
    object qrbPageFooter: TQRBand
      Left = 47
      Top = 926
      Width = 898
      Height = 39
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        82.550000000000000000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageFooter
      object qrlblCompanyAdd: TQRLabel
        Left = 234
        Top = 9
        Width = 429
        Height = 21
        Size.Values = (
          44.450000000000000000
          495.300000000000000000
          19.050000000000000000
          908.050000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Some Unit, Some business Park, Some town and postcode'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
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
    object qrsdQElements: TQRSubDetail
      Left = 47
      Top = 484
      Width = 898
      Height = 30
      AlignToBottom = False
      BeforePrint = qrsdQElementsBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.500000000000000000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpDetails
      DataSet = qryQElements
      PrintBefore = False
      PrintIfEmpty = True
      object lblWorktopSize: TQRLabel
        Left = 412
        Top = 5
        Width = 99
        Height = 21
        Size.Values = (
          44.450000000000000000
          872.066666666666700000
          10.583333333333330000
          209.550000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblWorktopSize'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
      object lblWorktopArea: TQRLabel
        Left = 602
        Top = 5
        Width = 100
        Height = 21
        Size.Values = (
          44.450000000000000000
          1274.233333333333000000
          10.583333333333330000
          211.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblWorktopArea'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
    object qrsdQCutOuts: TQRSubDetail
      Left = 47
      Top = 514
      Width = 898
      Height = 33
      AlignToBottom = False
      BeforePrint = qrsdQCutOutsBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        69.850000000000000000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpDetails
      DataSet = qryQCutOuts
      PrintBefore = False
      PrintIfEmpty = True
      object qrlblQuantity: TQRLabel
        Left = 620
        Top = 5
        Width = 82
        Height = 21
        Size.Values = (
          44.450000000000000000
          1312.333333333333000000
          10.583333333333330000
          173.566666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblQuantity'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
      object qrlblCutOut: TQRLabel
        Left = 438
        Top = 5
        Width = 75
        Height = 21
        Size.Values = (
          44.450000000000000000
          927.100000000000000000
          10.583333333333330000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblCutOut'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
    object qrsdQEdges: TQRSubDetail
      Left = 47
      Top = 547
      Width = 898
      Height = 31
      AlignToBottom = False
      BeforePrint = qrsdQEdgesBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        65.616666666666670000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpDetails
      DataSet = qryQEdges
      PrintBefore = False
      PrintIfEmpty = True
      object qrlblLength: TQRLabel
        Left = 631
        Top = 5
        Width = 72
        Height = 21
        Size.Values = (
          44.450000000000000000
          1335.616666666667000000
          10.583333333333330000
          152.400000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblLength'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
      object qrlblEdgeDescription: TQRLabel
        Left = 376
        Top = 5
        Width = 136
        Height = 21
        Size.Values = (
          44.450000000000000000
          795.866666666666700000
          10.583333333333330000
          287.866666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblEdgeDescription'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
    object qrsdQExtras: TQRSubDetail
      Left = 47
      Top = 578
      Width = 898
      Height = 33
      AlignToBottom = False
      BeforePrint = qrsdQExtrasBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        69.850000000000000000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpDetails
      DataSet = qryQExtras
      PrintBefore = False
      PrintIfEmpty = True
      object qrlblExtraDescription: TQRLabel
        Left = 377
        Top = 5
        Width = 136
        Height = 21
        Size.Values = (
          44.450000000000000000
          797.983333333333300000
          10.583333333333330000
          287.866666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblExtraDescription'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
      object qrlblExtraQuantity: TQRLabel
        Left = 586
        Top = 5
        Width = 116
        Height = 21
        Size.Values = (
          44.450000000000000000
          1240.366666666667000000
          10.583333333333330000
          245.533333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblExtraQuantity'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
    object qrbQFooter: TQRBand
      Left = 47
      Top = 689
      Width = 898
      Height = 42
      Frame.DrawTop = True
      AfterPrint = qrbQFooterAfterPrint
      AlignToBottom = False
      BeforePrint = qrbQFooterBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        88.900000000000000000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRLabel6: TQRLabel
        Left = 219
        Top = 10
        Width = 81
        Height = 21
        Size.Values = (
          44.450000000000000000
          463.550000000000000000
          21.166666666666670000
          171.450000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Fixing Team'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
      object QRLabel7: TQRLabel
        Left = 431
        Top = 10
        Width = 141
        Height = 21
        Size.Values = (
          44.450000000000000000
          912.283333333333300000
          21.166666666666670000
          298.450000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Surveying/Templating'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
      object QRLabel8: TQRLabel
        Left = 725
        Top = 10
        Width = 53
        Height = 21
        Size.Values = (
          44.450000000000000000
          1534.583333333333000000
          21.166666666666670000
          112.183333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Delivery'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
      object qrlblInstallation: TQRLabel
        Left = 321
        Top = 10
        Width = 96
        Height = 21
        Size.Values = (
          44.450000000000000000
          679.450000000000000000
          21.166666666666670000
          203.200000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblInstallation'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
      object qrlblSurvey: TQRLabel
        Left = 594
        Top = 10
        Width = 73
        Height = 21
        Size.Values = (
          44.450000000000000000
          1257.300000000000000000
          21.166666666666670000
          154.516666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblSurvey'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
      object qrlblDelivery: TQRLabel
        Left = 797
        Top = 10
        Width = 80
        Height = 21
        Size.Values = (
          44.450000000000000000
          1686.983333333333000000
          21.166666666666670000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblDelivery'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
      object gtQRLabel9: TQRLabel
        Left = 11
        Top = 10
        Width = 121
        Height = 21
        Size.Values = (
          44.450000000000000000
          23.283333333333330000
          21.166666666666670000
          256.116666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Charges include:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
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
      Left = 47
      Top = 796
      Width = 898
      Height = 65
      AlignToBottom = False
      BeforePrint = qrcbAvailabilityBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        137.583333333333300000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = qrcbNotes
      PrintOrder = cboAfterParent
      object QRLabel9: TQRLabel
        Left = 10
        Top = 9
        Width = 109
        Height = 21
        Size.Values = (
          44.450000000000000000
          21.166666666666670000
          19.050000000000000000
          230.716666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'AVAILABILITY'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
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
        Left = 10
        Top = 33
        Width = 871
        Height = 27
        Size.Values = (
          58.208333333333330000
          21.166666666666670000
          68.791666666666670000
          1844.145833333333000000)
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
    object qrcbTerms: TQRChildBand
      Left = 47
      Top = 861
      Width = 898
      Height = 65
      AlignToBottom = False
      BeforePrint = qrcbTermsBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        137.583333333333300000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = qrcbAvailability
      PrintOrder = cboAfterParent
      object QRLabel10: TQRLabel
        Left = 10
        Top = 8
        Width = 177
        Height = 24
        Size.Values = (
          50.800000000000000000
          21.166666666666670000
          16.933333333333330000
          374.650000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'TERMS & CONDITIONS'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
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
        Left = 10
        Top = 33
        Width = 871
        Height = 27
        Size.Values = (
          58.208333333333330000
          21.166666666666670000
          68.791666666666670000
          1844.145833333333000000)
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
      Left = 47
      Top = 731
      Width = 898
      Height = 65
      AlignToBottom = False
      BeforePrint = qrcbNotesBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        137.583333333333300000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = qrbQFooter
      PrintOrder = cboAfterParent
      object qrlNotes: TQRLabel
        Left = 10
        Top = 10
        Width = 55
        Height = 21
        Size.Values = (
          44.450000000000000000
          21.166666666666670000
          21.166666666666670000
          116.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'NOTES'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
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
        Left = 10
        Top = 33
        Width = 871
        Height = 27
        Size.Values = (
          58.208333333333330000
          21.166666666666670000
          68.791666666666670000
          1844.145833333333000000)
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
    object qrsdQOptions: TQRSubDetail
      Left = 47
      Top = 656
      Width = 898
      Height = 33
      AlignToBottom = False
      BeforePrint = qrsdQOptionsBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        69.850000000000000000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpDetails
      DataSet = qryQOptions
      HeaderBand = qrcbDiscount
      PrintBefore = False
      PrintIfEmpty = True
      object lblOptionDescription: TQRLabel
        Left = 379
        Top = 5
        Width = 132
        Height = 21
        Size.Values = (
          44.450000000000000000
          802.216666666666700000
          10.583333333333330000
          279.400000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblOptionDescription'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
      object lblQuoteOption: TQRLabel
        Left = 12
        Top = 5
        Width = 99
        Height = 21
        Size.Values = (
          44.450000000000000000
          25.400000000000000000
          10.583333333333330000
          209.550000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblWorktopSize'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
      object lblOptionComplete: TQRLabel
        Left = 569
        Top = 5
        Width = 121
        Height = 21
        Size.Values = (
          44.450000000000000000
          1204.383333333333000000
          10.583333333333330000
          256.116666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblOptionComplete'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
      object lblOptionVAT: TQRLabel
        Left = 695
        Top = 5
        Width = 85
        Height = 21
        Size.Values = (
          44.450000000000000000
          1471.083333333333000000
          10.583333333333330000
          179.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblOptionVAT'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
      object lblOptionTotal: TQRLabel
        Left = 786
        Top = 5
        Width = 90
        Height = 21
        Size.Values = (
          44.450000000000000000
          1663.700000000000000000
          10.583333333333330000
          190.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblOptionTotal'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
    object qrcbDiscount: TQRBand
      Left = 47
      Top = 611
      Width = 898
      Height = 45
      Frame.DrawBottom = True
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        95.250000000000000000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupHeader
      object gtQRLabel4: TQRLabel
        Left = 10
        Top = 21
        Width = 102
        Height = 20
        Size.Values = (
          42.333333333333330000
          21.166666666666670000
          44.450000000000000000
          215.900000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Price Options:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
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
        Left = 450
        Top = 21
        Width = 58
        Height = 20
        Size.Values = (
          42.333333333333330000
          952.500000000000000000
          44.450000000000000000
          122.766666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Material'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object gtQRLabel6: TQRLabel
        Left = 839
        Top = 21
        Width = 37
        Height = 20
        Size.Values = (
          42.333333333333330000
          1775.883333333333000000
          44.450000000000000000
          78.316666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object gtQRLabel7: TQRLabel
        Left = 661
        Top = 21
        Width = 31
        Height = 20
        Size.Values = (
          42.333333333333330000
          1399.116666666667000000
          44.450000000000000000
          65.616666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Nett'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object gtQRLabel8: TQRLabel
        Left = 749
        Top = 21
        Width = 29
        Height = 20
        Size.Values = (
          42.333333333333330000
          1585.383333333333000000
          44.450000000000000000
          61.383333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'VAT'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
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
      'select  Quote.*,'
      '        Operator.Operator_Name,'
      '        Operator.Telephone_number,'
      '        Account_Manager.Operator_Name AS Account_Manager_Name,'
      '        Account_Manager.Telephone_number as AM_Telephone_Number,'
      '        Account_Manager.*,'
      '        Vat.Vat_rate'
      'FROM Operator AS Account_Manager'
      '      RIGHT JOIN (Operator'
      '      INNER JOIN (Vat'
      '      INNER JOIN Quote'
      '        ON Vat.Vat = Quote.Vat)'
      '        ON Operator.Operator = Quote.Operator)'
      '        ON Account_Manager.Operator = Quote.Account_Manager'
      'WHERE quote = :Quote')
    Left = 539
    Top = 254
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
    Left = 238
    Top = 86
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
      'select *'
      'from Address'
      'where Address = :Address')
    Left = 622
    Top = 179
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
      'postcode,'
      'County_State,'
      'Vat_Rate,'
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
    Left = 526
    Top = 11
  end
  object qryCompany: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * from company'
      'where company = 1')
    Left = 574
    Top = 199
  end
  object qrygetNotes: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from Notes'
      'where notes_code = :Notes_Code'
      'order by notes_code, notes_line')
    Left = 510
    Top = 173
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
    Left = 342
    Top = 158
    ParamData = <
      item
        Name = 'End_User'
      end>
  end
  object qryAccountManager: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT Email_Address'
      'FROM Operator'
      'WHERE Operator = :Account_Manager')
    Left = 582
    Top = 291
    ParamData = <
      item
        Name = 'Account_Manager'
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
