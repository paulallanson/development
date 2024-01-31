object PBRPStkMovefrm: TPBRPStkMovefrm
  Left = 3
  Top = 101
  Caption = 'Customer Stock Movement Report'
  ClientHeight = 431
  ClientWidth = 780
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  
  OnCreate = FormCreate
  TextHeight = 13
  object QuickReport: TQuickRep
    Left = 16
    Top = 16
    Width = 1123
    Height = 794
    ShowingPreview = False
    BeforePrint = QuickReportBeforePrint
    DataSet = qryReport
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
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
    ReportTitle = 'Customer Stock Movement Report'
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
    object PageTitle: TQRBand
      Left = 38
      Top = 38
      Width = 1047
      Height = 117
      Frame.DrawBottom = True
      AlignToBottom = False
      TransparentBand = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        309.562500000000000000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object QRSysData1: TQRSysData
        Left = 1005
        Top = 8
        Width = 39
        Height = 17
        Size.Values = (
          44.979166666666700000
          2659.062500000000000000
          21.166666666666700000
          103.187500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = DEFAULT_CHARSET
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
      object QRLabel13: TQRLabel
        Left = 949
        Top = 8
        Width = 47
        Height = 17
        Size.Values = (
          44.979166666666700000
          2510.895833333330000000
          21.166666666666700000
          124.354166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Page No.:'
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
      object qrlblTitle: TQRLabel
        Left = 336
        Top = 8
        Width = 375
        Height = 23
        Size.Values = (
          60.854166666666670000
          889.000000000000000000
          21.166666666666670000
          992.187500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Customer Stock Movements - Run Date: '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 14
      end
      object QRLabel2: TQRLabel
        Left = 89
        Top = 95
        Width = 43
        Height = 17
        Size.Values = (
          44.979166666666670000
          235.479166666666700000
          251.354166666666700000
          113.770833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Job No.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel4: TQRLabel
        Left = 52
        Top = 95
        Width = 27
        Height = 17
        Size.Values = (
          44.979166666666700000
          137.583333333333000000
          251.354166666667000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel8: TQRLabel
        Left = 246
        Top = 95
        Width = 76
        Height = 17
        Size.Values = (
          44.979166666666670000
          650.875000000000000000
          251.354166666666700000
          201.083333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer PO'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel7: TQRLabel
        Left = 362
        Top = 95
        Width = 45
        Height = 17
        Size.Values = (
          44.979166666666670000
          957.791666666666800000
          251.354166666666700000
          119.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Quantity'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel15: TQRLabel
        Left = 413
        Top = 71
        Width = 70
        Height = 17
        Size.Values = (
          44.979166666666670000
          1092.729166666667000000
          187.854166666666700000
          185.208333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Movement In'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRShape3: TQRShape
        Left = 501
        Top = 75
        Width = 49
        Height = 9
        Size.Values = (
          23.812500000000000000
          1325.562500000000000000
          198.437500000000000000
          129.645833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape4: TQRShape
        Left = 357
        Top = 75
        Width = 49
        Height = 9
        Size.Values = (
          23.812500000000000000
          944.562500000000000000
          198.437500000000000000
          129.645833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel16: TQRLabel
        Left = 805
        Top = 95
        Width = 64
        Height = 17
        Size.Values = (
          44.979166666666670000
          2129.895833333333000000
          251.354166666666700000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Delivery To:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel6: TQRLabel
        Left = 416
        Top = 95
        Width = 67
        Height = 17
        Size.Values = (
          44.979166666666670000
          1100.666666666667000000
          251.354166666666700000
          177.270833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sales Value'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel10: TQRLabel
        Left = 490
        Top = 95
        Width = 61
        Height = 17
        Size.Values = (
          44.979166666666670000
          1296.458333333333000000
          251.354166666666700000
          161.395833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cost Value'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRShape5: TQRShape
        Left = 565
        Top = 75
        Width = 49
        Height = 9
        Size.Values = (
          23.812500000000000000
          1494.895833333330000000
          198.437500000000000000
          129.645833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel11: TQRLabel
        Left = 621
        Top = 71
        Width = 79
        Height = 17
        Size.Values = (
          44.979166666666670000
          1643.062500000000000000
          187.854166666666700000
          209.020833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Movement Out'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRShape6: TQRShape
        Left = 717
        Top = 75
        Width = 49
        Height = 9
        Size.Values = (
          23.812500000000000000
          1897.062500000000000000
          198.437500000000000000
          129.645833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel9: TQRLabel
        Left = 566
        Top = 95
        Width = 45
        Height = 17
        Size.Values = (
          44.979166666666670000
          1497.541666666667000000
          251.354166666666700000
          119.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Quantity'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel17: TQRLabel
        Left = 624
        Top = 95
        Width = 67
        Height = 17
        Size.Values = (
          44.979166666666670000
          1651.000000000000000000
          251.354166666666700000
          177.270833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sales Value'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel18: TQRLabel
        Left = 704
        Top = 95
        Width = 61
        Height = 17
        Size.Values = (
          44.979166666666670000
          1862.666666666667000000
          251.354166666666700000
          161.395833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cost Value'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qrlblDateRange: TQRLabel
        Left = 448
        Top = 32
        Width = 163
        Height = 17
        Size.Values = (
          44.979166666666670000
          1185.333333333333000000
          84.666666666666680000
          431.270833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'For movements dated from: '
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel19: TQRLabel
        Left = 149
        Top = 95
        Width = 86
        Height = 17
        Size.Values = (
          44.979166666666670000
          394.229166666666700000
          251.354166666666700000
          227.541666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Movement Type'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
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
    object CustGroup: TQRGroup
      Left = 38
      Top = 163
      Width = 1047
      Height = 24
      AlignToBottom = False
      TransparentBand = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = True
      ParentFont = False
      Size.Values = (
        63.500000000000000000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      FooterBand = CustFooter
      Master = OrderDetail
      ReprintOnNewPage = False
      object QRDBText1: TQRDBText
        Left = 86
        Top = 2
        Width = 105
        Height = 17
        Size.Values = (
          44.979166666666670000
          227.541666666666700000
          5.291666666666667000
          277.812500000000000000)
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
        FontSize = 10
      end
      object QRLabel1: TQRLabel
        Left = 16
        Top = 2
        Width = 65
        Height = 17
        Size.Values = (
          44.979166666666700000
          42.333333333333300000
          5.291666666666670000
          171.979166666667000000)
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
        FontSize = 10
      end
    end
    object OrderDetail: TQRSubDetail
      Left = 38
      Top = 211
      Width = 1047
      Height = 21
      AlignToBottom = False
      BeforePrint = OrderDetailBeforePrint
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
        55.562500000000000000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = QuickReport
      DataSet = qryReport
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText3: TQRDBText
        Left = 88
        Top = 2
        Width = 35
        Height = 15
        Size.Values = (
          39.687500000000000000
          232.833333333333400000
          5.291666666666667000
          92.604166666666680000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'POrder'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRDBText6: TQRDBText
        Left = 245
        Top = 2
        Width = 94
        Height = 15
        Size.Values = (
          39.687500000000000000
          648.229166666667000000
          5.291666666666670000
          248.708333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Cust_order_no'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRDBText8: TQRDBText
        Left = 375
        Top = 2
        Width = 32
        Height = 15
        Size.Values = (
          39.687500000000000000
          992.187500000000000000
          5.291666666666667000
          84.666666666666680000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Qty_In'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrdbQtyOut: TQRDBText
        Left = 573
        Top = 2
        Width = 41
        Height = 15
        Size.Values = (
          39.687500000000000000
          1516.062500000000000000
          5.291666666666667000
          108.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Qty_Out'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRDBText11: TQRDBText
        Left = -8
        Top = 2
        Width = 89
        Height = 15
        Size.Values = (
          39.687500000000000000
          -21.166666666666700000
          5.291666666666670000
          235.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Date_Deliv_Actual'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object lblSellValueIn: TQRLabel
        Left = 418
        Top = 2
        Width = 64
        Height = 15
        Size.Values = (
          39.687500000000000000
          1105.958333333333000000
          5.291666666666667000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblSellValueIn'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrdbDeliveryName: TQRDBText
        Left = 805
        Top = 2
        Width = 233
        Height = 15
        Size.Values = (
          39.687500000000000000
          2129.895833333330000000
          5.291666666666670000
          616.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'DeliveryName'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object lblCostValueIn: TQRLabel
        Left = 485
        Top = 2
        Width = 69
        Height = 15
        Size.Values = (
          39.687500000000000000
          1283.229166666667000000
          5.291666666666667000
          182.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblCostValueIn'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object lblSellValueOut: TQRLabel
        Left = 619
        Top = 2
        Width = 71
        Height = 15
        Size.Values = (
          39.687500000000000000
          1637.770833333333000000
          5.291666666666667000
          187.854166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblSellValueout'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object lblCostValueOut: TQRLabel
        Left = 690
        Top = 2
        Width = 76
        Height = 15
        Size.Values = (
          39.687500000000000000
          1825.625000000000000000
          5.291666666666667000
          201.083333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblCostValueout'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlblType: TQRLabel
        Left = 148
        Top = 2
        Width = 89
        Height = 15
        Size.Values = (
          39.687500000000000000
          391.583333333333000000
          5.291666666666670000
          235.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlblType'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
    end
    object FormRefGroup: TQRGroup
      Left = 38
      Top = 187
      Width = 1047
      Height = 24
      AlignToBottom = False
      BeforePrint = FormRefGroupBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.500000000000000000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      FooterBand = FormRefFooter
      Master = OrderDetail
      ReprintOnNewPage = False
      object QRLabel3: TQRLabel
        Left = 24
        Top = 3
        Width = 107
        Height = 15
        Size.Values = (
          39.687500000000000000
          63.500000000000000000
          7.937500000000000000
          283.104166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Product Reference:'
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
      object qrlblStockReference: TQRLabel
        Left = 144
        Top = 3
        Width = 114
        Height = 15
        Size.Values = (
          39.687500000000000000
          381.000000000000000000
          7.937500000000000000
          301.625000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblStockReference'
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
    object FormRefFooter: TQRBand
      Left = 38
      Top = 232
      Width = 1047
      Height = 32
      AfterPrint = FormRefFooterAfterPrint
      AlignToBottom = False
      BeforePrint = FormRefFooterBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        84.666666666666670000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object qrlblTotalQtyOut: TQRLabel
        Left = 520
        Top = 7
        Width = 93
        Height = 16
        Size.Values = (
          42.333333333333340000
          1375.833333333333000000
          18.520833333333330000
          246.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblTotalQtyOut'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel12: TQRLabel
        Left = 217
        Top = 7
        Width = 95
        Height = 16
        Size.Values = (
          42.333333333333340000
          574.145833333333400000
          18.520833333333330000
          251.354166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total for product'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object lblFormSellTotalIn: TQRLabel
        Left = 380
        Top = 7
        Width = 102
        Height = 16
        Size.Values = (
          42.333333333333340000
          1005.416666666667000000
          18.520833333333330000
          269.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblFormSellTotalIn'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object lblFormCostTotalIn: TQRLabel
        Left = 448
        Top = 7
        Width = 107
        Height = 16
        Size.Values = (
          42.333333333333340000
          1185.333333333333000000
          18.520833333333330000
          283.104166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblFormCostTotalIn'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object lblFormSellTotalOut: TQRLabel
        Left = 577
        Top = 7
        Width = 112
        Height = 16
        Size.Values = (
          42.333333333333340000
          1526.645833333333000000
          18.520833333333330000
          296.333333333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblFormSellTotalOut'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object lblFormCostTotalOut: TQRLabel
        Left = 649
        Top = 7
        Width = 117
        Height = 16
        Size.Values = (
          42.333333333333340000
          1717.145833333333000000
          18.520833333333330000
          309.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblFormCostTotalOut'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRShape8: TQRShape
        Left = 350
        Top = 3
        Width = 416
        Height = 5
        Size.Values = (
          13.229166666666700000
          926.041666666667000000
          7.937500000000000000
          1100.666666666670000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrlblTotalQtyIn: TQRLabel
        Left = 325
        Top = 7
        Width = 83
        Height = 16
        Size.Values = (
          42.333333333333340000
          859.895833333333400000
          18.520833333333330000
          219.604166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblTotalQtyIn'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
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
    object CustFooter: TQRBand
      Left = 38
      Top = 264
      Width = 1047
      Height = 32
      AfterPrint = CustFooterAfterPrint
      AlignToBottom = False
      BeforePrint = CustFooterBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        84.666666666666670000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRLabel14: TQRLabel
        Left = 218
        Top = 8
        Width = 107
        Height = 16
        Size.Values = (
          42.333333333333340000
          576.791666666666800000
          21.166666666666670000
          283.104166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total for Customer'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object lblCustSellTotalIn: TQRLabel
        Left = 385
        Top = 8
        Width = 99
        Height = 16
        Size.Values = (
          42.333333333333340000
          1018.645833333333000000
          21.166666666666670000
          261.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblCustSellTotalIn'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRShape2: TQRShape
        Left = 350
        Top = 0
        Width = 416
        Height = 9
        Size.Values = (
          23.812500000000000000
          926.041666666667000000
          0.000000000000000000
          1100.666666666670000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object lblCustCostTotalIn: TQRLabel
        Left = 467
        Top = 8
        Width = 89
        Height = 16
        Size.Values = (
          42.333333333333340000
          1235.604166666667000000
          21.166666666666670000
          235.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblCustSellTotal'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object lblCustSellTotalOut: TQRLabel
        Left = 599
        Top = 8
        Width = 89
        Height = 16
        Size.Values = (
          42.333333333333340000
          1584.854166666667000000
          21.166666666666670000
          235.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblCustSellTotal'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object lblCustCostTotalOut: TQRLabel
        Left = 677
        Top = 8
        Width = 89
        Height = 16
        Size.Values = (
          42.333333333333340000
          1791.229166666667000000
          21.166666666666670000
          235.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblCustSellTotal'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
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
    object ReportGroup: TQRGroup
      Left = 38
      Top = 155
      Width = 1047
      Height = 8
      AlignToBottom = False
      Enabled = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        21.166666666666670000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      FooterBand = ReportGroupFooter
      Master = QuickReport
      ReprintOnNewPage = False
    end
    object ReportGroupFooter: TQRBand
      Left = 38
      Top = 296
      Width = 1047
      Height = 38
      AlignToBottom = False
      BeforePrint = ReportGroupFooterBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        100.541666666666700000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRLabel5: TQRLabel
        Left = 219
        Top = 8
        Width = 77
        Height = 16
        Size.Values = (
          42.333333333333340000
          579.437500000000000000
          21.166666666666670000
          203.729166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Report Totals'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object lblRepSellIn: TQRLabel
        Left = 384
        Top = 8
        Width = 99
        Height = 16
        Size.Values = (
          42.333333333333340000
          1016.000000000000000000
          21.166666666666670000
          261.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblCustSellTotalIn'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object lblRepCostIn: TQRLabel
        Left = 466
        Top = 8
        Width = 89
        Height = 16
        Size.Values = (
          42.333333333333340000
          1232.958333333333000000
          21.166666666666670000
          235.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblCustSellTotal'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object lblRepSellOut: TQRLabel
        Left = 598
        Top = 8
        Width = 89
        Height = 16
        Size.Values = (
          42.333333333333340000
          1582.208333333333000000
          21.166666666666670000
          235.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblCustSellTotal'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object lblRepCostOut: TQRLabel
        Left = 676
        Top = 8
        Width = 89
        Height = 16
        Size.Values = (
          42.333333333333340000
          1788.583333333333000000
          21.166666666666670000
          235.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblCustSellTotal'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRShape7: TQRShape
        Left = 350
        Top = 0
        Width = 416
        Height = 9
        Size.Values = (
          23.812500000000000000
          926.041666666667000000
          0.000000000000000000
          1100.666666666670000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
  end
  object qryReport: TFDQuery
    OnCalcFields = qryReportCalcFields
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Delivery_Detail.Purchase_Order,'
      '        Delivery_Detail.Line,'
      '        Delivery_Detail.Delivery_no,'
      '        Delivery_Detail.Ad_hoc_Address,'
      '        Delivery_Detail.Supplier,'
      '        Delivery_Detail.Branch_no,'
      '        Delivery_Detail.Rep,'
      '        Delivery_Detail.Qty_to_Deliver,'
      '        Delivery_Detail.Qty_Delivered,'
      '        Delivery_Detail.Qty_Invoiced,'
      '        Delivery_Detail.Date_Point,'
      '        Delivery_Detail.Branch_No0,'
      '        Delivery_Detail.Customer,'
      '        Delivery_Detail.Deliver_via_Company,'
      '        Delivery_Detail.Date_Deliv_Actual,'
      '        Delivery_Detail.Delivery_to_Stock,'
      '        Delivery_Detail.Delivery_note_printed,'
      '        Purchase_OrderLine.Customer AS Order_Customer,'
      '        Purchase_OrderLine.Branch_no AS Customer_Branch,'
      '        Purchase_OrderLine.Cust_Order_No,'
      '        Purchase_OrderLine.Purch_Ord_Line_Status,'
      '        Purchase_Order.Supplier,'
      '        Purchase_Order.Branch_No AS Supplier_Branch,'
      '        Supplier.Name AS Supplier_Name,'
      '        Customer.Name AS Customer_Name,'
      '        Purch_Ord_Line_Status.Description AS Order_Status,'
      '        Purchase_OrderLine.Customers_Desc,'
      '        Form_Reference.Form_Reference_ID,'
      '        Form_Reference.Stock_Reference,'
      '        Form_Reference.Form_Reference_Descr,'
      '        Purchase_OrderLine.Selling_Price,'
      '        Purchase_OrderLine.Sell_Unit,'
      '        Price_Unit.Description as Sell_Unit_Descr,'
      '        Price_Unit.Price_Unit_Factor,'
      '        Purchase_OrderLine.Order_Price'
      'FROM Price_Unit'
      '  INNER JOIN (Customer_Branch'
      '  INNER JOIN (Supplier'
      '  INNER JOIN ((Purch_Ord_Line_Status'
      '  INNER JOIN (Form_Reference'
      '  RIGHT JOIN (Customer'
      '  INNER JOIN Purchase_OrderLine ON'
      '    Customer.Customer = Purchase_OrderLine.Customer) ON'
      
        '    Form_Reference.Form_Reference = Purchase_OrderLine.Form_Refe' +
        'rence) ON'
      
        '    Purch_Ord_Line_Status.Purch_Ord_Line_Status = Purchase_Order' +
        'Line.Purch_Ord_Line_Status)'
      '  INNER JOIN (Supplier_Branch'
      '  INNER JOIN (Purchase_Order'
      '  INNER JOIN Delivery_Detail ON'
      
        '    Purchase_Order.Purchase_Order = Delivery_Detail.Purchase_Ord' +
        'er) ON'
      '    (Supplier_Branch.Supplier = Purchase_Order.Supplier) AND'
      '    (Supplier_Branch.Branch_no = Purchase_Order.Branch_No)) ON'
      
        '    (Purchase_Order.Purchase_Order = Purchase_OrderLine.Purchase' +
        '_Order) AND'
      '    (Purchase_OrderLine.Line = Delivery_Detail.Line) AND'
      
        '    (Purchase_OrderLine.Purchase_Order = Delivery_Detail.Purchas' +
        'e_Order)) ON'
      '    Supplier.Supplier = Purchase_Order.Supplier) ON'
      
        '    (Customer_Branch.Branch_no = Purchase_OrderLine.Branch_no) A' +
        'ND'
      '    (Customer_Branch.Customer = Purchase_OrderLine.Customer)) ON'
      '    Price_Unit.Price_Unit = Purchase_OrderLine.Sell_Unit'
      'WHERE'
      '('
      '((Delivery_Detail.Delivery_to_Stock)='#39'Y'#39')) OR'
      
        '(((round([Purchase_OrderLine].[Purchase_Order],0))=[Purchase_Ord' +
        'erLine].[Original_Order])'
      ')')
    Left = 32
    Top = 64
    object qryReportPurchase_Order: TFloatField
      FieldName = 'Purchase_Order'
    end
    object qryReportLine: TIntegerField
      FieldName = 'Line'
    end
    object qryReportDelivery_no: TIntegerField
      FieldName = 'Delivery_no'
    end
    object qryReportAd_hoc_Address: TIntegerField
      FieldName = 'Ad_hoc_Address'
    end
    object qryReportSupplier: TIntegerField
      FieldName = 'Supplier'
    end
    object qryReportBranch_no: TIntegerField
      FieldName = 'Branch_no'
    end
    object qryReportRep: TIntegerField
      FieldName = 'Rep'
    end
    object qryReportQty_to_Deliver: TFloatField
      FieldName = 'Qty_to_Deliver'
    end
    object qryReportQty_Delivered: TFloatField
      FieldName = 'Qty_Delivered'
    end
    object qryReportQty_Invoiced: TFloatField
      FieldName = 'Qty_Invoiced'
    end
    object qryReportDate_Point: TDateTimeField
      FieldName = 'Date_Point'
    end
    object qryReportBranch_No0: TIntegerField
      FieldName = 'Branch_No0'
    end
    object qryReportCustomer: TIntegerField
      FieldName = 'Customer'
    end
    object qryReportDeliver_via_Company: TStringField
      FieldName = 'Deliver_via_Company'
      Size = 1
    end
    object qryReportDate_Deliv_Actual: TDateTimeField
      FieldName = 'Date_Deliv_Actual'
    end
    object qryReportDelivery_to_Stock: TStringField
      FieldName = 'Delivery_to_Stock'
      Size = 1
    end
    object qryReportDelivery_note_printed: TStringField
      FieldName = 'Delivery_note_printed'
      Size = 1
    end
    object qryReportOrder_Customer: TIntegerField
      FieldName = 'Order_Customer'
    end
    object qryReportCustomer_Branch: TIntegerField
      FieldName = 'Customer_Branch'
    end
    object qryReportCust_order_no: TStringField
      FieldName = 'Cust_order_no'
      Size = 40
    end
    object qryReportPurch_Ord_Line_Status: TIntegerField
      FieldName = 'Purch_Ord_Line_Status'
    end
    object qryReportSupplier_1: TIntegerField
      FieldName = 'Supplier_1'
    end
    object qryReportSupplier_Branch: TIntegerField
      FieldName = 'Supplier_Branch'
    end
    object qryReportSupplier_Name: TStringField
      FieldName = 'Supplier_Name'
      Size = 40
    end
    object qryReportCustomer_Name: TWideStringField
      FieldName = 'Customer_Name'
      Size = 40
    end
    object qryReportOrder_Status: TStringField
      FieldName = 'Order_Status'
      Size = 40
    end
    object qryReportQty_In: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Qty_In'
      OnGetText = qryReportQty_InGetText
      Calculated = True
    end
    object qryReportQty_Out: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Qty_Out'
      OnGetText = qryReportQty_OutGetText
      Calculated = True
    end
    object qryReportDeliveryName: TStringField
      FieldKind = fkCalculated
      FieldName = 'DeliveryName'
      Size = 50
      Calculated = True
    end
    object qryReportCustomers_Desc: TStringField
      FieldName = 'Customers_Desc'
      Size = 80
    end
    object qryReportForm_Reference_ID: TStringField
      FieldName = 'Form_Reference_ID'
      Size = 50
    end
    object qryReportPOrder: TStringField
      FieldKind = fkCalculated
      FieldName = 'POrder'
      OnGetText = qryReportPOrderGetText
      Calculated = True
    end
    object qryReportSelling_Price: TCurrencyField
      FieldName = 'Selling_Price'
    end
    object qryReportSell_Unit: TIntegerField
      FieldName = 'Sell_Unit'
    end
    object qryReportSell_Unit_Descr: TStringField
      FieldName = 'Sell_Unit_Descr'
      FixedChar = True
      Size = 80
    end
    object qryReportPrice_Unit_Factor: TFloatField
      FieldName = 'Price_Unit_Factor'
    end
    object qryReportOrder_Price: TCurrencyField
      FieldName = 'Order_Price'
    end
    object qryReportStock_Reference: TStringField
      FieldName = 'Stock_Reference'
      FixedChar = True
      Size = 30
    end
    object qryReportForm_Reference_Descr: TStringField
      FieldName = 'Form_Reference_Descr'
      FixedChar = True
      Size = 100
    end
  end
  object AdhocSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Name,'
      #9#9#9'Building_no_name,'
      '        Street,'
      '        Locale,'
      '        Town,'
      '        Postcode'
      'from Ad_hoc_Address'
      'where Ad_hoc_Address = :Ad_hoc_Address')
    Left = 41
    Top = 336
    ParamData = <
      item
        Name = 'Ad_hoc_Address'
      end>
  end
  object RepSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Name,'
      #9#9#9'Building_no_name,'
      '        Street,'
      '        Locale,'
      '        Town,'
      '        Postcode'
      'from Rep'
      'where Rep = :Rep')
    Left = 114
    Top = 336
    ParamData = <
      item
        Name = 'Rep'
      end>
  end
  object SupplierSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select '#9'Supplier.Name as Supplier_Name,'
      #9#9#9'Building_no_name,'
      '        Street,'
      '        Locale,'
      '        Town,'
      '        Postcode'
      'from Supplier_Branch, Supplier'
      'where Supplier_Branch.Supplier = :Supplier and'
      #9#9#9'Supplier_Branch.Branch_no = :Branch_no and'
      '        Supplier_Branch.Supplier = Supplier.Supplier'
      ' ')
    Left = 187
    Top = 336
    ParamData = <
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_no'
      end>
  end
  object CompSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Company.Name as Company_Name,'
      #9#9#9'Building_no_name,'
      '        Street,'
      '        Locale,'
      '        Town,'
      '        Postcode'
      'from Company'
      'where Company = 1')
    Left = 261
    Top = 336
  end
  object CustomerSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Customer.Name as Customer_Name,'
      #9#9#9'Building_no_name,'
      '        Street,'
      '        Locale,'
      '        Town,'
      '        Postcode,'
      '        Customer_Branch.Name as Branch_Name'
      'from Customer_Branch, Customer'
      'where ((Customer_Branch.Customer = :Customer) and'
      #9#9#9'(Branch_no = :Branch_no)) and'
      '        Customer_Branch.Customer = Customer.Customer')
    Left = 334
    Top = 336
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end>
  end
end
