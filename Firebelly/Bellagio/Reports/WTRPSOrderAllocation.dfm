object frmWTRPSOrderAllocation: TfrmWTRPSOrderAllocation
  Left = 238
  Top = 104
  Caption = 'Sales Order/Job Allocation Sheet'
  ClientHeight = 552
  ClientWidth = 997
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
    Left = 32
    Top = 184
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
    PrevInitialZoom = qrZoom100
    PreviewDefaultSaveType = stPDF
    PreviewLeft = 0
    PreviewTop = 0
    object qrbPageHeader: TQRBand
      Left = 47
      Top = 47
      Width = 898
      Height = 184
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        389.466666666666700000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object qrlblSOCaption: TQRLabel
        Left = 679
        Top = 0
        Width = 212
        Height = 54
        Size.Values = (
          114.300000000000000000
          1437.216666666667000000
          0.000000000000000000
          448.733333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Job Sheet'
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
      object memAddress: TQRRichText
        Left = 250
        Top = 50
        Width = 641
        Height = 20
        Enabled = False
        Size.Values = (
          42.333333333333330000
          529.166666666666700000
          105.833333333333300000
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
      object qriHeadLogo: TQRImage
        Left = 15
        Top = 10
        Width = 225
        Height = 150
        Size.Values = (
          317.500000000000000000
          31.750000000000000000
          21.166666666666670000
          476.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Stretch = True
      end
    end
    object qrsdFitterDateTimes: TQRSubDetail
      Left = 47
      Top = 302
      Width = 898
      Height = 390
      AlignToBottom = False
      BeforePrint = qrsdFitterDateTimesBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        825.500000000000000000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpDetails
      DataSet = qryReport
      PrintBefore = False
      PrintIfEmpty = True
      object gtQRShape1: TQRShape
        Left = 10
        Top = 286
        Width = 884
        Height = 61
        Size.Values = (
          129.645833333333300000
          21.166666666666670000
          605.895833333333300000
          1870.604166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape3: TQRShape
        Left = 10
        Top = 216
        Width = 884
        Height = 61
        Size.Values = (
          129.645833333333300000
          21.166666666666670000
          457.729166666666700000
          1870.604166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRDBText4: TQRDBText
        Left = 19
        Top = 252
        Width = 251
        Height = 19
        Size.Values = (
          39.687500000000000000
          39.687500000000000000
          534.458333333333300000
          531.812500000000000000)
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
        FontSize = 8
      end
      object QRLabel5: TQRLabel
        Left = 19
        Top = 224
        Width = 134
        Height = 19
        Size.Values = (
          40.216666666666670000
          40.216666666666670000
          474.133333333333300000
          283.633333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer Reference:'
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
        FontSize = 8
      end
      object QRLabel1: TQRLabel
        Left = 20
        Top = 66
        Width = 69
        Height = 21
        Size.Values = (
          44.450000000000000000
          42.333333333333330000
          139.700000000000000000
          146.050000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qrlblFitDateLabel: TQRLabel
        Left = 591
        Top = 222
        Width = 53
        Height = 19
        Size.Values = (
          40.216666666666670000
          1250.950000000000000000
          469.900000000000000000
          112.183333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fit date:'
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
        FontSize = 8
      end
      object qrlblTemplateDateLabel: TQRLabel
        Left = 291
        Top = 222
        Width = 97
        Height = 19
        Size.Values = (
          40.216666666666670000
          615.950000000000000000
          469.900000000000000000
          205.316666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Template date:'
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
        FontSize = 8
      end
      object QRShape1: TQRShape
        Left = 10
        Top = 38
        Width = 410
        Height = 171
        Size.Values = (
          362.479166666666700000
          21.166666666666670000
          79.375000000000000000
          867.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrmAddress: TQRMemo
        Left = 18
        Top = 64
        Width = 361
        Height = 131
        Size.Values = (
          277.812500000000000000
          37.041666666666670000
          134.937500000000000000
          764.645833333333300000)
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
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object gtQRShape2: TQRShape
        Left = 475
        Top = 38
        Width = 420
        Height = 171
        Size.Values = (
          362.479166666666700000
          1005.416666666667000000
          79.375000000000000000
          889.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrmSiteAddress: TQRMemo
        Left = 490
        Top = 64
        Width = 361
        Height = 142
        Size.Values = (
          301.625000000000000000
          1037.166666666667000000
          134.937500000000000000
          764.645833333333300000)
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
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object gtQRShape4: TQRShape
        Left = 276
        Top = 216
        Width = 11
        Height = 61
        Size.Values = (
          129.645833333333300000
          584.729166666666700000
          457.729166666666700000
          23.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRShape5: TQRShape
        Left = 566
        Top = 216
        Width = 11
        Height = 61
        Size.Values = (
          129.645833333333300000
          1198.562500000000000000
          457.729166666666700000
          23.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRShape6: TQRShape
        Left = 10
        Top = 243
        Width = 884
        Height = 6
        Size.Values = (
          13.229166666666670000
          21.166666666666670000
          513.291666666666700000
          1870.604166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRLabel2: TQRLabel
        Left = 18
        Top = 42
        Width = 61
        Height = 20
        Size.Values = (
          42.333333333333330000
          38.100000000000000000
          88.900000000000000000
          129.116666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer'
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
        FontSize = 8
      end
      object gtQRLabel3: TQRLabel
        Left = 490
        Top = 42
        Width = 71
        Height = 20
        Size.Values = (
          42.333333333333330000
          1037.166666666667000000
          88.900000000000000000
          150.283333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Installation'
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
        FontSize = 8
      end
      object qrlblTemplateDate: TQRLabel
        Left = 290
        Top = 251
        Width = 105
        Height = 20
        Size.Values = (
          42.333333333333330000
          613.833333333333300000
          531.283333333333300000
          222.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblTemplateDate'
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
        FontSize = 8
      end
      object qrlblDateRequired: TQRLabel
        Left = 590
        Top = 251
        Width = 103
        Height = 20
        Size.Values = (
          42.333333333333330000
          1248.833333333333000000
          531.283333333333300000
          218.016666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblDateRequired'
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
        FontSize = 8
      end
      object gtQRDBText2: TQRDBText
        Left = 19
        Top = 293
        Width = 863
        Height = 19
        Size.Values = (
          39.687500000000000000
          39.687500000000000000
          619.125000000000000000
          1825.625000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = qryReport
        DataField = 'Descriptive_Reference'
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
        FontSize = 8
      end
      object gtQRShape9: TQRShape
        Left = 10
        Top = 3
        Width = 411
        Height = 31
        Size.Values = (
          66.145833333333330000
          21.166666666666670000
          5.291666666666667000
          870.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape10: TQRShape
        Left = 125
        Top = 3
        Width = 11
        Height = 31
        Size.Values = (
          66.145833333333330000
          264.583333333333300000
          5.291666666666667000
          23.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRLabel6: TQRLabel
        Left = 23
        Top = 9
        Width = 100
        Height = 21
        Size.Values = (
          44.450000000000000000
          48.683333333333330000
          19.050000000000000000
          211.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sales Order:'
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
        Left = 145
        Top = 9
        Width = 98
        Height = 21
        Size.Values = (
          44.450000000000000000
          306.916666666666700000
          19.050000000000000000
          207.433333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Sales_Order'
        Font.Charset = ANSI_CHARSET
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
      object gtQRShape15: TQRShape
        Left = 476
        Top = 3
        Width = 417
        Height = 31
        Size.Values = (
          66.145833333333330000
          1008.062500000000000000
          5.291666666666667000
          883.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel7: TQRLabel
        Left = 489
        Top = 9
        Width = 36
        Height = 21
        Size.Values = (
          44.450000000000000000
          1035.050000000000000000
          19.050000000000000000
          76.200000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Job:'
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
      object gtQRDBText6: TQRDBText
        Left = 611
        Top = 9
        Width = 30
        Height = 21
        Size.Values = (
          44.450000000000000000
          1293.283333333333000000
          19.050000000000000000
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
      object gtQRShape16: TQRShape
        Left = 595
        Top = 3
        Width = 11
        Height = 31
        Size.Values = (
          66.145833333333330000
          1259.416666666667000000
          5.291666666666667000
          23.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsVertLine
        VertAdjust = 0
      end
    end
    object qrgFitter: TQRGroup
      Left = 47
      Top = 231
      Width = 898
      Height = 3
      AlignToBottom = False
      Enabled = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        6.350000000000000000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'Fitter_Name'
      Master = qrsdFitterDateTimes
      ReprintOnNewPage = False
    end
    object grpDate: TQRGroup
      Left = 47
      Top = 234
      Width = 898
      Height = 68
      AlignToBottom = False
      BeforePrint = grpDateBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        143.933333333333300000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'Date_Required'
      Master = qrsdFitterDateTimes
      ReprintOnNewPage = False
      object gtQRShape11: TQRShape
        Left = 630
        Top = 0
        Width = 261
        Height = 64
        Size.Values = (
          134.937500000000000000
          1333.500000000000000000
          0.000000000000000000
          552.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape12: TQRShape
        Left = 726
        Top = 0
        Width = 11
        Height = 64
        Size.Values = (
          134.937500000000000000
          1537.229166666667000000
          0.000000000000000000
          23.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRShape13: TQRShape
        Left = 10
        Top = 33
        Width = 411
        Height = 31
        Size.Values = (
          66.145833333333330000
          21.166666666666670000
          68.791666666666670000
          870.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape14: TQRShape
        Left = 126
        Top = 33
        Width = 8
        Height = 31
        Size.Values = (
          66.145833333333330000
          267.229166666666700000
          68.791666666666670000
          15.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object qrlblJobType: TQRLabel
        Left = 23
        Top = 39
        Width = 58
        Height = 21
        Size.Values = (
          44.450000000000000000
          48.683333333333330000
          82.550000000000000000
          122.766666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fitters:'
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
        Left = 145
        Top = 39
        Width = 96
        Height = 21
        Size.Values = (
          44.450000000000000000
          306.916666666666700000
          82.550000000000000000
          203.200000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Fitter_Name'
        Font.Charset = ANSI_CHARSET
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
      object gtQRLabel5: TQRLabel
        Left = 640
        Top = 36
        Width = 43
        Height = 21
        Size.Values = (
          44.450000000000000000
          1354.666666666667000000
          76.200000000000000000
          91.016666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date:'
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
      object gtQRDBText5: TQRDBText
        Left = 745
        Top = 36
        Width = 117
        Height = 21
        Size.Values = (
          44.450000000000000000
          1576.916666666667000000
          76.200000000000000000
          247.650000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Date_Required'
        Font.Charset = ANSI_CHARSET
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
      object gtQRShape7: TQRShape
        Left = 630
        Top = 27
        Width = 261
        Height = 6
        Size.Values = (
          13.229166666666670000
          1333.500000000000000000
          58.208333333333330000
          552.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRLabel1: TQRLabel
        Left = 640
        Top = 6
        Width = 79
        Height = 21
        Size.Values = (
          44.450000000000000000
          1354.666666666667000000
          12.700000000000000000
          167.216666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Job Type:'
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
      object gtQRDBText1: TQRDBText
        Left = 745
        Top = 6
        Width = 77
        Height = 21
        Size.Values = (
          44.450000000000000000
          1576.916666666667000000
          12.700000000000000000
          162.983333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Job_Type'
        Font.Charset = ANSI_CHARSET
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
    end
    object QRBand1: TQRBand
      Left = 47
      Top = 692
      Width = 898
      Height = 110
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        232.833333333333300000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageFooter
      object gtQRShape8: TQRShape
        Left = 10
        Top = 6
        Width = 884
        Size.Values = (
          137.583333333333300000
          21.166666666666670000
          13.229166666666670000
          1870.604166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRMemo1: TQRMemo
        Left = 20
        Top = 10
        Width = 861
        Height = 51
        Size.Values = (
          108.479166666666700000
          42.333333333333330000
          21.166666666666670000
          1822.979166666667000000)
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
        Font.Style = [fsBold]
        Lines.Strings = (
          
            'NOTE:  Pictures must be taken on site of every project and then ' +
            'e-mailed to Fiona (or send by "Whatsapp") to keep on record.  No' +
            ' excuses!!')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object gtQRSysData1: TQRSysData
        Left = 768
        Top = 80
        Width = 126
        Height = 20
        Size.Values = (
          42.333333333333330000
          1625.600000000000000000
          169.333333333333300000
          266.700000000000000000)
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
  end
  object qryReport: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT DISTINCT'
      'Sales_Order.Sales_Order,'
      'Sales_Order.Customer,'
      'Sales_Order.Reference,'
      'Sales_Order.Contact_name,'
      'Sales_Order.Order_ref_no,'
      'Sales_Order.Install_Address,'
      'Sales_Order.Inactive,'
      'Sales_Order.Customer_Name,'
      'Sales_Order.Address,'
      'Sales_Order.Install_Name,'
      'Sales_Order.Install_Phone,'
      'Sales_Order.Descriptive_Reference,'
      'Sales_Order.Template_Date AS Date_Required,'
      'Sales_Order.Template_Date,'
      'Fitter.Fitter_Name,'
      'Sales_Order_Line.Job,'
      #39'Template'#39' as Job_Type'
      'FROM (Fitter'
      '  INNER JOIN Sales_Order'
      '    ON Fitter.Fitter = Sales_Order.Templater)'
      '  INNER JOIN Sales_Order_Line'
      '    ON Sales_Order.Sales_Order = Sales_Order_Line.Sales_Order'
      'WHERE ((Sales_Order.Templater = :Fitter) or (:Fitter = 0)) AND'
      '      (Sales_Order.Supply_Only <> '#39'Y'#39') AND'
      '      (Sales_Order.Sales_Order_Status < 50) AND'
      
        '      ((Sales_Order.Template_Date >= :Date_From) AND (Sales_Orde' +
        'r.Template_Date <= :Date_To))'
      'UNION ALL'
      'SELECT DISTINCT'
      'Sales_Order.Sales_Order,'
      'Sales_Order.Customer,'
      'Sales_Order.Reference,'
      'Sales_Order.Contact_name,'
      'Sales_Order.Order_ref_no,'
      'Sales_Order.Install_Address,'
      'Sales_Order.Inactive,'
      'Sales_Order.Customer_Name,'
      'Sales_Order.Address,'
      'Sales_Order.Install_Name,'
      'Sales_Order.Install_Phone,'
      'Sales_Order.Descriptive_Reference,'
      'Sales_Order.Date_Required,'
      'Sales_Order.Template_Date,'
      'Fitter.Fitter_Name,'
      'Sales_Order_Line.Job,'
      #39'Fitting'#39' as Job_Type'
      'FROM (Fitter'
      '  INNER JOIN Sales_Order'
      '    ON Fitter.Fitter = Sales_Order.Fitter)'
      '  INNER JOIN Sales_Order_Line'
      '    ON Sales_Order.Sales_Order = Sales_Order_Line.Sales_Order'
      'WHERE ((Sales_Order.Templater = :Fitter) or (:Fitter = 0)) AND'
      '      (Sales_Order.Supply_Only <> '#39'Y'#39') AND'
      
        '      ((Sales_Order.Sales_Order_Status >= 50) AND (Sales_Order.S' +
        'ales_Order_Status < 100)) AND'
      
        '      ((Sales_Order.Date_Required >= :Date_From) AND (Sales_Orde' +
        'r.Date_Required <= :Date_To))'
      'UNION ALL'
      'SELECT DISTINCT'
      'Sales_Order.Sales_Order,'
      'Sales_Order.Customer,'
      'Sales_Order.Reference,'
      'Sales_Order.Contact_name,'
      'Sales_Order.Order_ref_no,'
      'Sales_Order.Install_Address,'
      'Sales_Order.Inactive,'
      'Sales_Order.Customer_Name,'
      'Sales_Order.Address,'
      'Sales_Order.Install_Name,'
      'Sales_Order.Install_Phone,'
      'Sales_Order.Descriptive_Reference,'
      'Sales_Order.Date_Required,'
      'Sales_Order.Template_Date,'
      'Fitter.Fitter_Name,'
      'Sales_Order_Line.Job,'
      #39'Supply Only'#39' as Job_Type'
      'FROM (Fitter'
      '  INNER JOIN Sales_Order'
      '    ON Fitter.Fitter = Sales_Order.Fitter)'
      '  INNER JOIN Sales_Order_Line'
      '    ON Sales_Order.Sales_Order = Sales_Order_Line.Sales_Order'
      'WHERE ((Sales_Order.Templater = :Fitter) or (:Fitter = 0)) AND'
      '      (Sales_Order.Supply_Only = '#39'Y'#39') AND'
      
        '      ((Sales_Order.Sales_Order_Status >= 10) AND (Sales_Order.S' +
        'ales_Order_Status < 100)) AND'
      
        '      ((Sales_Order.Date_Required >= :Date_From) AND (Sales_Orde' +
        'r.Date_Required <= :Date_To))'
      'ORDER BY Fitter_Name, Date_Required')
    Left = 430
    Top = 30
    ParamData = <
      item
        Name = 'Fitter'
      end
      item
        Name = 'Fitter'
      end
      item
        Name = 'Date_From'
      end
      item
        Name = 'Date_To'
      end
      item
        Name = 'Fitter'
      end
      item
        Name = 'Fitter'
      end
      item
        Name = 'Date_From'
      end
      item
        Name = 'Date_To'
      end
      item
        Name = 'Fitter'
      end
      item
        Name = 'Fitter'
      end
      item
        Name = 'Date_From'
      end
      item
        Name = 'Date_To'
      end>
  end
  object dtsAddress: TDataSource
    Left = 718
    Top = 19
  end
  object qryAddress: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select *'
      'from Address'
      'where Address = :Address')
    Left = 558
    Top = 27
    ParamData = <
      item
        Name = 'Address'
      end>
  end
  object qryCustomer: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT'
      '      Customer,'
      '      Customer_name,'
      '      Street,'
      '      Locale,'
      '      Town_City,'
      '      postcode,'
      '      County_State,'
      '      Vat.Vat_Rate,'
      '      Telephone_Number,'
      '      Email_Address,'
      '      Credit_Status,'
      '      Payment_Terms.Payment_Terms_Description'
      'FROM Payment_Terms'
      '    RIGHT JOIN (Vat'
      '    INNER JOIN Customer'
      '      ON Vat.Vat = Customer.Vat)'
      '      ON Payment_Terms.Payment_Terms = Customer.Payment_Terms'
      'WHERE Customer = :Customer')
    Left = 486
    Top = 30
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
      end>
  end
  object qryCompanyAddress: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Street,'
      'Locale,'
      'Town_City,'
      'County_State,'
      'Postcode,'
      'Telephone_number,'
      'Fax_Number, '
      'Company_Name,'
      'VAT_Number,'
      'Email_Address,'
      'Web_Address '
      'from Company')
    Left = 432
    Top = 97
  end
  object qryCompany: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * from company'
      'where company = 1')
    Left = 694
    Top = 7
  end
  object qrygetNotes: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from Notes'
      'where notes_code = :Notes_Code'
      'order by notes_code, notes_line')
    Left = 622
    Top = 15
    ParamData = <
      item
        Name = 'Notes_Code'
      end>
  end
end
