object PBRPStkHoldfrm: TPBRPStkHoldfrm
  Left = 24
  Top = 99
  Caption = 'Customer Stock Movement Report'
  ClientHeight = 428
  ClientWidth = 756
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Scaled = True
  TextHeight = 13
  object QuickReport: TQuickRep
    Left = 16
    Top = 8
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
      Height = 99
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
        261.937500000000000000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object QRSysData1: TQRSysData
        Left = 989
        Top = 8
        Width = 46
        Height = 17
        Size.Values = (
          44.979166666666700000
          2616.729166666670000000
          21.166666666666700000
          121.708333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsPageNumber
        Text = ''
        Transparent = False
        ExportAs = exptText
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel13: TQRLabel
        Left = 925
        Top = 8
        Width = 59
        Height = 17
        Size.Values = (
          44.979166666666700000
          2447.395833333330000000
          21.166666666666700000
          156.104166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Page No.:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblTitle: TQRLabel
        Left = 314
        Top = 8
        Width = 419
        Height = 23
        Size.Values = (
          60.854166666666670000
          830.791666666666700000
          21.166666666666670000
          1108.604166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Warehouse Stock Holding Report - Run Date: '
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
      object FormRefQRLabel: TQRLabel
        Left = 17
        Top = 72
        Width = 73
        Height = 17
        Size.Values = (
          44.979166666666670000
          44.979166666666670000
          190.500000000000000000
          193.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Bin Location'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object DescQRLabel: TQRLabel
        Left = 108
        Top = 72
        Width = 97
        Height = 17
        Size.Values = (
          44.979166666666670000
          285.750000000000000000
          190.500000000000000000
          256.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Stock Reference'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object StkQRLabel: TQRLabel
        Left = 696
        Top = 72
        Width = 74
        Height = 17
        Size.Values = (
          44.979166666666670000
          1841.500000000000000000
          190.500000000000000000
          195.791666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Qty In Stock'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRShape1: TQRShape
        Left = 16
        Top = 85
        Width = 1025
        Height = 17
        Size.Values = (
          44.979166666666700000
          42.333333333333300000
          224.895833333333000000
          2711.979166666670000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object RepTypeQRLabel: TQRLabel
        Left = 470
        Top = 40
        Width = 107
        Height = 23
        Size.Values = (
          60.854166666666670000
          1243.541666666667000000
          105.833333333333300000
          283.104166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Report Type'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 14
      end
      object QRLabel3: TQRLabel
        Left = 256
        Top = 72
        Width = 66
        Height = 17
        Size.Values = (
          44.979166666666670000
          677.333333333333300000
          190.500000000000000000
          174.625000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Description'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel4: TQRLabel
        Left = 467
        Top = 72
        Width = 82
        Height = 17
        Size.Values = (
          44.979166666666670000
          1235.604166666667000000
          190.500000000000000000
          216.958333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Order Number'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel1: TQRLabel
        Left = 810
        Top = 72
        Width = 46
        Height = 17
        Size.Values = (
          44.979166666666700000
          2143.125000000000000000
          190.500000000000000000
          121.708333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Box qty'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel2: TQRLabel
        Left = 890
        Top = 56
        Width = 41
        Height = 33
        Size.Values = (
          87.312500000000000000
          2354.791666666670000000
          148.166666666667000000
          108.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Box Count'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel6: TQRLabel
        Left = 992
        Top = 72
        Width = 35
        Height = 17
        Size.Values = (
          44.979166666666700000
          2624.666666666670000000
          190.500000000000000000
          92.604166666666700000)
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
      object QRLabel5: TQRLabel
        Left = 568
        Top = 72
        Width = 80
        Height = 17
        Size.Values = (
          44.979166666666670000
          1502.833333333333000000
          190.500000000000000000
          211.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer Ref'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object OrderDetail: TQRSubDetail
      Left = 38
      Top = 193
      Width = 1047
      Height = 22
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
        58.208333333333330000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = QuickReport
      DataSet = qryReport
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText1: TQRDBText
        Left = 697
        Top = 0
        Width = 72
        Height = 16
        Size.Values = (
          42.333333333333330000
          1844.145833333333000000
          0.000000000000000000
          190.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Qty_In_Stock'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRDBText2: TQRDBText
        Left = 13
        Top = 0
        Width = 84
        Height = 16
        Size.Values = (
          42.333333333333300000
          34.395833333333300000
          0.000000000000000000
          222.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'description'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRDBText3: TQRDBText
        Left = 109
        Top = 0
        Width = 140
        Height = 16
        Size.Values = (
          42.333333333333300000
          288.395833333333000000
          0.000000000000000000
          370.416666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Stock_Reference'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRDBText4: TQRDBText
        Left = 258
        Top = 0
        Width = 209
        Height = 16
        Size.Values = (
          42.333333333333300000
          682.625000000000000000
          0.000000000000000000
          552.979166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'form_reference_descr'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRDBText5: TQRDBText
        Left = 458
        Top = 0
        Width = 90
        Height = 16
        Size.Values = (
          42.333333333333330000
          1211.791666666667000000
          0.000000000000000000
          238.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Purchase_order'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object lblBoxCount: TQRLabel
        Left = 864
        Top = 0
        Width = 67
        Height = 16
        Size.Values = (
          42.333333333333300000
          2286.000000000000000000
          0.000000000000000000
          177.270833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblBoxCount'
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
        Left = 950
        Top = 0
        Width = 77
        Height = 16
        Size.Values = (
          42.333333333333300000
          2513.541666666670000000
          0.000000000000000000
          203.729166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '-------------------'
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
      object lblFormsPerBox: TQRLabel
        Left = 768
        Top = 0
        Width = 89
        Height = 16
        Size.Values = (
          42.333333333333300000
          2032.000000000000000000
          0.000000000000000000
          235.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblFormsPerBox'
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
      object QRDBText6: TQRDBText
        Left = 568
        Top = 0
        Width = 86
        Height = 16
        Size.Values = (
          42.333333333333330000
          1502.833333333333000000
          0.000000000000000000
          227.541666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Cust_Order_no'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 9
      end
    end
    object FormTotQRBand: TQRBand
      Left = 38
      Top = 256
      Width = 1047
      Height = 16
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        42.333333333333330000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
    end
    object FooterQRBand: TQRBand
      Left = 38
      Top = 215
      Width = 1047
      Height = 41
      AlignToBottom = False
      BeforePrint = FooterQRBandBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        108.479166666666700000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageFooter
      object PageNoQRLabel: TQRLabel
        Left = 496
        Top = 12
        Width = 55
        Height = 17
        Size.Values = (
          44.979166666666670000
          1312.333333333333000000
          31.750000000000000000
          145.520833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Page No.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
    object RepTotsQRGroup: TQRGroup
      Left = 38
      Top = 137
      Width = 1047
      Height = 16
      AlignToBottom = False
      Enabled = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        42.333333333333330000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = QuickReport
      ReprintOnNewPage = False
    end
    object CustGroup: TQRGroup
      Left = 38
      Top = 153
      Width = 1047
      Height = 40
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
        105.833333333333300000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'qryReport.Stock_location_Desc'
      Master = OrderDetail
      ReprintOnNewPage = False
      object CustQRDBText: TQRDBText
        Left = 81
        Top = 7
        Width = 120
        Height = 18
        Size.Values = (
          47.625000000000000000
          214.312500000000000000
          18.520833333333330000
          317.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'stock_location_desc'
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
        FontSize = 10
      end
      object CustnamQRLabel: TQRLabel
        Left = 4
        Top = 7
        Width = 71
        Height = 18
        Size.Values = (
          47.625000000000000000
          10.583333333333330000
          18.520833333333330000
          187.854166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Warehouse:'
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
  end
  object qryReport: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select '#9'delivery_location.description, '
      #9'delivery_location.quantity, '
      #9'delivery_location.quantity_allocated,'
      #9'delivery_detail.delivery_to_Stock,'
      #9'Purchase_orderline.Form_reference,'
      #9'Form_reference.form_reference_id,'
      #9'Form_reference.form_reference_descr,'
      '                Form_Reference.Stock_Reference,'
      #9'Purchase_orderline.Purchase_order,'
      #9'delivery_detail.stock_location_desc,'
      '                Purchase_orderline.Forms_per_box,'
      '                Purchase_orderline.Cust_Order_no,'
      '                Form_reference.customer,'
      '                Form_reference.branch_no,'
      
        #9'(delivery_location.quantity - delivery_location.quantity_alloca' +
        'ted) as Qty_in_stock'
      
        'from delivery_location, delivery_detail, Purchase_orderline, for' +
        'm_reference'
      'where'
      '('
      
        '(Delivery_location.purchase_order = Delivery_Detail.purchase_ord' +
        'er) and'
      '(Delivery_location.Line = Delivery_Detail.Line) and'
      '(Delivery_location.delivery_no = Delivery_Detail.delivery_no)'
      ') and'
      '(Delivery_Detail.delivery_to_Stock = '#39'Y'#39') and'
      '(Delivery_Detail.Qty_Delivered <> 0) and'
      '('
      
        '(Delivery_location.purchase_order = Purchase_orderline.purchase_' +
        'order) and'
      '(Delivery_location.Line = Purchase_orderline.Line)'
      ') and'
      
        '(Purchase_orderline.form_reference = Form_reference.form_referen' +
        'ce)')
    Left = 32
    Top = 64
    object qryReportdescription: TStringField
      FieldName = 'description'
      FixedChar = True
      Size = 40
    end
    object qryReportquantity: TIntegerField
      FieldName = 'quantity'
    end
    object qryReportquantity_allocated: TIntegerField
      FieldName = 'quantity_allocated'
    end
    object qryReportdelivery_to_Stock: TStringField
      FieldName = 'delivery_to_Stock'
      FixedChar = True
      Size = 2
    end
    object qryReportForm_reference: TIntegerField
      FieldName = 'Form_reference'
    end
    object qryReportform_reference_id: TStringField
      FieldName = 'form_reference_id'
      FixedChar = True
      Size = 100
    end
    object qryReportform_reference_descr: TStringField
      FieldName = 'form_reference_descr'
      FixedChar = True
      Size = 100
    end
    object qryReportPurchase_order: TFloatField
      FieldName = 'Purchase_order'
    end
    object qryReportstock_location_desc: TStringField
      FieldName = 'stock_location_desc'
      FixedChar = True
      Size = 80
    end
    object qryReportForms_per_box: TStringField
      FieldName = 'Forms_per_box'
      FixedChar = True
      Size = 40
    end
    object qryReportCust_Order_no: TStringField
      FieldName = 'Cust_Order_no'
      FixedChar = True
      Size = 50
    end
    object qryReportcustomer: TIntegerField
      FieldName = 'customer'
    end
    object qryReportbranch_no: TIntegerField
      FieldName = 'branch_no'
    end
    object qryReportQty_in_stock: TIntegerField
      FieldName = 'Qty_in_stock'
    end
    object qryReportStock_Reference: TStringField
      FieldName = 'Stock_Reference'
      FixedChar = True
      Size = 30
    end
  end
end
