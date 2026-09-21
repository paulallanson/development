object PBRPCustProfitSummFrm: TPBRPCustProfitSummFrm
  Left = 5
  Top = 125
  Caption = 'Cust Sales Profit Report'
  ClientHeight = 451
  ClientWidth = 796
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Scaled = False
  TextHeight = 13
  object qrpDetails: TQuickRep
    Left = 0
    Top = 0
    Width = 1020
    Height = 1320
    ShowingPreview = False
    BeforePrint = qrpDetailsBeforePrint
    DataSet = qryPeriods
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
    Page.PaperSize = Letter
    Page.Continuous = False
    Page.Values = (
      100.000000000000000000
      2794.000000000000000000
      100.000000000000000000
      2159.000000000000000000
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
    object PageHeaderBand1: TQRBand
      Left = 47
      Top = 47
      Width = 926
      Height = 144
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        304.800000000000000000
        1960.033333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object qrlblTitle: TQRLabel
        Left = 255
        Top = 10
        Width = 415
        Height = 29
        Size.Values = (
          61.383333333333330000
          539.750000000000000000
          21.166666666666670000
          878.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Customer Profit Analysis - Run Date: '
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
        Left = 434
        Top = 40
        Width = 58
        Height = 21
        Size.Values = (
          44.450000000000000000
          918.633333333333300000
          84.666666666666670000
          122.766666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Begin:  '
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
      object qrlblCustomer: TQRLabel
        Left = 406
        Top = 70
        Width = 113
        Height = 21
        Size.Values = (
          44.450000000000000000
          859.366666666666700000
          148.166666666666700000
          239.183333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'qrlblCustomer'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel1: TQRLabel
        Left = 50
        Top = 110
        Width = 52
        Height = 21
        Size.Values = (
          44.450000000000000000
          105.833333333333300000
          232.833333333333300000
          110.066666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Period'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel2: TQRLabel
        Left = 420
        Top = 110
        Width = 47
        Height = 21
        Size.Values = (
          44.450000000000000000
          889.000000000000000000
          232.833333333333300000
          99.483333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Costs'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel3: TQRLabel
        Left = 260
        Top = 110
        Width = 43
        Height = 21
        Size.Values = (
          44.450000000000000000
          550.333333333333300000
          232.833333333333300000
          91.016666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sales'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel4: TQRLabel
        Left = 590
        Top = 110
        Width = 44
        Height = 21
        Size.Values = (
          44.450000000000000000
          1248.833333333333000000
          232.833333333333300000
          93.133333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Profit'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRShape1: TQRShape
        Left = 40
        Top = 130
        Width = 750
        Height = 6
        Size.Values = (
          13.229166666666700000
          84.666666666666700000
          275.166666666667000000
          1587.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel6: TQRLabel
        Left = 720
        Top = 110
        Width = 65
        Height = 21
        Size.Values = (
          44.450000000000000000
          1524.000000000000000000
          232.833333333333300000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Profit %'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object QRSubDetail1: TQRSubDetail
      Left = 47
      Top = 191
      Width = 926
      Height = 32
      AfterPrint = QRSubDetail1AfterPrint
      AlignToBottom = False
      BeforePrint = QRSubDetail1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        67.733333333333330000
        1960.033333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpDetails
      DataSet = qryCustProfSumm
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText1: TQRDBText
        Left = 50
        Top = 10
        Width = 136
        Height = 21
        Size.Values = (
          44.450000000000000000
          105.833333333333300000
          21.166666666666670000
          287.866666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryPeriods
        DataField = 'period_description'
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
      object qrlblCost: TQRLabel
        Left = 462
        Top = 10
        Width = 34
        Height = 21
        Size.Values = (
          44.450000000000000000
          977.900000000000000000
          21.166666666666670000
          71.966666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Cost'
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
      object qrlblSale: TQRLabel
        Left = 300
        Top = 10
        Width = 41
        Height = 21
        Size.Values = (
          44.450000000000000000
          635.000000000000000000
          21.166666666666670000
          86.783333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Sales'
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
      object qrlblProf: TQRLabel
        Left = 625
        Top = 10
        Width = 32
        Height = 21
        Size.Values = (
          44.450000000000000000
          1322.916666666667000000
          21.166666666666670000
          67.733333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Prof'
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
      object qrlblProfPerc: TQRLabel
        Left = 745
        Top = 10
        Width = 32
        Height = 21
        Size.Values = (
          44.450000000000000000
          1576.916666666667000000
          21.166666666666670000
          67.733333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Prof'
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
    object QRBand1: TQRBand
      Left = 47
      Top = 223
      Width = 926
      Height = 50
      AlignToBottom = False
      BeforePrint = QRBand1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        1960.033333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRLabel5: TQRLabel
        Left = 50
        Top = 10
        Width = 49
        Height = 21
        Size.Values = (
          44.450000000000000000
          105.833333333333300000
          21.166666666666670000
          103.716666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Totals'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblTotCost: TQRLabel
        Left = 436
        Top = 10
        Width = 60
        Height = 21
        Size.Values = (
          44.450000000000000000
          922.866666666666700000
          21.166666666666670000
          127.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'totCost'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblTotSale: TQRLabel
        Left = 276
        Top = 10
        Width = 65
        Height = 21
        Size.Values = (
          44.450000000000000000
          584.200000000000000000
          21.166666666666670000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'totSales'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblTotProf: TQRLabel
        Left = 602
        Top = 10
        Width = 56
        Height = 21
        Size.Values = (
          44.450000000000000000
          1274.233333333333000000
          21.166666666666670000
          118.533333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'totProf'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRShape2: TQRShape
        Left = 40
        Top = 3
        Width = 750
        Height = 6
        Size.Values = (
          13.229166666666700000
          84.666666666666700000
          5.291666666666670000
          1587.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrlblTotProfPerc: TQRLabel
        Left = 685
        Top = 10
        Width = 92
        Height = 21
        Size.Values = (
          44.450000000000000000
          1449.916666666667000000
          21.166666666666670000
          194.733333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'totProfPerc'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
  end
  object qryCustProfSumm: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select '#9'sales_profit.customer,'
      #9'customer.name as cust_name,'
      #9'sum(Total_sales_value) as Total_Sales,'
      #9'sum(Total_cost_value) as Total_Cost'
      'from '#9'sales_profit inner join customer'
      '  on sales_profit.customer = customer.customer'
      'where (sales_profit.period = :period)'
      '       and (sales_profit.customer = :customer)'
      'group by sales_profit.customer, customer.name'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 176
    Top = 8
    ParamData = <
      item
        Name = 'period'
      end
      item
        Name = 'customer'
        DataType = ftInteger
        ParamType = ptInput
        Value = 4
      end>
  end
  object qryPeriods: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select period.period,'
      #9'period.description as period_description'
      'from '#9'period'
      'where (period.period >= :period)'
      '       and (period.period <= :period + 11)'
      'order by period.period')
    Left = 80
    Top = 8
    ParamData = <
      item
        Name = 'period'
      end
      item
        Name = 'period'
      end>
  end
end
