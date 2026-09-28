object PBRPPOAuthFrm: TPBRPPOAuthFrm
  Left = 89
  Top = 113
  Caption = 'Purchase Orders Authorised Report'
  ClientHeight = 519
  ClientWidth = 1145
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Scaled = False
  TextHeight = 13
  object qrReport: TQuickRep
    Left = -3
    Top = -5
    Width = 1403
    Height = 992
    ShowingPreview = False
    BeforePrint = qrReportBeforePrint
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
    Page.Orientation = poLandscape
    Page.PaperSize = A4
    Page.Continuous = False
    Page.Values = (
      100.000000000000000000
      2100.000000000000000000
      100.000000000000000000
      2970.000000000000000000
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
    PrevInitialZoom = qrZoomToFit
    PreviewDefaultSaveType = stPDF
    PreviewLeft = 0
    PreviewTop = 0
    object qrbndGrpHdr: TQRGroup
      Left = 47
      Top = 164
      Width = 1309
      Height = 25
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        52.916666666666670000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'Operator_Name'
      FooterBand = qrbndGrpFtr
      Master = qrbDetails
      ReprintOnNewPage = False
      object qrlblGroupHeader: TQRLabel
        Left = 10
        Top = 3
        Width = 34
        Height = 19
        Size.Values = (
          40.216666666666670000
          21.166666666666670000
          6.350000000000000000
          71.966666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Rep: '
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
        FontSize = 8
      end
      object QRDBText6: TQRDBText
        Left = 90
        Top = 3
        Width = 65
        Height = 19
        Size.Values = (
          40.216666666666670000
          190.500000000000000000
          6.350000000000000000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'rep_name'
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
        FontSize = 8
      end
    end
    object qrbndGrpFtr: TQRBand
      Left = 47
      Top = 214
      Width = 1309
      Height = 48
      AfterPrint = qrbndGrpFtrAfterPrint
      AlignToBottom = False
      BeforePrint = qrbndGrpFtrBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        101.600000000000000000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRLabel20: TQRLabel
        Left = 691
        Top = 15
        Width = 64
        Height = 19
        Size.Values = (
          40.216666666666670000
          1462.616666666667000000
          31.750000000000000000
          135.466666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Totals for '
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
        FontSize = 8
      end
      object qrlblRepTotalSell: TQRLabel
        Left = 1083
        Top = 15
        Width = 98
        Height = 19
        Size.Values = (
          40.216666666666670000
          2292.350000000000000000
          31.750000000000000000
          207.433333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblRepTotalSell'
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
        FontSize = 8
      end
      object qrlblRepTotalCost: TQRLabel
        Left = 977
        Top = 15
        Width = 103
        Height = 19
        Size.Values = (
          40.216666666666670000
          2067.983333333333000000
          31.750000000000000000
          218.016666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblRepTotalCost'
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
        FontSize = 8
      end
      object qrbdataFooter: TQRDBText
        Left = 771
        Top = 15
        Width = 173
        Height = 19
        Size.Values = (
          39.687500000000000000
          1632.479166666667000000
          31.750000000000000000
          365.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'rep_name'
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
        FontSize = 8
      end
      object QRShape1: TQRShape
        Left = 950
        Top = 5
        Width = 234
        Height = 10
        Size.Values = (
          21.166666666666670000
          2010.833333333333000000
          10.583333333333330000
          494.770833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
    object QRBand2: TQRBand
      Left = 47
      Top = 262
      Width = 1309
      Height = 56
      AlignToBottom = False
      BeforePrint = QRBand2BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        118.533333333333300000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRLabel21: TQRLabel
        Left = 838
        Top = 15
        Width = 95
        Height = 19
        Size.Values = (
          40.216666666666670000
          1773.766666666667000000
          31.750000000000000000
          201.083333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Reports Totals:'
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
        FontSize = 8
      end
      object qrlblGrandTotalSell: TQRLabel
        Left = 1074
        Top = 15
        Width = 110
        Height = 19
        Size.Values = (
          40.216666666666670000
          2273.300000000000000000
          31.750000000000000000
          232.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblGrandTotalSell'
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
        FontSize = 8
      end
      object qrlblGrandTotalCost: TQRLabel
        Left = 968
        Top = 15
        Width = 115
        Height = 19
        Size.Values = (
          40.216666666666670000
          2048.933333333333000000
          31.750000000000000000
          243.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblGrandTotalCost'
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
        FontSize = 8
      end
      object QRShape3: TQRShape
        Left = 950
        Top = -4
        Width = 235
        Height = 18
        Size.Values = (
          37.041666666666670000
          2010.833333333333000000
          -7.937500000000000000
          497.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 3
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape4: TQRShape
        Left = 950
        Top = 35
        Width = 235
        Height = 11
        Size.Values = (
          23.812500000000000000
          2010.833333333333000000
          74.083333333333340000
          497.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 3
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
    object qrbDetails: TQRSubDetail
      Left = 47
      Top = 189
      Width = 1309
      Height = 25
      AfterPrint = qrbDetailsAfterPrint
      AlignToBottom = False
      BeforePrint = qrbDetailsBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.916666666666670000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrReport
      DataSet = qryReport
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText2: TQRDBText
        Left = -39
        Top = 3
        Width = 95
        Height = 19
        Size.Values = (
          40.216666666666670000
          -82.550000000000000000
          6.350000000000000000
          201.083333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Purchase_Order'
        Font.Charset = DEFAULT_CHARSET
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
      object QRDBText1: TQRDBText
        Left = 306
        Top = 3
        Width = 117
        Height = 19
        Size.Values = (
          39.687500000000000000
          648.229166666666800000
          5.291666666666667000
          248.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'rep_name'
        Font.Charset = DEFAULT_CHARSET
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
      object QRDBText4: TQRDBText
        Left = 65
        Top = 3
        Width = 65
        Height = 19
        Size.Values = (
          40.216666666666670000
          137.583333333333300000
          6.350000000000000000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Date_Point'
        Font.Charset = DEFAULT_CHARSET
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
      object QRDBText3: TQRDBText
        Left = 134
        Top = 3
        Width = 171
        Height = 19
        Size.Values = (
          39.687500000000000000
          283.104166666666700000
          5.291666666666667000
          362.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Customer_name'
        Font.Charset = DEFAULT_CHARSET
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
      object QRDBText5: TQRDBText
        Left = 428
        Top = 3
        Width = 294
        Height = 19
        Size.Values = (
          39.687500000000000000
          904.875000000000000000
          5.291666666666667000
          621.770833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Customers_Desc'
        Font.Charset = DEFAULT_CHARSET
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
      object qdbAuthorised: TQRDBText
        Left = 724
        Top = 3
        Width = 103
        Height = 19
        Size.Values = (
          39.687500000000000000
          1531.937500000000000000
          5.291666666666667000
          216.958333333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Authorised_Name'
        Font.Charset = DEFAULT_CHARSET
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
      object QRDBText10: TQRDBText
        Left = 1188
        Top = 3
        Width = 124
        Height = 19
        Size.Values = (
          39.687500000000000000
          2513.541666666667000000
          5.291666666666667000
          261.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Status_Description'
        Font.Charset = DEFAULT_CHARSET
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
      object qrlblSellPrice: TQRLabel
        Left = 1103
        Top = 3
        Width = 77
        Height = 19
        Size.Values = (
          40.216666666666670000
          2334.683333333333000000
          6.350000000000000000
          162.983333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblSellPrice'
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
        FontSize = 8
      end
      object qrlblOrderPrice: TQRLabel
        Left = 993
        Top = 3
        Width = 87
        Height = 19
        Size.Values = (
          40.216666666666670000
          2101.850000000000000000
          6.350000000000000000
          184.150000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblOrderPrice'
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
        FontSize = 8
      end
      object QRDBText7: TQRDBText
        Left = 924
        Top = 3
        Width = 50
        Height = 19
        Size.Values = (
          40.216666666666670000
          1955.800000000000000000
          6.350000000000000000
          105.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Quantity'
        Font.Charset = DEFAULT_CHARSET
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
      object QRDBText8: TQRDBText
        Left = 853
        Top = 3
        Width = 51
        Height = 19
        Size.Values = (
          40.216666666666670000
          1805.516666666667000000
          6.350000000000000000
          107.950000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Job_Bag'
        Font.Charset = DEFAULT_CHARSET
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
    end
    object qrbndPageHeader: TQRBand
      Left = 47
      Top = 47
      Width = 1309
      Height = 94
      AlignToBottom = False
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
        198.966666666666700000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object qrlblTitle: TQRLabel
        Left = 494
        Top = 10
        Width = 320
        Height = 29
        Size.Values = (
          61.383333333333330000
          1045.633333333333000000
          21.166666666666670000
          677.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Purchase Orders Authorised'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
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
      object qrlblDateRange: TQRLabel
        Left = 565
        Top = 40
        Width = 179
        Height = 21
        Size.Values = (
          44.450000000000000000
          1195.916666666667000000
          84.666666666666670000
          378.883333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Purchase Orders Dated From: '
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
        FontSize = 8
      end
      object QRSysData1: TQRSysData
        Left = 1218
        Top = 36
        Width = 84
        Height = 19
        Size.Values = (
          40.216666666666670000
          2578.100000000000000000
          76.200000000000000000
          177.800000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = 'Page: '
        Transparent = False
        ExportAs = exptText
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRSysData2: TQRSysData
        Left = 1235
        Top = 10
        Width = 68
        Height = 21
        Size.Values = (
          44.450000000000000000
          2614.083333333333000000
          21.166666666666670000
          143.933333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
        Transparent = False
        ExportAs = exptText
        VerticalAlignment = tlTop
        FontSize = 8
      end
    end
    object qrChildSummary: TQRChildBand
      Left = 47
      Top = 141
      Width = 1309
      Height = 23
      Frame.DrawBottom = True
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        48.683333333333330000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = qrbndPageHeader
      PrintOrder = cboAfterParent
      object QRLabel1: TQRLabel
        Left = 12
        Top = 0
        Width = 42
        Height = 20
        Size.Values = (
          42.333333333333330000
          25.400000000000000000
          0.000000000000000000
          88.900000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'POrder'
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
        FontSize = 8
      end
      object QRLabel2: TQRLabel
        Left = 65
        Top = 0
        Width = 28
        Height = 20
        Size.Values = (
          42.333333333333330000
          137.583333333333300000
          0.000000000000000000
          59.266666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date'
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
        FontSize = 8
      end
      object QRLabel3: TQRLabel
        Left = 133
        Top = 0
        Width = 57
        Height = 20
        Size.Values = (
          42.333333333333330000
          281.516666666666700000
          0.000000000000000000
          120.650000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer'
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
        FontSize = 8
      end
      object QRLabel4: TQRLabel
        Left = 306
        Top = 0
        Width = 24
        Height = 20
        Size.Values = (
          42.333333333333330000
          647.700000000000000000
          0.000000000000000000
          50.800000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Rep'
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
        FontSize = 8
      end
      object QRLabel5: TQRLabel
        Left = 428
        Top = 0
        Width = 66
        Height = 20
        Size.Values = (
          42.333333333333330000
          905.933333333333300000
          0.000000000000000000
          139.700000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Description'
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
        FontSize = 8
      end
      object QRLabel16: TQRLabel
        Left = 1186
        Top = 0
        Width = 39
        Height = 19
        Size.Values = (
          40.216666666666670000
          2510.366666666667000000
          0.000000000000000000
          82.550000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Status'
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
        FontSize = 8
      end
      object QRLabel6: TQRLabel
        Left = 1014
        Top = 0
        Width = 67
        Height = 20
        Size.Values = (
          42.333333333333330000
          2146.300000000000000000
          0.000000000000000000
          141.816666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Order Price'
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
        FontSize = 8
      end
      object QRLabel8: TQRLabel
        Left = 1105
        Top = 0
        Width = 74
        Height = 20
        Size.Values = (
          42.333333333333330000
          2338.916666666667000000
          0.000000000000000000
          156.633333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Selling Price'
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
        FontSize = 8
      end
      object qrlblAuthorised: TQRLabel
        Left = 723
        Top = 0
        Width = 83
        Height = 20
        Size.Values = (
          42.333333333333330000
          1530.350000000000000000
          0.000000000000000000
          175.683333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Authorised By'
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
        FontSize = 8
      end
      object QRLabel11: TQRLabel
        Left = 923
        Top = 0
        Width = 50
        Height = 20
        Size.Values = (
          42.333333333333330000
          1953.683333333333000000
          0.000000000000000000
          105.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Quantity'
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
        FontSize = 8
      end
      object QRLabel7: TQRLabel
        Left = 852
        Top = 0
        Width = 48
        Height = 20
        Size.Values = (
          42.333333333333330000
          1803.400000000000000000
          0.000000000000000000
          101.600000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Job Bag'
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
        FontSize = 8
      end
    end
  end
  object qryReport: TFDQuery
    ConnectionName = 'PB'
    Left = 47
    Top = 8
  end
  object qryDummy: TFDQuery
    SQL.Strings = (
      'SELECT'
      '  Purchase_OrderLine.Customer,'
      '  Customer.Name as Customer_name,'
      '  Purchase_OrderLine.Purchase_Order,'
      '  Purchase_OrderLine.Line,'
      '  Purchase_Order.Date_Point,'
      '  Purchase_OrderLine.Cust_Order_No,'
      '  Purchase_OrderLine.Customers_Desc,'
      '  Purchase_OrderLine.Quantity,'
      '  Purchase_OrderLine.Order_Price,'
      '  Order_unit.Price_Unit_Factor AS Order_unit_Factor,'
      '  Order_unit.Description as Order_Unit_Desc,'
      '  Purchase_OrderLine.Selling_Price,'
      '  Selling_unit.Price_Unit_Factor AS Sell_unit_Factor,'
      '  Selling_unit.Description as Sell_Unit_Desc,'
      '  Purchase_OrderLine.Goods_Required,'
      '  Purch_Ord_Line_Status.Purch_Ord_Line_Status AS Order_Status,'
      '  Purch_Ord_Line_Status.Description AS Status_Description,'
      '  Customer_Branch.Name AS Branch_Name,'
      '  Purchase_OrderLine.On_Hold,'
      '  Purchase_Order.Supplier,'
      '  Supplier.Name as Supplier_Name,'
      '  job_bag_line_dets.job_bag,'
      '  Purchase_orderline.Description_Reference,'
      '  Purchase_OrderLine.Rep,'
      '  Rep.Name as Rep_Name,'
      '  Purchase_Order.Operator,'
      '  Operator.Name as Operator_Name,'
      '  Original_order,'
      '  Purchase_Orderline.Inactive,'
      '  Purchase_Orderline.Supp_Inv_Recd,'
      '  Purchase_Order.Needs_Authorising,'
      '  Purchase_order.Authorised_By,'
      '  (Select OP.Name'
      '   from Operator OP'
      
        '   where OP.Operator = Purchase_Order.Authorised_by) as Authoris' +
        'ed_Name'
      'FROM Operator'
      '      INNER JOIN (Supplier'
      '      INNER JOIN (Purchase_Order'
      '      INNER JOIN (Rep'
      '      INNER JOIN ((Customer'
      '      INNER JOIN Customer_Branch ON'
      '        Customer.Customer = Customer_Branch.Customer)'
      '      INNER JOIN (Purch_Ord_Line_Status'
      '      INNER JOIN (Price_Unit AS Order_unit'
      '      RIGHT JOIN (Price_Unit AS Selling_unit'
      '      INNER JOIN Purchase_OrderLine'
      
        '      LEFT JOIN job_bag_line_dets on ((Purchase_OrderLine.Purcha' +
        'se_Order = job_bag_line_dets.Purchase_Order) and'
      '         (Purchase_OrderLine.line = job_bag_line_dets.line)) ON'
      
        '        Selling_unit.Price_Unit = Purchase_OrderLine.Sell_Unit) ' +
        'ON'
      
        '        Order_unit.Price_Unit = Purchase_OrderLine.Order_Unit) O' +
        'N'
      
        '        Purch_Ord_Line_Status.Purch_Ord_Line_Status = Purchase_O' +
        'rderLine.Purch_Ord_Line_Status) ON'
      
        '        (Customer_Branch.Branch_no = Purchase_OrderLine.Branch_n' +
        'o) AND'
      
        '        (Customer_Branch.Customer = Purchase_OrderLine.Customer)' +
        ') ON'
      #9'      Rep.Rep = Purchase_OrderLine.Rep) ON'
      
        '        Purchase_Order.Purchase_Order = Purchase_OrderLine.Purch' +
        'ase_Order) ON'
      '        Supplier.Supplier = Purchase_Order.Supplier) ON'
      #9'      Operator.Operator = Purchase_Order.Operator'
      'WHERE'
      '  (Purchase_order.Authorised_By <> 0) AND'
      
        '  ((Purchase_Orderline.Inactive = '#39'N'#39') OR (Purchase_Orderline.In' +
        'active is NULL))'
      '')
    Left = 165
    Top = 11
  end
end
