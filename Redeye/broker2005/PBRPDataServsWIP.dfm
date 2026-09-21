object PBRPDataServsWIPFrm: TPBRPDataServsWIPFrm
  Left = 90
  Top = 114
  Caption = 'Data Services - Work in Progress Report'
  ClientHeight = 531
  ClientWidth = 1134
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Scaled = False
  TextHeight = 13
  object qrpDetails: TQuickRep
    Left = 8
    Top = 8
    Width = 1403
    Height = 992
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
    ReportTitle = 'Data Services - Work in Progress Report'
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
    object qrbPageHeader: TQRBand
      Left = 47
      Top = 47
      Width = 1309
      Height = 134
      Frame.DrawBottom = True
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        283.633333333333300000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object qrlblTitle: TQRLabel
        Left = 389
        Top = 10
        Width = 497
        Height = 33
        Size.Values = (
          69.850000000000000000
          823.383333333333300000
          21.166666666666670000
          1051.983333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Data Services - Work in Progress Report'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 16
      end
      object QRSysData1: TQRSysData
        Left = 1232
        Top = 40
        Width = 68
        Height = 21
        Size.Values = (
          44.450000000000000000
          2607.733333333333000000
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
      object QRSysData2: TQRSysData
        Left = 1223
        Top = 10
        Width = 76
        Height = 21
        Size.Values = (
          44.450000000000000000
          2588.683333333333000000
          21.166666666666670000
          160.866666666666700000)
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
        Text = 'Page'
        Transparent = False
        ExportAs = exptText
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlblDateRange: TQRLabel
        Left = 543
        Top = 50
        Width = 230
        Height = 21
        Size.Values = (
          44.450000000000000000
          1149.350000000000000000
          105.833333333333300000
          486.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'From Live Proof Approval Date:'
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
      object QRLabel1: TQRLabel
        Left = 23
        Top = 110
        Width = 48
        Height = 20
        Size.Values = (
          42.333333333333330000
          48.683333333333330000
          232.833333333333300000
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
      object QRLabel2: TQRLabel
        Left = 90
        Top = 110
        Width = 57
        Height = 21
        Size.Values = (
          44.450000000000000000
          190.500000000000000000
          232.833333333333300000
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
      object QRLabel3: TQRLabel
        Left = 310
        Top = 110
        Width = 49
        Height = 21
        Size.Values = (
          44.450000000000000000
          656.166666666666700000
          232.833333333333300000
          103.716666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Job Title'
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
        Left = 760
        Top = 110
        Width = 64
        Height = 21
        Size.Values = (
          44.450000000000000000
          1608.666666666667000000
          232.833333333333300000
          135.466666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Brief to DS'
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
        Left = 850
        Top = 110
        Width = 63
        Height = 21
        Size.Values = (
          44.450000000000000000
          1799.166666666667000000
          232.833333333333300000
          133.350000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Text to DS'
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
        Left = 936
        Top = 96
        Width = 75
        Height = 31
        Size.Values = (
          66.145833333333330000
          1981.729166666667000000
          203.729166666666700000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Live Proof Date'
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
        Left = 1030
        Top = 94
        Width = 91
        Height = 35
        Size.Values = (
          74.083333333333340000
          2180.166666666667000000
          198.437500000000000000
          193.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Live Proof Approval Date'
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
        Left = 1210
        Top = 110
        Width = 83
        Height = 21
        Size.Values = (
          44.450000000000000000
          2561.166666666667000000
          232.833333333333300000
          175.683333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date Required'
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
      object QRLabel9: TQRLabel
        Left = 1140
        Top = 110
        Width = 50
        Height = 21
        Size.Values = (
          44.450000000000000000
          2413.000000000000000000
          232.833333333333300000
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
      object QRLabel10: TQRLabel
        Left = 690
        Top = 110
        Width = 42
        Height = 21
        Size.Values = (
          44.450000000000000000
          1460.500000000000000000
          232.833333333333300000
          88.900000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Data In'
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
    object qrGroup: TQRGroup
      Left = 47
      Top = 181
      Width = 1309
      Height = 50
      AlignToBottom = False
      Enabled = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'Job_Bag'
      Master = QRSubDetail1
      ReprintOnNewPage = False
      object qrlblGroupHeader: TQRLabel
        Left = 10
        Top = 14
        Width = 129
        Height = 21
        Size.Values = (
          44.450000000000000000
          21.166666666666670000
          29.633333333333330000
          273.050000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblGroupHeader'
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
      object qrdbtext: TQRDBText
        Left = 180
        Top = 14
        Width = 58
        Height = 21
        Size.Values = (
          44.450000000000000000
          381.000000000000000000
          29.633333333333330000
          122.766666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
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
    end
    object QRSubDetail1: TQRSubDetail
      Left = 47
      Top = 231
      Width = 1309
      Height = 29
      AfterPrint = QRSubDetail1AfterPrint
      AlignToBottom = False
      BeforePrint = QRSubDetail1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        61.383333333333330000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpDetails
      DataSet = qryReport
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText1: TQRDBText
        Left = 22
        Top = 4
        Width = 51
        Height = 20
        Size.Values = (
          42.333333333333330000
          46.566666666666670000
          8.466666666666667000
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
      object QRDBText2: TQRDBText
        Left = 90
        Top = 4
        Width = 211
        Height = 20
        Size.Values = (
          42.333333333333330000
          190.500000000000000000
          7.937500000000000000
          447.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Customer_Name'
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
        Left = 1141
        Top = 4
        Width = 50
        Height = 20
        Size.Values = (
          42.333333333333330000
          2415.116666666667000000
          8.466666666666667000
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
      object QRDBText9: TQRDBText
        Left = 1199
        Top = 4
        Width = 97
        Height = 20
        Size.Values = (
          42.333333333333330000
          2537.883333333333000000
          8.466666666666667000
          205.316666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Goods_Required'
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
      object qrlblLiveAppDate: TQRLabel
        Left = 1023
        Top = 4
        Width = 97
        Height = 20
        Size.Values = (
          42.333333333333330000
          2165.350000000000000000
          8.466666666666667000
          205.316666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblLiveAppDate'
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
      object qrlblLiveReqDate: TQRLabel
        Left = 913
        Top = 4
        Width = 97
        Height = 20
        Size.Values = (
          42.333333333333330000
          1932.516666666667000000
          8.466666666666667000
          205.316666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblLiveReqDate'
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
      object qrlblTextToDSDate: TQRLabel
        Left = 807
        Top = 4
        Width = 109
        Height = 20
        Size.Values = (
          42.333333333333330000
          1708.150000000000000000
          8.466666666666667000
          230.716666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblTextToDSDate'
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
      object qrlblBrieftoDSDate: TQRLabel
        Left = 719
        Top = 4
        Width = 107
        Height = 20
        Size.Values = (
          42.333333333333330000
          1521.883333333333000000
          8.466666666666667000
          226.483333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblBrieftoDSDate'
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
      object qrlblDataInDate: TQRLabel
        Left = 644
        Top = 4
        Width = 89
        Height = 20
        Size.Values = (
          42.333333333333330000
          1363.133333333333000000
          8.466666666666667000
          188.383333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblDataInDate'
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
      object QRDBText3: TQRDBText
        Left = 310
        Top = 4
        Width = 371
        Height = 20
        Size.Values = (
          42.333333333333330000
          656.166666666666700000
          7.937500000000000000
          785.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Job_Bag_descr'
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
  end
  object qryReport: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'SELECT'
      #9'Job_Bag_Schedule.*,'
      #9'Job_Bag.Job_Bag_Descr,'
      '  Job_Bag.Quantity,'
      '  Job_Bag.Goods_Required,'
      #9'Operator.Name as Account_Manager,'
      '  Customer.Name as Customer_Name'
      'FROM Operator '
      #9'RIGHT JOIN ((Job_Bag'
      #9'INNER JOIN Job_Bag_Schedule ON'
      #9#9'Job_Bag.Job_Bag = Job_Bag_Schedule.Job_Bag)'
      #9'INNER JOIN Customer ON'
      #9#9'Job_Bag.Customer = Customer.Customer) ON'
      #9#9'Operator.Operator = Job_Bag.Office_Contact'
      'WHERE Job_bag_Schedule.Schedule_no = '
      #9#9#9#9'(select top 1 JBS.Schedule_no'
      #9#9#9' '#9'from Job_bag_Schedule JBS'
      #9#9#9#9'where JBS.Job_bag = Job_bag_schedule.Job_bag'
      #9#9#9#9'order by JBS.Schedule_no desc) and'
      '      Job_Bag_Schedule.Proof_Approval_Date >= :Date_From and'
      '      Job_Bag_Schedule.Proof_Approval_Date <= :Date_To and'
      
        '      ((Job_Bag.Office_Contact = :Account_Manager) or (:Account_' +
        'Manager = 0)) and'
      '      ((Job_Bag.Customer = :Customer) or (:Customer = 0))'
      'ORDER BY Job_Bag_Schedule.Job_Bag, Job_Bag_Schedule.Schedule_no')
    Left = 51
    Top = 46
    ParamData = <
      item
        Name = 'Date_From'
      end
      item
        Name = 'Date_To'
      end
      item
        Name = 'Account_Manager'
      end
      item
        Name = 'Account_Manager'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Customer'
      end>
  end
  object qryDummy: TFDQuery
    SQL.Strings = (
      'SELECT'
      #9'Job_Bag_Schedule.*,'
      #9'Job_Bag.Job_Bag_Descr,'
      '  Job_Bag.Quantity,'
      '  Job_Bag.Goods_Required,'
      #9'Operator.Name as Account_Manager,'
      '  Customer.Name as Customer_Name'
      'FROM Operator '
      #9'RIGHT JOIN ((Job_Bag'
      #9'INNER JOIN Job_Bag_Schedule ON'
      #9#9'Job_Bag.Job_Bag = Job_Bag_Schedule.Job_Bag)'
      #9'INNER JOIN Customer ON'
      #9#9'Job_Bag.Customer = Customer.Customer) ON'
      #9#9'Operator.Operator = Job_Bag.Office_Contact'
      'WHERE Job_bag_Schedule.Schedule_no = '
      #9#9#9#9'(select top 1 JBS.Schedule_no'
      #9#9#9' '#9'from Job_bag_Schedule JBS'
      #9#9#9#9'where JBS.Job_bag = Job_bag_schedule.Job_bag'
      #9#9#9#9'order by JBS.Schedule_no desc) and'
      '      Job_Bag_Schedule.Proof_Required_Date >= :Date_From and'
      '      Job_Bag_Schedule.Proof_Required_Date <= :Date_To and'
      
        '      ((Job_bag_Schedule.Proof_Approval_Date_Act <= :Date_Zero) ' +
        'and (Job_bag_Schedule.Proof_Approval_Date_Act is not NULL)) and'
      
        '      ((Job_Bag.Office_Contact = :Account_Manager) or (:Account_' +
        'Manager = 0)) and'
      '      ((Job_Bag.Customer = :Customer) or (:Customer = 0))')
    Left = 208
    Top = 48
    ParamData = <
      item
        Name = 'Date_From'
      end
      item
        Name = 'Date_To'
      end
      item
        Name = 'Date_Zero'
      end
      item
        Name = 'Account_Manager'
      end
      item
        Name = 'Account_Manager'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Customer'
      end>
  end
end
