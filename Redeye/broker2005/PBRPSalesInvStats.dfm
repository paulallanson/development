object PBRPSalesInvStatsFrm: TPBRPSalesInvStatsFrm
  Left = 213
  Top = 113
  Caption = 'Sales Invoice Statistical Report'
  ClientHeight = 441
  ClientWidth = 937
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Scaled = False
  OnCreate = FormCreate
  TextHeight = 13
  object qrpDetails: TQuickRep
    Left = 16
    Top = 16
    Width = 992
    Height = 1403
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
    object qrbPageHeader: TQRBand
      Left = 47
      Top = 47
      Width = 898
      Height = 134
      Frame.DrawBottom = True
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        283.633333333333300000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object QRLabel1: TQRLabel
        Left = 291
        Top = 10
        Width = 274
        Height = 24
        Size.Values = (
          50.800000000000000000
          615.950000000000000000
          21.166666666666670000
          579.966666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Sales Invoice Statistical Report'
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
      object qrlblDateRange: TQRLabel
        Left = 358
        Top = 40
        Width = 140
        Height = 21
        Size.Values = (
          44.450000000000000000
          757.766666666666700000
          84.666666666666670000
          296.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Date Range From: '
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
      object QRLabel9: TQRLabel
        Left = 10
        Top = 110
        Width = 49
        Height = 21
        Size.Values = (
          44.450000000000000000
          21.166666666666670000
          232.833333333333300000
          103.716666666666700000)
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
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel4: TQRLabel
        Left = 230
        Top = 90
        Width = 106
        Height = 21
        Size.Values = (
          44.450000000000000000
          486.833333333333300000
          190.500000000000000000
          224.366666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sales Invoices'
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
      object QRLabel3: TQRLabel
        Left = 400
        Top = 90
        Width = 98
        Height = 21
        Size.Values = (
          44.450000000000000000
          846.666666666666700000
          190.500000000000000000
          207.433333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sales Credits'
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
      object QRLabel5: TQRLabel
        Left = 540
        Top = 110
        Width = 126
        Height = 21
        Size.Values = (
          44.450000000000000000
          1143.000000000000000000
          232.833333333333300000
          266.700000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Purchase Orders'
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
      object QRLabel6: TQRLabel
        Left = 704
        Top = 110
        Width = 70
        Height = 21
        Size.Values = (
          44.450000000000000000
          1490.133333333333000000
          232.833333333333300000
          148.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Job Bags'
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
        Left = 200
        Top = 110
        Width = 44
        Height = 21
        Size.Values = (
          44.450000000000000000
          423.333333333333300000
          232.833333333333300000
          93.133333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Count'
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
      object QRLabel10: TQRLabel
        Left = 290
        Top = 110
        Width = 42
        Height = 21
        Size.Values = (
          44.450000000000000000
          613.833333333333300000
          232.833333333333300000
          88.900000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Value'
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
      object QRLabel11: TQRLabel
        Left = 380
        Top = 110
        Width = 44
        Height = 21
        Size.Values = (
          44.450000000000000000
          804.333333333333300000
          232.833333333333300000
          93.133333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Count'
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
      object QRLabel12: TQRLabel
        Left = 470
        Top = 110
        Width = 42
        Height = 21
        Size.Values = (
          44.450000000000000000
          994.833333333333300000
          232.833333333333300000
          88.900000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Value'
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
      object QRLabel13: TQRLabel
        Left = 580
        Top = 90
        Width = 32
        Height = 21
        Size.Values = (
          44.450000000000000000
          1227.666666666667000000
          190.500000000000000000
          67.733333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'New'
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
      object QRLabel15: TQRLabel
        Left = 720
        Top = 90
        Width = 32
        Height = 21
        Size.Values = (
          44.450000000000000000
          1524.000000000000000000
          190.500000000000000000
          67.733333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'New'
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
      object QRLabel14: TQRLabel
        Left = 805
        Top = 110
        Width = 86
        Height = 21
        Size.Values = (
          44.450000000000000000
          1703.916666666667000000
          232.833333333333300000
          182.033333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'New Clients'
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
    object qrgrpRepHeader: TQRGroup
      Left = 47
      Top = 181
      Width = 898
      Height = 30
      AlignToBottom = False
      BeforePrint = qrgrpRepHeaderBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        63.500000000000000000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'qryReport.Rep_Name'
      FooterBand = qrbRepFooter
      Master = qrDetails
      ReprintOnNewPage = False
      object qrlblName: TQRLabel
        Left = 10
        Top = 5
        Width = 30
        Height = 21
        Size.Values = (
          44.450000000000000000
          21.166666666666670000
          10.583333333333330000
          63.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Rep'
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
      object qrdbTextName: TQRDBText
        Left = 130
        Top = 5
        Width = 81
        Height = 21
        Size.Values = (
          44.450000000000000000
          275.166666666666700000
          10.583333333333330000
          171.450000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Rep_Name'
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
    object qrDetails: TQRSubDetail
      Left = 47
      Top = 215
      Width = 898
      Height = 36
      AlignToBottom = False
      BeforePrint = qrDetailsBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        76.200000000000000000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpDetails
      DataSet = qryReport
      PrintBefore = False
      PrintIfEmpty = True
      object QRLabel7: TQRLabel
        Left = 80
        Top = 10
        Width = 71
        Height = 21
        Size.Values = (
          44.450000000000000000
          169.333333333333300000
          21.166666666666670000
          150.283333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer'
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
      object QRDBText2: TQRDBText
        Left = 160
        Top = 10
        Width = 122
        Height = 21
        Size.Values = (
          44.450000000000000000
          338.666666666666700000
          21.166666666666670000
          258.233333333333300000)
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
      object QRLabel8: TQRLabel
        Left = 310
        Top = 10
        Width = 30
        Height = 21
        Size.Values = (
          44.450000000000000000
          656.166666666666700000
          21.166666666666670000
          63.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Rep'
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
      object QRDBText3: TQRDBText
        Left = 390
        Top = 10
        Width = 81
        Height = 21
        Size.Values = (
          44.450000000000000000
          825.500000000000000000
          21.166666666666670000
          171.450000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Rep_Name'
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
      object QRDBText4: TQRDBText
        Left = 520
        Top = 10
        Width = 130
        Height = 21
        Size.Values = (
          44.450000000000000000
          1100.666666666667000000
          21.166666666666670000
          275.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Invoice_or_Credit'
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
      object QRDBText5: TQRDBText
        Left = 660
        Top = 10
        Width = 105
        Height = 21
        Size.Values = (
          44.450000000000000000
          1397.000000000000000000
          21.166666666666670000
          222.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Invoice_Count'
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
    object qrbPeriodFooter: TQRBand
      Left = 47
      Top = 251
      Width = 898
      Height = 30
      AlignToBottom = False
      BeforePrint = qrbPeriodFooterBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.500000000000000000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object qrlblSalesCreditValue: TQRLabel
        Left = 413
        Top = 5
        Width = 101
        Height = 21
        Size.Values = (
          44.450000000000000000
          874.183333333333300000
          10.583333333333330000
          213.783333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'SalesCreditValue'
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
      object qrlblSalesInvoiceValue: TQRLabel
        Left = 228
        Top = 5
        Width = 106
        Height = 21
        Size.Values = (
          44.450000000000000000
          482.600000000000000000
          10.583333333333330000
          224.366666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'SalesInvoiceValue'
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
      object qrlblSalesInvoiceCount: TQRLabel
        Left = 137
        Top = 5
        Width = 107
        Height = 21
        Size.Values = (
          44.450000000000000000
          289.983333333333300000
          10.583333333333330000
          226.483333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'SalesInvoiceCount'
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
      object qrlblSalesCreditCount: TQRLabel
        Left = 322
        Top = 5
        Width = 102
        Height = 21
        Size.Values = (
          44.450000000000000000
          681.566666666666700000
          10.583333333333330000
          215.900000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'SalesCreditCount'
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
      object qrlblPurchaseOrderCount: TQRLabel
        Left = 513
        Top = 5
        Width = 122
        Height = 21
        Size.Values = (
          44.450000000000000000
          1085.850000000000000000
          10.583333333333330000
          258.233333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'PurchaseOrderCount'
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
      object qrlblJobBagCount: TQRLabel
        Left = 687
        Top = 5
        Width = 78
        Height = 21
        Size.Values = (
          44.450000000000000000
          1454.150000000000000000
          10.583333333333330000
          165.100000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'JobBagCount'
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
        Left = 40
        Top = 5
        Width = 66
        Height = 21
        Size.Values = (
          44.450000000000000000
          84.666666666666670000
          10.583333333333330000
          139.700000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
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
      object qrlblNewClientCount: TQRLabel
        Left = 793
        Top = 5
        Width = 93
        Height = 21
        Size.Values = (
          44.450000000000000000
          1678.516666666667000000
          10.583333333333330000
          196.850000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'NewClientCount'
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
    object qrgrpPeriodHeader: TQRGroup
      Left = 47
      Top = 211
      Width = 898
      Height = 4
      AlignToBottom = False
      BeforePrint = qrgrpPeriodHeaderBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        8.466666666666667000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'qryReport.Period'
      FooterBand = qrbPeriodFooter
      Master = qrDetails
      ReprintOnNewPage = False
    end
    object qrbRepFooter: TQRBand
      Left = 47
      Top = 281
      Width = 898
      Height = 32
      AlignToBottom = False
      BeforePrint = qrbRepFooterBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        67.733333333333330000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRLabel17: TQRLabel
        Left = 75
        Top = 10
        Width = 39
        Height = 21
        Size.Values = (
          44.450000000000000000
          158.750000000000000000
          21.166666666666670000
          82.550000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Totals'
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
        Left = 150
        Top = 1
        Width = 741
        Height = 8
        Size.Values = (
          15.875000000000000000
          317.500000000000000000
          2.645833333333333000
          1568.979166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrlblRepInvoiceCount: TQRLabel
        Left = 125
        Top = 10
        Width = 119
        Height = 21
        Size.Values = (
          44.450000000000000000
          264.583333333333300000
          21.166666666666670000
          251.883333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'SalesInvoiceCount'
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
      object qrlblRepInvoiceValue: TQRLabel
        Left = 215
        Top = 10
        Width = 119
        Height = 21
        Size.Values = (
          44.450000000000000000
          455.083333333333300000
          21.166666666666670000
          251.883333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'SalesInvoiceValue'
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
      object qrlblRepCreditCount: TQRLabel
        Left = 313
        Top = 10
        Width = 111
        Height = 21
        Size.Values = (
          44.450000000000000000
          662.516666666666700000
          21.166666666666670000
          234.950000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'SalesCreditCount'
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
      object qrlblRepCreditValue: TQRLabel
        Left = 403
        Top = 10
        Width = 111
        Height = 21
        Size.Values = (
          44.450000000000000000
          853.016666666666700000
          21.166666666666670000
          234.950000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'SalesCreditValue'
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
      object qrlblRepPOCount: TQRLabel
        Left = 503
        Top = 10
        Width = 133
        Height = 21
        Size.Values = (
          44.450000000000000000
          1064.683333333333000000
          21.166666666666670000
          281.516666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'PurchaseOrderCount'
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
      object qrlblRepJobBagCount: TQRLabel
        Left = 679
        Top = 10
        Width = 86
        Height = 21
        Size.Values = (
          44.450000000000000000
          1437.216666666667000000
          21.166666666666670000
          182.033333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'JobBagCount'
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
      object qrlblRepClientCount: TQRLabel
        Left = 783
        Top = 10
        Width = 103
        Height = 21
        Size.Values = (
          44.450000000000000000
          1657.350000000000000000
          21.166666666666670000
          218.016666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'NewClientCount'
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
    object qrbReportTotal: TQRBand
      Left = 47
      Top = 313
      Width = 898
      Height = 50
      AlignToBottom = False
      BeforePrint = qrbReportTotalBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRLabel16: TQRLabel
        Left = 29
        Top = 10
        Width = 85
        Height = 21
        Size.Values = (
          44.450000000000000000
          61.383333333333330000
          21.166666666666670000
          179.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Report Totals'
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
        Left = 150
        Top = 1
        Width = 741
        Height = 8
        Size.Values = (
          15.875000000000000000
          317.500000000000000000
          2.645833333333333000
          1568.979166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrlblTotalInvoiceCount: TQRLabel
        Left = 125
        Top = 10
        Width = 119
        Height = 21
        Size.Values = (
          44.450000000000000000
          264.583333333333300000
          21.166666666666670000
          251.883333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'SalesInvoiceCount'
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
      object qrlblTotalInvoiceValue: TQRLabel
        Left = 215
        Top = 10
        Width = 119
        Height = 21
        Size.Values = (
          44.450000000000000000
          455.083333333333300000
          21.166666666666670000
          251.883333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'SalesInvoiceValue'
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
      object qrlblTotalCreditCount: TQRLabel
        Left = 313
        Top = 10
        Width = 111
        Height = 21
        Size.Values = (
          44.450000000000000000
          662.516666666666700000
          21.166666666666670000
          234.950000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'SalesCreditCount'
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
      object qrlblTotalCreditValue: TQRLabel
        Left = 403
        Top = 10
        Width = 111
        Height = 21
        Size.Values = (
          44.450000000000000000
          853.016666666666700000
          21.166666666666670000
          234.950000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'SalesCreditValue'
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
      object qrlblTotalPOCount: TQRLabel
        Left = 503
        Top = 10
        Width = 133
        Height = 21
        Size.Values = (
          44.450000000000000000
          1064.683333333333000000
          21.166666666666670000
          281.516666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'PurchaseOrderCount'
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
      object qrlblTotalJobBagCount: TQRLabel
        Left = 679
        Top = 10
        Width = 86
        Height = 21
        Size.Values = (
          44.450000000000000000
          1437.216666666667000000
          21.166666666666670000
          182.033333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'JobBagCount'
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
      object qrlblTotalClientCount: TQRLabel
        Left = 783
        Top = 10
        Width = 103
        Height = 21
        Size.Values = (
          44.450000000000000000
          1657.350000000000000000
          21.166666666666670000
          218.016666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'NewClientCount'
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
  object qryReport: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT DISTINCT Period.Period,'
      '  (Period.Last_Period_End_Date) + 1 as Start_Date,'
      '  Period.Period_End_Date,'
      #9'period.description,'
      '  Sales_Profit.Customer,'
      '  Sales_Profit.Rep,'
      '  Sales_Profit.Sales_Invoice,'
      '  (select Customer.Name'
      '   from Customer'
      
        '   where Customer.Customer = Sales_Profit.Customer) as Customer_' +
        'Name,'
      '  (select Rep.Name'
      '   from Rep'
      '   where Rep.Rep = Sales_Profit.Rep) as Rep_Name,'
      #9'(select Sales_invoice.invoice_or_credit'
      '   from Sales_Invoice'
      
        '   where Sales_invoice.Sales_Invoice = Sales_Profit.Sales_Invoic' +
        'e) as invoice_or_credit,'
      #9'sum(sales_profit.total_sales_value) as Total_Invoice_Value'
      
        'FROM Period LEFT JOIN Sales_profit ON Period.Period = Sales_prof' +
        'it.Period'
      'WHERE'
      
        '  Period.Period >= :First_Period and Period.Period <= :Last_Peri' +
        'od'
      'GROUP BY'
      #9'Period.Period,'
      '  Period.Last_Period_End_Date,'
      '  Period.Period_End_Date,'
      #9'period.description,'
      '  Sales_Profit.Customer,'
      '  Sales_Profit.Rep,'
      '  Sales_Profit.Sales_Invoice'
      'ORDER BY Period.Period, Customer_Name, Rep_Name')
    Left = 168
    Top = 32
    ParamData = <
      item
        Name = 'First_Period'
      end
      item
        Name = 'Last_Period'
      end>
  end
  object qryGetPOs: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'select count(Purchase_Order.purchase_order) as Purchase_Order_Co' +
        'unt'
      'from purchase_orderline, purchase_order'
      'where Date_point >= :Date_From and'
      'Date_Point <= :Date_To and'
      
        'purchase_orderline.purchase_order = Purchase_order.purchase_Orde' +
        'r and'
      
        '((Purchase_Orderline.customer = :Customer) or (0 = :Customer)) a' +
        'nd'
      '((Purchase_Orderline.Rep = :Rep) or (0 = :Rep))')
    Left = 672
    Top = 40
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
      end
      item
        Name = 'Rep'
      end
      item
        Name = 'Rep'
      end>
  end
  object qryGetJobBags: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select count(Job_bag.Job_Bag) as Job_Bag_Count'
      'from Job_Bag'
      'where Date_point >= :Date_From and'
      'Date_Point <= :Date_To and'
      '((Job_Bag.customer = :Customer) or (0 = :Customer)) and'
      '((Job_Bag.Rep = :Rep) or (0 = :Rep))')
    Left = 592
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
      end
      item
        Name = 'Rep'
      end
      item
        Name = 'Rep'
      end>
  end
  object qryGetNewClients: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select distinct count(customer.customer) as Customer_Count'
      'from  customer,'
      '      customer_branch,'
      '      reps_branches'
      'where date_created >= :Date_From and'
      'date_created <= :Date_To and'
      'customer.customer = customer_branch.customer and'
      '('
      '(Customer_Branch.customer = reps_branches.customer) and'
      '(Customer_branch.branch_no = reps_branches.branch_no)'
      ') and'
      '((Reps_branches.rep = :rep) or (0 = :Rep))')
    Left = 718
    Top = 102
    ParamData = <
      item
        Name = 'Date_From'
      end
      item
        Name = 'Date_To'
      end
      item
        Name = 'rep'
      end
      item
        Name = 'Rep'
      end>
  end
  object qryDummy: TFDQuery
    SQL.Strings = (
      'SELECT DISTINCT Period.Period,'
      '  (Period.Last_Period_End_Date) + 1 as Start_Date,'
      '  Period.Period_End_Date,'
      #9'period.description,'
      '  Sales_Profit.Customer,'
      '  Sales_Profit.Rep,'
      '  Sales_Profit.Sales_Invoice,'
      '  (select Customer.Name'
      '   from Customer'
      
        '   where Customer.Customer = Sales_Profit.Customer) as Customer_' +
        'Name,'
      '  (select Rep.Name'
      '   from Rep'
      '   where Rep.Rep = Sales_Profit.Rep) as Rep_Name,'
      #9'(select Sales_invoice.invoice_or_credit'
      '   from Sales_Invoice'
      
        '   where Sales_invoice.Sales_Invoice = Sales_Profit.Sales_Invoic' +
        'e) as invoice_or_credit,'
      #9'sum(sales_profit.total_sales_value) as Total_Invoice_Value'
      
        'FROM Period LEFT JOIN Sales_profit ON Period.Period = Sales_prof' +
        'it.Period'
      'WHERE'
      
        '  Period.Period >= :First_Period and Period.Period <= :Last_Peri' +
        'od AND'
      '  ((Sales_Profit.rep = :Rep) or (0 = :Rep))'
      'GROUP BY'
      #9'Period.Period,'
      '  Period.Last_Period_End_Date,'
      '  Period.Period_End_Date,'
      #9'period.description,'
      '  Sales_Profit.Customer,'
      '  Sales_Profit.Rep,'
      '  Sales_Profit.Sales_Invoice')
    Left = 240
    Top = 32
    ParamData = <
      item
        Name = 'First_Period'
      end
      item
        Name = 'Last_Period'
      end
      item
        Name = 'Rep'
      end
      item
        Name = 'Rep'
      end>
  end
end
