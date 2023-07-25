object STRPCustProdUsagefrm: TSTRPCustProdUsagefrm
  Left = 25
  Top = 103
  Caption = 'Customer Product usage report'
  ClientHeight = 714
  ClientWidth = 1009
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Scaled = False
  TextHeight = 13
  object QuickReport: TQuickRep
    Left = 0
    Top = 8
    Width = 992
    Height = 1403
    ShowingPreview = False
    BeforePrint = QuickReportBeforePrint
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
      76.200000000000000000
      2970.000000000000000000
      76.200000000000000000
      2100.000000000000000000
      76.200000000000000000
      76.200000000000000000
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
    PrinterSettings.PrintQuality = 0
    PrinterSettings.Collate = 0
    PrinterSettings.ColorOption = 0
    PrintIfEmpty = True
    SnapToGrid = True
    Units = Inches
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
      Left = 36
      Top = 36
      Width = 920
      Height = 131
      Frame.DrawBottom = True
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        277.283333333333300000
        1947.333333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object qrlblTitle: TQRLabel
        Left = 163
        Top = 10
        Width = 573
        Height = 25
        Size.Values = (
          52.916666666666670000
          345.016666666666700000
          21.166666666666670000
          1212.850000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Customer Stock Product usage summary report - Run Date: '
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
      object qrlblselection: TQRLabel
        Left = 370
        Top = 38
        Width = 95
        Height = 21
        Size.Values = (
          44.450000000000000000
          783.166666666666700000
          80.433333333333330000
          201.083333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'qrlblselection'
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
        Left = 4
        Top = 105
        Width = 57
        Height = 20
        Size.Values = (
          42.333333333333330000
          8.466666666666667000
          222.250000000000000000
          120.650000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Product'
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
      object QRLabel4: TQRLabel
        Left = 140
        Top = 105
        Width = 83
        Height = 20
        Size.Values = (
          42.333333333333330000
          296.333333333333300000
          222.250000000000000000
          175.683333333333300000)
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
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel3: TQRLabel
        Left = 564
        Top = 105
        Width = 60
        Height = 20
        Size.Values = (
          42.333333333333330000
          1193.800000000000000000
          222.250000000000000000
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
      object QRLabel7: TQRLabel
        Left = 704
        Top = 105
        Width = 80
        Height = 20
        Size.Values = (
          42.333333333333330000
          1490.133333333333000000
          222.250000000000000000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total Value'
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
      object QRSysData1: TQRSysData
        Left = 812
        Top = 10
        Width = 84
        Height = 21
        Size.Values = (
          44.450000000000000000
          1718.733333333333000000
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
      object qrlblDateSelection: TQRLabel
        Left = 351
        Top = 61
        Width = 132
        Height = 21
        Size.Values = (
          44.450000000000000000
          742.950000000000000000
          129.116666666666700000
          279.400000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'qrlblDateSelection'
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
    end
    object qrbCustHeader: TQRGroup
      Left = 36
      Top = 167
      Width = 920
      Height = 30
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        63.500000000000000000
        1947.333333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'qryReport.Name'
      FooterBand = qrpCustFooter
      Master = QRSubDetail1
      ReprintOnNewPage = False
      object QRDBText1: TQRDBText
        Left = 6
        Top = 0
        Width = 45
        Height = 21
        Size.Values = (
          44.450000000000000000
          12.700000000000000000
          0.000000000000000000
          95.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Name'
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
    object QRSubDetail1: TQRSubDetail
      Left = 36
      Top = 197
      Width = 920
      Height = 25
      AfterPrint = QRSubDetail1AfterPrint
      AlignToBottom = False
      BeforePrint = QRSubDetail1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.916666666666670000
        1947.333333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = QuickReport
      DataSet = qryReport
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText2: TQRDBText
        Left = 5
        Top = 1
        Width = 126
        Height = 20
        Size.Values = (
          42.333333333333300000
          10.583333333333300000
          2.645833333333330000
          267.229166666667000000)
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
      object QRDBText3: TQRDBText
        Left = 140
        Top = 1
        Width = 391
        Height = 20
        Size.Values = (
          42.333333333333300000
          296.333333333333000000
          2.645833333333330000
          828.145833333333000000)
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
      object qrlblQuantity: TQRLabel
        Left = 540
        Top = 1
        Width = 82
        Height = 20
        Size.Values = (
          42.333333333333330000
          1143.000000000000000000
          2.116666666666667000
          173.566666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
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
      object qrlblValue: TQRLabel
        Left = 719
        Top = 1
        Width = 64
        Height = 20
        Size.Values = (
          42.333333333333330000
          1521.883333333333000000
          2.116666666666667000
          135.466666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblValue'
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
    object qrpCustFooter: TQRBand
      Left = 36
      Top = 222
      Width = 920
      Height = 35
      AfterPrint = qrpCustFooterAfterPrint
      AlignToBottom = False
      BeforePrint = qrpCustFooterBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        74.083333333333330000
        1947.333333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRLabel9: TQRLabel
        Left = 524
        Top = 10
        Width = 121
        Height = 21
        Size.Values = (
          44.450000000000000000
          1109.133333333333000000
          21.166666666666670000
          256.116666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total sales value'
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
      object QRShape1: TQRShape
        Left = 663
        Top = 1
        Width = 121
        Height = 10
        Size.Values = (
          21.166666666666700000
          1402.291666666670000000
          2.645833333333330000
          256.645833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrlblTotalCustValue: TQRLabel
        Left = 676
        Top = 10
        Width = 108
        Height = 21
        Size.Values = (
          44.450000000000000000
          1430.866666666667000000
          21.166666666666670000
          228.600000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblTotalValue'
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
  end
  object qryReport: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT '#9'Part.Part,'
      #9'Part.Part_Description,'
      #9'Part.Not_In_Use,'
      #9'Customer.Name,'
      #9'(select sum(Quantity_delivered)'
      #9'from Sales_order_line, Sales_order'
      #9'where Sales_order_line.Part = Part.Part and'
      
        #9'      Sales_order_Line.sales_order = sales_order.sales_order an' +
        'd'
      
        #9'      ((sales_order.date_required >= :Date_From) and (sales_ord' +
        'er.date_required <= :Date_To))) as Quantity,'
      
        #9'(select sum(((cast(Quantity_delivered as float)/cast(sell_pack_' +
        'quantity as float))*Part_sales_Price))'
      #9'from Sales_order_line, Sales_order'
      #9'where Sales_order_line.Part = Part.Part and'
      
        #9'      Sales_order_Line.sales_order = sales_order.sales_order an' +
        'd'
      
        #9'      ((sales_order.date_required >= :Date_From) and (sales_ord' +
        'er.date_required <= :Date_To))) as Order_Value'
      'FROM (Part'
      
        #9'INNER JOIN Part_Store_Levels ON Part.Part = Part_Store_Levels.P' +
        'art)'
      #9'LEFT JOIN Customer ON Part.Customer = Customer.Customer'
      'WHERE ((Part.Customer = :Customer) or (:Customer = 0)) and'
      '      ((Part.Branch_no = :Branch) or (:Branch = 99)) and'
      '        Part.Part >= :Part_From and'
      '        Part.Part <= :Part_To and'
      '        ((Part.Not_in_Use = '#39'N'#39') or'
      '        (Part.Not_in_Use = :Not_in_Use))'
      'order by Customer.Name, Part.Part'
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    Left = 520
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Date_From'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_To'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_From'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_To'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Part_From'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Part_To'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Not_in_Use'
        ParamType = ptUnknown
      end>
  end
  object qrySOReport: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select sales_order.customer,'
      '       customer.name,'
      '       sales_order_line.Part,'
      '       part.part_description,'
      #9'sum(sales_order_line.Quantity_delivered) as quantity,'
      
        #9'sum((cast(sales_order_line.Quantity_delivered as float)/cast(sa' +
        'les_order_line.sell_pack_quantity as float))*sales_order_line.pa' +
        'rt_sales_price) as order_value'
      'from sales_order_line, sales_order, customer, part'
      'WHERE'
      '  (Sales_Order.Customer = :Customer) and'
      '  ((Sales_order.Branch_No = :Branch) or (:Branch = 99)) and'
      '  Part.Part >= :Part_From and'
      '  Part.Part <= :Part_To and'
      '  sales_order.date_required >= :Date_From and'
      '  sales_order.date_required <= :Date_To and'
      '  sales_order_line.sales_order = sales_order.sales_order and'
      '  sales_order.customer = customer.customer and'
      '  sales_order_line.part = Part.Part and'
      '  ((Part.Not_in_use = '#39'N'#39') or'
      '    (Part.Not_in_use = :Not_in_use))'
      'group by sales_order.customer,'
      '       customer.name,'
      '       sales_order_line.Part,'
      '       part.part_description'
      'order by Customer.Name,'
      'sales_order_line.Part'
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 608
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_From'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_To'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_From'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_To'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Not_in_use'
        ParamType = ptUnknown
      end>
  end
end
