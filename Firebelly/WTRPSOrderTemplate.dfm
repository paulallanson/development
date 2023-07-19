object frmwtRPSOrderTemplate: TfrmwtRPSOrderTemplate
  Left = 43
  Top = 110
  Caption = 'Sales Order Templating Report'
  ClientHeight = 576
  ClientWidth = 1161
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Scaled = False
  TextHeight = 13
  object qrpDetails: TQuickRep
    Left = 16
    Top = 16
    Width = 1123
    Height = 794
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
    ReportTitle = 'Sales Orders due for templating Report'
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
    object qrbGroupHeader: TQRGroup
      Left = 38
      Top = 128
      Width = 1047
      Height = 32
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        84.666666666666670000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      FooterBand = qrbGroupFooter
      Master = qrpDetails
      ReprintOnNewPage = False
      object qrlblSortBy: TQRLabel
        Left = 0
        Top = 8
        Width = 47
        Height = 17
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          21.166666666666670000
          124.354166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer'
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
      object qrGroupbyText: TQRDBText
        Left = 96
        Top = 8
        Width = 80
        Height = 17
        Size.Values = (
          44.979166666666670000
          254.000000000000000000
          21.166666666666670000
          211.666666666666700000)
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
      object qrlblPhone: TQRLabel
        Left = 264
        Top = 8
        Width = 74
        Height = 17
        Size.Values = (
          44.979166666666670000
          698.500000000000000000
          21.166666666666670000
          195.791666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Phone Number:'
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
      object qrPhoneText: TQRDBText
        Left = 344
        Top = 8
        Width = 90
        Height = 17
        Size.Values = (
          44.979166666666670000
          910.166666666666700000
          21.166666666666670000
          238.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySalesOrders
        DataField = 'telephone_number'
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
    end
    object qrsbDetails: TQRSubDetail
      Left = 38
      Top = 160
      Width = 1047
      Height = 35
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
        92.604166666666670000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpDetails
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText2: TQRDBText
        Tag = 1
        Left = 8
        Top = 1
        Width = 62
        Height = 15
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          2.645833333333333000
          164.041666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySalesOrders
        DataField = 'Sales_Order'
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
        Left = 64
        Top = 1
        Width = 62
        Height = 15
        Size.Values = (
          39.687500000000000000
          169.333333333333300000
          2.645833333333333000
          164.041666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Color = clWhite
        DataSet = qrySalesOrders
        DataField = 'Date_Raised'
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
        Left = 520
        Top = 1
        Width = 137
        Height = 15
        Size.Values = (
          39.687500000000000000
          1375.833333333333000000
          2.645833333333333000
          362.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qrySalesOrders
        DataField = 'Reference'
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
        Left = 264
        Top = 1
        Width = 257
        Height = 15
        Size.Values = (
          39.687500000000000000
          698.500000000000000000
          2.645833333333333000
          679.979166666666800000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qrySalesOrders
        DataField = 'Customer_Name'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlblTotal: TQRLabel
        Tag = 1
        Left = 985
        Top = 0
        Width = 53
        Height = 15
        Size.Values = (
          39.687500000000000000
          2606.145833333333000000
          0.000000000000000000
          140.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblTotal'
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
      object QRDBText4: TQRDBText
        Tag = 1
        Left = 128
        Top = 1
        Width = 30
        Height = 15
        Size.Values = (
          39.687500000000000000
          338.666666666666700000
          2.645833333333333000
          79.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySalesOrders
        DataField = 'Quote'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrrchTextAddress: TQRRichText
        Tag = 1
        Left = 664
        Top = 1
        Width = 153
        Height = 15
        Size.Values = (
          39.687500000000000000
          1756.833333333333000000
          2.645833333333333000
          404.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AutoStretch = True
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        HiresExport = False
        Transparent = False
        YIncrement = 50
        Lines.Strings = (
          'qrrchTextAddress')
      end
      object QRDBText1: TQRDBText
        Tag = 1
        Left = 264
        Top = 17
        Width = 393
        Height = 15
        Size.Values = (
          39.687500000000000000
          698.500000000000000000
          44.979166666666670000
          1039.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qrySalesOrders
        DataField = 'Description'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlblVAT: TQRLabel
        Tag = 1
        Left = 912
        Top = 0
        Width = 49
        Height = 15
        Size.Values = (
          39.687500000000000000
          2413.000000000000000000
          0.000000000000000000
          129.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblVAT'
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
      object qrlblGoods: TQRLabel
        Tag = 1
        Left = 836
        Top = 0
        Width = 62
        Height = 15
        Size.Values = (
          39.687500000000000000
          2211.916666666667000000
          0.000000000000000000
          164.041666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblGoods'
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
      object qrlblTemplateDate: TQRLabel
        Tag = 1
        Left = 185
        Top = 1
        Width = 69
        Height = 15
        Size.Values = (
          39.687500000000000000
          489.479166666666700000
          2.645833333333333000
          182.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Template Date'
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
    object qrbGroupFooter: TQRBand
      Left = 38
      Top = 195
      Width = 1047
      Height = 29
      AfterPrint = qrbGroupFooterAfterPrint
      AlignToBottom = False
      BeforePrint = qrbGroupFooterBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        76.729166666666670000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object qrlblCustTotal: TQRLabel
        Left = 962
        Top = 7
        Width = 79
        Height = 17
        Size.Values = (
          44.979166666666670000
          2545.291666666667000000
          18.520833333333330000
          209.020833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblCustTotal'
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
      object qrlblCustVAT: TQRLabel
        Left = 886
        Top = 7
        Width = 75
        Height = 17
        Size.Values = (
          44.979166666666670000
          2344.208333333333000000
          18.520833333333330000
          198.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblCustVAT'
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
        Left = 792
        Top = -1
        Width = 249
        Height = 8
        Size.Values = (
          21.166666666666670000
          2095.500000000000000000
          -2.645833333333333000
          658.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrGroupbyFootText: TQRDBText
        Left = 647
        Top = 9
        Width = 108
        Height = 17
        Size.Values = (
          44.979166666666670000
          1711.854166666667000000
          23.812500000000000000
          285.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySalesOrders
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
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
      object QRLabel2: TQRLabel
        Left = 762
        Top = 9
        Width = 28
        Height = 17
        Size.Values = (
          44.979166666666670000
          2016.125000000000000000
          23.812500000000000000
          74.083333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total'
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
      object qrlblCustGoods: TQRLabel
        Left = 809
        Top = 7
        Width = 88
        Height = 17
        Size.Values = (
          44.979166666666670000
          2140.479166666667000000
          18.520833333333330000
          232.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblCustGoods'
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
    object QRBand2: TQRBand
      Left = 38
      Top = 224
      Width = 1047
      Height = 32
      AfterPrint = QRBand2AfterPrint
      AlignToBottom = False
      BeforePrint = QRBand2BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        84.666666666666670000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRLabel10: TQRLabel
        Left = 722
        Top = 7
        Width = 68
        Height = 17
        Size.Values = (
          44.979166666666670000
          1910.291666666667000000
          18.520833333333330000
          179.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Report Total'
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
      object qrlblReportTotal: TQRLabel
        Left = 951
        Top = 7
        Width = 90
        Height = 17
        Size.Values = (
          44.979166666666670000
          2516.187500000000000000
          18.520833333333330000
          238.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblReportTotal'
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
        Left = 792
        Top = -1
        Width = 249
        Height = 8
        Size.Values = (
          21.166666666666670000
          2095.500000000000000000
          -2.645833333333333000
          658.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrlblReportVAT: TQRLabel
        Left = 875
        Top = 7
        Width = 86
        Height = 17
        Size.Values = (
          44.979166666666670000
          2315.104166666667000000
          18.520833333333330000
          227.541666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblReportVAT'
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
      object qrlblReportGoods: TQRLabel
        Left = 798
        Top = 7
        Width = 99
        Height = 17
        Size.Values = (
          44.979166666666670000
          2111.375000000000000000
          18.520833333333330000
          261.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblReportGoods'
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
    object QRBand1: TQRBand
      Left = 38
      Top = 38
      Width = 1047
      Height = 90
      Frame.DrawBottom = True
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        238.125000000000000000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object qrlblCaption: TQRLabel
        Left = 404
        Top = 5
        Width = 226
        Height = 19
        Size.Values = (
          50.270833333333330000
          1068.916666666667000000
          13.229166666666670000
          597.958333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Sales Orders due for Templating'
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
      object QRSysData1: TQRSysData
        Left = 968
        Top = 23
        Width = 69
        Height = 17
        Size.Values = (
          44.979166666666670000
          2561.166666666667000000
          60.854166666666670000
          182.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = 'Page: '
        Transparent = False
        ExportAs = exptText
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel3: TQRLabel
        Left = 8
        Top = 71
        Width = 59
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          187.854166666666700000
          156.104166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sales Order'
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
      object QRLabel4: TQRLabel
        Left = 80
        Top = 71
        Width = 23
        Height = 17
        Size.Values = (
          44.979166666666670000
          211.666666666666700000
          187.854166666666700000
          60.854166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date'
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
      object QRLabel5: TQRLabel
        Left = 264
        Top = 71
        Width = 104
        Height = 17
        Size.Values = (
          44.979166666666670000
          698.500000000000000000
          187.854166666666700000
          275.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer/Description'
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
      object QRLabel6: TQRLabel
        Left = 520
        Top = 71
        Width = 52
        Height = 17
        Size.Values = (
          44.979166666666670000
          1375.833333333333000000
          187.854166666666700000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Reference'
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
      object QRLabel12: TQRLabel
        Left = 984
        Top = 71
        Width = 55
        Height = 17
        Size.Values = (
          44.979166666666670000
          2603.500000000000000000
          187.854166666666700000
          145.520833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total Value'
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
      object qrlblDateRange: TQRLabel
        Left = 475
        Top = 27
        Width = 74
        Height = 15
        Size.Values = (
          39.687500000000000000
          1256.770833333333000000
          71.437500000000000000
          195.791666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'qrlblDateRange'
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
      object QRLabel1: TQRLabel
        Left = 128
        Top = 71
        Width = 30
        Height = 17
        Size.Values = (
          44.979166666666670000
          338.666666666666700000
          187.854166666666700000
          79.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Quote'
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
      object QRLabel7: TQRLabel
        Left = 184
        Top = 71
        Width = 69
        Height = 17
        Size.Values = (
          44.979166666666670000
          486.833333333333300000
          187.854166666666700000
          182.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Template Date'
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
      object QRLabel8: TQRLabel
        Left = 664
        Top = 71
        Width = 86
        Height = 17
        Size.Values = (
          44.979166666666670000
          1756.833333333333000000
          187.854166666666700000
          227.541666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Installation Details'
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
      object QRSysData2: TQRSysData
        Left = 982
        Top = 8
        Width = 56
        Height = 17
        Size.Values = (
          44.979166666666670000
          2598.208333333333000000
          21.166666666666670000
          148.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsDateTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
        Transparent = False
        ExportAs = exptText
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel9: TQRLabel
        Left = 864
        Top = 71
        Width = 33
        Height = 17
        Size.Values = (
          44.979166666666670000
          2286.000000000000000000
          187.854166666666700000
          87.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Goods'
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
      object QRLabel11: TQRLabel
        Left = 936
        Top = 71
        Width = 23
        Height = 17
        Size.Values = (
          44.979166666666670000
          2476.500000000000000000
          187.854166666666700000
          60.854166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'VAT'
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
      object qrlblSelection: TQRLabel
        Left = 479
        Top = 47
        Width = 65
        Height = 15
        Size.Values = (
          39.687500000000000000
          1267.354166666667000000
          124.354166666666700000
          171.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'qrlblSelection'
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
  end
  object qrySalesOrders: TFDQuery
    ConnectionName = 'Wt'
    SQL.Strings = (
      'SELECT  Sales_Order_Line.Sales_Order,'
      '        Sales_Order_Line.Sales_order_Line_no,'
      '        Sales_Order_Line.Nett_Price,'
      '        Sales_Order_Line.Discount_Value,'
      '        Sales_Order_Line.Installation_price,'
      '        Sales_Order_Line.Survey_price,'
      '        Sales_Order_Line.Delivery_Price,'
      '        Sales_Order_Line.Markup_Value,'
      '        Sales_Order_Line.Waste_Value,'
      '        Sales_Order_Line.Vat,'
      '        Sales_Order_Line.Description,'
      '        Vat.Vat_Rate,'
      '        Sales_Order_Line.Quote,'
      '        Sales_Order_Line.Unit_price,'
      '        Sales_Order_Line.Job,'
      '        Sales_Order.Date_Raised,'
      '        Sales_Order.Sales_Order_Status,'
      '        Sales_Order_Status.Sales_Order_Status_Desc,'
      '        Sales_Order.Template_Date,'
      '        Sales_Order.Install_Name,'
      '        Sales_Order.Install_Phone,'
      '        Sales_Order.Email_Address,'
      '        Sales_Order.Install_Address,'
      '        Sales_Order.Customer_Name,'
      '        Sales_Order.Reference,'
      '        Sales_Order.Sales_Order_Status,'
      '        Sales_Order.IsTemplateInOutlook,'
      '        Sales_Order_Status.Sales_Order_Status_Desc,'
      '        Customer.Telephone_number,'
      '        Customer.Is_Retail_Customer,'
      '        Customer.Is_Commercial_Customer,'
      '        Rep.Rep,'
      '        Rep.Rep_Name'
      'FROM Rep'
      '        INNER JOIN ((Sales_Order_Status'
      '        INNER JOIN (Customer'
      '        INNER JOIN Sales_Order'
      '          ON Customer.Customer = Sales_Order.Customer)'
      
        '          ON Sales_Order_Status.Sales_Order_Status = Sales_Order' +
        '.Sales_Order_Status)'
      '        INNER JOIN (Vat'
      '        INNER JOIN Sales_Order_Line'
      '          ON Vat.Vat = Sales_Order_Line.Vat)'
      
        '          ON Sales_Order.Sales_Order = Sales_Order_Line.Sales_Or' +
        'der)'
      '          ON Rep.Rep = Sales_Order.Rep'
      'WHERE (Sales_Order_Line.Quote <> NULL) and'
      
        '      ((Sales_Order.Customer = :Customer) or (0 = :Customer)) an' +
        'd'
      '      ((Sales_Order.Rep = :Rep) or (0 = :Rep)) and'
      
        '      ((Sales_Order.Template_Date >= :Date_From) and (Sales_Orde' +
        'r.Template_Date <= :Date_To)) and'
      '      (Sales_Order.Sales_order_status < :Sales_Order_Status) AND'
      
        '      ((Sales_Order.IsTemplateInOutlook = :IsTemplateInOutlook) ' +
        'OR (Sales_Order.IsTemplateInOutlook = '#39'Y'#39') OR (Sales_Order.IsTem' +
        'plateInOutlook IS NULL)) AND'
      
        '      (((Customer.Is_Retail_Customer = :Is_Retail_Customer) AND ' +
        '(Customer.Is_Commercial_Customer = :Is_Commercial_Customer)) or ' +
        '(:Is_Retail_Customer = '#39'A'#39'))'
      '')
    Left = 144
    Top = 304
    ParamData = <
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
        Name = 'Rep'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Rep'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Date_From'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Date_To'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Order_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IsTemplateInOutlook'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Is_Retail_Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Is_Commercial_Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Is_Retail_Customer'
        ParamType = ptUnknown
      end>
    object qrySalesOrdersSales_Order: TIntegerField
      FieldName = 'Sales_Order'
    end
    object qrySalesOrdersSales_order_Line_no: TIntegerField
      FieldName = 'Sales_order_Line_no'
    end
    object qrySalesOrdersNett_Price: TFloatField
      FieldName = 'Nett_Price'
    end
    object qrySalesOrdersDiscount_Value: TFloatField
      FieldName = 'Discount_Value'
    end
    object qrySalesOrdersInstallation_price: TFloatField
      FieldName = 'Installation_price'
    end
    object qrySalesOrdersSurvey_price: TFloatField
      FieldName = 'Survey_price'
    end
    object qrySalesOrdersDelivery_Price: TFloatField
      FieldName = 'Delivery_Price'
    end
    object qrySalesOrdersVat: TIntegerField
      FieldName = 'Vat'
    end
    object qrySalesOrdersVat_Rate: TFloatField
      FieldName = 'Vat_Rate'
    end
    object qrySalesOrdersQuote: TIntegerField
      FieldName = 'Quote'
    end
    object qrySalesOrdersUnit_price: TFloatField
      FieldName = 'Unit_price'
    end
    object qrySalesOrdersJob: TFloatField
      FieldName = 'Job'
    end
    object qrySalesOrdersDate_Raised: TDateTimeField
      FieldName = 'Date_Raised'
    end
    object qrySalesOrdersTemplate_Date: TDateTimeField
      FieldName = 'Template_Date'
    end
    object qrySalesOrdersCustomer_Name: TStringField
      FieldName = 'Customer_Name'
      Size = 50
    end
    object qrySalesOrdersReference: TStringField
      FieldName = 'Reference'
      Size = 30
    end
    object qrySalesOrdersTelephone_number: TStringField
      FieldName = 'Telephone_number'
      Size = 30
    end
    object qrySalesOrdersDescription: TStringField
      FieldName = 'Description'
      Size = 50
    end
    object qrySalesOrdersInstall_Address: TIntegerField
      FieldName = 'Install_Address'
    end
    object qrySalesOrdersSales_Order_Status: TIntegerField
      FieldName = 'Sales_Order_Status'
    end
    object qrySalesOrdersSales_Order_Status_Desc: TStringField
      FieldName = 'Sales_Order_Status_Desc'
      Size = 30
    end
    object qrySalesOrdersMarkup_Value: TFloatField
      FieldName = 'Markup_Value'
    end
    object qrySalesOrdersWaste_Value: TFloatField
      FieldName = 'Waste_Value'
    end
    object qrySalesOrdersRep_Name: TStringField
      FieldName = 'Rep_Name'
      Size = 50
    end
    object qrySalesOrdersRep: TIntegerField
      FieldName = 'Rep'
    end
    object qrySalesOrdersIs_Retail_Customer: TStringField
      FieldName = 'Is_Retail_Customer'
      Size = 1
    end
    object qrySalesOrdersIs_Commercial_Customer: TStringField
      FieldName = 'Is_Commercial_Customer'
      Size = 1
    end
    object qrySalesOrdersInstall_Name: TStringField
      FieldName = 'Install_Name'
      Size = 50
    end
    object qrySalesOrdersInstall_Phone: TStringField
      FieldName = 'Install_Phone'
      Size = 50
    end
    object qrySalesOrdersEmail_Address: TStringField
      FieldName = 'Email_Address'
      Size = 100
    end
    object qrySalesOrdersIsTemplateInOutlook: TStringField
      FieldName = 'IsTemplateInOutlook'
      Size = 1
    end
  end
  object qrygetNotes: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from Notes'
      'where notes_code = :Notes_Code'
      'order by notes_code, notes_line')
    Left = 230
    Top = 309
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Notes_Code'
        ParamType = ptUnknown
      end>
  end
  object OLDqrySalesOrders: TFDQuery
    ConnectionName = 'Wt'
    SQL.Strings = (
      'SELECT  Sales_Order_Line.Sales_Order,'
      '        Sales_Order_Line.Sales_order_Line_no,'
      '        Sales_Order_Line.Nett_Price,'
      '        Sales_Order_Line.Discount_Value,'
      '        Sales_Order_Line.Installation_price,'
      '        Sales_Order_Line.Survey_price,'
      '        Sales_Order_Line.Delivery_Price,'
      '        Sales_Order_Line.Markup_Value,'
      '        Sales_Order_Line.Waste_Value,'
      '        Sales_Order_Line.Vat,'
      '        Sales_Order_Line.Description,'
      '        Vat.Vat_Rate,'
      '        Sales_Order_Line.Quote,'
      '        Sales_Order_Line.Unit_price,'
      '        Sales_Order_Line.Job,'
      '        Sales_Order.Date_Raised,'
      '        Sales_Order.Sales_Order_Status,'
      '        Sales_Order_Status.Sales_Order_Status_Desc,'
      '        Sales_Order.Template_Date,'
      '        Sales_Order.Install_Name,'
      '        Sales_Order.Install_Phone,'
      '        Sales_Order.Email_Address,'
      '        Sales_Order.Install_Address,'
      '        Sales_Order.Customer_Name,'
      '        Sales_Order.Reference,'
      '        Sales_Order.Sales_Order_Status,'
      '        Sales_Order.IsTemplateInOutlook,'
      '        Sales_Order_Status.Sales_Order_Status_Desc,'
      '        Customer.Telephone_number,'
      '        Customer.Is_Retail_Customer,'
      '        Customer.Is_Commercial_Customer,'
      '        Rep.Rep,'
      '        Rep.Rep_Name'
      'FROM Rep'
      '        INNER JOIN ((Sales_Order_Status'
      '        INNER JOIN (Customer'
      '        INNER JOIN Sales_Order'
      '          ON Customer.Customer = Sales_Order.Customer)'
      
        '          ON Sales_Order_Status.Sales_Order_Status = Sales_Order' +
        '.Sales_Order_Status)'
      '        INNER JOIN (Vat'
      '        INNER JOIN Sales_Order_Line'
      '          ON Vat.Vat = Sales_Order_Line.Vat)'
      
        '          ON Sales_Order.Sales_Order = Sales_Order_Line.Sales_Or' +
        'der)'
      '          ON Rep.Rep = Sales_Order.Rep'
      
        'WHERE (Sales_Order_Line.Quote <> NULL) and (Sales_Order_Line.Job' +
        ' is NULL) and'
      
        '      ((Sales_Order.Customer = :Customer) or (0 = :Customer)) an' +
        'd'
      '      ((Sales_Order.Rep = :Rep) or (0 = :Rep)) and'
      
        '      ((Sales_Order.Template_Date >= :Date_From) and (Sales_Orde' +
        'r.Template_Date <= :Date_To)) and'
      '      (Sales_Order.Sales_order_status < 60) AND'
      
        '      ((Sales_Order.IsTemplateInOutlook = :IsTemplateInOutlook) ' +
        'OR (Sales_Order.IsTemplateInOutlook = '#39'Y'#39') OR (Sales_Order.IsTem' +
        'plateInOutlook IS NULL)) AND'
      
        '      (((Customer.Is_Retail_Customer = :Is_Retail_Customer) AND ' +
        '(Customer.Is_Commercial_Customer = :Is_Commercial_Customer)) or ' +
        '(:Is_Retail_Customer = '#39'A'#39'))'
      '')
    Left = 336
    Top = 312
    ParamData = <
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
        Name = 'Rep'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Rep'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Date_From'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Date_To'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IsTemplateInOutlook'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Is_Retail_Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Is_Commercial_Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Is_Retail_Customer'
        ParamType = ptUnknown
      end>
    object IntegerField1: TIntegerField
      FieldName = 'Sales_Order'
    end
    object IntegerField2: TIntegerField
      FieldName = 'Sales_order_Line_no'
    end
    object FloatField1: TFloatField
      FieldName = 'Nett_Price'
    end
    object FloatField2: TFloatField
      FieldName = 'Discount_Value'
    end
    object FloatField3: TFloatField
      FieldName = 'Installation_price'
    end
    object FloatField4: TFloatField
      FieldName = 'Survey_price'
    end
    object FloatField5: TFloatField
      FieldName = 'Delivery_Price'
    end
    object IntegerField3: TIntegerField
      FieldName = 'Vat'
    end
    object FloatField6: TFloatField
      FieldName = 'Vat_Rate'
    end
    object IntegerField4: TIntegerField
      FieldName = 'Quote'
    end
    object FloatField7: TFloatField
      FieldName = 'Unit_price'
    end
    object FloatField8: TFloatField
      FieldName = 'Job'
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'Date_Raised'
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'Template_Date'
    end
    object StringField1: TStringField
      FieldName = 'Customer_Name'
      Size = 50
    end
    object StringField2: TStringField
      FieldName = 'Reference'
      Size = 30
    end
    object StringField3: TStringField
      FieldName = 'Telephone_number'
      Size = 30
    end
    object StringField4: TStringField
      FieldName = 'Description'
      Size = 50
    end
    object IntegerField5: TIntegerField
      FieldName = 'Install_Address'
    end
    object IntegerField6: TIntegerField
      FieldName = 'Sales_Order_Status'
    end
    object StringField5: TStringField
      FieldName = 'Sales_Order_Status_Desc'
      Size = 30
    end
    object FloatField9: TFloatField
      FieldName = 'Markup_Value'
    end
    object FloatField10: TFloatField
      FieldName = 'Waste_Value'
    end
    object StringField6: TStringField
      FieldName = 'Rep_Name'
      Size = 50
    end
    object IntegerField7: TIntegerField
      FieldName = 'Rep'
    end
    object StringField7: TStringField
      FieldName = 'Is_Retail_Customer'
      Size = 1
    end
    object StringField8: TStringField
      FieldName = 'Is_Commercial_Customer'
      Size = 1
    end
    object StringField9: TStringField
      FieldName = 'Install_Name'
      Size = 50
    end
    object StringField10: TStringField
      FieldName = 'Install_Phone'
      Size = 50
    end
    object StringField11: TStringField
      FieldName = 'Email_Address'
      Size = 100
    end
    object StringField12: TStringField
      FieldName = 'IsTemplateInOutlook'
      Size = 1
    end
  end
end
