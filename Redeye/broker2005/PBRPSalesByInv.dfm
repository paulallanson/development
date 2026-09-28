object PBRPSalesByInvFrm: TPBRPSalesByInvFrm
  Left = 89
  Top = 113
  Caption = 'Sales By Invoice Report Print Preview'
  ClientHeight = 515
  ClientWidth = 1388
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Scaled = False
  OnCreate = FormCreate
  TextHeight = 13
  object qckrpSalesByInv: TQuickRep
    Left = 16
    Top = -8
    Width = 1403
    Height = 992
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
      Left = 47
      Top = 47
      Width = 1309
      Height = 154
      Frame.DrawBottom = True
      AfterPrint = qrbndPageHeaderAfterPrint
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        325.966666666666700000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object qrlblTitle: TQRLabel
        Left = 448
        Top = 10
        Width = 412
        Height = 29
        Size.Values = (
          61.383333333333330000
          948.266666666666700000
          21.166666666666670000
          872.066666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Sales By Invoice Number - Run Date: '
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
      object QRLabel1: TQRLabel
        Left = 0
        Top = 131
        Width = 33
        Height = 19
        Size.Values = (
          40.216666666666670000
          0.000000000000000000
          277.283333333333300000
          69.850000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Order'
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
        Left = 70
        Top = 113
        Width = 70
        Height = 19
        Size.Values = (
          40.216666666666670000
          148.166666666666700000
          239.183333333333300000
          148.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer &'
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
      object QRLabel3: TQRLabel
        Left = 333
        Top = 113
        Width = 40
        Height = 19
        Size.Values = (
          40.216666666666670000
          704.850000000000000000
          239.183333333333300000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Invoice'
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
        Left = 545
        Top = 131
        Width = 74
        Height = 19
        Size.Values = (
          40.216666666666670000
          1153.583333333333000000
          277.283333333333300000
          156.633333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Selling Price'
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
        Left = 70
        Top = 131
        Width = 104
        Height = 19
        Size.Values = (
          40.216666666666670000
          148.166666666666700000
          277.283333333333300000
          220.133333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Description of Job'
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
        Left = 690
        Top = 131
        Width = 26
        Height = 19
        Size.Values = (
          40.216666666666670000
          1460.500000000000000000
          277.283333333333300000
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
      object QRLabel8: TQRLabel
        Left = 790
        Top = 131
        Width = 29
        Height = 19
        Size.Values = (
          40.216666666666670000
          1672.166666666667000000
          277.283333333333300000
          61.383333333333330000)
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
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel10: TQRLabel
        Left = 921
        Top = 131
        Width = 62
        Height = 19
        Size.Values = (
          40.216666666666670000
          1949.450000000000000000
          277.283333333333300000
          131.233333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cost Price'
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
        Left = 1197
        Top = 131
        Width = 86
        Height = 19
        Size.Values = (
          40.216666666666670000
          2533.650000000000000000
          277.283333333333300000
          182.033333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Supplier Name'
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
        Left = 582
        Top = 39
        Width = 145
        Height = 21
        Size.Values = (
          44.450000000000000000
          1231.900000000000000000
          82.550000000000000000
          306.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'For Invoices Dated from: '
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
        Left = 840
        Top = 131
        Width = 47
        Height = 19
        Size.Values = (
          40.216666666666670000
          1778.000000000000000000
          277.283333333333300000
          99.483333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Inv Date'
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
      object QRLabel15: TQRLabel
        Left = 333
        Top = 131
        Width = 46
        Height = 19
        Size.Values = (
          40.216666666666670000
          704.850000000000000000
          277.283333333333300000
          97.366666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Number'
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
      object QRLabel16: TQRLabel
        Left = 395
        Top = 113
        Width = 49
        Height = 19
        Size.Values = (
          40.216666666666670000
          836.083333333333300000
          239.183333333333300000
          103.716666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Account'
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
      object QRLabel17: TQRLabel
        Left = 395
        Top = 131
        Width = 31
        Height = 19
        Size.Values = (
          40.216666666666670000
          836.083333333333300000
          277.283333333333300000
          65.616666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Code'
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
      object MarginQRLabel: TQRLabel
        Left = 1044
        Top = 131
        Width = 40
        Height = 19
        Size.Values = (
          40.216666666666670000
          2209.800000000000000000
          277.283333333333300000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Margin'
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
      object QRLabel19: TQRLabel
        Left = 1014
        Top = 113
        Width = 70
        Height = 19
        Size.Values = (
          40.216666666666670000
          2146.300000000000000000
          239.183333333333300000
          148.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Gross Profit'
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
        Left = 1122
        Top = 115
        Width = 71
        Height = 35
        Size.Values = (
          74.083333333333330000
          2375.958333333333000000
          243.416666666666700000
          150.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Purchase Inv Rec'#39'd'
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
        Left = 1235
        Top = 10
        Width = 68
        Height = 21
        Size.Values = (
          44.450000000000000000
          2614.083333333333000000
          21.166666666666670000
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
      object QRSysData1: TQRSysData
        Left = 1218
        Top = 36
        Width = 84
        Height = 19
        Size.Values = (
          40.216666666666670000
          2578.100000000000000000
          76.200000000000000000
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
      object qrlblTotalBy: TQRLabel
        Left = 640
        Top = 59
        Width = 29
        Height = 19
        Size.Values = (
          40.216666666666670000
          1354.666666666667000000
          124.883333333333300000
          61.383333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Total'
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
      object qrlblBasedOnSubReps: TQRLabel
        Left = 596
        Top = 79
        Width = 117
        Height = 19
        Size.Values = (
          40.216666666666670000
          1261.533333333333000000
          167.216666666666700000
          247.650000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Based on Sub-Reps'
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
        Left = 485
        Top = 131
        Width = 50
        Height = 19
        Size.Values = (
          40.216666666666670000
          1026.583333333333000000
          277.283333333333300000
          105.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Quantity'
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
    object QRSubDetail1: TQRSubDetail
      Left = 47
      Top = 233
      Width = 1309
      Height = 35
      AfterPrint = QRSubDetail1AfterPrint
      AlignToBottom = False
      BeforePrint = QRSubDetail1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        74.083333333333330000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qckrpSalesByInv
      DataSet = qrySalesbyInv
      PrintBefore = False
      PrintIfEmpty = True
      object qrdbtxtPOLine: TQRDBText
        Left = 0
        Top = 0
        Width = 63
        Height = 21
        Size.Values = (
          44.450000000000000000
          0.000000000000000000
          0.000000000000000000
          133.350000000000000000)
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
      object qrdbtxtAccCode: TQRDBText
        Left = 395
        Top = 0
        Width = 86
        Height = 21
        Size.Values = (
          44.450000000000000000
          836.083333333333300000
          0.000000000000000000
          182.033333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySalesbyInv
        DataField = 'Account_Code'
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
      object qrdbtxtGoodsValue: TQRDBText
        Left = 534
        Top = 0
        Width = 85
        Height = 21
        Size.Values = (
          44.450000000000000000
          1130.300000000000000000
          0.000000000000000000
          179.916666666666700000)
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
      object qrdbtxtGoodsVAT: TQRDBText
        Left = 654
        Top = 0
        Width = 66
        Height = 21
        Size.Values = (
          44.450000000000000000
          1384.300000000000000000
          0.000000000000000000
          139.700000000000000000)
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
      object qrdbtxtGoodsTotal: TQRDBText
        Left = 741
        Top = 0
        Width = 80
        Height = 21
        Size.Values = (
          44.450000000000000000
          1568.450000000000000000
          0.000000000000000000
          169.333333333333300000)
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
      object qrdbtxtInvDate: TQRDBText
        Left = 840
        Top = 0
        Width = 74
        Height = 21
        Size.Values = (
          44.450000000000000000
          1778.000000000000000000
          0.000000000000000000
          156.633333333333300000)
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
      object qrdbtxtSupplier: TQRDBText
        Left = 1196
        Top = 0
        Width = 85
        Height = 21
        Size.Values = (
          44.450000000000000000
          2531.533333333333000000
          0.000000000000000000
          179.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySalesbyInv
        DataField = 'Supplier_Desc'
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
      object TotCstQRLbl: TQRLabel
        Left = 915
        Top = 0
        Width = 72
        Height = 21
        Size.Values = (
          44.979166666666670000
          1936.750000000000000000
          0.000000000000000000
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
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object MargQRLbl: TQRLabel
        Left = 1004
        Top = 0
        Width = 81
        Height = 21
        Size.Values = (
          44.979166666666670000
          2124.604166666667000000
          0.000000000000000000
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
      object lblDescription: TQRLabel
        Left = 70
        Top = 0
        Width = 261
        Height = 21
        Size.Values = (
          44.979166666666670000
          148.166666666666700000
          0.000000000000000000
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
      object qrlblPONumber: TQRLabel
        Left = 1196
        Top = 20
        Width = 89
        Height = 21
        Size.Values = (
          44.450000000000000000
          2531.533333333333000000
          42.333333333333330000
          188.383333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblPONumber'
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
      object InvCostQrLbl: TQRLabel
        Left = 1113
        Top = 0
        Width = 72
        Height = 21
        Size.Values = (
          44.979166666666670000
          2354.791666666667000000
          0.000000000000000000
          153.458333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'InvCostQrLbl'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRDBText2: TQRDBText
        Left = 334
        Top = 0
        Width = 59
        Height = 21
        Size.Values = (
          44.450000000000000000
          706.966666666666700000
          0.000000000000000000
          124.883333333333300000)
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
        Left = 484
        Top = 0
        Width = 50
        Height = 21
        Size.Values = (
          44.450000000000000000
          1024.466666666667000000
          0.000000000000000000
          105.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySalesbyInv
        DataField = 'Quantity'
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
    object QRBand1: TQRBand
      Left = 47
      Top = 268
      Width = 1309
      Height = 50
      AfterPrint = QRBand1AfterPrint
      AlignToBottom = False
      BeforePrint = QRBand1BeforePrint
      Enabled = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRLabel18: TQRLabel
        Left = 450
        Top = 10
        Width = 39
        Height = 25
        Size.Values = (
          52.916666666666670000
          952.500000000000000000
          21.166666666666670000
          82.550000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
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
      object TotalSellLbl: TQRLabel
        Left = 542
        Top = 10
        Width = 78
        Height = 25
        Size.Values = (
          52.916666666666670000
          1147.233333333333000000
          21.166666666666670000
          165.100000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalSellLbl'
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
      object TotalVatlbl: TQRLabel
        Left = 650
        Top = 10
        Width = 70
        Height = 25
        Size.Values = (
          52.916666666666670000
          1375.833333333333000000
          21.166666666666670000
          148.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalVatlbl'
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
      object TotalGoodsLbl: TQRLabel
        Left = 729
        Top = 10
        Width = 93
        Height = 25
        Size.Values = (
          52.916666666666670000
          1543.050000000000000000
          21.166666666666670000
          196.850000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalGoodsLbl'
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
        Left = 450
        Top = 0
        Width = 401
        Height = 11
        Size.Values = (
          23.812500000000000000
          952.500000000000000000
          0.000000000000000000
          849.312499999999900000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object TotalCostLbl: TQRLabel
        Left = 894
        Top = 10
        Width = 93
        Height = 25
        Size.Values = (
          52.916666666666670000
          1892.300000000000000000
          21.166666666666670000
          196.850000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalGoodsLbl'
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
      object QRShape3: TQRShape
        Left = 900
        Top = 0
        Width = 291
        Height = 11
        Size.Values = (
          23.812500000000000000
          1905.000000000000000000
          0.000000000000000000
          616.479166666666800000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object GrpMargQRLbl: TQRLabel
        Left = 1004
        Top = 10
        Width = 81
        Height = 21
        Size.Values = (
          44.979166666666670000
          2124.604166666667000000
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
      object TotalInvCostlbl: TQRLabel
        Left = 1106
        Top = 10
        Width = 79
        Height = 25
        Size.Values = (
          52.916666666666670000
          2341.033333333333000000
          21.166666666666670000
          167.216666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalInvCost'
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
    object RepQRGroup: TQRGroup
      Left = 47
      Top = 201
      Width = 1309
      Height = 32
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        67.733333333333330000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      FooterBand = QRBand1
      Master = QRSubDetail1
      ReprintOnNewPage = False
      object GrpByQRDBText: TQRDBText
        Left = 10
        Top = 10
        Width = 312
        Height = 21
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
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
      Left = 47
      Top = 318
      Width = 1309
      Height = 50
      AlignToBottom = False
      BeforePrint = QRBand2BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRShape2: TQRShape
        Left = 450
        Top = 3
        Width = 401
        Height = 11
        Size.Values = (
          23.812500000000000000
          952.500000000000000000
          5.291666666666667000
          849.312499999999900000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object RepTotQRLabel: TQRLabel
        Left = 450
        Top = 12
        Width = 39
        Height = 25
        Size.Values = (
          52.916666666666670000
          952.500000000000000000
          25.400000000000000000
          82.550000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
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
      object RepTotSellQRLbl: TQRLabel
        Left = 542
        Top = 12
        Width = 78
        Height = 25
        Size.Values = (
          52.916666666666670000
          1147.233333333333000000
          25.400000000000000000
          165.100000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalSellLbl'
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
      object RepTotVatQRLbl: TQRLabel
        Left = 650
        Top = 12
        Width = 70
        Height = 25
        Size.Values = (
          52.916666666666670000
          1375.833333333333000000
          25.400000000000000000
          148.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalVatlbl'
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
      object RepTotGoodsQRLbl: TQRLabel
        Left = 731
        Top = 12
        Width = 93
        Height = 25
        Size.Values = (
          52.916666666666670000
          1547.283333333333000000
          25.400000000000000000
          196.850000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalGoodsLbl'
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
      object RepTotCostQRLbl: TQRLabel
        Left = 894
        Top = 12
        Width = 93
        Height = 25
        Size.Values = (
          52.916666666666670000
          1892.300000000000000000
          25.400000000000000000
          196.850000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalGoodsLbl'
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
      object QRShape4: TQRShape
        Left = 916
        Top = 3
        Width = 275
        Height = 11
        Size.Values = (
          23.812500000000000000
          1939.395833333333000000
          5.291666666666667000
          582.083333333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object RepMargQRLbl: TQRLabel
        Left = 1002
        Top = 12
        Width = 81
        Height = 21
        Size.Values = (
          44.979166666666670000
          2121.958333333333000000
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
      object RepTotInvCostQrlbl: TQRLabel
        Left = 1092
        Top = 12
        Width = 93
        Height = 25
        Size.Values = (
          52.916666666666670000
          2311.400000000000000000
          25.400000000000000000
          196.850000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalGoodsLbl'
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
    Left = 208
    Top = 30
    ParamData = <
      item
        Name = 'PurchOrder'
        DataType = ftFloat
      end>
  end
  object oldGetCostsQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'SELECT Sales_Invoice_Line.Qty_Invoiced, Purchase_OrderLine.Order' +
        '_Price,'
      
        '      Purchase_OrderLine.Quantity, Price_Unit.Price_Unit_Factor ' +
        'as Order_Unit_Factor'
      
        'FROM Price_Unit INNER JOIN (Purchase_OrderLine INNER JOIN (Sales' +
        '_Invoice'
      
        '  INNER JOIN Sales_Invoice_Line ON Sales_Invoice.Sales_Invoice =' +
        ' Sales_Invoice_Line.Sales_Invoice) ON (Purchase_OrderLine.Line =' +
        ' Sales_Invoice_Line.Line) AND (Purchase_OrderLine.Purchase_Order' +
        ' = Sales_Invoice_Line.Purchase_Order)) ON (Price_Unit.Price_Unit' +
        ' = Purchase_OrderLine.Order_Unit)'
      '  WHERE (((Sales_Invoice.Sales_Invoice)=:Invoice_No));'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 320
    Top = 24
    ParamData = <
      item
        Name = 'invoice_no'
      end>
  end
  object qrySalesbyInv: TFDQuery
    OnCalcFields = qrySalesbyInvCalcFields
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT DISTINCT Sales_Invoice.Inv_to_Customer AS Customer,'
      #9'Sales_Invoice.Inv_to_Branch AS Branch_no,'
      #9'Sales_Invoice.Sales_Invoice,'
      #9'Customer_Branch.Account_Code,'
      #9'Customer.Name,'
      #9'Sales_Invoice.Sales_Invoice_No,'
      #9'Sales_Invoice.Goods_Value,'
      #9'Sales_Invoice.Vat_Value,'
      
        #9'(Sales_Invoice.Goods_Value+Sales_Invoice.VAT_Value) AS Goods_To' +
        'tal,'
      #9'Sales_Invoice.Invoice_Date,'
      #9'Sales_Invoice.Invoice_or_Credit,'
      #9'Sales_Invoice.Rep,'
      '  '#9'Sales_Invoice.Sales_Invoice_type,'
      '  '#9'Sales_Invoice.Inactive,'
      #9'Sales_Invoice.Reference,'
      #9'Sales_Invoice.Invoice_Description,'
      #9'Sales_Invoice.Cust_Order_no,'
      #9'(select Supplier.Name'
      #9'from Purchase_order, Supplier, Supplier_Branch'
      
        #9'where Purchase_Order.Purchase_Order = Sales_Invoice_Line.Purcha' +
        'se_Order and'
      #9#9'((Purchase_Order.Supplier = Supplier_Branch.Supplier) and'
      #9#9'(Purchase_Order.Branch_no = Supplier_Branch.Branch_no)) and'
      
        #9#9'(Supplier_Branch.Supplier = Supplier.Supplier)) AS Supplier_Na' +
        'me,'
      #9'Rep.Name as Rep_Name,'
      #9'Customer_Type.Customer_Type,'
      #9'Customer_Type.Description as Customer_Type_Description'
      'FROM (Customer'
      #9'INNER JOIN ((Customer_Branch'
      #9'INNER JOIN Sales_Invoice ON'
      #9#9'(Customer_Branch.Customer = Sales_Invoice.Inv_to_Customer) AND'
      #9#9'(Customer_Branch.Branch_no = Sales_Invoice.Inv_to_Branch))'
      #9'INNER JOIN Sales_Invoice_Line ON'
      
        #9#9'Sales_Invoice.Sales_Invoice = Sales_Invoice_Line.Sales_Invoice' +
        ') ON'
      #9#9'Customer.Customer = Customer_Branch.Customer)'
      #9'INNER JOIN Rep ON'
      #9#9'Sales_Invoice.Rep = Rep.Rep'
      ' ')
    Left = 80
    Top = 24
    object qrySalesbyInvCustomer: TIntegerField
      FieldName = 'Customer'
    end
    object qrySalesbyInvBranch_no: TIntegerField
      FieldName = 'Branch_no'
    end
    object qrySalesbyInvSales_Invoice: TIntegerField
      FieldName = 'Sales_Invoice'
    end
    object qrySalesbyInvAccount_Code: TWideStringField
      FieldName = 'Account_Code'
      FixedChar = True
    end
    object qrySalesbyInvName: TWideStringField
      FieldName = 'Name'
      FixedChar = True
      Size = 80
    end
    object qrySalesbyInvSales_Invoice_No: TWideStringField
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
    object qrySalesByInvInvoice_or_Credit: TWideStringField
      FieldName = 'Invoice_or_Credit'
      FixedChar = True
      Size = 2
    end
    object qrySalesbyInvRep: TIntegerField
      FieldName = 'Rep'
    end
    object qrySalesbyInvSales_Invoice_type: TWideStringField
      FieldName = 'Sales_Invoice_type'
      FixedChar = True
      Size = 2
    end
    object qrySalesbyInvInactive: TWideStringField
      FieldName = 'Inactive'
      FixedChar = True
      Size = 2
    end
    object qrySalesbyInvReference: TWideStringField
      FieldName = 'Reference'
      FixedChar = True
      Size = 120
    end
    object qrySalesbyInvSupplier_Name: TWideStringField
      FieldName = 'Supplier_Name'
      FixedChar = True
      Size = 80
    end
    object qrySalesbyInvRep_Name: TWideStringField
      FieldName = 'Rep_Name'
      FixedChar = True
      Size = 80
    end
    object qrySalesbyInvInvoiceRef: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'InvoiceRef'
      OnGetText = qrySalesbyInvInvoiceRefGetText
      Size = 10
      Calculated = True
    end
    object qrySalesbyInvInvoice_Description: TWideStringField
      FieldName = 'Invoice_Description'
      FixedChar = True
      Size = 160
    end
    object qrySalesbyInvSupplier_Desc: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'Supplier_Desc'
      OnGetText = qrySalesbyInvSupplier_DescGetText
      Size = 30
      Calculated = True
    end
    object qrySalesbyInvOrderDesc: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'OrderDesc'
      Size = 15
      Calculated = True
    end
    object qrySalesbyInvBranch_Name: TWideStringField
      FieldName = 'Branch_Name'
      Size = 80
    end
    object qrySalesbyInvCust_Order_no: TWideStringField
      FieldName = 'Cust_Order_no'
      Size = 50
    end
    object qrySalesbyInvCustomer_Type_Description: TWideStringField
      FieldName = 'Customer_Type_Description'
      Size = 50
    end
    object qrySalesbyInvAccount_Manager_Name: TWideStringField
      FieldName = 'Account_Manager_Name'
      Size = 60
    end
    object qrySalesbyInvQuantity: TFloatField
      FieldName = 'Quantity'
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
    Left = 440
    Top = 320
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
    Left = 320
    Top = 264
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
    Left = 160
    Top = 294
    ParamData = <
      item
        Name = 'Purch_Ord'
      end>
  end
  object oldqryGetJBCosts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Sales_Invoice_Line.Sales_Invoice,'
      '        Sales_Invoice_Line.Invoice_Line_No,'
      '        Sales_Invoice_Line.Purchase_Order,'
      '        Sales_Invoice_Line.Line,'
      '        Sales_invoice_Line.Qty_Invoiced,'
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
        'Line) as Extra_Cost'
      'FROM Price_Unit'
      '     RIGHT JOIN (Purchase_OrderLine'
      '     RIGHT JOIN (Job_Bag_Line_Dets'
      '     INNER JOIN Sales_Invoice_Line ON'
      
        '        (Job_Bag_Line_Dets.Job_Bag_Line = Sales_Invoice_Line.Job' +
        '_Bag_Line) AND'
      
        '        (Job_Bag_Line_Dets.Job_Bag = Sales_Invoice_Line.Job_Bag)' +
        ') ON'
      '        (Purchase_OrderLine.Line = Job_Bag_Line_Dets.Line) AND'
      
        '        (Purchase_OrderLine.Purchase_Order = Job_Bag_Line_Dets.P' +
        'urchase_Order)) ON'
      '        Price_Unit.Price_Unit = Purchase_OrderLine.Order_Unit'
      'WHERE Sales_Invoice = :Sales_Invoice'
      ''
      '')
    Left = 320
    Top = 312
    ParamData = <
      item
        Name = 'Sales_Invoice'
      end>
  end
  object qryCreditLines: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Sales_Invoice_Line.Sales_Invoice,'
      '        Sales_Invoice_Line.Invoice_Line_No,'
      '        Sales_Invoice_Line.Qty_Invoiced,'
      '        Sales_Invoice_Line.Price_Unit,'
      '        Price_Unit.Price_Unit_Factor as Invoice_Unit_Factor,'
      '        Sales_Invoice_Line.Cost_Price,'
      '        Sales_Invoice_Line.Purchase_order,'
      '        Sales_Invoice_Line.Line,'
      '        Sales_Invoice_Line.Sales_Order,'
      '        Sales_Invoice_Line.Sales_Order_line_no,'
      '        Sales_Invoice_Line.Job_Bag,'
      '        Sales_Invoice_Line.Job_bag_Line,'
      '        Sales_Invoice_Line.Credit_Type'
      'FROM Price_Unit'
      '      INNER JOIN Sales_Invoice_Line ON'
      '        Price_Unit.Price_Unit = Sales_Invoice_Line.Price_Unit'
      'WHERE Sales_invoice_Line.Sales_invoice = :Sales_invoice'
      ' '
      ' '
      ' ')
    Left = 78
    Top = 246
    ParamData = <
      item
        Name = 'Sales_invoice'
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
    Left = 556
    Top = 264
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
    Left = 538
    Top = 6
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
    Left = 320
    Top = 200
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
    Left = 680
    Top = 336
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
    Left = 762
    Top = 30
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
    Left = 74
    Top = 296
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
      #9'Price_Unit.Price_Unit_Factor AS Order_Unit_Factor,'
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
    Left = 400
    Top = 24
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
      '        Job_Bag_Line_Dets.Line_Is_Internal_Cost,'
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
      'WHERE (Sales_Invoice_Line.Sales_Invoice = :Sales_Invoice) AND'
      
        '      ((Job_Bag_Line_Dets.Line_Is_Internal_Cost = :Line_Is_Inter' +
        'nal_Cost) OR'
      
        '      ((Job_Bag_Line_Dets.Line_Is_Internal_Cost = '#39'N'#39') OR (Job_B' +
        'ag_Line_Dets.Line_Is_Internal_Cost IS NULL)))'
      
        'ORDER BY Sales_Invoice_Line.sales_invoice, Sales_Invoice_Line.in' +
        'voice_line_no'
      '')
    Left = 320
    Top = 360
    ParamData = <
      item
        Name = 'Sales_Invoice'
      end
      item
        Name = 'Line_Is_Internal_Cost'
      end>
  end
  object qryGetJobBag: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'SELECT Pack_Format.Pack_Format_Description, Job_Bag.Enclosing_Ty' +
        'pe'
      'FROM Job_Bag, Pack_Format'
      'WHERE (Job_Bag.Job_Bag = :Job_Bag) AND'
      '      (Job_Bag.Pack_Format_ID = Pack_Format.ID)'
      '')
    Left = 544
    Top = 416
    ParamData = <
      item
        Name = 'Job_Bag'
      end>
  end
end
