object PBRPJBMarginFrm: TPBRPJBMarginFrm
  Left = 44
  Top = 50
  Caption = 'Job Bag Margin Report'
  ClientHeight = 540
  ClientWidth = 1195
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  
  OnCreate = FormCreate
  TextHeight = 13
  object QuickReport: TQuickRep
    Left = 32
    Top = 24
    Width = 1123
    Height = 794
    ShowingPreview = False
    BeforePrint = QuickReportBeforePrint
    DataSet = qryReport
    Font.Charset = ANSI_CHARSET
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
      50.000000000000000000
      20.000000000000000000
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
    object QRBand2: TQRBand
      Left = 19
      Top = 38
      Width = 1097
      Height = 83
      Frame.DrawBottom = True
      Frame.Style = psDashDot
      AlignToBottom = False
      TransparentBand = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        219.604166666666700000
        2902.479166666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object qrlblTitle: TQRLabel
        Left = 461
        Top = 2
        Width = 175
        Height = 24
        Size.Values = (
          63.500000000000000000
          1219.729166666667000000
          5.291666666666667000
          463.020833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Job Bag Margin Report'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 14
      end
      object QRLabel3: TQRLabel
        Left = 218
        Top = 56
        Width = 144
        Height = 17
        Size.Values = (
          44.979166666666670000
          576.791666666666700000
          148.166666666666700000
          381.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer Name & Description'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object RunDateQRLabel: TQRLabel
        Left = 998
        Top = 5
        Width = 83
        Height = 15
        Size.Values = (
          39.687500000000000000
          2640.541666666667000000
          13.229166666666670000
          219.604166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'RunDateQRLabel'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
        Left = 8
        Top = 56
        Width = 40
        Height = 16
        Size.Values = (
          42.333333333333330000
          21.166666666666670000
          148.166666666666700000
          105.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Job Bag'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QuantityLbl: TQRLabel
        Left = 564
        Top = 56
        Width = 41
        Height = 17
        Size.Values = (
          44.979166666666670000
          1492.250000000000000000
          148.166666666666700000
          108.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Quantity'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
        Left = 642
        Top = 56
        Width = 54
        Height = 17
        Size.Values = (
          44.979166666666670000
          1698.625000000000000000
          148.166666666666700000
          142.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Cost Value'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
        Left = 719
        Top = 56
        Width = 59
        Height = 17
        Size.Values = (
          44.979166666666670000
          1902.354166666667000000
          148.166666666666700000
          156.104166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Sales Value'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
        Left = 803
        Top = 56
        Width = 33
        Height = 17
        Size.Values = (
          44.979166666666670000
          2124.604166666667000000
          148.166666666666700000
          87.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Margin'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
        Left = 865
        Top = 40
        Width = 29
        Height = 17
        Size.Values = (
          44.979166666666670000
          2288.645833333333000000
          105.833333333333300000
          76.729166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '%age'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
        Left = 860
        Top = 56
        Width = 33
        Height = 17
        Size.Values = (
          44.979166666666670000
          2275.416666666667000000
          148.166666666666700000
          87.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Margin'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
        Left = 960
        Top = 56
        Width = 40
        Height = 17
        Size.Values = (
          44.979166666666670000
          2540.000000000000000000
          148.166666666666700000
          105.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Supplier'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRLblTotBy: TQRLabel
        Left = 519
        Top = 32
        Width = 58
        Height = 21
        Size.Values = (
          55.562500000000000000
          1373.187500000000000000
          84.666666666666670000
          153.458333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'QRLblTotBy'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRSysData1: TQRSysData
        Left = 997
        Top = 25
        Width = 66
        Height = 15
        Size.Values = (
          39.687500000000000000
          2637.895833333333000000
          66.145833333333330000
          174.625000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = 'Page '
        Transparent = False
        ExportAs = exptText
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel11: TQRLabel
        Left = 136
        Top = 56
        Width = 69
        Height = 16
        Size.Values = (
          42.333333333333330000
          359.833333333333300000
          148.166666666666700000
          182.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date Required'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
        Left = 904
        Top = 56
        Width = 48
        Height = 16
        Size.Values = (
          42.333333333333330000
          2391.833333333333000000
          148.166666666666700000
          127.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Order No.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
        Left = 480
        Top = 56
        Width = 49
        Height = 16
        Size.Values = (
          42.333333333333330000
          1270.000000000000000000
          148.166666666666700000
          129.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Start Date'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRLabel16: TQRLabel
        Left = 64
        Top = 56
        Width = 59
        Height = 16
        Size.Values = (
          42.333333333333330000
          169.333333333333300000
          148.166666666666700000
          156.104166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date Raised'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      Left = 19
      Top = 161
      Width = 1097
      Height = 35
      AfterPrint = QRSubDetail1AfterPrint
      AlignToBottom = False
      BeforePrint = QRSubDetail1BeforePrint
      TransparentBand = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        92.604166666666670000
        2902.479166666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = QuickReport
      DataSet = qryReport
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText3: TQRDBText
        Left = 871
        Top = 2
        Width = 81
        Height = 16
        Size.Values = (
          42.333333333333330000
          2304.520833333333000000
          5.291666666666667000
          214.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Purchase_Order'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRDBQuantityText1: TQRDBText
        Left = 517
        Top = 2
        Width = 89
        Height = 17
        Size.Values = (
          44.979166666666670000
          1367.895833333333000000
          5.291666666666667000
          235.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Job_Bag_Quantity'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object TotalCostLbl: TQRLabel
        Left = 636
        Top = 2
        Width = 60
        Height = 17
        Size.Values = (
          44.979166666666670000
          1682.750000000000000000
          5.291666666666667000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalCostLbl'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object TotalSellLbl: TQRLabel
        Left = 725
        Top = 2
        Width = 55
        Height = 17
        Size.Values = (
          44.979166666666670000
          1918.229166666667000000
          5.291666666666667000
          145.520833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalSellLbl'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object MarginQRBLabel: TQRLabel
        Left = 806
        Top = 2
        Width = 33
        Height = 17
        Size.Values = (
          44.979166666666670000
          2132.541666666667000000
          5.291666666666667000
          87.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Margin'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object MargPercQRLabel: TQRLabel
        Left = 863
        Top = 2
        Width = 31
        Height = 17
        Size.Values = (
          44.979166666666670000
          2283.354166666667000000
          5.291666666666667000
          82.020833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '%Age'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRDBText4: TQRDBText
        Left = 960
        Top = 2
        Width = 129
        Height = 17
        Size.Values = (
          44.979166666666670000
          2540.000000000000000000
          5.291666666666667000
          341.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Supplier_Name'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRDBText1: TQRDBText
        Left = 8
        Top = 2
        Width = 43
        Height = 16
        Size.Values = (
          42.333333333333330000
          21.166666666666670000
          5.291666666666667000
          113.770833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Job_Bag'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLblDesc: TQRLabel
        Left = 216
        Top = 16
        Width = 337
        Height = 16
        Size.Values = (
          42.333333333333330000
          571.500000000000000000
          42.333333333333330000
          891.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlblDesc'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRDBText2: TQRDBText
        Left = 136
        Top = 2
        Width = 82
        Height = 16
        Size.Values = (
          42.333333333333330000
          359.833333333333300000
          5.291666666666667000
          216.958333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Goods_Required'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRDBText7: TQRDBText
        Left = 480
        Top = 2
        Width = 52
        Height = 16
        Size.Values = (
          42.333333333333330000
          1270.000000000000000000
          5.291666666666667000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Date_Start'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRDBText9: TQRDBText
        Left = 64
        Top = 2
        Width = 52
        Height = 16
        Size.Values = (
          42.333333333333330000
          169.333333333333300000
          5.291666666666667000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Date_Point'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLblCust: TQRLabel
        Left = 216
        Top = 2
        Width = 52
        Height = 16
        Size.Values = (
          42.333333333333330000
          571.500000000000000000
          5.291666666666667000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'QRLblCust'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlblPODate: TQRLabel
        Left = 960
        Top = 16
        Width = 57
        Height = 16
        Size.Values = (
          42.333333333333330000
          2540.000000000000000000
          42.333333333333330000
          150.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblPODate'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
    end
    object RepQRFooter: TQRBand
      Left = 19
      Top = 238
      Width = 1097
      Height = 31
      AlignToBottom = False
      BeforePrint = RepQRFooterBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        82.020833333333330000
        2902.479166666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object Totals: TQRLabel
        Left = 424
        Top = 8
        Width = 186
        Height = 17
        Size.Values = (
          44.979166666666670000
          1121.833333333333000000
          21.166666666666670000
          492.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Total Sales Value'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRLblGroupSales: TQRLabel
        Left = 683
        Top = 8
        Width = 97
        Height = 17
        Size.Values = (
          44.979166666666670000
          1807.104166666667000000
          21.166666666666670000
          256.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'QRLblGroupSales'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
        Left = 525
        Top = 1
        Width = 369
        Height = 7
        Size.Values = (
          18.520833333333330000
          1389.062500000000000000
          2.645833333333333000
          976.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLblGroupCost: TQRLabel
        Left = 635
        Top = 8
        Width = 61
        Height = 17
        Size.Values = (
          44.979166666666670000
          1680.104166666667000000
          21.166666666666670000
          161.395833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblGrpTotal'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRlblGroupMargin: TQRLabel
        Left = 741
        Top = 8
        Width = 97
        Height = 17
        Size.Values = (
          44.979166666666670000
          1960.562500000000000000
          21.166666666666670000
          256.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'QRLblGroupSales'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRlblGroupMarginPerc: TQRLabel
        Left = 797
        Top = 8
        Width = 97
        Height = 17
        Size.Values = (
          44.979166666666670000
          2108.729166666667000000
          21.166666666666670000
          256.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'QRLblGroupSales'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
    object qrSummary: TQRBand
      Left = 19
      Top = 269
      Width = 1097
      Height = 32
      AlignToBottom = False
      BeforePrint = qrSummaryBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        84.666666666666670000
        2902.479166666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRLabel15: TQRLabel
        Left = 535
        Top = 7
        Width = 75
        Height = 17
        Size.Values = (
          44.979166666666670000
          1415.520833333333000000
          18.520833333333330000
          198.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Report Totals'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRLblReportSales: TQRLabel
        Left = 681
        Top = 7
        Width = 100
        Height = 17
        Size.Values = (
          44.979166666666670000
          1801.812500000000000000
          18.520833333333330000
          264.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'QRLblReportSales'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
        Left = 525
        Top = -3
        Width = 369
        Height = 12
        Size.Values = (
          31.750000000000000000
          1389.062500000000000000
          -7.937500000000000000
          976.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLblReportCost: TQRLabel
        Left = 618
        Top = 7
        Width = 78
        Height = 17
        Size.Values = (
          44.979166666666670000
          1635.125000000000000000
          18.520833333333330000
          206.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblReportTotal'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRlblReportMargin: TQRLabel
        Left = 735
        Top = 7
        Width = 104
        Height = 17
        Size.Values = (
          44.979166666666670000
          1944.687500000000000000
          18.520833333333330000
          275.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'QRlblReportMargin'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRlblReportMarginPerc: TQRLabel
        Left = 766
        Top = 7
        Width = 129
        Height = 17
        Size.Values = (
          44.979166666666670000
          2026.708333333333000000
          18.520833333333330000
          341.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'QRlblReportMarginPerc'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      Left = 19
      Top = 121
      Width = 1097
      Height = 16
      AlignToBottom = False
      TransparentBand = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        42.333333333333330000
        2902.479166666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      FooterBand = RepQRFooter
      Master = QRSubDetail1
      ReprintOnNewPage = False
      object GrpByQRDBText: TQRDBText
        Left = 11
        Top = 0
        Width = 82
        Height = 16
        Size.Values = (
          42.333333333333330000
          29.104166666666670000
          0.000000000000000000
          216.958333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        Font.Charset = ANSI_CHARSET
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
    object JobQRGroup: TQRGroup
      Left = 19
      Top = 137
      Width = 1097
      Height = 24
      AlignToBottom = False
      BeforePrint = JobQRGroupBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.500000000000000000
        2902.479166666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'qryReport.Job_Bag'
      FooterBand = JobQRFooter
      Master = QRSubDetail1
      ReprintOnNewPage = False
      object QRLabel13: TQRLabel
        Left = 9
        Top = 4
        Width = 47
        Height = 15
        Size.Values = (
          39.687500000000000000
          23.812500000000000000
          10.583333333333330000
          124.354166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Job Bag:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRDBText5: TQRDBText
        Left = 64
        Top = 4
        Width = 43
        Height = 15
        Size.Values = (
          39.687500000000000000
          169.333333333333300000
          10.583333333333330000
          113.770833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Job_Bag'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel14: TQRLabel
        Left = 152
        Top = 4
        Width = 67
        Height = 15
        Size.Values = (
          39.687500000000000000
          402.166666666666700000
          10.583333333333330000
          177.270833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Description:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRDBText6: TQRDBText
        Left = 232
        Top = 4
        Width = 78
        Height = 15
        Size.Values = (
          39.687500000000000000
          613.833333333333300000
          10.583333333333330000
          206.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Job_Bag_Descr'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
    end
    object JobQRFooter: TQRBand
      Left = 19
      Top = 196
      Width = 1097
      Height = 42
      AfterPrint = JobQRFooterAfterPrint
      AlignToBottom = False
      BeforePrint = JobQRFooterBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        111.125000000000000000
        2902.479166666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object qrshapeJobBag: TQRShape
        Left = 525
        Top = -4
        Width = 369
        Height = 12
        Size.Values = (
          31.750000000000000000
          1389.062500000000000000
          -10.583333333333330000
          976.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLblJobSales: TQRLabel
        Left = 728
        Top = 5
        Width = 52
        Height = 17
        Size.Values = (
          44.979166666666670000
          1926.166666666667000000
          13.229166666666670000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblGrpTotal'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRLblJobCost: TQRLabel
        Left = 644
        Top = 5
        Width = 52
        Height = 17
        Size.Values = (
          44.979166666666670000
          1703.916666666667000000
          13.229166666666670000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblGrpTotal'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRlblMargin: TQRLabel
        Left = 780
        Top = 5
        Width = 58
        Height = 17
        Size.Values = (
          44.979166666666670000
          2063.750000000000000000
          13.229166666666670000
          153.458333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'QRlblMargin'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRlblMarginPerc: TQRLabel
        Left = 814
        Top = 5
        Width = 80
        Height = 17
        Size.Values = (
          44.979166666666670000
          2153.708333333333000000
          13.229166666666670000
          211.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'QRlblMarginPerc'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object qrdbJobNumber: TQRDBText
        Left = 8
        Top = 6
        Width = 43
        Height = 15
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          15.875000000000000000
          113.770833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Job_Bag'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrdbJobDate: TQRDBText
        Left = 136
        Top = 6
        Width = 82
        Height = 15
        Size.Values = (
          39.687500000000000000
          359.833333333333300000
          15.875000000000000000
          216.958333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Goods_Required'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrdbJobDescription: TQRDBText
        Left = 216
        Top = 22
        Width = 361
        Height = 15
        Size.Values = (
          39.687500000000000000
          571.500000000000000000
          58.208333333333330000
          955.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Job_Bag_Descr'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrdbJobQuantity: TQRDBText
        Left = 564
        Top = 6
        Width = 41
        Height = 15
        Size.Values = (
          39.687500000000000000
          1492.250000000000000000
          15.875000000000000000
          108.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Quantity'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlblJobBagTotal: TQRLabel
        Left = 508
        Top = 5
        Width = 102
        Height = 17
        Size.Values = (
          44.979166666666670000
          1344.083333333333000000
          13.229166666666670000
          269.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Totals For Job Bag'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
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
      object QRDBText8: TQRDBText
        Left = 480
        Top = 5
        Width = 52
        Height = 16
        Size.Values = (
          42.333333333333330000
          1270.000000000000000000
          13.229166666666670000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Date_Start'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrdbJobCustomer: TQRDBText
        Left = 216
        Top = 6
        Width = 257
        Height = 15
        Size.Values = (
          39.687500000000000000
          571.500000000000000000
          15.875000000000000000
          679.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
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
        Left = 64
        Top = 5
        Width = 52
        Height = 16
        Size.Values = (
          42.333333333333330000
          169.333333333333300000
          13.229166666666670000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Date_Point'
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
      'SELECT Job_Bag_Line_Dets.Job_Bag,'
      '        Job_Bag_Line_Dets.Job_Bag_Line,'
      '        Job_Bag_Line_Dets.Job_Bag_Line_Descr,'
      '        Customer.Name as Customer_Name,'
      '        Supplier.Name as Supplier_Name,'
      '        Job_Bag_Line_Dets.Job_Bag_Line_Cost,'
      '        Job_Bag_Line_Dets.Job_Bag_Line_Sell,'
      '        Job_Bag_Line_Dets.Job_Bag_Quantity,'
      '        Job_Bag_Line_Dets.VAT_Code,'
      '        Job_Bag_Line_Dets.Purchase_Order,'
      '        Job_Bag_Line_Dets.Job_Bag_Line_Type,'
      '        Job_Bag.Cust_Order_No,'
      '        Rep.Rep,'
      '        Rep.Name as Rep_Name,'
      '        Vat_Code.Vat_Rate,'
      '        Job_Bag.Date_Point,'
      '        Job_Bag.Date_Start,'
      '        Job_Bag.Customer,'
      '        Job_Bag.Branch_no,'
      '        Customer_Branch.Name as Customer_Branch_Name,'
      '        Customer_Branch.Account_Code,'
      '        Job_Bag_Line_Dets.Supplier,'
      '        Job_Bag_Line_Dets.Branch_no as Supplier_Branch_no,'
      '        Supplier_Branch.Name as Supplier_Branch_Name,'
      '        Job_Bag.Job_Bag_Descr,'
      '        Job_Bag_Line_Dets.Product_Type'
      'FROM Vat_Code'
      '  INNER JOIN (Rep'
      '  INNER JOIN (Supplier'
      '  INNER JOIN (Supplier_Branch'
      '  INNER JOIN (Customer'
      '  INNER JOIN (Customer_Branch'
      '  INNER JOIN (Job_Bag'
      '  INNER JOIN Job_Bag_Line_Dets ON'
      '    Job_Bag.Job_Bag = Job_Bag_Line_Dets.Job_Bag) ON'
      '    (Customer_Branch.Branch_no = Job_Bag.Branch_No) AND'
      '    (Customer_Branch.Customer = Job_Bag.Customer)) ON'
      '    Customer.Customer = Customer_Branch.Customer) ON'
      
        '    (Supplier_Branch.Branch_no = Job_Bag_Line_Dets.Branch_No) AN' +
        'D'
      '    (Supplier_Branch.Supplier = Job_Bag_Line_Dets.Supplier)) ON'
      '    Supplier.Supplier = Supplier_Branch.Supplier) ON'
      '    Rep.Rep = Job_Bag.Rep) ON'
      '    Vat_Code.Vat_Code = Job_Bag_Line_Dets.VAT_Code'
      ' ')
    Left = 550
    Top = 16
  end
  object qryGetPOLine: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Purchase_OrderLine.Product_Type, Product_Type.Description'
      'from Purchase_OrderLine, Product_Type'
      'where Purchase_Order = :Purchase_Order and'
      'Purchase_OrderLine.Product_Type = Product_Type.Product_Type')
    Left = 755
    Top = 44
    ParamData = <
      item
        Name = 'Purchase_Order'
      end>
  end
  object qryGetProdType: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Product_Type.Product_Type, Product_Type.Description'
      'from Product_Type'
      'where Product_Type = :Product_Type')
    Left = 395
    Top = 44
    ParamData = <
      item
        Name = 'Product_Type'
      end>
  end
  object qryGetSuppInvoice: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT '#9'Supplier_Invoice_Line.Supplier_Invoice,'
      #9'Supplier_Invoice_Line.Invoice_Line_No,'
      #9'Supplier_Invoice_Line.Qty_Invoiced,'
      #9'Supplier_Invoice_Line.Goods_Value,'
      #9'Price_Unit.Price_Unit_Factor'
      'FROM Price_Unit'
      '  INNER JOIN Supplier_Invoice_Line'
      '    ON Price_Unit.Price_Unit = Supplier_Invoice_Line.Price_Unit'
      'WHERE Job_Bag = :Job_Bag and Job_Bag_Line = :Job_Bag_Line')
    Left = 864
    Top = 46
    ParamData = <
      item
        Name = 'Job_Bag'
      end
      item
        Name = 'Job_Bag_Line'
      end>
  end
  object qryGetSalesInvoice: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT '#9'Sales_Invoice_Line.Sales_Invoice, '
      #9'Sales_Invoice_Line.Invoice_Line_No, '
      #9'Sales_Invoice_Line.Qty_Invoiced, '
      #9'Sales_Invoice_Line.Goods_Value, '
      #9'Price_Unit.Price_Unit_Factor, '
      #9'SUM(Sales_Invoice_Add_charge.Amount) as Total_Charges'
      'FROM (Price_Unit '
      #9'INNER JOIN Sales_Invoice_Line '
      #9#9'ON Price_Unit.Price_Unit = Sales_Invoice_Line.Price_Unit) '
      #9'LEFT JOIN Sales_Invoice_Add_charge '
      
        #9#9'ON (Sales_Invoice_Line.Invoice_Line_No = Sales_Invoice_Add_cha' +
        'rge.Invoice_line_no) AND (Sales_Invoice_Line.Sales_Invoice = Sal' +
        'es_Invoice_Add_charge.Sales_Invoice)'
      'WHERE Job_Bag = :Job_Bag and Job_Bag_Line = :Job_Bag_Line'
      'GROUP BY'
      ' '#9'Sales_Invoice_Line.Sales_Invoice, '
      #9'Sales_Invoice_Line.Invoice_Line_No, '
      #9'Sales_Invoice_Line.Qty_Invoiced, '
      #9'Sales_Invoice_Line.Goods_Value, '
      #9'Price_Unit.Price_Unit_Factor')
    Left = 984
    Top = 46
    ParamData = <
      item
        Name = 'Job_Bag'
      end
      item
        Name = 'Job_Bag_Line'
      end>
  end
  object qryGetSuppPOInvoice: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT '#9'Supplier_Invoice_Line.Supplier_Invoice,'
      #9'Supplier_Invoice_Line.Invoice_Line_No,'
      #9'Supplier_Invoice_Line.Qty_Invoiced,'
      #9'Supplier_Invoice_Line.Goods_Value,'
      #9'Price_Unit.Price_Unit_Factor,'
      #9'SUM(Supplier_Invoice_Charge.Amount) as Total_Charges'
      'FROM Price_Unit '
      #9'INNER JOIN (Supplier_Invoice_Line '
      #9'LEFT JOIN Supplier_Invoice_Charge '
      
        #9#9'ON (Supplier_Invoice_Line.Supplier_Invoice = Supplier_Invoice_' +
        'Charge.Supplier_Invoice) '
      
        #9#9#9'AND (Supplier_Invoice_Line.Purchase_Order = Supplier_Invoice_' +
        'Charge.Purchase_Order) '
      
        #9#9#9'AND (Supplier_Invoice_Line.Line = Supplier_Invoice_Charge.Lin' +
        'e)) '
      #9#9'ON Price_Unit.Price_Unit = Supplier_Invoice_Line.Price_Unit'
      
        'WHERE Supplier_Invoice_Line.Purchase_order = :Purchase_order and' +
        ' Supplier_Invoice_Line.Line = :Line'
      'GROUP BY Supplier_Invoice_Line.Supplier_Invoice,'
      #9'Supplier_Invoice_Line.Invoice_Line_No,'
      #9'Supplier_Invoice_Line.Qty_Invoiced,'
      #9'Supplier_Invoice_Line.Goods_Value,'
      #9'Price_Unit.Price_Unit_Factor')
    Left = 864
    Top = 110
    ParamData = <
      item
        Name = 'Purchase_order'
      end
      item
        Name = 'Line'
      end>
  end
  object qryGetPO: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Purchase_Order.Date_Point'
      'From Purchase_Order'
      'WHERE Purchase_Order.Purchase_Order = :Purchase_Order')
    Left = 755
    Top = 108
    ParamData = <
      item
        Name = 'Purchase_Order'
      end>
  end
end
