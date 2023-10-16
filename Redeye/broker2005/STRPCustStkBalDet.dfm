object STRPCustStkBalDetfrm: TSTRPCustStkBalDetfrm
  Left = 31
  Top = 123
  Caption = 'Customer Stock Balance report'
  ClientHeight = 417
  ClientWidth = 761
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
    Description.Strings = (
      'Customer Stock Balance report')
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
    ReportTitle = 'Customer stock balance report'
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
      Height = 95
      Frame.DrawBottom = True
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        251.354166666666700000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object qrlblTitle: TQRLabel
        Left = 339
        Top = 8
        Width = 340
        Height = 23
        Size.Values = (
          60.854166666666670000
          896.937500000000000000
          21.166666666666670000
          899.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Customer Stock Balance Report - Run Date: '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRSysData1: TQRSysData
        Left = 957
        Top = 8
        Width = 69
        Height = 17
        Size.Values = (
          44.979166666666670000
          2532.062500000000000000
          21.166666666666670000
          182.562500000000000000)
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
        Text = 'Page: '
        Transparent = False
        ExportAs = exptText
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object FormRefQRLabel: TQRLabel
        Left = 17
        Top = 77
        Width = 91
        Height = 17
        Size.Values = (
          44.979166666666670000
          44.979166666666670000
          203.729166666666700000
          240.770833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Stock Reference'
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
      object QRLabel5: TQRLabel
        Left = 136
        Top = 77
        Width = 113
        Height = 17
        Size.Values = (
          44.979166666666670000
          359.833333333333400000
          203.729166666666700000
          298.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Customer order ref'
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
      object DescQRLabel: TQRLabel
        Left = 283
        Top = 77
        Width = 67
        Height = 17
        Size.Values = (
          44.979166666666670000
          748.770833333333400000
          203.729166666666700000
          177.270833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Description '
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
        Left = 562
        Top = 77
        Width = 55
        Height = 17
        Size.Values = (
          44.979166666666670000
          1486.958333333333000000
          203.729166666666700000
          145.520833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Our Order'
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
      object QRLabel3: TQRLabel
        Left = 640
        Top = 61
        Width = 53
        Height = 33
        Size.Values = (
          87.312500000000000000
          1693.333333333333000000
          161.395833333333300000
          140.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Last Delivery'
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
      object StkQRLabel: TQRLabel
        Left = 734
        Top = 77
        Width = 44
        Height = 17
        Size.Values = (
          44.979166666666670000
          1942.041666666667000000
          203.729166666666700000
          116.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'In Stock'
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
      object QRLabel2: TQRLabel
        Left = 804
        Top = 61
        Width = 65
        Height = 33
        Size.Values = (
          87.312500000000000000
          2127.250000000000000000
          161.395833333333300000
          171.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'On Order for stock'
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
      object QRLabel1: TQRLabel
        Left = 892
        Top = 61
        Width = 65
        Height = 33
        Size.Values = (
          87.312500000000000000
          2360.083333333333000000
          161.395833333333300000
          171.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Reorder Level'
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
        Left = 972
        Top = 61
        Width = 55
        Height = 33
        Size.Values = (
          87.312500000000000000
          2571.750000000000000000
          161.395833333333300000
          145.520833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Total Order Qty'
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
    object qrbCustHeader: TQRGroup
      Left = 38
      Top = 157
      Width = 1047
      Height = 21
      AlignToBottom = False
      BeforePrint = qrbCustHeaderBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        55.562500000000000000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'Name'
      Master = QuickReport
      ReprintOnNewPage = False
      object QRDBText3: TQRDBText
        Left = 3
        Top = 1
        Width = 38
        Height = 17
        Size.Values = (
          44.979166666666670000
          7.937500000000000000
          2.645833333333333000
          100.541666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Name'
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
    end
    object QRBand2: TQRBand
      Left = 38
      Top = 178
      Width = 1047
      Height = 19
      AlignToBottom = False
      BeforePrint = QRBand2BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        50.270833333333330000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRDBText1: TQRDBText
        Left = 19
        Top = 1
        Width = 102
        Height = 17
        Size.Values = (
          44.979166666666670000
          50.270833333333330000
          2.645833333333333000
          269.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Part'
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
      object QRDBText2: TQRDBText
        Left = 285
        Top = 1
        Width = 262
        Height = 17
        Size.Values = (
          44.979166666666670000
          754.062500000000000000
          2.645833333333333000
          693.208333333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = qryReport
        DataField = 'Part_Description'
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
      object lblPONumber: TQRLabel
        Left = 560
        Top = 1
        Width = 62
        Height = 17
        Size.Values = (
          44.979166666666670000
          1481.666666666667000000
          2.645833333333333000
          164.041666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'lblPONumber'
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
      object lblDeliveryDate: TQRLabel
        Left = 632
        Top = 1
        Width = 72
        Height = 17
        Size.Values = (
          44.979166666666670000
          1672.166666666667000000
          2.645833333333333000
          190.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblDeliveryDate'
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
      object qrlblQuantity: TQRLabel
        Left = 719
        Top = 1
        Width = 61
        Height = 17
        Size.Values = (
          44.979166666666670000
          1902.354166666667000000
          2.645833333333333000
          161.395833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblQuantity'
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
      object lblCustOrderNo: TQRLabel
        Left = 136
        Top = 1
        Width = 137
        Height = 17
        Size.Values = (
          44.979166666666700000
          359.833333333333000000
          2.645833333333330000
          362.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'lblCustOrderNo'
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
      object QRLblQtyOnOrd: TQRLabel
        Left = 798
        Top = 1
        Width = 70
        Height = 17
        Size.Values = (
          44.979166666666670000
          2111.375000000000000000
          2.645833333333333000
          185.208333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblQtyOnOrd'
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
      object qrlblReorder: TQRLabel
        Left = 882
        Top = 1
        Width = 60
        Height = 17
        Size.Values = (
          44.979166666666670000
          2333.625000000000000000
          2.645833333333333000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblReorder'
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
      object qrlblTotalOrder: TQRLabel
        Left = 962
        Top = 1
        Width = 64
        Height = 17
        Size.Values = (
          44.979166666666670000
          2545.291666666667000000
          2.645833333333333000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlTotalOrder'
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
    object qrsdtlNumbers: TQRSubDetail
      Left = 38
      Top = 197
      Width = 1047
      Height = 18
      AlignToBottom = False
      BeforePrint = qrsdtlNumbersBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        47.625000000000000000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = QuickReport
      DataSet = GetSerNosSQL
      PrintBefore = False
      PrintIfEmpty = True
      object lblSerialNos: TQRLabel
        Left = 285
        Top = 0
        Width = 77
        Height = 15
        Size.Values = (
          39.687500000000000000
          754.062500000000000000
          0.000000000000000000
          203.729166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Serial Numbers:'
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
      object lblSerialNoRange: TQRLabel
        Left = 373
        Top = 0
        Width = 82
        Height = 15
        Size.Values = (
          39.687500000000000000
          986.895833333333300000
          0.000000000000000000
          216.958333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'lblSerialNoRange'
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
    object ChildBand1: TQRChildBand
      Left = 38
      Top = 133
      Width = 1047
      Height = 24
      AlignToBottom = False
      Enabled = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.500000000000000000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = QRBand1
      PrintOrder = cboAfterParent
      object QRDBText4: TQRDBText
        Left = 3
        Top = 1
        Width = 102
        Height = 17
        Size.Values = (
          44.979166666666700000
          7.937500000000000000
          2.645833333333330000
          269.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Part'
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
      object QRDBText5: TQRDBText
        Left = 280
        Top = 1
        Width = 217
        Height = 17
        Size.Values = (
          44.979166666666700000
          740.833333333333000000
          2.645833333333330000
          574.145833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = qryReport
        DataField = 'Part_Description'
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
  end
  object qryReport: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Part.Part,'
      '        Part.Part_Description,'
      '        Part.Customer,'
      '        Customer.Name,'
      '        Part.Not_In_Use,'
      '        Part.Product_Class,'
      
        '        Sum(Store_Stock.Store_Quantity-Store_Stock.Quantity_Allo' +
        'cated) AS Free_Stock'
      'FROM (((Part'
      '      LEFT JOIN Customer ON Part.Customer = Customer.Customer)'
      '      LEFT JOIN Store_Stock ON Part.Part = Store_Stock.Part)'
      
        '      INNER JOIN Part_Store_Levels ON Part.Part = Part_store_Lev' +
        'els.Part)'
      'GROUP BY  Part.Part,'
      '          Part.Part_Description,'
      '          Part.Customer,'
      '          Customer.Name,'
      '          Part.Not_In_Use,'
      '          Part.Product_Class'
      'HAVING ((Part.Customer = :Customer) or (:Customer = 0)) and'
      '        Part.Part >= :Part_From and'
      '        Part.Part <= :Part_To and'
      '        ((Part.Not_in_Use = '#39'N'#39') or'
      '        (Part.Not_in_Use = :Not_in_Use)) and'
      
        '        ((Part.Product_Class = '#39'STK'#39') or (Part.Product_Class is ' +
        'null)) '
      'order by Customer.Name, Part.Part'
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
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 312
    Top = 16
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
      end
      item
        Name = 'Customer'
        DataType = ftInteger
      end
      item
        Name = 'Part_From'
        DataType = ftString
      end
      item
        Name = 'Part_To'
        DataType = ftString
      end
      item
        Name = 'Not_in_Use'
        DataType = ftString
      end>
    object qryReportPart: TStringField
      FieldName = 'Part'
      FixedChar = True
      Size = 30
    end
    object qryReportPart_Description: TStringField
      FieldName = 'Part_Description'
      FixedChar = True
      Size = 120
    end
    object qryReportCustomer: TIntegerField
      FieldName = 'Customer'
    end
    object qryReportName: TStringField
      FieldName = 'Name'
      FixedChar = True
      Size = 80
    end
    object qryReportNot_In_Use: TStringField
      FieldName = 'Not_In_Use'
      FixedChar = True
      Size = 2
    end
    object qryReportProduct_Class: TStringField
      FieldName = 'Product_Class'
      FixedChar = True
      Size = 10
    end
    object qryReportFree_Stock: TIntegerField
      FieldName = 'Free_Stock'
    end
  end
  object GetSerNosSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Store_Stock_Serial_item.Serial_item_from,'
      'Store_Stock_Serial_item.Serial_item_to'
      'FROM Store_Stock inner JOIN Store_Stock_Serial_item ON'
      'Store_Stock.Store_Stock = Store_Stock_Serial_item.Store_Stock'
      'where (store_stock.part = :part)'
      'order by Store_stock_serial_item.serial_item_from'
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 94
    Top = 62
    ParamData = <
      item
        Name = 'part'
        DataType = ftString
      end>
    object GetSerNosSQLSerial_item_from: TStringField
      FieldName = 'Serial_item_from'
      FixedChar = True
      Size = 60
    end
    object GetSerNosSQLSerial_item_to: TStringField
      FieldName = 'Serial_item_to'
      FixedChar = True
      Size = 60
    end
  end
  object qryLastDetails: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Top 1'
      '  Delivery_Detail.Qty_Delivered,'
      '  Delivery_Detail.Date_Deliv_Actual,'
      '  Purchase_OrderLine.Cust_Order_No,'
      '  Purchase_OrderLine.Purchase_Order,'
      '  Purchase_OrderLine.Original_Order,'
      '  (select POL.Quantity'
      '   from Purchase_orderLine POL'
      
        '   where POL.Purchase_Order = Purchase_orderline.Original_Order ' +
        'and'
      
        '         POL.Line = Purchase_orderline.Original_OrderLine) as Qu' +
        'antity'
      
        'FROM form_reference LEFT JOIN (Purchase_OrderLine LEFT JOIN Deli' +
        'very_Detail'
      '  ON (Purchase_OrderLine.Line = Delivery_Detail.Line) AND'
      
        '  (Purchase_OrderLine.Purchase_Order = Delivery_Detail.Purchase_' +
        'Order))'
      
        '  ON form_reference.Form_Reference = Purchase_OrderLine.Form_Ref' +
        'erence'
      'WHERE (form_reference.stock_reference = :form_reference) and'
      
        '   (round(Purchase_OrderLine.Purchase_order,0) = (Purchase_Order' +
        'Line.Original_Order)) and'
      '  (Delivery_Detail.Qty_Delivered<>0)'
      
        'ORDER BY Delivery_Detail.Date_Deliv_Actual DESC, Delivery_Detail' +
        '.delivery_no DESC, Delivery_Detail.Purchase_Order desc'
      ''
      ''
      ' '
      ' '
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 254
    Top = 62
    ParamData = <
      item
        Name = 'Form_Reference'
      end>
  end
  object qryOrders: TFDQuery
    MasterSource = dtsReport
    MasterFields = 'Part'
    Connection = dmBroker.PBLDatabase
    SQL.Strings = (
      'SELECT top 1 Purchase_OrderLine.Cust_Order_No,'
      '        Purchase_OrderLine.Purchase_Order,'
      '        Purchase_OrderLine.Qty_in_Stock,'
      '        Purchase_OrderLine.Quantity,'
      '        Purchase_orderLine.Forms_per_Box,'
      '        (select top 1 Date_Deliv_Actual'
      
        '        from Purchase_orderLine POLine, Delivery_Detail, form_re' +
        'ference'
      
        '        where (POLine.Form_Reference = form_reference.Form_Refer' +
        'ence) and'
      '              (form_reference.stock_reference = :Part) and'
      #9#9'          (POLine.Original_Order <> 0) and'
      '              ('
      
        '              (Delivery_Detail.Purchase_Order = POLine.Purchase_' +
        'Order) and'
      '              (Delivery_Detail.Line = POLine.Line)'
      '              ) and'
      '              (Delivery_Detail.Qty_delivered <> 0)'
      '        Order By Delivery_detail.Date_Deliv_Actual desc,'
      '                 Delivery_detail.delivery_no desc,'
      '                 Delivery_detail.Purchase_Order'
      '        ) as Last_Delivery'
      
        'FROM Form_Reference LEFT JOIN Purchase_OrderLine ON Form_Referen' +
        'ce.Form_Reference = Purchase_OrderLine.Form_Reference'
      'where form_reference.stock_reference = :Part'
      'and Qty_in_Stock <> 0'
      'ORDER BY Purchase_OrderLine.Purchase_Order desc'
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
      ' '
      ' '
      ' ')
    Left = 174
    Top = 62
    ParamData = <
      item
        Name = 'Part'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object qryOrdersCust_Order_No: TStringField
      FieldName = 'Cust_Order_No'
      Origin = 'Cust_Order_No'
      Size = 50
    end
    object qryOrdersPurchase_Order: TFloatField
      FieldName = 'Purchase_Order'
      Origin = 'Purchase_Order'
    end
    object qryOrdersQty_in_Stock: TFloatField
      FieldName = 'Qty_in_Stock'
      Origin = 'Qty_in_Stock'
    end
    object qryOrdersQuantity: TFloatField
      FieldName = 'Quantity'
      Origin = 'Quantity'
    end
    object qryOrdersForms_per_Box: TStringField
      FieldName = 'Forms_per_Box'
      Origin = 'Forms_per_Box'
      Size = 40
    end
    object qryOrdersLast_Delivery: TSQLTimeStampField
      FieldName = 'Last_Delivery'
      Origin = 'Last_Delivery'
      ReadOnly = True
    end
  end
  object qryGetOnOrd: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select form_reference.form_reference_id,'
      '(select sum(Delivery_detail.Qty_to_Deliver)'
      #9#9'from Purchase_Orderline POLine, Delivery_Detail'
      
        #9#9'where POLine.form_reference = Form_reference.form_reference an' +
        'd'
      #9#9#9'POLine.purch_ord_line_Status >= 20 and'
      #9#9#9'POLine.purch_ord_line_Status <= 22 and'
      #9#9#9'('
      #9#9#9'(Delivery_detail.purchase_order = POLine.purchase_order) and'
      #9#9#9'(Delivery_detail.Line = POLine.Line)'
      #9#9#9') and'
      #9#9#9'(Delivery_detail.delivery_to_Stock = '#39'Y'#39') and'
      #9#9#9'(Delivery_Detail.Qty_Delivered = 0)'
      
        '                        and (POLine.inactive <> '#39'Y'#39')) AS Quantit' +
        'y_on_order,'
      ' '#9'(select sum(Delivery_detail.Qty_to_Deliver)'
      #9#9'from Purchase_Orderline POLine, Delivery_Detail'
      
        #9#9'where POLine.form_reference = Form_reference.form_reference an' +
        'd'
      #9#9#9'POLine.purch_ord_line_Status >= 20 and'
      #9#9#9'POLine.purch_ord_line_Status <= 22 and'
      '                        (POLine.inactive <> '#39'Y'#39') and'
      #9#9#9'(round(POLine.Purchase_Order,0) <> POLine.Original_Order) and'
      #9#9#9'('
      #9#9#9'(Delivery_detail.purchase_order = POLine.purchase_order) and'
      #9#9#9'(Delivery_detail.Line = POLine.Line)'
      #9#9#9')) AS Total_on_order'
      'from form_reference'
      'where Form_reference.stock_reference = :part'
      'group by form_reference.form_reference_id, form_reference'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 374
    Top = 56
    ParamData = <
      item
        Name = 'part'
      end>
  end
  object dtsReport: TDataSource
    DataSet = qryReport
    Left = 94
    Top = 62
  end
  object qryGetLastSO: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select top 1 date_received as Last_Sales_Date'
      'from part_movement'
      'where part = :Part and'
      'Part_movement_type = '#39'D'#39
      'order by date_received DESC')
    Left = 518
    Top = 16
    ParamData = <
      item
        Name = 'Part'
      end>
  end
  object qryLevels: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from part_store_levels'
      'where part = :part and part_store_type = 1')
    Left = 628
    Top = 16
    ParamData = <
      item
        Name = 'part'
      end>
  end
end
