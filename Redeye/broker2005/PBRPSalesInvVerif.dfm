object PBRPSalesInvVerifFrm: TPBRPSalesInvVerifFrm
  Left = 82
  Top = 112
  Caption = 'Sales By Invoice Report Print Preview'
  ClientHeight = 440
  ClientWidth = 1380
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  
  OnCreate = FormCreate
  TextHeight = 13
  object qckrpSalesByInv: TQuickRep
    Left = 16
    Top = -8
    Width = 1123
    Height = 794
    ShowingPreview = False
    BeforePrint = qckrpSalesByInvBeforePrint
    DataSet = qrySalesbyInv
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
    object qrbndPageHeader: TQRBand
      Left = 38
      Top = 38
      Width = 1047
      Height = 91
      Frame.DrawBottom = True
      AfterPrint = qrbndPageHeaderAfterPrint
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        240.770833333333300000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object qrlblTitle: TQRLabel
        Left = 373
        Top = 8
        Width = 301
        Height = 23
        Size.Values = (
          60.854166666666670000
          986.895833333333300000
          21.166666666666670000
          796.395833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Sales Invoice Verification Report'
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
      object QRLabel1: TQRLabel
        Left = 360
        Top = 72
        Width = 49
        Height = 15
        Size.Values = (
          39.687500000000000000
          952.500000000000000000
          190.500000000000000000
          129.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Job/Order'
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
      object qrlblCustomer: TQRLabel
        Left = 144
        Top = 72
        Width = 47
        Height = 15
        Size.Values = (
          39.687500000000000000
          381.000000000000000000
          190.500000000000000000
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
      object QRLabel3: TQRLabel
        Left = 10
        Top = 56
        Width = 35
        Height = 17
        Size.Values = (
          44.979166666666670000
          26.458333333333330000
          148.166666666666700000
          92.604166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Invoice'
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
        Left = 660
        Top = 72
        Width = 59
        Height = 15
        Size.Values = (
          39.687500000000000000
          1746.250000000000000000
          190.500000000000000000
          156.104166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Selling Price'
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
        Left = 776
        Top = 72
        Width = 23
        Height = 15
        Size.Values = (
          39.687500000000000000
          2053.166666666667000000
          190.500000000000000000
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
      object QRLabel8: TQRLabel
        Left = 856
        Top = 72
        Width = 24
        Height = 15
        Size.Values = (
          39.687500000000000000
          2264.833333333333000000
          190.500000000000000000
          63.500000000000000000)
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
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel10: TQRLabel
        Left = 905
        Top = 72
        Width = 50
        Height = 15
        Size.Values = (
          39.687500000000000000
          2394.479166666667000000
          190.500000000000000000
          132.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cost Price'
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
        Left = 462
        Top = 32
        Width = 122
        Height = 17
        Size.Values = (
          44.979166666666670000
          1222.375000000000000000
          84.666666666666670000
          322.791666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'For Invoices Dated from: '
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
        Left = 72
        Top = 72
        Width = 40
        Height = 15
        Size.Values = (
          39.687500000000000000
          190.500000000000000000
          190.500000000000000000
          105.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Inv Date'
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
      object QRLabel15: TQRLabel
        Left = 10
        Top = 72
        Width = 38
        Height = 15
        Size.Values = (
          39.687500000000000000
          26.458333333333330000
          190.500000000000000000
          100.541666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Number'
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
      object MarginQRLabel: TQRLabel
        Left = 1003
        Top = 72
        Width = 33
        Height = 15
        Size.Values = (
          39.687500000000000000
          2653.770833333333000000
          190.500000000000000000
          87.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Margin'
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
      object QRLabel19: TQRLabel
        Left = 976
        Top = 56
        Width = 59
        Height = 17
        Size.Values = (
          44.979166666666670000
          2582.333333333333000000
          148.166666666666700000
          156.104166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Gross Profit'
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
        Left = 986
        Top = 8
        Width = 56
        Height = 17
        Size.Values = (
          44.979166666666670000
          2608.791666666667000000
          21.166666666666670000
          148.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsDateTime
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
      object QRSysData1: TQRSysData
        Left = 973
        Top = 29
        Width = 69
        Height = 15
        Size.Values = (
          39.687500000000000000
          2574.395833333333000000
          76.729166666666670000
          182.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = DEFAULT_CHARSET
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
      object QRLabel5: TQRLabel
        Left = 432
        Top = 72
        Width = 51
        Height = 15
        Size.Values = (
          39.687500000000000000
          1143.000000000000000000
          190.500000000000000000
          134.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date Reqd'
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
        Left = 504
        Top = 59
        Width = 73
        Height = 28
        Size.Values = (
          74.083333333333320000
          1333.500000000000000000
          156.104166666666700000
          193.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Date Invoiced Raised'
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
        Left = 583
        Top = 59
        Width = 66
        Height = 30
        Size.Values = (
          79.375000000000000000
          1542.520833333333000000
          156.104166666666700000
          174.625000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Days Taken to Raise'
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
    object QRSubDetail1: TQRSubDetail
      Left = 38
      Top = 161
      Width = 1047
      Height = 24
      AfterPrint = QRSubDetail1AfterPrint
      AlignToBottom = False
      BeforePrint = QRSubDetail1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.500000000000000000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qckrpSalesByInv
      DataSet = qrySalesbyInv
      PrintBefore = False
      PrintIfEmpty = True
      object qrdbtxtPOLine: TQRDBText
        Left = 360
        Top = 2
        Width = 54
        Height = 15
        Size.Values = (
          39.687500000000000000
          952.500000000000000000
          5.291666666666667000
          142.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySalesbyInv
        DataField = 'OrderDesc'
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
      object qrdbtxtGoodsVAT: TQRDBText
        Left = 748
        Top = 2
        Width = 52
        Height = 15
        Size.Values = (
          39.687500000000000000
          1979.083333333333000000
          5.291666666666667000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySalesbyInv
        DataField = 'Vat_Value'
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
      object qrdbtxtGoodsTotal: TQRDBText
        Left = 819
        Top = 2
        Width = 62
        Height = 15
        Size.Values = (
          39.687500000000000000
          2166.937500000000000000
          5.291666666666667000
          164.041666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySalesbyInv
        DataField = 'Goods_Total'
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
      object qrdbtxtInvDate: TQRDBText
        Left = 72
        Top = 2
        Width = 63
        Height = 15
        Size.Values = (
          39.687500000000000000
          190.500000000000000000
          5.291666666666667000
          166.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySalesbyInv
        DataField = 'Invoice_Date'
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
      object TotCstQRLbl: TQRLabel
        Left = 900
        Top = 2
        Width = 58
        Height = 15
        Size.Values = (
          39.687500000000000000
          2381.250000000000000000
          5.291666666666667000
          153.458333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'TotCstQRLbl'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object MargQRLbl: TQRLabel
        Left = 971
        Top = 2
        Width = 65
        Height = 15
        Size.Values = (
          39.687500000000000000
          2569.104166666667000000
          5.291666666666667000
          171.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'MargQRLbl'
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
      object lblDescription: TQRLabel
        Left = 144
        Top = 2
        Width = 209
        Height = 15
        Size.Values = (
          39.687500000000000000
          381.000000000000000000
          5.291666666666667000
          552.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'lblDescription'
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
      object QRDBText2: TQRDBText
        Left = 11
        Top = 2
        Width = 52
        Height = 15
        Size.Values = (
          39.687500000000000000
          29.104166666666670000
          5.291666666666667000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySalesbyInv
        DataField = 'InvoiceRef'
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
      object QRDBText1: TQRDBText
        Left = 432
        Top = 2
        Width = 72
        Height = 15
        Size.Values = (
          39.687500000000000000
          1143.000000000000000000
          5.291666666666667000
          190.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySalesbyInv
        DataField = 'Date_Required'
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
      object QRDBText3: TQRDBText
        Left = 507
        Top = 2
        Width = 67
        Height = 15
        Size.Values = (
          39.687500000000000000
          1341.437500000000000000
          5.291666666666667000
          177.270833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySalesbyInv
        DataField = 'Date_Created'
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
      object qrlblDaysToRaise: TQRLabel
        Left = 584
        Top = 2
        Width = 85
        Height = 15
        Size.Values = (
          39.687500000000000000
          1545.166666666667000000
          5.291666666666667000
          224.895833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblDaysToRaise'
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
      object qrdbtxtGoodsValue: TQRDBText
        Left = 652
        Top = 2
        Width = 67
        Height = 15
        Size.Values = (
          39.687500000000000000
          1725.083333333333000000
          5.291666666666667000
          177.270833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySalesbyInv
        DataField = 'Goods_Value'
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
    object QRBand1: TQRBand
      Left = 38
      Top = 185
      Width = 1047
      Height = 40
      AfterPrint = QRBand1AfterPrint
      AlignToBottom = False
      BeforePrint = QRBand1BeforePrint
      Enabled = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRLabel18: TQRLabel
        Left = 584
        Top = 8
        Width = 35
        Height = 20
        Size.Values = (
          52.916666666666670000
          1545.166666666667000000
          21.166666666666670000
          92.604166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
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
      object TotalSellLbl: TQRLabel
        Left = 655
        Top = 8
        Width = 65
        Height = 20
        Size.Values = (
          52.916666666666670000
          1733.020833333333000000
          21.166666666666670000
          171.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalSellLbl'
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
      object TotalVatlbl: TQRLabel
        Left = 741
        Top = 8
        Width = 59
        Height = 20
        Size.Values = (
          52.916666666666670000
          1960.562500000000000000
          21.166666666666670000
          156.104166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalVatlbl'
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
      object TotalGoodsLbl: TQRLabel
        Left = 801
        Top = 8
        Width = 81
        Height = 20
        Size.Values = (
          52.916666666666670000
          2119.312500000000000000
          21.166666666666670000
          214.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalGoodsLbl'
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
        Left = 640
        Top = 0
        Width = 401
        Height = 9
        Size.Values = (
          23.812500000000000000
          1693.333333333333000000
          0.000000000000000000
          1060.979166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object TotalCostLbl: TQRLabel
        Left = 877
        Top = 8
        Width = 81
        Height = 20
        Size.Values = (
          52.916666666666670000
          2320.395833333333000000
          21.166666666666670000
          214.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalGoodsLbl'
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
      object GrpMargQRLbl: TQRLabel
        Left = 971
        Top = 8
        Width = 65
        Height = 17
        Size.Values = (
          44.979166666666670000
          2569.104166666667000000
          21.166666666666670000
          171.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'GrpMargQRLbl'
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
    object RepQRGroup: TQRGroup
      Left = 38
      Top = 129
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
      FooterBand = QRBand1
      Master = QRSubDetail1
      ReprintOnNewPage = False
      object GrpByQRDBText: TQRDBText
        Left = 8
        Top = 8
        Width = 250
        Height = 17
        Size.Values = (
          44.979166666666700000
          21.166666666666700000
          21.166666666666700000
          661.458333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = qrySalesbyInv
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object QRBand2: TQRBand
      Left = 38
      Top = 225
      Width = 1047
      Height = 36
      AlignToBottom = False
      BeforePrint = QRBand2BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        95.250000000000000000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRShape2: TQRShape
        Left = 640
        Top = 2
        Width = 401
        Height = 9
        Size.Values = (
          23.812500000000000000
          1693.333333333333000000
          5.291666666666667000
          1060.979166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object RepTotQRLabel: TQRLabel
        Left = 584
        Top = 10
        Width = 35
        Height = 20
        Size.Values = (
          52.916666666666670000
          1545.166666666667000000
          26.458333333333330000
          92.604166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
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
      object RepTotSellQRLbl: TQRLabel
        Left = 655
        Top = 10
        Width = 65
        Height = 20
        Size.Values = (
          52.916666666666670000
          1733.020833333333000000
          26.458333333333330000
          171.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalSellLbl'
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
      object RepTotVatQRLbl: TQRLabel
        Left = 741
        Top = 10
        Width = 59
        Height = 20
        Size.Values = (
          52.916666666666670000
          1960.562500000000000000
          26.458333333333330000
          156.104166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalVatlbl'
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
      object RepTotGoodsQRLbl: TQRLabel
        Left = 802
        Top = 10
        Width = 81
        Height = 20
        Size.Values = (
          52.916666666666670000
          2121.958333333333000000
          26.458333333333330000
          214.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalGoodsLbl'
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
      object RepTotCostQRLbl: TQRLabel
        Left = 877
        Top = 10
        Width = 81
        Height = 20
        Size.Values = (
          52.916666666666670000
          2320.395833333333000000
          26.458333333333330000
          214.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalGoodsLbl'
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
      object RepMargQRLbl: TQRLabel
        Left = 970
        Top = 10
        Width = 65
        Height = 17
        Size.Values = (
          44.979166666666670000
          2566.458333333333000000
          26.458333333333330000
          171.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'RepMargQRLbl'
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
  object AddCostsQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select sum(Amount) as Add_Cost'
      'from Purch_Ord_line_add_chg'
      '  where (Purch_Ord_Line_Add_Chg.Purchase_Order = :PurchOrder) '
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 712
    Top = 342
    ParamData = <
      item
        Name = 'PurchOrder'
        DataType = ftFloat
      end>
  end
  object qrySalesbyInv: TFDQuery
    OnCalcFields = qrySalesbyInvCalcFields
    ConnectionName = 'PB'
    SQL.Strings = (
      '')
    Left = 176
    Top = 328
    object qrySalesbyInvCustomer: TIntegerField
      FieldName = 'Customer'
    end
    object qrySalesbyInvBranch_no: TIntegerField
      FieldName = 'Branch_no'
    end
    object qrySalesbyInvSales_Invoice: TIntegerField
      FieldName = 'Sales_Invoice'
    end
    object qrySalesbyInvAccount_Code: TStringField
      FieldName = 'Account_Code'
      FixedChar = True
    end
    object qrySalesbyInvName: TStringField
      FieldName = 'Name'
      FixedChar = True
      Size = 80
    end
    object qrySalesbyInvSales_Invoice_No: TStringField
      FieldName = 'Sales_Invoice_No'
      FixedChar = True
      Size = 30
    end
    object qrySalesbyInvGoods_Value: TCurrencyField
      FieldName = 'Goods_Value'
      DisplayFormat = '#,###,##0.00'
      currency = False
    end
    object qrySalesbyInvVat_Value: TCurrencyField
      FieldName = 'Vat_Value'
      DisplayFormat = '#,###,##0.00'
      currency = False
    end
    object qrySalesbyInvGoods_Total: TCurrencyField
      FieldName = 'Goods_Total'
      DisplayFormat = '#,###,##0.00'
      currency = False
    end
    object qrySalesbyInvInvoice_Date: TDateTimeField
      FieldName = 'Invoice_Date'
    end
    object qrySalesbyInvInvoice_or_Credit: TStringField
      FieldName = 'Invoice_or_Credit'
      FixedChar = True
      Size = 2
    end
    object qrySalesbyInvRep: TIntegerField
      FieldName = 'Rep'
    end
    object qrySalesbyInvSales_Invoice_type: TStringField
      FieldName = 'Sales_Invoice_type'
      FixedChar = True
      Size = 2
    end
    object qrySalesbyInvInactive: TStringField
      FieldName = 'Inactive'
      FixedChar = True
      Size = 2
    end
    object qrySalesbyInvReference: TStringField
      FieldName = 'Reference'
      FixedChar = True
      Size = 120
    end
    object qrySalesbyInvRep_Name: TStringField
      FieldName = 'Rep_Name'
      FixedChar = True
      Size = 80
    end
    object qrySalesbyInvInvoiceRef: TStringField
      FieldKind = fkCalculated
      FieldName = 'InvoiceRef'
      OnGetText = qrySalesbyInvInvoiceRefGetText
      Size = 10
      Calculated = True
    end
    object qrySalesbyInvInvoice_Description: TStringField
      FieldName = 'Invoice_Description'
      FixedChar = True
      Size = 160
    end
    object qrySalesbyInvOrderDesc: TStringField
      FieldKind = fkCalculated
      FieldName = 'OrderDesc'
      Size = 15
      Calculated = True
    end
    object qrySalesbyInvBranch_Name: TStringField
      FieldName = 'Branch_Name'
      Size = 80
    end
    object qrySalesbyInvCust_Order_no: TStringField
      FieldName = 'Cust_Order_no'
      Size = 50
    end
    object qrySalesbyInvDate_Required: TDateTimeField
      FieldName = 'Date_Required'
    end
    object qrySalesbyInvAccount_Manager_Name: TStringField
      FieldName = 'Account_Manager_Name'
      Size = 50
    end
    object qrySalesbyInvDate_Created: TDateTimeField
      FieldName = 'Date_Created'
    end
  end
  object qryGetPOCrCosts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select'
      '  Purch_Ord.Purch_Ord,'
      '  Purch_Ord.Purch_ord_no,'
      '  Purch_ord_Line.Purch_Pack_Quantity,'
      '  Purch_ord_Line.Purchase_Price'
      'from Sales_order_Line, Purch_Ord, Purch_Ord_Line'
      'where'
      '('
      '(Sales_Order_Line.Sales_order = :Sales_Order) and'
      '(Sales_Order_line.Sales_order_Line_no = :Sales_Order_line_no)'
      ') and'
      '(Sales_Order_Line.Sales_Order = Purch_Ord.Sales_order) and'
      '('
      '(Purch_ord_Line.Purch_ord = Purch_Ord.Purch_ord) and'
      '(Purch_ord_Line.Part = Sales_order_line.Part)'
      ')'
      ''
      ' '
      ' '
      ' '
      ' ')
    Left = 1008
    Top = 264
    ParamData = <
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Sales_Order_line_no'
      end>
  end
  object qryGetSOCosts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'select sum(Sales_order_line.Part_Cost*((Sales_invoice_line.Qty_I' +
        'nvoiced*1.0000)/(Sales_order_line.Purch_Pack_Quantity*1.0000))) ' +
        'as Total_Cost'
      'from Sales_Order_Line, Sales_invoice_line, Part'
      'where Sales_invoice_line.Sales_Order = :Sales_Order and'
      'Sales_invoice_line.Sales_invoice = :Sales_Invoice and'
      '('
      
        '(Sales_invoice_line.Sales_order = Sales_order_line.sales_order) ' +
        'and'
      
        '(Sales_invoice_line.Sales_order_line_no = Sales_order_line.Sales' +
        '_order_line_no)'
      ') and'
      '(Sales_order_line.Part = Part.part) and'
      '(Part.Product_Class <> '#39'NSTK'#39')'
      '')
    Left = 848
    Top = 392
    ParamData = <
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Sales_invoice'
      end>
  end
  object qryAddPOCosts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select sum(Amount) as Total_Cost'
      'from Purch_Ord_add_charge'
      '  where (Purch_Ord_Add_Charge.Purch_Ord = :Purch_Ord) '
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 712
    Top = 286
    ParamData = <
      item
        Name = 'Purch_Ord'
      end>
  end
  object qryGetJBCrCosts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Job_Bag_Line_Dets.Job_Bag_Line_Cost '
      'FROM Job_Bag_Line_Dets'
      'WHERE Job_Bag_Line_Dets.Job_Bag = :Job_Bag and'
      'Job_Bag_Line_Dets.Job_Bag_line = :Job_Bag_Line'
      ' ')
    Left = 1012
    Top = 328
    ParamData = <
      item
        Name = 'Job_Bag'
      end
      item
        Name = 'Job_Bag_Line'
      end>
  end
  object qryGetInvLine: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Sales_Invoice_Line.Sales_Invoice,'
      '        Sales_Invoice_Line.Invoice_Line_No,'
      '        Sales_Invoice_Line.Qty_Invoiced,'
      '        Price_Unit.Price_Unit_Factor as Invoice_unit_factor,'
      '        Sales_Invoice_Line.sales_Order,'
      '        Sales_Invoice_Line.Sales_Order_Line_no,'
      '        Sales_Invoice_Line.Credit_type,'
      '        Sales_Invoice_Line.Cost_Price'
      'FROM Price_Unit'
      '    INNER JOIN Sales_Invoice_Line ON'
      '      Price_Unit.Price_Unit = Sales_Invoice_Line.Price_Unit'
      'WHERE Sales_Order <> null AND'
      'Sales_Invoice = :Sales_Invoice')
    Left = 578
    Top = 286
    ParamData = <
      item
        Name = 'Sales_Invoice'
      end>
  end
  object qryGetPOCosts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select'
      #9'Purch_Ord.Purch_Ord, '
      #9'Purch_Ord.Purch_ord_no,'
      
        'sum((Sales_Invoice_Line.Qty_Invoiced/Purch_ord_Line.Purch_Pack_Q' +
        'uantity)*Purchase_Price) as Total_Cost'
      
        'from Sales_invoice_line, Sales_order_line, Purch_Ord, Purch_Ord_' +
        'Line'
      'where'
      '(Sales_Invoice_Line.Sales_invoice = :Sales_Invoice) and'
      
        '((Sales_Invoice_Line.Sales_order = Sales_Order_line.Sales_order)' +
        ' and'
      
        '(Sales_Invoice_Line.Sales_order_line_no = Sales_Order_line.Sales' +
        '_order_line_no)) and'
      '(Sales_Order_line.Sales_Order = Purch_Ord.Sales_order) and'
      '('
      '(Purch_ord_Line.Purch_ord = Purch_Ord.Purch_ord) and'
      '(Purch_ord_Line.Part = Sales_Order_Line.Part)'
      ')'
      'Group By'
      'Purch_Ord.Purch_Ord, Purch_Ord.Purch_Ord_no')
    Left = 848
    Top = 280
    ParamData = <
      item
        Name = 'Sales_Invoice'
      end>
  end
  object qryGetSOCrCosts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Sales_Order_line.Sales_Order,'
      '        Sales_Order_line.Sales_Order_line_no,'
      '        Sales_Order_line.Part_Cost,'
      '        Sales_Order_line.Purch_Pack_Quantity'
      'FROM Sales_Order_line, Part'
      'where'
      '('
      '(Sales_Order_Line.Sales_order = :Sales_Order) and'
      '(Sales_Order_line.Sales_order_Line_no = :Sales_Order_line_no)'
      ') and'
      '(Sales_order_line.Part = Part.Part) and'
      '(Part.Product_Class <> '#39'NSTK'#39')'
      ' '
      ' '
      ' '
      ' ')
    Left = 1016
    Top = 384
    ParamData = <
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Sales_Order_line_no'
      end>
  end
  object qryGetProdCosts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select  Order_Price,'
      '        Price_unit_Factor as Order_unit_Factor,'
      '        Quantity'
      'from Purchase_OrderLine, Price_Unit'
      'where Purchase_Order = :Purchase_Order AND'
      'Line = :Line AND'
      '(Purchase_OrderLine.Order_unit = Price_unit.Price_Unit)'
      ' ')
    Left = 578
    Top = 398
    ParamData = <
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end>
  end
  object qryGetInvAddChrg: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from sales_invoice_add_charge'
      'where sales_invoice = :sales_invoice ')
    Left = 578
    Top = 336
    ParamData = <
      item
        Name = 'sales_invoice'
      end>
  end
  object GetCostsQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT '#9'Sales_Invoice_Line.Invoice_Line_no,'
      #9'Sales_Invoice_Line.Qty_Invoiced, '
      #9'Purchase_OrderLine.Order_Price, '
      #9'Purchase_OrderLine.Quantity, '
      #9'Price_Unit.Price_Unit_Factor AS Order_Unit_Factor, '
      #9'Supplier_Invoice_Line.Goods_Value as Purch_Price, '
      #9'Supplier_Invoice_Line.Qty_Invoiced as Qty_Purch_Invoiced,'
      '  Supplier_Invoice_Line.Supp_invoice_status,'
      #9'Inv_Price_Unit.Price_Unit_Factor as Purch_Unit_Factor,'
      '  (select Sum(Amount)'
      '   from Supplier_Invoice_Charge'
      
        '   where Supplier_Invoice_Charge.Purchase_order = Sales_Invoice_' +
        'Line.Purchase_Order and'
      
        '               Supplier_Invoice_Charge.Line = Sales_Invoice_Line' +
        '.Line) AS Purch_Extra_Cost'
      'FROM (((Price_Unit'
      #9'INNER JOIN Purchase_OrderLine '
      #9#9'ON Price_Unit.Price_Unit = Purchase_OrderLine.Order_Unit) '
      #9'INNER JOIN (Sales_Invoice '
      #9'INNER JOIN Sales_Invoice_Line '
      
        #9#9'ON Sales_Invoice.Sales_Invoice = Sales_Invoice_Line.Sales_Invo' +
        'ice) '
      
        #9#9'ON (Purchase_OrderLine.Line = Sales_Invoice_Line.Line) AND (Pu' +
        'rchase_OrderLine.Purchase_Order = Sales_Invoice_Line.Purchase_Or' +
        'der)) '
      #9'LEFT JOIN Supplier_Invoice_Line '
      
        #9#9'ON (Purchase_OrderLine.Line = Supplier_Invoice_Line.Line) AND ' +
        '(Purchase_OrderLine.Purchase_Order = Supplier_Invoice_Line.Purch' +
        'ase_Order)) '
      #9'LEFT JOIN Price_Unit AS Inv_Price_Unit '
      
        #9#9'ON Supplier_Invoice_Line.Price_Unit = Inv_Price_Unit.Price_Uni' +
        't'
      'WHERE (Sales_Invoice.Sales_Invoice = :Sales_Invoice)'
      
        'ORDER BY Sales_Invoice_Line.sales_invoice, Sales_Invoice_Line.in' +
        'voice_line_no')
    Left = 712
    Top = 392
    ParamData = <
      item
        Name = 'Sales_Invoice'
      end>
  end
  object qryGetJbCosts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Sales_Invoice_Line.Sales_Invoice,'
      '        Sales_Invoice_Line.Invoice_Line_No,'
      '        Sales_Invoice_Line.Purchase_Order,'
      '        Sales_Invoice_Line.Line,'
      '        Sales_Invoice_Line.Qty_Invoiced,'
      '        Sales_Invoice_Line.Job_Bag,'
      '        Sales_Invoice_Line.Job_Bag_Line,'
      '        Job_Bag_Line_Dets.Job_Bag_Line_Cost,'
      '        Purchase_OrderLine.Order_Price,'
      '        Purchase_OrderLine.Order_Unit,'
      '        Purchase_OrderLine.Quantity,'
      '        Price_Unit.Price_Unit_Factor,'
      '        (select Sum(Amount)'
      '         from Purch_ord_line_Add_Chg'
      
        '         where Purch_Ord_Line_Add_Chg.Purchase_order = Sales_Inv' +
        'oice_Line.Purchase_Order and'
      
        '               Purch_Ord_Line_Add_Chg.Line = Sales_Invoice_Line.' +
        'Line) AS Extra_Cost,'
      '        (select Sum(Amount)'
      '         from Supplier_Invoice_Charge'
      
        '         where Supplier_Invoice_Charge.Purchase_order = Sales_In' +
        'voice_Line.Purchase_Order and'
      
        '               Supplier_Invoice_Charge.Line = Sales_Invoice_Line' +
        '.Line) AS Purch_Extra_Cost,'
      #9'      Supplier_Invoice_Line.Goods_Value as Purch_Price,'
      #9'      Supplier_Invoice_Line.Qty_Invoiced as Qty_Purch_Invoiced,'
      '        Supplier_Invoice_Line.Supp_Invoice_Status,'
      #9'      Inv_Price_Unit.Price_Unit_Factor as Purch_Unit_Factor'
      'FROM Price_Unit AS Inv_Price_Unit'
      '      RIGHT JOIN (((Price_Unit'
      '      RIGHT JOIN Purchase_OrderLine'
      
        '        ON Price_Unit.Price_Unit = Purchase_OrderLine.Order_Unit' +
        ')'
      '      RIGHT JOIN (Job_Bag_Line_Dets'
      '      INNER JOIN Sales_Invoice_Line'
      
        '        ON (Job_Bag_Line_Dets.Job_Bag = Sales_Invoice_Line.Job_B' +
        'ag) AND (Job_Bag_Line_Dets.Job_Bag_Line = Sales_Invoice_Line.Job' +
        '_Bag_Line))'
      
        '        ON (Purchase_OrderLine.Line = Job_Bag_Line_Dets.Line) AN' +
        'D (Purchase_OrderLine.Purchase_Order = Job_Bag_Line_Dets.Purchas' +
        'e_Order))'
      '      LEFT JOIN Supplier_Invoice_Line'
      
        '        ON (Purchase_OrderLine.Line = Supplier_Invoice_Line.Line' +
        ') AND (Purchase_OrderLine.Purchase_Order = Supplier_Invoice_Line' +
        '.Purchase_Order))'
      
        '        ON Inv_Price_Unit.Price_Unit = Supplier_Invoice_Line.Pri' +
        'ce_Unit'
      'WHERE (Sales_Invoice_Line.Sales_Invoice = :Sales_Invoice)'
      
        'ORDER BY Sales_Invoice_Line.sales_invoice, Sales_Invoice_Line.in' +
        'voice_line_no'
      '')
    Left = 848
    Top = 336
    ParamData = <
      item
        Name = 'Sales_Invoice'
      end>
  end
  object qryDummy: TFDQuery
    OnCalcFields = qrySalesbyInvCalcFields
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT DISTINCT Sales_Invoice.Inv_to_Customer AS Customer, '
      #9' Sales_Invoice.Inv_to_Branch AS Branch_no, '
      #9' Sales_Invoice.Sales_Invoice,'
      '   Sales_Invoice.Date_Created, '
      #9' Customer_Branch.Account_Code, '
      #9' Customer_Branch.Name as Branch_Name, '
      #9' Customer.Name, '
      #9' Sales_Invoice.Sales_Invoice_No, '
      #9' Sales_Invoice.Goods_Value, '
      #9' Sales_Invoice.Vat_Value, '
      
        #9' (Sales_Invoice.Goods_Value+Sales_Invoice.VAT_Value) AS Goods_T' +
        'otal, '
      #9' Sales_Invoice.Invoice_Date, '
      #9' Sales_Invoice.Invoice_or_Credit, '
      #9' Sales_Invoice.Rep, '
      '   Sales_Invoice.Sales_Invoice_type,'
      '   Sales_Invoice.Inactive,'
      #9' Sales_Invoice.Reference, '
      #9' Sales_Invoice.Invoice_Description,'
      '   Sales_Invoice.Cust_Order_no, '
      #9' (case sales_invoice_type'
      #9' when '#39'S'#39' then (select distinct Sales_Order.Date_Required'
      #9' '#9#9'from Sales_Order'
      #9' '#9#9'where Sales_Order.Sales_order = Sales_invoice.Reference)'
      #9' when '#39'J'#39' then (select distinct Job_Bag.Goods_Required'
      #9' '#9#9'from Job_Bag'
      #9' '#9#9'where Job_Bag.Job_Bag = Sales_invoice.Reference)'
      #9' else (select Purchase_OrderLine.Goods_Required'
      #9' '#9'from Purchase_orderLine'
      
        #9' '#9'where Purchase_OrderLine.Purchase_Order = Sales_Invoice.Refer' +
        'ence)'
      #9' end) as Date_Required,'
      #9' (case sales_invoice_type'
      #9' when '#39'S'#39' then (select distinct Operator.Name'
      #9' '#9#9'from Sales_Order, Operator'
      #9' '#9#9'where Sales_Order.Sales_order = Sales_invoice.Reference AND'
      '            Sales_Order.Office_Contact = Operator.Operator)'
      #9' when '#39'J'#39' then (select distinct Operator.Name'
      #9' '#9#9'from Job_Bag, Operator'
      #9' '#9#9'where Job_Bag.Job_Bag = Sales_invoice.Reference AND'
      '            Job_Bag.Office_Contact = Operator.Operator)'
      #9' else (select Operator.Name'
      #9' '#9'from Purchase_orderLine, Purchase_Order, Operator'
      
        #9' '#9'where Purchase_OrderLine.Purchase_Order = Sales_Invoice.Refer' +
        'ence AND'
      
        '          Purchase_OrderLine.Purchase_Order = Purchase_Order.Pur' +
        'chase_Order AND'
      '          Purchase_Order.Office_Contact = Operator.Operator)'
      #9' end) as Account_Manager_Name,'
      #9' Rep.Name as Rep_Name'
      ' FROM (Customer'
      #9' INNER JOIN ((Customer_Branch '
      #9' INNER JOIN Sales_Invoice ON '
      
        #9' '#9'(Customer_Branch.Customer = Sales_Invoice.Inv_to_Customer) AN' +
        'D '
      #9' '#9'(Customer_Branch.Branch_no = Sales_Invoice.Inv_to_Branch)) '
      #9' INNER JOIN Sales_Invoice_Line ON '
      
        #9' '#9'Sales_Invoice.Sales_Invoice = Sales_Invoice_Line.Sales_Invoic' +
        'e) ON '
      #9' '#9'  Customer.Customer = Customer_Branch.Customer) '
      #9' INNER JOIN Rep ON '
      #9' '#9'Sales_Invoice.Rep = Rep.Rep'
      ' WHERE (Sales_Invoice.Sales_Invoice_Status > 10) AND'
      #9#9'(Sales_invoice.Invoice_or_Credit = '#39'I'#39') AND '
      
        #9#9'((Sales_Invoice.Inactive <> '#39'Y'#39') or (Sales_Invoice.Inactive is' +
        ' null)) AND '
      #9#9'((Sales_Invoice.Invoice_Date >= :Date_From) AND '
      #9#9'(Sales_Invoice.Invoice_Date <= :Date_To)) AND'
      
        '    ((Sales_Invoice.Inv_to_Customer = :Customer) or (:Customer =' +
        ' 0)) AND'
      #9'  ('
      '    ((case sales_invoice_type'
      #9'  when '#39'S'#39' then (select Sales_Order.Office_Contact'
      #9' '#9#9'from Sales_Order'
      #9' '#9#9'where Sales_Order.Sales_order = Sales_invoice.Reference)'
      #9'  when '#39'J'#39' then (select distinct Job_Bag.Office_Contact'
      #9' '#9#9'from Job_Bag'
      #9' '#9#9'where Job_Bag.Job_Bag = Sales_invoice.Reference)'
      #9'  else (select Purchase_Order.Office_Contact'
      #9' '#9'  from Purchase_orderLine, Purchase_Order'
      
        #9' '#9'  where Purchase_OrderLine.Purchase_Order = Sales_Invoice.Ref' +
        'erence AND'
      
        '          Purchase_OrderLine.Purchase_Order = Purchase_Order.Pur' +
        'chase_Order)'
      #9'  end) = :Account_Manager) or (:Account_Manager = 0)'
      '    )')
    Left = 272
    Top = 328
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
        Name = 'Account_Manager'
      end
      item
        Name = 'Account_Manager'
      end>
    object IntegerField1: TIntegerField
      FieldName = 'Customer'
    end
    object IntegerField2: TIntegerField
      FieldName = 'Branch_no'
    end
    object IntegerField3: TIntegerField
      FieldName = 'Sales_Invoice'
    end
    object StringField1: TStringField
      FieldName = 'Account_Code'
      FixedChar = True
    end
    object StringField2: TStringField
      FieldName = 'Name'
      FixedChar = True
      Size = 80
    end
    object StringField3: TStringField
      FieldName = 'Sales_Invoice_No'
      FixedChar = True
      Size = 30
    end
    object CurrencyField1: TCurrencyField
      FieldName = 'Goods_Value'
      DisplayFormat = '#,###,##0.00'
      currency = False
    end
    object CurrencyField2: TCurrencyField
      FieldName = 'Vat_Value'
      DisplayFormat = '#,###,##0.00'
      currency = False
    end
    object CurrencyField3: TCurrencyField
      FieldName = 'Goods_Total'
      DisplayFormat = '#,###,##0.00'
      currency = False
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'Invoice_Date'
    end
    object StringField4: TStringField
      FieldName = 'Invoice_or_Credit'
      FixedChar = True
      Size = 2
    end
    object IntegerField4: TIntegerField
      FieldName = 'Rep'
    end
    object StringField5: TStringField
      FieldName = 'Sales_Invoice_type'
      FixedChar = True
      Size = 2
    end
    object StringField6: TStringField
      FieldName = 'Inactive'
      FixedChar = True
      Size = 2
    end
    object StringField7: TStringField
      FieldName = 'Reference'
      FixedChar = True
      Size = 120
    end
    object StringField8: TStringField
      FieldName = 'Rep_Name'
      FixedChar = True
      Size = 80
    end
    object StringField9: TStringField
      FieldKind = fkCalculated
      FieldName = 'InvoiceRef'
      OnGetText = qrySalesbyInvInvoiceRefGetText
      Size = 10
      Calculated = True
    end
    object StringField10: TStringField
      FieldName = 'Invoice_Description'
      FixedChar = True
      Size = 160
    end
    object StringField11: TStringField
      FieldKind = fkCalculated
      FieldName = 'OrderDesc'
      Size = 15
      Calculated = True
    end
    object StringField12: TStringField
      FieldName = 'Branch_Name'
      Size = 80
    end
    object StringField13: TStringField
      FieldName = 'Cust_Order_no'
      Size = 50
    end
  end
end
