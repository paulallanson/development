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
  Scaled = True
  TextHeight = 14
  object QRLabel6: TQRLabel
    Left = 448
    Top = 176
    Width = 10
    Height = 10
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
  object QRDBText6: TQRDBText
    Left = 504
    Top = 176
    Width = 10
    Height = 10
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
    Transparent = False
    ExportAs = exptText
    WrapStyle = BreakOnSpaces
    FullJustify = False
    MaxBreakChars = 0
    VerticalAlignment = tlTop
    FontSize = 8
  end
  object QRLabel7: TQRLabel
    Left = 448
    Top = 213
    Width = 10
    Height = 10
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
  object QRDBText7: TQRDBText
    Left = 504
    Top = 213
    Width = 10
    Height = 10
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
    Width = 1123
    Height = 794
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
      Left = 38
      Top = 38
      Width = 1047
      Height = 115
      Frame.DrawBottom = True
      Frame.Width = 2
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        304.270833333333300000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object QRLabel9: TQRLabel
        Left = 1
        Top = 94
        Width = 53
        Height = 17
        Size.Values = (
          44.979166666666670000
          2.645833333333333000
          248.708333333333300000
          140.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Enquiry No'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      object QRLabel11: TQRLabel
        Left = 316
        Top = 94
        Width = 90
        Height = 17
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
      object QRLabel10: TQRLabel
        Left = 488
        Top = 94
        Width = 60
        Height = 17
        Size.Values = (
          44.979166666666670000
          1291.166666666667000000
          248.708333333333300000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Required By'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      object QRLabel12: TQRLabel
        Left = 560
        Top = 94
        Width = 49
        Height = 17
        Size.Values = (
          44.979166666666670000
          1481.666666666667000000
          248.708333333333300000
          129.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Quantities'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      object RunDateQRLabel: TQRLabel
        Left = 433
        Top = 8
        Width = 181
        Height = 28
        Size.Values = (
          74.083333333333330000
          1145.645833333333000000
          21.166666666666670000
          478.895833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Enquiries Report'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -24
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
        Left = 64
        Top = 94
        Width = 23
        Height = 17
        Size.Values = (
          44.979166666666670000
          169.333333333333300000
          248.708333333333300000
          60.854166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      object QRLblCst: TQRLabel
        Left = 120
        Top = 94
        Width = 47
        Height = 17
        Size.Values = (
          44.979166666666670000
          317.500000000000000000
          248.708333333333300000
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
      object QRLblStatus: TQRLabel
        Left = 741
        Top = 94
        Width = 32
        Height = 15
        Size.Values = (
          39.687500000000000000
          1960.562500000000000000
          248.708333333333300000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Status'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLblCntct: TQRLabel
        Left = 869
        Top = 94
        Width = 71
        Height = 15
        Size.Values = (
          39.687500000000000000
          2299.229166666667000000
          248.708333333333300000
          187.854166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Office Contact'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRSysData1: TQRSysData
        Left = 966
        Top = 8
        Width = 69
        Height = 17
        Size.Values = (
          44.979166666666670000
          2555.875000000000000000
          21.166666666666670000
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
        Left = 979
        Top = 32
        Width = 56
        Height = 17
        Size.Values = (
          44.979166666666670000
          2590.270833333333000000
          84.666666666666670000
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
      object QRLblRep: TQRLabel
        Left = 493
        Top = 60
        Width = 60
        Height = 17
        Size.Values = (
          44.979166666666670000
          1304.395833333333000000
          158.750000000000000000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'QRLblRep'
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
      object QRLblInactive: TQRLabel
        Left = 1021
        Top = 92
        Width = 26
        Height = 15
        Size.Values = (
          39.687500000000000000
          2701.395833333333000000
          243.416666666666700000
          68.791666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'InAct'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlblDtRng: TQRLabel
        Left = 447
        Top = 40
        Width = 153
        Height = 17
        Size.Values = (
          44.979166666666670000
          1182.687500000000000000
          105.833333333333300000
          404.812500000000000000)
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
      object QRLabel2: TQRLabel
        Left = 965
        Top = 82
        Width = 44
        Height = 30
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
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
    end
    object qrgSortBy: TQRGroup
      Left = 38
      Top = 153
      Width = 1047
      Height = 32
      AlignToBottom = False
      BeforePrint = qrgSortByBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        84.666666666666670000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'GetEnquiriesSQL.Name_1'
      Master = QRSubDetail1
      ReprintOnNewPage = False
      object qrdbSortName: TQRDBText
        Left = 9
        Top = 8
        Width = 40
        Height = 15
        Size.Values = (
          39.687500000000000000
          23.812500000000000000
          21.166666666666670000
          105.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = GetEnquiriesSQL
        DataField = 'Name_1'
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
      Left = 38
      Top = 185
      Width = 1047
      Height = 25
      AfterPrint = QRSubDetail1AfterPrint
      AlignToBottom = False
      BeforePrint = QRSubDetail1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        66.145833333333330000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpdetails
      DataSet = GetEnquiriesSQL
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText3: TQRDBText
        Left = 950
        Top = 2
        Width = 74
        Height = 15
        Size.Values = (
          39.687500000000000000
          2513.541666666667000000
          5.291666666666667000
          195.791666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Color = clWhite
        DataSet = GetEnquiriesSQL
        DataField = 'Supplier_Count'
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
        Top = 2
        Width = 48
        Height = 17
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
      object QRLblEnqDt: TQRLabel
        Left = 64
        Top = 2
        Width = 58
        Height = 17
        Size.Values = (
          44.979166666666670000
          169.333333333333300000
          5.291666666666667000
          153.458333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'QRLblEnqDt'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRDBText1: TQRDBText
        Left = 120
        Top = 2
        Width = 191
        Height = 17
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
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object JobDescrQRDBText: TQRDBText
        Left = 316
        Top = 2
        Width = 178
        Height = 17
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
      object QRLblRqby: TQRLabel
        Left = 491
        Top = 2
        Width = 55
        Height = 17
        Size.Values = (
          44.979166666666670000
          1299.104166666667000000
          5.291666666666667000
          145.520833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'QRLblRqby'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QtysQRMemo: TQRMemo
        Left = 560
        Top = 2
        Width = 177
        Height = 17
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
        Font.Height = -11
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
        Left = 741
        Top = 2
        Width = 121
        Height = 15
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
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRDBtxtOp: TQRDBText
        Left = 869
        Top = 2
        Width = 92
        Height = 15
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
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRlblLve: TQRLabel
        Left = 1033
        Top = 4
        Width = 5
        Height = 15
        Size.Values = (
          39.687500000000000000
          2733.145833333333000000
          10.583333333333330000
          13.229166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '*'
        Color = clWhite
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
    object GetEnquiriesSQLCustName: TStringField
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
    object GetEnquiriesSQLForm_Description: TStringField
      FieldName = 'Form_Description'
      FixedChar = True
      Size = 160
    end
    object GetEnquiriesSQLName: TStringField
      FieldName = 'Name'
      FixedChar = True
      Size = 80
    end
    object GetEnquiriesSQLBranch_Name: TStringField
      FieldName = 'Branch_Name'
      FixedChar = True
      Size = 80
    end
    object GetEnquiriesSQLName_1: TStringField
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
    object GetEnquiriesSQLName_2: TStringField
      FieldName = 'Name_2'
      FixedChar = True
      Size = 80
    end
    object GetEnquiriesSQLDescription: TStringField
      FieldName = 'Description'
      FixedChar = True
      Size = 80
    end
    object GetEnquiriesSQLEnq_InActive: TStringField
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
    object StringField1: TStringField
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
    object StringField2: TStringField
      FieldName = 'Form_Description'
      FixedChar = True
      Size = 160
    end
    object StringField3: TStringField
      FieldName = 'Name'
      FixedChar = True
      Size = 80
    end
    object StringField4: TStringField
      FieldName = 'Branch_Name'
      FixedChar = True
      Size = 80
    end
    object StringField5: TStringField
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
    object StringField6: TStringField
      FieldName = 'Name_2'
      FixedChar = True
      Size = 80
    end
    object StringField7: TStringField
      FieldName = 'Description'
      FixedChar = True
      Size = 80
    end
    object StringField8: TStringField
      FieldName = 'Enq_InActive'
      FixedChar = True
      Size = 2
    end
    object IntegerField3: TIntegerField
      FieldName = 'Supplier_Count'
    end
  end
end
