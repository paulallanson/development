object PBRPEnqLstFrm: TPBRPEnqLstFrm
  Left = 66
  Top = 116
  Width = 1106
  Height = 480
  HorzScrollBar.Position = 72
  HorzScrollBar.Range = 1200
  VertScrollBar.Range = 2000
  Caption = 'Overdue Enquiries'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  Scaled = False
  TextHeight = 14
  object QRLabel6: TQRLabel
    Left = 560
    Top = 220
    Width = 12
    Height = 12
    Size.Values = (
      26.458333333333300000
      1185.333333333330000000
      465.666666666667000000
      26.458333333333300000)
    XLColumn = 0
    XLNumFormat = nfGeneral
    ActiveInPreview = False
    Alignment = taLeftJustify
    AlignToBand = False
    Caption = 'Fax:'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
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
  object QRDBText6: TQRDBText
    Left = 630
    Top = 220
    Width = 12
    Height = 12
    Size.Values = (
      26.458333333333300000
      1333.500000000000000000
      465.666666666667000000
      26.458333333333300000)
    XLColumn = 0
    XLNumFormat = nfGeneral
    ActiveInPreview = False
    Alignment = taLeftJustify
    AlignToBand = False
    Color = clWhite
    DataSet = GetCompSQL
    DataField = 'Fax_number'
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
  object QRLabel7: TQRLabel
    Left = 560
    Top = 266
    Width = 12
    Height = 12
    Size.Values = (
      26.458333333333300000
      1185.333333333330000000
      563.562500000000000000
      26.458333333333300000)
    XLColumn = 0
    XLNumFormat = nfGeneral
    ActiveInPreview = False
    Alignment = taLeftJustify
    AlignToBand = False
    Caption = 'Fax:'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
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
  object QRDBText7: TQRDBText
    Left = 630
    Top = 266
    Width = 12
    Height = 12
    Size.Values = (
      26.458333333333300000
      1333.500000000000000000
      563.562500000000000000
      26.458333333333300000)
    XLColumn = 0
    XLNumFormat = nfGeneral
    ActiveInPreview = False
    Alignment = taLeftJustify
    AlignToBand = False
    Color = clWhite
    DataSet = GetCompSQL
    DataField = 'Fax_number'
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
  object qrpdetails: TQuickRep
    Left = -32
    Top = -24
    Width = 1403
    Height = 992
    ShowingPreview = False
    BeforePrint = qrpdetailsBeforePrint
    DataSet = GetEnquiriesSQL
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
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
    ReportTitle = 'Overdue Enquiries'
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
      Left = 47
      Top = 47
      Width = 1309
      Height = 144
      Frame.DrawBottom = True
      Frame.Width = 2
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        304.800000000000000000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object QRLabel9: TQRLabel
        Left = 1
        Top = 117
        Width = 65
        Height = 21
        Size.Values = (
          44.450000000000000000
          2.116666666666667000
          247.650000000000000000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Enquiry No'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
        Left = 395
        Top = 117
        Width = 113
        Height = 21
        Size.Values = (
          44.979166666666670000
          836.083333333333300000
          248.708333333333300000
          238.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Job Description'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      object QRLabel10: TQRLabel
        Left = 610
        Top = 117
        Width = 72
        Height = 21
        Size.Values = (
          44.450000000000000000
          1291.166666666667000000
          247.650000000000000000
          152.400000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Required By'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      object QRLabel12: TQRLabel
        Left = 700
        Top = 117
        Width = 60
        Height = 21
        Size.Values = (
          44.450000000000000000
          1481.666666666667000000
          247.650000000000000000
          127.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Quantities'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      object RunDateQRLabel: TQRLabel
        Left = 542
        Top = 10
        Width = 224
        Height = 36
        Size.Values = (
          76.200000000000000000
          1147.233333333333000000
          21.166666666666670000
          474.133333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Enquiries Report'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -30
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 18
      end
      object QRLabel1: TQRLabel
        Left = 80
        Top = 117
        Width = 28
        Height = 21
        Size.Values = (
          44.450000000000000000
          169.333333333333300000
          247.650000000000000000
          59.266666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      object QRLblCst: TQRLabel
        Left = 150
        Top = 117
        Width = 57
        Height = 21
        Size.Values = (
          44.450000000000000000
          317.500000000000000000
          247.650000000000000000
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
      object QRLblStatus: TQRLabel
        Left = 926
        Top = 117
        Width = 39
        Height = 19
        Size.Values = (
          40.216666666666670000
          1960.033333333333000000
          247.650000000000000000
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
      object QRLblCntct: TQRLabel
        Left = 1086
        Top = 117
        Width = 83
        Height = 19
        Size.Values = (
          40.216666666666670000
          2298.700000000000000000
          247.650000000000000000
          175.683333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Office Contact'
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
        Left = 1210
        Top = 10
        Width = 84
        Height = 21
        Size.Values = (
          44.450000000000000000
          2561.166666666667000000
          21.166666666666670000
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
        Left = 1226
        Top = 40
        Width = 68
        Height = 21
        Size.Values = (
          44.450000000000000000
          2595.033333333333000000
          84.666666666666670000
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
      object QRLblRep: TQRLabel
        Left = 617
        Top = 75
        Width = 74
        Height = 21
        Size.Values = (
          44.450000000000000000
          1305.983333333333000000
          158.750000000000000000
          156.633333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'QRLblRep'
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
      object QRLblInactive: TQRLabel
        Left = 1276
        Top = 115
        Width = 31
        Height = 19
        Size.Values = (
          40.216666666666670000
          2700.866666666667000000
          243.416666666666700000
          65.616666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'InAct'
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
      object qrlblDtRng: TQRLabel
        Left = 556
        Top = 50
        Width = 196
        Height = 21
        Size.Values = (
          44.450000000000000000
          1176.866666666667000000
          105.833333333333300000
          414.866666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        AutoStretch = True
        Caption = 'For Enquiries Dated from: '
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
      object QRLabel2: TQRLabel
        Left = 1206
        Top = 102
        Width = 55
        Height = 38
        Size.Values = (
          79.375000000000000000
          2553.229166666667000000
          216.958333333333300000
          116.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Supplier Count'
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
    object qrgSortBy: TQRGroup
      Left = 47
      Top = 191
      Width = 1309
      Height = 32
      AlignToBottom = False
      BeforePrint = qrgSortByBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        67.733333333333330000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'GetEnquiriesSQL.Name_1'
      Master = QRSubDetail1
      ReprintOnNewPage = False
      object qrdbSortName: TQRDBText
        Left = 11
        Top = 10
        Width = 49
        Height = 19
        Size.Values = (
          40.216666666666670000
          23.283333333333330000
          21.166666666666670000
          103.716666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = GetEnquiriesSQL
        DataField = 'Name_1'
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
    object QRSubDetail1: TQRSubDetail
      Left = 47
      Top = 223
      Width = 1309
      Height = 31
      AfterPrint = QRSubDetail1AfterPrint
      AlignToBottom = False
      BeforePrint = QRSubDetail1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        65.616666666666670000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpdetails
      DataSet = GetEnquiriesSQL
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText3: TQRDBText
        Left = 1190
        Top = 3
        Width = 89
        Height = 19
        Size.Values = (
          40.216666666666670000
          2518.833333333333000000
          6.350000000000000000
          188.383333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Color = clWhite
        DataSet = GetEnquiriesSQL
        DataField = 'Supplier_Count'
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
      object EnqNoLab: TQRLabel
        Left = 1
        Top = 3
        Width = 60
        Height = 21
        Size.Values = (
          44.979166666666700000
          2.645833333333330000
          5.291666666666670000
          127.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'EnqLineQRLabel'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      object QRLblEnqDt: TQRLabel
        Left = 80
        Top = 3
        Width = 73
        Height = 21
        Size.Values = (
          44.450000000000000000
          169.333333333333300000
          6.350000000000000000
          154.516666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'QRLblEnqDt'
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
      object QRDBText1: TQRDBText
        Left = 150
        Top = 3
        Width = 239
        Height = 21
        Size.Values = (
          44.979166666666670000
          317.500000000000000000
          5.291666666666667000
          505.354166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = GetEnquiriesSQL
        DataField = 'Name'
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
      object JobDescrQRDBText: TQRDBText
        Left = 395
        Top = 3
        Width = 223
        Height = 21
        Size.Values = (
          44.979166666666670000
          836.083333333333400000
          5.291666666666667000
          470.958333333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = GetEnquiriesSQL
        DataField = 'Form_Description'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      object QRLblRqby: TQRLabel
        Left = 614
        Top = 3
        Width = 67
        Height = 21
        Size.Values = (
          44.450000000000000000
          1299.633333333333000000
          6.350000000000000000
          141.816666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'QRLblRqby'
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
      object QtysQRMemo: TQRMemo
        Left = 700
        Top = 3
        Width = 221
        Height = 21
        Size.Values = (
          44.979166666666670000
          1481.666666666667000000
          5.291666666666667000
          468.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'Memo to hold'
          'quantity info')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object QRDBtxtStatus: TQRDBText
        Left = 926
        Top = 3
        Width = 151
        Height = 19
        Size.Values = (
          39.687500000000000000
          1960.562500000000000000
          5.291666666666667000
          320.145833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = GetEnquiriesSQL
        DataField = 'Description'
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
      object QRDBtxtOp: TQRDBText
        Left = 1086
        Top = 3
        Width = 115
        Height = 19
        Size.Values = (
          39.687500000000000000
          2299.229166666667000000
          5.291666666666667000
          243.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = GetEnquiriesSQL
        DataField = 'Name_2'
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
      object QRlblLve: TQRLabel
        Left = 1291
        Top = 5
        Width = 6
        Height = 19
        Size.Values = (
          40.216666666666670000
          2732.616666666667000000
          10.583333333333330000
          12.700000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '*'
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
  object GetEnquiriesSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  EnquiryLine.Enquiry,'
      '        EnquiryLine.Line,'
      '        EnquiryLine.Form_Description,'
      '        Customer.Name,'
      '        Customer_Branch.Name AS Branch_Name,'
      '        Rep.Name,'
      '        Enquiry.Date_Point,'
      '        Enquiry.Quote_Required_By,'
      '        Operator.Name,'
      '        Enquiry_Status.Description,'
      '        EnquiryLine.Enq_InActive,'
      '        (select count(supplier)'
      '        from supplier_enquiry'
      '        where Supplier_enquiry.enquiry = enquiryline.enquiry and'
      
        '              Supplier_enquiry.line = enquiryline.line) as Suppl' +
        'ier_Count'
      
        'FROM Operator INNER JOIN (Enquiry_Status INNER JOIN ((Customer_B' +
        'ranch'
      'INNER JOIN ((Enquiry INNER JOIN Rep ON Enquiry.Rep = Rep.Rep)'
      'INNER JOIN Customer ON Enquiry.Customer = Customer.Customer) ON'
      ' (Customer.Customer = Customer_Branch.Customer) AND'
      ' (Customer_Branch.Branch_no = Enquiry.Branch_no) AND'
      ' (Customer_Branch.Customer = Enquiry.Customer))'
      
        ' INNER JOIN EnquiryLine ON Enquiry.Enquiry = EnquiryLine.Enquiry' +
        ') ON'
      ' Enquiry_Status.Enquiry_Status = EnquiryLine.Enquiry_Status) ON'
      '  (Operator.Operator = Enquiry.Operator) AND'
      '   (Operator.Operator = Enquiry.Office_Contact)'
      'WHERE ((Enquiry.Rep = :Rep) or (:Rep = 0)) and'
      
        '      ((Enquiry.Office_Contact = :Office_Contact) or (:Office_Co' +
        'ntact = 0)) and'
      
        '   ((EnquiryLine.Enq_InActive <> :nonactive) or (:nonactive = '#39#39 +
        ')) and'
      
        '   ((Enquiry.Date_Point >= :DateFrom) and (Enquiry.Date_Point <=' +
        ' :DateTo))'
      'ORDER BY Rep.Name, EnquiryLine.Enquiry, EnquiryLine.Line;'
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 336
    Top = 47
    ParamData = <
      item
        Name = 'Rep'
        DataType = ftInteger
      end
      item
        Name = 'Rep'
        DataType = ftInteger
      end
      item
        Name = 'Office_Contact'
      end
      item
        Name = 'Office_Contact'
      end
      item
        Name = 'nonactive'
        DataType = ftString
      end
      item
        Name = 'nonactive'
        DataType = ftString
      end
      item
        Name = 'DateFrom'
        DataType = ftDateTime
      end
      item
        Name = 'DateTo'
        DataType = ftDateTime
      end>
    object GetEnquiriesSQLCustName: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'CustName'
      Calculated = True
    end
    object GetEnquiriesSQLEnquiry: TIntegerField
      FieldName = 'Enquiry'
    end
    object GetEnquiriesSQLLine: TIntegerField
      FieldName = 'Line'
    end
    object GetEnquiriesSQLForm_Description: TWideStringField
      FieldName = 'Form_Description'
      FixedChar = True
      Size = 160
    end
    object GetEnquiriesSQLName: TWideStringField
      FieldName = 'Name'
      FixedChar = True
      Size = 80
    end
    object GetEnquiriesSQLBranch_Name: TWideStringField
      FieldName = 'Branch_Name'
      FixedChar = True
      Size = 80
    end
    object GetEnquiriesSQLName_1: TWideStringField
      FieldName = 'Name_1'
      FixedChar = True
      Size = 80
    end
    object GetEnquiriesSQLDate_Point: TDateTimeField
      FieldName = 'Date_Point'
    end
    object GetEnquiriesSQLQuote_Required_By: TDateTimeField
      FieldName = 'Quote_Required_By'
    end
    object GetEnquiriesSQLName_2: TWideStringField
      FieldName = 'Name_2'
      FixedChar = True
      Size = 80
    end
    object GetEnquiriesSQLDescription: TWideStringField
      FieldName = 'Description'
      FixedChar = True
      Size = 80
    end
    object GetEnquiriesSQLEnq_InActive: TWideStringField
      FieldName = 'Enq_InActive'
      FixedChar = True
      Size = 2
    end
    object GetEnquiriesSQLSupplier_Count: TIntegerField
      FieldName = 'Supplier_Count'
    end
  end
  object EnquiriesSRC: TDataSource
    DataSet = GetEnquiriesSQL
    Left = 424
    Top = 50
  end
  object CompSRC: TDataSource
    DataSet = GetCompSQL
    Left = 499
    Top = 113
  end
  object GetCompSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select * from Company'
      'Where Company = 1')
    Left = 424
    Top = 111
  end
  object GetQtysSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Distinct Quantity From Enquiry_LineQuantity'
      'Where (Enquiry = :Enquiry) and'
      '      (Line = :Line)'
      'Order By Quantity'
      ' ')
    Left = 232
    Top = 112
    ParamData = <
      item
        Name = 'Enquiry'
      end
      item
        Name = 'Line'
      end>
  end
  object qryDummy: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  EnquiryLine.Enquiry,'
      '        EnquiryLine.Line,'
      '        EnquiryLine.Form_Description,'
      '        Customer.Name,'
      '        Customer_Branch.Name AS Branch_Name,'
      '        Rep.Name,'
      '        Enquiry.Date_Point,'
      '        Enquiry.Quote_Required_By,'
      '        Operator.Name,'
      '        Enquiry_Status.Description,'
      '        EnquiryLine.Enq_InActive,'
      '        (select count(supplier)'
      '        from supplier_enquiry'
      '        where Supplier_enquiry.enquiry = enquiryline.enquiry and'
      
        '              Supplier_enquiry.line = enquiryline.line) as Suppl' +
        'ier_Count'
      
        'FROM Operator INNER JOIN (Enquiry_Status INNER JOIN ((Customer_B' +
        'ranch'
      'INNER JOIN ((Enquiry INNER JOIN Rep ON Enquiry.Rep = Rep.Rep)'
      'INNER JOIN Customer ON Enquiry.Customer = Customer.Customer) ON'
      ' (Customer.Customer = Customer_Branch.Customer) AND'
      ' (Customer_Branch.Branch_no = Enquiry.Branch_no) AND'
      ' (Customer_Branch.Customer = Enquiry.Customer))'
      
        ' INNER JOIN EnquiryLine ON Enquiry.Enquiry = EnquiryLine.Enquiry' +
        ') ON'
      ' Enquiry_Status.Enquiry_Status = EnquiryLine.Enquiry_Status) ON'
      '  (Operator.Operator = Enquiry.Operator) AND'
      '   (Operator.Operator = Enquiry.Office_Contact)'
      'WHERE ((Enquiry.Rep = :Rep) or (:Rep = 0)) and'
      
        '      ((Enquiry.Office_Contact = :Office_Contact) or (:Office_Co' +
        'ntact = 0)) and'
      
        '   ((EnquiryLine.Enq_InActive <> :nonactive) or (:nonactive = '#39#39 +
        ')) and'
      
        '   ((Enquiry.Date_Point >= :DateFrom) and (Enquiry.Date_Point <=' +
        ' :DateTo))'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 232
    Top = 55
    ParamData = <
      item
        Name = 'Rep'
        DataType = ftInteger
      end
      item
        Name = 'Rep'
        DataType = ftInteger
      end
      item
        Name = 'Office_Contact'
      end
      item
        Name = 'Office_Contact'
      end
      item
        Name = 'nonactive'
        DataType = ftString
      end
      item
        Name = 'nonactive'
        DataType = ftString
      end
      item
        Name = 'DateFrom'
        DataType = ftDateTime
      end
      item
        Name = 'DateTo'
        DataType = ftDateTime
      end>
    object StringField1: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'CustName'
      Calculated = True
    end
    object IntegerField1: TIntegerField
      FieldName = 'Enquiry'
    end
    object IntegerField2: TIntegerField
      FieldName = 'Line'
    end
    object StringField2: TWideStringField
      FieldName = 'Form_Description'
      FixedChar = True
      Size = 160
    end
    object StringField3: TWideStringField
      FieldName = 'Name'
      FixedChar = True
      Size = 80
    end
    object StringField4: TWideStringField
      FieldName = 'Branch_Name'
      FixedChar = True
      Size = 80
    end
    object StringField5: TWideStringField
      FieldName = 'Name_1'
      FixedChar = True
      Size = 80
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'Date_Point'
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'Quote_Required_By'
    end
    object StringField6: TWideStringField
      FieldName = 'Name_2'
      FixedChar = True
      Size = 80
    end
    object StringField7: TWideStringField
      FieldName = 'Description'
      FixedChar = True
      Size = 80
    end
    object StringField8: TWideStringField
      FieldName = 'Enq_InActive'
      FixedChar = True
      Size = 2
    end
    object IntegerField3: TIntegerField
      FieldName = 'Supplier_Count'
    end
  end
end
