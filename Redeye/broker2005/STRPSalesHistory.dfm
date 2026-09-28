object STRPSalesHistoryFrm: TSTRPSalesHistoryFrm
  Left = 248
  Top = 114
  Caption = 'Sales History Report'
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
        Left = 296
        Top = 10
        Width = 306
        Height = 29
        Size.Values = (
          61.383333333333330000
          626.533333333333300000
          21.166666666666670000
          647.700000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Sales History Report by Product'
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
        Left = 488
        Top = 101
        Width = 82
        Height = 19
        Size.Values = (
          40.216666666666670000
          1032.933333333333000000
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
        Left = 775
        Top = 100
        Width = 40
        Height = 21
        Size.Values = (
          44.450000000000000000
          1640.416666666667000000
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
        Left = 8
        Top = 101
        Width = 50
        Height = 19
        Size.Values = (
          40.216666666666670000
          16.933333333333330000
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
        Left = 188
        Top = 101
        Width = 72
        Height = 19
        Size.Values = (
          40.216666666666670000
          397.933333333333300000
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
      Expression = 'qryReport.Part'
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
      object QRDBText4: TQRDBText
        Left = 782
        Top = 1
        Width = 38
        Height = 19
        Size.Values = (
          40.216666666666670000
          1655.233333333333000000
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
        Left = 5
        Top = 1
        Width = 176
        Height = 19
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          2.645833333333333000
          373.062500000000000000)
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
      object qrdbPartDescription: TQRDBText
        Left = 190
        Top = 1
        Width = 291
        Height = 19
        Size.Values = (
          39.687500000000000000
          402.166666666666600000
          2.645833333333333000
          616.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
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
      object qrlblDeliveryLocation: TQRLabel
        Left = 486
        Top = 1
        Width = 275
        Height = 19
        Size.Values = (
          39.687500000000000000
          1029.229166666667000000
          2.645833333333333000
          582.083333333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlblDeliveryLocation'
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
        Left = 733
        Top = 8
        Width = 90
        Height = 19
        Size.Values = (
          40.216666666666670000
          1551.516666666667000000
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
      object QRDBText5: TQRDBText
        Left = 5
        Top = 8
        Width = 176
        Height = 19
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          15.875000000000000000
          373.062500000000000000)
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
      object QRDBText6: TQRDBText
        Left = 190
        Top = 8
        Width = 330
        Height = 19
        Size.Values = (
          39.687500000000000000
          402.166666666666600000
          15.875000000000000000
          698.500000000000000000)
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
      object qrshpBottom: TQRShape
        Left = 711
        Top = 25
        Width = 113
        Height = 9
        Size.Values = (
          18.520833333333340000
          1505.479166666667000000
          52.916666666666660000
          238.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrshpTop: TQRShape
        Left = 711
        Top = 1
        Width = 113
        Height = 9
        Size.Values = (
          18.520833333333340000
          1505.479166666667000000
          2.645833333333333000
          238.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrlblTotalUsageLabel: TQRLabel
        Left = 622
        Top = 8
        Width = 70
        Height = 19
        Size.Values = (
          40.216666666666670000
          1316.566666666667000000
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
      object qrlblTotalInactive: TQRLabel
        Left = 820
        Top = 8
        Width = 68
        Height = 19
        Size.Values = (
          40.216666666666670000
          1735.666666666667000000
          16.933333333333330000
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
  end
  object qryReport: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Part.Part,'
      #9'      Part.Part_Description,'
      #9'      Part.Not_In_Use,'
      '        Product_Type.Description as Product_Type_Description,'
      #9'      Customer.Name as Customer_Name'
      'FROM Customer'
      #9'RIGHT JOIN (Product_Type '
      #9'RIGHT JOIN Part '
      #9#9'ON Product_Type.Product_Type = Part.Product_Type) '
      #9#9'ON Customer.Customer = Part.Customer'
      'WHERE'
      '    (Part.Part >= :Part_From and Part.Part <= :Part_To) AND'
      '    ((Part.Customer = :Customer) or (:Customer = 0)) AND'
      
        '    ((Part.Product_Type = :Product_Type) or (:Product_Type = 0))' +
        ' AND'
      '    ((Part.Not_in_Use = '#39'N'#39') OR'
      '    (Part.Not_in_Use = :Not_in_Use))'
      'ORDER BY Customer.Name, Part.Part'
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
        Name = 'Part_From'
      end
      item
        Name = 'Part_To'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Product_Type'
      end
      item
        Name = 'Product_Type'
      end
      item
        Name = 'Not_in_Use'
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
      'SELECT '
      '  '#9'Sales_Order_Line.Part,'
      #9#9'Sum(Sales_Order_line.Quantity_Delivered) AS Usage, '
      #9#9'Customer.Name as Customer_Name,'
      #9#9'Customer_Branch.Name as Branch_Name,'
      #9#9'CASE WHEN Sales_Order.Delivery_Customer = 0 THEN'
      #9#9#9'(SELECT Ad_Hoc_Address.Name'
      #9#9#9' FROM Ad_Hoc_Address'
      
        #9#9#9' WHERE Ad_Hoc_Address.Ad_Hoc_Address = Sales_Order.Ad_Hoc_Add' +
        'ress)'
      #9#9'ELSE'
      #9#9#9'(SELECT Customer_Branch.Name'
      #9#9#9' FROM Customer_Branch'
      
        #9#9#9' WHERE Customer_Branch.Customer = Sales_Order.Delivery_Custom' +
        'er AND'
      #9#9#9#9#9'Customer_Branch.Branch_no = Sales_Order.Delivery_Branch)'
      #9#9'END AS Delivery_Name'
      'FROM (Customer '
      #9#9'RIGHT JOIN (Customer_Branch '
      #9#9'RIGHT JOIN Sales_Order '
      
        #9#9#9'ON (Customer_Branch.Customer = Sales_Order.Delivery_Customer)' +
        ' AND (Customer_Branch.Branch_no = Sales_Order.Delivery_Branch)) '
      
        #9#9#9'ON Customer.Customer = Customer_Branch.Customer) RIGHT JOIN S' +
        'ales_Order_line '
      #9#9#9'ON Sales_Order.Sales_Order = Sales_Order_line.Sales_Order'
      'WHERE Sales_order_line.Part = :Part AND'
      
        #9#9'((Sales_Order.Date_Required >= :Date_From) AND (Sales_order.Da' +
        'te_Required <= :Date_To)) AND'
      
        '    ((Sales_Order.Order_Type ='#39'C'#39') OR (Sales_Order.Order_Type = ' +
        #39'S'#39') OR (Sales_Order.Order_Type ='#39'W'#39'))'
      'GROUP BY Sales_Order_line.Part, '
      #9#9'Customer.Name,'
      #9#9'Customer_Branch.Name,'
      #9#9'Ad_hoc_Address,'
      #9#9'Delivery_Customer,'
      #9#9'Delivery_Branch'
      '')
    Left = 126
    Top = 94
    ParamData = <
      item
        Name = 'Part'
        ParamType = ptInput
      end
      item
        Name = 'Date_From'
        ParamType = ptInput
      end
      item
        Name = 'Date_To'
        ParamType = ptInput
      end>
  end
  object qryBranches: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Customer_Branch.Name as Branch_Name,'
      '        Customer.Name as Customer_Name'
      'FROM Customer'
      '    INNER JOIN Customer_Branch'
      '      ON Customer.Customer = Customer_Branch.Customer'
      'WHERE Customer_Branch.Customer = :Customer'
      'ORDER BY Customer_Branch.Name')
    Left = 368
    Top = 40
    ParamData = <
      item
        Name = 'Customer'
      end>
  end
end
