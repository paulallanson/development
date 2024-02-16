object frmwtRPJobSheetClient: TfrmwtRPJobSheetClient
  Left = 41
  Top = 104
  Caption = 'Job Sheet'
  ClientHeight = 539
  ClientWidth = 916
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  
  OnCreate = FormCreate
  TextHeight = 13
  object qrpDetails: TQuickRep
    Left = 8
    Top = 8
    Width = 816
    Height = 1056
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
    Page.PaperSize = Letter
    Page.Continuous = False
    Page.Values = (
      50.000000000000000000
      2794.000000000000000000
      50.000000000000000000
      2159.000000000000000000
      50.000000000000000000
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
    ReportTitle = 'Job Sheet'
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
      Left = 19
      Top = 1033
      Width = 759
      Height = 2
      AlignToBottom = False
      BeforePrint = qrgQuoteBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        5.291666666666667000
        2008.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'quote'
      Master = qrpDetails
      ReprintOnNewPage = False
    end
    object qrbPageHeader: TQRBand
      Left = 19
      Top = 19
      Width = 759
      Height = 1014
      AlignToBottom = False
      TransparentBand = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Gill Sans MT'
      Font.Style = [fsBold]
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        2682.875000000000000000
        2008.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object QRShape26: TQRShape
        Left = 568
        Top = 673
        Width = 185
        Height = 30
        Size.Values = (
          79.375000000000000000
          1502.833333333333000000
          1780.645833333333000000
          489.479166666666600000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 3
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape27: TQRShape
        Left = 597
        Top = 673
        Width = 131
        Height = 30
        Size.Values = (
          79.375000000000000000
          1579.562500000000000000
          1780.645833333333000000
          346.604166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 3
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape28: TQRShape
        Left = 629
        Top = 673
        Width = 68
        Height = 30
        Size.Values = (
          79.375000000000000000
          1664.229166666667000000
          1780.645833333333000000
          179.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 3
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape29: TQRShape
        Left = 656
        Top = 673
        Width = 10
        Height = 30
        Size.Values = (
          79.375000000000000000
          1735.666666666667000000
          1780.645833333333000000
          26.458333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 3
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRLabel1: TQRLabel
        Left = 574
        Top = 0
        Width = 163
        Height = 57
        Size.Values = (
          150.812500000000000000
          1518.708333333333000000
          0.000000000000000000
          431.270833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'PRODUCTION DOCKET'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Gill Sans MT'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 14
      end
      object QRDBText5: TQRDBText
        Left = 120
        Top = 76
        Width = 393
        Height = 22
        Size.Values = (
          58.208333333333340000
          317.500000000000000000
          201.083333333333300000
          1039.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Description'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
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
      object QRLabel2: TQRLabel
        Left = 568
        Top = 223
        Width = 109
        Height = 22
        Size.Values = (
          58.208333333333330000
          1502.833333333333000000
          590.020833333333300000
          288.395833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'PRODUCTION DATE:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Gill Sans MT Condensed'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRDBText2: TQRDBText
        Left = 632
        Top = 67
        Width = 24
        Height = 22
        Size.Values = (
          58.208333333333330000
          1672.166666666667000000
          177.270833333333300000
          63.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Job'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Gill Sans MT'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 11
      end
      object QRLabel3: TQRLabel
        Left = 569
        Top = 67
        Width = 45
        Height = 21
        Size.Values = (
          55.562500000000000000
          1505.479166666667000000
          177.270833333333300000
          119.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'JOB No.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Gill Sans MT Condensed'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRDBText4: TQRDBText
        Left = 120
        Top = 104
        Width = 54
        Height = 22
        Size.Values = (
          58.208333333333330000
          317.500000000000000000
          275.166666666666700000
          142.875000000000000000)
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
        Font.Name = 'Gill Sans MT'
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
      object QRLabel5: TQRLabel
        Left = 1
        Top = 104
        Width = 72
        Height = 22
        Size.Values = (
          58.208333333333330000
          2.645833333333333000
          275.166666666666700000
          190.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'CLIENT REF:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRShape1: TQRShape
        Left = 0
        Top = 244
        Width = 513
        Height = 17
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          645.583333333333400000
          1357.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 6
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel4: TQRLabel
        Left = 0
        Top = 128
        Width = 88
        Height = 22
        Size.Values = (
          58.208333333333330000
          0.000000000000000000
          338.666666666666700000
          232.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'SITE ADDRESS:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRShape2: TQRShape
        Left = 0
        Top = 344
        Width = 513
        Height = 17
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          910.166666666666600000
          1357.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 6
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel9: TQRLabel
        Left = 568
        Top = 654
        Width = 146
        Height = 19
        Size.Values = (
          50.270833333333330000
          1502.833333333333000000
          1730.375000000000000000
          386.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'DATE COMPLETED JOB PASSED:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT Condensed'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrrchTextInstallAddress: TQRRichText
        Left = 120
        Top = 128
        Width = 193
        Height = 113
        Size.Values = (
          298.979166666666700000
          317.500000000000000000
          338.666666666666700000
          510.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AutoStretch = False
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        HiresExport = False
        Transparent = False
        YIncrement = 50
      end
      object QRLabel12: TQRLabel
        Left = 568
        Top = 103
        Width = 42
        Height = 22
        Size.Values = (
          58.208333333333330000
          1502.833333333333000000
          272.520833333333300000
          111.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'CLIENT:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Gill Sans MT Condensed'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRDBText8: TQRDBText
        Left = 568
        Top = 127
        Width = 145
        Height = 22
        Size.Values = (
          58.208333333333340000
          1502.833333333333000000
          336.020833333333400000
          383.645833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Customer_Name'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Gill Sans MT'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 11
      end
      object QRLabel15: TQRLabel
        Left = 568
        Top = 162
        Width = 95
        Height = 22
        Size.Values = (
          58.208333333333330000
          1502.833333333333000000
          428.625000000000000000
          251.354166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'CLIENT CONTACT:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Gill Sans MT Condensed'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRLabel16: TQRLabel
        Left = 0
        Top = 260
        Width = 114
        Height = 19
        Size.Values = (
          50.270833333333330000
          0.000000000000000000
          687.916666666666700000
          301.625000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'TEMPLATE FAULTS:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel19: TQRLabel
        Left = 320
        Top = 316
        Width = 19
        Height = 19
        Size.Values = (
          50.270833333333330000
          846.666666666666700000
          836.083333333333300000
          50.270833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'BY:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel20: TQRLabel
        Left = 320
        Top = 260
        Width = 137
        Height = 21
        Size.Values = (
          55.562500000000000000
          846.666666666666600000
          687.916666666666800000
          362.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'TEMPLATES CHECKED'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel21: TQRLabel
        Left = 320
        Top = 284
        Width = 19
        Height = 19
        Size.Values = (
          50.270833333333330000
          846.666666666666700000
          751.416666666666700000
          50.270833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'BY:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRShape3: TQRShape
        Left = 320
        Top = 332
        Width = 193
        Height = 11
        Size.Values = (
          29.104166666666670000
          846.666666666666600000
          878.416666666666800000
          510.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape5: TQRShape
        Left = 320
        Top = 300
        Width = 193
        Height = 11
        Size.Values = (
          29.104166666666670000
          846.666666666666600000
          793.750000000000000000
          510.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel22: TQRLabel
        Left = 1
        Top = 76
        Width = 86
        Height = 22
        Size.Values = (
          58.208333333333330000
          2.645833333333333000
          201.083333333333300000
          227.541666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'DESCRIPTION:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblContact: TQRLabel
        Left = 568
        Top = 186
        Width = 91
        Height = 22
        Size.Values = (
          58.208333333333330000
          1502.833333333333000000
          492.125000000000000000
          240.770833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblContact'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Gill Sans MT'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 11
      end
      object QRLabel7: TQRLabel
        Left = 0
        Top = 360
        Width = 112
        Height = 19
        Size.Values = (
          50.270833333333330000
          0.000000000000000000
          952.500000000000000000
          296.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'MATERIAL FAULTS:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel8: TQRLabel
        Left = 320
        Top = 360
        Width = 137
        Height = 19
        Size.Values = (
          50.270833333333330000
          846.666666666666600000
          952.500000000000000000
          362.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'MATERIALS CHECKED'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRShape7: TQRShape
        Left = 320
        Top = 400
        Width = 193
        Height = 11
        Size.Values = (
          29.104166666666670000
          846.666666666666600000
          1058.333333333333000000
          510.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel13: TQRLabel
        Left = 320
        Top = 384
        Width = 19
        Height = 19
        Size.Values = (
          50.270833333333330000
          846.666666666666700000
          1016.000000000000000000
          50.270833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'BY:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRShape8: TQRShape
        Left = 0
        Top = 464
        Width = 513
        Height = 17
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          1227.666666666667000000
          1357.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 6
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape4: TQRShape
        Left = 480
        Top = 357
        Width = 33
        Height = 25
        Size.Values = (
          66.145833333333340000
          1270.000000000000000000
          944.562500000000000000
          87.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel11: TQRLabel
        Left = 0
        Top = 480
        Width = 129
        Height = 19
        Size.Values = (
          50.270833333333330000
          0.000000000000000000
          1270.000000000000000000
          341.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'CUTTING PROBLEMS:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel17: TQRLabel
        Left = 320
        Top = 480
        Width = 129
        Height = 19
        Size.Values = (
          50.270833333333330000
          846.666666666666600000
          1270.000000000000000000
          341.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'CUTTING CHECKED'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel18: TQRLabel
        Left = 320
        Top = 536
        Width = 19
        Height = 19
        Size.Values = (
          50.270833333333330000
          846.666666666666600000
          1418.166666666667000000
          50.270833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'BY:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRShape6: TQRShape
        Left = 320
        Top = 552
        Width = 193
        Height = 11
        Size.Values = (
          29.104166666666670000
          846.666666666666600000
          1460.500000000000000000
          510.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape9: TQRShape
        Left = 0
        Top = 608
        Width = 513
        Height = 17
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          1608.666666666667000000
          1357.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 6
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel23: TQRLabel
        Left = 320
        Top = 504
        Width = 19
        Height = 19
        Size.Values = (
          50.270833333333330000
          846.666666666666700000
          1333.500000000000000000
          50.270833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'BY:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRShape10: TQRShape
        Left = 320
        Top = 520
        Width = 193
        Height = 11
        Size.Values = (
          29.104166666666670000
          846.666666666666600000
          1375.833333333333000000
          510.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel24: TQRLabel
        Left = 0
        Top = 624
        Width = 116
        Height = 19
        Size.Values = (
          50.270833333333330000
          0.000000000000000000
          1651.000000000000000000
          306.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'MASON PROBLEMS:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel25: TQRLabel
        Left = 320
        Top = 624
        Width = 157
        Height = 19
        Size.Values = (
          50.270833333333330000
          846.666666666666600000
          1651.000000000000000000
          415.395833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'MASON WORK CHECKED'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRShape12: TQRShape
        Left = 0
        Top = 744
        Width = 513
        Height = 17
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          1968.500000000000000000
          1357.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 6
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel26: TQRLabel
        Left = 0
        Top = 760
        Width = 233
        Height = 19
        Size.Values = (
          50.270833333333330000
          0.000000000000000000
          2010.833333333333000000
          616.479166666666800000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'IS THE JOB COMPLETE?'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel27: TQRLabel
        Left = 320
        Top = 760
        Width = 185
        Height = 19
        Size.Values = (
          50.270833333333330000
          846.666666666666600000
          2010.833333333333000000
          489.479166666666600000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'YES / NO / NOT APPLICABLE'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel28: TQRLabel
        Left = 0
        Top = 792
        Width = 268
        Height = 19
        Size.Values = (
          50.270833333333330000
          0.000000000000000000
          2095.500000000000000000
          709.083333333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'IF NO, WHAT IS REQUIRED TO MAKE IT SO ?'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRShape13: TQRShape
        Left = 0
        Top = 888
        Width = 513
        Height = 17
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          2349.500000000000000000
          1357.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 6
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape14: TQRShape
        Left = 568
        Top = -1
        Width = 185
        Height = 9
        Size.Values = (
          23.812500000000000000
          1502.833333333333000000
          -2.645833333333333000
          489.479166666666600000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 4
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape15: TQRShape
        Left = 568
        Top = 56
        Width = 185
        Height = 10
        Size.Values = (
          26.458333333333330000
          1502.833333333333000000
          148.166666666666700000
          489.479166666666600000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 4
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape16: TQRShape
        Left = 568
        Top = 83
        Width = 185
        Height = 8
        Size.Values = (
          21.166666666666670000
          1502.833333333333000000
          219.604166666666700000
          489.479166666666600000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 4
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape17: TQRShape
        Left = 568
        Top = 151
        Width = 185
        Height = 9
        Size.Values = (
          23.812500000000000000
          1502.833333333333000000
          399.520833333333400000
          489.479166666666600000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 4
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape18: TQRShape
        Left = 568
        Top = 210
        Width = 185
        Height = 9
        Size.Values = (
          23.812500000000000000
          1502.833333333333000000
          555.625000000000000000
          489.479166666666600000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 4
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRSysData1: TQRSysData
        Left = 568
        Top = 247
        Width = 40
        Height = 22
        Size.Values = (
          58.208333333333330000
          1502.833333333333000000
          653.520833333333300000
          105.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsDate
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Text = ''
        Transparent = False
        ExportAs = exptText
        VerticalAlignment = tlTop
        FontSize = 11
      end
      object QRLabel31: TQRLabel
        Left = 568
        Top = 827
        Width = 96
        Height = 22
        Size.Values = (
          58.208333333333340000
          1502.833333333333000000
          2188.104166666667000000
          254.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'INSTALLATION DATE:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT Condensed'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel32: TQRLabel
        Left = 568
        Top = 714
        Width = 49
        Height = 22
        Size.Values = (
          58.208333333333340000
          1502.833333333333000000
          1889.125000000000000000
          129.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'BY WHOM:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT Condensed'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRShape22: TQRShape
        Left = 568
        Top = 751
        Width = 185
        Height = 9
        Size.Values = (
          23.812500000000000000
          1502.833333333333000000
          1987.020833333333000000
          489.479166666666600000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 4
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel33: TQRLabel
        Left = 568
        Top = 958
        Width = 129
        Height = 19
        Size.Values = (
          50.270833333333330000
          1502.833333333333000000
          2534.708333333333000000
          341.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'PASSED FOR INVOICING BY:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT Condensed'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRShape23: TQRShape
        Left = 568
        Top = 999
        Width = 185
        Height = 9
        Size.Values = (
          23.812500000000000000
          1502.833333333333000000
          2643.187500000000000000
          489.479166666666600000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 4
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel34: TQRLabel
        Left = 568
        Top = 895
        Width = 185
        Height = 21
        Size.Values = (
          55.562500000000000000
          1502.833333333333000000
          2368.020833333333000000
          489.479166666666600000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'NETT SUPPLY VALUE:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Gill Sans MT Condensed'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRShape24: TQRShape
        Left = 568
        Top = 914
        Width = 185
        Height = 33
        Size.Values = (
          87.312500000000000000
          1502.833333333333000000
          2418.291666666667000000
          489.479166666666600000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 3
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape25: TQRShape
        Left = 568
        Top = 271
        Width = 185
        Height = 9
        Size.Values = (
          23.812500000000000000
          1502.833333333333000000
          717.020833333333400000
          489.479166666666600000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 4
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape30: TQRShape
        Left = 568
        Top = 846
        Width = 185
        Height = 33
        Size.Values = (
          87.312500000000000000
          1502.833333333333000000
          2238.375000000000000000
          489.479166666666600000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 3
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape31: TQRShape
        Left = 597
        Top = 846
        Width = 131
        Height = 33
        Size.Values = (
          87.312500000000000000
          1579.562500000000000000
          2238.375000000000000000
          346.604166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 3
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape32: TQRShape
        Left = 629
        Top = 846
        Width = 68
        Height = 33
        Size.Values = (
          87.312500000000000000
          1664.229166666667000000
          2238.375000000000000000
          179.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 3
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape33: TQRShape
        Left = 656
        Top = 846
        Width = 10
        Height = 33
        Size.Values = (
          87.312500000000000000
          1735.666666666667000000
          2238.375000000000000000
          26.458333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 3
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object memAddress: TQRRichText
        Left = 48
        Top = 912
        Width = 321
        Height = 73
        Size.Values = (
          193.145833333333300000
          127.000000000000000000
          2413.000000000000000000
          849.312499999999900000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AutoStretch = False
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Gill Sans MT'
        Font.Style = [fsBold]
        HiresExport = False
        Transparent = False
        YIncrement = 50
      end
      object QRShape34: TQRShape
        Left = 0
        Top = 92
        Width = 513
        Height = 8
        Size.Values = (
          21.166666666666670000
          0.000000000000000000
          243.416666666666700000
          1357.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape35: TQRShape
        Left = 0
        Top = 121
        Width = 513
        Height = 8
        Size.Values = (
          21.166666666666670000
          0.000000000000000000
          320.145833333333400000
          1357.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrlblGrossPrice: TQRLabel
        Left = 600
        Top = 919
        Width = 111
        Height = 22
        Enabled = False
        Size.Values = (
          58.208333333333340000
          1587.500000000000000000
          2431.520833333333000000
          293.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblGrossPrice'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 11
      end
      object QRLabel14: TQRLabel
        Left = 568
        Top = 284
        Width = 145
        Height = 21
        Size.Values = (
          55.562500000000000000
          1502.833333333333000000
          751.416666666666700000
          383.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'TEMPLATES PROVIDED BY:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Gill Sans MT Condensed'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRShape36: TQRShape
        Left = 568
        Top = 324
        Width = 185
        Height = 9
        Size.Values = (
          23.812500000000000000
          1502.833333333333000000
          857.250000000000000000
          489.479166666666600000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 4
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel35: TQRLabel
        Left = 568
        Top = 338
        Width = 161
        Height = 21
        Size.Values = (
          55.562500000000000000
          1502.833333333333000000
          894.291666666666700000
          425.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'JOB DETAILS PROCESSED BY:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Gill Sans MT Condensed'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRShape37: TQRShape
        Left = 568
        Top = 378
        Width = 185
        Height = 9
        Size.Values = (
          23.812500000000000000
          1502.833333333333000000
          1000.125000000000000000
          489.479166666666600000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 4
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel6: TQRLabel
        Left = 568
        Top = 389
        Width = 71
        Height = 21
        Size.Values = (
          55.562500000000000000
          1502.833333333333000000
          1029.229166666667000000
          187.854166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'HANDED TO:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Gill Sans MT Condensed'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRShape19: TQRShape
        Left = 568
        Top = 429
        Width = 185
        Height = 9
        Size.Values = (
          23.812500000000000000
          1502.833333333333000000
          1135.062500000000000000
          489.479166666666600000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 4
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel36: TQRLabel
        Left = 568
        Top = 766
        Width = 84
        Height = 19
        Size.Values = (
          50.270833333333330000
          1502.833333333333000000
          2026.708333333333000000
          222.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'INSTALLATION BY:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT Condensed'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRShape38: TQRShape
        Left = 568
        Top = 807
        Width = 185
        Height = 9
        Size.Values = (
          23.812500000000000000
          1502.833333333333000000
          2135.187500000000000000
          489.479166666666600000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 4
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel10: TQRLabel
        Left = 568
        Top = 440
        Width = 44
        Height = 21
        Size.Values = (
          55.562500000000000000
          1502.833333333333000000
          1164.166666666667000000
          116.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'CUT BY:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Gill Sans MT Condensed'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRShape20: TQRShape
        Left = 568
        Top = 480
        Width = 185
        Height = 9
        Size.Values = (
          23.812500000000000000
          1502.833333333333000000
          1270.000000000000000000
          489.479166666666600000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 4
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel29: TQRLabel
        Left = 568
        Top = 492
        Width = 76
        Height = 21
        Size.Values = (
          55.562500000000000000
          1502.833333333333000000
          1301.750000000000000000
          201.083333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'MASONED BY:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Gill Sans MT Condensed'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRShape21: TQRShape
        Left = 568
        Top = 532
        Width = 185
        Height = 9
        Size.Values = (
          23.812500000000000000
          1502.833333333333000000
          1407.583333333333000000
          489.479166666666600000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 4
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel30: TQRLabel
        Left = 544
        Top = 521
        Width = 18
        Height = 21
        Size.Values = (
          55.562500000000000000
          1439.333333333333000000
          1378.479166666667000000
          47.625000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '1st'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Gill Sans MT Condensed'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRLabel37: TQRLabel
        Left = 540
        Top = 553
        Width = 22
        Height = 21
        Size.Values = (
          55.562500000000000000
          1428.750000000000000000
          1463.145833333333000000
          58.208333333333340000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '2nd'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Gill Sans MT Condensed'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRShape39: TQRShape
        Left = 568
        Top = 564
        Width = 185
        Height = 9
        Size.Values = (
          23.812500000000000000
          1502.833333333333000000
          1492.250000000000000000
          489.479166666666600000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 4
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape40: TQRShape
        Left = 568
        Top = 596
        Width = 185
        Height = 9
        Size.Values = (
          23.812500000000000000
          1502.833333333333000000
          1576.916666666667000000
          489.479166666666600000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 4
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel38: TQRLabel
        Left = 542
        Top = 585
        Width = 20
        Height = 21
        Size.Values = (
          55.562500000000000000
          1434.041666666667000000
          1547.812500000000000000
          52.916666666666660000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '3rd'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Gill Sans MT Condensed'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRLabel39: TQRLabel
        Left = 542
        Top = 617
        Width = 20
        Height = 21
        Size.Values = (
          55.562500000000000000
          1434.041666666667000000
          1632.479166666667000000
          52.916666666666660000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '4th'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Gill Sans MT Condensed'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRShape41: TQRShape
        Left = 568
        Top = 620
        Width = 185
        Height = 9
        Size.Values = (
          23.812500000000000000
          1502.833333333333000000
          1640.416666666667000000
          489.479166666666600000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 4
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape42: TQRShape
        Left = 480
        Top = 256
        Width = 33
        Height = 25
        Size.Values = (
          66.145833333333340000
          1270.000000000000000000
          677.333333333333400000
          87.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel40: TQRLabel
        Left = 320
        Top = 416
        Width = 19
        Height = 19
        Size.Values = (
          50.270833333333330000
          846.666666666666700000
          1100.666666666667000000
          50.270833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'BY:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRShape43: TQRShape
        Left = 320
        Top = 432
        Width = 193
        Height = 11
        Size.Values = (
          29.104166666666670000
          846.666666666666600000
          1143.000000000000000000
          510.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape44: TQRShape
        Left = 480
        Top = 477
        Width = 33
        Height = 25
        Size.Values = (
          66.145833333333340000
          1270.000000000000000000
          1262.062500000000000000
          87.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape45: TQRShape
        Left = 480
        Top = 621
        Width = 33
        Height = 25
        Size.Values = (
          66.145833333333340000
          1270.000000000000000000
          1643.062500000000000000
          87.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel41: TQRLabel
        Left = 320
        Top = 568
        Width = 19
        Height = 19
        Size.Values = (
          50.270833333333330000
          846.666666666666600000
          1502.833333333333000000
          50.270833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'BY:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRShape46: TQRShape
        Left = 320
        Top = 584
        Width = 193
        Height = 11
        Size.Values = (
          29.104166666666670000
          846.666666666666600000
          1545.166666666667000000
          510.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel42: TQRLabel
        Left = 320
        Top = 648
        Width = 19
        Height = 19
        Size.Values = (
          50.270833333333330000
          846.666666666666600000
          1714.500000000000000000
          50.270833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'BY:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRShape11: TQRShape
        Left = 320
        Top = 664
        Width = 193
        Height = 11
        Size.Values = (
          29.104166666666670000
          846.666666666666600000
          1756.833333333333000000
          510.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel43: TQRLabel
        Left = 320
        Top = 680
        Width = 19
        Height = 19
        Size.Values = (
          50.270833333333330000
          846.666666666666600000
          1799.166666666667000000
          50.270833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'BY:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRShape47: TQRShape
        Left = 320
        Top = 696
        Width = 193
        Height = 11
        Size.Values = (
          29.104166666666670000
          846.666666666666600000
          1841.500000000000000000
          510.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel44: TQRLabel
        Left = 320
        Top = 712
        Width = 19
        Height = 19
        Size.Values = (
          50.270833333333330000
          846.666666666666600000
          1883.833333333333000000
          50.270833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'BY:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRShape48: TQRShape
        Left = 320
        Top = 728
        Width = 193
        Height = 11
        Size.Values = (
          29.104166666666670000
          846.666666666666600000
          1926.166666666667000000
          510.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel45: TQRLabel
        Left = 368
        Top = 839
        Width = 153
        Height = 21
        Size.Values = (
          55.562500000000000000
          973.666666666666900000
          2219.854166666667000000
          404.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'NETT COST OF PROBLEMS:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Gill Sans MT Condensed'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRShape49: TQRShape
        Left = 368
        Top = 858
        Width = 145
        Height = 33
        Size.Values = (
          87.312500000000000000
          973.666666666666900000
          2270.125000000000000000
          383.645833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 3
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel75: TQRLabel
        Left = 320
        Top = 128
        Width = 105
        Height = 19
        Size.Values = (
          50.270833333333330000
          846.666666666666700000
          338.666666666666700000
          277.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'CONTACT NAME'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRDBText3: TQRDBText
        Left = 320
        Top = 148
        Width = 185
        Height = 19
        Size.Values = (
          50.270833333333330000
          846.666666666666600000
          391.583333333333400000
          489.479166666666600000)
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
        Font.Name = 'Gill Sans MT'
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
      object QRLabel76: TQRLabel
        Left = 320
        Top = 184
        Width = 100
        Height = 19
        Size.Values = (
          50.270833333333330000
          846.666666666666700000
          486.833333333333300000
          264.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'PHONE NUMBER'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRDBText6: TQRDBText
        Left = 320
        Top = 204
        Width = 185
        Height = 19
        Size.Values = (
          50.270833333333330000
          846.666666666666600000
          539.750000000000000000
          489.479166666666600000)
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
        Font.Name = 'Gill Sans MT'
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
    end
    object qriHeadLogo: TQRImage
      Left = 136
      Top = 19
      Width = 313
      Height = 73
      Size.Values = (
        193.145833333333300000
        359.833333333333400000
        50.270833333333330000
        828.145833333333200000)
      XLColumn = 0
      XLNumFormat = nfGeneral
      ActiveInPreview = False
      Picture.Data = {
        07544269746D6170D2620100424DD26201000000000036000000280000006301
        00005500000001001800000000009C620100903D0000903D0000000000000000
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFBDB3B1AD9E9CFBF8F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD8D1D0A59997F4F0F0FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7C1BD1B0E0C5A4742FEFDFCFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        BCBAB6150A0677686AFFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F7F63D322D1107
        06C7BDB8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFBFBFA473E38150A09CAC3C4FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFB2AAA3120908382B25FCFBF9FFFFFFFFFFFFFCFBFAD4CBC7CEC6C0FB
        F9F8FFFFFFE2DEDCD3C9C6D8D0CDFFFEFEFFFFFFD2CBC9CFC6C3EFE9E5FFFFFF
        FFFFFFC7C0BED2CAC7D8D0D0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7CFCBC4BB
        B6D1C7C6FFFFFFFFFFFFE5DFDEC6BBB8CDC4C2FAF8F8FFFFFFFFFFFFFEFEFECC
        C2BEC9BFBBDAD0CFFFFFFFFFFFFFFFFFFFD3CDCAC2B9B4C9C1BDC0B7B4C9C1BE
        CBC1BEDFD6D3FBF8F6FFFFFEFFFFFFFFFFFFFFFFFFFAF9F8CFC7C4C2B7B3CCC4
        C0C6BEBCCBC1BDC8BEBBCCC2C0DAD2D0FFFFFFFFFFFFE6E1DFC9C1BDCBC1BECD
        C3BFC6BBBAD0C6C3CFC7C3CAC0BDD0C9C4FBFAF9FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEAE79B908F958884C1B5B1F0EB
        E8FEFDFCCEC4C1D0C6C2DED4D3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFBD3CAC3938480A29693E2DAD5FEFDFC
        EFECEBE2DDD8F9F7F6FFFFFFFFFFFFFFFFFFE0DAD7DDD3CFEDE5E1FFFFFFFFFF
        FFFFFFFFF8F6F5DDD5D2CEC6C4EEE8E3FFFFFFF9F8F7CCC1BECFC4C0F1ECEAFF
        FFFFFFFFFFFFFFFFFFFFFFFCFCFBD7CFCBCEC6C3E8E3E3FFFFFFFFFFFFE4DEDE
        DAD2D0E8E3E1FFFFFFFFFFFFFFFFFFFFFEFEE1D8D3DDD4D0EEE7E5FFFFFFFFFF
        FFFFFFFFF0EDECDBD3CFE3DCD7FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEB
        E6E3DAD3CFEAE3DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1EEEDE2DAD8DBD3CF
        DDD6D1D2C9C3DDD4D0DDD5D1DCD2CFE4DFDDFDFCFCFFFFFFFFFFFFA8A19C1008
        045A5053FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFF0ECEAE7E0DDEAE5E4E8E2E0E6DFDDE4DDD9E8E3DFE9E3DFFBF9F7
        FFFFFFFFFFFFF2EEECEEEAE7F7F4F3FFFFFFFFFFFFFFFFFFF6F4F3EEE8E5F2EC
        EBFFFFFFFEFEFDEFECE8EDE8E4FAF8F7FFFFFFF8F5F4F0ECE7F4EFEEFFFFFFFF
        FFFFFFFFFFFBFAFAE9E4E0EDE6E3FEFDFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        F8F6F6F2EEEBEEE9E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3EEECF3F0
        EEE7E0DDF1EEEBEFEBE7EDE8E7F1EDEBF4EFECF5F0EEFFFFFFFFFFFFFFFEFEF1
        EDE9EFEBE6F2EEEAECE7E3ECE8E5FBF8F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF594D46160C0A70645FFFFFFFFFFFFFFF
        FFFFE0DAD70C03010A0301D5CDC9FDFDFE312E330B0402120706E6DBDAFEFEFD
        27211C0C0504887C74FFFFFFFFFFFF6A65630D0602181012F0EEEFFFFFFFFFFF
        FFFFFFFFFAF9F9383029100804524E52FFFFFFFFFFFF8478760D05010C0200E1
        DADBFFFFFFFFFFFFF2EDEA160B080C0503655656FFFFFFFFFFFFFFFEFE312721
        0C05010D06040C05040C0402110704130A09342524A79C9CFFFFFFFFFFFFFFFF
        FFC5C3C20E05030F07050D04030D05040D05030E06050F0504443633FFFFFFFF
        FFFF78736B0C04010F07050F05040E05020D04031106050F05050E0402E0DCDD
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB8ADA92016
        15120A090F07021007062A1C1A645651110708120607998E8BFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCD6D252443E160C0A
        1008030E0605190E0C6F5F595D5757140909B7AAACFFFFFFFFFFFFFDFDFD2E23
        23140B0A6C5955FFFFFFFFFFFFFFFFFFA29A991409070F0707BCADA4FFFFFFF0
        F1EF1E16141309096F615CFFFFFFFFFFFFFFFFFFFFFFFFD6D5CC110706120706
        9F9A9EFFFFFFFFFFFF50444812080944383AFFFFFFFFFFFFFFFFFFCEC5BF1308
        060F0708534241FFFFFFFFFFFFFFFFFF938782100607160C0AF2F0EDFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF40302F170B095E4843FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF8B827F120806160A091307071107070F0506110605100505120708E6E4
        E5FFFFFFFFFFFFEEEBE7180E0B130907C7C1C3FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF655E5E160A0B1D110E180C0D180D0C
        170A0A1B0C0D180D0CAFA197FFFFFFFBFBF82E26211B0E0F786C6CFFFFFFFFFF
        FFFFFFFF716C6D1B0F0E4A3F44FFFFFFC6BBB41A0F0F190E0A8E8682FFFFFF85
        817E1D1011392B2FFEFDFEFFFFFFFFFFFFA6A1A51E100D1D1110D0C4C6FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF736A6B261715362523FDFCFBFFFFFFFFFFFFFFFF
        FFFFFFFFFEFDFE413B3B2317161D0F0C2115131D11111E110F22131421121230
        1E20FBF5F8FFFFFFEDE7E22413111C0F0E2113121E100F1F100F3423226F6362
        DCD6D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDE9E41A0F0D0F
        0805A49B94FFFFFFFFFFFFFFFFFFE3DEDC1006060C0604D2C9C3E8E8ED110C0D
        1006060C0400A0928FFDFBFA2B242010080785796FFFFFFFFFFFFFCFCFC9140A
        0810080399908EE7E1DEE7E0DDE4DCD8A69C96110806150C089B999DFFFFFFFF
        FFFFA69F9F0E06020D0504E5E0E1FFFFFFFFFFFFE5DED71008050F0805A09490
        FFFFFFFFFFFFFFFFFF3E342D1007021F1714372F2F2F2727372D2D140C0B120B
        09140B0AD2CBCCFFFFFFFFFFFFD7D7D4120A07100804241A18362E2D3B323140
        36363C3234605452FEFDFDFFFFFF7E7872100804120A06322B2B322B292D2422
        342929342829322A2BE1DDDDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFE9E5E11E120E130A07241A166D62612F28290F0805100A0512090763
        595AFCFCFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        E2E0DC231A17120A09160F0D261C1E2820211A11110F0805130B09110907ADA2
        A3FFFFFFFFFFFFFFFFFE332B2911090766544DFFFFFFFFFFFFFFFFFF837C7911
        0807110805ECE3DAFFFFFFFEFEFE6763601109071E1210E0D9D1EFEAE6E0D8D5
        EEE9E567615B100707110B09DCDADEFFFFFFFFFFFF524A49171111392D30FFFE
        FFFFFFFFFBF9F8473A32100908100A084A3B3AFFFFFFFFFFFFFFFFFF92868114
        0C08160C09E3DCD7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3A2B291A0F0C5A4742
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8882110A08120A071F151724191B231A
        1C24191B1E1413231B1AE9E7E8FFFFFFFFFFFFFEFEFE433B34150B07787071FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF686364
        120906130A071A10111D1214201414221416211816B0A39CFFFFFFF8F8F7231C
        17130908695E5BFFFFFFFFFFFFFFFFFF6B69691008063C3439FFFFFF91847A0F
        0605100805433733FFFEFE8B86810F0705271E1DFDFCFCFFFFFFFFFFFFA29D9E
        1107040F0705C2B6B9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF646363140A072416
        14F8F5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF38363710080411090512080A16
        0B0C180E0E19100F180C0B281A1CF9F5F7FFFFFFE6DFD9120904100807140909
        1E1212180B0D120906150C071B0F0FBEBABCFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFC1BAB41006050F0605C2BAB1FFFFFFFFFFFFFFFFFFDBD8D6100807
        0E0806BEB2ADAAA9AF0B04000D06040C05005E504DFFFFFE2F28220F08057B6F
        67FFFFFFFFFFFFF4F4F2251D181109071209091309081307070D050411070610
        0805130D0DEDEDEEFFFFFFFFFFFF9B92920F06020C0403E4DDDFFFFFFFFFFFFF
        E7DFDA0D05020E0603A99C98FFFFFFFFFFFFFEFDFC352B2610080378716EFFFF
        FDFDFCFAFEFEFCC0BFB8110B080E0600877E7EFFFFFFFFFFFFD8D8D70E06040D
        0402938C92FEFEFCFFFFFEFFFFFEFFFFFEFFFFFFFFFFFFFFFFFF75716C0F0702
        181413F7F5F6FEFDFCFCFAF8FDFAF8FDFCFBFEFEFCFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA59E9B0F07050F0702DBD2C9FFFFFFCC
        CCC40B06031008050E0706DAD2D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFEFE524943120907110906A19A9CF8F7F5FAF8F6D6D2
        D3302A2A110B080E0602B8ADB0FFFFFFFFFFFFFCFCFB26201C10080566564FFF
        FFFFFFFFFFFFFFFF7F7874120A09170D08F4EFE8FFFFFFFFFFFFADACA80F0605
        100806160C0A180C0D160B09180D0A1008051009084C454AFFFFFFFFFFFFFFFF
        FF4B4243170F1041383CFFFFFFFFFFFF9D938B0F07051008071009094E3F3CFF
        FFFFFFFFFFFFFFFF7F756F1108041C110EF4F2EEFFFFFFFFFFFFFFFFFFFFFFFF
        FEFCFB2F211F19100D5A4641FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8681791008
        06130A06E8E0DCF8F7F5F7F6F4F8F7F5F3F0EEF8F6F6FFFEFEFFFFFFFFFFFFFF
        FFFF5A544D110908483D3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF686364100807251A1AEFEAE9F2EEEDF3F0EEF2F0EFF1EF
        EDFCFBFAFFFFFFFCFCFA272018160D09726868FFFFFFFFFFFFFFFFFF63616110
        08053E3639FFFFFE44372E0F07050F080618100CF3EEEC837F7C0F07052A2121
        FEFEFEFFFFFFFFFFFFA6A2A60E06050C0606CEC3C5FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF5D5757140B08261817FAF7F7FFFFFFFFFFFFFFFFFFFFFFFFFCFCFD2A
        25261007023C2F2CE3DFDDE6E3E1E9E6E4E6E3E2E4E1E0EEEBEAFFFEFEFFFFFF
        E7E0D91307040F08058D8680EFEBEAE7E2DF98928C1D1310170B093F3334FBFB
        FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDB8AF0E07050E0604C8C1BAFFFFFF
        FFFFFFFFFFFFE2DFDB0D06050A0503C9C2BB6C6B71080000433A350804051D15
        12F6F2F1342D290F070280776EFFFFFFFFFFFFFFFFFF88827A0F08050F07010D
        06050E0607100806100807110A07524B4DFFFFFFFFFFFFFFFFFF988D8D0E0501
        0A0300E0D8D8FDFDFBF6F5F2B8ABA40C05030C0604ADA3A0FFFFFFFFFFFFFFFF
        FF3F3831100807766E6CFFFFFFFFFFFFFFFFFFFBF9F6221D160F06006C6666FF
        FFFFFFFFFFD7D7D40F0804100804908B92FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF7B7671100702110F0EF5F4F5FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBBB3B00D
        06030E0603E0D5CBF7F8F745413F0E06010E0806150B086B605EFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E1DF120A081109066C61
        62FFFFFFFFFFFFF8F6F4EBE6E2A9A7A50D06040F0705ABA0A3FFFFFFFFFFFFFF
        FFFF312A291008065E4C45FFFFFFFFFFFFFFFFFE645D56100805180D08F5F0E9
        FFFFFFFFFFFFF3F1EF241B170F08040E06040A03010E05040F07040D06020E06
        059B9AA0FFFFFFFFFFFFFFFFFF423B3C1109083B3134FFFFFFF5F3EF3127200C
        0502110A070F0908453836FFFFFFFFFFFFFFFFFF887E77100401130C09F0EDEA
        FFFFFFFFFFFFFFFFFFFFFFFFFFFEFC3A2D2A170F0C58433EFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF857C770F0806130A08F0EAE8FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF736C65110907251C1DFBFAFCFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6A65651008082A1E1EFEFC
        FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFDFB27211B120A086E6664FF
        FFFFFFFFFFFFFFFF737271100805373034F4EFEA17100A100A082119160B0603
        BDB1AE888581130B0A281E1FFDFCFCFFFFFFFFFFFFB1B0B20F06040E0606C4B8
        BAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6B6667170D081F1512F7F4F4FFFFFFFF
        FFFFFFFFFFFFFFFFFEFEFE2F2E2C1108044E413FFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFE4DDD4110704100805988E8AFFFFFFFFFFFFFFFF
        FF9E9288130807130906C6BFBEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFACA69F
        0E07060E0602DBD3CEFFFFFFFFFFFFFFFFFFDEDAD80A05030A0503CEC5BF3330
        360B0301BCA99E1C1F1F080302C6BBB82A23200A0400847A71FFFFFFFFFFFFFF
        FFFFD0CAC41008030C0602989290E3DFDDB0AEA80D05030F0702A1999DFFFFFF
        FFFFFFFFFFFF958F910B03000901003B302C3C312E302320150D0A0F07071610
        0FE8E2DFFFFFFFFFFFFFFFFFFE40352F0E0603594D4BCDC5C0C4BAB5CAC3BE80
        78731009070E06019C9698FFFFFFFFFFFFDADAD90F0707100805948C95FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7E7B760F0601100A0ACAC0BFD6CD
        CAD7CECCD7CFCDD7CECBF6F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFEFEAE9241B1B0F060547352D6F68640903000C0506756C68
        0E0603170E0DF2EEEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFBEBBB90D07050F0705B1A8AAFFFFFFFFFFFF847A75190F0F180F0E110A0710
        0808998D8DFFFFFFFFFFFFFFFEFD26201F0F0705211512554842524742564944
        140C090F0807514438FFFEFDFFFFFFFFFFFFFFFFFF605B580D0602211613CDC6
        C2D0CECB5D5D5C0F0705120B0DE7E5E9FFFFFFFFFFFFFFFFFF463F3E150C0B3B
        3034FFFFFF8A7D740C06052E2B292D24200F08054D3F3FFFFFFFFFFFFFFFFFFF
        827671120A05140A06EFECE8FFFFFFFFFFFFFFFFFFFFFFFFFDFCFC312322140D
        0C58443FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF89847D0F0804100703CCBEBAE1
        DBD6E5DEDBE6DEDAE9E4E2FAF9F9FFFFFFFFFFFFFFFFFFFFFFFF6D665E130909
        281D1FFCFAFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF5C5658130B082A1D1CFDFAFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA
        FAF7231E181008056D6462FFFFFFFFFFFFFFFFFF646060100805383133C5B9AF
        0A0403352E2F5C534F0E0605746662847F7B100807271E1DFCF9FAFFFFFFFFFF
        FF9C9A9B100706120B08C2B5B9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6D6B6B15
        0D08211514F7F5F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF333133100801433636
        F6F3F0F3F0EDF6F1EFF6F2F0F8F4F1FFFEFEFFFFFFFFFFFFE2DAD41007050E06
        0698908CFFFFFFFFFFFFFFFFFFE0D9CF0F0704140A078C8480FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFEFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFC4BDB61108050E0605C9BFB9FFFFFFFFFFFFFFFFFFDDD8
        D6090502080301B3AAA30D08091B0C07F7EDE6505654070000857A762B25230B
        0502877F76FFFFFFFFFFFFFFFFFFFDFBFA40372F0E06046A6464FFFFFF898684
        110A081C1314EAE4E5FFFFFFFFFFFFFFFFFF9891920901000C04010B03020701
        000A03020F07050D05036D6359FEFCFBFFFFFFFFFFFFFFFFFF3C332D0B050007
        00000401000801000A05030903000E0604585252F8F6F7FFFFFFFFFFFFD6D5D4
        0E07041009059B939AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7E7A
        740C04010E06010C03020D04030E05050D05050C0405B8AEB0FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6D3D2251F200E0604
        0A0301070100998E8CF9F7F5342A28302727CEC5C3FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF9F9996130C090E0806D4CDCFFFFFFFFFFFFF77
        6E681108080D06040D07030D06069D9494FFFFFFFFFFFFFEFDFC29221E0E0701
        0C04010D07010E07010C0502100807130B0AC4B7A9FFFFFFFFFFFFFFFFFFFFFF
        FFB7B4B10A04000C0504CCC0B9FFFFFE4140401008055B5256FFFFFFFFFFFFFF
        FFFFFFFFFF473F410F0908383035E2DBD61C110C0C0703B4B2B5453A330D0802
        483B38FFFFFFFFFFFFFFFFFF928982100805150C09EFEBE9FFFFFFFFFFFFFFFF
        FFFFFFFFFEFCFC3628261109085A4944FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8C
        837C0F07040E06010F06070E0706110909150B0A150B0AB5B3B8FFFFFFFFFFFF
        FFFFFFFFFFFF595048140B09433938FEFDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFEFEFE4A3E3E170E092C1C1BFDFAFAFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFBFBF9231E1810080469605DFFFFFFFFFFFFFFFFFF
        646160100804352C2D988E820C0602726F71BDB5B209050134252285807C1008
        06271D1EFDFCFCFFFFFFFFFFFFADADB00F06060E0706C4B9BBFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF6B6B6B130A07201414F7F5F3FFFFFFFFFFFFFFFFFFFFFFFF
        FCFDFD2524221009051108071F14121F13111F1412231714241413E7DCDBFFFF
        FFFFFFFFE3DBD41409070E070499918CFFFFFFFFFFFFFFFFFFDCD3CC12090718
        0F0C85807BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2DED9140B070F0706A095
        8EFFFFFFFFFFFFFFFFFFDDD9D508030109030070635C0A0301523C35FFFFFE9E
        A5A1090200493B3A2D28220B0601867B74FFFFFFFFFFFFFFFFFFFFFFFF90877E
        0F0707231918F7F5F5413B381109085B5356FFFFFFFFFFFFFFFFFFFFFFFF9C94
        940C050209040180767697919197908E726A680E07040D06059C8E8AFFFFFFFF
        FFFFFFFFFF3D342F080100120D091D1918221C1C1C17180903010A03015E5352
        FBFAFBFFFFFFFFFFFFDCDCDA0E0605100806A0999EFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF82807A0F05020E07031B1212251D1E1D151823191C1E
        1718BEB4B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFB1ACAF0802010B05020C0601453937EBE7E5F7F6F4FBFAF9FEFE
        FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA9A3A21209080F
        0706CCC4C6FFFFFFFFFFFFE2DEDEC1BBBCC0BAB7B9B5B3C9C5C4F4F1F2FFFFFF
        FFFFFFFDFCFB2C24210C07012B211C757071766F6F736C6B3029280A03012519
        12ECE4DDFFFFFFFFFFFFFFFFFFF4F3F128211F0D080276685EE8EAEA0F0B0B0F
        07019F9397FFFFFFFFFFFFFFFFFFFFFFFF413A3C0B04002F2526594F460F0706
        524950FEFDFD392E280F08044C3E3DFFFFFFFFFFFFFFFFFF8B837B100703140B
        09EEEAE8FFFFFFFFFFFFFFFFFFFFFFFFFEFCFB362A26120908584741FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF867C770E06030E0501150E0D160E0E18100F19110F
        140E0FAEACB0FFFFFFFFFFFFFFFFFFFFFEFE443932180E09746C70FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF635C5E120A0725
        1818FCF8FAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFA26211B100807
        6B6261FFFFFFFFFFFFFFFFFF6261610D05033D343551443A0C0603B7B5B8ECE8
        E7110A0711080670625D0E0500261E1FFDFDFDFFFFFFFFFFFFB4B2B60D07050C
        0605C2B8BAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5E5D5C1008051B100EF3F0F0
        FFFFFFFFFFFFFFFFFFFFFFFFFDFDFE3C3A391008051008040D05061107071209
        07110606150907E4D9D6FFFFFFFFFFFFE9E3DD130A07100807938B86FFFFFFFF
        FFFFFFFFFFF9F6F1231711170B08817978FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFEFE605654120B06675C53FFFFFFFFFFFFFFFFFFE6E3E10C070308020032
        2E290D07018D796FFFFFFFE3E6E3090605120A092018150D050380766EFFFFFF
        FFFFFFFFFFFFFFFFFFE4DFD61309060E0705A69995110A080E0706B9B3B4FFFF
        FFFFFFFFFFFFFFFFFFFF99908F0D0703090402DFDADAFFFFFFFFFFFFFFFEFE38
        2F290F0703564544FFFFFFFFFFFFFFFEFE3B302D0A03016D6664F8F6F6F9F8F6
        F5F5F383817C0E07050E0504D5D0D3FFFFFFFFFFFFE7E8E60F0807120A088E87
        8EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8A8881100703130D0DE9
        E5E5FAF8F7F6F6F5F8F7F7F7F7F5FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE4841400E07012C1E1C2926230F07
        06675D5EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFD0CECC0E0707130B088D8083FFFFFFFFFFFFFFFFFFFFFFFFF7F7F6
        B9B1AEBCB3ADEAE5E5FFFFFFFFFFFFFEFEFE3129270E0601574941FFFFFFFFFF
        FFFFFFFFD3CFCD0C06050E0607AB9D92FFFFFFFFFFFFFFFFFFFFFFFF736D6B0F
        070333231C92918F0E07041D1212F0EAECFFFFFFFFFFFFFFFFFFFFFEFF4E4544
        0D06000F08060F0805160F11DBD7DAFFFFFE473B361007054A3B36FFFFFFFFFF
        FFFFFFFF9288820F0702120906ECE8E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF41
        353310080556463EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF89817B0802000D0504
        E0D8D4EFEEECF0EDEDEDECEBEFECEBF7F6F6FFFFFFFFFFFFFFFFFFF5F2F01B12
        0E130A07BEBABDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF6F696A120906251819FCF7FAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFEFEFC26231D1008026B5D5CFFFFFFFFFFFFFFFFFF7472710800001E15
        15190F0A100807E5E3E6FFFFFF453C3A0C06033E332E0C0402211A1AFCFBFCFF
        FFFFFFFFFFBEBDBE0D06020D0606C4B9BAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        6B6B6B1008051A0F0CF3F0EFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFF3837371008
        06352B28D9D6D5D1CCCBE1DEDCD9D6D6DFDDDCFCFBFAFFFFFFFFFFFFEAE4DE13
        0A08100806938983FFFFFFFFFFFFFFFFFFDFD5CC130905130A05A29C9AFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCAC4C1110806281D17F8F6F4FFFFFFFF
        FFFFE2DFDB0E06040B0400100804080200CABCADFFFFFFFDFEFE3737320D0702
        0F0706100807837870FFFFFFFFFFFFFFFFFFFFFFFFFFFDFB3C312A1008052319
        160F0905201515F5F2F2FFFFFFFFFFFFFFFFFFFFFFFF9B91920C0601090401D5
        CECCFAF8F6F6F3EFE1D9D3211914100803534342FFFFFFFFFFFFFFFFFF433A35
        0E07036F6764FBF9F7FDFBFAFCFAF7908D860F08080E0603C1BCBEFFFFFFFFFF
        FFDDDDDA170E0B160D0A978E97FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF87847E100802181212F5F3F3FFFDFCFFFFFCFEFCFAFDFCFAFEFDFCFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F1F0170F
        0C0E0601B9A69CB0B2AE0D0605291E1DFDFCFDFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFC413A3613090724181AE0DBDA
        FFFFFFFFFFFFFFFEFE7C75780E0805100606D0C9CCFFFFFFFFFFFFFFFEFE2F28
        251008025A4A43FFFFFFFFFFFFFFFEFDB4ABA70F07030D0607AA9A91FFFFFFFF
        FFFFFFFFFFFFFFFFC9C2C20F0601100703261D1B120A085F4F50FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF4D43440D07000F07060F0705747074FFFFFFFFFFFF5144
        3E0F0706453635FFFFFFFFFFFFFFFFFF938782110904140B08EEECE7FFFFFFFF
        FFFFFFFFFFFFFEFDFBF7F3392D29100805523D36FFFEFEFFFFFEFFFEFEFFFFFF
        FFFFFF8D857E0F0702100905EFE8E5FFFEFEFFFEFDFFFFFEFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFCAC6C0140806342A2DFAF9FAFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF75706F19100C291B1BFDF9FBFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFE2F2C24120906655754FFFFFFFFFF
        FFFFFFFF797877100802170E0C100905383133FDFCFDFFFFFF7D747410080511
        0906120C0C251C1DFCFBFBFFFFFFFFFFFFB6B6B90D06040C0604C4B8B9FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF737070130B0A1F1412F9F5F3FEFCFCFFFFFFFFFF
        FFFFFFFFFFFFFF4B4B4C110906413731FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFEEE7E4180D0A1108078F8782FFFFFFFFFFFFF9F6F268564E
        160B08180F0CDDDADBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFB47
        3D3A150D0AADA099FFFFFFFFFFFFD7D2CF0B04010F07031108061F130BF8F4EE
        FFFFFFFFFFFF6A6A68110A0710090411090580756CFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF978A820F0705130908110908746564FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF9C92910F08050F0704221815261B1C221615110A080F08070E0603908584
        FFFFFFFFFFFFFFFFFF4339340D0603180F0E291D1C2E24202F24221109091109
        08180E10E6E4E6FFFFFFFFFFFFDDDEDB120A071409079D9399FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF7E7872110906120A08372B28372D2A3A2E2A
        352825362927655657FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFF9F8F829211E0E06049581768C88830E06052E2426FEFCFDFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        AAA8A5120905130A06281D1D8376749C908B594C48120A09110907514244FDFC
        FCFFFFFFFFFFFFFCFCFB281F1C0D05021E110E473B38453735413330160B0A10
        0806110806DBD2C8FFFFFFFFFFFFFFFFFFFFFFFFFBFBFA302724110905170D0B
        0F0806B8ABA9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF483E3D0F0604110905251A
        1EF1EFF1FFFFFFFFFFFF493A341008054A3A39FFFFFFFFFFFFFFFFFF8A7D7610
        0806160C0AF1EDEAFFFFFFE5E4E04E4440483B37392B2A180E091008011C110C
        493B384D413C504240EFEDEFFFFFFF8E867F0F07040E05024133314338364339
        37473C3B50433F736B6CFFFFFFFFFFFFFFFEFE625A55160D0AACA5A9FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6B6362
        180F0A261818FCF7F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFB2E27
        21130A075C4E4AFFFDFDFFFFFFFFFFFF706F6F100807110907100807756F72FF
        FFFFFFFFFFB6AFAD0D0502100807140C0A231A1BFCFAFBFFFFFFFFFFFFA8A4A6
        0F06040D0605C3B7B9FFFFFFF5F2F16A5E5A5D504D62554F342B29150D0A160B
        0A5A4C47574644695D56D7CFCAFFFFFFFDFDFE3735361008061D121061524F58
        4A466C605B6D5F586D605BA69898FFFFFFFFFFFFE7DED8180D07180D08392B28
        675B57615453352722170D0A160D0A554D50FEFEFEFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFE1DFDD261C1C3A2927F5F0EFFFFFFFD8D3D00B0300
        0E05010E06025B4C3FFFFFFFFFFFFFFFFFFFADA8A80B04031008060F06057A70
        67FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8E3DE1A0E0A110806120705CFC2C2FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF9386870C04030D06050D07060E06050F0606
        0D0505140B0C675F5DF5F3F1FFFFFFFFFFFFFFFFFF3A2E2B0C03020D04040B02
        010A04030E07050B05041E1517AAA6A8FFFFFFFFFFFFFFFFFFE6E6E50D07040E
        07049B9298FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF807C750C0604
        0B05040C06060C05040C0604110906150A09392C2DFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9691941007061208050F
        06060C060392888AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFDFDFC807874150C0C17100A19110E1109081209
        060D0604433533E4DEDEFFFFFFFFFFFFFFFFFFFEFDFD312B270D07060E08060D
        07060E06060D06050C0604120A07968C85FFFFFEFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF6963630D0605100706281816F9F5F4FFFFFFFFFFFFFFFFFFFFFFFFFFFE
        FE4B40410E06020E0705A1979CFFFFFFFFFFFFFFFFFF483C37120907473735FF
        FFFFFFFFFFFFFFFF938981130806150A07EFEBE8FFFFFFD9D9D3120805160E08
        1108060E06011007020E06040F0705140D0B0F0708E6E3E5FFFEFF8378740D06
        030E0605110A09100805110706100706150B08322B2DFFFFFFFFFFFFDEDDD91A
        100D4C4041FBFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF615859180E0A251719FBF6F8FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFDFDFC2B241E110604685C5AFFFFFFFFFFFFFFFFFF72706E14
        0A08130B09100705B3B1B6FFFFFFFFFFFFE9E5E4140C0D120806130B08221718
        FAF8FAFFFFFFFFFFFFA9A7AA0F07040B0502C1B5B8FFFFFFF6F4F3261E191810
        0B140A06180D09160C08170E08180E09170C08150A07B6AAA4FFFFFFFDFDFE30
        2C2F110807120A07120805150A08160D09180F0A180F0B534241FFFFFFFFFFFF
        E1D7D1180A07180F091A120E1A110E170E0A140A08150A07484041E6E4E5FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEDCDCC0BBBB
        F7F3F2FFFFFFF8F8F7C2BBBDC2BCBDC2BCBFE3DEDCFFFFFFFFFFFFFFFFFFF9F8
        F7CECAC9C6C2C2CBC7C6E4E0DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFED4
        CFCECFCACCCEC8C9FCFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F0F0C7C3C1
        CCC9C9CDC9C8D2CFD0C3BEBCD0CAC9E3DFDFFFFFFEFFFFFFFFFFFFFFFFFFFFFF
        FFDAD3D5CAC6C9CCC8C8CAC5C6C4BFBEC3BEBDCCC7C5F0EEEDFFFFFFFFFFFFFF
        FFFFFFFFFFFBFAFBC9C6C6C8C2C2E8E4E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFE5E2E1BDB6B8BAB5B3C1BDBCC0BCBBC0BCBDBFBABAC1BDBCCCC7
        C8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFEFDFEADA9AC6F6969645D5FAEA4A5FBFAFAFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDCD7
        D48982815E54525C5352797272BBB2AFFAF8F7FFFFFFFFFFFFFFFFFFFFFFFFFE
        FEFEB8B2B3B7B0B0ACA7A8ACA8A7AAA3A5B6B1B1B2AAACD8D3D3FCFBFAFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECEBEBB2AAA9BAB5B6D8D1D1FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFC5C1C3B4AEB0ADA6A6F8F5F7FFFFFFFFFFFFFF
        FFFFCCC6C6B2ACADC8C0C2FFFFFFFFFFFFFFFFFFE2DFDEAEA7A7B3ADADFBFAFA
        FFFFFFF4F3F2B4AEAFA29A9BAFABABB6B0B1B2AAACB0A9ABB1ABABAEAAAAB9B3
        B3F8F7F8FFFEFFE1DDDCA39B9BA9A1A2A59E9FA9A1A1A8A29FABA5A6AEA7A7BE
        BBBCFFFFFFFFFFFFDDDADDADA6A8EBE8E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD1CED1A09B9BA79EA0FDFB
        FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFACAB948D8CC5BFC1FF
        FFFFFFFFFFFFFFFFC5C2C4989292928B8B8E888AF5F4F6FFFFFFFFFFFFFEFEFE
        B1ACAD98919096908EA49C9DFEFDFEFFFFFFFFFFFFEBEBEE928D8D8B8584E5E0
        E1FFFFFFFEFCFB9B95948C8686868283827C7B817A79878180918A8A837B7B89
        8282DCD6D3FFFFFFFEFEFF979596756C6C8982818A8585807879837A7B908887
        8C8788B6ADADFFFFFFFFFFFFF8F5F2938A888A82828B8283928B8C8C86869992
        93BEBABAFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFF4EEFFE3D5FFE9E3FF
        E4DCFFDBCFFEE8E2FFE9E5FFE0D9FDDFD5FFD8CCFED9CCFDE9E3FEE1DCFEE2DA
        FFE3DCFEE3D8FEDFD3FFE5DFFEE2D9FFDBD1FDD9D2FEE0DAFED0C4FCD0C6FEDB
        D4FFC5B8FECDBEFDE0DAFFDFD8FFD3C7FDC1B6FCD4CFFED6CDFDD8CEFFC3B5FC
        DBD0FECBC1FCC8BBFBCABAFBD2C8FCD0C6FCC9BBFCCFBFFDC6B9FDCCC3FECFC4
        FBBDB3FAC6B7FCB9ACFDC1B3F9C0B1FBC1B7FCC8BCFAC1B4FACABEFCC3B9FCC9
        BFFBC1B7FDC4BAFDB5AAFAC7BAFDAD9DFABCAEFCCBC5FDBAAAFAC6BCFCC8BAFD
        C3B7FBCBC2FBC4B6FBCDC0FCC6BAFDC7BBFBC2B7FBD5CBFCCEC8FBC7B8F9CBC0
        FCD2C9FCC8BEFBB4A5FDCFC6FDAFA2FACFC3FCCCC1FCD7CBFCB5A4F8BBACFBC0
        B6FCC7BDFCC2B6FCD0C8FCD0C5FDC6BAF9CCBDFCCBC2FCBEAFFCDCD3FDC7B9FD
        D7C9FBD3C7FBD3C8FBD9CBFCD2C7FCD8D2FED5CBFCD4C9FDE0D6FED5CCFDE7DD
        FEDCD3FCDBD1FDE0DBFED3C6F9D5C6FDD6CBFCD3CCFDE2D9FED4C8FDE0D9FDDF
        D7FDDDD2FDD2C7FDD8CEFDD2CAFEDED8FFDDD6FEC9BCFBDDD5FDD2C5FDD1C5FE
        CEC0FCD1C6FDD5C7FCDCD8FEDED6FEE3DEFED7CBFDD2C7FDD6C9FDD2C3FDD8CD
        FDD7D0FDDDD4FEE1D6FFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        FEFCFF6A55F44C3BF14C3CEE4939EE4939F0463BEE493AED4231E44B40EE4637
        ED4538EF4434E74333E64739EB4539EE4335EA453CEF4637ED4836EC4335EB44
        38E9564FF74133E54031E74334EA4132EB4539F14134E64133E73F31E74032E4
        4436E74336EA483CF13E31E64134E83E2DDF3E2FE34032E03A2AE0392CE1382F
        E54031E54235E93D2DE54030E34030E13C30DF4031E23C2DE03F30E03F2FDE3F
        32E43E30E14030E34235E64133E93F30E03F30E34131E14236E64130E14134E6
        3C2EE2402EE43C30E03E31E13D2CDD3B2FE03C2BE0392ADF3B2DE0392ADC3B2C
        E03B2DDF3D2EE03C2EE03E2EDE4132E53F30E44033E73B2DDF4032E03E30DF44
        35E73C2DDE4034E73F30E33D2EE33A2EE33D2EE4402FE43F33E74232E63F2EE2
        4131E14034E53F31E14435E83F2CDF3D2BE13A2BDD3F2DDF3C2DE03E2EE54030
        E14435E64232E64032E14131E44332E4402EDF4233E53C2CDF3C2CDC4230E042
        34E84234EA4031E43F2EE54130E44434E84233ED4031E84134E34537E94B3AE8
        412FE43C2BDC402FE5473BEE3D2DE04031EA4739E44539EA4333E54938ED4435
        EB4234E43F2FE43F2FE34431E0412FE0493BE95340EDF5F0FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF000000FFFFFFFFFFFFFEFCFF5F4CF24936E74231E44335E64234EA4436
        E94233E94030E34033E64439EC4136E73E2FE33E32E33B2EE43F31E44437E842
        35E94134E44236E6453AE94236E53E31E44131E44031E13E30E53C2FE33D2EE2
        3A2CE13D2EE33F2FE3392ADC3A2ADD3D31E43E30DF3F31E1402FE14131E13F32
        E43B2CDC3F33E23C30E33C2DE03D2FDE4030E43C30E04534E63F30E13B2FDE3A
        2EDE3E30DF4135E03B2EE23D2EE03E2EE03F33E33E31E13F30E33C2BDD4135E4
        3C30E13C2BDD4135E24131E23F2FE33D30DD4538E43D30DF3B2EDE3B2BDD3F30
        DF3D2EDD3C2EE1382BDD3D2EDE3B2DDD4135E63C2CDC3B2DDD3C2FE23E2DE140
        30DF3D30E03C2FDE3D2EDD4033E23F31E23E30E13E31E03F31E33E2FDD3A2DDC
        3E2CDF3E2EDF3F30E23D2FE23D2EDF4236E53D2EDF4034E54233E43F37E23E2F
        DE4235E23B2BDE3E30DE4134E04233E44031E04036E43E32DF3F30DE3F31E240
        2DDD3B2DE0392ADC3F31E24131E44030E63E2FE03F2DE14234E43E2FE04135E3
        3D2EDE3D2FDB3B2FDE3C2DE0392DE13A2ADB3A2DDF4338E63F31E04033E34030
        DE3C2EDF4136DE4132E33F30E33C2DDF3C2DDE3D2EDD4132E2402EDF4338E44A
        3BEAF8F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFEFDFF614DED4939
        EF4635E64537EA4A3BF13E2FE54233E54132E54637EA4132E54233E64233E846
        3AE84032E33E2FE13F30E14231DF4237E34233E44234E44030DF4031E04133E5
        4031E73D30E13A29E13C2EE33D2FE23A2CE23B2DE03C2FE13C2DE03B2CDF3F2D
        E04137E63E30E13F30E03E32E13C2EDF3B2BDE3F2FE03C2EE13B2CE1382CE040
        30E13E30E43C2FE03A2ADE3C30DF4130DE3F31E23D30E23C2EDE3D30E34235E7
        3D2FE24032E24130E44033E44333E13F31E43F30DF3D2FE1402FE04032E54335
        E33E2EE03D2EDD3C2DDD3B2CDB3C2BDD402FDF3F30E43C2DDE3F30DF4136DF42
        36E63E2EDE3E30E43E2FDE4030E04033E34135E43F2FDF4135E24639E24536E5
        3A2BDC4132E43A2BD84237E33E2DDE3D2CDE4232E13E30E04133E13E31E13C2D
        DF4032E34134E03C2BDC3F32DD3D2CD84235E23E2FE03C32DF422FDE3A2DE144
        36E83E2CDD422FE34232E3412EDF3F2EDE3A2BDD412FE04032E34034E44132E2
        4032E33D2EE23E2CDD3F31E33F32DD4133E33D2DDD402FE24436E23F2FDF4234
        E64233E13F2FE04033E14032E43F2FDE3F30E24030E23A2EE03E32E43F2FDE3E
        2EDF3F31E24434E03D2BDB4839E5F2EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
        FFFFFFFFFFFFFF6A57F35241F44A39EB483AEB4538EF4636ED473AEC4332E747
        37E84838EC4434E84639EB4638EE4433E64234E94130E44436E34837E94936E4
        4E42F14133DF4232E64333E54939EA4536E74537E84231E44132E24333E14A38
        E94838E94F3FE84837E84535EA4838E84B38E74C40EB5244EC4D3DE85346EE4A
        39E94B3AEA5241E94635EA4A3BE94D3EE94E3CEA503DEE4A38E74D3AE94D3AE8
        5443EC5845EB4A37E45342EA5040EB5542EC5646EB5846EA5A4BED5946EA5945
        E95541EB4A37E36E5DF95141ED4E3EE65746EA594AED503EE65747E94A38E74A
        3AE44E3EE25541E84C3BE14D39E85C4BEC5145EC5344EB5649EE4D3EE64B38E4
        513EE34836E35040E34C3AE34F3CE94C3BE85242E65141ED5140EA4E3FE64A38
        E74B3BE64F3DE64E3DE44A39E54D3AE84534E54A3AE44939E54835E65042EB50
        3CE64F3FE74B3CE64E3CE54C38EC4C3AE84E3AE94E3CE9503EE94A3DEA4B3AE6
        5341E94E3DED5041EA4D3CEF4B3AEA4A3BE84B3AEA4D3CE94632E84534E64F3E
        E94F3DE84F3FEA4E3FEB4B3BEC4737E74839EA4939EC4A3BEC4438E84938E64D
        3EE94735E94432E84637E84A39EC4133E44B3BE84E3DE4503AE7F5F2FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFEBE5FFDBD2FFDFD9FEE6E1FEDE
        D4FEE1DBFEEBE3FFE3DAFFEFEAFEE6E1FEE2DCFDDDD2FEEAE3FFDFD7FDE9E4FE
        E5DEFDE8DEFDEDE6FEBEAEFCE6DCFEE7E1FEE6DDFDF0E9FEF3F0FFEEEBFFEDE8
        FFE8E2FFECE4FFE7DEFEF2ECFFF3EFFFF7F5FFF1ECFFE0D6FFF3EFFFF9F4FFF0
        EDFFECE3FFE6DBFEF4EAFFEEE5FFF3ECFFFBFAFFEAE4FFF6F0FFF2EBFFF4F0FF
        F5F2FFF2EFFFF2EDFFF4EEFFF9F5FFF9F7FFF5F1FFFAF7FFF5F3FFF9F5FFFCF9
        FFFCF9FFFDFCFFFDFAFFFCF9FFF9F7FFE9E1FEFFFEFFF9F7FFF4F2FFFDFAFFF9
        F7FFF6F3FFF9F6FFF3F0FFEDE6FFF8F6FFFCF9FFF6F4FFF3EDFFFCF8FFF6F1FF
        F7F4FFF8F8FFF1EBFEF4F0FFF5F2FFF2ECFFF9F6FFF5F0FFEEE7FFF5F1FFF9F6
        FFF2EEFFF1EFFFF4F1FFF0E8FFF6F3FFF6F2FFF1EBFEF1ECFFF3EEFFE9E1FEF3
        F0FEEFE9FEF1EDFFF2ECFEF6F3FFF4F1FFF7F5FFF5F1FFEFE9FFF2EDFFF5F0FF
        F6F4FFF6F5FFF4F1FFF7F4FFF7F4FFEFE7FFF4F1FFF4F1FFF2EEFFF4F0FFF3F0
        FFECE4FFE5DDFEEEE6FFF5F0FFF5F0FFF7F4FFF1EBFED6CDFEEEE9FDECE6FFEA
        E4FFF3EEFFE5DAFEF5F1FFF0EEFEEDE5FFEDE7FEE5DCFFEDE9FEE3DBFDEEE9FE
        F6F3FFEFE5FEFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFDFBFFFCF9FFFEFEFFFFFDFFFFFDFFFEFDFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFDFFFEFCFFFFFDFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFEFEFFFEFEFFFEFEFEFCFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
        FCFEFDFDFEFCFCFEFDFDFDFCFBFFFEFDFFFDFDFFFDFDFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFEFEFDFBFBFDFCFCFEFDFCFCF9F9FDFAF8FDFCFBFFFDFDFDFD
        FCFEFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFEFEFFFDFCFFFFFEFFFEFDFFFEFDFFFFFFFFFFFFFFFEFEFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFEFEFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFFFFFEFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFEFEFFFEFDFFFEFDFFFFFDFFFFFEFFF9F5FFF9F6FFFAF8FFFAF6
        FFFAF8FFF5F0FFFCFAFFF3EDFFF9F4FFFCFAFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFFDFCFFF8F4
        FFFBF8FFFAF8FFFBF8FFF4EFFFFBF9FFF9F6FFFBFAFFFCFAFFFCFBFFFDFCFFFA
        F7FFFDFCFFFCFBFFFAF7FFFEFCFFFCFBFFFEFDFFFDFDFFFEFDFFFFFEFFFEFEFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFF6F3FFDFD8FEA192FA9889F76454F25946EE6C60EE5F4CE763
        54EA6654EF988BF59A8BF6D4C9FEF6F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFBEA
        E0FCE8E0FCEBDFFFFCFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FBF9FFE4DDFFBEBAFB9D91F76757F06351F36957F26D5EED6552EE968EF8AEA1
        FAEAE5FEFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3CBFE8A7EF981
        6BF3A79AFBF3F0FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFF
        CDC3FE9F97FCA197FBBCAEFEF0EAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFBFAFFD6D6FEB4AFF9ADA7FCB1A8FCEDE9FEFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFC0B8B09B7F869E838A9980869681
        849F8A8B9D878EA78E8FCEBFB1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFECE7E78F7B779C82818F7775836C6A876F728E7679866F739B8185F9F1
        F7FFFFFFFFFFFFFFFFFF9883898363657B5E657A62687F64677C60647E676A94
        7979FDF7F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF7F58B71778E767D766166775E63785C
        637F656A7B645E816B707E6568BC989FFFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEA58A8E7F6266836D737B6462806567
        846F747F676C997F91FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0ADB98770708D747584
        6A67856E6F8A706F876E768E7775F1E7E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFBBA7A691757492727D8C7677947E7A917B7B937E84A18B8BFBF8F6FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFEEE6FFAFA5FA6A5CF15E4CEA604AEA5C4CED5A48
        EA5949F25946EF5748EE513EE8513FE84A37E95340EB594CF54E3AE8624EED7E
        6BF3998BF6C7C0FDECE4FEFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F5
        FFB7ABFD736AF25B4DEF4F40EC4C3BE74B37E84C3BEB4A35EA4D3DEB4A3CEA56
        46EC5244EB5949ED5B4BF04937E75F4FEE5443E95140F05D4DED5A4AED5A4BEE
        5B4DEB6456EF7160F25E4FEBA99EF8EEEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFEFCFFCEC3FD908DF7594CEE3D2DE73929E33929DF38
        29E03324DD3627DD3829DE3527DE3827DC3629DF3525DD3B2AE64C3DE87967EF
        DACEFDFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFEF7F2C071619E3A29963423963526BE6854F2D7D1FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF3F2FFB1A7FD6256F13B2CE33B2CE53929E03B2DE43627DF3929
        E33727E03C2CE53B2CE03627DF3C2DE87C6FF3D6D2FEFDFCFFFFFFFFFFFFFFFF
        FFFFDED4FF4735EC3B29E53927DF3E2EE69383F7FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFB7AEFC3E2EEA3E2EE43F2EE84732E95840F0E6D9FDFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFD7D2FE6C57F34332ED422EE83E2AE33E2BE85341EE
        BAAEFCFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFBDAD
        AB5E424362464D5F47435A44465843425D47455B40428A706DFFFDFBFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBBAAAB5C454B4E373C5C474A573F425841
        456145425C46499C7E75FFFDFDFFFFFFFFFFFFFEFCFC7C68685C4342513C435D
        45455D4444503B435F4847705558FDF5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFAFAB1958F5D46
        4C60464A5B4540553C435B43445D4548553D455F474B836466F7EDE5FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF836C69
        5E48455940455F48495C45446049445D424D73585DFCF8FBFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFB2A19D5A42455D43465D4447584546553E4359444266504DEEDCDAFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFF8F4F1755C595D43475B4344543F43563F455C44445A
        444260454CDACBCBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E0FF5843F23A2ADF3626
        D73828DC3725DF3727E03828DF3829DF3424DD3B2DE33223DC3828E33225DF35
        25E03A29E43122DA3525DD3526DD3829DF3527E14B39ED8B77F4D7CFFDFDFCFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFEFF9087F83C2AE33B2BDE3727DC3725DE3324DD3625DE39
        2BE03425DF3525DF3828E13222DB3E2FE73525DE3424DF3626DF3325DD3627DF
        3A2AE13427DB3526DE3528DF3829DE3627DC4837E4392BDF3D2CE15C4AF2F8F6
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFEBE3FE7C6DF43928E63327E135
        26DF3426DF3526E13324DF3528E53626E43526DD3526DF3427DD3627DB3123DD
        3122D84334E93827DE3A2AE13E2CE17B66F3E3DFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF8C97965862C1E842A1A7C2518832C2083
        291AAD5442FCF1EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFF2F0FFA7A2FC5F55EF3C2BE63626E13524DC3425
        DE3324DE3B2CE73B2CE33728E13728E23727DE3626E23627E23122DE3B2DE43C
        2EE89485F9F7F3FFFFFFFFFFFFFF9585F83925DF3728DF3A2BDF3D2AE05647F3
        FBFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDDAFE4633E9412FE63D2BE33B29
        E43F2AE33F2EE66A51EEFBF8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0DBFF5344F23C29E13F2EE8
        3B2AE43D2BE43A29E3402EE64633EBE7DFFDFFFFFFFFFFFFFFFFFF000000FFFF
        FFFFFFFFFFFFFFFFFFFFE2DBE15E4550624B4A553F41563E425B414753393D5C
        4547614548EDE0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8775715C41
        43574447644A4C5F43485943425E45445F474FC6AAAFFFFFFFFFFFFFFFFFFFFF
        FFFF7663665D4843533B41583F40543B435943435A4245715158FAF0F0FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFCDBCBC63464D584044644E50593E445A424857434352394356414063
        4C4DD3C0C5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF8C7679624B49543E405D4A495E4249543D47553E417259
        66FEFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFA49A96563E435B43465E4344553E40543F43
        5F4547685158EEE0D7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDDCFC85F484B563C3D56
        3E40584245573E42523A3C563E425F4448A28285FFFEFEFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFA395F93C2BE13728DD3727DE3325E03022DC3424DD3323DD3325E13428DE30
        23DC3325DF3226DE3121DB3423DF3727E33122DB3427DA3222DC3322DD3828DE
        3527DE3727DF3826E18979F8EDE9FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2DEFF4232EB3827DE3828DD34
        25DF3425DF3221DB2E1FD93626DF3D30E53426E03727E13526DF3224DC3222DB
        3427DF3525DE3222D93527DA3629DF3425DE3323DC3222DD2F20D93223DB3627
        DB3628DC3B2BDC3727DDB4ABF8FFFFFFFFFFFFFFFFFFFFFFFFFDFCFFA290FB3E
        2CE33323DC3B2AE03325DD3323DE3628DE3123DE3425DE3628E33223DF3728E0
        3021D9382BDF3326DE3326DB3122DA3627DF3226DC3424DC3626DE3827E0442F
        E7B6A9F9FFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5DBCE92331F7A
        251681281B7E271A7924157C2619852A1CDEAFA3FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDBD4FE615DF93D30E73625
        DE3626DE3527DE3225DD3626E03829DF3225DF3324DE3425E13324E03729E330
        23DE3223DF3325DE3727E13426E1402FE56655F0F1EFFFFDFCFF5542F03B2CE4
        3628E03627DE3C2DE54030E6F0EEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB8B2
        FD3A29E13926DE3E2CE53928DF3A28DF3F2DE54330E9E2D8FEFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F6FF
        6854FA3E2EEB3C2BEA3827DF3B2AE43627E53726E23C2BE73B2CE5B8A9F9FFFF
        FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFEFE88747A5F484A5C
        43485F45475C4043503C415640415B4243D9C8BDFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFF1EDF26952595F4A495742414D3A405A4446564143553F44644844F0
        E2D8FFFFFFFFFFFFFFFFFFFFFFFF7763665B424655414251373D553F46543941
        583F466D5155FAF2F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFF1E9E67561585741415744435E42475A424353
        3B415B45455A424A5B3F3FC1AAB0FEFEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9279735945464D373E5945
        424F3A37554242574247634B51FCF9FAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA9989E5A4246
        533A405541415A44475F44455742415B464BE8D6D9FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFA1938F563E45594141574042533F40513C3F523D414E3A3E50383E6E565A
        FAF4F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCFFFE
        FFFFFFFFFFFFFFFFFFFFFFFFFF7E75F33726DD392BDE3526E0372BE03124DF32
        24DC3224DE3426DF2B1FD83022DD3226DE3427DF3425E03122DD3124DF3727DE
        3326DD3123DC3022DE3126DD3325DE3324DE3627DE3C2CE55B4DEFD0CAFBFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCA
        C3FE3A2BE63323DB3322D53323DD2F22DB2E20DD3123DE3025DD2F22DA2F23DC
        2F23E13423DD3222DE3225DC3023DB2F20D93024DA3125DB4133E63223DF3526
        DD3124DF3222DD3425DF3425DF3224DA3828DD3428DB8C82F1FFFFFFFFFFFFFF
        FFFFFDFBFFA294F63B2ADF3423DB3325DD3528DF2F22D83123DD3223DC3123DF
        372BE43325E03528DF3324DD3B2AE13124D93022DA3022DB3C2CE33427E23124
        DB3324DD3929E03527E03426DF3929E3B7ACF8FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFE1B0A6832914802614822A17892E1C7B23147C25177D2617C78677
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6E6
        FE5142F33122DE3523DE382AE43121DD2F22D93023DB3525DF3021DD3223DF32
        23DE3122DD3123DB2D20DB3123E03527E33324E03123DF3225E13428E03526E1
        665BF2DCD3FE4132EC3224E03223DF3322DC3728E04135E9F5F2FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF8E88F33E30E73928E03828E23727E33A2CE8392AE73B
        29E6C1B3FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFC0BAFE3A29E43E2DEB3626E63325E43425E23526E33727
        E03B2BE63624E37A63F3FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFBFB3BA694B4E5C474D5841434D363C4F383D55403F5E474A937981
        FFFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0B4B95E46495C474D57414557424958
        4244533D40664C4F93736FFEFDFAFFFFFFFFFFFFFFFFFFFFFFFF7A6864554141
        553F3F594146513A3B5D464B5E474A64494FF9F3F1FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFB8E75765F4E5355
        3F4257403E5D484856414458424662484B533B43937E7BFAF8F7FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFC
        FC9177795941425842494F38385A43455A44455A42496C5554FDFBFAFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFB4A9A2554043624A525842495642425741435C45455E484BEBDC
        DDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFF7F4F4755B5E523D465B464751383C60494B4E3B39
        584044574448594246574041D2C1C9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFDF7FAFFFFFFFFFFFFFFFFFFFFFFFFFFFEFF5644E93526DE36
        27DF2E1FDB3021DC3223DE3022DC2F21DD3122DD2E20DA3426E03627E33223DF
        3021DD3325DC3423DD3425DF3123DE3024DD3222DD3628DC3424DE3021DC3528
        DF3625DE3B2CE04636E8D3C9FDFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF8B7EF43526DE3124D92F21D72F21DB2D20DA3123E0
        3124DB2C1ED83225DE3023E03124E03425DE3524DE2E21DA3425DD3E2FE02E1F
        D83223DC3224DC3223DD3427E03123DA2D21DB3324D93525DC3529DF3726DB3C
        2DE1968DF7FFFFFFFFFFFFFEFDFF9A8CF23625DE3525DD3224D92D21D72E1FD7
        3226D82E1EDB3325DC2B1DD63324DE3526DF3325DE3425DE3D30E73022D83426
        DD3424DF2F20DA2F22DA3123DA2E21D83324DB2E1FDA3120DC3222DB4333E5DB
        D3FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0B7AE8228178126177D24137C2316
        802919762316862B1CC98373FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFDED8FF5447ED3727DF3121DE3321DB3124E22F1FD93225DF31
        24DE3428DF3224E13022DD3022DA3325E03928E23223DE3527E53226E4372BEB
        3223E13627E53424E13222DC3729E3473BEE3426E33124E23328E03326E1392A
        E53C2DEAEDE8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9489F73526E03526E635
        25E63224E43424E23424E53828E6B1A0FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4DEFF4A39F03B2CE53425E63526
        E73023E13122E03223E63524E33424E53524E76E59F2FFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBEBEE5E484E5A45494F353851383E
        5D4546584346574143684F4EF3E9E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCFC91818256
        3F46574544543C40573F3D5E464856434661484EE0CAC7FFFFFFFFFFFFFFFFFF
        FFFFFFFFFEFE7B626B5C46485C4446534243533D3F513B3E5A4247644A4DF9F0
        EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FEFEC7B6AF543B3E563D42604A4952363D5E474B523A3D543D425A4745735B64
        EFE3EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF89716E574144553E425B454854404158424453
        3C43725763FCF7F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAB9B9D59464755403E5C464B5A42
        42584043563D425D4348ECDCDCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDAD0CF60474952393E
        5640455B43455B4447544146564341523B40533D445B43479E878CFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFDFCFF5447EE3A2BE23024DD2F22DB3122D83426DD3122DD2E21DA3021DD
        3122DD3626E13928E03324E03423DF3527E33625DE3626DE3A29E13728E23221
        DF3222DC3326DC2E22D93224E03728E13626E0392AE04634E9D7CFFEFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9287F73426DC3224DD
        3325DE2F1FDB3325DB3124DD3728DB3123DF3023DD3123DE3124DE3323DD2F21
        DB3424DF3528DD382BE13222DD3223E03123DD3829E43625DE3121DB3223DB34
        26DF3627DF3828E03728DE3726E0D1C8FDFFFFFFFFFFFFD3CFFC3A2CE03223DC
        2F23DE3427DF3123DC2D20DB2F21DA2F21DC2E23DE3124DE3224DE3327E33D2C
        E73A29E43C2CE53927E23928E63222E03626E43628E13223DC3023DC3022DC30
        24DF2F22DD3325DD3526DB9083F7FFFEFFFFFFFFFFFFFFFFFFFFFFFFFFE7BEB0
        92321E8129198228177A24127B2313792214812718CA816DFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5E4FF584AEF3425DC3628E13427E12F
        20DF3726E53425E33326E43122DE2F21DD3A2CEA3525E03728E33525E43123DF
        3325DF3A2CE63426E33527E53727E33224E43B2DE83324E03222E13223E03426
        E13629E72E1FDB3021DF3627E34332EBF3EFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF9B94F73928E43729E7392AEA3426E23425E43425E33A2AE5C2AFFBFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFF8E7F
        F73B2BEC3424E33624E63125E73223E12E22E33224E53425E53526E6392BE95B
        44EDFFFDFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        A69C9C5F494F5741406A4F5456414459434B5840485B4545CCBBB8FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFEFEBEB66585557413F593F455A42475D454C5A4245574344765958
        FAF5EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE77646B503D425E44465E454D5C41
        49523C415D4549674A4CF6ECE9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFDCD0D36951505541465942425240405B48495D454B
        594646523B44634950D0C0CDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF907A76513B3D56
        4245574246513E40523C405C46426F5A5FFEFCFCFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA894
        965844495D44435944455D4B47584149634C4E5C444AEAD3D9FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF9F938D554342594142534043533D4053403F5E4550543E44533E455641
        46563F44735B55F9F7F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFF5142E63425DF3124E03528D92B1ED6
        2F22D93224E03426DC392BE23E2FE44736EA412EEB4331EA4330E74535E64D3A
        E84332E63828DD382AE13628DF3023DF3023DD3424DD3121DD3525DE3123DF33
        23E03624DF594AEEF5F1FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF968FF63325DB3123DE3021DC3023DE2F21DE2F21DE3225DF3426E13123
        DF3021DE3223DF3123E13729E33726DF3526E03524E03325E43C29E43625DF36
        28E33324DE3324DD3728DF3A29E53627DF3C2BE84735E8998AF8FEFCFFFFFFFF
        FFFFFF6864F03423DD3424DA3226DF3125DD2F22DA2F21DD2C20DB3124DF3527
        E24F3EE98270F4C6BAFDF2EDFFECE6FEEBE7FEE0D8FEDAD4FEAEA1F9705FF43A
        2AE8372AE63122E03226E13121E13324E03426E23425DE4131E9D1C8FBFFFFFF
        FFFFFFFFFFFFFFFFFFE5B8A5802618741F127B25168025147620127B21148529
        18C37E69FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFAFF8579F835
        2BE73526DE3524DE2F21DD3327DF2F23DF3222E33324E33326E13523E03E2DEC
        503BEE7462F39586F8A095F89A8BF68C79F35241EC3B2BEB3728E6392BE84434
        EA2F21DE2F22DE3124E43629E53024E33124DE3222DE3124E33D2DE8F0EEFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF978CF73A2AE73325E43528E33628E63928E8
        3426E33827E7BEAFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFDBCEFE4331EE3829E93221E43223E73021E33425E73021E32F
        21E03427E7382AE83524E2664EF2FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFD5D3D26A4F4D5F4848553E43584649543B3F4E35
        3B563F44856865FFFEFDFFFFFFFFFFFFFFFEFDFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFEFFFEFCFFFFFFFFFFFFFEFDFCFFFFFEBCACB04F3D3C513D405C4846544143
        504042533A43614D50AB9395FFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFEFD7865
        69573F435B434650373C543E43583E42553F406D5351F9F0F3FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F6F5866B6B553E3F523C45
        513D44593F4557404358424361484A573F44A98D8FFEFDFEFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF8A72745C4646533D43583A3F5541424F3B40533D42705B5EFDF9FB
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFA79A995C48495742425640415A43475A43425643475F
        454EE8D6D2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFEEEBEB635155594444523D4459434B513C44523E
        4350393F5039414E393B584146513A425A4148D9CCC8FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFAFF4539E5
        3427E0392CE83023DF3125DC3023DE3828E0362AE1CFC0FCF2EDFFF2EDFFEDE8
        FFF5F1FFF4EFFFF7F4FFF6F2FFE1D8FFB0A5F88D7DF9513FE83928E03326E030
        20DE3022DC2E20DB3629E33223E13627DF3627E59A8BF7FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F87F93B2DE82E22E02E21DB2D20E02F22
        DF3120DD2D20DB8772F0BFB5FAC9BFFBBCAEF9C9BEFABDB3F9C2BBFBBBADFBC1
        B5FCBBAEF9BAB1F8BDAEFAC0B1F9AC9CF9AEA0F8B8ABFABDB4FCC2B9FBC8C0FD
        EFEBFEFFFFFFFFFFFFFFFFFFEFEEFF3E32E63124DD2E21DD3022DD2E21DC3125
        DE3326E23326DE3828E6816FF4F8F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFD7CEFD5D4EF13425E63121E13226E13629E03424E2
        3627E13326DE8576F1FFFEFFFFFFFFFFFFFFFFFFFFE8BCB08225177923167822
        117620127E22117D25187D2315C48070FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFC0B6FC3B2DEA3526E13224DF3728E43326E02F24DF2F21DE3123DE
        3526E44935EF8772F7DFD4FEF6F0FFFEFEFFFFFFFFFFFFFFFFFFFFFEFDFFFCFB
        FFD1CAFD8478F53626E63325E23325E43527E53123E72F23E33123E42F22DF33
        26E13426E44135EDEFEBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF938DF93828E4
        3A2AE63326E23928E9372AE93928E3432FEBBBAAFCFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFAFF6A56F73627EB382CEA3226E633
        25E53123E33529EB3023E83122E43123E43324E33426E56851F1FFFEFFFFFFFF
        FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEEED6A4F535D43
        46553F4551393F553B43553B3F5D45475D4747836C6E826A6E977A83876F7290
        797A8C7477836C67866F72866A72866F72866D71836E6A86676B81666C664C54
        52413E543E475641435340415A414B5C4548634949E8DED6FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF7A66685A4243523B3D523C3D523D3F5441454F393E75
        5C60FDF7FAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFC
        A599955E484A573F42553E40523B3E614B535B42475B444456424490756EF4EE
        F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF836B6F5D44485B433E5E464A5C4449
        5A4647543B3E785A61FFFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAD9B9A564145553F445A
        434A563C41563F4558404361454CF4E4E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3B6BF5540455843
        44533B40534043564047503A3F4F3B424F3A404B373B533C4258424058434699
        868CFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFDFDFF4E43E83324DE3224DE3022DD3123DD2E21DC2C21DB3A2B
        E3E3D9FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFF2F0FE978BF43B2CE03226DC3125DE3123DE3025DE3122DC3B2DDF3122DD
        4838EDD9CDFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8A81FA3123
        DE372BE73124DD2C20DE3024E03224DF2D21E0B7A5F8FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC5C2FD3829DE3326
        DD3022DC3022DC3122DB3427E03628E03625DDA995F8FBF9FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0DAFE4A3AE9
        3122DF2F22DE2E22DD2D21DD3023DC3A2DDF4D3BE7FBF8FFFFFFFFFFFFFFFFFF
        FFE4B7AC7D25157D26187B21137720127E23157921137F2517C37767FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F7FF5548EE3927E03425E23022DE2D1FDE
        3123E02F21DF3428E13222E14B38E7D6C5FDFEFEFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFCBC0FD3E2EEA3422E03225E42F
        21E42E20E13021E32C1EE02F20DF3224E13C2EEEEBE9FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF8F84F63727E33728E53324E73222E03326E53525E63A28E6B3A3
        FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBCA7FA3B
        2BEC3728E63323E53223E83326E62D21E42F23E13222E63024E43124E43324E2
        3628E65C42F3FEFCFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFEFFA1968F5A45475E4649573F41553C3F4E3B3E594142523A4050
        3E404E383E523F3E5841434F393E553D40554041594245564341533D44503F41
        524141513A3E533F42554144523C465A43485A44454C36425A44425743467D62
        64F8F4EEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE7A6B6A564040533E4254
        4243564043564546533742705654FEF8F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFCDC1C85E4A4A564045563E44543E43543F42543E42563E
        435942426B514FE1D2DCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF826A6B
        5D4748584342553F414D3D3F5C444C584143735C59FCF8FAFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFA89D9A5942485A4644543E44513E43533E4155434062464FEBD9E0FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF89777E5A464D513C46563F4758434A544242533F4A5C48465640424D
        383E543E41513D44533C446E5155F7F3F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFF574BED3125DB2E20DA2E20
        D72C21DD2E23DC3123DC3423DFE2D7FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFD2CEFB392BDD3223DD3725DC
        3023DC3124DA3021DA3123DA3B2AE27864F4FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF867BF53A2BE43123DD2D1FDA3629E42C1EDB3325E22D20DCB9
        A6F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFD2CDFD3F31E53325DC3627DC3223D93223DB3123D9382AE0866FF0FA
        F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF9488F83526E23324E23123DF3223E12D20DD3223DC3F2F
        DFD9D1FFFFFFFFFFFFFFFFFFFFE2B3A786291B7822147821137B24137B22137A
        21137C2419C27F6EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB3AFFC3728E5
        3627E12E1FDF3426DF3324DF3121DD3324DE3424DF3E2BE8E2D3FEFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFC5C0FE3C29E93123DF3025E12C21E02D20E03022E02E20DF3224E13D31EC
        F1F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8B86F73426E1382AE73626E73425
        E63425E53524E13525E5B6A5FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFBF7FF644DF33323DF3527E63123E43122E43122E33223E53023E3
        3023E43222DF3323E43426E03223E2664FEEFFFEFFFFFFFFFFFFFF000000FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCD5CC624B4F5A464855423F50
        37415A444256403F5A41465A434856403E553D44554044523D3F584043563E42
        5642405B4548563E40543F435542445E4746503D3E54433F533F40524145513B
        3D574347573F43574044B9A3ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FEFD7C686F624C4D5038414B343B523D43493538594044664E52F9F4F1FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5EEED735A62574346503A3F5E4B
        49523E43564346553F415E474A61494CC4AAADFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF87757168504E573F435D474A5D474C5840464E363C745A
        60FEF7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFABA29D5A4349553E43503B3F5C474A564242
        593F48594244F0E1D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFF2EBEB6951525940455A46444F3A4259444B50
        3D3D6B4F58755A5F533C424B333B4F3B45594044503C455F4649DACECDFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFD
        FF4F41E73526DE3022DB3526DE3022DD3122DD3328DD3623DDE5D8FDFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF998DF43324DD3729DF3123DA2C1ED73122DE382AE03728DE503EF1F3ED
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF918CF43225DF2E20DA2C22E035
        27E02B21DB2D1FDC3022DFB6A4FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7FF4D42ED3629DD3726DE3526E038
        26DE3624E05844EAEDE5FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB4ABFB3223E12E21DE2F24
        E13122E02D1FDB3124DA3324DACAC1FCFFFFFFFFFFFFFFFFFFE1B8AE7E221573
        2013751E117D24147F23167922157C2618CA8577FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFAF9FF5B50F03526DE3626DF2F20D92E20DD3125DD3423E03223DE402D
        E7BEA7FBFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB3A2FB3122E23023DF2C20DE2F23DE
        3527E42D20DE3223DC3829E4F2F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8678
        F63829E63525E43325E13020DF3122E33528E63426E2BCAAFDFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA193FA3C2DE93224E32F21DD2D23E4
        3528E62E21E03024E13124E43021E23223E53527E43A2DE73629E1644DF3FEF9
        FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB
        F9FB816C6C5642455B44474E393E4E383B513C43523B40533D41513E404D3D40
        5C454A523F40564043533B40513A3F543F40523B3C503B4256413B5441434C37
        39524141553F455641454F3C3E533E3E5643405D4952E9DBE1FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF776564564246584445534040604B50503A3E
        564342664F53F3EEE8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFAF98F77
        77544040594445503D40553B42594241563E41584349614C4C8A706DFEFAF8FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF826E705B47464F3941573E
        405C4148584346584444715557FDF7F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA89B9D5B4849
        5B4843524140523B435842455841435E4346EEDADFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3B4BC543D4855
        41474E383F4F3B40543E3F543E40967F89AE998E513C46553C42594349503940
        57404351373F9E8889FFFEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFBFAFF4C3EEC3023DC3123DE3222DC2F21DC2C1EDA32
        23DC3927E0E6DFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F3FE5344E83325DD3022DC2D21DC3124
        DF3223DF3326E0382AE1C0B0FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8C
        81F53424E43022DF2D22DC2C20DD2E23D92C1FDA3325E3B6A4F8FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB4
        B0FB3F2DE73B2BE03A29DC3A2ADE6152EFE2DBFDFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFA499F93125E12F22DD2E20DE3023DD3325DC3326DA3121DAD9D1FCFFFFFFFF
        FFFFFFFFFFE6BFB37C21127821157921127520107621147821147C2417B86A5E
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0DBFF3E30E73224DD3124DC3123DC3022
        DE3223DF3223E03525E1876AF7FEFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2ECFF
        4A34F13628E72D22DF2F22DF2F23DE2E20DD3426DF3B30EAEDEAFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF9085F83625E63222DE3324E43125E33124E13223DF34
        25E4BCADFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDED5FE503FEF
        3424E43226E53022E23325E42D20E73224E53125E32F23E43023E53026E53125
        E23326E33325E0634CF1FEFDFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFCABAAF62464D533C415542435744484F3D46
        4E3B3A523E42533D42574342523839584247523C41524141564045543D3E533E
        41553F43533D3F533E4656424253403F543E3F513B425743415840445F484483
        696BFFFDFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7262675A4446
        50393F533A42533F425A44445943455C4348F1ECE9FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFBEA9AE5C474B573E43594A46554041533C40553E43553C3E5D
        464C6A4F57F5F1EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFD
        FC887375594645533E42533B40533E3E5740445D4446725963FDF8FBFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFACA0955C4445534147574142513A43564042523A4061464AE5D8
        CDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFEFDFC836E75564345543D40563E41533D425A413D513C40D6C6CADDD4D3
        5B47455C434B544044524042543E43543E41705556F8F1F2FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF8FF4938EA3323DA2B
        1DD82D20D93224DA2C1ED63121DB3826E1DFD3FEFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA297
        F53528E22F21DB3122DE2D1FDE3223DE3222DD3222DE8E84F9FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF8B83F33728E22D21DF2E23DD2C1ED92A1EDB3226DD
        2E21DBBDA8F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFEFEFFCBC2FA7364F07060ED9180F5EEEBFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFEFFE5DFFE4B3AEE2F22DF2D21DD2F21DF2C1FDA2D1EDA31
        23DC3223DACFC5FCFFFFFFFFFFFFFFFFFFDFB5A97C2315802414762012751F12
        761E117922127A2212B76659FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA39CF73526
        DD3223DC3022DC2E1FD93526DE3124DF3323DE4634E8E1CFFCFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF8B76F32F22DE3226E02F22DF2C20DE2F21DD3526
        DF3A2CE9EFEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8C82F93526E43023D934
        26E63021DF2F21DE3121D93626E2C7BCFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFEFEFF786CF9392BE63120DE3024E53222DF3021DF3425EA3425E72F22
        E02E22E32E20DE3021E33122E43224E23C2BEB6148ECFFFEFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEE9E6614C52
        5A4244523A424D383D503B3D5C4745513A43553F4856424257433F5A444C5943
        425B45484D383A5C4645584045524142594341574144543F42533D3E59454854
        3E3E5E47495943455F454BC6B7A3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF7A69674F3A3F554046553E3F4F393B573C4358434B5E4447EBDB
        DCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDED6D0634F50604A47543E4257424554
        3D3F54403F584445513B41644C4FE2CED6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF8C79715B4445513B41553F42554046563F4064
        4B4C664E52FDF7F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAA9E995B40425843404D373D5341
        465944445039405C4042E8D7D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFEAE2DD604A4753393E523C3D4B3A3D5C464F
        5844475C4850E8DDE3FCF7F6684F5750373B4E3B3E533E43564044604A4E5B44
        43C8B9B7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFEFDFF564AED3325DC2E24DE2F23DE2E1FDB3023DF3323DB3D2CE3E5DAFD
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFDBD3FE372CE22F22D83629DD3A2DE62A20DE3022DE35
        26E55B49EFFBFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF948CF83325DD3021DD
        2F24DE2B1FDD2B20DD3124DC2D20DBBCACFCFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF8FFACA2FB4A3AEA3324DF2E21DB2D
        23DB2D21DD3124DF2C20DA3021D83525DFC0B6F9FFFFFFFFFFFFFFFFFFE2B9AB
        7E2315771F10701C107A24167520107D2517782215BB7369FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF7C74F23122D83223D93227DC3326DE3325DD3326DF3324DF77
        5AF2FFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF6F2FFF4F0FFF3F0FFF4EFFFEDE8FFECE8FFAF9CFA2E20E02C20
        DD2D20DB2B1EDE3023DD3125E0382AE5EFEDFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF7E71F73527E53327E32F21DE3221DE3324E13224DF3627E2BDB1FCFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC5C2FE3D31EF3829E32F20E22E21E12F22
        DF3224E43426EE8979FB352AEA3323E82F21E33122E33223E43424E33829E661
        4BF3FFFDFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF837374614546563F42503B3E4C373A483539533D405E46
        459C868AAE969BAA9290A7999BA69191AA9F9DAB9A9DAC9D97A69896A68F925A
        4547523E4454423E4E393D4B3538523D41604848674D52F3ECF0FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF736167544041533C3E574343583D
        44473836523B3F533C407D5B62F4EDE5FFFFFFFFFFFFFFFFFFF7F1F07B5F6A58
        4246553E3D523D3D553D3C574041523E465E3C425B4544C0AEABFFFEFCFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7E6B6D513C3F5F
        47485B44494D3A39563D445641436F545BFDFAFBFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA89C
        96604A4C523F435942414D3A3C5C4545553F43564141EFDFDDFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAA9496564142
        56413E523C45554241513C3F563E41796264FFFCFDFEFDFC887575523A375A46
        445A4549513F42533C4051393B8F7674FFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF9FF463BE73427E03123DC3023DD2C1FD8
        3023DD3125DD3725E0EBE1FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFF5947EA3124DD31
        23DC2C1FDA2F23DE3124E33728E63E2DE9F4F1FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF8F89F32F22DD3122DB2E21E02A1EDA2E23E12D1FDA3123E0B8A8FBFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F5FFD8CFFE9F98FA5344E832
        25E22D23DF2C21DE2C22DB2C21DB2C22DB2F1FDD2C1ED82F20D64F3BE3F6F5FF
        FFFFFFFFFFFFFFFFFFE2BBAC7420148326147921146E1D10741E0F7720137922
        13B77168FFFFFFFFFFFFFFFFFFFFFFFFEDEBFF4435EB3121DA2F20D92D21DB31
        23DB2C1FD63223DD3325DDC7AFFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFF2EFFF7D6BF64532EB4032E6402FE64131EA3D30
        E83B2DE53529E43121DE2F22E02B1FDC3226DE3728E13122DC382CE5F2F1FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF7C6EF43222DF2E1EDE2B1FDC2F22E03224E0
        2E21DB3223E1C7BAFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F7FF5244EC3526
        E43626E43426E33223E62F23E23427E35546F5E5E2FF3327EA3326E62F24E331
        25E12E21E03226E33425E17461EFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDAFB35C4946574442533C
        41604449584043533C40534141D6CBCAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFECE5E1654A4E573E444F393E4D3A3C5842445D4244563F42
        A58D88FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFD7963
        66543C41553E44504040503A3B513A3D503A3C52393D523E41775C5AECDFDEFF
        FFFFFDFCFB9D858A5F43454E3C3B5444485C4242553F425A45435F444A584145
        997F7CFEFCFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF846C6C523D3D553F415642434D34395840455C4246705B66FEFDFD
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFA5979557414550373A594644644C51553E4151393F59
        3F3FF0E3E1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFBF9F8755D5F574041573E464B343A553C415E474B574048A89794FFFF
        FFFFFFFFC3B6BD594340513D45513C404F373D513A43513B3C6A5253F3E7EAFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F2FF4033E3
        3425DD3124DD3124DE2C21DB2F22D93224DD3B28E2EFE8FEFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF6758F03525DE2E1FDA2F23DE3023DE3123E03626E03929E6F0EDFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8A7FF33225DE2E20DC2C1FE1281CDB2B1E
        D92F22DE3020E0C3B6FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFEBE0FFD2CFFE9A92F952
        45EA392AE63A2DE83526E03022DE2C1FDA2D1EDB291EDB2C1EDA3327E02E21D8
        3022DA3222D98B81F7FEFEFFFFFFFFFFFFFFFFFFFFE5B9A38123157B25167623
        128026168024127824147D2414C27E72FFFFFFFFFFFFFFFFFFFFFFFFF6F6FF46
        3AE53124DC3222D93225DD2D1FD72E1FD82F21DD442EE1F8EFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7E6FF53927DF3425
        DA3223DC3121DA3225DC3122DB3024DD2F22DB2C20DD3223DF2B1FDD2D20DD2D
        20DC3629E23C2FE7F4F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8479F23A29E4
        3225E03123DF2F24E02E21DD3C2EE63627E3C3B7FDFFFFFFFFFFFFFFFFFFFFFF
        FFFEFEFF8E7DF93C2BEB3625DF3526E23122E02F22E12D22DE3A2CEADCD1FEEE
        EEFF392CE73122E03223E23124DF3224DF3728E23528E07B66F2FFFFFFFFFFFF
        FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFEAE2E5644F4A5D4947513A3D5B44475B4240533F3D5E4745957D86FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFB3AE523D3D563F3E584443
        533D3D523A415F46455A4243D2C7C5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFEFDFC74626C583D3C4E383C51393C57423C4E383D513B3A4F
        3F40553D416049487E6168E1D4D3D2C2BA5D4545553C454E363D523B3F544241
        583B3E553D3F5C4143775E5FE6DEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFC776160523C3F5841434E393F503C39
        5B4244523C4573545AFCF9F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA597975B484658424655
        3F3F5F464B573F41604743695051F2EAE2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2D3D45F444D634A4D523D3F573F415641
        455C43425D474FDBD4D9FFFFFFFFFFFFEEE4E4604950594545553E43523C3D5E
        41485D44495A4344CDBEBCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF9F8FF4637E73223DB3324DC3124DC3122DC3022DD3326DF3B2A
        E5EEE6FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9789F43729DE3425DD3123DD3426E0
        3324E13728E53727DFBAB3FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7B6FF53326
        DD3023DB3023E12E21DD3024DE2F22DE3122DEAD9EFAFDFCFFFDFCFFFEFEFFF6
        F1FFF9F7FFFFFEFFFCF9FFFEFEFFFDFDFFFEFEFFFDFCFFFEFDFFF9F6FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFFF0EEFFC6BEFD9389F370
        5DEE4839EA3829E53224DE3124DC2E24DE3425DE3024DE3224E03226E02E22DB
        3024DF3023DE3125DA2F24D93325DD3C2DDEB0A8FAFFFFFFFFFFFFFFFFFFFFFF
        FFE3B6A28128167420117B25148026157A1F11842514772114C48476FFFFFFFF
        FFFFFFFFFFFFFFFFCDC9FE3C2AE23123D92F22DB2E21DA3525DF3222DC3729E4
        5640EDF9F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFECE2FE4936EB3726DC3525DC3625DF3628E13122DC2E21DB2C1FD93123E232
        23E33729E73223E33529E63424E13428DF3E2DEAECE8FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF9488FA3526E03322E23022E23324E53325E03827E4382AE6B8A6
        FCFFFFFFFFFFFFFFFFFFFFFFFFDED5FE3F2DE83827E13829E43222E43325E134
        25E4352AE77A6BF6FEFEFFF1EFFF3E30ED3627E6382AE43428E33225DF3A2CE5
        3B2BE56E5AF0FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF948484543F41543F3D4E363855434051
        3A39564045705D5BF6F3F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFD
        846F725B46494D37374D393B523A4058414559424278625EF0E8E5FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCFB76605D523A3D54413C62
        4349554143523D3B4E3A3E523A424D3934513C405C44445D4447645055554041
        51403F5A45465A4745543E4161474D5C4047604C4ED1BEB8FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE927C85
        573F42675152644A4F533A41543E3E564042766067FFFEFEFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFA5929362494859413F5641424E3840563F425F454B63494BEDD7CDFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAC99975A41
        42553F425640465743425840455943446E575FF5F3F2FFFFFFFFFFFFFDFAFB82
        686B53414453393F5A40445642445A44475C4545997676FFFEFEFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F6FF493CE83225DC3223DD3023
        DA3022DB3323DD3426DE3F2CE1EDE5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA198FA
        3627DF3626DF3225E13425E13024E13225DF3424E0B3AAFAFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF867EF43328E13025E12B1FDE2B20DD3125E22B1FDB2F20D947
        3AE8645AF45C4EEF6357EF5C4DEF574AEF6C5EED5B4CEF6657F15E4EEE6356EC
        584DE76054EE5B4EEF7168F37466F3ABA1FCE6DFFEFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFF6F3FFB8AFFD77
        67F34336E73124DE3326E13325DC3425DE3525DD3022D93123DB3124DD3125DD
        3A2FE72D21DD3222DF2D21DC3328DF3326DD3021D93324DC3323DB6B5DEDFCFB
        FFFFFFFFFFFFFFFFFFFFFFFFFFEDC1AD8328187B25177C2415721C0F7A21137C
        2315782113C28176FFFFFFFFFFFFFFFFFFFFFFFFB9BBFC3B2CE63124DC2F21D9
        2C1ED73124DB3022DC3528E48066EFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFECE6FE402CE73D2EE33428E13223DC3729E035
        26E12E20DA362AE62E21DB2F21DF3528E13324E13224E03425DE3525E13929E7
        EDE9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9286F43726E13625E63424E13223
        E43225E53324E23928E8B2A7FDFFFFFFFFFFFFFFFFFFFDFAFF9A8FFE3B2AE938
        29E6392CE6382BE63526E33828E53E30EAE3DEFEFFFFFFECEBFF4032ED3222E1
        3529E13427E03224E03125DF3929EC6755F0FFFFFFFFFFFFFFFFFF000000FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDED3CD6C
        52535C4444574041543F3E544241523B3C533D3FD2C7CCFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF1E9E768524F553B3D4E3B3F553A41553D435841425B44
        44A79298FFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
        FBFB725E655C4446503E3C5A3F43553E3C4B3639584042523E3F503942593F45
        5441436147494C363C544045574144523B3F4F394051393B59464B54413EAE9B
        92FFFFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF84706E5F4A49553C3D4F3840513D42543D4057433F7251
        52FCF6F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFA79A9B60484A594140563F455842455B4446
        543A39604848E4D8DCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFEFCFA82676A5C4746523B405C4449523D3C533D3F5039429D818CFF
        FEFFFFFFFFFFFFFFFFFFFFAA999A5E46424F383E543E454B3237604749544243
        65494EF6EFE1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
        FF5246EA3426DF3324DE3329DF3428DE3427DD392BDE4231E7E8DDFEFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF9C90F93223DC3527E32F24DF2F22E03024E02F23DE3124
        DFB6ACFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8E85F63427DF3021DC3126E630
        25E13023E12E22DF2A21DD2E22DA3329E32E22DD2F21D93123DD3628DF3123DC
        3224DF3628E0392CE33024DD3022D73628DC3627DE3726DE392BE2392BE34E3E
        EACCC0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFE8
        E1FE9886F54A36E83E2FE03625DD3226DE2F22D93124D83125D93125DC3428DF
        372EE53125DF2E22DE2F22DF2E23DF3126DE2F22DD2F22DE2F21D83123DA3628
        DB3626D94D3DE8D9D4FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2AD978225187D
        24177B2212812414772214862915832919C48074FFFFFFFFFFFFFFFFFFFFFFFF
        BEBBFB3A2AE43324DC2E23DB3729DE3227E13024DC372AE07A62EFFFFEFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE7FF4634E839
        2AE13829E43627DE3A2BE33627DE3125DE3728E13425E13424E13424DF3627DE
        3425DD3625DE3828DE594AF2F6F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9084
        F43829E33929E73425E33425E63226E33727E13B2DEAB4A4FCFFFFFFFFFFFFFF
        FFFFCCBFFD402FEB392AE43628E43426E63222DF3524E23326E49A96FBFFFFFF
        FFFFFFF2F0FF4131EF3223DF362AE42F23E03224DE3524E13729E76B56EFFFFF
        FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFF3EEEB735C5A61474B634B4E543C3B5940455F47455D4548
        AA939BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFC2BE573D405E4A485641
        3F574246543D3D5E4A4C634B4FDDCDCAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFEFE7866675843414F3A3D533C40514340574246
        4F3A3A4E36375842464D393F5D4748553F414A373D5A4643533C4652393C513B
        3F51393F5A4246896E71F4EFE8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8775755A4246553F415B44
        465A4240553D445C4548705757FCFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA69593604649
        543C41543E4153403F563F4B533D3E564141EBD8D9FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD8CAC7553C3C5F464A5B4549523C4253
        3B405A424961474FC3B5B0FFFFFFFFFFFFFFFFFFFFFFFFDFD2D5553F44594247
        5742455C424860474B563C435B4249C1AAB1FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFDFDFF4F41EC3224DE3024DE2F23DE3527DE3125DB34
        27DE3C2AE1E8DDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F94F53526DF3628DF3124
        E03325DE2F22DD3525E13526DDA99EFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF84
        7BF43528E03224DE3021DF2B20DC2B20DD291FD83224E03025E02E21DB342ADF
        3024DD3428DE3125DE3121DC3327E23528E13224DE3325DF3222DA3126DC3426
        DB3426E03625DF3525DE3726DD5D4CF3F8F6FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFF9F3FFA594F8402FE33224DE3425DF3022D93022D93428E03325DD
        2E24DB2D22D92F20DC3528E13327E13428E03326DF3022DE3122DF3124DB3126
        DC3223DC2F21D93226DD3426D94B37E3DCD5FDFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFE3B0A4832A1A751E12792113761F117B2514792215832C1CC58373
        FFFFFFFFFFFFFFFFFFFFFFFFBBBBFE3526E23121DC2E1FDB3226DE3227DE3022
        DA3223DB785CEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFA894F74331E73927DE3A2BE33E2FE13A2CE03527DD3523DE
        3627E33E2EE93627DF3423DC3726DD3B2AE34434EBACA0FAFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF8575F3392DE23323E03424E33426E33224E03526E335
        27E2BBAFFEFFFFFFFFFFFFF9F5FF604CEF3325E33424E43427E23122E03729E8
        3A2AE64F41FAEFF0FFFFFFFFFFFFFFF0F2FF4135F03626E33325E2372AE73324
        E23528E53829E4715CF1FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF997F7D5E4748574043
        574040513A3E4D3839583F467C6A6CFEFCFDFFFFFFFFFFFFFFFFFFFFFFFFFEFE
        FE9C8E855845445C434A534143543F43543C405A41467F6163FCF6F4FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7A6A6A563E43
        543B4254414151403D533B4350383F4A333B533C3E503B3C4A3739533F42533F
        40533D3F574045574441593F444D3839735558D6C4C9FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
        FD816A68533F41554044553D42543B425643435F464676585BFEFAFCFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFA59695553F3F533D414D383C533E3C513F415D44475B4545ECDB
        D8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFD9F878254
        3D40563E43584247503D3C5B4346533F41655053E5DAE3FFFFFFFFFFFFFFFFFF
        FFFFFFFBF7F6705658513A3F563F46533A3E50383E5647475642408D6E73FFFC
        FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFF4C3EE83526DC30
        21DD3123DD3122DE3224DD3125DC3824DEE8DFFDFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF9E92F53626E33324DE3121DE3023DE3022DB3426DF2F21DDB9AEFCFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF8E83FA372ADF2F23DD2C1CDD2C1FDD2B21DE2A20DB
        3022DA2C23DE2B1EDB2E22D93022DD3021DC3023DD3122DD3326E23224DE3125
        DE3326E03225DF3024DD3326DF3025DD3526DF3E2EE33526DE4936ECF8F6FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F5FF7568F3372AE13C2DE13627E13325DD
        3024D92E22DE3324DE2A1BD73429E13324DF3024DC2E22DD2D22DA3324DD3125
        E03023DF3324DB3325DE3022DB4033E53928DD4C38E3A192F7EFE9FEFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCAB9D7A21167A22157B21147C2313
        782113802617782014C7877BFFFFFFFFFFFFFFFFFFFFFFFFBAB7FC3927E53423
        DD3122DB2D21DE3024DB2F22DB392CE2775AEBFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCFFA390F8523DE95A44E9
        5D49EA513CEA513FE95742E8513DE55340EC6454EB5645EF5F4CEB8777F3C4BB
        FCFEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8576F13526DF3324DF32
        24DF3325E1392DE9362AE63322E6C2B1FCFFFFFFFFFFFFB5A6FB3528E83929E6
        392EEC3626E43A2BE7392AE84031ECAFA6FDFEFDFFFFFFFFFFFFFFEFF0FF3F30
        E83122DF3328E43325E03426E03627E53829E16B51EEFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFC9BFBD5D43465F44466A515561494A584442553D3D564145E6DCE1FFFF
        FFFFFFFFFFFFFFFFFFFFF8F4F4705756563F3F5F45495443405A3C3F583F4161
        4A45AD9193FFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF715F665B4844554141513D3D5342456A5250513C4358443F4E37
        3A4E373D5241415748454F383C4D393A56403E58444750383C644749BCA7A5FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFEFE857070574142503A3A53403C543F415D464656
        3F3F6E5454FDF8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA89C965A46465942445641435440
        415440435C4144604A50F1E4E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFF6F1F170555A5C4548594347543C44634D4C503E3B5F464C7A5C66
        FDFBFDFFFFFFFFFFFFFFFFFFFFFFFFFEFEFC957C7F5440425C444A6C54555944
        424F3A3F5840476F5553EFE9EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFDFCFF4F41EB3525DB372BDE3021DE2E22DC3122DA3123DD3625DBECE2FE
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF9E93F93729DD3424DD3023DC2F20DB3023DB31
        24DE3728DDB0A5F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7B74F13122D82F21DB
        2B1DDA2B21DC2C20DA2F24DE2C1FDD2A20DB3224E22E21DE3224DF3223DF3326
        DE3122DE3224DF3326DE3425DF3224DB3022DB2B21D44438ED372CE23225DE35
        24DD3A29E04837EDF4F0FFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFF7666F43828E0
        3528DD3325DD2F22DD2E23DB2C1FD82D22DC3124DD2E21D73025DF2C20DB3022
        DB3022DD3124DE3022DA372BE33629DF3628DC3324DE3A29E25E4DEEA99BF9F0
        EAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCAE9F
        812615872918731F137921147E2317782315792213C18273FFFFFFFFFFFFFFFF
        FFFFFFFFB8B4FD3424DF3427E03225DD3A2BE23021DA3121DC3226DE7554EDFF
        FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFEFFFAF6FFFCFAFFFEFCFFFBF8FFFCF9FFFCF9FFF9F7FFFBF8FFFEFE
        FFFAF8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF8070F23425E23323DF3325DF3124E02E21DF3224E73325E6C2B8FCFFFFFF
        F3F1FF4836EA3323DE3325E13326E23426E03425E33426E66055F6F8F7FFFFFF
        FFFFFFFFFFFFFFE5E3FF3A2BEB3529E13425E33426E13325DF3324DF392BE56F
        5AEDFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5EFF06C57555B44485642434E39365341
        40584041553C3EC1B3B4FFFFFFFFFFFFFFFFFFFFFFFFD6CECA55413B553F4155
        44445F4648513B46624A4D684C4BEFE0E0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFD7663645641415A3D42523D425642
        435B43464E3939553E4161484C553E404E3D3D5F48494F393D57403F50383D4D
        3A3C614A498C6B70FFFCFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8A7571593F425A
        45485940465B4648523E41543F446B5357FAF6F7FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA698
        94564141583D43523D3F563E40523E42644E505C4843EBD9D8FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCECC5C4346584245513D3F594647
        563D445F504F533C3DAF949AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCABF
        BE563E46513A3C4F373C584247554348513B43543E41C6AFB6FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFAFF473BE73322D82F22D92D1FD73428E0
        2F21D73124DA3F2CE0F0E5FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFF6656EC3326DA32
        25DD3122DD2F23DD2D20DE3122DC3627DFBBB3F9FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF887FEE3023D42D20D72E21D82C21DD2C21DB2D22DE2F24DF2D22DD3324
        DF2F21DE2F23E03426DF3527E03324DF3225DF3123DF3123DE3225DE3022DB34
        26DD3224DD3F2FE73727DF3826DE3E2DE38A76F5FEFEFFFFFFFFFFFFFFFFFFFF
        FFFFFFC9C3FE3A2AE33424DC2D1EDB3123DD2D22DD3025E03025E12A20DC3023
        DA3121D73122DC3023DB3427E03628E13A2DE13324DB3625DE4837E86756EBA4
        97F7E5DDFEF4F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFDEAE9E7B24157B25157A22137821127521137521157722
        13CC8775FFFFFFFFFFFFFFFFFFFFFFFFD0CAFE4030E63122DA2F21DB3122DB2F
        23DC3021D73123DA482FDFF4E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF897CF63829E43323DD3223E23223E13423E4
        3022E03526EBBCAEFCFFFEFF9385F93526DF3023DE3023DE3226E43326E23929
        E13D2DEACFCAFEFFFFFFFFFFFFFFFFFFFFFFFFEEEBFF3A2CEC3C2DE73729E636
        29E13023E03424E3382AE57B65F3FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEA494
        9159434B5D4443554142543D3D624C4F543E43896A6CFFFDFCFFFFFFFFFFFFFE
        FEFE99908B543C4159424359444951393E573E41583F4489676CFFFEFDFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFD7863
        666B5654563C3C5942445744414B36365941435E464CD5C8BE674F52583F445A
        44465540414F363D533E46573F44523E3F664F4FCCBEB4FFFFFEFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFE806666544042553F40553F3F563F42543F3C5A43456F525AFCF8F9
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF998D8B5845465D4649533D3E4C3636573E4257434763
        484DE6D7DAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE9C8893
        5743454E3A3B553E42523B3F543E3C533F4459454BDED0D2FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFE7DEDC614C4A5F4C4B513B3B4E3A3B554343513E3E57
        3F4592727CFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFBFF473BE5
        3427DA2D20D83123DB2F22DC3627DA3223DC3928DFECE1FDFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFDFF5E4FED372AE03324DC2B1FDA3225DD2F21D83021DC3627E0E3DCFE
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8D86F12E20D83226DA2B1ED52C1FD72B1F
        DB2E22DC2E21DE3325E33023E03C2BE53B2DE23727E13729E53C2BE4392AE33A
        2AE33728DF3929E03726E13B2EE43A29DF3827E13C2AE25642EA9B8AF8F1EDFE
        FFFFFFFFFFFFFFFFFFFFFFFFFEFEFF7B78F43526DE2F23DB2D22DA2E20DC2D1F
        DC2F24DF2B21DA2B20D92B20DC3425DC3326DD3324DC3424DF5A4AE86550ECA0
        93F6D1C6FBF3EEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDBAB9E812516792113771F
        11721D117621147722127B2516D58E7DFFFFFFFFFFFFFFFFFFFFFFFFF5F4FF45
        3AEA3024DD3022DC3226DD3224DC2F20D73123DA452DE2F2E3FEFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8E83F9392BE6
        3526E23121DE3124E13022E33325E73325E4BBAEFDDAD5FE3829E83327E33223
        E13325E03324E13426E73829E38375F4FDFDFFFFFFFFFFFFFFFFFFFFFFFFFFED
        EBFF3928E63223E03527E03426DF3126E33325E03829E56F59EEFFFFFFFFFFFF
        FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFDED9D661454A5A48455744495A44475A444A4B383B5C
        4445ECE2E7FFFFFFFFFFFFFAF9F9745F60513C40574242513940523F40564345
        5D4745BEA4A5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFEFE6E5A6071605D49343A5942454D363C573E43543F4565
        514FF9F5F4D6D0D55F4D4F5E494C5541404F383A523A3D554041553E44564147
        5C4448E3D1C7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE84736D513D3F57424056403D533B3E
        594240533E406E515BFDF9FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA8999B54414458424653
        3C42513D425743445842425B4747E9D8DEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF5F3F46D5558553E424E363B503A3F4D3A3B533D435741476A52
        4FF0E6F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFB8A77794F37394F
        393D533E4151383B5743415A4748614951ECE4E3FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFBFAFF493CE53022D63124D92E21D82D20D83127DB3325DB3725
        DDE9DFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E2FD3F30E13123D93224DD2C20D93224E0
        2E20DA3123DE3B2BE3EBE6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF857FF23225
        DF291FD62E21DA2F24DE2E23DD2E22DD2F20DE9F89F7DFDAFDE7E1FDE7E0FFE4
        DFFEDED9FDE0D8FEE6E0FEE7E0FFE8E2FEEAE4FED0C9FBD6CCFFDED8FFE5DEFE
        DDD6FCFAF6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2FF4131EA3124
        DC3123DC2F23DC2E22DD2D22DD2A20D83025DE3224DD2D22DB3C2EE95543EAA7
        9AF8DBD2FDFAF8FFFDFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFDDB1A28327187B24137B23137823157B23167921127A2417C17F78FFFFFFFF
        FFFFFFFFFFFFFFFFF5F5FF4032E73223DD3225DE2D22D93225DE3122DB3326DA
        3425DEC8ABFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF8B7DF33525E33224DE3326E22F22E32F21DD3B2FED2E22E2A594
        FB6458F53426E83426E43728E73323DF3527E63A29E54534EAD6CDFEFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFF1EFFF402FEB3527E33325DF3426E03122DF3424E0
        3D2EED7763F4FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFAF971595B583F434F
        3F3D533D4057413E533E3F503A3CB8ABA5FFFFFFFFFFFFC4BCC1563E40544143
        503E3C4F383E5A4948543C40634A48F1E0DDFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE786167523E3E4F39444B
        37394E3C3F51393C4B3637674F55F9F5F4FFFFFFDDD8DB61474E614D4F513E3F
        594144503941513A3A553B3D5A3F4363464DC8B7C1FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF79646C
        57403E553F44493435503C3D533C4553404172565EFEFBFCFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFA99B97533D3B533D3F5E484A4F3D41533C3F533A3C614A4CEEDED6FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC3BDBB5741425843485741455846
        4A5B454955403E563F439A8083FFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFAF9E9A4F38444E373D4C343C4E393D4C363A553C434E373BB5A2AA
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F8FF4A3DE83528DD3022D72D20
        D83122D93427D73024D93A27DEEFE5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7C0FB2F21D9
        2F23D93122DE2E21DD2F22D83021DC2E22DD5B46EDFAF7FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF8880F43526DD3323D83125DD3123DB2F23DD2E20DF2F22E2BF
        A9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFD5D0FD392AE03124DD3124E02A1EDB3024DE3224DD2E21DE2F20DF38
        28E49484F3E3DAFDFBF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFD5A89E7F27177A2412701D107722117621117C
        23147D2417C78A7FFFFFFFFFFFFFFFFFFFFFFFFFFEFEFF736CF1382CD93326DE
        3325DE2D22DD2F21DD3224DE3023DD7A55EBFFFDFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFF7F1FFEFE8FFF4EFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8A83F73624E23529E03024E33124
        E23023DE3023E33022E66156F63226E72D20DF2F22DF3122E13022E33828E438
        29E6A18EF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0EDFF3C2FE73626DF
        3125DE3125DF3326E03426DF3A2BE56752EEFFFFFFFFFFFFFFFFFF000000FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFA6918E5B4646513C3C553F41513B3F5A4244674C4C87706DFFFFFE
        FEFEFE917C7F5641415D444C50403E5B444559434760464A8C6D6AFFFEFEFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FDFD6B545A5A43454F373B523E42533F40563F44533D40705654FDF9F6FFFFFF
        FFFFFFD8D1D5685254533D415E4B48533E4456404558403C573F46543F3D6852
        51CEC3CAFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF836D73564241544144584445553D42503737573F41725A
        57FDF9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFAB9C92553F46624A4E563E415B46455C4344
        5D44475B4147EDE1DEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE8873
        79624B47533C3F583F445943455F474B513D3E594242BCA3ADFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDACFCB584547533E41543D434D383E
        533D3D573E44584140846870FEFBFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F7
        FF4537EA3425D93426DE3020D73122D93222D63125DA3C2AE1EDE1FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFEFF7667EE3323D93225D83425DF3221DF3123DA2F22D93322DA745F
        F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8075F4382BDF2C1ED73326DC2C
        1FDA2D21DA3223DC3123E1CDBBFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB4ADFC3629DF3423DF3728E12C1FDB2C
        20DC2F22D93122DE4634E2D5C8FCFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1B5A77D24167A
        2414732012782111731D0E792213792315C98672FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF9D94F93728D52F22D93224DD2D1ED93022D93120D93424DA402DE1DAC7
        FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF9FFB3A8FC523EF24433ED523FEE
        B9A9FBFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9089
        F83121DE3223DE3222E03226E32A1FDC3023E03427E93121E23123E13223E435
        26E43323DF3222DF3726E15B48F1F1EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFF2F0FF4130E93526E13525E33121DE3426E03627E13A29E16F56EFFFFF
        FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6DDD55E464E584541564345543A3E
        564042644E4F594249F3EEEBEEE8E962494F5945485D4243564146503B3D573F
        45644D4DD6C4BAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFDFBFB6F585A563C3F5D4447544040523D3E594242
        5D494071595AFBF7F8FFFFFFFFFFFFFFFFFFDFDAD665484D59433D5A40486248
        4A513A3F5C4344604646593F436A5553D2C3C8FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF79666458423E584441654B
        49543C3D61444D52393B6E5761FBF7F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA79595614848
        624B4B523D405842455B48465F4649644B4FEADDDBFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFE3E0E3614D52513C3D584142594347503A3D533C3F59404571
        5652EEE1E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFAF7
        715857533C3F563E3D4F3C3C543E40503B3F543E415B4447E5DCE1FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFF6F5FF4A3AEA3A2BDF372ADC3B2BDE3221DA3121D732
        23DA3A27DFE1D3FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3DFFE4431E63323DA2E21DA372ADD3124
        DD4030E83324DF3E2FE4C2B7FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7C
        6FF63627DF3121D72E22DB3021DC3427DF2E1FDD3625E1BAA6FAFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB5AEFE36
        27E43424E03124DE3326E02F22DF2D21D73021DEBBABF8FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFE7E4FE9E92F47767EF8372F0BFB5FCFDFCFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFD9A6988628187721147D25157A23147721107722137A2316CC8476
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9D5FE4232E43627DD382AE03223DA3223
        DB3423DD3626DD3927DD775BEEFDF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFF8472F5
        3E2FE83B28E33828E03828E1412CE7C0B8FEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF8476F63626E33425DE3221DE3226E33122DE3224E02F
        21E13526E33123E03021E23322E13322E13424E13928E0BDAFFBFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3FF4736EC3727E03526E63426E03627
        E4362AE43725E1705CF5FFFEFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
        948186523F425A4146513B3A594141573F46574444C4B3BBCFCAC9614B4C5649
        45533F40574148594041573F43745854F8F5F4FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFD7060645B4648
        4E3A3D534246543D41513F41634B42684E51FCF7F6FFFFFFFFFFFFFFFFFFFFFF
        FFCEBEBE624E4C61484B523E3F644A545D45485C44445F494B6650576F5455D1
        C9C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFD
        FC836C66574445533F415D4248554045523F405B4447785D60FDF8F7FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFA091945D4246533E3F513E405B4444594040513F44644C51F1E4
        E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB8B0B257424557404356414656
        4144584042584242604C48765A5CFEFCFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFEFEFE9983855B41455A4646584146564449553C40513C
        435A4245B9A4A8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F6FF4F3FEB3425DB33
        27D93124DB3021D7352ADD382ADE3B2BDEE5D8FDFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFF6054F03524
        DE2F23D93022DC3325DC3127DF3627E03628E1503FF0ECE4FEFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF867EF33626E03122DC2D22D72F20DC3425E03023DE
        392BE3C0AEFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFADACFD3C2DE43224DF3123DF3123DF3226E02F21DD564AF0
        E8E1FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFD9CEFE5444EC3C2DDF3B29DD3F2FDD4330E69486F7FE
        FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCAE9B872A197B2615842817782214
        7A21117A24147B2317CC8376FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFCFF665C
        EE3826DC3426DD2F22DC3023D73325DC2F21D83323DB3927E3C1AFFBFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFBFAFFA699F73D2BE33A2AE03C2AE33727E03525DC3A29E3644FF2FCFB
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8376F43627E63224E031
        22DD2F20E02E22DE2E1FDD3426E42F20E03324E03324E13224E43424E53C2CEB
        8472F2FEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3E1FF4231
        F13827E3392AE53324DF3122DE3727E3392AE3795EF0FFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFBCABAA614A475E484A614F4D594244554044523C
        408F73688C7377574242533F43523F425F47475B45435740449C857AFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFDFAF9786363594544664C4C533C41544244594646553C446E5455FAF4
        F2FFFFFFFFFFFFFFFFFFFFFFFFFEFEFCB1A3A35C484356424358434357424357
        443E584543554042574145644D4DDAD1C8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFEFD7D676158454A564143543F4253404058434656
        42446B555CFCF8FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA29397594444584442503D40543B
        44584144513B3E5E474AE9E0D1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFF81
        747C564242513C41523D3C533D42523D40554244594544AF8E90FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC5BEBD533C3E5640
        45544242503D43533F445744465740477C646EFEFDFEFFFFFFFFFFFFFFFFFFFF
        FFFFFBFCFF4D41EB3829E23123D93425DF3021DC3528DE3C28DD3828E0E6DAFE
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFF6F1FF7B72F83A2AE03424DC3425DD3022DC3F34E63628E33929E03828E194
        81F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8178F33628E03225DD
        3326DD3124E13023DF3324DF3625E1C1AFFDFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFBCB7FC3526DF3628E13225DE
        3327E13121DD2F22DC4B41EC927EF3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDCFF4D3AEE3727DF3A2BE33A
        29E03B2CDF3829DE4C39E9F0EDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEB5A7
        8125147A25137F2313781F0F7523147923157E2819C07C71FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF9B96F93A2ADD3B2EE2392BE23627DE3124D94436ED35
        27E53C2CE55843ECE1DAFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA195F93D29E23626DE3526DF3626E33527
        DF3627E03E2DE63D2FEBEFE8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF8475F33829E53729E53324E03325E33123DF2F23E03023E12B1FDE3828E4
        3223DF3325E13526E2402DEEDAD0FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFEEEEFF3F2FEC3727E33727E23527E33727DF3325DD3A28E074
        5CECFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3DEE05E4C55503A
        395641445640435D4948513B3F523E465D4646544042543E3E533F44533B3D4D
        37375C4B4AD0B8BEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFC766161553D415C473E5C49475445
        4458444C534038694B52F9F2F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFBAD
        9A9865494C5A473F5B454D5B4341574347594444523E3D5842446A5655DBCBCC
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFD80666859444556
        40405440415A41454E393D584148685154FDFBF8FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA395
        9258444359434851383C55403F56403D5E464A5B4043F0E1DEFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFE2E0E05C4549563F43584144533E49574242574043614A49
        583F44DECEC3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFEAE5DE614C4B553D3B513942533F405542475B44455341425E4647EC
        E5E4FFFFFFFFFFFFFFFFFFFFFFFFFBFBFF4D40E73D2DDC3425D93325DE3426DD
        3124DC3728DE3724DEE8DBFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFEFEFFF6F1FFC2B9FB5743E93627DD3527DD3224DC3323DD3122DB2F
        21D93021DC3525DD3D2AE2C2B2FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF7F76F43223DC2F23DC3323DD392AE13324DF3326DF3022DFBDAAF9FFFF
        FFFFFEFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFF
        DAD3FD3628E03927DF3224DD3124DE3123DD2F20DC3324DC4C38E7F0ECFEFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0D9FE58
        48F23B2CE53829E03728DC3A2AE43828DE3A2AE14330E4C0B8FDFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFE1B7A57F24167523127E26188526157F25158427187E24
        18CE8D7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F1FE5D4DEC3B2ADE3A
        29DF3223DD382BDE3021DF3325DA3424DC3927E15343EBAF9EFBFBF9FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F6FFAD9DF84333E93A29
        E13526DE3625E13627E13728E23925E03E2FE53F2EE3EBE3FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF8172F33527E13624E23223E13525E43021DE
        2F20E02E22E33123E33125E13323DE3626E43726E49888F8FFFEFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEEFF4331ED3927E63525E03A
        2CE03526DF3C2CE43A2CE87C63F5FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFEFF856F765D4443523F40543E4360494C5843495C47434F383B53
        3C424F3B3E5A4449563F425A45476C5453F9F4F1FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFB7567
        67635049544043553A434F3B3D543F44584145785959FCF6F8FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFDFCA494935A41405B4442583C445C48425A4445
        5A424361494B5B454574575FDBC8C7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFF4F0EFAD9899AC9897A38A8EA39290A68F909B8A8BA79295A49696A59190AE
        9A99A99993604B53503C395D4549533C3F553F445242455942455D474AA69291
        AD999CB2A1A5A99697B2999DAB9C9BAE9A9AAF9C9CB3A2A2B9A5A7BEA9ACF9F4
        F7FFFFFFFFFFFFFFFFFF9A89895D474A55434256404157424758404151404365
        4E51EEDEDAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAAA3A7594448543E3D5B4644
        5B46474E363D523F3B573E496F5353F3E9EAFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFB7D636A5841465E4849614A4C53
        3D42584043554043594248B6A0A1FFFFFFFFFFFFFFFFFFFFFFFFFAFAFF4E42EC
        3629DD3222D43629DD3322DA3225DB3424DD3527DE7862EE8472F0998BF7A192
        F59786F49B8BF59D8FF59584F79F8EF76556F04C3AE93829E03A2ADC3525DD34
        28DD3426DF3223DA3222DC3628DC3624DD3624DD7C68EFFEFBFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8783F63A29E03929DE3829E1352AE22F23
        DC3224DD2F21DE6352F29483F78E80F7ADA2FB9886F6A393F7A090F8B4A8FBA6
        9AFA9D8FF9B3ABFBAFA1F6A196F8ADA1F8B9AFFB9786F7AA9DFAC3B9FCF3F1FF
        FFFFFFFFFFFFFFFFFFFFFFFFEDE9FE4736E6372ADE3728E23021DB3024DD3123
        DA3223DB3526DE5D4CEFC1B3FDFCFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
        FCFFEEE6FFB3A9FA5244EC3727DF3525E13728E23624DD3526DE3524DB3927DB
        4332E5B8ACFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDCAE9F82271884281A7822
        137420127D26157E2514782113C78073FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFC1BAFC3B2CE43C29E53222DD3627DF3123DE3121DA3625DD3223DF
        3624DF3726E2705EF2D4CCFEFBF9FFFFFEFFFFFFFFFFFFFFFEFCFFF7F2FFD1C6
        FD6F59EE3524DF3523DF3A29E13325DC392AE03728E03424DD3827E13B2AE34F
        3BEBF4EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8674F63C2DE6
        3324E0382BE53023DF3121E12F20DF3123E23022DF3325E53526E33727E14E3B
        F0EBE3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5
        F3FF4735ED3B2DE53424DD3324DF3326DD3727DE3E2BE36D52EEFFFFFFFFFFFF
        FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9ABA95D4849543E3D503A3B53
        3E41503B3D5641424D3F405842445B45445E474F543E42584447AF9995FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFEFCFC7A686955404154404252383E5B434559424160494B68
        5352FBF9F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDA69598
        5C48455840425F48485C4045604847553F415D4744574243755954E2D9CDFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFE8DFE166504D614D475B4446624D4F5B444668
        53555F4849644B4C5C484B5740425844405540464A3833504143513D3F574346
        513C3D523A3D534145564148604B4A5E43465E47485A45435B494A5A444A6247
        495A45465E4448634B4BF1E8EBFFFFFFFFFFFFFFFFFFA79C9A5B4446533B4157
        4346543D42564145584443614948E8D3D1FFFFFFFFFFFFFFFFFFFFFFFFFBF6F7
        775F65594240523D41544040553F405945415B4648563F409C7C84FEFCFEFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAA
        97915F4548624C5057444860484A5A4344513A3E554146806A76FFFEFEFFFFFF
        FFFFFFFFFFFFF8F7FF4839E83627D83324DB3628DC3123DA3222DC3122D83324
        DB3224DA3626D93526DB3626DD3424DB3B2ADF3A28E03D2CE33527E03A27DE34
        24DE3928DF382BE03325DA3626DD3524DE3323DD3224DB3323DA3727DD5849E9
        E7E3FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8375F53B2C
        E13529DF3223DF3324E12D21DC2F20DC3326DE3527D33323E03829E13225E439
        2AE43728E3392BE43526E03827E13625E13827E13524DE3D2FE03323DE392AE1
        3B2AE33B2BDF3E2CE44E3EE89D8EF8FDFCFFFFFFFFFFFFFFFFFFFF958DF83D2C
        E03D2BE43426DE3324DF392CE33121DD3224DF3526E33625E1614FEE998AF7C2
        BBFBBCB5FCC4BBFAB3ABFC7161F14D3EF23B29E43827E03525DE3627DF3527E0
        3324DE3527DB3829DE3D2BDF5342E8F2EDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFE2B9A87B23157E25147C2213882C17852B1A7722127D2614CD887CFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F5FF6E5BF13A28E43726DE3526DF
        3524DE3525DA3524DC3125DB3527DF3627E23E2CE43B2CE6513FEB8573F38172
        F57664F17360EE4C39EC3A29E23225DD3525DD3725E43125DB3121DA3022DC36
        28DF3426DE3526DD4131E6B7A4FAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF8A7AF23929E33928E43223DF3124DF3020DF2D1FDE3224E13123
        DC3727E43627E43E2DE9BBB4FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFF2F0FF4030EA3C2CE93E2AE53E2DE33624DF3A2CE4
        3726DF7A61F0FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEF
        E7E9715858533B415941445843455B4548513B41573F43503D3B4E383A58443F
        584045624B46DDCDCBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE7861645843445A454259
        3F3F513B42573E3C594248674F4BF8F3F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFEFDFCA393956553495A4141574343604347553D415C46
        4360464656413F6F5351E7D9D8FFFFFFFFFFFFFFFFFFFFFFFFE0D7DB5840435B
        4645563D435B4342574344503A3C533D3F533D3B5A43445C4648564041594144
        5C4B4C564141533A40604B52503E3F5844415642455A464859413F5440435C48
        4A573E415D4A47563E425D45465742435E4A455C454DF0E4E6FFFFFFFFFFFFFF
        FFFF9F92925B4143573E4063484B553A40573E40523B435C4143EADED7FFFFFF
        FFFFFFFFFFFFFFFFFFD4D0D25D4240583F42543D3D584045593E455F4549523C
        3C5F4643C7ADA2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFD2C3C35B464A594141523E455A4446533A42533E40
        5B43465D454BEBDEE2FFFFFFFFFFFFFFFFFFFAF9FF4839E43828DA3225DA3425
        DB3425DD3627DD2E21D73827D93425D93324D33323D63225DA3523DC3526DB3B
        2CE23B2ADF3727E13525DD3124DC3325DB382CE03828DE3727DE3829DE3425DD
        3625DD3829E0402FE5C6BDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF8078F23928E03322DC3021DB3224DC3123DE3223DC3022DB34
        23DE3222E03628E03625DE3325E03323E03B2CE5382AE53525DD3629E23526DD
        3626DF3C2BE23626DC3624DC3425DD3726DE3527DE4230E24333E3BAADFAFFFF
        FFFFFFFFFFFFFFE5E2FE4838E13A2AE13728DF3223DF3829E23628E13223DF35
        27DF3124DF3223DC3729E33424E13222E03326E13626E13424DF3526DF3426DF
        3425DF3428E33425DE3527DE3828E33D2EE23B2BE03A29DCA798F8FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFE4BBAB7E27177A22138126167923137D25178F
        3120852B1BCB7F6EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        F5F2FF604DEF3A28DF3B29E03726E03527DE3527D93426D93124DA3728DB3526
        DE3527DF3523DC3225DE3927DF3526DD3122DC3B29DF3323DC3223DC3222DB39
        2AE23223DA3425DA3B2EE43525DE3827E0382ADF7161F4F5F0FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8378F43B2BE73728E33525E03426
        DF2F20DD3426E13125E23728DF3627E03D2EE96455F5F4F2FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F0FF4837EC3A2BE4
        3928E13826DF382AE13A29E03E2DE57057F4FFFDFFFFFFFFFFFFFF000000FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFE93837F60454C5B42455741425C4748544144
        5542435D42445944475741435C42427A6167F9F7F7FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FEFE7E6B71654A475D4A445943455A4844543C3E574044735559F8F3F5FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAF99F90915E47
        46634B495843475C44445A41445741445B45465A41456E535CE8DADCFFFFFFFF
        FFFFFFFFFFEADDDD5D45455C44425D48475B44445641425A44455F444B574140
        56414B573F3F5641425C44475E454C503C3B584344513B3C58443F58454B513A
        3E533E49503C3B5C474A4F3B3F4F3A3C5644475A3F435943425841445B424265
        4C4BECE5E7FFFFFFFFFFFFFFFFFFA798925A4441553E40584246513C3A5C4347
        59413B604545EBDCD8FFFFFFFFFFFFFFFFFFFFFFFFA28E92624F4E5943455842
        3E634A4C5D4046584244574042654B4CE1D3CFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F3F4694F57574144
        61484B574247654B515840455B4647554244BDAAABFFFFFFFFFFFFFFFFFFFBFD
        FF6157EE3A2ADC3729DC3222D83223DC3224DA3425D93324D63426DA372CDF32
        24D93426DB3325DB3424DC382ADE3524DD3526DE3425DC3526E13628DC3325DF
        3524DF3A2AE13625DE3727DE3B2ADF4134E9A8A0F9FDFCFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9689F7402FE53F30E43121DD33
        24DE3325DF3B2BE13021DD3223DE3426DE3728E23626E43424E03426DF3526DB
        3424E03324DE3729E63023DD3625DC3526DE3525DE3926E03123DB3424DD3929
        E03E2DE0402EE49285F2FFFFFFFFFFFFFFFFFFFFFFFFA49AF33A2AE03627DF31
        22DB3326DF3326DE3323DE3527E03426DF3124DF3323DE3B2CE23627DF3324DF
        3629DF3324DF3529E03C2CE63528E13629E03626DF3423DF3A2AE33B2BDE3C2C
        DF5846E8F4F1FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDAAC9C83271983
        291A7F28178529187B2515882C1C8B2E1EC58579FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCBC1FD4634E23C30E33729DD3728DD2E21
        D93524DE3323DA3426D93827DA3729DF3727E23121DC3728DF3323D93527DE30
        23DC3627DF3427DB2F1FD53428DF3122DB2F20D73223DC3224DF3A27DF402CE8
        CCC0FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8675
        F53928E13324DE3427DF3524E03626E33526DE3727DF3725DE3726DF422DE9D0
        C8FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFEEEDFF4839F03D2FE73C2AE63B29E13C2CE63A26E03E2CE3795FEEFFFF
        FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC5B7B9654B47
        5845445A42455B46465B4745563E405F4C4A5E474761484B5D4746AA8E8FFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFEFDFE7462635E4847664C4C5B45475E4644574243
        5A43456F5855FBF6F6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFCFCFA8D73795F48456A525360474C5F48485F4A4758424061
        4948634D4F745C59E6E0E6FFFFFFFFFFFFE4DBDE6044465D45465B4245573F3C
        574044584143574141513C3A574341523E3F5A4342533E455C4946594544543E
        425942455D4648553C3F553F435440415945415F4844563E405B4843543A415A
        4549604E4A5D48495B4146674E54EAE2E3FFFFFFFFFFFFFFFFFFA08D915F4544
        533E445A4444573F405E484B5F45456A524AEDE0DDFFFFFFFFFFFFFFFFFFFBF9
        F96A535A563F405840435B4445614B465A43455E47475B474781625DFBF8F6FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFEFE9A82805D474B7054555E44475945434F3E3D593F4460494A816F
        6CFEFDFEFFFFFFFFFFFFFFFFFF8C84F63726D63828DC3424DB3527DB3324DA32
        24D93223D93829DD3326DC3325DA3427D83122D93525DE3524DC3628DD3527E1
        3626DF3B2BDF3E2DE33525DD3A28DB3E2CE13729DD3D2CE55845ECD0CAFDFCFC
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF
        CDFD4131E53726D9382ADF3728DE3428DF3628E13323DA3325E03326E03526E1
        3727E13526DF3323DC3627DD3424DC3526DB3629E33325DF3425DD3426DD3223
        DE3626E1392ADF3426DF3424DC3828DE3B2CE09585F3FFFFFFFFFFFFFFFFFFFF
        FFFFFCFBFFAAA0F93928DF3726DD3626DB392AE43727DF3326DE3022DA3224DB
        3123DB3424DB3324DA3527DE3426DF3224DD3224DC3626E03527DF3627E13C2E
        E5392CE23828DE3927DB533CE8C8BCFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFE6B59F822A187E27197A2819822A197A24167D2718852A18C37E76
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3CB
        FC5644E7392BDA3525D63525DB3324DA382AE03224DE3123DD3427DD3221DA32
        22DB3325DE3425DE392CE13122DD3224DC3626DC3121DA3A2ADF3325DE2F21D9
        3525DD3726DC5343ECCCC4FCFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFA89AF63828E03A2CE23223DB3829E13427E23527E039
        28E23D2CE23C2AE59A93FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0EFFF4031E83F2FE33F2CE43A28E0402E
        E43928DF402EE6836FF3FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF5EEE6645454644B4A5C4343573E42533F4150393A5941415442
        3E5A44455F4A49E0D2CBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFBFA735A5860494F
        57414258403E573F415F483F6046476C584FFBF8F4FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBE2DD7A68646346445B
        45455A4442543C3D533F3F563F3B5B42446248476A505AEBE0DFFFFFFFE0D5D9
        5E43455E4B49583F40624C475A3F45563F41583F445842405943425C444B5B44
        41584143553F3D553C41584442513D3C583E40503D3A5643435D4A4657403B51
        3F415B45455D46425941435A4748564241573B41513D3B624B49EADDDFFFFFFF
        FFFFFFFFFFFFA295925844425F4741604747564244523B3E56403F62494CEEDC
        DAFFFFFFFFFFFFFFFFFFD5C8C85943465C464551393B5441435A43425B434454
        3E435B4242A58D8DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCABDBD523A3C523B3D533E425339
        3E554445554340574041604343E9D7D9FFFFFFFFFFFFFFFFFFE2DFFE4334E043
        35DF3224D93527D73627D73A2FDC3222DA3426DC3222DA3022D6382AE13426DE
        3124DA3323DE3726DE3827E23727E0392BE43929DF392ADE3827DD3929DF4333
        E18F80F3F3F0FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFAF8FF6353EA3726D83D2DE23C2AE03324DD3728E0
        3629E03428DF3324DD3527DE3325DC3528DE3527E13023DB3125DB3425DD3223
        DC3225DD3224DB3427DE3526DD3427DF3A2DE03527DD3728DD3829DF3C2BE4BE
        B2FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFFA493F94433DF3528DE3C2DE1
        3226DB3323DB3124D82E23D72E21DA3325DB3324DB3022DA3022DD3224DC3629
        E23527DF3528DE3526DF382AE03829DE3E2EE0897AF3E7E1FEFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6BFAE8327188229187D25157D2615
        7E2916792213812615D59988FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFE7E4FD6759EB3928DB3627D93426D93628DC30
        25DE3021DB3225DC3326D73222DB3627E03425DE2E20DB3425DC3122DA3729DE
        2F21D63023D73726DE3323D93826DF6B5BEEE2DDFEFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7D5FD3E2FDC3D2FE038
        28DD3727DE3223DE3827E2382AE23826E1644FEFF9F6FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFF6A60
        F24432E13E2EE13A2AE1402DE73B2BE34431E5AC97F6FFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFD92796C5D46485643485740
        4060474F5E4648583F435A42465C44468B6C74FFFFFEFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFDFBFB765C645D46435C42435C4545584446564045624A4B73575BFBF5
        F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFF3EDEA856A65614A4A594345634C4F644C505C4247624B49604848
        624A4D735759E5DBE0E1D7DD5F444A5A4647614A4A5D4A46573F4361494A6950
        535A43445B444968564F6952505A4343614A495B434A634C50553D425A434355
        42415A4545543D3E644E535F47495842425D45495A4445564344644A47604746
        5C45495B444AF5EFECFFFFFFFFFFFFFFFFFFA496955A41435B40435C43465E46
        485C4548664F4A684C4EF2E2DFFFFFFFFFFFFFFFFFFFAA8F9263494B5A46415D
        4344594347594346684E516248495A3E44DCCDC7FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBDE
        DD6247495D45456444485D4343684E4F5A4144624B50564045BDA7A5FFFFFFFF
        FFFFFFFFFFFFFEFFA293F24B39E23726DA392AD93626D53627D94739E83828DE
        3529DD3325DB372ADD3628DE3224DE3525DE3728DF3828DF3A2AE04232EC3B29
        DC5946E88574F2B3A2F9F3F0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3CDFC5445E5
        382BDE3829DF3527DD3626DB4235EB4033E73426DA3526DD392ADD3727DE3627
        DE3629DE3123DA3423DC3527DF3326DD392AE33124DA3629DF3323DD3A2BDE33
        24D64130E14535E5897AF5FAF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFD5CEFB7666F33627E03526DD3526DB3425D83225DA3425DC3224DA3427
        DD3627DD3729DE3629DE3B2DDF3525DF3424DC3627DC3627E06352EBBEB1F9FE
        FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF3EC
        983A27822A1A7E26167D24158026157C2718882918EECDC5FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEBFFC7
        C3FB7165ED392AE03929DD3525DC3529DA3628DF3222DB3323DB3425DE3628DE
        3224D82F21D73526DC3529DD2F22D53627DB3526DE5341E3ADA3FAF8F6FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFEFEFF7361EE392ADE392ADF3828DD3425DC3322DC3A2ADE624DEDEBE3FE
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFB1A7F94230E23F2BE13B28DE3827DF3E2FE74833E8DA
        CAFDFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFF5F1EEE2D9D8DCCEC8CFC4C6D7C8C6D9CFCFD4C7C9CEC5BCD9CBCCECE7DFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0D2CFDCCECCD1C7C4D9CACBD2CB
        CEDDD3CDD1C7C5D9CCCEFDFCFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F4F1E5DCDAE9DEDBE4DDD8
        EAE1DEE9DEDCE9E1DEE3DBD3E4DEDFEBE1DEF2EEEDFBF9F9EBDEDCE9DEDCE3D9
        DAECE5DFE2DCDFE9E1DEEFEAE9E0D7DAE2DAD5E5DCDBE0D9D6E5DAD7E4DDDEDF
        D7D2E7DFE1ECE1E0E3D9D4E4DBDBE2D9D3E1D9D7E7DFDEE1D8D1E1D9D6E5DBD7
        EAE2E0E3DDDCEADFD6DACECBDED2D1E4D8D3FAF5F5FFFFFFFFFFFFFFFFFFF6F1
        EEE0D6DBE1D9D5DED4D2DCCDCEE3DCD6DECECDE0D3CFFBF9FCFFFFFFFFFFFFFF
        FEFFE0D7D5D9C8C6DFD0CDDED3CFDDD2D2D6C9C4D3C8C7D6C6C5D8CCCEF9F8F4
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFDCD0CDD3C8C8D2C9C9D1C4C0CFC5C6D4C8C3D4
        C7C7D9CFCEE2D7D0FFFFFEFFFFFFFFFFFFFFFDFFFFFFFFF2EDFEBFB5F6B5ADF5
        AFA3F5B5ABF7C9BEFCA798F6B9AEF5C3BAF9B7AEF7B9AEF8C5B8FAB3AAFAB1A8
        FAB4A9FAB9ACFAD3CCFDECE9FDFBF8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF7F5FFD6CDFBACA1F7BFB8F9B4A9F6C1B6F9A9A1F6AEA4
        F8B9AAF89C8FF7AEA0F8B1A7F9B7ABF8B6A8F8B3A6F7C0B4FAB7AAF7B3A5F9A5
        96F4A493F3B0A4F7B0A5F89A8EF3B3A9F6E8E0FFFEFEFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F7FFC8BDFB8F80F24A39E73728
        E33929E13A2CDE3628DE3B2EDF3527DB3A2BDE3527DC3627DC3727E15241E96A
        57F0B8ABFAF9F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFE7BAAB8B32207E2817832916842A1A8B2E1DD89A
        8AFFFEFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFFC7BFFD7E70F34D3BE63926DA3829E0
        3728DE3224D83628DC3628DD3528CE3123D13324DA3F2FE44F3EEA897AF1C1B3
        FBF5F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDED5FD604BEB4630E23D2CE33D29DE
        4433EB8772F1EAE1FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFF9C8EF74734EA3F
        2EE5422FE74A35EBC6BBFCFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFEFEFFF7F5FFDDD6FEDAD0FD9E90F39B8AF39687F3A69AF69F92F4A2
        94F3CEC6FDDED8FDF5F2FFFCFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDF0D7D2D19C
        8DCB9485C68A7DEFCEC3FFFEFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FEFEFFF5F0FFD2C8FBCAC0FC9687F38B7DF0897CDE887BF19B8BE9AEA2F7D0C6
        FBDAD1FDF0ECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FAF6FFE2D9FED8CFFCD1C6FCE6DDFEFEFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFEFFDED6FED3C9FECABFFDE9E1FFFEFDFFFFFFFFFFFFFFFFFFFF
        FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFEDE1E0CAB9BFCAB9B9C8B8BCD0C1C4CEC0C3CFC3C8CEBCBED0C0
        BFCBBDC3CEC2C4CCBCBDC7B9B7D0C6CBCCBCBFC9B6B6CEBFBFC6B9BBC2AFB9C9
        BDB9CDC0BEC4B3B5CBBABDC5B6B6C3B1B6C6B8BBC7B8BECABBBECBBCBAC7BCBE
        BCABA9CABBBCCABCBAD1C3C6D3C7C9D8CBCBD3C5C1D4C9CDD1C6C6CBB9BCCABD
        BFD4C3C5D1C1C5D1C0C4D5C5C7CEBCC0CBBDB7D3C3C6C2B8B3CEBDBCCDC1C2D0
        C4C4CCBEC2CABDC0CBB9BAD3C4C8D0C2C2D2C0C6CAB8BBC5B3BEC7B8B7CCBDC4
        C9BBBDD0C0C7CDBEC2CEC2C6CEC3C5D5C6C4C5B7BDC9BAC1CDBEBFCFC7CAD8CB
        CFD0C0C9D5C9CFD0C4C5D5CAC8D4C5C6DACBCAD5C3C7DCD0D2D9CBCED4CCCDD6
        CACDDACED1D9CFCFD0C4C4DFD6D8DDD2D3D4C9CCDBD0CFDCD0D1DBD1D6DAD0D3
        DAD1D4D6CDD0D9CFCEDACACDD9CED2D4C4CDDAD2D1D7CFCFD4C9CCDBD6D5E0D3
        DADAD0D1D9CED0DBD0D1DFD6DAE3DCDEE4D8D8DBCBCDE0D9DBE5D9DBE1D8D8DE
        D0D2DED4D5D8CBD0E7DFDFDFD6D9E1DCDDE3DCDDE6DFDCE6DDDCE4D9D9E8DFDF
        E6DADAE6DFDEE3DCDCE8E2E7EDE6E3E8E2E2E3DBDAEDE1E3E9E0DFEBE1DFEBE2
        E0E4DADAE9E1E0EAE5E5E8E2E1F1EAEAE9DEE1E6DCDADDD1D4E4D7DCE8DEDFE5
        DBDFE9DEE1E2D6D9E7DFE1E8DEDFE2DADFE8DFE0E9E1E1E8DFDEE4D9D9ECE5E5
        EAE2E2E1D6D2E7E0E1EBE1E1E7E0E2DFD1CDE9E1E3EADFE1E9E0E3E9DBE3E7DF
        DFE4DCDCE5D9DBEBE4E6E2DBDAE7DEDEECE4E4E2D9D9E5DDE0EADEE0DED2D7E7
        E0E0E8E3E3E8E2E4E6E0DFE5DCE1E5DDDDE4DBDCE8DCDEE8DEDEEAE2E0EAE4E7
        EAE0E3F3ECEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3EBEB765B5A5F4746614748634B46624A
        4B634A4B62484D5E46465E45495C44435E49485742415942475C444961454557
        4647533C3F634B4D5B4646583F415943475C45465B4945604A4E5C474C5A464C
        584544513C435A43496249485E48475742425A45485D45475C494B5E474A5A42
        455E44495D42495742475E4C455C4346614748563F406B52535D454B604A4A59
        4446654D4F5D454C5D44475941435840425E49505A43425943475845485D454B
        5643425A494B634C4E5E4A4C5C46485840445641435841485542425943437358
        5E655353594341553E445842435945455D474A5C494B5C464D5D46455F454958
        4049624C44584246624D4A5C49465D454657414160484B5846455F43455E4849
        5C434B5C434C5744455A46465E4848523C3E614A505B46495E4646564046694D
        485844495E454B554141563F455B46495B414A5D43445A43475D474C6146486C
        565658434661494C5A41456448475F464D644A4B583E456A4D4E624D4A5F484D
        624C50634B4A63484D5C45495E4B4A5F4446624E4C664C535E4746614B4C5A43
        485F45486148496C5559604A49624D50604950654F555D4647695155614A4D67
        514E5F484C62484F5C4649614A4E5C454B62464B5C47465E484E5D474A5F454E
        5C43475C4448654B5158434661494C675056695255604648675054674E4C6148
        535B43475E4347634C50674D4C584146694D4B664E53604746624A4B5A42455F
        454D604A4C634C4E5D454A5E4A4C5E46505D45485A44455B414B60474A614748
        5E444A6C4F5377595A614950654A4D6D5756BFAEBAFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5DADC6950
        50614A495F474B5842425F494B5743415A42415B4541563E41624B515D464660
        4B4F654B495B4449624C4B5742455E4C4965504F57413F5E4749574243564043
        5740415B4848614D4F5742435C48415E4A4E543C4265484E5441455542435E46
        485640435B474557413F56404252414361494A5F484756433F594448533F425A
        45465944445E4B495941435642425E4845543F435A40425E4A4E564042594547
        573F415841475A434A583F40553C3D573E435D4A456148525A44445D46495C47
        485641445D474C563D405740435A42436045475C46455A3E43543F415D464559
        4442553F42614A4B5B43435A44425741415742445842435741445F484C58443F
        553C465A44465C45455842435542445541465D494B574144584343584341543C
        435745425844435D42435942475845455840465A46485D464A5B44495A444857
        3D3B584046594042583F426652515A42455841405C46455E47495E43435B4343
        5C434A60464758434362464A5A454355404362494A5B4242583F445C47435A42
        425A434A594345563F3F5844455A4042594145533F4560474A614B4C644A4868
        54525C474A594345563D415D41425743415C42475B4746644D4D5F474E654E4A
        5942455A43455840436A5251574343564245614B4C573E405E424254403D6147
        4D6049485E484860474B5A42456147465E48465F47415C4647634C4B59454764
        4B4D59433E5640435D454765514F55414459403E5B45455D444460464C624B4A
        6049465F4B4E60494A654E4E634A4E5D424160484D5E454462484C5C4449957D
        7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFAF9B936D5051684D4B644E4A5F47475C47485C474857
        42415C46485F48455A434B5E474560474A5A41465E4A445D454D67504F5F454B
        574045624A4A5C454C5F44455B43435D474760484A5740405B464955403F5E44
        455C424161484D5C494160494C644E525A423F563E45634648654E4D5C434A57
        4343614A4D56434760494A583D455D46475A4346664D4B6248475F49485D4446
        5B4344553E4155404260444F5744435C44455B43455C45485F464A654B515942
        45604B4C5E42445D46495743465F484B5B45495641405C44465840465E474460
        464F5640445C47485940485741426247535C4546584346594047614B4B584246
        5742465D444360444B5A45485842455B43455E4847614B50624C4A5942435B48
        495D44445D484E5B46485E47495E47485D494A62494760484D5E48465F494A5A
        40445743435E4545644A4C5A44435E4849644D4C745B5B644B475E494C5D4744
        5741415E44475A4543543D405F464A5E46435B42475C45445A4646634B485841
        3F5C4648604A47634B4C6146446046495F484B6F535561474A5E474958434263
        494D5B45495E474956404A5A4441654F465843455D47465E434769515458413F
        5D4845664D4D5D484B5F4644573D465B44445A42455740425C494662484E6954
        50553F435E4C4D5A4244593E435E444B5D4A495E46495842435D47475D44465D
        474A5942455B43445A44485B4446553D3D67514F6148485D434560494D634D4D
        5740435A42455A43445D45475B4246644C4B674A535C43435C43485D47476547
        4761484B5D4346634852D1C0C7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFCE6DEDAC3B8B8CA
        BCB7C5B8BACBC0BAD0C2BFCFC1BFC8B9B7C9BFBECFBFB9BDAEB2CDBEBCC8B7B3
        CBBAB9C7B9B3BFB2B2C9BBB8C7BAB6CBBFBBC4B8B3C4B8BDC6B9B9CCC1C0CDC5
        C2CFC3C4CABEC2CFC1C3D5CEC9CFC0C2CBBDB9C8BAB8C8BABAC0B5B0C6B1AFBF
        ADA9BEADA8C6B9B7C1B3AEC9B9B5BFB2ABC7B7B2C5B5B8C4B9B3C2B6B5C3B2B2
        BBAFA7C3B2B4BEADACC6B9B2C0ADADC4B6B5C3B5B2C0B2B0C1B1B2C5B3B9CABC
        B4C5B7BDBBAEADC8BAB6BCB2B3C6B6B3BCB1AEC1B3AFC0B3B0BEB1B4C3B6AFBF
        AEB1C8BCBCC3B5ADC1B3AEC4B3AFBCA9A5BFB2B1BEAEAAC2B1B3BDB0ADBBA7A4
        C0AEAEBFB0ABC5B6B4C3B3B3B4A4A2BAB0AEB7A8A5B9A5A6C0AFA9BFAEA6BBAD
        AEB5A19EB8A7A9B89FA3B7A8A3BCA6ADB29E9BB6A8A9B5A2A2B6A8A0B7A9A8CC
        BEB4B19C9DAF9DA0B6A6A2B9A6ACB3A3A1BBABA9B2A1A0BEACABB09D9AAC9B9B
        B4A09CB09A9BAC9B97B19EA0B2A0A4BFA9A3AF9F9EAB9E9DAE9693B49EA0A998
        93A99394AE9B99AD9A97AE9798AA9B95A99091AA9A94A38D90A99996A7968EA5
        9190AA9898AB9B97A99798AE9A97A3969AA18B8EA7908FAC999CA4968FAB9798
        A08888A49194A69395AA9791AB9892A59497A3918BA7918FA18C88A68E90A894
        93A9958EA39195A79794A19293A89694A69390A79795A99694A89896B09B99A9
        9691AD9A99AE9D98A59390AC9999A59289AE9D9EAB9B98A99794A8939AA8928D
        A99896A99796A99391AA9495AB9B95A89292AD9896AA9794AA959AAD9C96A894
        97AC9999B19C9BAB9296AD9995A89497AC9998E0D4D8FEFEFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000}
      Stretch = True
    end
  end
  object qryReport: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select  Job.*,'
      '        Operator.Operator_Name,'
      '        (select Sales_order'
      '         from Sales_Order_Line'
      '         where sales_order_line.Job = Job.Job) as Sales_Order'
      'from Job, Operator'
      'where Job = :Job and'
      'Job.Operator = Operator.Operator')
    Left = 155
    Top = 46
    ParamData = <
      item
        Name = 'Job'
        DataType = ftInteger
      end>
  end
  object qryQElements: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select Quote_element.*, '
      'worktop.description,'
      'Thickness.Thickness_mm'
      'from Quote_element, Worktop, thickness'
      'where Quote = :Quote and'
      'Quote_Element.Worktop = Worktop.Worktop and'
      'Quote_Element.Thickness = Thickness.Thickness'
      'Order By Element_number')
    Left = 240
    Top = 48
    ParamData = <
      item
        Name = 'Quote'
        DataType = ftInteger
      end>
  end
  object dtsReport: TDataSource
    DataSet = qryReport
    Left = 200
    Top = 48
  end
  object qryQCutOuts: TFDQuery
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
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Quote_Edge.*, Edge_Profile.Description'
      'from Quote_Edge, Edge_Profile'
      'where Quote = :Quote and'
      'Quote_Edge.Edge_Profile = Edge_Profile.Edge_Profile'
      'order by Edge_number')
    Left = 238
    Top = 126
    ParamData = <
      item
        Name = 'Quote'
        DataType = ftInteger
      end>
  end
  object qryQExtras: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select Quote_Extra.*, Extra_Charge.Description'
      'from Quote_Extra, Extra_Charge'
      'where Quote = :Quote and'
      'Quote_Extra.Extra_Charge = Extra_Charge.Extra_Charge')
    Left = 238
    Top = 169
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
    Left = 318
    Top = 123
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
    Left = 294
    Top = 166
    ParamData = <
      item
        Name = 'Customer'
      end>
  end
  object dtsAddress: TDataSource
    Left = 350
    Top = 123
  end
  object qryCompany: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * from company'
      'where company = 1')
    Left = 453
    Top = 95
  end
  object qrygetNotes: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from Notes'
      'where notes_code = :Notes_Code')
    Left = 406
    Top = 61
    ParamData = <
      item
        Name = 'Notes_Code'
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
    Left = 544
    Top = 193
  end
end
