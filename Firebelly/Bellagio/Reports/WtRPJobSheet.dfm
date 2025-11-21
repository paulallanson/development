object frmwtRPJobSheet: TfrmwtRPJobSheet
  Left = 295
  Top = 105
  Caption = 'Job Sheet'
  ClientHeight = 728
  ClientWidth = 1128
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Scaled = False
  OnCreate = FormCreate
  TextHeight = 13
  object qrpJobSheet: TQuickRep
    Left = 112
    Top = 42
    Width = 992
    Height = 1403
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
    PrinterSettings.Collate = 0
    PrinterSettings.ColorOption = 2
    PrintIfEmpty = True
    ReportTitle = 'Sales Order Print'
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
    object qrgJob: TQRGroup
      Left = 47
      Top = 601
      Width = 898
      Height = 3
      AlignToBottom = False
      BeforePrint = qrgJobBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        6.350000000000000000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'Job'
      FooterBand = qrbJobFooter
      Master = qrpJobSheet
      ReprintOnNewPage = False
    end
    object qrbPageHeader: TQRBand
      Left = 47
      Top = 47
      Width = 898
      Height = 554
      Frame.DrawBottom = True
      AlignToBottom = False
      BeforePrint = qrbPageHeaderBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        1172.633333333333000000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object gtQRShape3: TQRShape
        Left = 15
        Top = 179
        Width = 876
        Height = 341
        Size.Values = (
          722.312500000000000000
          31.750000000000000000
          378.354166666666700000
          1854.729166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrlblSOCaption: TQRLabel
        Left = 670
        Top = 10
        Width = 212
        Height = 54
        Size.Values = (
          114.300000000000000000
          1418.166666666667000000
          21.166666666666670000
          448.733333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
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
      object QRLabel1: TQRLabel
        Left = 21
        Top = 190
        Width = 70
        Height = 21
        Size.Values = (
          44.450000000000000000
          44.450000000000000000
          402.166666666666700000
          148.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer'
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
      object gtQRShape5: TQRShape
        Left = 15
        Top = 390
        Width = 876
        Height = 4
        Size.Values = (
          7.937500000000000000
          31.750000000000000000
          825.500000000000100000
          1854.729166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRLabel4: TQRLabel
        Left = 21
        Top = 529
        Width = 60
        Height = 20
        Size.Values = (
          42.333333333333330000
          44.450000000000000000
          1119.716666666667000000
          127.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Quantity'
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
        Left = 121
        Top = 529
        Width = 31
        Height = 20
        Size.Values = (
          42.333333333333330000
          256.116666666666700000
          1119.716666666667000000
          65.616666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Item'
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
      object qrmAddress: TQRMemo
        Left = 21
        Top = 215
        Width = 410
        Height = 136
        Size.Values = (
          288.395833333333400000
          44.979166666666670000
          455.083333333333300000
          867.833333333333500000)
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
      object QRLabel5: TQRLabel
        Left = 21
        Top = 399
        Width = 73
        Height = 21
        Size.Values = (
          44.450000000000000000
          44.450000000000000000
          844.550000000000000000
          154.516666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Reference:'
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
      object QRDBText4: TQRDBText
        Left = 150
        Top = 399
        Width = 69
        Height = 21
        Size.Values = (
          44.450000000000000000
          317.500000000000000000
          844.550000000000000000
          146.050000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Reference'
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
      object gtQRLabel7: TQRLabel
        Left = 21
        Top = 471
        Width = 75
        Height = 21
        Size.Values = (
          44.450000000000000000
          44.450000000000000000
          996.950000000000000000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Description'
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
      object gtQRDBText2: TQRDBText
        Left = 130
        Top = 471
        Width = 750
        Height = 44
        Size.Values = (
          92.604166666666680000
          275.166666666666700000
          997.479166666666900000
          1587.500000000000000000)
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
      object QRShape2: TQRShape
        Left = 520
        Top = 71
        Width = 371
        Height = 100
        Size.Values = (
          211.666666666666700000
          1100.666666666667000000
          150.812500000000000000
          785.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape3: TQRShape
        Left = 520
        Top = 99
        Width = 371
        Height = 6
        Size.Values = (
          13.229166666666670000
          1100.666666666667000000
          209.020833333333300000
          785.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape1: TQRShape
        Left = 520
        Top = 135
        Width = 371
        Height = 6
        Size.Values = (
          13.229166666666670000
          1100.666666666667000000
          285.750000000000000000
          785.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel3: TQRLabel
        Left = 531
        Top = 76
        Width = 84
        Height = 21
        Size.Values = (
          44.450000000000000000
          1123.950000000000000000
          160.866666666666700000
          177.800000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Job Number:'
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
      object QRDBText2: TQRDBText
        Left = 835
        Top = 76
        Width = 27
        Height = 21
        Size.Values = (
          44.450000000000000000
          1767.416666666667000000
          160.866666666666700000
          57.150000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Job'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel2: TQRLabel
        Left = 531
        Top = 110
        Width = 36
        Height = 21
        Size.Values = (
          44.450000000000000000
          1123.950000000000000000
          232.833333333333300000
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
      object QRDBText1: TQRDBText
        Left = 778
        Top = 110
        Width = 86
        Height = 21
        Size.Values = (
          44.450000000000000000
          1646.766666666667000000
          232.833333333333300000
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
      object gtQRLabel1: TQRLabel
        Left = 470
        Top = 190
        Width = 78
        Height = 21
        Size.Values = (
          44.450000000000000000
          994.833333333333300000
          402.166666666666700000
          165.100000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Installation'
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
      object qrmSiteAddress: TQRMemo
        Left = 470
        Top = 215
        Width = 401
        Height = 136
        Size.Values = (
          288.395833333333400000
          994.833333333333400000
          455.083333333333300000
          849.312499999999900000)
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
      object gtQRShape2: TQRShape
        Left = 15
        Top = 353
        Width = 876
        Height = 10
        Size.Values = (
          21.166666666666670000
          31.750000000000000000
          746.125000000000000000
          1854.729166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape4: TQRShape
        Left = 15
        Top = 420
        Width = 876
        Height = 10
        Size.Values = (
          21.166666666666670000
          31.750000000000000000
          889.000000000000000000
          1854.729166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape6: TQRShape
        Left = 15
        Top = 455
        Width = 876
        Height = 10
        Size.Values = (
          21.166666666666670000
          31.750000000000000000
          963.083333333333400000
          1854.729166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape7: TQRShape
        Left = 453
        Top = 180
        Width = 11
        Height = 281
        Size.Values = (
          595.312500000000000000
          957.791666666666800000
          381.000000000000000000
          23.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRLabel2: TQRLabel
        Left = 21
        Top = 432
        Width = 99
        Height = 21
        Size.Values = (
          44.450000000000000000
          44.450000000000000000
          914.400000000000000000
          209.550000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Order Number:'
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
      object gtQRDBText1: TQRDBText
        Left = 150
        Top = 432
        Width = 96
        Height = 21
        Size.Values = (
          44.450000000000000000
          317.500000000000000000
          914.400000000000000000
          203.200000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Order_Ref_No'
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
      object qrlblShowroomLabel: TQRLabel
        Left = 20
        Top = 365
        Width = 76
        Height = 21
        Size.Values = (
          44.450000000000000000
          42.333333333333330000
          772.583333333333300000
          160.866666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Showroom:'
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
      object qrlblShowroom: TQRLabel
        Left = 150
        Top = 365
        Width = 99
        Height = 21
        Size.Values = (
          44.450000000000000000
          317.500000000000000000
          772.583333333333300000
          209.550000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblShowroom'
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
      object gtQRLabel3: TQRLabel
        Left = 531
        Top = 144
        Width = 84
        Height = 21
        Size.Values = (
          44.450000000000000000
          1123.950000000000000000
          304.800000000000000000
          177.800000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sales Order:'
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
      object gtQRDBText3: TQRDBText
        Left = 772
        Top = 144
        Width = 90
        Height = 21
        Size.Values = (
          44.450000000000000000
          1634.066666666667000000
          304.800000000000000000
          190.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Sales_Order'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qrlblFitter: TQRLabel
        Left = 470
        Top = 365
        Width = 38
        Height = 21
        Size.Values = (
          44.450000000000000000
          994.833333333333300000
          772.583333333333300000
          80.433333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fitter:'
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
      object QRDBText9: TQRDBText
        Left = 600
        Top = 365
        Width = 181
        Height = 21
        Size.Values = (
          44.979166666666670000
          1270.000000000000000000
          772.583333333333400000
          383.645833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Fitter_Name'
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
      object qrlblFitterNumber: TQRLabel
        Left = 470
        Top = 399
        Width = 57
        Height = 21
        Size.Values = (
          44.450000000000000000
          994.833333333333300000
          844.550000000000000000
          120.650000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Number:'
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
      object QRDBText12: TQRDBText
        Left = 600
        Top = 399
        Width = 181
        Height = 21
        Size.Values = (
          44.979166666666670000
          1270.000000000000000000
          844.020833333333500000
          383.645833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Fitter_Number'
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
      object gtQRLabel6: TQRLabel
        Left = 470
        Top = 432
        Width = 79
        Height = 21
        Size.Values = (
          44.450000000000000000
          994.833333333333300000
          914.400000000000000000
          167.216666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fitting Date:'
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
      object gtQRDBText4: TQRDBText
        Left = 600
        Top = 432
        Width = 81
        Height = 21
        Size.Values = (
          44.979166666666670000
          1270.000000000000000000
          915.458333333333200000
          171.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Installation_date'
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
      object qriHeadLogo: TQRImage
        Left = 15
        Top = 0
        Width = 225
        Height = 150
        Size.Values = (
          317.500000000000000000
          31.750000000000000000
          0.000000000000000000
          476.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Stretch = True
      end
    end
    object qrsdJElements: TQRSubDetail
      Left = 47
      Top = 604
      Width = 898
      Height = 25
      AlignToBottom = False
      BeforePrint = qrsdJElementsBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.916666666666670000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpJobSheet
      DataSet = qryJElements
      PrintBefore = False
      PrintIfEmpty = True
      object lblWorktopArea: TQRLabel
        Left = 21
        Top = 3
        Width = 100
        Height = 20
        Size.Values = (
          42.333333333333330000
          44.450000000000000000
          6.350000000000000000
          211.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
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
      object lblWorktopSize: TQRLabel
        Left = 121
        Top = 3
        Width = 99
        Height = 21
        Size.Values = (
          44.450000000000000000
          256.116666666666700000
          6.350000000000000000
          209.550000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
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
    end
    object qrsdJCutOuts: TQRSubDetail
      Left = 47
      Top = 629
      Width = 898
      Height = 25
      AlignToBottom = False
      BeforePrint = qrsdJCutOutsBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.916666666666670000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpJobSheet
      DataSet = qryJCutOuts
      PrintBefore = False
      PrintIfEmpty = True
      object qrlblQuantity: TQRLabel
        Left = 21
        Top = 3
        Width = 82
        Height = 21
        Size.Values = (
          44.450000000000000000
          44.450000000000000000
          6.350000000000000000
          173.566666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
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
        Left = 121
        Top = 3
        Width = 631
        Height = 20
        Size.Values = (
          42.333333333333330000
          256.645833333333300000
          5.291666666666667000
          1336.145833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlblCutOut'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
    object qrsdJEdges: TQRSubDetail
      Left = 47
      Top = 654
      Width = 898
      Height = 25
      AlignToBottom = False
      BeforePrint = qrsdJEdgesBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.916666666666670000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpJobSheet
      DataSet = qryJEdges
      PrintBefore = False
      PrintIfEmpty = True
      object qrlblLength: TQRLabel
        Left = 23
        Top = 3
        Width = 72
        Height = 20
        Size.Values = (
          42.333333333333330000
          48.683333333333330000
          6.350000000000000000
          152.400000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
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
        Left = 121
        Top = 3
        Width = 631
        Height = 20
        Size.Values = (
          42.333333333333330000
          256.645833333333300000
          5.291666666666667000
          1336.145833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlblEdgeDescription'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
    object qrsdJExtras: TQRSubDetail
      Left = 47
      Top = 679
      Width = 898
      Height = 25
      AlignToBottom = False
      BeforePrint = qrsdJExtrasBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.916666666666670000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpJobSheet
      DataSet = qryJExtras
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText3: TQRDBText
        Left = 21
        Top = 4
        Width = 55
        Height = 20
        Size.Values = (
          42.333333333333330000
          44.450000000000000000
          8.466666666666667000
          116.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryJExtras
        DataField = 'Quantity'
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
      object qrlblExtraDescription: TQRLabel
        Left = 121
        Top = 4
        Width = 631
        Height = 20
        Size.Values = (
          42.333333333333330000
          256.645833333333300000
          7.937500000000000000
          1336.145833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlblExtraDescription'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
    object qrsdJRemedials: TQRSubDetail
      Left = 47
      Top = 761
      Width = 898
      Height = 25
      AlignToBottom = False
      BeforePrint = qrsdJRemedialsBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.916666666666670000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpJobSheet
      DataSet = qryJRemedials
      PrintBefore = False
      PrintIfEmpty = True
      object qrmRemedials: TQRMemo
        Left = 330
        Top = 3
        Width = 561
        Height = 20
        Size.Values = (
          42.333333333333340000
          698.500000000000000000
          5.291666666666667000
          1187.979166666667000000)
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
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object QRDBText5: TQRDBText
        Left = 200
        Top = 3
        Width = 81
        Height = 20
        Size.Values = (
          42.333333333333330000
          423.333333333333300000
          6.350000000000000000
          171.450000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryJRemedials
        DataField = 'Fitter_Name'
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
      object QRDBText7: TQRDBText
        Left = 110
        Top = 3
        Width = 91
        Height = 20
        Size.Values = (
          42.333333333333340000
          232.833333333333400000
          5.291666666666667000
          193.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryJRemedials
        DataField = 'Installation_Date'
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
    end
    object qrgJRemedials: TQRGroup
      Left = 47
      Top = 704
      Width = 898
      Height = 57
      Frame.DrawBottom = True
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        120.650000000000000000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'Remedial_Number'
      Master = qrsdJRemedials
      ReprintOnNewPage = False
      object QRLabel22: TQRLabel
        Left = 110
        Top = 30
        Width = 34
        Height = 21
        Size.Values = (
          44.450000000000000000
          232.833333333333300000
          63.500000000000000000
          71.966666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date'
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
      object QRLabel23: TQRLabel
        Left = 200
        Top = 30
        Width = 39
        Height = 21
        Size.Values = (
          44.450000000000000000
          423.333333333333300000
          63.500000000000000000
          82.550000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fitter'
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
      object QRLabel24: TQRLabel
        Left = 330
        Top = 30
        Width = 50
        Height = 21
        Size.Values = (
          44.450000000000000000
          698.500000000000000000
          63.500000000000000000
          105.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Details'
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
      object qrlblRemedial: TQRLabel
        Left = 20
        Top = 30
        Width = 75
        Height = 21
        Size.Values = (
          44.450000000000000000
          42.333333333333330000
          63.500000000000000000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Remedials'
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
    object qrcbNotes: TQRChildBand
      Left = 47
      Top = 792
      Width = 898
      Height = 225
      AlignToBottom = False
      BeforePrint = qrcbNotesBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        476.250000000000000000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = qrbJobFooter
      PrintOrder = cboAfterParent
      object gtQRShape8: TQRShape
        Left = 4
        Top = 8
        Width = 440
        Height = 204
        Size.Values = (
          431.270833333333300000
          7.937500000000000000
          15.875000000000000000
          931.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape27: TQRShape
        Left = 451
        Top = 8
        Width = 444
        Height = 204
        Size.Values = (
          431.270833333333300000
          955.145833333333300000
          15.875000000000000000
          939.270833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel12: TQRLabel
        Left = 10
        Top = 12
        Width = 132
        Height = 21
        Size.Values = (
          44.450000000000000000
          21.166666666666670000
          25.400000000000000000
          279.400000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Appliance Details:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object gtQRLabel8: TQRLabel
        Left = 455
        Top = 12
        Width = 47
        Height = 21
        Size.Values = (
          44.450000000000000000
          963.083333333333300000
          25.400000000000000000
          99.483333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Notes:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
        Left = 458
        Top = 38
        Width = 434
        Height = 164
        Size.Values = (
          346.604166666666700000
          968.375000000000000000
          79.375000000000000000
          918.104166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AutoStretch = False
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        HiresExport = False
        Transparent = False
        YIncrement = 50
      end
      object memApplianceDetails: TQRRichText
        Left = 10
        Top = 38
        Width = 426
        Height = 168
        Size.Values = (
          354.541666666666700000
          21.166666666666670000
          79.375000000000000000
          902.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AutoStretch = False
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        HiresExport = False
        Transparent = False
        YIncrement = 50
        Lines.Strings = (
          'Special Instuctions')
      end
    end
    object qrbJobFooter: TQRBand
      Left = 47
      Top = 786
      Width = 898
      Height = 6
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        12.700000000000000000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
    end
  end
  object qryReport: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Job.*,'
      '        Operator.Operator_Name,'
      '        Operator.Telephone_number,'
      '        Vat.Vat_Rate,'
      '        (select Designer_Name'
      '        from Designer'
      
        '        where Designer.Designer = Job.Designer) as Designer_Name' +
        ','
      '        (select Branch_Name'
      '        from Customer_Branch'
      '        where Customer_Branch.Customer = Job.Customer and'
      
        '              Customer_Branch.Branch_no = Job.Branch_no) as Show' +
        'room_Name,'
      '        (select Fitter_Name'
      '        from Fitter'
      '        where Fitter.Fitter = Job.Fitter) as Fitter_Name,'
      '        (select telephone_number'
      '        from Fitter'
      '        where Fitter.Fitter = Job.Fitter) as Fitter_Number,'
      '        (Select Sales_Order from'
      '         Sales_order_line'
      '         WHERE Sales_Order_Line.job = job.job) as Sales_Order,'
      '        (select Sales_order.Appliance_Details'
      '        from Sales_Order_Line, sales_Order'
      '        where sales_order_line.Job = Job.Job and'
      
        '              Sales_Order_line.sales_Order = Sales_order.sales_o' +
        'rder) as Appliance_Details,'
      '        (select Sales_order.Extra_Notes'
      '        from Sales_Order_Line, sales_Order'
      '        where sales_order_line.Job = Job.Job and'
      
        '              Sales_Order_line.sales_Order = Sales_order.sales_o' +
        'rder) as SO_Extra_Notes'
      
        'FROM Vat RIGHT JOIN (Operator INNER JOIN Job ON Operator.Operato' +
        'r = Job.Operator) ON Vat.Vat = Job.VAT'
      'where Job= :Job')
    Left = 963
    Top = 194
    ParamData = <
      item
        Name = 'Job'
        DataType = ftInteger
      end>
  end
  object dtsReport: TDataSource
    DataSet = qryReport
    Left = 1040
    Top = 195
  end
  object qryAddress: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select *'
      'from Address'
      'where Address = :Address')
    Left = 958
    Top = 119
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
      'Telephone_number, Fax_Number, email_address'
      'from Customer, VAT'
      'where Customer = :Customer and'
      'Customer.VAT = Vat.Vat')
    Left = 958
    Top = 543
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
      end>
  end
  object dtsAddress: TDataSource
    Left = 958
    Top = 487
  end
  object qryCompany: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * from company'
      'where company = 1')
    Left = 958
    Top = 267
  end
  object qrygetNotes: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from Notes'
      'where notes_code = :Notes_Code'
      'order by notes_code, notes_line')
    Left = 1046
    Top = 273
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
    Left = 966
    Top = 410
    ParamData = <
      item
        Name = 'End_User'
      end>
  end
  object qryJElements: TFDQuery
    MasterSource = dtsReport
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Job_Element.*,'
      '        Thickness.Thickness_mm,'
      '        Worktop.Description,'
      '        Material_Use.Use_Description'
      'FROM Thickness'
      '      INNER JOIN (Worktop'
      '      INNER JOIN (Worktop_thickness'
      '      INNER JOIN (Material_Use'
      '      RIGHT JOIN Job_Element'
      '        ON Material_Use.Material_Use = Job_Element.Material_Use)'
      
        '        ON (Worktop_thickness.Thickness = Job_Element.Thickness)' +
        ' AND (Worktop_thickness.Worktop = Job_Element.Worktop))'
      '        ON Worktop.Worktop = Worktop_thickness.Worktop)'
      '        ON Thickness.Thickness = Worktop_thickness.Thickness'
      'where Job = :Job'
      'Order By Element_number')
    Left = 960
    Top = 340
    ParamData = <
      item
        Name = 'Job'
      end>
  end
  object qryJCutOuts: TFDQuery
    MasterSource = dtsReport
    ConnectionName = 'WT'
    SQL.Strings = (
      'select Job_CutOut.*, CutOut.Description'
      'from Job_CutOut, CutOut'
      'where Job = :Job and'
      'Job_CutOut.CutOut = CutOut.CutOut')
    Left = 1038
    Top = 42
    ParamData = <
      item
        Name = 'Job'
      end>
  end
  object qryJEdges: TFDQuery
    MasterSource = dtsReport
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Job_Edge.*, Edge_Profile.Description'
      'from Job_Edge, Edge_Profile'
      'where Job = :Job and'
      'Job_Edge.Edge_Profile = Edge_Profile.Edge_Profile'
      'order by Edge_number')
    Left = 1038
    Top = 122
    ParamData = <
      item
        Name = 'Job'
      end>
  end
  object qryJExtras: TFDQuery
    MasterSource = dtsReport
    ConnectionName = 'WT'
    SQL.Strings = (
      'select Job_Extra.*, Extra_Charge.Description'
      'from Job_Extra, Extra_Charge'
      'where Job = :Job and'
      'Job_Extra.Extra_Charge = Extra_Charge.Extra_Charge')
    Left = 958
    Top = 53
    ParamData = <
      item
        Name = 'Job'
      end>
  end
  object Query1: TFDQuery
    MasterSource = dtsReport
    ConnectionName = 'WT'
    SQL.Strings = (
      'select Job_Extra.*, Extra_Charge.Description'
      'from Job_Extra, Extra_Charge'
      'where Job = :Job and'
      'Job_Extra.Extra_Charge = Extra_Charge.Extra_Charge')
    Left = 958
    Top = 53
    ParamData = <
      item
        Name = 'Job'
      end>
  end
  object qryJRemedials: TFDQuery
    MasterSource = dtsReport
    ConnectionName = 'WT'
    SQL.Strings = (
      'select Job_Remedial.*, Fitter.Fitter_Name'
      'from Job_Remedial, Fitter'
      'where Job= :Job and'
      'Job_Remedial.Fitter = Fitter.Fitter'
      'ORDER BY Job, Remedial_Number')
    Left = 878
    Top = 174
    ParamData = <
      item
        Name = 'Job'
      end>
  end
  object qryReportSO: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT Job.*,'
      '        Sales_Order_Line.Sales_Order,'
      '        Operator.Operator_Name,'
      '        Operator.Telephone_number,'
      '        Vat.Vat_Rate,'
      '        (select Designer_Name'
      '        from Designer'
      
        '        where Designer.Designer = Job.Designer) as Designer_Name' +
        ','
      '        (select Branch_Name'
      '        from Customer_Branch'
      '        where Customer_Branch.Customer = Job.Customer and'
      
        '              Customer_Branch.Branch_no = Job.Branch_no) as Show' +
        'room_Name,'
      '        (select Fitter_Name'
      '        from Fitter'
      '        where Fitter.Fitter = Job.Fitter) as Fitter_Name,'
      '        (select telephone_number'
      '        from Fitter'
      '        where Fitter.Fitter = Job.Fitter) as Fitter_Number,'
      '        (select Sales_order.Appliance_Details'
      '        from Sales_Order_Line, sales_Order'
      '        where sales_order_line.Job = Job.Job and'
      
        '              Sales_Order_line.sales_Order = Sales_order.sales_o' +
        'rder) as Appliance_Details,'
      '        (select Sales_order.Extra_Notes'
      '        from Sales_Order_Line, sales_Order'
      '        where sales_order_line.Job = Job.Job and'
      
        '              Sales_Order_line.sales_Order = Sales_order.sales_o' +
        'rder) as SO_Extra_Notes'
      'FROM Vat'
      '      INNER JOIN (Operator'
      '      INNER JOIN (Job'
      '      INNER JOIN Sales_Order_Line'
      '        ON Job.Job = Sales_Order_Line.Job)'
      '        ON Operator.Operator = Job.Operator)'
      '        ON Vat.Vat = Job.VAT'
      'where Sales_Order_line.Sales_Order = :Sales_Order'
      'Order By Job.Job')
    Left = 875
    Top = 26
    ParamData = <
      item
        Name = 'Sales_Order'
      end>
  end
end
