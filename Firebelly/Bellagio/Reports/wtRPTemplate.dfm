object frmwtRPTemplate: TfrmwtRPTemplate
  Left = 106
  Top = 118
  Caption = 'Template Check List'
  ClientHeight = 707
  ClientWidth = 1349
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
    Left = 232
    Top = 8
    Width = 992
    Height = 1403
    ShowingPreview = False
    BeforePrint = qrpDetailsBeforePrint
    DataSet = qryReport
    Font.Charset = ANSI_CHARSET
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
    ReportTitle = 'Template Check List'
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
      Top = 47
      Width = 898
      Height = 1285
      AfterPrint = qrgQuoteAfterPrint
      AlignToBottom = False
      BeforePrint = qrgQuoteBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        2719.916666666667000000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'quote'
      Master = qrpDetails
      ReprintOnNewPage = False
      object gtQRShape4: TQRShape
        Left = 476
        Top = 195
        Width = 420
        Height = 156
        Size.Values = (
          330.729166666666700000
          1008.062500000000000000
          412.750000000000000000
          889.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Color = clMedGray
        Pen.Width = 3
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape14: TQRShape
        Left = 476
        Top = 154
        Width = 420
        Height = 38
        Size.Values = (
          79.375000000000000000
          1008.062500000000000000
          325.437500000000000000
          889.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Color = clMedGray
        Pen.Width = 3
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape1: TQRShape
        Left = 0
        Top = 195
        Width = 471
        Height = 156
        Size.Values = (
          330.729166666666700000
          0.000000000000000000
          412.750000000000000000
          997.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Color = clMedGray
        Pen.Width = 3
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrlblTemplate: TQRLabel
        Left = 460
        Top = 10
        Width = 335
        Height = 54
        Size.Values = (
          114.300000000000000000
          973.666666666666700000
          21.166666666666670000
          709.083333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Template Checklist'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -40
        Font.Name = 'Arial'
        Font.Style = [fsUnderline]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 24
      end
      object gtQRLabel4: TQRLabel
        Left = 480
        Top = 304
        Width = 403
        Height = 23
        Size.Values = (
          48.683333333333330000
          1016.000000000000000000
          643.466666666666700000
          853.016666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Please contact customer 30 mins before arrival'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -18
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic, fsUnderline]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 11
      end
      object qrmSiteAddress: TQRMemo
        Left = 6
        Top = 218
        Width = 455
        Height = 130
        Size.Values = (
          275.166666666666700000
          13.229166666666670000
          460.375000000000000000
          963.083333333333300000)
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
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          '1'
          '2'
          '3'
          '4'
          '5'
          '6')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object gtQRLabel6: TQRLabel
        Left = 488
        Top = 199
        Width = 118
        Height = 21
        Size.Values = (
          44.450000000000000000
          1032.933333333333000000
          421.216666666666700000
          249.766666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Contact Name:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRDBText2: TQRDBText
        Left = 627
        Top = 199
        Width = 264
        Height = 21
        Size.Values = (
          44.979166666666670000
          1328.208333333333000000
          420.687500000000000000
          558.270833333333300000)
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
        Font.Height = -17
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
      object gtQRLabel7: TQRLabel
        Left = 488
        Top = 230
        Width = 136
        Height = 21
        Size.Values = (
          44.450000000000000000
          1032.933333333333000000
          486.833333333333300000
          287.866666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Contact Number:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRDBText3: TQRDBText
        Left = 627
        Top = 230
        Width = 264
        Height = 21
        Size.Values = (
          44.979166666666670000
          1328.208333333333000000
          486.833333333333300000
          558.270833333333300000)
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
        Font.Height = -17
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
      object qriHeadLogo: TQRImage
        Left = 0
        Top = 0
        Width = 225
        Height = 150
        Size.Values = (
          317.500000000000000000
          0.000000000000000000
          0.000000000000000000
          476.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Stretch = True
      end
      object gtQRShape9: TQRShape
        Left = 0
        Top = 154
        Width = 471
        Height = 38
        Size.Values = (
          79.375000000000000000
          0.000000000000000000
          325.437500000000000000
          997.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Color = clMedGray
        Pen.Width = 3
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel5: TQRLabel
        Left = 488
        Top = 162
        Width = 86
        Height = 21
        Size.Values = (
          44.450000000000000000
          1032.933333333333000000
          342.900000000000000000
          182.033333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Reference:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
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
        Left = 578
        Top = 164
        Width = 312
        Height = 21
        Size.Values = (
          44.979166666666670000
          1222.375000000000000000
          346.604166666666700000
          661.458333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Reference'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
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
      object qrmAddress: TQRMemo
        Left = 96
        Top = 162
        Width = 363
        Height = 21
        Size.Values = (
          44.979166666666670000
          203.729166666666700000
          343.958333333333300000
          767.291666666666700000)
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
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object gtQRShape73: TQRShape
        Left = 229
        Top = 12
        Width = 161
        Height = 126
        Size.Values = (
          267.229166666666700000
          484.187500000000000000
          26.458333333333330000
          341.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Color = clMedGray
        Pen.Width = 3
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrlblSalesOrder: TQRLabel
        Left = 221
        Top = 20
        Width = 175
        Height = 29
        Size.Values = (
          61.383333333333330000
          467.783333333333300000
          42.333333333333330000
          370.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Sales Order No:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -23
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 14
      end
      object qrlblSalesOrderNo: TQRDBText
        Left = 239
        Top = 60
        Width = 138
        Height = 29
        Size.Values = (
          61.383333333333330000
          505.883333333333300000
          127.000000000000000000
          292.100000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Sales_Order'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -23
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 14
      end
      object gtQRRichText1: TQRRichText
        Left = 396
        Top = 62
        Width = 494
        Height = 55
        Size.Values = (
          116.416666666666700000
          838.200000000000000000
          131.233333333333300000
          1045.633333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AutoStretch = False
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -18
        Font.Name = 'Arial'
        Font.Style = [fsItalic]
        HiresExport = False
        Transparent = False
        YIncrement = 50
        Lines.Strings = (
          'Bellagio templater to complete all areas where indicated and '
          'return with job photos on completion to: ')
      end
      object gtQRLabel11: TQRLabel
        Left = 396
        Top = 124
        Width = 271
        Height = 23
        Size.Values = (
          48.683333333333330000
          838.200000000000000000
          262.466666666666700000
          573.616666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'templates@bellagiostone.co.uk'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -18
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 11
      end
      object gtQRLabel2: TQRLabel
        Left = 6
        Top = 162
        Width = 84
        Height = 21
        Size.Values = (
          44.450000000000000000
          12.700000000000000000
          342.900000000000000000
          177.800000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel5: TQRLabel
        Left = 6
        Top = 196
        Width = 72
        Height = 21
        Size.Values = (
          44.450000000000000000
          12.700000000000000000
          414.866666666666700000
          152.400000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Address:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape3: TQRShape
        Left = 324
        Top = 436
        Width = 571
        Height = 50
        Size.Values = (
          105.833333333333300000
          685.800000000000000000
          922.866666666666700000
          1208.616666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Color = clMedGray
        Pen.Width = 3
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape5: TQRShape
        Left = 0
        Top = 356
        Width = 896
        Height = 75
        Size.Values = (
          158.750000000000000000
          0.000000000000000000
          754.062500000000000000
          1897.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Color = clMedGray
        Pen.Width = 3
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape6: TQRShape
        Left = 0
        Top = 436
        Width = 321
        Height = 50
        Size.Values = (
          105.833333333333300000
          0.000000000000000000
          922.866666666666700000
          679.450000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Color = clMedGray
        Pen.Width = 3
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel1: TQRLabel
        Left = 9
        Top = 359
        Width = 461
        Height = 21
        HelpType = htKeyword
        Size.Values = (
          44.450000000000000000
          19.050000000000000000
          759.883333333333300000
          975.783333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Job Description (see spec page for quoted requirements): '
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRDBText5: TQRDBText
        Left = 9
        Top = 379
        Width = 871
        Height = 48
        Size.Values = (
          100.541666666666700000
          18.520833333333330000
          801.687500000000000000
          1844.145833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Description'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
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
      object gtQRLabel3: TQRLabel
        Left = 6
        Top = 439
        Width = 96
        Height = 21
        Size.Values = (
          44.450000000000000000
          12.700000000000000000
          929.216666666666700000
          203.200000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Edge Detail:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel8: TQRLabel
        Left = 327
        Top = 439
        Width = 76
        Height = 21
        Size.Values = (
          44.450000000000000000
          692.150000000000000000
          929.216666666666700000
          160.866666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Worktop:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
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
        Left = 0
        Top = 490
        Width = 896
        Height = 184
        Size.Values = (
          389.466666666666700000
          0.000000000000000000
          1037.166666666667000000
          1896.533333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Color = clMedGray
        Pen.Width = 3
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrlblEdgeDetail: TQRLabel
        Left = 108
        Top = 439
        Width = 204
        Height = 42
        Size.Values = (
          88.900000000000000000
          228.600000000000000000
          929.216666666666700000
          431.800000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'qrlblEdgeDetail'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object qrlblColour: TQRLabel
        Left = 408
        Top = 439
        Width = 481
        Height = 42
        Size.Values = (
          88.900000000000000000
          863.600000000000000000
          929.216666666666700000
          1018.116666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlblColour'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object gtQRShape8: TQRShape
        Left = 0
        Top = 680
        Width = 896
        Height = 297
        Size.Values = (
          628.650000000000000000
          0.000000000000000000
          1439.333333333333000000
          1896.533333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Color = clMedGray
        Pen.Width = 3
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel9: TQRLabel
        Left = 6
        Top = 492
        Width = 310
        Height = 21
        Size.Values = (
          44.450000000000000000
          12.700000000000000000
          1041.400000000000000000
          656.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cut Out Details (e.g. sink, hob, popup):'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel10: TQRLabel
        Left = 6
        Top = 683
        Width = 195
        Height = 25
        Size.Values = (
          52.916666666666670000
          12.700000000000000000
          1445.683333333333000000
          412.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Additional Template Info:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRRichText2: TQRRichText
        Left = 3
        Top = 993
        Width = 890
        Height = 25
        Size.Values = (
          52.916666666666670000
          6.350000000000000000
          2101.850000000000000000
          1883.833333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AutoStretch = False
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsItalic]
        HiresExport = False
        Transparent = False
        YIncrement = 50
        Lines.Strings = (
          'Templater - '
          'Please '
          'complete the '
          'below fields in '
          'full & '
          'photograph '
          'as required.')
      end
      object gtQRShape33: TQRShape
        Left = 0
        Top = 1055
        Width = 895
        Height = 226
        Frame.Color = clRed
        Frame.Width = 3
        Size.Values = (
          478.895833333333300000
          0.000000000000000000
          2233.083333333333000000
          1894.416666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Color = clRed
        Pen.Width = 3
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape7: TQRShape
        Left = 3
        Top = 1028
        Width = 891
        Height = 25
        Frame.Style = psClear
        Size.Values = (
          52.916666666666670000
          5.291666666666667000
          2174.875000000000000000
          1886.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Brush.Color = clBtnFace
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel12: TQRLabel
        Left = 6
        Top = 1030
        Width = 247
        Height = 21
        Size.Values = (
          44.450000000000000000
          12.700000000000000000
          2180.166666666667000000
          522.816666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Templates as per quoted spec?'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel13: TQRLabel
        Left = 346
        Top = 1030
        Width = 538
        Height = 21
        Size.Values = (
          44.450000000000000000
          732.366666666666700000
          2180.166666666667000000
          1138.766666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          'Yes               No               (Please note alterations on t' +
          'emplate notes)'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrrchApplianceDetails: TQRMemo
        Left = 6
        Top = 515
        Width = 885
        Height = 154
        Size.Values = (
          325.966666666666700000
          12.700000000000000000
          1090.083333333333000000
          1873.250000000000000000)
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
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object qrrchTextNotes: TQRMemo
        Left = 6
        Top = 711
        Width = 881
        Height = 259
        Size.Values = (
          548.216666666666700000
          12.700000000000000000
          1504.950000000000000000
          1864.783333333333000000)
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
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object gtQRLabel40: TQRLabel
        Left = 488
        Top = 261
        Width = 116
        Height = 21
        Size.Values = (
          44.450000000000000000
          1032.933333333333000000
          552.450000000000000000
          245.533333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Contact Email:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblInstallEmail: TQRLabel
        Left = 627
        Top = 261
        Width = 107
        Height = 21
        Size.Values = (
          44.450000000000000000
          1327.150000000000000000
          552.450000000000000000
          226.483333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Contact Email:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object gtQRRichText9: TQRRichText
        Left = 6
        Top = 1189
        Width = 165
        Height = 23
        Size.Values = (
          47.625000000000000000
          13.229166666666670000
          2516.187500000000000000
          349.250000000000000000)
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
        Font.Style = [fsBold]
        HiresExport = False
        Transparent = False
        YIncrement = 50
        Lines.Strings = (
          'Signed '
          '(Customer):')
      end
      object gtQRRichText12: TQRRichText
        Left = 6
        Top = 1244
        Width = 165
        Height = 23
        Size.Values = (
          47.625000000000000000
          13.229166666666670000
          2632.604166666667000000
          349.250000000000000000)
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
        Font.Style = [fsBold]
        HiresExport = False
        Transparent = False
        YIncrement = 50
        Lines.Strings = (
          'Templater '
          'Name:')
      end
      object gtQRRichText10: TQRRichText
        Left = 416
        Top = 1189
        Width = 165
        Height = 23
        Size.Values = (
          47.625000000000000000
          881.062500000000000000
          2516.187500000000000000
          349.250000000000000000)
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
        Font.Style = [fsBold]
        HiresExport = False
        Transparent = False
        YIncrement = 50
        Lines.Strings = (
          'Name:')
      end
      object gtQRLabel39: TQRLabel
        Left = 728
        Top = 1190
        Width = 43
        Height = 21
        Size.Values = (
          44.450000000000000000
          1540.933333333333000000
          2518.833333333333000000
          91.016666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRMemo4: TQRMemo
        Left = 6
        Top = 1064
        Width = 159
        Height = 21
        Size.Values = (
          44.450000000000000000
          12.700000000000000000
          2252.133333333333000000
          336.550000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Lines.Strings = (
          'Customer Approval:')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object gtQRMemo5: TQRMemo
        Left = 6
        Top = 1094
        Width = 779
        Height = 68
        Size.Values = (
          143.933333333333300000
          12.700000000000000000
          2315.633333333333000000
          1648.883333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          
            'Please proceed with production based on the details outlined abo' +
            've and within the worksurface templates.'
          
            'All specification changes will be re priced and a revised quote ' +
            'will require approval prior to fabrication.'
          
            'No further alterations will be made to the kitchen units, walls ' +
            'or floors prior to installation of the worksurface.')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
    end
    object QRBand1: TQRBand
      Left = 47
      Top = 1651
      Width = 898
      Height = 25
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.916666666666670000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageFooter
      object gtQRSysData1: TQRSysData
        Left = 767
        Top = 3
        Width = 117
        Height = 20
        Size.Values = (
          42.333333333333330000
          1623.483333333333000000
          6.350000000000000000
          247.650000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsDateTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = 'Printed: '
        Transparent = False
        ExportAs = exptText
        VerticalAlignment = tlTop
        FontSize = 8
      end
    end
    object qrsdSOLines: TQRSubDetail
      Left = 47
      Top = 1573
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
      Master = qrpDetails
      DataSet = qrySOLine
      FooterBand = qrbAdditionalItemsFooter
      HeaderBand = qrbAdditionalItemsHeader
      PrintBefore = False
      PrintIfEmpty = True
      object gtQRDBText5: TQRDBText
        Left = 717
        Top = 9
        Width = 61
        Height = 21
        Size.Values = (
          44.450000000000000000
          1517.650000000000000000
          19.050000000000000000
          129.116666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySOLine
        DataField = 'Quantity'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
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
      object gtQRDBText6: TQRDBText
        Left = 8
        Top = 9
        Width = 694
        Height = 21
        Size.Values = (
          44.979166666666670000
          15.875000000000000000
          18.520833333333330000
          1468.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = qrySOLine
        DataField = 'Description'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
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
    end
    object qrbAdditionalItemsHeader: TQRBand
      Left = 47
      Top = 1332
      Width = 898
      Height = 241
      Frame.DrawBottom = True
      AlignToBottom = False
      BeforePrint = qrbAdditionalItemsHeaderBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        510.116666666666700000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupHeader
      object gtQRShape44: TQRShape
        Left = 476
        Top = 159
        Width = 420
        Height = 38
        Size.Values = (
          79.375000000000000000
          1008.062500000000000000
          336.020833333333300000
          889.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Color = clMedGray
        Pen.Width = 3
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape43: TQRShape
        Left = 0
        Top = 159
        Width = 471
        Height = 38
        Size.Values = (
          79.375000000000000000
          0.000000000000000000
          336.020833333333300000
          997.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Color = clMedGray
        Pen.Width = 3
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape42: TQRShape
        Left = 229
        Top = 12
        Width = 161
        Height = 126
        Size.Values = (
          267.229166666666700000
          484.187500000000000000
          26.458333333333330000
          341.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Color = clMedGray
        Pen.Width = 3
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qriHeadlogo1: TQRImage
        Left = 0
        Top = 0
        Width = 225
        Height = 150
        Size.Values = (
          317.500000000000000000
          0.000000000000000000
          0.000000000000000000
          476.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Stretch = True
      end
      object gtQRLabel33: TQRLabel
        Left = 243
        Top = 20
        Width = 131
        Height = 29
        Size.Values = (
          61.383333333333330000
          514.350000000000000000
          42.333333333333330000
          277.283333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Sales Order'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -23
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 14
      end
      object gtQRDBText1: TQRDBText
        Left = 239
        Top = 60
        Width = 138
        Height = 29
        Size.Values = (
          61.383333333333330000
          505.883333333333300000
          127.000000000000000000
          292.100000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Sales_Order'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -23
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 14
      end
      object gtQRLabel34: TQRLabel
        Left = 6
        Top = 168
        Width = 84
        Height = 21
        Size.Values = (
          44.450000000000000000
          12.700000000000000000
          355.600000000000000000
          177.800000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel35: TQRLabel
        Left = 488
        Top = 168
        Width = 86
        Height = 21
        Size.Values = (
          44.450000000000000000
          1032.933333333333000000
          355.600000000000000000
          182.033333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Reference:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRDBText4: TQRDBText
        Left = 578
        Top = 168
        Width = 312
        Height = 21
        Size.Values = (
          44.979166666666670000
          1222.375000000000000000
          354.541666666666700000
          661.458333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Reference'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
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
      object gtQRLabel36: TQRLabel
        Left = 530
        Top = 10
        Width = 279
        Height = 54
        Size.Values = (
          114.300000000000000000
          1121.833333333333000000
          21.166666666666670000
          590.550000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Additional Items'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -40
        Font.Name = 'Arial'
        Font.Style = [fsUnderline]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 24
      end
      object gtQRLabel37: TQRLabel
        Left = 6
        Top = 213
        Width = 91
        Height = 21
        Size.Values = (
          44.450000000000000000
          12.700000000000000000
          450.850000000000000000
          192.616666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Description'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel38: TQRLabel
        Left = 716
        Top = 213
        Width = 68
        Height = 21
        Size.Values = (
          44.450000000000000000
          1515.533333333333000000
          450.850000000000000000
          143.933333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Quantity'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblCustomerName: TQRLabel
        Left = 96
        Top = 168
        Width = 365
        Height = 21
        Size.Values = (
          44.979166666666670000
          203.729166666666700000
          354.541666666666700000
          772.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlblCustomerName'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object gtQRMemo6: TQRMemo
        Left = 400
        Top = 80
        Width = 501
        Height = 61
        Size.Values = (
          129.116666666666700000
          846.666666666666700000
          169.333333333333300000
          1060.450000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -18
        Font.Name = 'Arial'
        Font.Style = [fsItalic]
        Lines.Strings = (
          'The items below are to be supplied with this order, along with '
          'those stated within the standard spec sheet.')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 11
      end
    end
    object qrbAdditionalItemsFooter: TQRBand
      Left = 47
      Top = 1612
      Width = 898
      Height = 39
      Frame.DrawBottom = True
      Frame.Width = 2
      AlignToBottom = False
      BeforePrint = qrbAdditionalItemsFooterBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        82.550000000000000000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object qrlblAdditionalItems: TQRLabel
        Left = 6
        Top = 3
        Width = 277
        Height = 23
        Size.Values = (
          48.683333333333330000
          12.700000000000000000
          6.350000000000000000
          586.316666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'No additional items to be supplied'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -18
        Font.Name = 'Arial'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 11
      end
    end
  end
  object qryReport: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT TOP 1'
      '        sales_order_line.quote,'
      '        sales_order_line.description,'
      '        Sales_Order.customer_name,'
      '        Sales_Order.reference,'
      '        Sales_Order.address,'
      '        Sales_Order.customer,'
      '        Sales_Order.contact_name,'
      '        Sales_order_line.Sales_order,'
      '        Sales_Order.Install_address,'
      '        Sales_Order.Install_Name,'
      '        Sales_order.Install_Phone,'
      '        Sales_Order.Account_Manager,'
      '        Sales_Order.Extra_Notes,'
      '        Sales_Order.Appliance_Details,'
      '        Sales_Order.Revenue_Centre,'
      '        Operator.Operator_Name as Account_Manager_Name,'
      '        Operator.Telephone_number'
      'FROM Operator'
      '      RIGHT JOIN ((Sales_Order'
      '      INNER JOIN Sales_Order_Line'
      
        '        ON Sales_Order.Sales_Order = Sales_Order_Line.Sales_Orde' +
        'r)'
      '      LEFT JOIN Quote'
      '        ON Sales_Order_Line.Quote = Quote.Quote)'
      '        ON Operator.Operator = Sales_Order.Account_Manager'
      
        'WHERE sales_order_line.sales_order = :sales_order AND Sales_Orde' +
        'r_Line.quote <> 0'
      'ORDER BY sales_order_line.quote')
    Left = 1091
    Top = 118
    ParamData = <
      item
        Name = 'sales_order'
      end>
  end
  object dtsReport: TDataSource
    DataSet = qryReport
    Left = 1024
    Top = 64
  end
  object qryAddress: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select *'
      'from Address'
      'where Address = :Address')
    Left = 1030
    Top = 299
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
      'Credit_Status,'
      'Telephone_number'
      'from Customer, VAT'
      'where Customer = :Customer and'
      'Customer.VAT = Vat.Vat')
    Left = 1054
    Top = 334
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
      end>
  end
  object dtsAddress: TDataSource
    Left = 1030
    Top = 235
  end
  object qryCompany: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * from company'
      'where company = 1')
    Left = 1150
    Top = 167
  end
  object qrygetNotes: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from Notes'
      'where notes_code = :Notes_Code'
      'order by notes_code, notes_line')
    Left = 1102
    Top = 53
    ParamData = <
      item
        Name = 'Notes_Code'
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
    Left = 1174
    Top = 392
    ParamData = <
      item
        Name = 'End_User'
      end>
  end
  object qryQuote: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Quote.Quote,'
      '        Quote.description,'
      '        quote.customer_name,'
      '        quote.reference,'
      '        quote.address,'
      '        quote.customer,'
      '        quote.contact_name,'
      '        0 as Sales_order,'
      '        Quote.Install_address,'
      '        Quote,Install_Name,'
      '        Quote.Install_Phone,'
      '        Quote.Account_Manager,'
      '        Quote.Extra_Notes,'
      '        '#39#39' as Appliance_Details,'
      '        Quote.Revenue_Centre,'
      '        Operator.Operator_Name as Account_Manager_Name,'
      '        Operator.Telephone_number'
      'FROM Operator'
      '      RIGHT JOIN Quote'
      '        ON Operator.Operator = Quote.Account_Manager'
      'WHERE Quote.Quote = :Quote'
      'ORDER BY Quote.Quote')
    Left = 1107
    Top = 238
    ParamData = <
      item
        Name = 'Quote'
      end>
  end
  object qryQuoteEdge: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Quote_Edge.Quote,'
      '        Quote_Edge.Edge_number,'
      '        Quote_Edge.Edge_profile,'
      '        Edge_profile.Description'
      'FROM Edge_profile'
      '      INNER JOIN Quote_Edge'
      '      ON Edge_profile.Edge_profile = Quote_Edge.Edge_profile'
      'WHERE Quote = :Quote'
      'ORDER BY Quote, Edge_Number')
    Left = 1107
    Top = 302
    ParamData = <
      item
        Name = 'Quote'
      end>
  end
  object qryQuoteThickness: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Quote_Element.Quote,'
      '        Quote_Element.Element_Number,'
      '        Quote_Element.Thickness,'
      '        Thickness.Thickness_mm'
      'FROM Quote_Element'
      '      INNER JOIN Thickness'
      '        ON Quote_Element.Thickness = Thickness.Thickness'
      'WHERE Quote = :Quote'
      'ORDER BY Quote, Element_Number')
    Left = 1107
    Top = 366
    ParamData = <
      item
        Name = 'Quote'
      end>
  end
  object qryQuoteUpstand: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Quote_Element.Quote,'
      '        Quote_Element.Element_Number,'
      '        Quote_Element.Thickness,'
      '        Thickness.Thickness_mm'
      'FROM Quote_Element'
      '    INNER JOIN Thickness'
      '        ON Quote_Element.Thickness = Thickness.Thickness'
      'WHERE Element_number > 1000 AND Quote = :Quote'
      'ORDER BY Quote, Element_Number')
    Left = 1107
    Top = 438
    ParamData = <
      item
        Name = 'Quote'
      end>
  end
  object qrySalesOrder: TFDQuery
    ConnectionName = 'Wt'
    SQL.Strings = (
      'Select Appliance_Details, Email_Address'
      'From Sales_Order'
      'Where Sales_Order = :Sales_Order')
    Left = 1176
    Top = 458
    ParamData = <
      item
        Name = 'Sales_Order'
      end>
  end
  object qrySOLine: TFDQuery
    MasterSource = dtsReport
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT Sales_Order_Line.Sales_Order,'
      '  Sales_Order_Line.Sales_order_Line_no,'
      '  Sales_Order_Line.Job,'
      '  Sales_Order_Line.Unit_price,'
      '  Sales_Order_Line.Quantity,'
      '  Sales_Order_Line.Sell_Unit,'
      
        '  ((Sales_Order_Line.Quantity / Sales_Order_Line.Sell_unit)* Sal' +
        'es_Order_Line.Unit_Price) as Total_Price,'
      '  Sales_Order_Line.Nett_Price,'
      '  Sales_Order_Line.Discount_Value,'
      '  Sales_Order_Line.Markup_Value,'
      '  Sales_Order_Line.Installation_price,'
      '  Sales_Order_Line.Survey_price,'
      '  Sales_Order_Line.Delivery_Price,'
      '  Sales_Order_Line.Description,'
      '  Sales_Order_Line.Product,'
      '  Sales_Order_Line.Quote,'
      '  Sales_Order_Line.Vat,'
      '  Vat.Vat_Rate,'
      '  Vat.Description as VAT_Description'
      'FROM Sales_Order_Line'
      '  INNER JOIN Vat ON Sales_Order_Line.Vat = Vat.Vat'
      
        'WHERE Sales_Order = :Sales_Order AND ((Sales_Order_Line.quote = ' +
        '0) or (Sales_Order_Line.quote is NULL))'
      'Order BY Sales_Order_Line_no')
    Left = 78
    Top = 296
    ParamData = <
      item
        Name = 'Sales_Order'
        DataType = ftInteger
      end>
    object qrySOLineSales_Order: TIntegerField
      FieldName = 'Sales_Order'
    end
    object qrySOLineSales_order_Line_no: TIntegerField
      FieldName = 'Sales_order_Line_no'
    end
    object qrySOLineJob: TFloatField
      FieldName = 'Job'
    end
    object qrySOLineUnit_price: TFloatField
      FieldName = 'Unit_price'
      DisplayFormat = '0.00'
    end
    object qrySOLineQuantity: TIntegerField
      FieldName = 'Quantity'
    end
    object qrySOLineSell_Unit: TIntegerField
      FieldName = 'Sell_Unit'
    end
    object qrySOLineTotal_Price: TFloatField
      FieldName = 'Total_Price'
      DisplayFormat = '0.00'
    end
    object qrySOLineNett_Price: TFloatField
      FieldName = 'Nett_Price'
      DisplayFormat = '0.00'
    end
    object qrySOLineDiscount_Value: TFloatField
      FieldName = 'Discount_Value'
      DisplayFormat = '0.00'
    end
    object qrySOLineInstallation_price: TFloatField
      FieldName = 'Installation_price'
      DisplayFormat = '0.00'
    end
    object qrySOLineSurvey_price: TFloatField
      FieldName = 'Survey_price'
      DisplayFormat = '0.00'
    end
    object qrySOLineDelivery_Price: TFloatField
      FieldName = 'Delivery_Price'
      DisplayFormat = '0.00'
    end
    object qrySOLineDescription: TWideStringField
      FieldName = 'Description'
      Size = 50
    end
    object qrySOLineProduct: TIntegerField
      FieldName = 'Product'
    end
    object qrySOLineVat: TIntegerField
      FieldName = 'Vat'
    end
    object qrySOLineVat_Rate: TFloatField
      FieldName = 'Vat_Rate'
      DisplayFormat = '0.00%'
    end
    object qrySOLineVAT_Description: TWideStringField
      FieldName = 'VAT_Description'
      Size = 40
    end
    object qrySOLineQuote: TIntegerField
      FieldName = 'Quote'
    end
    object qrySOLineMarkup_Value: TFloatField
      FieldName = 'Markup_Value'
    end
  end
  object dtsSOLine: TDataSource
    DataSet = qrySOLine
    Left = 150
    Top = 299
  end
  object qryQuoteMaterial: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT TOP 1'
      '        Quote_Element.Quote,'
      '        Quote_Element.Worktop,'
      '        Quote_Element.Thickness,'
      '        Worktop.Description AS Colour,'
      '        Material_Type.Description AS Material_Type_Desc,'
      '        Thickness.Thickness_mm'
      'FROM Material_Type'
      '        INNER JOIN (Worktop'
      '        INNER JOIN ((Thickness'
      '        INNER JOIN Worktop_thickness'
      '          ON Thickness.Thickness = Worktop_thickness.Thickness)'
      '        INNER JOIN Quote_Element'
      
        '          ON (Worktop_thickness.Thickness = Quote_Element.Thickn' +
        'ess) AND (Worktop_thickness.Worktop = Quote_Element.Worktop))'
      '          ON Worktop.Worktop = Worktop_thickness.Worktop)'
      '          ON Material_Type.Material_Type = Worktop.Material_Type'
      'WHERE (Quote_Element.Quote = :Quote)'
      'ORDER BY Quote_Element.Element_Number')
    Left = 1203
    Top = 300
    ParamData = <
      item
        Name = 'Quote'
      end>
  end
end
