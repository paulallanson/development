object PBRPJobBagOversFrm: TPBRPJobBagOversFrm
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
      'REPORTTITLE'
      'QRLOOPBAND1')
    Functions.DATA = (
      '0'
      '0'
      #39#39
      '0')
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
        Left = 488
        Top = 10
        Width = 300
        Height = 33
        Size.Values = (
          69.850000000000000000
          1032.933333333333000000
          21.166666666666670000
          635.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Production Overs Report'
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
        Left = 528
        Top = 50
        Width = 222
        Height = 21
        Size.Values = (
          44.450000000000000000
          1117.600000000000000000
          105.833333333333300000
          469.900000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'From Job Bag Complete Date:'
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
        Left = 50
        Top = 110
        Width = 46
        Height = 21
        Size.Values = (
          44.450000000000000000
          105.833333333333300000
          232.833333333333300000
          97.366666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Product'
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
        Left = 280
        Top = 110
        Width = 66
        Height = 21
        Size.Values = (
          44.450000000000000000
          592.666666666666700000
          232.833333333333300000
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
      object QRLabel4: TQRLabel
        Left = 950
        Top = 111
        Width = 91
        Height = 19
        Size.Values = (
          39.687500000000000000
          2010.833333333333000000
          235.479166666666700000
          193.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Date Received'
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
        Left = 716
        Top = 110
        Width = 67
        Height = 21
        Size.Values = (
          44.450000000000000000
          1515.533333333333000000
          232.833333333333300000
          141.816666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Warehouse'
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
        Left = 834
        Top = 111
        Width = 91
        Height = 19
        Size.Values = (
          39.687500000000000000
          1764.770833333333000000
          235.479166666666700000
          193.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Bin Location'
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
        Left = 650
        Top = 110
        Width = 50
        Height = 21
        Size.Values = (
          44.450000000000000000
          1375.833333333333000000
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
      object QRLabel5: TQRLabel
        Left = 1090
        Top = 111
        Width = 91
        Height = 19
        Size.Values = (
          39.687500000000000000
          2307.166666666667000000
          235.479166666666700000
          193.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Action'
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
    object qrCustGroup: TQRGroup
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
      Expression = 'Customer_Name'
      Master = qrsubParts
      ReprintOnNewPage = False
      object qrlblGroupHeader: TQRLabel
        Left = 10
        Top = 14
        Width = 65
        Height = 21
        Size.Values = (
          44.450000000000000000
          21.166666666666670000
          29.633333333333330000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer:'
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
        Left = 120
        Top = 14
        Width = 105
        Height = 21
        Size.Values = (
          44.450000000000000000
          254.000000000000000000
          29.633333333333330000
          222.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Customer_Name'
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
    object qrsubParts: TQRSubDetail
      Left = 47
      Top = 255
      Width = 1309
      Height = 30
      AfterPrint = qrsubPartsAfterPrint
      AlignToBottom = False
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
      object QRDBText2: TQRDBText
        Left = 50
        Top = 4
        Width = 221
        Height = 20
        Size.Values = (
          42.333333333333330000
          105.833333333333300000
          7.937500000000000000
          468.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Part'
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
        Left = 278
        Top = 4
        Width = 354
        Height = 20
        Size.Values = (
          42.333333333333330000
          587.375000000000000000
          7.937500000000000000
          748.770833333333200000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Part_Description'
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
        Left = 613
        Top = 4
        Width = 88
        Height = 20
        Size.Values = (
          42.333333333333330000
          1297.516666666667000000
          8.466666666666667000
          186.266666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Store_Quantity'
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
        Left = 715
        Top = 4
        Width = 104
        Height = 20
        Size.Values = (
          42.333333333333330000
          1513.416666666667000000
          8.466666666666667000
          220.133333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Part_Store_Name'
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
        Left = 835
        Top = 4
        Width = 51
        Height = 20
        Size.Values = (
          42.333333333333330000
          1767.416666666667000000
          8.466666666666667000
          107.950000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Part_Bin'
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
        Left = 953
        Top = 4
        Width = 87
        Height = 20
        Size.Values = (
          42.333333333333330000
          2017.183333333333000000
          8.466666666666667000
          184.150000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Date_Received'
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
      object QRShape1: TQRShape
        Left = 1081
        Top = 3
        Width = 114
        Height = 23
        Size.Values = (
          47.625000000000000000
          2288.645833333333000000
          5.291666666666667000
          240.770833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
    end
    object qrPartGroup: TQRGroup
      Left = 47
      Top = 231
      Width = 1309
      Height = 24
      AlignToBottom = False
      BeforePrint = qrPartGroupBeforePrint
      Enabled = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        50.800000000000000000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'Part'
      Master = qrsubParts
      ReprintOnNewPage = False
      object QRLabel1: TQRLabel
        Left = 10
        Top = 0
        Width = 25
        Height = 21
        Size.Values = (
          44.450000000000000000
          21.166666666666670000
          0.000000000000000000
          52.916666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Part'
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
      'select DISTINCT'#9'Part.Part,'
      #9'Part.Part_Description,'
      #9'Part.Customer,'
      #9'Customer.Name as Customer_Name,'
      #9'Store_Stock.Store_Quantity,'
      #9'Store_Stock.Part_bin,'
      #9'Store_Stock.Store_Stock,'
      #9'Store_Stock.Pallet_ID,'
      #9'Store_Stock.Date_Received,'
      '  Part_Store.Part_Store_Name'
      
        'from job_bag, Job_Bag_stock_request, Part, Customer, store_stock' +
        ', Sales_Order_Line, Part_Store'
      'where'
      '((Job_Bag.goods_required >= :Date_From) and'
      '(Job_Bag.goods_required <= :Date_To)) and'
      '((Part.Customer = :Customer) or (:Customer = 0)) and'
      '(Job_bag.Job_bag = Job_bag_Stock_request.Job_Bag) and'
      
        '((Job_Bag_Stock_Request.Sales_Order = Sales_order_line.sales_ord' +
        'er) and'
      
        '(Job_Bag_Stock_Request.Sales_Order_line_no = Sales_order_line.Sa' +
        'les_order_line_no)) and'
      '(Sales_Order_line.part = part.part) and'
      '(Part.product_id = store_stock.product_id) and'
      '(Part.customer = customer.customer) and'
      '(Store_Stock.Part_Store = Part_Store.Part_Store) and'
      '(Store_Stock.Stock_is_Overs = '#39'Y'#39')')
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
        Name = 'Customer'
      end
      item
        Name = 'Customer'
      end>
  end
  object qryJobBags: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select DISTINCT Job_Bag.Job_Bag,'
      '        Job_Bag.Job_Bag_Descr,'
      '        Job_Bag.Cust_Order_No,'
      '        Job_Bag.Goods_Required,'
      '        Job_Bag.Date_Start'
      'from Sales_order_line, Job_bag_Stock_request, Job_Bag'
      'where Sales_Order_Line.Part = :Part and'
      '('
      '(Job_Bag.goods_required >= :Date_From) and'
      '(Job_Bag.goods_required <= :Date_To)'
      ') and'
      '('
      
        '(Sales_Order_Line.Sales_order = Job_Bag_Stock_Request.Sales_Orde' +
        'r) and'
      
        '(Sales_Order_Line.Sales_Order_Line_no = Job_Bag_Stock_Request.Sa' +
        'les_Order_Line_no)'
      ') and'
      '(Job_Bag_Stock_Request.Job_Bag = Job_Bag.Job_Bag)'
      'ORDER BY Job_Bag.Job_Bag'
      '')
    Left = 118
    Top = 102
    ParamData = <
      item
        Name = 'Part'
      end
      item
        Name = 'Date_From'
      end
      item
        Name = 'Date_To'
      end>
  end
  object dtsReport: TDataSource
    DataSet = qryReport
    Left = 118
    Top = 46
  end
end
