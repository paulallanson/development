object frmwtRPJobRemedialSheet: TfrmwtRPJobRemedialSheet
  Left = 41
  Top = 104
  Caption = 'frmwtRPJobRemedialSheet'
  ClientHeight = 720
  ClientWidth = 1282
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Scaled = False
  OnCreate = FormCreate
  TextHeight = 13
  object qrpJobSheet: TQuickRep
    Left = 232
    Top = -22
    Width = 794
    Height = 1123
    ShowingPreview = False
    BeforePrint = qrpJobSheetBeforePrint
    DataSet = qryReport
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
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
    ReportTitle = 'Job Fitting Sheet'
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
      Top = 38
      Width = 718
      Height = 1035
      AfterPrint = qrgQuoteAfterPrint
      AlignToBottom = False
      BeforePrint = qrgQuoteBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        2738.437500000000000000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'quote'
      Master = qrpJobSheet
      ReprintOnNewPage = False
      object gtQRShape4: TQRShape
        Left = 3
        Top = 121
        Width = 713
        Height = 32
        Size.Values = (
          84.666666666666680000
          7.937500000000000000
          320.145833333333400000
          1886.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object memAddress: TQRRichText
        Left = 200
        Top = 37
        Width = 513
        Height = 16
        Enabled = False
        Size.Values = (
          42.333333333333340000
          529.166666666666800000
          97.895833333333340000
          1357.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AutoStretch = False
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        HiresExport = False
        Transparent = False
        YIncrement = 50
        Lines.Strings = (
          'memAddress')
      end
      object qrlblSOCaption: TQRLabel
        Left = 416
        Top = 3
        Width = 302
        Height = 43
        Size.Values = (
          113.770833333333300000
          1100.666666666667000000
          7.937500000000000000
          799.041666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'REMEDIAL SHEET'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -35
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 26
      end
      object gtQRShape1: TQRShape
        Left = 417
        Top = 57
        Width = 299
        Height = 56
        Size.Values = (
          148.166666666666700000
          1103.312500000000000000
          150.812500000000000000
          791.104166666666800000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRDBText2: TQRDBText
        Left = 613
        Top = 90
        Width = 79
        Height = 17
        Size.Values = (
          44.979166666666670000
          1621.895833333333000000
          238.125000000000000000
          209.020833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Sales_Order'
        Font.Charset = ANSI_CHARSET
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
      object gtQRLabel2: TQRLabel
        Left = 428
        Top = 90
        Width = 62
        Height = 17
        Size.Values = (
          44.979166666666670000
          1132.416666666667000000
          238.125000000000000000
          164.041666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Order No:'
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
      object gtQRShape2: TQRShape
        Left = 542
        Top = 56
        Width = 9
        Height = 56
        Size.Values = (
          148.166666666666700000
          1434.041666666667000000
          148.166666666666700000
          23.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRShape3: TQRShape
        Left = 417
        Top = 83
        Width = 299
        Height = 5
        Size.Values = (
          13.229166666666670000
          1103.312500000000000000
          219.604166666666700000
          791.104166666666800000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape5: TQRShape
        Left = 3
        Top = 632
        Width = 713
        Height = 177
        Size.Values = (
          468.312500000000100000
          7.937500000000000000
          1672.166666666667000000
          1886.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel24: TQRLabel
        Left = 8
        Top = 612
        Width = 185
        Height = 19
        Size.Values = (
          50.270833333333330000
          21.166666666666670000
          1619.250000000000000000
          489.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Remedial Action to be taken:'
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
      object gtQRShape6: TQRShape
        Left = 3
        Top = 432
        Width = 713
        Height = 177
        Size.Values = (
          468.312500000000100000
          7.937500000000000000
          1143.000000000000000000
          1886.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel4: TQRLabel
        Left = 8
        Top = 411
        Width = 166
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          1087.437500000000000000
          439.208333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Details of Remedial Work:'
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
      object gtQRShape15: TQRShape
        Left = 3
        Top = 152
        Width = 713
        Height = 32
        Size.Values = (
          84.666666666666680000
          7.937500000000000000
          402.166666666666600000
          1886.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape16: TQRShape
        Left = 3
        Top = 182
        Width = 713
        Height = 32
        Size.Values = (
          84.666666666666680000
          7.937500000000000000
          481.541666666666700000
          1886.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape17: TQRShape
        Left = 3
        Top = 212
        Width = 713
        Height = 32
        Size.Values = (
          84.666666666666680000
          7.937500000000000000
          560.916666666666800000
          1886.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel13: TQRLabel
        Left = 8
        Top = 160
        Width = 106
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          423.333333333333300000
          280.458333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer Name:'
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
      object QRDBText8: TQRDBText
        Left = 200
        Top = 160
        Width = 98
        Height = 17
        Size.Values = (
          44.979166666666670000
          529.166666666666700000
          423.333333333333300000
          259.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Customer_Name'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
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
      object gtQRShape18: TQRShape
        Left = 177
        Top = 120
        Width = 7
        Height = 122
        Size.Values = (
          322.791666666666700000
          468.312500000000100000
          317.500000000000000000
          18.520833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRShape20: TQRShape
        Left = 3
        Top = 256
        Width = 713
        Height = 137
        Size.Values = (
          362.479166666666700000
          7.937500000000000000
          677.333333333333400000
          1886.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrrchTextInstallAddress: TQRRichText
        Left = 144
        Top = 264
        Width = 241
        Height = 97
        Size.Values = (
          256.645833333333400000
          381.000000000000000000
          698.500000000000000000
          637.645833333333400000)
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
        Lines.Strings = (
          'InstallAddress')
      end
      object QRLabel4: TQRLabel
        Left = 8
        Top = 264
        Width = 84
        Height = 19
        Size.Values = (
          50.270833333333330000
          21.166666666666670000
          698.500000000000000000
          222.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Site Address:'
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
        Left = 428
        Top = 64
        Width = 49
        Height = 17
        Size.Values = (
          44.979166666666670000
          1132.416666666667000000
          169.333333333333300000
          129.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Job No.'
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
      object gtQRShape22: TQRShape
        Left = 3
        Top = 368
        Width = 713
        Height = 25
        Size.Values = (
          66.145833333333340000
          7.937500000000000000
          973.666666666666900000
          1886.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape21: TQRShape
        Left = 129
        Top = 257
        Width = 7
        Height = 136
        Size.Values = (
          359.833333333333400000
          341.312500000000000000
          679.979166666666800000
          18.520833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRLabel14: TQRLabel
        Left = 9
        Top = 372
        Width = 123
        Height = 17
        Size.Values = (
          44.979166666666670000
          23.812500000000000000
          984.250000000000000000
          325.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Site Contact Name:'
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
      object QRDBText3: TQRDBText
        Left = 144
        Top = 371
        Width = 241
        Height = 19
        Size.Values = (
          50.270833333333330000
          381.000000000000000000
          981.604166666666800000
          637.645833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Install_Name'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
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
      object QRLabel15: TQRLabel
        Left = 8
        Top = 188
        Width = 53
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          497.416666666666700000
          140.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Contact:'
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
      object gtQRLabel15: TQRLabel
        Left = 393
        Top = 372
        Width = 107
        Height = 17
        Size.Values = (
          44.979166666666670000
          1039.812500000000000000
          984.250000000000000000
          283.104166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Contact Number:'
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
      object QRDBText6: TQRDBText
        Left = 512
        Top = 372
        Width = 201
        Height = 19
        Size.Values = (
          50.270833333333330000
          1354.666666666667000000
          984.249999999999900000
          531.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Install_Phone'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
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
      object qrlblContact: TQRLabel
        Left = 200
        Top = 188
        Width = 201
        Height = 17
        Size.Values = (
          44.979166666666670000
          529.166666666666800000
          497.416666666666700000
          531.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlblContact'
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
      object QRLabel5: TQRLabel
        Left = 8
        Top = 218
        Width = 111
        Height = 19
        Size.Values = (
          50.270833333333330000
          21.166666666666670000
          576.791666666666700000
          293.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Client Reference:'
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
      object QRDBText4: TQRDBText
        Left = 200
        Top = 218
        Width = 59
        Height = 19
        Size.Values = (
          50.270833333333330000
          529.166666666666700000
          576.791666666666700000
          156.104166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Reference'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
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
      object gtQRShape24: TQRShape
        Left = 385
        Top = 369
        Width = 7
        Height = 24
        Size.Values = (
          63.500000000000000000
          1018.645833333333000000
          976.312500000000000000
          18.520833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRShape25: TQRShape
        Left = 497
        Top = 369
        Width = 7
        Height = 24
        Size.Values = (
          63.500000000000000000
          1314.979166666667000000
          976.312500000000000000
          18.520833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRDBText2: TQRDBText
        Left = 668
        Top = 64
        Width = 24
        Height = 17
        Size.Values = (
          44.979166666666670000
          1767.416666666667000000
          169.333333333333300000
          63.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Job'
        Font.Charset = ANSI_CHARSET
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
      object gtQRShape26: TQRShape
        Left = 542
        Top = 121
        Width = 9
        Height = 32
        Size.Values = (
          84.666666666666680000
          1434.041666666667000000
          320.145833333333400000
          23.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRLabel1: TQRLabel
        Left = 428
        Top = 129
        Width = 97
        Height = 17
        Size.Values = (
          44.979166666666670000
          1132.416666666667000000
          341.312500000000000000
          256.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date Arranged:'
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
      object qriHeadLogo: TQRImage
        Left = 4
        Top = 0
        Width = 391
        Height = 95
        Size.Values = (
          251.354166666666700000
          10.583333333333330000
          0.000000000000000000
          1034.520833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Stretch = True
      end
      object gtQRLabel3: TQRLabel
        Left = 8
        Top = 854
        Width = 101
        Height = 19
        Size.Values = (
          50.270833333333330000
          21.166666666666670000
          2259.541666666667000000
          267.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Revisit Required?'
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
      object gtQRLabel5: TQRLabel
        Left = 8
        Top = 820
        Width = 262
        Height = 19
        Size.Values = (
          50.270833333333330000
          21.166666666666670000
          2169.583333333333000000
          693.208333333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Remedial completed to customer satisfaction'
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
      object gtQRLabel6: TQRLabel
        Left = 8
        Top = 900
        Width = 41
        Height = 19
        Size.Values = (
          50.270833333333330000
          21.166666666666670000
          2381.250000000000000000
          108.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Signed'
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
      object gtQRLabel7: TQRLabel
        Left = 8
        Top = 964
        Width = 41
        Height = 19
        Size.Values = (
          50.270833333333330000
          21.166666666666670000
          2550.583333333333000000
          108.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Signed'
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
      object gtQRLabel8: TQRLabel
        Left = 400
        Top = 900
        Width = 28
        Height = 19
        Size.Values = (
          50.270833333333330000
          1058.333333333333000000
          2381.250000000000000000
          74.083333333333340000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date'
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
      object gtQRLabel9: TQRLabel
        Left = 400
        Top = 964
        Width = 28
        Height = 19
        Size.Values = (
          50.270833333333330000
          1058.333333333333000000
          2550.583333333333000000
          74.083333333333340000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date'
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
      object gtQRLabel10: TQRLabel
        Left = 400
        Top = 854
        Width = 84
        Height = 19
        Size.Values = (
          50.270833333333330000
          1058.333333333333000000
          2259.541666666667000000
          222.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date Arranged'
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
      object gtQRShape32: TQRShape
        Left = 104
        Top = 910
        Width = 265
        Height = 8
        Size.Values = (
          21.166666666666670000
          275.166666666666700000
          2407.708333333333000000
          701.145833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape7: TQRShape
        Left = 104
        Top = 974
        Width = 265
        Height = 8
        Size.Values = (
          21.166666666666670000
          275.166666666666700000
          2577.041666666667000000
          701.145833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape8: TQRShape
        Left = 512
        Top = 910
        Width = 187
        Height = 8
        Size.Values = (
          21.166666666666670000
          1354.666666666667000000
          2407.708333333333000000
          494.770833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape9: TQRShape
        Left = 512
        Top = 974
        Width = 187
        Height = 8
        Size.Values = (
          21.166666666666670000
          1354.666666666667000000
          2577.041666666667000000
          494.770833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape10: TQRShape
        Left = 512
        Top = 867
        Width = 187
        Height = 8
        Size.Values = (
          21.166666666666670000
          1354.666666666667000000
          2293.937500000000000000
          494.770833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape27: TQRShape
        Left = 184
        Top = 856
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          486.833333333333400000
          2264.833333333333000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape11: TQRShape
        Left = 256
        Top = 856
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          677.333333333333400000
          2264.833333333333000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel11: TQRLabel
        Left = 152
        Top = 854
        Width = 24
        Height = 19
        Size.Values = (
          50.270833333333330000
          402.166666666666600000
          2259.541666666667000000
          63.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Yes'
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
      object gtQRLabel12: TQRLabel
        Left = 224
        Top = 854
        Width = 17
        Height = 19
        Size.Values = (
          50.270833333333330000
          592.666666666666800000
          2259.541666666667000000
          44.979166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'No'
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
      object gtQRLabel16: TQRLabel
        Left = 8
        Top = 924
        Width = 125
        Height = 19
        Size.Values = (
          50.270833333333330000
          21.166666666666670000
          2444.750000000000000000
          330.729166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'on behalf of customer'
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
      object gtQRLabel17: TQRLabel
        Left = 8
        Top = 988
        Width = 71
        Height = 19
        Size.Values = (
          50.270833333333330000
          21.166666666666670000
          2614.083333333333000000
          187.854166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'on behalf of '
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
      object qrlblCompany: TQRLabel
        Left = 80
        Top = 988
        Width = 56
        Height = 19
        Size.Values = (
          50.270833333333330000
          211.666666666666700000
          2614.083333333333000000
          148.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Company'
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
      object gtQRShape12: TQRShape
        Left = 414
        Top = 121
        Width = 9
        Height = 32
        Size.Values = (
          84.666666666666680000
          1095.375000000000000000
          320.145833333333400000
          23.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRLabel18: TQRLabel
        Left = 8
        Top = 129
        Width = 72
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          341.312500000000000000
          190.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Logged by:'
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
      object gtQRShape13: TQRShape
        Left = 328
        Top = 824
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          867.833333333333500000
          2180.166666666667000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape14: TQRShape
        Left = 392
        Top = 824
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          1037.166666666667000000
          2180.166666666667000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel19: TQRLabel
        Left = 296
        Top = 822
        Width = 24
        Height = 19
        Size.Values = (
          50.270833333333330000
          783.166666666666800000
          2174.875000000000000000
          63.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Yes'
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
      object gtQRLabel20: TQRLabel
        Left = 360
        Top = 822
        Width = 17
        Height = 19
        Size.Values = (
          50.270833333333330000
          952.500000000000000000
          2174.875000000000000000
          44.979166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'No'
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
    object gtQRSysData1: TQRSysData
      Left = 647
      Top = 1088
      Width = 108
      Height = 16
      Size.Values = (
        42.333333333333340000
        1711.854166666667000000
        2878.666666666667000000
        285.750000000000000000)
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
      Font.Name = 'Lucida Sans'
      Font.Style = []
      ParentFont = False
      Text = 'Printed: '
      Transparent = False
      ExportAs = exptText
      VerticalAlignment = tlTop
      FontSize = 8
    end
  end
  object qryReport: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select  Job.*,'
      '        Operator.Operator_Name,'
      '        (select Sales_order'
      '         from Sales_Order_Line'
      '         where sales_order_line.Job = Job.Job) as Sales_Order,'
      '         (select Sales_order.Order_Ref_No'
      '         from Sales_Order_Line, sales_Order'
      '         where sales_order_line.Job = Job.Job and'
      
        '               Sales_Order_line.sales_Order = Sales_order.sales_' +
        'order) as Order_Ref_No'
      'from Job, Operator'
      'where Job = :Job and'
      'Job.Operator = Operator.Operator')
    Left = 1035
    Top = 54
    ParamData = <
      item
        Name = 'Job'
        DataType = ftInteger
      end>
  end
  object dtsReport: TDataSource
    DataSet = qryReport
    Left = 1152
    Top = 136
  end
  object qryAddress: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select *'
      'from Address'
      'where Address = :Address')
    Left = 1046
    Top = 331
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
      'Vat_Rate'
      'from Customer, VAT'
      'where Customer = :Customer and'
      'Customer.VAT = Vat.Vat')
    Left = 1046
    Top = 390
    ParamData = <
      item
        Name = 'Customer'
      end>
  end
  object dtsAddress: TDataSource
    Left = 1110
    Top = 331
  end
  object qryCompany: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * from company'
      'where company = 1')
    Left = 1149
    Top = 522
  end
  object qrygetNotes: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from Notes'
      'where notes_code = :Notes_Code')
    Left = 1182
    Top = 213
    ParamData = <
      item
        Name = 'Notes_Code'
      end>
  end
  object qryUpJStatus: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'update Job'
      
        'set Job_status = :Job_Status, Production_Date_Actual = :Producti' +
        'on_Date_Actual'
      'where Job = :Job')
    Left = 1152
    Top = 56
    ParamData = <
      item
        Name = 'Job_Status'
      end
      item
        Name = 'Production_Date_Actual'
      end
      item
        Name = 'Job'
      end>
  end
  object qryCompanyAddress: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Company_Name,'
      'Street,'
      'Locale,'
      'Town_City,'
      'County_State,'
      'Postcode,'
      'Telephone_number,'
      'Fax_Number '
      'from Company')
    Left = 1048
    Top = 521
  end
  object qryJRemedials: TFDQuery
    MasterSource = dtsReport
    ConnectionName = 'Wt'
    SQL.Strings = (
      'select Job_Remedial.*, Fitter.Fitter_Name'
      'from Job_Remedial, Fitter'
      'where Job= :Job and'
      'Job_Remedial.Fitter = Fitter.Fitter'
      'ORDER BY Job, Remedial_Number')
    Left = 1043
    Top = 450
    ParamData = <
      item
        Name = 'Job'
      end>
  end
  object qryJobEdge: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Job_Edge.Job,'
      '        Job_Edge.Edge_number,'
      '        Job_Edge.Edge_profile,'
      '        Edge_profile.Description'
      'FROM Edge_profile'
      '      INNER JOIN Job_Edge'
      '      ON Edge_profile.Edge_profile = Job_Edge.Edge_profile'
      'WHERE Job = :Job'
      'ORDER BY Job, Edge_Number')
    Left = 1043
    Top = 118
    ParamData = <
      item
        Name = 'Job'
      end>
  end
  object qryJobThickness: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Job_Element.Job,'
      '        Job_Element.Element_Number,'
      '        Job_Element.Thickness,'
      '        Thickness.Thickness_mm'
      'FROM Job_Element'
      '      INNER JOIN Thickness'
      '        ON Job_Element.Thickness = Thickness.Thickness'
      'WHERE Job = :Job'
      'ORDER BY Job, Element_Number')
    Left = 1043
    Top = 182
    ParamData = <
      item
        Name = 'Job'
      end>
  end
  object qryJobUpstand: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT DISTINCT Material_Use.Use_Description'
      'FROM Material_Use'
      '  RIGHT JOIN (Job_Element'
      '  INNER JOIN Thickness'
      '    ON Job_Element.Thickness = Thickness.Thickness)'
      '    ON Material_Use.Material_Use = Job_Element.Material_Use'
      'WHERE Element_number > 1000 AND Job = :Job'
      'GROUP BY Material_Use.Use_Description'
      '')
    Left = 1043
    Top = 254
    ParamData = <
      item
        Name = 'Job'
      end>
  end
end
