object frmwtRPSOFitDateMovement: TfrmwtRPSOFitDateMovement
  Left = 49
  Top = 110
  Caption = 'Fitting Date Movement Report'
  ClientHeight = 576
  ClientWidth = 1159
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
    PrinterSettings.Collate = 0
    PrinterSettings.ColorOption = 2
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
        Left = 413
        Top = 3
        Width = 209
        Height = 19
        Size.Values = (
          50.270833333333330000
          1092.729166666667000000
          7.937500000000000000
          552.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Fitting Date Movement Report'
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
      object QRLabel3: TQRLabel
        Left = 0
        Top = 73
        Width = 59
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          193.145833333333300000
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
        Left = 64
        Top = 73
        Width = 23
        Height = 15
        Size.Values = (
          39.687500000000000000
          169.333333333333300000
          193.145833333333300000
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
        Left = 128
        Top = 73
        Width = 47
        Height = 15
        Size.Values = (
          39.687500000000000000
          338.666666666666700000
          193.145833333333300000
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
      object QRLabel6: TQRLabel
        Left = 304
        Top = 73
        Width = 52
        Height = 15
        Size.Values = (
          39.687500000000000000
          804.333333333333300000
          193.145833333333300000
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
      object QRLabel7: TQRLabel
        Left = 414
        Top = 73
        Width = 45
        Height = 15
        Size.Values = (
          39.687500000000000000
          1095.375000000000000000
          193.145833333333300000
          119.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Order No'
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
        Left = 521
        Top = 73
        Width = 62
        Height = 15
        Size.Values = (
          39.687500000000000000
          1378.479166666667000000
          193.145833333333300000
          164.041666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Original Date'
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
        Top = 73
        Width = 102
        Height = 15
        Size.Values = (
          39.687500000000000000
          2476.500000000000000000
          193.145833333333300000
          269.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Movement Date/Type'
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
        Left = 704
        Top = 73
        Width = 33
        Height = 15
        Size.Values = (
          39.687500000000000000
          1862.666666666667000000
          193.145833333333300000
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
      object QRLabel12: TQRLabel
        Left = 877
        Top = 73
        Width = 53
        Height = 15
        Size.Values = (
          39.687500000000000000
          2320.395833333333000000
          193.145833333333300000
          140.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total to Inv'
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
      object QRLabel14: TQRLabel
        Left = 770
        Top = 73
        Width = 23
        Height = 15
        Size.Values = (
          39.687500000000000000
          2037.291666666667000000
          193.145833333333300000
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
      object qrlblDateRange: TQRLabel
        Left = 475
        Top = 24
        Width = 74
        Height = 17
        Size.Values = (
          44.979166666666670000
          1256.770833333333000000
          63.500000000000000000
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
      object QRLabel2: TQRLabel
        Left = 601
        Top = 73
        Width = 49
        Height = 15
        Size.Values = (
          39.687500000000000000
          1590.145833333333000000
          193.145833333333300000
          129.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'New Date'
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
      object QRLabel9: TQRLabel
        Left = 806
        Top = 73
        Width = 60
        Height = 15
        Size.Values = (
          39.687500000000000000
          2132.541666666667000000
          193.145833333333300000
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
      object qrlblSelection: TQRLabel
        Left = 479
        Top = 45
        Width = 65
        Height = 15
        Size.Values = (
          39.687500000000000000
          1267.354166666667000000
          119.062500000000000000
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
    object qrsbDetails: TQRSubDetail
      Left = 38
      Top = 160
      Width = 1047
      Height = 19
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
        50.270833333333330000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpDetails
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText12: TQRDBText
        Tag = 1
        Left = 786
        Top = 0
        Width = 80
        Height = 15
        Size.Values = (
          39.687500000000000000
          2079.625000000000000000
          0.000000000000000000
          211.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySalesOrders
        DataField = 'Deposit_Amount'
        Mask = '#,##0.00'
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
        Left = 662
        Top = 0
        Width = 75
        Height = 15
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
        Mask = '#,##0.00'
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
        Left = -5
        Top = 1
        Width = 59
        Height = 15
        Size.Values = (
          39.687500000000000000
          -13.229166666666670000
          2.645833333333333000
          156.104166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySalesOrders
        DataField = 'sales_order'
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
        Alignment = taLeftJustify
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
        Left = 304
        Top = 1
        Width = 105
        Height = 15
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
        Left = 128
        Top = 1
        Width = 169
        Height = 15
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
        Left = 415
        Top = 0
        Width = 95
        Height = 15
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
        Left = 742
        Top = 0
        Width = 52
        Height = 15
        Size.Values = (
          39.687500000000000000
          1963.208333333333000000
          0.000000000000000000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySalesOrders
        DataField = 'Vat_Value'
        Mask = '#,##0.00'
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
        Left = 872
        Top = 0
        Width = 58
        Height = 15
        Size.Values = (
          39.687500000000000000
          2307.166666666667000000
          0.000000000000000000
          153.458333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySalesOrders
        DataField = 'Total_Value'
        Mask = '#,##0.00'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlblOriginalDate: TQRLabel
        Tag = 1
        Left = 521
        Top = 0
        Width = 79
        Height = 15
        Size.Values = (
          39.687500000000000000
          1378.479166666667000000
          0.000000000000000000
          209.020833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblOriginalDate'
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
      object qrlblNewDate: TQRLabel
        Tag = 1
        Left = 601
        Top = 0
        Width = 66
        Height = 15
        Size.Values = (
          39.687500000000000000
          1590.145833333333000000
          0.000000000000000000
          174.625000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblNewDate'
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
      object qrlblMovementDate: TQRLabel
        Tag = 1
        Left = 937
        Top = 0
        Width = 92
        Height = 15
        Size.Values = (
          39.687500000000000000
          2479.145833333333000000
          0.000000000000000000
          243.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblMovementDate'
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
      object gtqrStatus: TQRLabel
        Tag = 1
        Left = 993
        Top = 0
        Width = 51
        Height = 15
        Size.Values = (
          39.687500000000000000
          2627.312500000000000000
          0.000000000000000000
          134.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'gtqrStatus'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
    end
    object QRBand2: TQRBand
      Left = 38
      Top = 217
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
      object qrlblReportTotal: TQRLabel
        Left = 841
        Top = 9
        Width = 90
        Height = 15
        Size.Values = (
          39.687500000000000000
          2225.145833333333000000
          23.812500000000000000
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
      object qrlblDeposit: TQRLabel
        Left = 772
        Top = 9
        Width = 95
        Height = 15
        Size.Values = (
          39.687500000000000000
          2042.583333333333000000
          23.812500000000000000
          251.354166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblDepositTotal'
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
      object qrlblVATTotal: TQRLabel
        Left = 704
        Top = 9
        Width = 90
        Height = 15
        Size.Values = (
          39.687500000000000000
          1862.666666666667000000
          23.812500000000000000
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
      object QRLabel10: TQRLabel
        Left = 570
        Top = 9
        Width = 68
        Height = 15
        Size.Values = (
          39.687500000000000000
          1508.125000000000000000
          23.812500000000000000
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
      object QRShape2: TQRShape
        Left = 656
        Top = -1
        Width = 281
        Height = 8
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
        Left = 649
        Top = 9
        Width = 89
        Height = 15
        Size.Values = (
          39.687500000000000000
          1717.145833333333000000
          23.812500000000000000
          235.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblGoodsTotal'
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
        Left = 72
        Top = 8
        Width = 80
        Height = 17
        Size.Values = (
          44.979166666666670000
          190.500000000000000000
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
    end
    object qrbGroupFooter: TQRBand
      Left = 38
      Top = 179
      Width = 1047
      Height = 38
      AfterPrint = qrbGroupFooterAfterPrint
      AlignToBottom = False
      BeforePrint = qrbGroupFooterBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        100.541666666666700000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object qrlblCustDeposit: TQRLabel
        Left = 772
        Top = 10
        Width = 95
        Height = 15
        Size.Values = (
          39.687500000000000000
          2042.583333333333000000
          26.458333333333330000
          251.354166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblDepositTotal'
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
      object qrlblCustTotal: TQRLabel
        Left = 852
        Top = 10
        Width = 79
        Height = 15
        Size.Values = (
          39.687500000000000000
          2254.250000000000000000
          26.458333333333330000
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
      object QRShape1: TQRShape
        Left = 656
        Top = -1
        Width = 281
        Height = 8
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
        Left = 495
        Top = 10
        Width = 108
        Height = 15
        Size.Values = (
          39.687500000000000000
          1309.687500000000000000
          26.458333333333330000
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
      object gtQRLabel1: TQRLabel
        Left = 610
        Top = 10
        Width = 28
        Height = 15
        Size.Values = (
          39.687500000000000000
          1613.958333333333000000
          26.458333333333330000
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
        Left = 649
        Top = 10
        Width = 88
        Height = 15
        Size.Values = (
          39.687500000000000000
          1717.145833333333000000
          26.458333333333330000
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
      object qrlblCustVAT: TQRLabel
        Left = 718
        Top = 10
        Width = 75
        Height = 15
        Size.Values = (
          39.687500000000000000
          1899.708333333333000000
          26.458333333333330000
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
    end
  end
  object qrySalesOrdersOld: TFDQuery
    ConnectionName = 'Wt'
    SQL.Strings = (
      'SELECT DISTINCT'
      #9#9'Sales_Order_Date_Log.Sales_Order, '
      #9#9'(SELECT (Sales_Order.Date_Raised) '
      #9#9' FROM Sales_Order'
      
        #9#9' WHERE Sales_Order.Sales_Order = Sales_Order_Date_Log.Sales_Or' +
        'der) as Date_Raised,'
      #9#9'(SELECT (Sales_Order.Date_Required) '
      #9#9' FROM Sales_Order'
      
        #9#9' WHERE Sales_Order.Sales_Order = Sales_Order_Date_Log.Sales_Or' +
        'der) as Date_Required,'
      #9#9'(SELECT (Sales_Order.Reference) '
      #9#9' FROM Sales_Order'
      
        #9#9' WHERE Sales_Order.Sales_Order = Sales_Order_Date_Log.Sales_Or' +
        'der) as Reference,'
      #9#9'(SELECT (Sales_Order.Order_ref_no) '
      #9#9' FROM Sales_Order'
      
        #9#9' WHERE Sales_Order.Sales_Order = Sales_Order_Date_Log.Sales_Or' +
        'der) as Order_ref_no,'
      #9#9'(SELECT (Sales_Order.Sales_Order_Status)'
      #9#9' FROM Sales_Order'
      
        #9#9' WHERE Sales_Order.Sales_Order = Sales_Order_Date_Log.Sales_Or' +
        'der) as Sales_Order_Status,'
      #9#9'(SELECT (Sales_Order.On_Hold)'
      #9#9' FROM Sales_Order'
      
        #9#9' WHERE Sales_Order.Sales_Order = Sales_Order_Date_Log.Sales_Or' +
        'der) as On_Hold,'
      #9#9'(SELECT (Sales_Order_Status.Sales_Order_Status_Desc)'
      #9#9' FROM Sales_Order, Sales_Order_Status'
      
        #9#9' WHERE Sales_Order.Sales_Order = Sales_Order_Date_Log.Sales_Or' +
        'der AND'
      
        #9#9#9#9'Sales_Order.sales_order_Status = Sales_Order_Status.sales_or' +
        'der_Status) as Sales_Order_Status_Desc,'
      #9#9'SODL.New_Date,'
      #9#9'(SELECT (Sales_Order.Customer_Name)'
      #9#9' FROM Sales_Order'
      
        #9#9' WHERE Sales_Order.Sales_Order = Sales_Order_Date_Log.Sales_Or' +
        'der) as Customer_Name,'
      #9#9'(SELECT (Sales_Order.Deposit_amount * -1.00000) '
      #9#9' FROM Sales_Order'
      
        #9#9' WHERE Sales_Order.Sales_Order = Sales_Order_Date_Log.Sales_Or' +
        'der) as Deposit_Amount,'
      #9#9'(SELECT (Sales_Order.Goods_Value * -1.0000) '
      #9#9' FROM Sales_Order'
      
        #9#9' WHERE Sales_Order.Sales_Order = Sales_Order_Date_Log.Sales_Or' +
        'der) as Goods_Value,'
      #9#9'(SELECT (Sales_Order.VAT_Value * -1.0000) '
      #9#9' FROM Sales_Order'
      
        #9#9' WHERE Sales_Order.Sales_Order = Sales_Order_Date_Log.Sales_Or' +
        'der) as Vat_Value,'
      
        #9#9'(SELECT ((Sales_Order.Goods_Value + Sales_Order.Vat_Value - Sa' +
        'les_order.Deposit_amount) * -1.0000) '
      #9#9' FROM Sales_Order'
      
        #9#9' WHERE Sales_Order.Sales_Order = Sales_Order_Date_Log.Sales_Or' +
        'der) as Total_Value,'
      #9#9'(SELECT (Sales_Order.IsFittingInOutlook) '
      #9#9' FROM Sales_Order'
      
        #9#9' WHERE Sales_Order.Sales_Order = Sales_Order_Date_Log.Sales_Or' +
        'der) as IsFittingInOutlook,'
      #9#9'(SELECT (Sales_Order.Rep) '
      #9#9' FROM Sales_Order'
      
        #9#9' WHERE Sales_Order.Sales_Order = Sales_Order_Date_Log.Sales_Or' +
        'der) as Rep,'
      #9#9'(SELECT (Rep.Rep_Name) '
      #9#9' FROM Sales_Order, Rep'
      
        #9#9' WHERE Sales_Order.Sales_Order = Sales_Order_Date_Log.Sales_Or' +
        'der AND'
      #9#9#9#9'Sales_Order.Rep = Rep.Rep) as Rep_Name,'
      #9#9#39'OUT'#39' as Movement_Type'
      'FROM (Sales_Order_Date_Log '
      #9#9'INNER JOIN Sales_Order_Date_Log AS SODL '
      
        #9#9#9'ON (Sales_Order_Date_Log.Change_Date = SODL.Change_Date) AND ' +
        '(Sales_Order_Date_Log.Sales_Order = SODL.Sales_Order))'
      
        'WHERE ((Sales_Order_Date_Log.Change_Date >= :Date_Move_From) and' +
        ' (Sales_Order_Date_Log.Change_Date <= :Date_Move_To)) AND'
      
        '      ((Sales_Order_Date_Log.New_Date >= :Date_From) and (Sales_' +
        'Order_Date_Log.New_Date <= :Date_To)) AND'
      
        '      ((SODL.New_Date < :Date_From) OR (SODL.New_Date > :Date_To' +
        ')) AND'
      #9#9'(Sales_Order_Date_Log.New_Date <> SODL.New_Date) AND'
      
        #9#9'(Sales_Order_Date_Log.Change_Function ='#39'O'#39') AND (SODL.Change_F' +
        'unction ='#39'N'#39')'#9'AND'
      '    (((SELECT Sales_Order.IsFittingInOutlook'
      #9#9' FROM Sales_Order'
      
        #9#9' WHERE Sales_Order.Sales_Order = Sales_Order_Date_Log.Sales_Or' +
        'der) = :IsFittingInOutlook) OR'
      '    ((SELECT Sales_Order.IsFittingInOutlook'
      #9#9' FROM Sales_Order'
      
        #9#9' WHERE Sales_Order.Sales_Order = Sales_Order_Date_Log.Sales_Or' +
        'der) = '#39'Y'#39') OR'
      '    ((SELECT Sales_Order.IsFittingInOutlook'
      #9#9' FROM Sales_Order'
      
        #9#9' WHERE Sales_Order.Sales_Order = Sales_Order_Date_Log.Sales_Or' +
        'der) IS NULL)) AND'
      '     ((SELECT Sales_Order.Sales_Order_Status'
      #9#9' FROM Sales_Order'
      
        #9#9' WHERE Sales_Order.Sales_Order = Sales_Order_Date_Log.Sales_Or' +
        'der) < :Sales_Order_Status)'
      'UNION'
      'SELECT DISTINCT'
      #9#9'Sales_Order_Date_Log.Sales_Order, '
      #9#9'(SELECT (Sales_Order.Date_Raised) '
      #9#9' FROM Sales_Order'
      
        #9#9' WHERE Sales_Order.Sales_Order = Sales_Order_Date_Log.Sales_Or' +
        'der) as Date_Raised,'
      #9#9'(SELECT (Sales_Order.Date_Required) '
      #9#9' FROM Sales_Order'
      
        #9#9' WHERE Sales_Order.Sales_Order = Sales_Order_Date_Log.Sales_Or' +
        'der) as Date_Required,'
      #9#9'(SELECT (Sales_Order.Reference) '
      #9#9' FROM Sales_Order'
      
        #9#9' WHERE Sales_Order.Sales_Order = Sales_Order_Date_Log.Sales_Or' +
        'der) as Reference,'
      #9#9'(SELECT (Sales_Order.Order_ref_no) '
      #9#9' FROM Sales_Order'
      
        #9#9' WHERE Sales_Order.Sales_Order = Sales_Order_Date_Log.Sales_Or' +
        'der) as Order_ref_no,'
      #9#9'(SELECT (Sales_Order.Sales_Order_Status)'
      #9#9' FROM Sales_Order'
      
        #9#9' WHERE Sales_Order.Sales_Order = Sales_Order_Date_Log.Sales_Or' +
        'der) as Sales_Order_Status,'
      #9#9'(SELECT (Sales_Order.On_Hold)'
      #9#9' FROM Sales_Order'
      
        #9#9' WHERE Sales_Order.Sales_Order = Sales_Order_Date_Log.Sales_Or' +
        'der) as On_Hold,'
      #9#9'(SELECT (Sales_Order_Status.Sales_Order_Status_Desc)'
      #9#9' FROM Sales_Order, Sales_Order_Status'
      
        #9#9' WHERE Sales_Order.Sales_Order = Sales_Order_Date_Log.Sales_Or' +
        'der AND'
      
        #9#9#9#9'Sales_Order.sales_order_Status = Sales_Order_Status.sales_or' +
        'der_Status) as Sales_Order_Status_Desc,'
      #9#9'SODL.New_Date,'
      #9#9'(SELECT (Sales_Order.Customer_Name)'
      #9#9' FROM Sales_Order'
      
        #9#9' WHERE Sales_Order.Sales_Order = Sales_Order_Date_Log.Sales_Or' +
        'der) as Customer_Name,'
      #9#9'(SELECT (Sales_Order.Deposit_amount * 1.00000) '
      #9#9' FROM Sales_Order'
      
        #9#9' WHERE Sales_Order.Sales_Order = Sales_Order_Date_Log.Sales_Or' +
        'der) as Deposit_Amount,'
      #9#9'(SELECT (Sales_Order.Goods_Value * 1.0000) '
      #9#9' FROM Sales_Order'
      
        #9#9' WHERE Sales_Order.Sales_Order = Sales_Order_Date_Log.Sales_Or' +
        'der) as Goods_Value,'
      #9#9'(SELECT (Sales_Order.VAT_Value * 1.0000) '
      #9#9' FROM Sales_Order'
      
        #9#9' WHERE Sales_Order.Sales_Order = Sales_Order_Date_Log.Sales_Or' +
        'der) as Vat_Value,'
      
        #9#9'(SELECT ((Sales_Order.Goods_Value + Sales_Order.Vat_Value - Sa' +
        'les_order.Deposit_amount) * 1.0000) '
      #9#9' FROM Sales_Order'
      
        #9#9' WHERE Sales_Order.Sales_Order = Sales_Order_Date_Log.Sales_Or' +
        'der) as Total_Value,'
      #9#9'(SELECT (Sales_Order.IsFittingInOutlook) '
      #9#9' FROM Sales_Order'
      
        #9#9' WHERE Sales_Order.Sales_Order = Sales_Order_Date_Log.Sales_Or' +
        'der) as IsFittingInOutlook,'
      #9#9'(SELECT (Sales_Order.Rep) '
      #9#9' FROM Sales_Order'
      
        #9#9' WHERE Sales_Order.Sales_Order = Sales_Order_Date_Log.Sales_Or' +
        'der) as Rep,'
      #9#9'(SELECT (Rep.Rep_Name) '
      #9#9' FROM Sales_Order, Rep'
      
        #9#9' WHERE Sales_Order.Sales_Order = Sales_Order_Date_Log.Sales_Or' +
        'der AND'
      #9#9#9#9'Sales_Order.Rep = Rep.Rep) as Rep_Name,'
      #9#9#39'IN'#39' as Movement_Type'
      'FROM (Sales_Order_Date_Log '
      #9#9'INNER JOIN Sales_Order_Date_Log AS SODL '
      
        #9#9#9'ON (Sales_Order_Date_Log.Change_Date = SODL.Change_Date) AND ' +
        '(Sales_Order_Date_Log.Sales_Order = SODL.Sales_Order))'
      
        'WHERE '#9'      ((Sales_Order_Date_Log.Change_Date >= :Date_Move_Fr' +
        'om) and (Sales_Order_Date_Log.Change_Date <= :Date_Move_To)) AND'
      
        '      ((SODL.New_Date >= :Date_From) and (SODL.New_Date <= :Date' +
        '_To)) AND'
      
        '      ((Sales_Order_Date_Log.New_Date < :Date_From) OR (Sales_Or' +
        'der_Date_Log.New_Date > :Date_To)) AND'
      #9#9'  (Sales_Order_Date_Log.New_Date <> SODL.New_Date) AND'
      
        #9'    (Sales_Order_Date_Log.Change_Function ='#39'O'#39') AND (SODL.Chang' +
        'e_Function ='#39'N'#39')'#9'AND'
      '    (((SELECT Sales_Order.IsFittingInOutlook'
      #9#9' FROM Sales_Order'
      
        #9#9' WHERE Sales_Order.Sales_Order = Sales_Order_Date_Log.Sales_Or' +
        'der) = :IsFittingInOutlook) OR'
      '    ((SELECT Sales_Order.IsFittingInOutlook'
      #9#9' FROM Sales_Order'
      
        #9#9' WHERE Sales_Order.Sales_Order = Sales_Order_Date_Log.Sales_Or' +
        'der) = '#39'Y'#39') OR'
      '    ((SELECT Sales_Order.IsFittingInOutlook'
      #9#9' FROM Sales_Order'
      
        #9#9' WHERE Sales_Order.Sales_Order = Sales_Order_Date_Log.Sales_Or' +
        'der) IS NULL)) AND'
      '     ((SELECT Sales_Order.Sales_Order_Status'
      #9#9' FROM Sales_Order'
      
        #9#9' WHERE Sales_Order.Sales_Order = Sales_Order_Date_Log.Sales_Or' +
        'der) < :Sales_Order_Status)'
      '')
    Left = 400
    Top = 184
    ParamData = <
      item
        Name = 'Date_Move_From'
      end
      item
        Name = 'Date_Move_To'
      end
      item
        Name = 'Date_From'
      end
      item
        Name = 'Date_To'
      end
      item
        Name = 'Date_From'
      end
      item
        Name = 'Date_To'
      end
      item
        Name = 'IsFittingInOutlook'
      end
      item
        Name = 'Sales_Order_Status'
      end
      item
        Name = 'Date_Move_From'
      end
      item
        Name = 'Date_Move_To'
      end
      item
        Name = 'Date_From'
      end
      item
        Name = 'Date_To'
      end
      item
        Name = 'Date_From'
      end
      item
        Name = 'Date_To'
      end
      item
        Name = 'IsFittingInOutlook'
      end
      item
        Name = 'Sales_Order_Status'
      end>
  end
  object qryGetMovedOutDates: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT TOP 1'
      '        Sales_Order_Date_Log.Change_Date,'
      '        Sales_Order_Date_Log.New_Date AS Original_Date,'
      #9#9#9#9'SODL.New_Date AS New_Date'
      'FROM Sales_Order_Date_Log AS SODL '
      #9#9#9'INNER JOIN Sales_Order_Date_Log '
      
        #9#9#9#9'ON (SODL.Change_Date = Sales_Order_Date_Log.Change_Date) AND' +
        ' (SODL.Sales_Order = Sales_Order_Date_Log.Sales_Order)'
      'WHERE '
      #9'(Sales_Order_Date_Log.Sales_Order = :Sales_Order) AND'
      #9'(Sales_Order_Date_Log.Change_Function = '#39'O'#39') AND'
      #9'(SODL.Change_Function = '#39'N'#39') AND'
      
        '  ((Sales_Order_Date_Log.Change_Date >= :Date_Move_From) and (Sa' +
        'les_Order_Date_Log.Change_Date <= :Date_Move_To)) AND'
      #9'(Sales_Order_Date_Log.New_Date <> SODL.New_Date) AND'
      
        '  ((Sales_Order_Date_Log.New_Date >= :Date_From) and (Sales_Orde' +
        'r_Date_Log.New_Date <= :Date_To)) AND'
      '  ((SODL.New_Date < :Date_From) OR (SODL.New_Date > :Date_To))'
      'ORDER BY Sales_Order_Date_Log.Change_Date desc')
    Left = 208
    Top = 272
    ParamData = <
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Date_Move_From'
      end
      item
        Name = 'Date_Move_To'
      end
      item
        Name = 'Date_From'
      end
      item
        Name = 'Date_To'
      end
      item
        Name = 'Date_From'
      end
      item
        Name = 'Date_To'
      end>
  end
  object qryGetMovedInDates: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT TOP 1'
      '        Sales_Order_Date_Log.Change_Date,'
      '        Sales_Order_Date_Log.New_Date AS Original_Date, '
      #9#9#9#9'SODL.New_Date AS New_Date'
      'FROM Sales_Order_Date_Log AS SODL '
      #9#9#9'INNER JOIN Sales_Order_Date_Log '
      
        #9#9#9#9'ON (SODL.Change_Date = Sales_Order_Date_Log.Change_Date) AND' +
        ' (SODL.Sales_Order = Sales_Order_Date_Log.Sales_Order)'
      'WHERE '
      #9'(Sales_Order_Date_Log.Sales_Order = :Sales_Order) AND'
      #9'(Sales_Order_Date_Log.Change_Function = '#39'O'#39') AND'
      #9'(SODL.Change_Function = '#39'N'#39') AND'
      
        '  ((Sales_Order_Date_Log.Change_Date >= :Date_Move_From) and (Sa' +
        'les_Order_Date_Log.Change_Date <= :Date_Move_To)) AND'
      #9'(Sales_Order_Date_Log.New_Date <> SODL.New_Date) AND'
      
        '  ((SODL.New_Date >= :Date_From) and (SODL.New_Date <= :Date_To)' +
        ') AND'
      
        '  ((Sales_Order_Date_Log.New_Date < :Date_From) OR (Sales_Order_' +
        'Date_Log.New_Date > :Date_To))'
      'ORDER BY Sales_Order_Date_Log.Change_Date desc')
    Left = 208
    Top = 336
    ParamData = <
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Date_Move_From'
      end
      item
        Name = 'Date_Move_To'
      end
      item
        Name = 'Date_From'
      end
      item
        Name = 'Date_To'
      end
      item
        Name = 'Date_From'
      end
      item
        Name = 'Date_To'
      end>
  end
  object qrySalesOrderOlder: TFDQuery
    ConnectionName = 'Wt'
    SQL.Strings = (
      'SELECT'#9'DISTINCT'
      '        Sales_Order.Sales_Order,'
      '        Sales_Order.Date_Raised,'
      '        Sales_Order.Date_Required,'
      '        Sales_Order.Reference,'
      '        Sales_Order.Order_ref_no,'
      '        Sales_Order.Sales_Order_Status,'
      '        Sales_Order.On_Hold,'
      '        Sales_Order_Status.Sales_Order_Status_Desc,'
      
        '        (Sales_Order.Deposit_amount * -1.00000) as Deposit_Amoun' +
        't ,'
      '        (Sales_Order.Goods_Value * -1.0000) as Goods_Value,'
      '        (Sales_Order.VAT_Value * -1.0000) as VAT_Value,'
      '        Sales_Order.IsFittingInOutlook,'
      
        '        ((Sales_Order.Goods_Value + Sales_Order.Vat_Value - Sale' +
        's_order.Deposit_amount) * -1.0000) as Total_Value,'
      '        Sales_Order.Rep,'
      '        Rep.Rep_Name,'
      '        Sales_Order.Inactive,'
      '        Sales_Order.Customer_Name,'
      '        Customer.Is_Retail_Customer,'
      '        Customer.Is_Commercial_Customer,'
      '        '#39'OUT'#39' as Movement_Type'
      'FROM Rep'
      #9#9'INNER JOIN (Customer'
      #9#9'INNER JOIN (Sales_Order_Status'
      #9#9'INNER JOIN ((Sales_Order_Date_Log AS SODL'
      #9#9'INNER JOIN Sales_Order_Date_Log'
      
        #9#9#9'ON (SODL.Sales_Order = Sales_Order_Date_Log.Sales_Order) AND ' +
        '(SODL.Change_Date = Sales_Order_Date_Log.Change_Date))'
      #9#9'INNER JOIN Sales_Order'
      #9#9#9'ON SODL.Sales_Order = Sales_Order.Sales_Order)'
      
        #9#9#9'ON Sales_Order_Status.Sales_Order_Status = Sales_Order.Sales_' +
        'Order_Status)'
      #9#9#9'ON Customer.Customer = Sales_Order.Customer)'
      #9#9#9'ON Rep.Rep = Sales_Order.Rep'
      
        'WHERE'#9'(Sales_Order_Date_Log.Change_Function ='#39'O'#39') AND (SODL.Chan' +
        'ge_Function ='#39'N'#39') AND'
      #9#9'  (Sales_Order_Date_Log.New_Date <> SODL.New_Date) AND'
      
        '      ((Sales_Order_Date_Log.Change_Date >= :Date_Move_From) and' +
        ' (Sales_Order_Date_Log.Change_Date <= :Date_Move_To)) AND'
      
        '      ((Sales_Order_Date_Log.New_Date >= :Date_From) and (Sales_' +
        'Order_Date_Log.New_Date <= :Date_To)) AND'
      
        '      ((SODL.New_Date < :Date_From) OR (SODL.New_Date > :Date_To' +
        ')) AND'
      
        '      ((Sales_Order.Customer = :Customer) or (0 = :Customer)) AN' +
        'D'
      '      ((Sales_Order.Rep = :Rep) or (:Rep = 0)) AND'
      
        '      ((Sales_Order.Sales_Order_Status >= 10) and (Sales_Order.S' +
        'ales_Order_Status < :Sales_Order_Status)) AND'
      
        '      ((Sales_Order.inactive = '#39'N'#39') or (Sales_Order.inactive is ' +
        'NULL) or (Sales_Order.inactive = '#39#39')) AND'
      
        '      ((Sales_order.Do_not_Invoice is NULL) OR (Sales_Order.Do_n' +
        'ot_Invoice = '#39'N'#39')) AND'
      
        '      ((Sales_Order.IsFittingInOutlook = :IsFittingInOutlook) OR' +
        ' (Sales_Order.IsFittingInOutlook = '#39'Y'#39') OR (Sales_Order.IsFittin' +
        'gInOutlook IS NULL)) AND'
      
        '      (((Customer.Is_Retail_Customer = :Is_Retail_Customer) AND ' +
        '(Customer.Is_Commercial_Customer = :Is_Commercial_Customer)) or ' +
        '(:Is_Retail_Customer = '#39'A'#39'))'
      'UNION ALL'
      'SELECT'#9'DISTINCT'
      '        Sales_Order.Sales_Order,'
      '        Sales_Order.Date_Raised,'
      '        Sales_Order.Date_Required,'
      '        Sales_Order.Reference,'
      '        Sales_Order.Order_ref_no,'
      '        Sales_Order.Sales_Order_Status,'
      '        Sales_Order.On_Hold,'
      '        Sales_Order_Status.Sales_Order_Status_Desc,'
      '        (Sales_Order.Deposit_amount) as Deposit_Amount ,'
      '        (Sales_Order.Goods_Value) as Goods_Value,'
      '        (Sales_Order.VAT_Value) as VAT_Value,'
      '        Sales_Order.IsFittingInOutlook,'
      
        '        ((Sales_Order.Goods_Value + Sales_Order.Vat_Value - Sale' +
        's_order.Deposit_amount)) as Total_Value,'
      '        Sales_Order.Rep,'
      '        Rep.Rep_Name,'
      '        Sales_Order.Inactive,'
      '        Sales_Order.Customer_Name,'
      '        Customer.Is_Retail_Customer,'
      '        Customer.Is_Commercial_Customer,'
      '        '#39'IN'#39' as Movement_Type'
      'FROM Rep'
      #9#9'INNER JOIN (Customer'
      #9#9'INNER JOIN (Sales_Order_Status'
      #9#9'INNER JOIN ((Sales_Order_Date_Log AS SODL'
      #9#9'INNER JOIN Sales_Order_Date_Log'
      
        #9#9#9'ON (SODL.Sales_Order = Sales_Order_Date_Log.Sales_Order) AND ' +
        '(SODL.Change_Date = Sales_Order_Date_Log.Change_Date))'
      #9#9'INNER JOIN Sales_Order'
      #9#9#9'ON SODL.Sales_Order = Sales_Order.Sales_Order)'
      
        #9#9#9'ON Sales_Order_Status.Sales_Order_Status = Sales_Order.Sales_' +
        'Order_Status)'
      #9#9#9'ON Customer.Customer = Sales_Order.Customer)'
      #9#9#9'ON Rep.Rep = Sales_Order.Rep'
      
        'WHERE'#9'(Sales_Order_Date_Log.Change_Function ='#39'O'#39') AND (SODL.Chan' +
        'ge_Function ='#39'N'#39') AND'
      #9#9'  (Sales_Order_Date_Log.New_Date <> SODL.New_Date) AND'
      
        '      ((Sales_Order_Date_Log.Change_Date >= :Date_Move_From) and' +
        ' (Sales_Order_Date_Log.Change_Date <= :Date_Move_To)) AND'
      
        '      ((SODL.New_Date >= :Date_From) and (SODL.New_Date <= :Date' +
        '_To)) AND'
      
        '      ((Sales_Order_Date_Log.New_Date < :Date_From) OR (Sales_Or' +
        'der_Date_Log.New_Date > :Date_To)) AND'
      
        '      ((Sales_Order.Customer = :Customer) or (0 = :Customer)) AN' +
        'D'
      '      ((Sales_Order.Rep = :Rep) or (:Rep = 0)) AND'
      
        '      ((Sales_Order.Sales_Order_Status >= 10) and (Sales_Order.S' +
        'ales_Order_Status < :Sales_Order_Status)) AND'
      
        '      ((Sales_Order.inactive = '#39'N'#39') or (Sales_Order.inactive is ' +
        'NULL) or (Sales_Order.inactive = '#39#39')) AND'
      
        '      ((Sales_order.Do_not_Invoice is NULL) OR (Sales_Order.Do_n' +
        'ot_Invoice = '#39'N'#39')) AND'
      
        '      ((Sales_Order.IsFittingInOutlook = :IsFittingInOutlook) OR' +
        ' (Sales_Order.IsFittingInOutlook = '#39'Y'#39') OR (Sales_Order.IsFittin' +
        'gInOutlook IS NULL)) AND'
      
        '      (((Customer.Is_Retail_Customer = :Is_Retail_Customer) AND ' +
        '(Customer.Is_Commercial_Customer = :Is_Commercial_Customer)) or ' +
        '(:Is_Retail_Customer = '#39'A'#39'))'
      '')
    Left = 496
    Top = 184
    ParamData = <
      item
        Name = 'Date_Move_From'
      end
      item
        Name = 'Date_Move_To'
      end
      item
        Name = 'Date_From'
      end
      item
        Name = 'Date_To'
      end
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
      end
      item
        Name = 'Sales_Order_Status'
      end
      item
        Name = 'IsFittingInOutlook'
      end
      item
        Name = 'Is_Retail_Customer'
      end
      item
        Name = 'Is_Commercial_Customer'
      end
      item
        Name = 'Is_Retail_Customer'
      end
      item
        Name = 'Date_Move_From'
      end
      item
        Name = 'Date_Move_To'
      end
      item
        Name = 'Date_From'
      end
      item
        Name = 'Date_To'
      end
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
      end
      item
        Name = 'Sales_Order_Status'
      end
      item
        Name = 'IsFittingInOutlook'
      end
      item
        Name = 'Is_Retail_Customer'
      end
      item
        Name = 'Is_Commercial_Customer'
      end
      item
        Name = 'Is_Retail_Customer'
      end>
  end
  object qrySalesOrders: TFDQuery
    ConnectionName = 'Wt'
    SQL.Strings = (
      'SELECT'#9'DISTINCT'
      '        Sales_Order.Sales_Order,'
      '        Sales_Order.Date_Raised,'
      '        Sales_Order.Date_Required,'
      '        Sales_Order.Reference,'
      '        Sales_Order.Order_ref_no,'
      '        Sales_Order.Sales_Order_Status,'
      '        Sales_Order.On_Hold,'
      #9#9'    (SELECT (Sales_Order_Status.Sales_Order_Status_Desc)'
      #9#9'      FROM Sales_Order SO, Sales_Order_Status'
      #9#9'      WHERE SO.Sales_Order = Sales_Order.Sales_Order AND'
      
        #9#9#9#9'        SO.sales_order_Status = Sales_Order_Status.sales_ord' +
        'er_Status) as Sales_Order_Status_Desc,'
      
        '        (Sales_Order.Deposit_amount * -1.00000) as Deposit_Amoun' +
        't ,'
      '        (Sales_Order.Goods_Value * -1.0000) as Goods_Value,'
      '        (Sales_Order.VAT_Value * -1.0000) as VAT_Value,'
      '        Sales_Order.IsFittingInOutlook,'
      
        '        ((Sales_Order.Goods_Value + Sales_Order.Vat_Value - Sale' +
        's_order.Deposit_amount) * -1.0000) as Total_Value,'
      '        Sales_Order.Rep,'
      #9#9'    (SELECT Rep.Rep_Name'
      #9#9'      FROM Sales_Order SO, Rep'
      #9#9'      WHERE SO.Sales_Order = Sales_Order.Sales_Order AND'
      #9#9#9#9'        SO.Rep = Rep.Rep) as Rep_Name,'
      '        Sales_Order.Inactive,'
      '        Sales_Order.Customer_Name,'
      '        Customer.Is_Retail_Customer,'
      '        Customer.Is_Commercial_Customer,'
      '        '#39'OUT'#39' as Movement_Type'
      'FROM Customer'
      #9#9'INNER JOIN ((Sales_Order_Date_Log'
      #9#9'INNER JOIN Sales_Order'
      
        #9#9#9'ON Sales_Order_Date_Log.Sales_Order = Sales_Order.Sales_Order' +
        ')'
      #9#9'INNER JOIN Sales_Order_Date_Log AS SODL'
      
        #9#9#9'ON (Sales_Order_Date_Log.Change_Date = SODL.Change_Date) AND ' +
        '(Sales_Order_Date_Log.Sales_Order = SODL.Sales_Order))'
      #9#9#9'ON Customer.Customer = Sales_Order.Customer'
      
        'WHERE ((Sales_Order_Date_Log.Change_Date >= :Date_Move_From) and' +
        ' (Sales_Order_Date_Log.Change_Date <= :Date_Move_To)) AND'
      
        #9#9'  ((Sales_Order_Date_Log.New_Date >= :Date_From) and (Sales_Or' +
        'der_Date_Log.New_Date <= :Date_To)) AND'
      
        #9#9'  ((SODL.New_Date < :Date_From) OR (SODL.New_Date > :Date_To))' +
        ' AND'
      #9#9'  (Sales_Order_Date_Log.New_Date <> SODL.New_Date) AND'
      
        #9#9'  (Sales_Order_Date_Log.Change_Function ='#39'O'#39') AND (SODL.Change' +
        '_Function ='#39'N'#39') AND'
      
        '      ((Sales_Order.Customer = :Customer) or (0 = :Customer)) AN' +
        'D'
      '      ((Sales_Order.Rep = :Rep) or (:Rep = 0)) AND'
      
        '      ((Sales_Order.Sales_Order_Status >= 10) and (Sales_Order.S' +
        'ales_Order_Status < :Sales_Order_Status)) AND'
      
        '      ((Sales_Order.inactive = '#39'N'#39') or (Sales_Order.inactive is ' +
        'NULL) or (Sales_Order.inactive = '#39#39')) AND'
      
        '      ((Sales_order.Do_not_Invoice is NULL) OR (Sales_Order.Do_n' +
        'ot_Invoice = '#39'N'#39')) AND'
      
        '      ((Sales_Order.IsFittingInOutlook = :IsFittingInOutlook) OR' +
        ' (Sales_Order.IsFittingInOutlook = '#39'Y'#39') OR (Sales_Order.IsFittin' +
        'gInOutlook IS NULL)) AND'
      
        '      (((Customer.Is_Retail_Customer = :Is_Retail_Customer) AND ' +
        '(Customer.Is_Commercial_Customer = :Is_Commercial_Customer)) or ' +
        '(:Is_Retail_Customer = '#39'A'#39'))'
      'UNION ALL'
      'SELECT'#9'DISTINCT'
      '        Sales_Order.Sales_Order,'
      '        Sales_Order.Date_Raised,'
      '        Sales_Order.Date_Required,'
      '        Sales_Order.Reference,'
      '        Sales_Order.Order_ref_no,'
      '        Sales_Order.Sales_Order_Status,'
      '        Sales_Order.On_Hold,'
      #9#9'    (SELECT (Sales_Order_Status.Sales_Order_Status_Desc)'
      #9#9'      FROM Sales_Order SO, Sales_Order_Status'
      #9#9'      WHERE SO.Sales_Order = Sales_Order.Sales_Order AND'
      
        #9#9#9#9'        SO.sales_order_Status = Sales_Order_Status.sales_ord' +
        'er_Status) as Sales_Order_Status_Desc,'
      '        (Sales_Order.Deposit_amount) as Deposit_Amount ,'
      '        (Sales_Order.Goods_Value) as Goods_Value,'
      '        (Sales_Order.VAT_Value) as VAT_Value,'
      '        Sales_Order.IsFittingInOutlook,'
      
        '        ((Sales_Order.Goods_Value + Sales_Order.Vat_Value - Sale' +
        's_order.Deposit_amount)) as Total_Value,'
      '        Sales_Order.Rep,'
      #9#9'    (SELECT Rep.Rep_Name'
      #9#9'      FROM Sales_Order SO, Rep'
      #9#9'      WHERE SO.Sales_Order = Sales_Order.Sales_Order AND'
      #9#9#9#9'        SO.Rep = Rep.Rep) as Rep_Name,'
      '        Sales_Order.Inactive,'
      '        Sales_Order.Customer_Name,'
      '        Customer.Is_Retail_Customer,'
      '        Customer.Is_Commercial_Customer,'
      '        '#39'IN'#39' as Movement_Type'
      'FROM Customer'
      #9#9'INNER JOIN ((Sales_Order_Date_Log'
      #9#9'INNER JOIN Sales_Order'
      
        #9#9#9'ON Sales_Order_Date_Log.Sales_Order = Sales_Order.Sales_Order' +
        ')'
      #9#9'INNER JOIN Sales_Order_Date_Log AS SODL'
      
        #9#9#9'ON (Sales_Order_Date_Log.Change_Date = SODL.Change_Date) AND ' +
        '(Sales_Order_Date_Log.Sales_Order = SODL.Sales_Order))'
      #9#9#9'ON Customer.Customer = Sales_Order.Customer'
      'WHERE'
      
        '      ((Sales_Order_Date_Log.Change_Date >= :Date_Move_From) and' +
        ' (Sales_Order_Date_Log.Change_Date <= :Date_Move_To)) AND'
      
        '      ((Sales_Order_Date_Log.New_Date < :Date_From) OR (Sales_Or' +
        'der_Date_Log.New_Date > :Date_To)) AND'
      
        '      ((SODL.New_Date >= :Date_From) and (SODL.New_Date <= :Date' +
        '_To)) AND'
      #9#9'  (Sales_Order_Date_Log.New_Date <> SODL.New_Date) AND'
      
        #9#9'  (Sales_Order_Date_Log.Change_Function ='#39'O'#39') AND (SODL.Change' +
        '_Function ='#39'N'#39') AND'
      
        '      ((Sales_Order.Customer = :Customer) or (0 = :Customer)) AN' +
        'D'
      '      ((Sales_Order.Rep = :Rep) or (:Rep = 0)) AND'
      
        '      ((Sales_Order.Sales_Order_Status >= 10) and (Sales_Order.S' +
        'ales_Order_Status < :Sales_Order_Status)) AND'
      
        '      ((Sales_Order.inactive = '#39'N'#39') or (Sales_Order.inactive is ' +
        'NULL) or (Sales_Order.inactive = '#39#39')) AND'
      
        '      ((Sales_order.Do_not_Invoice is NULL) OR (Sales_Order.Do_n' +
        'ot_Invoice = '#39'N'#39')) AND'
      
        '      ((Sales_Order.IsFittingInOutlook = :IsFittingInOutlook) OR' +
        ' (Sales_Order.IsFittingInOutlook = '#39'Y'#39') OR (Sales_Order.IsFittin' +
        'gInOutlook IS NULL)) AND'
      
        '      (((Customer.Is_Retail_Customer = :Is_Retail_Customer) AND ' +
        '(Customer.Is_Commercial_Customer = :Is_Commercial_Customer)) or ' +
        '(:Is_Retail_Customer = '#39'A'#39'))'
      '')
    Left = 208
    Top = 184
    ParamData = <
      item
        Name = 'Date_Move_From'
      end
      item
        Name = 'Date_Move_To'
      end
      item
        Name = 'Date_From'
      end
      item
        Name = 'Date_To'
      end
      item
        Name = 'Date_From'
      end
      item
        Name = 'Date_To'
      end
      item
        Name = 'Customer'
        DataType = ftInteger
      end
      item
        Name = 'Customer'
        DataType = ftInteger
      end
      item
        Name = 'Rep'
        DataType = ftInteger
      end
      item
        Name = 'Rep'
        DataType = ftInteger
      end
      item
        Name = 'Sales_Order_Status'
      end
      item
        Name = 'IsFittingInOutlook'
      end
      item
        Name = 'Is_Retail_Customer'
      end
      item
        Name = 'Is_Commercial_Customer'
      end
      item
        Name = 'Is_Retail_Customer'
      end
      item
        Name = 'Date_Move_From'
      end
      item
        Name = 'Date_Move_To'
      end
      item
        Name = 'Date_From'
      end
      item
        Name = 'Date_To'
      end
      item
        Name = 'Date_From'
      end
      item
        Name = 'Date_To'
      end
      item
        Name = 'Customer'
        DataType = ftInteger
      end
      item
        Name = 'Customer'
        DataType = ftInteger
      end
      item
        Name = 'Rep'
        DataType = ftInteger
      end
      item
        Name = 'Rep'
        DataType = ftInteger
      end
      item
        Name = 'Sales_Order_Status'
      end
      item
        Name = 'IsFittingInOutlook'
      end
      item
        Name = 'Is_Retail_Customer'
      end
      item
        Name = 'Is_Commercial_Customer'
      end
      item
        Name = 'Is_Retail_Customer'
      end>
  end
end
