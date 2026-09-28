object STRPSalesHistoryLocFrm: TSTRPSalesHistoryLocFrm
  Left = 248
  Top = 114
  Caption = 'Sales History - by Location Report'
  ClientHeight = 524
  ClientWidth = 1285
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Scaled = False
  TextHeight = 13
  object qrpDetails: TQuickRep
    Left = 104
    Top = 24
    Width = 992
    Height = 1403
    ShowingPreview = False
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
    PrevInitialZoom = qrZoomToFit
    PreviewDefaultSaveType = stPDF
    PreviewLeft = 0
    PreviewTop = 0
    object QRBand1: TQRBand
      Left = 47
      Top = 47
      Width = 898
      Height = 124
      Frame.DrawBottom = True
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        262.466666666666700000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object gtQRLabel1: TQRLabel
        Left = 292
        Top = 10
        Width = 313
        Height = 29
        Size.Values = (
          61.383333333333330000
          618.066666666666700000
          21.166666666666670000
          662.516666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Sales History Report by Location'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRSysData2: TQRSysData
        Left = 805
        Top = 14
        Width = 84
        Height = 21
        Size.Values = (
          44.450000000000000000
          1703.916666666667000000
          29.633333333333330000
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
      object qrlblDateSelection: TQRLabel
        Left = 386
        Top = 60
        Width = 126
        Height = 21
        Size.Values = (
          44.450000000000000000
          817.033333333333300000
          127.000000000000000000
          266.700000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Date Range From: '
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
      object qrlblDelivery: TQRLabel
        Left = 18
        Top = 101
        Width = 82
        Height = 19
        Size.Values = (
          40.216666666666670000
          38.100000000000000000
          213.783333333333300000
          173.566666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Delivered To'
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
      object QRSysData1: TQRSysData
        Left = 821
        Top = 35
        Width = 68
        Height = 21
        Size.Values = (
          44.450000000000000000
          1737.783333333333000000
          74.083333333333330000
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
      object gtQRLabel4: TQRLabel
        Left = 770
        Top = 100
        Width = 40
        Height = 21
        Size.Values = (
          44.450000000000000000
          1629.833333333333000000
          211.666666666666700000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Usage'
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
      object qrlblSelection: TQRLabel
        Left = 384
        Top = 39
        Width = 130
        Height = 21
        Size.Values = (
          44.450000000000000000
          812.800000000000000000
          82.550000000000000000
          275.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Customer Selection'
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
      object gtQRLabel2: TQRLabel
        Left = 193
        Top = 101
        Width = 50
        Height = 19
        Size.Values = (
          40.216666666666670000
          408.516666666666700000
          213.783333333333300000
          105.833333333333300000)
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
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtQRLabel3: TQRLabel
        Left = 379
        Top = 101
        Width = 72
        Height = 19
        Size.Values = (
          40.216666666666670000
          802.216666666666700000
          213.783333333333300000
          152.400000000000000000)
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
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtQRLabel5: TQRLabel
        Left = 836
        Top = 100
        Width = 51
        Height = 21
        Size.Values = (
          44.450000000000000000
          1769.533333333333000000
          211.666666666666700000
          107.950000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Inactive'
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
    end
    object qrbCustHeader: TQRGroup
      Left = 47
      Top = 171
      Width = 898
      Height = 30
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        63.500000000000000000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'qryReport.Customer_Name'
      Master = QRSubDetail1
      ReprintOnNewPage = False
      object QRDBText1: TQRDBText
        Left = 6
        Top = 0
        Width = 131
        Height = 21
        Size.Values = (
          44.450000000000000000
          12.700000000000000000
          0.000000000000000000
          277.283333333333300000)
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
    object qrbPartHeader: TQRGroup
      Left = 47
      Top = 201
      Width = 898
      Height = 3
      AlignToBottom = False
      BeforePrint = qrbPartHeaderBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        6.350000000000000000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'qryReport.Delivery_Name'
      FooterBand = qrpPartFooter
      Master = QRSubDetail1
      ReprintOnNewPage = False
    end
    object QRSubDetail1: TQRSubDetail
      Left = 47
      Top = 204
      Width = 898
      Height = 23
      AlignToBottom = False
      Enabled = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        48.683333333333330000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpDetails
      DataSet = qryReport
      PrintBefore = False
      PrintIfEmpty = True
    end
    object QRSubDetail2: TQRSubDetail
      Left = 47
      Top = 227
      Width = 898
      Height = 25
      AlignToBottom = False
      BeforePrint = QRSubDetail2BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.916666666666670000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = QRSubDetail1
      DataSet = qryUsage
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText4: TQRDBText
        Left = 775
        Top = 1
        Width = 38
        Height = 19
        Size.Values = (
          40.216666666666670000
          1640.416666666667000000
          2.116666666666667000
          80.433333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryUsage
        DataField = 'Usage'
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
      object qrdbPart: TQRDBText
        Left = 195
        Top = 1
        Width = 176
        Height = 19
        Size.Values = (
          39.687500000000000000
          412.750000000000100000
          2.645833333333333000
          373.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryUsage
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
      object qrdbPartDescription: TQRDBText
        Left = 380
        Top = 1
        Width = 331
        Height = 19
        Size.Values = (
          39.687500000000000000
          804.333333333333200000
          2.645833333333333000
          701.145833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryUsage
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
      object qrdbLocation: TQRDBText
        Left = 20
        Top = 1
        Width = 87
        Height = 19
        Size.Values = (
          40.216666666666670000
          42.333333333333330000
          2.116666666666667000
          184.150000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Delivery_Name'
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
      object qrlblInactive: TQRLabel
        Left = 820
        Top = 1
        Width = 68
        Height = 19
        Size.Values = (
          40.216666666666670000
          1735.666666666667000000
          2.116666666666667000
          143.933333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblInactive'
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
    object qrpPartFooter: TQRBand
      Left = 47
      Top = 252
      Width = 898
      Height = 36
      AlignToBottom = False
      BeforePrint = qrpPartFooterBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        76.200000000000000000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object qrlblTotalUsage: TQRLabel
        Left = 723
        Top = 8
        Width = 90
        Height = 19
        Size.Values = (
          40.216666666666670000
          1530.350000000000000000
          16.933333333333330000
          190.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblTotalUsage'
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
      object qrshpBottom: TQRShape
        Left = 701
        Top = 25
        Width = 113
        Height = 9
        Size.Values = (
          18.520833333333330000
          1484.312500000000000000
          52.916666666666660000
          238.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrshpTop: TQRShape
        Left = 701
        Top = 1
        Width = 113
        Height = 9
        Size.Values = (
          18.520833333333330000
          1484.312500000000000000
          2.645833333333333000
          238.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrlblTotalUsageLabel: TQRLabel
        Left = 612
        Top = 8
        Width = 70
        Height = 19
        Size.Values = (
          40.216666666666670000
          1295.400000000000000000
          16.933333333333330000
          148.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Total Usage'
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
        Left = 470
        Top = 8
        Width = 87
        Height = 19
        Size.Values = (
          40.216666666666670000
          994.833333333333300000
          16.933333333333330000
          184.150000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Delivery_Name'
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
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Customer_Branch.Customer,'
      '        Customer_Branch.Branch_no,'
      '        Customer_Branch.Name as Delivery_Name,'
      '        Customer.Name as Customer_Name'
      'FROM Customer'
      '    INNER JOIN Customer_Branch'
      '      ON Customer.Customer = Customer_Branch.Customer'
      
        'WHERE ((Customer_Branch.Customer = :Customer) or (:Customer = 0)' +
        ')'
      'ORDER BY Customer.Name, Customer_Branch.Name'
      ''
      ''
      ''
      ' '
      ' '
      '')
    Left = 120
    Top = 40
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Customer'
      end>
  end
  object dtsReport: TDataSource
    DataSet = qryReport
    Left = 184
    Top = 40
  end
  object qryUsage: TFDQuery
    MasterSource = dtsReport
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT'#9'TOP :Record_List'
      '  '#9'Part.Part,'
      #9#9'Part.Part_Description,'
      '    Part.Not_in_Use,'
      #9#9'Product_type.Description as Product_Type_Description,'
      #9#9'sum(Sales_Order_line.Quantity_Delivered) as Usage'
      'FROM Product_Type '
      #9#9'RIGHT JOIN (Customer '
      #9#9'RIGHT JOIN (Customer_Branch '
      #9#9'RIGHT JOIN (Sales_Order '
      #9#9'RIGHT JOIN (Part '
      #9#9'LEFT JOIN Sales_Order_line '
      #9#9#9'ON Part.Part = Sales_Order_line.Part) '
      #9#9#9'ON Sales_Order.Sales_Order = Sales_Order_line.Sales_Order) '
      
        #9#9#9'ON (Customer_Branch.Branch_no = Sales_Order.Delivery_Branch) ' +
        'AND (Customer_Branch.Customer = Sales_Order.Delivery_Customer)) '
      #9#9#9'ON Customer.Customer = Customer_Branch.Customer) '
      #9#9#9'ON Product_Type.Product_Type = Part.Product_Type'
      
        'WHERE ((Sales_order.Delivery_Customer = :Customer) AND (Sales_or' +
        'der.Delivery_Branch = :Branch_no)) AND'
      '    ((Part.Part >= :Part_From) and (Part.Part <= :Part_To)) AND'
      
        '    ((Part.Product_Type = :Product_Type) or (:Product_Type = 0))' +
        ' AND'
      
        '    ((Part.Not_in_Use = '#39'N'#39') OR (Part.Not_in_Use = :Not_in_Use))' +
        ' AND'
      
        #9#9'((Sales_Order.Date_Required >= :Date_From) AND (Sales_order.Da' +
        'te_Required <= :Date_To)) AND'
      
        '    ((Sales_Order.Order_Type ='#39'C'#39') OR (Sales_Order.Order_Type = ' +
        #39'S'#39') OR (Sales_Order.Order_Type ='#39'W'#39'))'
      'GROUP BY Part.Part,'
      #9#9'Part.Part_Description,'
      '    Part.Not_in_Use,'
      #9#9'Product_type.Description')
    Left = 118
    Top = 110
    ParamData = <
      item
        Name = 'Record_List'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'Part_From'
      end
      item
        Name = 'Part_To'
      end
      item
        Name = 'Product_Type'
      end
      item
        Name = 'Product_Type'
      end
      item
        Name = 'Not_in_Use'
      end
      item
        Name = 'Date_From'
      end
      item
        Name = 'Date_To'
      end>
  end
end
