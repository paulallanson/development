object PBRPClientServsWIPFrm: TPBRPClientServsWIPFrm
  Left = 90
  Top = 114
  Caption = 'Client Services - Work in Progress Report'
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
    ReportTitle = 'Client Services - Work in Progress Report'
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
        Left = 383
        Top = 10
        Width = 509
        Height = 33
        Size.Values = (
          69.850000000000000000
          810.683333333333300000
          21.166666666666670000
          1077.383333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Client Services - Work in Progress Report'
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
        Left = 320
        Top = 110
        Width = 49
        Height = 21
        Size.Values = (
          44.450000000000000000
          677.333333333333300000
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
        Left = 1010
        Top = 94
        Width = 71
        Height = 35
        Size.Values = (
          74.083333333333340000
          2137.833333333333000000
          198.437500000000000000
          150.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'SEPs to Client Date'
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
        Left = 1098
        Top = 93
        Width = 87
        Height = 36
        Size.Values = (
          76.729166666666680000
          2323.041666666667000000
          195.791666666666700000
          185.208333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'SEPs Approval Date'
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
        Left = 786
        Top = 110
        Width = 88
        Height = 21
        Size.Values = (
          44.450000000000000000
          1663.700000000000000000
          232.833333333333300000
          186.266666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
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
        Left = 900
        Top = 94
        Width = 91
        Height = 35
        Size.Values = (
          74.083333333333340000
          1905.000000000000000000
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
        Left = 720
        Top = 110
        Width = 50
        Height = 21
        Size.Values = (
          44.450000000000000000
          1524.000000000000000000
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
        Width = 115
        Height = 21
        Size.Values = (
          44.450000000000000000
          21.166666666666670000
          29.633333333333330000
          243.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblGroupHeader'
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
      object qrdbtext: TQRDBText
        Left = 180
        Top = 14
        Width = 54
        Height = 21
        Size.Values = (
          44.450000000000000000
          381.000000000000000000
          29.633333333333330000
          114.300000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
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
    object QRSubDetail1: TQRSubDetail
      Left = 47
      Top = 231
      Width = 1309
      Height = 30
      AfterPrint = QRSubDetail1AfterPrint
      AlignToBottom = False
      BeforePrint = QRSubDetail1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.500000000000000000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpDetails
      DataSet = qryReport
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText1: TQRDBText
        Left = 23
        Top = 4
        Width = 51
        Height = 20
        Size.Values = (
          42.333333333333330000
          48.683333333333330000
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
          42.333333333333340000
          190.500000000000000000
          7.937500000000000000
          447.145833333333400000)
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
      object QRDBText3: TQRDBText
        Left = 318
        Top = 4
        Width = 391
        Height = 20
        Size.Values = (
          42.333333333333340000
          672.041666666666800000
          7.937500000000000000
          828.145833333333200000)
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
      object QRDBText8: TQRDBText
        Left = 721
        Top = 4
        Width = 50
        Height = 20
        Size.Values = (
          42.333333333333330000
          1526.116666666667000000
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
        Left = 1200
        Top = 4
        Width = 97
        Height = 20
        Size.Values = (
          42.333333333333330000
          2540.000000000000000000
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
        Left = 893
        Top = 3
        Width = 97
        Height = 19
        Size.Values = (
          40.216666666666670000
          1890.183333333333000000
          6.350000000000000000
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
        Left = 783
        Top = 3
        Width = 97
        Height = 19
        Size.Values = (
          40.216666666666670000
          1657.350000000000000000
          6.350000000000000000
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
      object qrlblSEPApprovalDate: TQRLabel
        Left = 1058
        Top = 3
        Width = 128
        Height = 19
        Size.Values = (
          40.216666666666670000
          2239.433333333333000000
          6.350000000000000000
          270.933333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblSEPApprovalDate'
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
      object qrlblSEPtoClientDate: TQRLabel
        Left = 953
        Top = 3
        Width = 123
        Height = 19
        Size.Values = (
          40.216666666666670000
          2017.183333333333000000
          6.350000000000000000
          260.350000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblSEPtoClientDate'
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
      '      Job_Bag.Goods_Required >= :Date_From and'
      '      Job_Bag.Goods_Required <= :Date_To and'
      
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
