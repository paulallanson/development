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
  Scaled = True
  OnCreate = FormCreate
  TextHeight = 13
  object qrpDetails: TQuickRep
    Left = 16
    Top = 16
    Width = 794
    Height = 1123
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
      Left = 38
      Top = 38
      Width = 718
      Height = 107
      Frame.DrawBottom = True
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        283.104166666666700000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object QRLabel1: TQRLabel
        Left = 234
        Top = 8
        Width = 216
        Height = 19
        Size.Values = (
          50.270833333333330000
          619.125000000000000000
          21.166666666666670000
          571.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Sales Invoice Statistical Report'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
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
        Left = 286
        Top = 32
        Width = 111
        Height = 17
        Size.Values = (
          44.979166666666670000
          756.708333333333400000
          84.666666666666680000
          293.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Date Range From: '
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel9: TQRLabel
        Left = 8
        Top = 88
        Width = 38
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          232.833333333333400000
          100.541666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Period'
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
      object QRLabel4: TQRLabel
        Left = 184
        Top = 72
        Width = 84
        Height = 17
        Size.Values = (
          44.979166666666670000
          486.833333333333400000
          190.500000000000000000
          222.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sales Invoices'
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
      object QRLabel3: TQRLabel
        Left = 320
        Top = 72
        Width = 79
        Height = 17
        Size.Values = (
          44.979166666666670000
          846.666666666666600000
          190.500000000000000000
          209.020833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sales Credits'
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
      object QRLabel5: TQRLabel
        Left = 432
        Top = 88
        Width = 99
        Height = 17
        Size.Values = (
          44.979166666666670000
          1143.000000000000000000
          232.833333333333400000
          261.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Purchase Orders'
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
      object QRLabel6: TQRLabel
        Left = 563
        Top = 88
        Width = 55
        Height = 17
        Size.Values = (
          44.979166666666670000
          1489.604166666667000000
          232.833333333333400000
          145.520833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Job Bags'
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
        Left = 160
        Top = 88
        Width = 35
        Height = 17
        Size.Values = (
          44.979166666666670000
          423.333333333333300000
          232.833333333333400000
          92.604166666666680000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Count'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel10: TQRLabel
        Left = 232
        Top = 88
        Width = 34
        Height = 17
        Size.Values = (
          44.979166666666670000
          613.833333333333400000
          232.833333333333400000
          89.958333333333340000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Value'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel11: TQRLabel
        Left = 304
        Top = 88
        Width = 35
        Height = 17
        Size.Values = (
          44.979166666666670000
          804.333333333333200000
          232.833333333333400000
          92.604166666666680000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Count'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel12: TQRLabel
        Left = 376
        Top = 88
        Width = 34
        Height = 17
        Size.Values = (
          44.979166666666670000
          994.833333333333400000
          232.833333333333400000
          89.958333333333340000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Value'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel13: TQRLabel
        Left = 464
        Top = 72
        Width = 26
        Height = 17
        Size.Values = (
          44.979166666666670000
          1227.666666666667000000
          190.500000000000000000
          68.791666666666680000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'New'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel15: TQRLabel
        Left = 576
        Top = 72
        Width = 26
        Height = 17
        Size.Values = (
          44.979166666666670000
          1524.000000000000000000
          190.500000000000000000
          68.791666666666680000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'New'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel14: TQRLabel
        Left = 644
        Top = 88
        Width = 70
        Height = 17
        Size.Values = (
          44.979166666666670000
          1703.916666666667000000
          232.833333333333400000
          185.208333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'New Clients'
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
    end
    object qrgrpRepHeader: TQRGroup
      Left = 38
      Top = 145
      Width = 718
      Height = 24
      AlignToBottom = False
      BeforePrint = qrgrpRepHeaderBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        63.500000000000000000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'qryReport.Rep_Name'
      FooterBand = qrbRepFooter
      Master = qrDetails
      ReprintOnNewPage = False
      object qrlblName: TQRLabel
        Left = 8
        Top = 4
        Width = 24
        Height = 17
        Size.Values = (
          44.979166666666670000
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
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrdbTextName: TQRDBText
        Left = 104
        Top = 4
        Width = 65
        Height = 17
        Size.Values = (
          44.979166666666670000
          275.166666666666700000
          10.583333333333330000
          171.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Rep_Name'
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
      Left = 38
      Top = 172
      Width = 718
      Height = 29
      AlignToBottom = False
      BeforePrint = qrDetailsBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        76.729166666666670000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpDetails
      DataSet = qryReport
      PrintBefore = False
      PrintIfEmpty = True
      object QRLabel7: TQRLabel
        Left = 64
        Top = 8
        Width = 57
        Height = 17
        Size.Values = (
          44.979166666666670000
          169.333333333333300000
          21.166666666666670000
          150.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRDBText2: TQRDBText
        Left = 128
        Top = 8
        Width = 98
        Height = 17
        Size.Values = (
          44.979166666666670000
          338.666666666666700000
          21.166666666666670000
          259.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Customer_Name'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel8: TQRLabel
        Left = 248
        Top = 8
        Width = 24
        Height = 17
        Size.Values = (
          44.979166666666670000
          656.166666666666800000
          21.166666666666670000
          63.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Rep'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRDBText3: TQRDBText
        Left = 312
        Top = 8
        Width = 65
        Height = 17
        Size.Values = (
          44.979166666666670000
          825.500000000000100000
          21.166666666666670000
          171.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Rep_Name'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRDBText4: TQRDBText
        Left = 416
        Top = 8
        Width = 99
        Height = 17
        Size.Values = (
          44.979166666666670000
          1100.666666666667000000
          21.166666666666670000
          261.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Invoice_or_Credit'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRDBText5: TQRDBText
        Left = 528
        Top = 8
        Width = 81
        Height = 17
        Size.Values = (
          44.979166666666670000
          1397.000000000000000000
          21.166666666666670000
          214.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Invoice_Count'
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
      Left = 38
      Top = 201
      Width = 718
      Height = 24
      AlignToBottom = False
      BeforePrint = qrbPeriodFooterBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.500000000000000000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object qrlblSalesCreditValue: TQRLabel
        Left = 327
        Top = 4
        Width = 84
        Height = 17
        Size.Values = (
          44.979166666666670000
          865.187500000000000000
          10.583333333333330000
          222.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'SalesCreditValue'
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
      object qrlblSalesInvoiceValue: TQRLabel
        Left = 177
        Top = 4
        Width = 90
        Height = 17
        Size.Values = (
          44.979166666666670000
          468.312500000000100000
          10.583333333333330000
          238.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'SalesInvoiceValue'
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
      object qrlblSalesInvoiceCount: TQRLabel
        Left = 105
        Top = 4
        Width = 90
        Height = 17
        Size.Values = (
          44.979166666666670000
          277.812500000000000000
          10.583333333333330000
          238.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'SalesInvoiceCount'
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
      object qrlblSalesCreditCount: TQRLabel
        Left = 255
        Top = 4
        Width = 84
        Height = 17
        Size.Values = (
          44.979166666666670000
          674.687500000000000000
          10.583333333333330000
          222.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'SalesCreditCount'
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
      object qrlblPurchaseOrderCount: TQRLabel
        Left = 405
        Top = 4
        Width = 103
        Height = 17
        Size.Values = (
          44.979166666666670000
          1071.562500000000000000
          10.583333333333330000
          272.520833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'PurchaseOrderCount'
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
      object qrlblJobBagCount: TQRLabel
        Left = 547
        Top = 4
        Width = 65
        Height = 17
        Size.Values = (
          44.979166666666670000
          1447.270833333333000000
          10.583333333333330000
          171.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'JobBagCount'
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
      object QRDBText1: TQRDBText
        Left = 32
        Top = 4
        Width = 55
        Height = 17
        Size.Values = (
          44.979166666666670000
          84.666666666666680000
          10.583333333333330000
          145.520833333333300000)
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
      object qrlblNewClientCount: TQRLabel
        Left = 630
        Top = 4
        Width = 78
        Height = 17
        Size.Values = (
          44.979166666666670000
          1666.875000000000000000
          10.583333333333330000
          206.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'NewClientCount'
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
    end
    object qrgrpPeriodHeader: TQRGroup
      Left = 38
      Top = 169
      Width = 718
      Height = 3
      AlignToBottom = False
      BeforePrint = qrgrpPeriodHeaderBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        7.937500000000000000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'qryReport.Period'
      FooterBand = qrbPeriodFooter
      Master = qrDetails
      ReprintOnNewPage = False
    end
    object qrbRepFooter: TQRBand
      Left = 38
      Top = 225
      Width = 718
      Height = 32
      AlignToBottom = False
      BeforePrint = qrbRepFooterBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        84.666666666666670000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRLabel17: TQRLabel
        Left = 56
        Top = 8
        Width = 35
        Height = 17
        Size.Values = (
          44.979166666666670000
          148.166666666666700000
          21.166666666666670000
          92.604166666666680000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Totals'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
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
        Left = 120
        Top = 1
        Width = 593
        Height = 6
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
        Left = 92
        Top = 8
        Width = 103
        Height = 17
        Size.Values = (
          44.979166666666670000
          243.416666666666700000
          21.166666666666670000
          272.520833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'SalesInvoiceCount'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
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
        Left = 166
        Top = 8
        Width = 101
        Height = 17
        Size.Values = (
          44.979166666666670000
          439.208333333333400000
          21.166666666666670000
          267.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'SalesInvoiceValue'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
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
        Left = 241
        Top = 8
        Width = 98
        Height = 17
        Size.Values = (
          44.979166666666670000
          637.645833333333400000
          21.166666666666670000
          259.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'SalesCreditCount'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
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
        Left = 315
        Top = 8
        Width = 96
        Height = 17
        Size.Values = (
          44.979166666666670000
          833.437500000000000000
          21.166666666666670000
          254.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'SalesCreditValue'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
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
        Left = 390
        Top = 8
        Width = 118
        Height = 17
        Size.Values = (
          44.979166666666670000
          1031.875000000000000000
          21.166666666666670000
          312.208333333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'PurchaseOrderCount'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
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
        Left = 538
        Top = 8
        Width = 74
        Height = 17
        Size.Values = (
          44.979166666666670000
          1423.458333333333000000
          21.166666666666670000
          195.791666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'JobBagCount'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
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
        Left = 618
        Top = 8
        Width = 90
        Height = 17
        Size.Values = (
          44.979166666666670000
          1635.125000000000000000
          21.166666666666670000
          238.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'NewClientCount'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
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
      Left = 38
      Top = 257
      Width = 718
      Height = 40
      AlignToBottom = False
      BeforePrint = qrbReportTotalBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRLabel16: TQRLabel
        Left = 16
        Top = 8
        Width = 75
        Height = 17
        Size.Values = (
          44.979166666666670000
          42.333333333333340000
          21.166666666666670000
          198.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Report Totals'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
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
        Left = 120
        Top = 1
        Width = 593
        Height = 6
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
        Left = 92
        Top = 8
        Width = 103
        Height = 17
        Size.Values = (
          44.979166666666670000
          243.416666666666700000
          21.166666666666670000
          272.520833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'SalesInvoiceCount'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
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
        Left = 166
        Top = 8
        Width = 101
        Height = 17
        Size.Values = (
          44.979166666666670000
          439.208333333333400000
          21.166666666666670000
          267.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'SalesInvoiceValue'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
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
        Left = 241
        Top = 8
        Width = 98
        Height = 17
        Size.Values = (
          44.979166666666670000
          637.645833333333400000
          21.166666666666670000
          259.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'SalesCreditCount'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
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
        Left = 315
        Top = 8
        Width = 96
        Height = 17
        Size.Values = (
          44.979166666666670000
          833.437500000000000000
          21.166666666666670000
          254.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'SalesCreditValue'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
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
        Left = 390
        Top = 8
        Width = 118
        Height = 17
        Size.Values = (
          44.979166666666670000
          1031.875000000000000000
          21.166666666666670000
          312.208333333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'PurchaseOrderCount'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
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
        Left = 538
        Top = 8
        Width = 74
        Height = 17
        Size.Values = (
          44.979166666666670000
          1423.458333333333000000
          21.166666666666670000
          195.791666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'JobBagCount'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
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
        Left = 618
        Top = 8
        Width = 90
        Height = 17
        Size.Values = (
          44.979166666666670000
          1635.125000000000000000
          21.166666666666670000
          238.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'NewClientCount'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
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
