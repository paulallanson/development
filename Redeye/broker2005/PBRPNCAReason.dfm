object PBRPNCAReasonFrm: TPBRPNCAReasonFrm
  Left = 89
  Top = 113
  Caption = 'Non Conformance Reason Report'
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
    Width = 1123
    Height = 794
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
    object qrbndGrpHdr: TQRGroup
      Left = 38
      Top = 137
      Width = 1066
      Height = 20
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        52.916666666666670000
        2820.458333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'Rep_Name'
      FooterBand = qrbndGrpFtr
      Master = qrbDetails
      ReprintOnNewPage = False
      object qrlblGroupHeader: TQRLabel
        Left = 8
        Top = 2
        Width = 28
        Height = 15
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          5.291666666666667000
          74.083333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Rep: '
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
      object QRDBText6: TQRDBText
        Left = 96
        Top = 2
        Width = 57
        Height = 15
        Size.Values = (
          39.687500000000000000
          254.000000000000000000
          5.291666666666667000
          150.812500000000000000)
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
    end
    object qrbndGrpFtr: TQRBand
      Left = 38
      Top = 177
      Width = 1066
      Height = 32
      AfterPrint = qrbndGrpFtrAfterPrint
      AlignToBottom = False
      BeforePrint = qrbndGrpFtrBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        84.666666666666670000
        2820.458333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object qrlblRepTotalClient: TQRLabel
        Left = 864
        Top = 12
        Width = 89
        Height = 15
        Size.Values = (
          39.687500000000000000
          2286.000000000000000000
          31.750000000000000000
          235.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblRepTotalClient'
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
      object QRLabel20: TQRLabel
        Left = 577
        Top = 12
        Width = 57
        Height = 15
        Size.Values = (
          39.687500000000000000
          1526.645833333333000000
          31.750000000000000000
          150.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Totals for '
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
      object qrbdataFooter: TQRDBText
        Left = 641
        Top = 12
        Width = 168
        Height = 15
        Size.Values = (
          39.687500000000000000
          1695.979166666667000000
          31.750000000000000000
          444.500000000000000000)
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
      object QRShape1: TQRShape
        Left = 816
        Top = 4
        Width = 141
        Height = 8
        Size.Values = (
          21.166666666666670000
          2159.000000000000000000
          10.583333333333330000
          373.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrlblRepTotalCost: TQRLabel
        Left = 796
        Top = 12
        Width = 85
        Height = 15
        Size.Values = (
          39.687500000000000000
          2106.083333333333000000
          31.750000000000000000
          224.895833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblRepTotalCost'
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
    object QRBand2: TQRBand
      Left = 38
      Top = 209
      Width = 1066
      Height = 45
      AlignToBottom = False
      BeforePrint = QRBand2BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        119.062500000000000000
        2820.458333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRShape3: TQRShape
        Left = 816
        Top = -3
        Width = 141
        Height = 14
        Size.Values = (
          37.041666666666670000
          2159.000000000000000000
          -7.937500000000000000
          373.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 3
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape4: TQRShape
        Left = 816
        Top = 28
        Width = 141
        Height = 9
        Size.Values = (
          23.812500000000000000
          2159.000000000000000000
          74.083333333333340000
          373.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 3
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrlblGrandTotalCost: TQRLabel
        Left = 785
        Top = 12
        Width = 96
        Height = 15
        Size.Values = (
          39.687500000000000000
          2076.979166666667000000
          31.750000000000000000
          254.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblGrandTotalCost'
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
      object qrlblGrandTotalClient: TQRLabel
        Left = 853
        Top = 12
        Width = 100
        Height = 15
        Size.Values = (
          39.687500000000000000
          2256.895833333333000000
          31.750000000000000000
          264.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblGrandTotalClient'
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
      object QRLabel21: TQRLabel
        Left = 701
        Top = 12
        Width = 85
        Height = 15
        Size.Values = (
          39.687500000000000000
          1854.729166666667000000
          31.750000000000000000
          224.895833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Reports Totals:'
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
    object qrbDetails: TQRSubDetail
      Left = 38
      Top = 157
      Width = 1066
      Height = 20
      AfterPrint = qrbDetailsAfterPrint
      AlignToBottom = False
      BeforePrint = qrbDetailsBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.916666666666670000
        2820.458333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrReport
      DataSet = qryReport
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText2: TQRDBText
        Left = -70
        Top = 2
        Width = 115
        Height = 15
        Size.Values = (
          39.687500000000000000
          -185.208333333333300000
          5.291666666666667000
          304.270833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Job_Bag_Non_Conform'
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
      object QRDBText4: TQRDBText
        Left = 56
        Top = 2
        Width = 52
        Height = 15
        Size.Values = (
          39.687500000000000000
          148.166666666666700000
          5.291666666666667000
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
      object QRDBText3: TQRDBText
        Left = 410
        Top = 2
        Width = 127
        Height = 15
        Size.Values = (
          39.687500000000000000
          1084.791666666667000000
          5.291666666666667000
          336.020833333333400000)
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
      object QRDBText5: TQRDBText
        Left = 544
        Top = 2
        Width = 281
        Height = 15
        Size.Values = (
          39.687500000000000000
          1439.333333333333000000
          5.291666666666667000
          743.479166666666800000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Job_Bag_Descr'
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
      object QRDBText7: TQRDBText
        Left = 113
        Top = 2
        Width = 112
        Height = 15
        Size.Values = (
          39.687500000000000000
          298.979166666666700000
          5.291666666666667000
          296.333333333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Non_Conform_Type_Descr'
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
      object QRDBText1: TQRDBText
        Left = 233
        Top = 2
        Width = 112
        Height = 15
        Size.Values = (
          39.687500000000000000
          616.479166666666800000
          5.291666666666667000
          296.333333333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Non_Conform_Dept_Descr'
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
      object QRDBText10: TQRDBText
        Left = 854
        Top = 2
        Width = 99
        Height = 15
        Size.Values = (
          39.687500000000000000
          2259.541666666667000000
          5.291666666666667000
          261.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Total_Cost_to_Client'
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
      object QRDBText11: TQRDBText
        Left = 960
        Top = 2
        Width = 101
        Height = 15
        Size.Values = (
          39.687500000000000000
          2540.000000000000000000
          5.291666666666667000
          267.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Non_Conform_Status_Descr'
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
      object QRDBText9: TQRDBText
        Left = 829
        Top = 2
        Width = 52
        Height = 15
        Size.Values = (
          39.687500000000000000
          2193.395833333333000000
          5.291666666666667000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Total_Cost'
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
      object qrlblOrder: TQRLabel
        Left = 352
        Top = 2
        Width = 49
        Height = 15
        Size.Values = (
          39.687500000000000000
          931.333333333333300000
          5.291666666666667000
          129.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblOrder'
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
    object qrbndPageHeader: TQRBand
      Left = 38
      Top = 38
      Width = 1066
      Height = 99
      Frame.DrawBottom = True
      Frame.Width = 2
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
        261.937500000000000000
        2820.458333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object qrlblTitle: TQRLabel
        Left = 377
        Top = 8
        Width = 311
        Height = 23
        Size.Values = (
          60.854166666666670000
          997.479166666666700000
          21.166666666666670000
          822.854166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Non Conformance Reason Report'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
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
        Left = 457
        Top = 32
        Width = 152
        Height = 17
        Size.Values = (
          44.979166666666670000
          1209.145833333333000000
          84.666666666666670000
          402.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Non Conformance Dated From: '
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
      object QRSysData1: TQRSysData
        Left = 973
        Top = 29
        Width = 69
        Height = 15
        Size.Values = (
          39.687500000000000000
          2574.395833333333000000
          76.729166666666670000
          182.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
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
        Left = 986
        Top = 8
        Width = 56
        Height = 17
        Size.Values = (
          44.979166666666670000
          2608.791666666667000000
          21.166666666666670000
          148.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
        Transparent = False
        ExportAs = exptText
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel1: TQRLabel
        Left = 0
        Top = 80
        Width = 42
        Height = 16
        Size.Values = (
          42.333333333333330000
          0.000000000000000000
          211.666666666666700000
          111.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'NCA No.'
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
      object QRLabel2: TQRLabel
        Left = 56
        Top = 80
        Width = 23
        Height = 16
        Size.Values = (
          42.333333333333330000
          148.166666666666700000
          211.666666666666700000
          60.854166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date'
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
      object QRLabel3: TQRLabel
        Left = 410
        Top = 80
        Width = 47
        Height = 16
        Size.Values = (
          42.333333333333330000
          1084.791666666667000000
          211.666666666666700000
          124.354166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer'
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
      object QRLabel5: TQRLabel
        Left = 543
        Top = 80
        Width = 40
        Height = 16
        Size.Values = (
          42.333333333333330000
          1436.687500000000000000
          211.666666666666700000
          105.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Job Title'
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
      object QRLabel16: TQRLabel
        Left = 960
        Top = 81
        Width = 32
        Height = 15
        Size.Values = (
          39.687500000000000000
          2540.000000000000000000
          214.312500000000000000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Status'
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
      object QRLabel6: TQRLabel
        Left = 114
        Top = 80
        Width = 38
        Height = 16
        Size.Values = (
          42.333333333333330000
          301.625000000000000000
          211.666666666666700000
          100.541666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Reason'
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
      object qrlblJobBag: TQRLabel
        Left = 352
        Top = 80
        Width = 29
        Height = 16
        Size.Values = (
          42.333333333333330000
          931.333333333333300000
          211.666666666666700000
          76.729166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Order'
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
      object QRLabel4: TQRLabel
        Left = 232
        Top = 80
        Width = 61
        Height = 16
        Size.Values = (
          42.333333333333330000
          613.833333333333300000
          211.666666666666700000
          161.395833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Source Dept'
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
      object QRLabel8: TQRLabel
        Left = 829
        Top = 80
        Width = 50
        Height = 16
        Size.Values = (
          42.333333333333330000
          2193.395833333333000000
          211.666666666666700000
          132.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cost to us'
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
      object QRLabel9: TQRLabel
        Left = 887
        Top = 80
        Width = 64
        Height = 16
        Size.Values = (
          42.333333333333330000
          2346.854166666667000000
          211.666666666666700000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cost to Client'
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
      object qrlblCategories: TQRLabel
        Left = 506
        Top = 48
        Width = 53
        Height = 17
        Size.Values = (
          44.979166666666670000
          1338.791666666667000000
          127.000000000000000000
          140.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Catgeories'
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
  end
  object qryReport: TFDQuery
    ConnectionName = 'PB'
    Left = 47
    Top = 8
  end
  object qryDummy: TFDQuery
    SQL.Strings = (
      'SELECT Job_Bag_Non_Conform.Job_Bag_Non_Conform,'
      #9'Job_Bag_Non_Conform.Date_Point,'
      #9'Job_Bag_Non_Conform.Job_Bag,'
      #9'Job_Bag_Non_Conform.Operator,'
      #9'Operator.Name AS Operator_Name,'
      '  Job_Bag_Non_Conform.Non_Conform_Category,'
      #9'(select Non_Conform_Category.Non_Conform_Category_Descr'
      '        from Non_Conform_Category'
      
        '        where Non_Conform_Category.Non_Conform_Category = Job_Ba' +
        'g_Non_Conform.Non_Conform_Category) as Non_Conform_Category_Desc' +
        'r,'
      #9'Job_Bag_Non_Conform.Raised_By_Dept,'
      #9'Raised_By_Dept.Non_Conform_Dept_Descr AS Raised_by_dept_Descr,'
      #9'Job_Bag_Non_Conform.Non_Conform_Dept,'
      #9'Non_Conform_Dept.Non_Conform_Dept_Descr,'
      #9'Job_Bag_Non_Conform.Non_Conform_Type,'
      #9'Non_Conform_Type.Non_Conform_Type_Descr,'
      #9'Job_Bag_Non_Conform.QA_Operator,'
      #9'QA_Operator.QA_Operator_Name,'
      #9'Job_Bag_Non_Conform.QA_Sign_Off_Date,'
      #9'Job_Bag_Non_Conform.Total_Cost,'
      '  Job_Bag_Non_Conform.Total_Cost_to_Client,'
      #9'Job_Bag_Non_Conform.Non_Conform_Notes,'
      #9'Job_Bag_Non_Conform.Response_Notes,'
      #9'Job_Bag_Non_Conform.Corrective_Notes,'
      '  Job_Bag_Non_Conform.Inactive,'
      #9'Job_Bag.Customer,'
      #9'Job_Bag.Branch_No,'
      '  CASE when Job_Bag.Rep <> 0 then'
      '    Job_Bag_Descr'
      '  ELSE'
      '    Customers_Desc'
      '  END AS Job_Bag_Descr,'
      '  CASE when Job_Bag.Rep <> 0 then'
      #9'  (select Rep.Name'
      '     from Rep'
      #9'   where Rep.Rep = Job_bag.Rep)'
      '  ELSE'
      #9'  (select Rep.Name'
      #9' '#9' from Rep'
      #9'   where Rep.Rep = Purchase_orderLine.Rep)'
      '  END AS Rep_Name,'
      #9'CASE when Job_Bag.Customer <> 0 then'
      #9#9'(select Customer.Name'
      #9' '#9' from Customer'
      #9'       '#9' where Customer.Customer = Job_bag.Customer)'
      #9'ELSE'
      #9#9'(select Customer.Name'
      #9' '#9' from Customer'
      #9'       '#9' where Customer.Customer = Purchase_OrderLine.Customer)'
      #9'END AS Customer_Name,'
      #9'CASE when Job_Bag.Customer <> 0 then'
      #9#9'(select Customer_Branch.Account_code'
      #9' '#9' from Customer_Branch'
      #9'       '#9' where Customer_Branch.Customer = Job_bag.Customer and'
      #9#9#9'Customer_Branch.Branch_no = Job_bag.Branch_no)'
      #9'ELSE'
      #9#9'(select Customer_Branch.Account_code'
      #9' '#9' from Customer_Branch'
      
        #9'       '#9' where Customer_Branch.Customer = Purchase_orderline.Cu' +
        'stomer and'
      #9#9#9'Customer_Branch.Branch_no = Purchase_orderline.Branch_no)'
      #9'END AS Account_Code,'
      #9'Job_Bag_Non_Conform.Non_Conform_Status,'
      #9'Non_Conform_Status.Non_Conform_Status_Descr,'
      #9'Purchase_OrderLine.Purchase_order,'
      #9'Purchase_OrderLine.Customers_Desc,'
      #9'CASE when Job_Bag.Office_Contact <> 0 then'
      #9#9'(select operator.Name'
      #9' '#9' from Operator'
      #9'       '#9' where Operator.Operator = Job_bag.Office_Contact)'
      #9'ELSE'
      #9#9'(select operator.Name'
      #9' '#9' from Purchase_Order, Operator'
      
        #9'       '#9' where Purchase_order.Purchase_Order = Purchase_orderLi' +
        'ne.Purchase_Order and'
      #9#9#9'Operator.Operator = Purchase_Order.Office_Contact)'
      #9'END AS Account_Manager'
      'FROM Purchase_OrderLine'
      #9'RIGHT JOIN (QA_Operator'
      #9'RIGHT JOIN (Operator'
      #9'INNER JOIN (Non_Conform_Type'
      #9'INNER JOIN (Non_Conform_Status'
      #9'INNER JOIN (Non_Conform_Dept AS Raised_By_Dept'
      #9'RIGHT JOIN (Job_Bag'
      #9'RIGHT JOIN (Non_Conform_Dept'
      #9'INNER JOIN Job_Bag_Non_Conform'
      
        #9#9'ON Non_Conform_Dept.Non_Conform_Dept = Job_Bag_Non_Conform.Non' +
        '_Conform_Dept)'
      #9#9'ON Job_Bag.Job_Bag = Job_Bag_Non_Conform.Job_Bag)'
      
        #9#9'ON Raised_By_Dept.Non_Conform_Dept = Job_Bag_Non_Conform.Raise' +
        'd_By_Dept)'
      
        #9#9'ON Non_Conform_Status.Non_Conform_Status = Job_Bag_Non_Conform' +
        '.Non_Conform_Status)'
      
        #9#9'ON Non_Conform_Type.Non_Conform_Type = Job_Bag_Non_Conform.Non' +
        '_Conform_Type)'
      #9#9'ON Operator.Operator = Job_Bag_Non_Conform.Operator)'
      #9#9'ON QA_Operator.QA_Operator = Job_Bag_Non_Conform.QA_Operator)'
      
        #9#9'ON (Purchase_OrderLine.Line = Job_Bag_Non_Conform.Line) AND (P' +
        'urchase_OrderLine.Purchase_Order = Job_Bag_Non_Conform.Purchase_' +
        'Order)'
      'WHERE 1=1 ')
    Left = 277
    Top = 11
  end
  object qryDummyOld: TFDQuery
    SQL.Strings = (
      'SELECT'
      '      Job_Bag_Non_Conform.Job_Bag_Non_Conform,'
      '      Job_Bag_Non_Conform.Date_Point,'
      '      Job_Bag_Non_Conform.Job_Bag,'
      '      Job_Bag_Non_Conform.Operator,'
      '      Operator.Name AS Operator_Name,'
      '      Job_Bag_Non_Conform.Raised_By_Dept,'
      
        '      Raised_By_Dept.Non_Conform_Dept_Descr AS Raised_by_dept_De' +
        'scr,'
      '      Job_Bag_Non_Conform.Non_Conform_Dept,'
      '      Non_Conform_Dept.Non_Conform_Dept_Descr,'
      '      Job_Bag_Non_Conform.Non_Conform_Type,'
      '      Non_Conform_Type.Non_Conform_Type_Descr,'
      '      Job_Bag_Non_Conform.QA_Operator,'
      '      QA_Operator.QA_Operator_Name,'
      '      Job_Bag_Non_Conform.QA_Sign_Off_Date,'
      '      Job_Bag_Non_Conform.Total_Cost,'
      '      Job_Bag_Non_Conform.Total_Cost_to_Client,'
      '      Job_Bag_Non_Conform.Non_Conform_Notes,'
      '      Job_Bag_Non_Conform.Response_Notes,'
      '      Job_Bag_Non_Conform.Corrective_Notes,'
      '      Job_Bag.Job_Bag_Descr,'
      '      Job_Bag.Customer,'
      '      Job_Bag.Branch_No,'
      '      Job_Bag.Rep,'
      '      Job_Bag.Date_Start,'
      '      Job_Bag.Goods_Required,'
      '      Customer_Branch.Name as Branch_Name,'
      '      Customer.Name as Customer_Name,'
      '      Customer_Branch.Account_Code,'
      '      Job_Bag_Non_Conform.Non_Conform_Status,'
      
        '      Non_Conform_Status.Non_Conform_Status_Descr,Job_Bag.Office' +
        '_Contact,'
      '      Rep.Name as Rep_Name,'
      '      AM.Name as Account_Manager'
      'FROM Rep'
      '    INNER JOIN (QA_Operator'
      '    RIGHT JOIN (Non_Conform_Type'
      '    INNER JOIN (Non_Conform_Status'
      '    INNER JOIN (Non_Conform_Dept AS Raised_By_Dept'
      '    RIGHT JOIN (Customer'
      '    INNER JOIN (Customer_Branch'
      '    INNER JOIN (Operator AS AM'
      '    INNER JOIN (Operator'
      '    INNER JOIN ((Non_Conform_Dept'
      '    INNER JOIN Job_Bag_Non_Conform'
      
        '      ON Non_Conform_Dept.Non_Conform_Dept = Job_Bag_Non_Conform' +
        '.Non_Conform_Dept)'
      '    INNER JOIN Job_Bag'
      '      ON Job_Bag_Non_Conform.Job_Bag = Job_Bag.Job_Bag)'
      '      ON Operator.Operator = Job_Bag_Non_Conform.Operator)'
      '      ON AM.Operator = Job_Bag.Office_Contact)'
      
        '      ON (Customer_Branch.Branch_no = Job_Bag.Branch_No) AND (Cu' +
        'stomer_Branch.Customer = Job_Bag.Customer))'
      
        '      ON Customer.Customer = Customer_Branch.Customer) ON Raised' +
        '_By_Dept.Non_Conform_Dept = Job_Bag_Non_Conform.Raised_By_Dept)'
      
        '      ON Non_Conform_Status.Non_Conform_Status = Job_Bag_Non_Con' +
        'form.Non_Conform_Status)'
      
        '      ON Non_Conform_Type.Non_Conform_Type = Job_Bag_Non_Conform' +
        '.Non_Conform_Type)'
      
        '      ON QA_Operator.QA_Operator = Job_Bag_Non_Conform.QA_Operat' +
        'or)'
      '      ON Rep.Rep = Job_Bag.Rep'
      'WHERE 1=1 ')
    Left = 365
    Top = 19
  end
end
