object PBRPSalesByPrdCatDetFrm: TPBRPSalesByPrdCatDetFrm
  Left = 113
  Top = 118
  Caption = 'Sales Order By Product Category Report Print Preview'
  ClientHeight = 530
  ClientWidth = 1099
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Scaled = False
  OnCreate = FormCreate
  TextHeight = 13
  object qckrpSalesByPrdCat: TQuickRep
    Left = -8
    Top = 8
    Width = 1403
    Height = 992
    ShowingPreview = False
    BeforePrint = qckrpSalesByPrdCatBeforePrint
    DataSet = qrySalesbyPrdCat
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
      Height = 114
      Frame.DrawBottom = True
      AfterPrint = qrbndPageHeaderAfterPrint
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        241.300000000000000000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object qrlblTitle: TQRLabel
        Left = 441
        Top = 10
        Width = 426
        Height = 29
        Size.Values = (
          61.383333333333330000
          933.450000000000000000
          21.166666666666670000
          901.700000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Sales By Product Category- Run Date: '
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
        Left = 550
        Top = 70
        Width = 43
        Height = 21
        Size.Values = (
          44.450000000000000000
          1164.166666666667000000
          148.166666666666700000
          91.016666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Order'
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
        Left = 150
        Top = 70
        Width = 87
        Height = 21
        Size.Values = (
          44.450000000000000000
          317.500000000000000000
          148.166666666666700000
          184.150000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer &'
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
        Left = 14
        Top = 70
        Width = 53
        Height = 21
        Size.Values = (
          44.450000000000000000
          29.633333333333330000
          148.166666666666700000
          112.183333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Invoice'
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
        Left = 710
        Top = 70
        Width = 49
        Height = 21
        Size.Values = (
          44.450000000000000000
          1502.833333333333000000
          148.166666666666700000
          103.716666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Selling'
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
        Left = 150
        Top = 90
        Width = 135
        Height = 21
        Size.Values = (
          44.450000000000000000
          317.500000000000000000
          190.500000000000000000
          285.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Description of Job'
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
        Left = 720
        Top = 90
        Width = 40
        Height = 21
        Size.Values = (
          44.450000000000000000
          1524.000000000000000000
          190.500000000000000000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Price'
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
      object QRLabel7: TQRLabel
        Left = 807
        Top = 70
        Width = 32
        Height = 21
        Size.Values = (
          44.450000000000000000
          1708.150000000000000000
          148.166666666666700000
          67.733333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'VAT'
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
      object QRLabel8: TQRLabel
        Left = 890
        Top = 70
        Width = 35
        Height = 21
        Size.Values = (
          44.450000000000000000
          1883.833333333333000000
          148.166666666666700000
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
        Left = 938
        Top = 70
        Width = 78
        Height = 21
        Size.Values = (
          44.450000000000000000
          1985.433333333333000000
          148.166666666666700000
          165.100000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cost Price'
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
        Left = 1128
        Top = 90
        Width = 108
        Height = 21
        Size.Values = (
          44.450000000000000000
          2387.600000000000000000
          190.500000000000000000
          228.600000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Supplier Name'
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
      object qrlblDateRange: TQRLabel
        Left = 561
        Top = 40
        Width = 187
        Height = 21
        Size.Values = (
          44.450000000000000000
          1187.450000000000000000
          84.666666666666670000
          395.816666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'For Invoices Dated from: '
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
      object QRSysData1: TQRSysData
        Left = 1219
        Top = 10
        Width = 84
        Height = 21
        Size.Values = (
          44.450000000000000000
          2580.216666666667000000
          21.166666666666670000
          177.800000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
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
      object QRLabel14: TQRLabel
        Left = 80
        Top = 90
        Width = 61
        Height = 21
        Size.Values = (
          44.450000000000000000
          169.333333333333300000
          190.500000000000000000
          129.116666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Inv Date'
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
        Left = 10
        Top = 90
        Width = 58
        Height = 21
        Size.Values = (
          44.450000000000000000
          21.166666666666670000
          190.500000000000000000
          122.766666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Number'
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
      object QRLabel16: TQRLabel
        Left = 455
        Top = 70
        Width = 61
        Height = 21
        Size.Values = (
          44.450000000000000000
          963.083333333333300000
          148.166666666666700000
          129.116666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Account'
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
      object QRLabel17: TQRLabel
        Left = 455
        Top = 90
        Width = 40
        Height = 21
        Size.Values = (
          44.450000000000000000
          963.083333333333300000
          190.500000000000000000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Code'
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
      object MarginQRLabel: TQRLabel
        Left = 1066
        Top = 90
        Width = 51
        Height = 21
        Size.Values = (
          44.450000000000000000
          2256.366666666667000000
          190.500000000000000000
          107.950000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Margin'
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
      object QRLabel19: TQRLabel
        Left = 1028
        Top = 70
        Width = 88
        Height = 21
        Size.Values = (
          44.450000000000000000
          2175.933333333333000000
          148.166666666666700000
          186.266666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Gross Profit'
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
      object QRlblQty: TQRLabel
        Left = 620
        Top = 70
        Width = 61
        Height = 21
        Size.Values = (
          44.450000000000000000
          1312.333333333333000000
          148.166666666666700000
          129.116666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Quantity'
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
    object QRSubDetail1: TQRSubDetail
      Left = 47
      Top = 193
      Width = 1309
      Height = 35
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
      Master = qckrpSalesByPrdCat
      DataSet = qrySalesbyPrdCat
      PrintBefore = False
      PrintIfEmpty = True
      object qrdbtxtPOLine: TQRDBText
        Left = 550
        Top = 0
        Width = 63
        Height = 21
        Size.Values = (
          44.450000000000000000
          1164.166666666667000000
          0.000000000000000000
          133.350000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySalesbyPrdCat
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
        Left = 455
        Top = 0
        Width = 86
        Height = 21
        Size.Values = (
          44.450000000000000000
          963.083333333333300000
          0.000000000000000000
          182.033333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySalesbyPrdCat
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
      object qrdbtxtInvDate: TQRDBText
        Left = 65
        Top = 0
        Width = 74
        Height = 21
        Size.Values = (
          44.450000000000000000
          137.583333333333300000
          0.000000000000000000
          156.633333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySalesbyPrdCat
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
      object QRDBText2: TQRDBText
        Left = -6
        Top = 0
        Width = 59
        Height = 21
        Size.Values = (
          44.450000000000000000
          -12.700000000000000000
          0.000000000000000000
          124.883333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySalesbyPrdCat
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
      object lblCstmr: TQRLabel
        Left = 150
        Top = 0
        Width = 301
        Height = 21
        Size.Values = (
          44.979166666666700000
          317.500000000000000000
          0.000000000000000000
          637.645833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'lblCstmr'
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
    object QRBand1: TQRBand
      Left = 47
      Top = 334
      Width = 1309
      Height = 50
      AfterPrint = QRBand1AfterPrint
      AlignToBottom = False
      BeforePrint = QRBand1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      LinkBand = QRSbDtlInvTot
      Size.Values = (
        105.833333333333300000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object qrlblCategory: TQRLabel
        Left = 545
        Top = 10
        Width = 39
        Height = 19
        Size.Values = (
          40.216666666666670000
          1153.583333333333000000
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
      object TotalSellLbl: TQRLabel
        Left = 683
        Top = 10
        Width = 78
        Height = 19
        Size.Values = (
          40.216666666666670000
          1445.683333333333000000
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
        Left = 770
        Top = 10
        Width = 70
        Height = 19
        Size.Values = (
          40.216666666666670000
          1629.833333333333000000
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
        Left = 834
        Top = 10
        Width = 93
        Height = 19
        Size.Values = (
          40.216666666666670000
          1765.300000000000000000
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
        Left = 560
        Top = 0
        Width = 371
        Height = 11
        Size.Values = (
          23.812500000000000000
          1185.333333333330000000
          0.000000000000000000
          785.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object TotalCostLbl: TQRLabel
        Left = 924
        Top = 10
        Width = 93
        Height = 19
        Size.Values = (
          40.216666666666670000
          1955.800000000000000000
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
        Left = 912
        Top = 0
        Width = 205
        Height = 11
        Size.Values = (
          23.812500000000000000
          1931.458333333330000000
          0.000000000000000000
          433.916666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object GrpMargQRLbl: TQRLabel
        Left = 1022
        Top = 10
        Width = 95
        Height = 19
        Size.Values = (
          40.216666666666670000
          2163.233333333333000000
          21.166666666666670000
          201.083333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
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
    end
    object RepQRGroup: TQRGroup
      Left = 47
      Top = 161
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
      Expression = 'qrySalesbyPrdCat.Description'
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
        DataSet = qrySalesbyPrdCat
        DataField = 'Description'
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
      Top = 384
      Width = 1309
      Height = 50
      AlignToBottom = False
      BeforePrint = QRBand2BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      LinkBand = QRBand1
      Size.Values = (
        105.833333333333300000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRShape2: TQRShape
        Left = 560
        Top = 3
        Width = 371
        Height = 11
        Size.Values = (
          23.812500000000000000
          1185.333333333330000000
          5.291666666666670000
          785.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object RepTotQRLabel: TQRLabel
        Left = 540
        Top = 12
        Width = 39
        Height = 19
        Size.Values = (
          40.216666666666670000
          1143.000000000000000000
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
        Left = 683
        Top = 12
        Width = 78
        Height = 19
        Size.Values = (
          40.216666666666670000
          1445.683333333333000000
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
        Left = 770
        Top = 12
        Width = 70
        Height = 19
        Size.Values = (
          40.216666666666670000
          1629.833333333333000000
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
        Left = 834
        Top = 12
        Width = 93
        Height = 19
        Size.Values = (
          40.216666666666670000
          1765.300000000000000000
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
        Left = 924
        Top = 12
        Width = 93
        Height = 19
        Size.Values = (
          40.216666666666670000
          1955.800000000000000000
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
        Left = 911
        Top = 3
        Width = 205
        Height = 11
        Size.Values = (
          23.812500000000000000
          1928.812500000000000000
          5.291666666666670000
          433.916666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object RepMargQRLbl: TQRLabel
        Left = 1021
        Top = 12
        Width = 97
        Height = 19
        Size.Values = (
          40.216666666666670000
          2161.116666666667000000
          25.400000000000000000
          205.316666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
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
    end
    object QRSubDetInvlns: TQRSubDetail
      Left = 47
      Top = 228
      Width = 1309
      Height = 25
      AfterPrint = QRSubDetInvlnsAfterPrint
      AlignToBottom = False
      BeforePrint = QRSubDetInvlnsBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.916666666666670000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = QRSubDetail1
      DataSet = qrygetinvline
      PrintBefore = False
      PrintIfEmpty = True
      object QRLblGoods: TQRLabel
        Left = 687
        Top = 0
        Width = 75
        Height = 21
        Size.Values = (
          44.450000000000000000
          1454.150000000000000000
          0.000000000000000000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'QRLblGoods'
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
      object QRLblVat: TQRLabel
        Left = 782
        Top = 0
        Width = 57
        Height = 21
        Size.Values = (
          44.450000000000000000
          1655.233333333333000000
          0.000000000000000000
          120.650000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'QRLblVat'
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
      object QRLblTot: TQRLabel
        Left = 874
        Top = 0
        Width = 55
        Height = 21
        Size.Values = (
          44.450000000000000000
          1849.966666666667000000
          0.000000000000000000
          116.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'QRLblTot'
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
      object LblDesc: TQRLabel
        Left = 150
        Top = 0
        Width = 301
        Height = 21
        Size.Values = (
          44.979166666666700000
          317.500000000000000000
          0.000000000000000000
          637.645833333333000000)
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
      object QtyInvoicedLbl: TQRLabel
        Left = 596
        Top = 0
        Width = 85
        Height = 24
        Size.Values = (
          50.800000000000000000
          1261.533333333333000000
          0.000000000000000000
          179.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'QtyInvoicedLbl'
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
      object qrlblSupplier: TQRLabel
        Left = 1126
        Top = 0
        Width = 186
        Height = 21
        Size.Values = (
          44.979166666666700000
          2383.895833333330000000
          0.000000000000000000
          394.229166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlblSupplier'
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
      object TotCstQRLbl: TQRLabel
        Left = 942
        Top = -1
        Width = 75
        Height = 21
        Size.Values = (
          44.450000000000000000
          1993.900000000000000000
          -2.116666666666667000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotCstQRLbl'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
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
        Left = 1052
        Top = 0
        Width = 66
        Height = 21
        Size.Values = (
          44.450000000000000000
          2226.733333333333000000
          0.000000000000000000
          139.700000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'MargQRLbl'
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
      object qrlblOrderNo: TQRLabel
        Left = 519
        Top = 0
        Width = 73
        Height = 24
        Size.Values = (
          50.800000000000000000
          1098.550000000000000000
          0.000000000000000000
          154.516666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblOrderNo'
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
    object QRSbDtlChrg: TQRSubDetail
      Left = 47
      Top = 253
      Width = 1309
      Height = 25
      AfterPrint = QRSbDtlChrgAfterPrint
      AlignToBottom = False
      BeforePrint = QRSbDtlChrgBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      LinkBand = QRSubDetInvlns
      Size.Values = (
        52.916666666666670000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = QRSubDetail1
      DataSet = qryInvCharges
      PrintBefore = False
      PrintIfEmpty = True
      object QRLblChrg: TQRLabel
        Left = 697
        Top = 0
        Width = 64
        Height = 21
        Size.Values = (
          44.450000000000000000
          1475.316666666667000000
          0.000000000000000000
          135.466666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'QRLblChrg'
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
      object QRLblChrgVat: TQRLabel
        Left = 775
        Top = 0
        Width = 64
        Height = 21
        Size.Values = (
          44.450000000000000000
          1640.416666666667000000
          0.000000000000000000
          135.466666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'QRLblChrg'
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
      object QRLblChrgTot: TQRLabel
        Left = 865
        Top = 0
        Width = 64
        Height = 21
        Size.Values = (
          44.450000000000000000
          1830.916666666667000000
          0.000000000000000000
          135.466666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'QRLblChrg'
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
        Left = 150
        Top = 0
        Width = 361
        Height = 21
        Size.Values = (
          44.979166666666670000
          317.500000000000000000
          0.000000000000000000
          764.645833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = qryInvCharges
        DataField = 'Details'
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
      object qrlblChrgCost: TQRLabel
        Left = 967
        Top = 0
        Width = 52
        Height = 21
        Size.Values = (
          44.450000000000000000
          2046.816666666667000000
          0.000000000000000000
          110.066666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblChrg'
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
      object qrlblChrgMarg: TQRLabel
        Left = 1067
        Top = 0
        Width = 52
        Height = 21
        Size.Values = (
          44.450000000000000000
          2258.483333333333000000
          0.000000000000000000
          110.066666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblChrg'
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
    object QRSbDtlInvTot: TQRSubDetail
      Left = 47
      Top = 278
      Width = 1309
      Height = 56
      AfterPrint = QRSbDtlInvTotAfterPrint
      AlignToBottom = False
      BeforePrint = QRSbDtlInvTotBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      LinkBand = QRSbDtlChrg
      Size.Values = (
        118.533333333333300000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = QRSubDetail1
      PrintBefore = False
      PrintIfEmpty = True
      object QRShape5: TQRShape
        Left = 655
        Top = 0
        Width = 462
        Height = 12
        Size.Values = (
          26.458333333333300000
          1386.416666666670000000
          0.000000000000000000
          978.958333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLblInvTotCst: TQRLabel
        Left = 938
        Top = 19
        Width = 79
        Height = 19
        Size.Values = (
          40.216666666666670000
          1985.433333333333000000
          40.216666666666670000
          167.216666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
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
      object QRLblInvTotMarg: TQRLabel
        Left = 1045
        Top = 20
        Width = 72
        Height = 19
        Size.Values = (
          40.216666666666670000
          2211.916666666667000000
          42.333333333333330000
          152.400000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
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
      object QRLblInvGoods: TQRLabel
        Left = 828
        Top = 19
        Width = 99
        Height = 19
        Size.Values = (
          40.216666666666670000
          1752.600000000000000000
          40.216666666666670000
          209.550000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'QRLblInvGoods'
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
      object QRLblInvVat: TQRLabel
        Left = 758
        Top = 19
        Width = 80
        Height = 19
        Size.Values = (
          40.216666666666670000
          1604.433333333333000000
          40.216666666666670000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'QRLblInvVat'
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
      object QRLblInvSell: TQRLabel
        Left = 673
        Top = 19
        Width = 84
        Height = 19
        Size.Values = (
          40.216666666666670000
          1424.516666666667000000
          40.216666666666670000
          177.800000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'QRLblInvSell'
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
    end
  end
  object AddCostsQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select sum(Amount) as Add_Cost'
      'from Purch_Ord_line_add_chg'
      '  where (Purch_Ord_Line_Add_Chg.Purchase_Order = :PurchOrder)'
      ''
      ' '
      ' '
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
  object GetCostsQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'SELECT Sales_Invoice_Line.Qty_Invoiced, Purchase_OrderLine.Order' +
        '_Price,'
      
        '      Purchase_OrderLine.Quantity, Price_Unit.Price_Unit_Factor ' +
        'as Order_Unit_Factor'
      
        'FROM Price_Unit INNER JOIN (Purchase_OrderLine INNER JOIN (Sales' +
        '_Invoice'
      
        '  INNER JOIN Sales_Invoice_Line ON Sales_Invoice.Sales_Invoice =' +
        ' Sales_Invoice_Line.Sales_Invoice) ON'
      
        '  (Purchase_OrderLine.Line = Sales_Invoice_Line.Line) AND (Purch' +
        'ase_OrderLine.Purchase_Order = Sales_Invoice_Line.Purchase_Order' +
        ')) ON (Price_Unit.Price_Unit = Purchase_OrderLine.Order_Unit)'
      
        '  WHERE (((Sales_Invoice.Sales_Invoice)=:Invoice_No) and (Invoic' +
        'e_Line_No = :Line_No));'
      ''
      ' '
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
      end
      item
        Name = 'Line_No'
      end>
  end
  object qrySalesbyPrdCat: TFDQuery
    OnCalcFields = qrySalesbyPrdCatCalcFields
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT DISTINCT Sales_Invoice.Inv_to_Customer AS Customer,'
      
        'Sales_Invoice.Inv_to_Branch AS Branch_no, Sales_Invoice.Sales_In' +
        'voice,'
      
        'Customer_Branch.Account_Code, Customer.Name, Sales_Invoice.Sales' +
        '_Invoice_No,'
      'Sales_Invoice.Goods_Value, Sales_Invoice.Vat_Value,'
      
        '(Sales_Invoice.Goods_Value+Sales_Invoice.VAT_Value) AS Goods_Tot' +
        'al,'
      'Sales_Invoice_Line.Invoice_Line_No, Sales_Invoice.Invoice_Date,'
      
        'Sales_Invoice.Invoice_or_Credit, Sales_Invoice.Rep, Sales_Invoic' +
        'e.Sales_invoice_type,'
      'Sales_Invoice.Inactive, Sales_Invoice.Reference,'
      'Sales_Invoice.Invoice_Description, (select Supplier.Name'
      #9'from Purchase_order, Supplier, Supplier_Branch'
      
        #9'where Purchase_Order.Purchase_Order = Sales_Invoice_Line.Purcha' +
        'se_Order and'
      #9#9'((Purchase_Order.Supplier = Supplier_Branch.Supplier) and'
      #9#9'(Purchase_Order.Branch_no = Supplier_Branch.Branch_no)) and'
      
        #9#9'(Supplier_Branch.Supplier = Supplier.Supplier)) AS Supplier_Na' +
        'me,'
      '    Rep.Name AS Rep_Name, Product_Type.Description'
      
        'FROM Product_Type INNER JOIN (Customer INNER JOIN (((Customer_Br' +
        'anch'
      
        'INNER JOIN Sales_Invoice ON (Customer_Branch.Customer = Sales_In' +
        'voice.Inv_to_Customer)'
      ' AND (Customer_Branch.Branch_no = Sales_Invoice.Inv_to_Branch))'
      ' INNER JOIN Rep ON Sales_Invoice.Rep = Rep.Rep)'
      ' INNER JOIN Sales_Invoice_Line'
      
        ' ON Sales_Invoice.Sales_Invoice = Sales_Invoice_Line.Sales_Invoi' +
        'ce)'
      ' ON Customer.Customer = Customer_Branch.Customer)'
      ' ON Product_Type.Product_Type = Sales_Invoice_Line.Product_Type'
      ''
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
    Left = 184
    Top = 88
    object qrySalesbyPrdCatCustomer: TIntegerField
      FieldName = 'Customer'
    end
    object qrySalesbyPrdCatBranch_no: TIntegerField
      FieldName = 'Branch_no'
    end
    object qrySalesbyPrdCatSales_Invoice: TIntegerField
      FieldName = 'Sales_Invoice'
    end
    object qrySalesbyPrdCatAccount_Code: TWideStringField
      FieldName = 'Account_Code'
      FixedChar = True
    end
    object qrySalesbyPrdCatName: TWideStringField
      FieldName = 'Name'
      FixedChar = True
      Size = 80
    end
    object qrySalesbyPrdCatSales_Invoice_No: TWideStringField
      FieldName = 'Sales_Invoice_No'
      FixedChar = True
      Size = 30
    end
    object qrySalesbyPrdCatGoods_Value: TCurrencyField
      FieldName = 'Goods_Value'
    end
    object qrySalesbyPrdCatVat_Value: TCurrencyField
      FieldName = 'Vat_Value'
    end
    object qrySalesbyPrdCatGoods_Total: TCurrencyField
      FieldName = 'Goods_Total'
    end
    object qrySalesbyPrdCatInvoice_Date: TDateTimeField
      FieldName = 'Invoice_Date'
    end
    object qrySalesbyPrdCatInvoice_or_Credit: TWideStringField
      FieldName = 'Invoice_or_Credit'
      FixedChar = True
      Size = 2
    end
    object qrySalesbyPrdCatRep: TIntegerField
      FieldName = 'Rep'
    end
    object qrySalesbyPrdCatSales_Invoice_type: TWideStringField
      FieldName = 'Sales_Invoice_type'
      FixedChar = True
      Size = 2
    end
    object qrySalesbyPrdCatInactive: TWideStringField
      FieldName = 'Inactive'
      FixedChar = True
      Size = 2
    end
    object qrySalesbyPrdCatReference: TWideStringField
      FieldName = 'Reference'
      FixedChar = True
      Size = 120
    end
    object qrySalesbyPrdCatSupplier_Name: TWideStringField
      FieldName = 'Supplier_Name'
      FixedChar = True
      Size = 80
    end
    object qrySalesbyPrdCatRep_Name: TWideStringField
      FieldName = 'Rep_Name'
      FixedChar = True
      Size = 80
    end
    object qrySalesbyPrdCatInvoiceRef: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'InvoiceRef'
      OnGetText = qrySalesbyPrdCatInvoiceRefGetText
      Size = 10
      Calculated = True
    end
    object qrySalesbyPrdCatInvoice_Description: TWideStringField
      FieldName = 'Invoice_Description'
      FixedChar = True
      Size = 160
    end
    object qrySalesbyPrdCatSupplier_Desc: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'Supplier_Desc'
      OnGetText = qrySalesbyPrdCatSupplier_DescGetText
      Size = 30
      Calculated = True
    end
    object qrySalesbyPrdCatOrderDesc: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'OrderDesc'
      Size = 15
      Calculated = True
    end
    object qrySalesbyPrdCatDescription: TWideStringField
      FieldName = 'Description'
      FixedChar = True
      Size = 80
    end
    object qrySalesbyPrdCatInvoice_Line_No: TIntegerField
      FieldName = 'Invoice_Line_No'
    end
    object qrySalesbyPrdCatProduct_Type_Description: TWideStringField
      FieldName = 'Product_Type_Description'
    end
    object qrySalesbyPrdCatInvoice_Location: TIntegerField
      FieldName = 'Invoice_Location'
    end
    object qrySalesbyPrdCatInvoice_Location_Descr: TWideStringField
      FieldName = 'Invoice_Location_Descr'
      Size = 50
    end
  end
  object qryGetPOCosts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select'
      'Purch_Ord.Purch_Ord, Purch_Ord.Purch_ord_no, Supplier.Name,'
      
        'sum((Sales_Invoice_Line.Qty_Invoiced/Purch_ord_Line.Purch_Pack_Q' +
        'uantity)*Purchase_Price) as Total_Cost'
      
        'from Sales_invoice_line, Sales_order, Purch_Ord, Purch_Ord_Line,' +
        ' supplier'
      'where'
      '(Sales_Invoice_Line.Sales_invoice = :Sales_Invoice) and'
      '(Sales_Invoice_Line.Invoice_Line_No = :Line_No) and'
      '(Sales_Invoice_Line.Sales_order = Sales_Order.Sales_order) and'
      '(Sales_Order.Sales_Order = Purch_Ord.Sales_order) and'
      '('
      '(Purch_ord_Line.Purch_ord = Purch_Ord.Purch_ord) and'
      
        '(Purch_ord_Line.Purch_ord_Line_no = Sales_Invoice_Line.Sales_ord' +
        'er_Line_no)'
      ') and'
      '(Purch_Ord.Supplier = Supplier.Supplier)'
      'Group By'
      'Purch_Ord.Purch_Ord, Purch_Ord.Purch_Ord_no, Supplier.Name'
      ' '
      ' '
      ' '
      ' ')
    Left = 392
    Top = 48
    ParamData = <
      item
        Name = 'Sales_Invoice'
      end
      item
        Name = 'Line_No'
      end>
  end
  object qryGetSOCosts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'select sum(Part_Cost*(((:Qty_Invoiced)*1.0000)/(Purch_Pack_Quant' +
        'ity*1.0000))) as Total_Cost'
      'from Sales_Order_Line'
      'where Sales_Order = :Sales_Order  and'
      '    (Sales_Order_Line_No = :Sales_Order_Line)'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 320
    Top = 144
    ParamData = <
      item
        Name = 'Qty_Invoiced'
      end
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Sales_Order_Line'
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
    Left = 320
    Top = 94
    ParamData = <
      item
        Name = 'Purch_Ord'
      end>
  end
  object oldqryGetJBCosts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Job_Bag_Line_Dets.Job_Bag,'
      #9'sum(Job_Bag_Line_Dets.Job_Bag_Line_Cost) as Total_Cost'
      'from Job_Bag_Line_Dets, Sales_invoice_Line'
      'where'
      '(Sales_Invoice_Line.Sales_invoice = :Sales_Invoice) and'
      '('
      '(Sales_invoice_Line.Job_Bag = Job_Bag_Line_Dets.Job_Bag) and'
      
        '(Sales_invoice_Line.Job_Bag_Line = Job_Bag_Line_Dets.Job_Bag_Lin' +
        'e)'
      ')'
      'group by'
      #9'Job_Bag_Line_Dets.Job_Bag')
    Left = 118
    Top = 228
    ParamData = <
      item
        Name = 'Sales_Invoice'
      end>
  end
  object qryGetJBCosts: TFDQuery
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
      'WHERE (Sales_Invoice = :Sales_Invoice) and'
      '  (Sales_Invoice_Line.Invoice_Line_No = :line_No)'
      ' '
      ' '
      ' '
      ' ')
    Left = 40
    Top = 280
    ParamData = <
      item
        Name = 'Sales_Invoice'
      end
      item
        Name = 'line_No'
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
      'WHERE (Sales_invoice_Line.Sales_invoice = :Sales_invoice) and'
      '(Sales_Invoice_Line.Invoice_Line_No = :Line_No)'
      ''
      ' '
      ' ')
    Left = 182
    Top = 158
    ParamData = <
      item
        Name = 'Sales_invoice'
      end
      item
        Name = 'Line_No'
      end>
  end
  object qrygetinvline: TFDQuery
    MasterSource = DtSrcReport
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Sales_Invoice_Line.*,'
      '        Price_Unit.Price_Unit,'
      '        Price_Unit.Description AS Sales_Unit_Desc,'
      '        Price_Unit.Price_Unit_Factor,'
      '        Vat_Code.Vat_Rate,'
      '        Vat_Code.Description,'
      '        Vat_Code.VAT_Ref'
      'FROM Vat_Code'
      '      INNER JOIN (Price_Unit'
      '      INNER JOIN Sales_Invoice_Line ON'
      
        '        Price_Unit.Price_Unit = Sales_Invoice_Line.Price_Unit) O' +
        'N'
      '        Vat_Code.Vat_Code = Sales_Invoice_Line.Vat_Code'
      'where sales_invoice_line.sales_invoice = :sales_invoice and'
      '      sales_invoice_line.invoice_line_no = :invoice_line_no'
      ' '
      ' '
      ' '
      ' ')
    Left = 106
    Top = 197
    ParamData = <
      item
        Name = 'Sales_Invoice'
        DataType = ftInteger
      end
      item
        Name = 'invoice_line_no'
      end>
    object qrygetinvlineSales_Invoice: TIntegerField
      FieldName = 'Sales_Invoice'
    end
    object qrygetinvlineInvoice_Line_No: TIntegerField
      FieldName = 'Invoice_Line_No'
    end
    object qrygetinvlinePurchase_Order: TFloatField
      FieldName = 'Purchase_Order'
    end
    object qrygetinvlineLine: TIntegerField
      FieldName = 'Line'
    end
    object qrygetinvlineQty_Invoiced: TFloatField
      FieldName = 'Qty_Invoiced'
    end
    object qrygetinvlineGoods_Value: TFloatField
      FieldName = 'Goods_Value'
    end
    object qrygetinvlineVat_Code: TIntegerField
      FieldName = 'Vat_Code'
    end
    object qrygetinvlineVat_Value: TFloatField
      FieldName = 'Vat_Value'
    end
    object qrygetinvlineProduct_Type: TIntegerField
      FieldName = 'Product_Type'
    end
    object qrygetinvlineSales_Invoice_Status: TIntegerField
      FieldName = 'Sales_Invoice_Status'
    end
    object qrygetinvlinePrice_Unit: TIntegerField
      FieldName = 'Price_Unit'
    end
    object qrygetinvlineNominal: TWideStringField
      FieldName = 'Nominal'
      FixedChar = True
      Size = 32
    end
    object qrygetinvlineJob_Bag: TIntegerField
      FieldName = 'Job_Bag'
    end
    object qrygetinvlineJob_Bag_Line: TIntegerField
      FieldName = 'Job_Bag_Line'
    end
    object qrygetinvlineNarrative: TIntegerField
      FieldName = 'Narrative'
    end
    object qrygetinvlineReference: TWideStringField
      FieldName = 'Reference'
      FixedChar = True
      Size = 60
    end
    object qrygetinvlineInternal_Narrative: TIntegerField
      FieldName = 'Internal_Narrative'
    end
    object qrygetinvlineSales_Order: TIntegerField
      FieldName = 'Sales_Order'
    end
    object qrygetinvlineSales_Order_line_no: TIntegerField
      FieldName = 'Sales_Order_line_no'
    end
    object qrygetinvlineCredit_type: TWideStringField
      FieldName = 'Credit_type'
      FixedChar = True
      Size = 2
    end
    object qrygetinvlineNot_Printed: TWideStringField
      FieldName = 'Not_Printed'
      FixedChar = True
      Size = 2
    end
    object qrygetinvlinecost_price: TFloatField
      FieldName = 'cost_price'
    end
    object qrygetinvlinePrice_Unit_1: TIntegerField
      FieldName = 'Price_Unit_1'
    end
    object qrygetinvlineSales_Unit_Desc: TWideStringField
      FieldName = 'Sales_Unit_Desc'
      FixedChar = True
      Size = 80
    end
    object qrygetinvlinePrice_Unit_Factor: TFloatField
      FieldName = 'Price_Unit_Factor'
    end
    object qrygetinvlineVat_Rate: TFloatField
      FieldName = 'Vat_Rate'
    end
    object qrygetinvlineDescription: TWideStringField
      FieldName = 'Description'
      FixedChar = True
      Size = 80
    end
    object qrygetinvlineVAT_Ref: TWideStringField
      FieldName = 'VAT_Ref'
      FixedChar = True
      Size = 2
    end
  end
  object DtSrcReport: TDataSource
    DataSet = qrySalesbyPrdCat
    Left = 286
    Top = 54
  end
  object qryInvCharges: TFDQuery
    MasterSource = DtSrcReport
    MasterFields = 'Sales_Invoice;Invoice_Line_No'
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Sales_invoice_Add_Charge.*, VAT_Code.VAT_Rate'
      'from Sales_invoice_Add_Charge, VAT_Code'
      
        'where Sales_invoice_Add_Charge.Sales_Invoice = :Sales_Invoice an' +
        'd'
      'Sales_invoice_add_Charge.Invoice_line_no = :Invoice_Line_no and'
      'Sales_invoice_Add_Charge.VAT_Code = Vat_Code.Vat_Code')
    Left = 40
    Top = 222
    ParamData = <
      item
        Name = 'Sales_Invoice'
        DataType = ftInteger
      end
      item
        Name = 'Invoice_Line_no'
        DataType = ftInteger
        Value = Null
      end>
  end
  object qryJBLine: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Job_Bag_Line_Descr, Supplier.Name'
      'from Job_Bag_Line_Dets, Supplier'
      'where Job_Bag = :Job_Bag and'
      'Job_Bag_Line = :Job_Bag_Line and'
      'Job_Bag_Line_Dets.Supplier = Supplier.Supplier')
    Left = 472
    Top = 36
    ParamData = <
      item
        Name = 'Job_Bag'
      end
      item
        Name = 'Job_Bag_Line'
      end>
  end
  object qrySOLine: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Part.Part, '
      '          Part_Description, '
      '          Sales_order_line.Sell_Pack_Quantity, '
      '          Price_Unit'
      'from Sales_order_line, '
      '        Part'
      'where Sales_Order = :Sales_Order and'
      'Sales_Order_Line_no = :Sales_Order_Line_no and'
      '(Sales_order_line.Part = Part.Part)')
    Left = 512
    Top = 12
    ParamData = <
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Sales_Order_Line_no'
      end>
  end
  object qryPOLine: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Purchase_orderLine.Customers_Desc,'
      '        Purchase_orderLine.Cust_order_no,'
      '        Form_Reference.Form_Reference_ID,'
      '        Form_Reference.Form_Reference_Descr'
      'FROM Form_Reference'
      '      RIGHT JOIN Purchase_orderLine ON'
      
        '        Form_Reference.Form_Reference = Purchase_orderLine.Form_' +
        'Reference'
      'where Purchase_order = :Purchase_Order and'
      'Line = :Line'
      ' ')
    Left = 584
    Top = 20
    ParamData = <
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end>
  end
  object qryPO: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Supplier.Name'
      'from Purchase_Order, Supplier'
      'where Purchase_Order = :Purchase_order and'
      'Purchase_Order.Supplier = Supplier.Supplier')
    Left = 584
    Top = 78
    ParamData = <
      item
        Name = 'Purchase_order'
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
    Left = 490
    Top = 134
    ParamData = <
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end>
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
      
        '(Purch_ord_Line.Purch_ord_Line_no = Sales_order_line.Sales_order' +
        '_Line_no)'
      ')'
      ''
      ' '
      ' '
      ' '
      ' ')
    Left = 432
    Top = 184
    ParamData = <
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Sales_Order_line_no'
      end>
  end
  object qryGetSOCrCosts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Sales_Order_line.Sales_Order,'
      '        Sales_Order_line.Sales_Order_line_no,'
      '        Sales_Order_line.Part_Cost,'
      '        Sales_Order_line.Purch_Pack_Quantity'
      'FROM Sales_Order_line'
      'where'
      '('
      '(Sales_Order_Line.Sales_order = :Sales_Order) and'
      '(Sales_Order_line.Sales_order_Line_no = :Sales_Order_line_no)'
      ')'
      ' '
      ' '
      ' '
      ' ')
    Left = 488
    Top = 240
    ParamData = <
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Sales_Order_line_no'
      end>
  end
  object qryGetJBCrCosts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Job_Bag_Line_Dets.Job_Bag_Line_Cost'
      'FROM Job_Bag_Line_Dets '
      'WHERE Job_Bag_Line_Dets.Job_Bag = :Job_Bag and'
      'Job_Bag_Line_Dets.Job_Bag_line = :Job_Bag_Line'
      ' ')
    Left = 492
    Top = 296
    ParamData = <
      item
        Name = 'Job_Bag'
      end
      item
        Name = 'Job_Bag_Line'
      end>
  end
  object qryGetInvAddChrg: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select sales_invoice_add_charge.*,'
      '  vat_code.vat_rate'
      'from sales_invoice_add_charge'
      
        'inner join vat_code on sales_invoice_add_charge.vat_code = vat_c' +
        'ode.vat.code'
      'where sales_invoice = :sales_invoice '
      ' ')
    Left = 146
    Top = 320
    ParamData = <
      item
        Name = 'sales_invoice'
      end>
  end
  object qryGetPO: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'select Purchase_Order.Office_Contact, Operator.Name as Account_M' +
        'anager'
      'from Purchase_Order, Operator'
      'where Purchase_Order = :Purchase_Order and'
      'Purchase_Order.Office_Contact = Operator.Operator')
    Left = 912
    Top = 24
    ParamData = <
      item
        Name = 'Purchase_Order'
      end>
  end
  object qryGetJB: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Job_Bag.Office_Contact, Operator.Name as Account_Manager'
      'from Job_Bag, Operator'
      'where Job_Bag.Job_bag = :Job_Bag and'
      'Job_Bag.Office_Contact = Operator.Operator')
    Left = 856
    Top = 24
    ParamData = <
      item
        Name = 'Job_Bag'
      end>
  end
  object qryGetSO: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'select Sales_Order.Office_Contact, Operator.Name as Account_Mana' +
        'ger'
      'from Sales_Order, Operator'
      'where Sales_Order.Sales_Order = :sales_order and'
      'Sales_Order.Office_Contact = Operator.Operator')
    Left = 800
    Top = 24
    ParamData = <
      item
        Name = 'sales_order'
      end>
  end
end
