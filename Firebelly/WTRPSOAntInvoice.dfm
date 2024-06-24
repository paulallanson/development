object frmwtRPSOAntInvoice: TfrmwtRPSOAntInvoice
  Left = 49
  Top = 110
  Caption = 'Anticipated Invoicing Report'
  ClientHeight = 642
  ClientWidth = 1328
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Scaled = False
  TextHeight = 13
  object qrpDetails: TQuickRep
    Left = 16
    Top = 16
    Width = 1403
    Height = 992
    ShowingPreview = False
    BeforePrint = qrpDetailsBeforePrint
    DataSet = qrySalesOrders
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
    PrinterSettings.PrintQuality = 0
    PrinterSettings.Collate = 0
    PrinterSettings.ColorOption = 0
    PrintIfEmpty = True
    ReportTitle = 'Outstanding Quote Report'
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
      Width = 1309
      Height = 113
      Frame.DrawBottom = True
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        239.183333333333300000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object qrlblCaption: TQRLabel
        Left = 525
        Top = 4
        Width = 245
        Height = 24
        Size.Values = (
          50.800000000000000000
          1111.250000000000000000
          8.466666666666667000
          518.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Anticipated Invoicing Report'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRLabel3: TQRLabel
        Left = 0
        Top = 91
        Width = 70
        Height = 19
        Size.Values = (
          40.216666666666670000
          0.000000000000000000
          192.616666666666700000
          148.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sales Order'
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
        Left = 80
        Top = 91
        Width = 28
        Height = 19
        Size.Values = (
          40.216666666666670000
          169.333333333333300000
          192.616666666666700000
          59.266666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date'
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
        Left = 160
        Top = 91
        Width = 57
        Height = 19
        Size.Values = (
          40.216666666666670000
          338.666666666666700000
          192.616666666666700000
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
      object QRLabel6: TQRLabel
        Left = 380
        Top = 91
        Width = 59
        Height = 19
        Size.Values = (
          40.216666666666670000
          804.333333333333300000
          192.616666666666700000
          124.883333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Reference'
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
        Left = 518
        Top = 91
        Width = 53
        Height = 19
        Size.Values = (
          40.216666666666670000
          1096.433333333333000000
          192.616666666666700000
          112.183333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Order No'
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
        Left = 651
        Top = 91
        Width = 83
        Height = 19
        Size.Values = (
          40.216666666666670000
          1377.950000000000000000
          192.616666666666700000
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
      object QRLabel11: TQRLabel
        Left = 1170
        Top = 91
        Width = 39
        Height = 19
        Size.Values = (
          40.216666666666670000
          2476.500000000000000000
          192.616666666666700000
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
      object QRLabel1: TQRLabel
        Left = 880
        Top = 91
        Width = 39
        Height = 19
        Size.Values = (
          40.216666666666670000
          1862.666666666667000000
          192.616666666666700000
          82.550000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Goods'
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
      object QRLabel12: TQRLabel
        Left = 1096
        Top = 91
        Width = 63
        Height = 19
        Size.Values = (
          40.216666666666670000
          2319.866666666667000000
          192.616666666666700000
          133.350000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total to Inv'
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
      object QRLabel14: TQRLabel
        Left = 963
        Top = 91
        Width = 26
        Height = 19
        Size.Values = (
          40.216666666666670000
          2038.350000000000000000
          192.616666666666700000
          55.033333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'VAT'
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
      object qrlblDateRange: TQRLabel
        Left = 597
        Top = 30
        Width = 89
        Height = 21
        Size.Values = (
          44.450000000000000000
          1263.650000000000000000
          63.500000000000000000
          188.383333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'qrlblDateRange'
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
        Left = 751
        Top = 91
        Width = 70
        Height = 19
        Size.Values = (
          40.216666666666670000
          1589.616666666667000000
          192.616666666666700000
          148.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Job Number'
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
        Left = 1008
        Top = 91
        Width = 75
        Height = 19
        Size.Values = (
          40.216666666666670000
          2133.600000000000000000
          192.616666666666700000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Deposit Paid'
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
      object QRSysData2: TQRSysData
        Left = 1228
        Top = 10
        Width = 68
        Height = 21
        Size.Values = (
          44.450000000000000000
          2599.266666666667000000
          21.166666666666670000
          143.933333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsDateTime
        Font.Charset = ANSI_CHARSET
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
      object QRSysData1: TQRSysData
        Left = 1212
        Top = 29
        Width = 84
        Height = 21
        Size.Values = (
          44.450000000000000000
          2565.400000000000000000
          61.383333333333330000
          177.800000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = ANSI_CHARSET
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
      object qrlblSelection: TQRLabel
        Left = 600
        Top = 56
        Width = 79
        Height = 19
        Size.Values = (
          40.216666666666670000
          1270.000000000000000000
          118.533333333333300000
          167.216666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'qrlblSelection'
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
    object qrsbDetails: TQRSubDetail
      Left = 47
      Top = 193
      Width = 1309
      Height = 24
      AfterPrint = qrsbDetailsAfterPrint
      AlignToBottom = False
      BeforePrint = qrsbDetailsBeforePrint
      TransparentBand = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        50.800000000000000000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpDetails
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText12: TQRDBText
        Tag = 1
        Left = 987
        Top = 0
        Width = 97
        Height = 19
        Size.Values = (
          40.216666666666670000
          2089.150000000000000000
          0.000000000000000000
          205.316666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySalesOrders
        DataField = 'Deposit_Amount'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Mask = '#,##0.00'
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
        Tag = 1
        Left = 828
        Top = 0
        Width = 94
        Height = 19
        Size.Values = (
          39.687500000000000000
          1751.541666666667000000
          0.000000000000000000
          198.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qrySalesOrders
        DataField = 'Goods_Value'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Mask = '#,##0.00'
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
        Tag = 1
        Left = -73
        Top = 1
        Width = 68
        Height = 19
        Size.Values = (
          40.216666666666670000
          -154.516666666666700000
          2.116666666666667000
          143.933333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySalesOrders
        DataField = 'sales_order'
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
        Tag = 1
        Left = 80
        Top = 1
        Width = 75
        Height = 19
        Size.Values = (
          40.216666666666670000
          169.333333333333300000
          2.116666666666667000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySalesOrders
        DataField = 'Date_Raised'
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
        Tag = 1
        Left = 380
        Top = 1
        Width = 131
        Height = 19
        Size.Values = (
          39.687500000000000000
          804.333333333333300000
          2.645833333333333000
          277.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qrySalesOrders
        DataField = 'Reference'
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
        Tag = 1
        Left = 160
        Top = 1
        Width = 211
        Height = 19
        Size.Values = (
          39.687500000000000000
          338.666666666666700000
          2.645833333333333000
          447.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qrySalesOrders
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
      object QRDBText10: TQRDBText
        Tag = 1
        Left = 519
        Top = 0
        Width = 119
        Height = 19
        Size.Values = (
          39.687500000000000000
          1098.020833333333000000
          0.000000000000000000
          251.354166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qrySalesOrders
        DataField = 'Order_Ref_No'
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
        Tag = 1
        Left = 931
        Top = 0
        Width = 61
        Height = 19
        Size.Values = (
          40.216666666666670000
          1970.616666666667000000
          0.000000000000000000
          129.116666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySalesOrders
        DataField = 'Vat_Value'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Mask = '#,##0.00'
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
        Tag = 1
        Left = 1092
        Top = 0
        Width = 69
        Height = 19
        Size.Values = (
          40.216666666666670000
          2311.400000000000000000
          0.000000000000000000
          146.050000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySalesOrders
        DataField = 'Total_Value'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Mask = '#,##0.00'
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
        Tag = 1
        Left = 749
        Top = 0
        Width = 73
        Height = 19
        Size.Values = (
          40.216666666666670000
          1585.383333333333000000
          0.000000000000000000
          154.516666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySalesOrders
        DataField = 'Job_Number'
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
      object qrlblDateRequired: TQRLabel
        Tag = 1
        Left = 651
        Top = 1
        Width = 83
        Height = 21
        Size.Values = (
          44.450000000000000000
          1377.950000000000000000
          2.116666666666667000
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
      object gtqrStatus: TQRLabel
        Tag = 1
        Left = 1170
        Top = 0
        Width = 131
        Height = 19
        Size.Values = (
          39.687500000000000000
          2476.500000000000000000
          0.000000000000000000
          277.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'gtqrStatus'
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
      object gtqrDONOTInvoice: TQRLabel
        Tag = 1
        Left = 1242
        Top = 4
        Width = 22
        Height = 20
        Size.Values = (
          42.333333333333330000
          2628.900000000000000000
          8.466666666666667000
          46.566666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '***'
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
    object QRBand2: TQRBand
      Left = 47
      Top = 265
      Width = 1309
      Height = 33
      AfterPrint = QRBand2AfterPrint
      AlignToBottom = False
      BeforePrint = QRBand2BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        69.850000000000000000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object qrlblReportTotal: TQRLabel
        Left = 1060
        Top = 11
        Width = 104
        Height = 19
        Size.Values = (
          40.216666666666670000
          2243.666666666667000000
          23.283333333333330000
          220.133333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblReportTotal'
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
      object qrlblDeposit: TQRLabel
        Left = 975
        Top = 11
        Width = 109
        Height = 19
        Size.Values = (
          40.216666666666670000
          2063.750000000000000000
          23.283333333333330000
          230.716666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblDepositTotal'
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
      object qrlblVATTotal: TQRLabel
        Left = 889
        Top = 11
        Width = 104
        Height = 19
        Size.Values = (
          40.216666666666670000
          1881.716666666667000000
          23.283333333333330000
          220.133333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblReportTotal'
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
      object QRLabel10: TQRLabel
        Left = 713
        Top = 11
        Width = 79
        Height = 19
        Size.Values = (
          40.216666666666670000
          1509.183333333333000000
          23.283333333333330000
          167.216666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Report Total'
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
      object QRShape2: TQRShape
        Left = 820
        Top = -1
        Width = 351
        Height = 10
        Size.Values = (
          21.166666666666670000
          1735.666666666667000000
          -2.645833333333333000
          743.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrlblGoodsTotal: TQRLabel
        Left = 820
        Top = 11
        Width = 102
        Height = 19
        Size.Values = (
          40.216666666666670000
          1735.666666666667000000
          23.283333333333330000
          215.900000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblGoodsTotal'
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
    object qrbGroupHeader: TQRGroup
      Left = 47
      Top = 160
      Width = 1309
      Height = 33
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        69.850000000000000000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      FooterBand = qrbGroupFooter
      Master = qrpDetails
      ReprintOnNewPage = False
      object qrlblSortBy: TQRLabel
        Left = 0
        Top = 10
        Width = 57
        Height = 21
        Size.Values = (
          44.450000000000000000
          0.000000000000000000
          21.166666666666670000
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
      object qrGroupbyText: TQRDBText
        Left = 90
        Top = 10
        Width = 98
        Height = 21
        Size.Values = (
          44.450000000000000000
          190.500000000000000000
          21.166666666666670000
          207.433333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySalesOrders
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
    end
    object qrbGroupFooter: TQRBand
      Left = 47
      Top = 217
      Width = 1309
      Height = 48
      AfterPrint = qrbGroupFooterAfterPrint
      AlignToBottom = False
      BeforePrint = qrbGroupFooterBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        101.600000000000000000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object qrlblCustDeposit: TQRLabel
        Left = 975
        Top = 12
        Width = 109
        Height = 19
        Size.Values = (
          40.216666666666670000
          2063.750000000000000000
          25.400000000000000000
          230.716666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblDepositTotal'
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
      object qrlblCustTotal: TQRLabel
        Left = 1075
        Top = 12
        Width = 89
        Height = 19
        Size.Values = (
          40.216666666666670000
          2275.416666666667000000
          25.400000000000000000
          188.383333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblCustTotal'
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
      object QRShape1: TQRShape
        Left = 820
        Top = -1
        Width = 351
        Height = 10
        Size.Values = (
          21.166666666666670000
          1735.666666666667000000
          -2.645833333333333000
          743.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrGroupbyFootText: TQRDBText
        Left = 630
        Top = 12
        Width = 124
        Height = 19
        Size.Values = (
          40.216666666666670000
          1333.500000000000000000
          25.400000000000000000
          262.466666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySalesOrders
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
      object gtQRLabel1: TQRLabel
        Left = 762
        Top = 12
        Width = 33
        Height = 19
        Size.Values = (
          40.216666666666670000
          1612.900000000000000000
          25.400000000000000000
          69.850000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total'
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
      object qrlblCustGoods: TQRLabel
        Left = 824
        Top = 12
        Width = 97
        Height = 19
        Size.Values = (
          40.216666666666670000
          1744.133333333333000000
          25.400000000000000000
          205.316666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblCustGoods'
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
      object qrlblCustVAT: TQRLabel
        Left = 907
        Top = 12
        Width = 83
        Height = 19
        Size.Values = (
          40.216666666666670000
          1919.816666666667000000
          25.400000000000000000
          175.683333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblCustVAT'
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
  end
  object qrySalesOrders: TFDQuery
    ConnectionName = 'Wt'
    SQL.Strings = (
      'SELECT  Sales_Order.Sales_Order,'
      '        Sales_Order.Date_Raised,'
      '        Sales_Order.Date_Required,'
      '        Sales_Order.Reference,'
      '        Sales_Order.Order_ref_no,'
      '        Sales_Order.Sales_Order_Status,'
      '        Sales_Order.On_Hold,'
      '        Sales_Order_Status.Sales_Order_Status_Desc,'
      '        Sales_Order.Deposit_amount,'
      '        Sales_Order.Goods_Value,'
      '        Sales_Order.VAT_Value,'
      '        Sales_Order.IsFittingInOutlook,'
      
        '        (Sales_Order.Goods_Value + Sales_Order.Vat_Value - Sales' +
        '_order.Deposit_amount) as Total_Value,'
      '        Sales_Order.Rep,'
      '        Rep.Rep_Name,'
      '        Sales_Order.Inactive,'
      '        Sales_Order.Do_Not_Invoice,'
      '        Sales_Order.Customer_Name,'
      '        Customer.Is_Retail_Customer,'
      '        Customer.Is_Commercial_Customer,'
      '        Customer.Requires_App_For_Payment,'
      '        (select top 1 Job'
      '        from sales_order_line, sales_Order SO'
      '        where sales_order_line.sales_order = SO.sales_order and'
      
        '              sales_order_line.sales_order = sales_order.sales_o' +
        'rder and'
      '              ((job is not null) or (Job <> 0))) as Job_Number,'
      '        Payment_Terms.Payment_Terms_Description'
      'FROM Payment_Terms'
      '      RIGHT JOIN (Sales_Order_Status'
      '      INNER JOIN (Rep'
      '      INNER JOIN (Customer'
      '      INNER JOIN Sales_Order'
      '        ON Customer.Customer = Sales_Order.Customer)'
      '        ON Rep.Rep = Sales_Order.Rep)'
      
        '        ON Sales_Order_Status.Sales_Order_Status = Sales_Order.S' +
        'ales_Order_Status)'
      '        ON Payment_Terms.Payment_Terms = Customer.Payment_Terms'
      
        'WHERE ((Sales_Order.Customer = :Customer) or (0 = :Customer)) an' +
        'd'
      '      ((Sales_Order.Rep = :Rep) or (:Rep = 0)) and'
      
        '      ((Sales_Order.Date_Required >= :Date_From) and (Sales_orde' +
        'r.Date_Required <= :Date_To)) and'
      
        '      ((Sales_Order.Sales_Order_Status >= 10) AND (Sales_Order.S' +
        'ales_Order_Status < :Sales_Order_Status)) and'
      
        '      ((Sales_Order.inactive = '#39'N'#39') or (Sales_Order.inactive is ' +
        'NULL) or (Sales_Order.inactive = '#39#39')) AND'
      
        '      ((Sales_Order.Do_not_Invoice = :Do_not_Invoice) OR (Sales_' +
        'Order.Do_not_Invoice = '#39'N'#39') OR (Sales_Order.Do_not_Invoice IS NU' +
        'LL)) AND'
      
        '      ((Sales_Order.IsFittingInOutlook = :IsFittingInOutlook) OR' +
        ' (Sales_Order.IsFittingInOutlook = '#39'Y'#39') OR (Sales_Order.IsFittin' +
        'gInOutlook IS NULL)) AND'
      
        '      (((Customer.Is_Retail_Customer = :Is_Retail_Customer) AND ' +
        '(Customer.Is_Commercial_Customer = :Is_Commercial_Customer)) or ' +
        '(:Is_Retail_Customer = '#39'A'#39')) AND'
      
        '      ((Customer.Requires_App_For_Payment = :Requires_App_For_Pa' +
        'yment) OR (:Requires_App_For_Payment = '#39'A'#39'))'
      '')
    Left = 116
    Top = 342
    ParamData = <
      item
        Name = 'Customer'
        ParamType = ptInput
      end
      item
        Name = 'Rep'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'Date_From'
        DataType = ftDateTime
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'Date_To'
        DataType = ftDateTime
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'Sales_Order_Status'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DO_NOT_INVOICE'
        ParamType = ptInput
      end
      item
        Name = 'IsFittingInOutlook'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'Is_Retail_Customer'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'Is_Commercial_Customer'
        ParamType = ptInput
      end
      item
        Name = 'Requires_App_For_Payment'
        ParamType = ptInput
      end>
  end
  object qrySalesOrderOld: TFDQuery
    ConnectionName = 'Wt'
    SQL.Strings = (
      'SELECT  Sales_Order.Sales_Order,'
      '        Sales_Order.Date_Raised,'
      '        Sales_Order.Date_Required,'
      '        Sales_Order.Reference,'
      '        Sales_Order.Order_ref_no,'
      '        Sales_Order.Sales_Order_Status,'
      '        Sales_Order.On_Hold,'
      '        Sales_Order_Status.Sales_Order_Status_Desc,'
      '        Sales_Order.Deposit_amount,'
      '        Sales_Order.Goods_Value,'
      '        Sales_Order.VAT_Value,'
      '        Sales_Order.IsFittingInOutlook,'
      
        '        (Sales_Order.Goods_Value + Sales_Order.Vat_Value - Sales' +
        '_order.Deposit_amount) as Total_Value,'
      '        Sales_Order.Rep,'
      '        Rep.Rep_Name,'
      '        Sales_Order.Inactive,'
      '        Sales_Order.Customer_Name,'
      '        Customer.Is_Retail_Customer,'
      '        Customer.Is_Commercial_Customer,'
      '        Customer.Requires_App_For_Payment,'
      '        (select top 1 Job'
      '        from sales_order_line, sales_Order SO'
      '        where sales_order_line.sales_order = SO.sales_order and'
      
        '              sales_order_line.sales_order = sales_order.sales_o' +
        'rder and'
      '              ((job is not null) or (Job <> 0))) as Job_Number'
      'FROM Customer'
      '      INNER JOIN (Sales_Order_Status'
      '      INNER JOIN (Rep'
      '      INNER JOIN Sales_Order'
      '        ON Rep.Rep = Sales_Order.Rep)'
      
        '        ON Sales_Order_Status.Sales_Order_Status = Sales_Order.S' +
        'ales_Order_Status)'
      '        ON Customer.Customer = Sales_Order.Customer'
      
        'WHERE ((Sales_Order.Customer = :Customer) or (0 = :Customer)) an' +
        'd'
      '      ((Sales_Order.Rep = :Rep) or (:Rep = 0)) and'
      
        '      ((Sales_Order.Date_Required >= :Date_From) and (Sales_orde' +
        'r.Date_Required <= :Date_To)) and'
      
        '      ((Sales_Order.Sales_Order_Status >= 10) AND (Sales_Order.S' +
        'ales_Order_Status < :Sales_Order_Status)) and'
      
        '      ((Sales_Order.inactive = '#39'N'#39') or (Sales_Order.inactive is ' +
        'NULL) or (Sales_Order.inactive = '#39#39')) AND'
      
        '      ((Sales_order.Do_not_Invoice is NULL) OR (Sales_Order.Do_n' +
        'ot_Invoice = '#39'N'#39')) AND'
      
        '      ((Sales_Order.IsFittingInOutlook = :IsFittingInOutlook) OR' +
        ' (Sales_Order.IsFittingInOutlook = '#39'Y'#39') OR (Sales_Order.IsFittin' +
        'gInOutlook IS NULL)) AND'
      
        '      (((Customer.Is_Retail_Customer = :Is_Retail_Customer) AND ' +
        '(Customer.Is_Commercial_Customer = :Is_Commercial_Customer)) or ' +
        '(:Is_Retail_Customer = '#39'A'#39')) AND'
      
        '      ((Customer.Requires_App_For_Payment = :Requires_App_For_Pa' +
        'yment) OR (:Requires_App_For_Payment = '#39'A'#39'))'
      ''
      '')
    Left = 460
    Top = 350
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Rep'
      end
      item
        Name = 'Rep'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'Date_From'
        DataType = ftDateTime
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'Date_To'
        DataType = ftDateTime
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'Sales_Order_Status'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IsFittingInOutlook'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'Is_Retail_Customer'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'Is_Commercial_Customer'
      end
      item
        Name = 'Is_Retail_Customer'
      end
      item
        Name = 'Requires_App_For_Payment'
      end
      item
        Name = 'Requires_App_For_Payment'
      end>
  end
end
