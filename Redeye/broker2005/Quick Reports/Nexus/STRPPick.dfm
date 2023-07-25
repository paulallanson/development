object STRPPickfrm: TSTRPPickfrm
  Left = 5
  Top = 45
  Caption = 'Sales Order Despatch Note '
  ClientHeight = 573
  ClientWidth = 903
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Scaled = False
  OnCreate = FormCreate
  TextHeight = 13
  object PickSOListQuickReport: TQuickRep
    Left = 0
    Top = 8
    Width = 1020
    Height = 1320
    ShowingPreview = False
    BeforePrint = PickSOListQuickReportBeforePrint
    DataSet = GetAllocMasterQuery
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Times New Roman'
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
    Page.PaperSize = Letter
    Page.Continuous = False
    Page.Values = (
      400.000000000000000000
      2794.000000000000000000
      100.000000000000000000
      2159.000000000000000000
      0.000000000000000000
      0.000000000000000000
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
    PrintIfEmpty = False
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
    object PageHeadQRBand: TQRBand
      Left = 0
      Top = 47
      Width = 1020
      Height = 204
      AfterPrint = PageHeadQRBandAfterPrint
      AlignToBottom = False
      BeforePrint = PageHeadQRBandBeforePrint
      TransparentBand = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        431.800000000000000000
        2159.000000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object PreviewQRLabel: TQRLabel
        Left = 850
        Top = 10
        Width = 100
        Height = 30
        Size.Values = (
          63.500000000000000000
          1799.166666666670000000
          21.166666666666700000
          211.666666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'PREVIEW'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object NotesQRMemo: TQRMemo
        Left = 30
        Top = 39
        Width = 340
        Height = 153
        Size.Values = (
          322.791666666667000000
          63.500000000000000000
          82.020833333333300000
          719.666666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Times New Roman'
        Font.Style = []
        Lines.Strings = (
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 12
      end
      object DelInstructMemo: TQRMemo
        Left = 490
        Top = 39
        Width = 340
        Height = 153
        Size.Values = (
          322.791666666667000000
          1037.166666666670000000
          82.020833333333300000
          719.666666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 12
      end
      object QRLabel9: TQRLabel
        Left = 30
        Top = 10
        Width = 146
        Height = 30
        Size.Values = (
          63.500000000000000000
          63.500000000000000000
          21.166666666666670000
          309.033333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Delivery Address'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
    end
    object GroupHeadQRGroup: TQRGroup
      Left = 0
      Top = 251
      Width = 1020
      Height = 150
      AlignToBottom = False
      BeforePrint = GroupHeadQRGroupBeforePrint
      TransparentBand = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = True
      ParentFont = False
      Size.Values = (
        317.500000000000000000
        2159.000000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'GetAllocMasterQuery.Sales_Order'
      Master = PickSOListQuickReport
      ReprintOnNewPage = True
      object AccNoQRLabel: TQRLabel
        Left = 20
        Top = 11
        Width = 119
        Height = 25
        Size.Values = (
          52.916666666666670000
          42.333333333333330000
          23.283333333333330000
          251.883333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Account Code'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object CustRefQRLabel: TQRLabel
        Left = 210
        Top = 11
        Width = 119
        Height = 25
        Size.Values = (
          52.916666666666670000
          444.500000000000000000
          23.283333333333330000
          251.883333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer Ref'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object SONOQRLabel: TQRLabel
        Left = 820
        Top = 11
        Width = 136
        Height = 25
        Size.Values = (
          52.916666666666670000
          1735.666666666667000000
          23.283333333333330000
          287.866666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sales Order No.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object CustRefQRDBText: TQRDBText
        Left = 210
        Top = 36
        Width = 127
        Height = 25
        Size.Values = (
          52.916666666666670000
          444.500000000000000000
          76.200000000000000000
          268.816666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = GetAllocDetQuery
        DataField = 'Cust_Order_No'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object SoNumQRDBText: TQRDBText
        Left = 820
        Top = 36
        Width = 101
        Height = 25
        Size.Values = (
          52.916666666666670000
          1735.666666666667000000
          76.200000000000000000
          213.783333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = GetAllocDetQuery
        DataField = 'Sales_Order'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRLabel1: TQRLabel
        Left = 642
        Top = 123
        Width = 76
        Height = 25
        Size.Values = (
          52.916666666666670000
          1358.900000000000000000
          260.350000000000000000
          160.866666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Quantity'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRLabel4: TQRLabel
        Left = 860
        Top = 123
        Width = 29
        Height = 25
        Size.Values = (
          52.916666666666670000
          1820.333333333333000000
          260.350000000000000000
          61.383333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Bin'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRLabel5: TQRLabel
        Left = 170
        Top = 123
        Width = 97
        Height = 25
        Size.Values = (
          52.916666666666670000
          359.833333333333300000
          260.350000000000000000
          205.316666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Description'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRLabel7: TQRLabel
        Left = 548
        Top = 123
        Width = 84
        Height = 25
        Size.Values = (
          52.916666666666670000
          1159.933333333333000000
          260.350000000000000000
          177.800000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Pack Size'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRLabel8: TQRLabel
        Left = 670
        Top = 11
        Width = 119
        Height = 25
        Size.Values = (
          52.916666666666670000
          1418.166666666667000000
          23.283333333333330000
          251.883333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Delivery Date'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object TciketQRLabel: TQRLabel
        Left = 540
        Top = 11
        Width = 121
        Height = 25
        Size.Values = (
          52.916666666666700000
          1143.000000000000000000
          23.812500000000000000
          256.645833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Delivery No.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object DelNoQRLabel: TQRLabel
        Left = 540
        Top = 36
        Width = 126
        Height = 25
        Size.Values = (
          52.916666666666670000
          1143.000000000000000000
          76.200000000000000000
          266.700000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'DelNoQRLabel'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object DespDtQRLbl: TQRLabel
        Left = 670
        Top = 36
        Width = 100
        Height = 25
        Size.Values = (
          52.916666666666700000
          1418.166666666670000000
          76.729166666666700000
          211.666666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'DespDtQRLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRLabel6: TQRLabel
        Left = 784
        Top = 123
        Width = 52
        Height = 25
        Size.Values = (
          52.916666666666670000
          1659.466666666667000000
          260.350000000000000000
          110.066666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Boxes'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRLblAccnt: TQRLabel
        Left = 20
        Top = 36
        Width = 129
        Height = 25
        Size.Values = (
          52.916666666666670000
          42.333333333333330000
          76.200000000000000000
          273.050000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Account number'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRLabel10: TQRLabel
        Left = 20
        Top = 123
        Width = 116
        Height = 25
        Size.Values = (
          52.916666666666670000
          42.333333333333330000
          260.350000000000000000
          245.533333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Product Code'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
    end
    object QRSubDetail1: TQRSubDetail
      Left = 0
      Top = 401
      Width = 1020
      Height = 31
      AlignToBottom = False
      BeforePrint = QRSubDetail1BeforePrint
      TransparentBand = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        65.616666666666670000
        2159.000000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = PickSOListQuickReport
      DataSet = GetAllocDetQuery
      PrintBefore = False
      PrintIfEmpty = True
      object PartQRDBText: TQRDBText
        Left = 20
        Top = 3
        Width = 141
        Height = 25
        Size.Values = (
          52.916666666666700000
          42.333333333333300000
          5.291666666666670000
          298.979166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = GetAllocDetQuery
        DataField = 'Part'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object DescQRDBText: TQRDBText
        Left = 170
        Top = 3
        Width = 371
        Height = 25
        Size.Values = (
          52.916666666666700000
          359.833333333333000000
          5.291666666666670000
          785.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = GetAllocDetQuery
        DataField = 'Part_Description'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object BinQRDBText: TQRDBText
        Left = 860
        Top = 3
        Width = 91
        Height = 25
        Size.Values = (
          52.916666666666700000
          1820.333333333330000000
          5.291666666666670000
          193.145833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = GetAllocDetQuery
        DataField = 'Part_Bin'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Times New Roman'
        Font.Style = []
        Mask = '######'
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRDBText4: TQRDBText
        Left = 548
        Top = 3
        Width = 80
        Height = 25
        Size.Values = (
          52.916666666666700000
          1158.875000000000000000
          5.291666666666670000
          169.333333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = GetAllocDetQuery
        DataField = 'Sell_Pack_Quantity'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRLabelDlvrd: TQRLabel
        Left = 720
        Top = 3
        Width = 120
        Height = 25
        Size.Values = (
          52.916666666666670000
          1524.000000000000000000
          6.350000000000000000
          254.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'QRLabelDlvrd'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRLabelQty: TQRLabel
        Left = 634
        Top = 3
        Width = 83
        Height = 25
        Size.Values = (
          52.916666666666700000
          1341.437500000000000000
          5.291666666666670000
          174.625000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'QRLabelQty'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
    end
    object qrdetailSerialNos: TQRSubDetail
      Left = 0
      Top = 432
      Width = 1020
      Height = 31
      AfterPrint = qrdetailSerialNosAfterPrint
      AlignToBottom = False
      BeforePrint = qrdetailSerialNosBeforePrint
      Enabled = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        65.616666666666670000
        2159.000000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = QRSubDetail1
      DataSet = GetAllocSerialNoSQL
      PrintBefore = False
      PrintIfEmpty = True
      object lblSerialCaption: TQRLabel
        Left = 170
        Top = 3
        Width = 131
        Height = 25
        Size.Values = (
          52.916666666666670000
          359.833333333333300000
          6.350000000000000000
          277.283333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Serial Numbers:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object lblSerialRange: TQRLabel
        Left = 310
        Top = 3
        Width = 120
        Height = 25
        Size.Values = (
          52.916666666666670000
          656.166666666666700000
          6.350000000000000000
          254.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'lblSerialRange'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
    end
  end
  object AllocDataSource: TDataSource
    DataSet = GetAllocMasterQuery
    Left = 17
    Top = 70
  end
  object GetAllocDetQuery: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT'
      '  Part_Store_Allocation.Store_stock,'
      '  Part_Store_Allocation.Picking_List_Ref,'
      '  Part_Store_Allocation.Sales_order_Line_No,'
      
        '  Store_Stock.Part_Bin,Part_Store.Part_Store_Name, Part_Store.St' +
        'ock_Bins_In_Use,'
      '  Part_Store.Stock_Lots_In_Use,'
      '  Store_Stock.Part_Store_Lot,'
      '  Part.Part, Part.Part_Description,Sales_Order.Sales_Order,'
      
        '  Sales_Order.Delivery_Customer, Sales_Order.Delivery_Branch, Sa' +
        'les_Order.Customer, Sales_Order.Branch_No, Sales_Order.Date_Requ' +
        'ired,'
      
        '  Sales_Order.Date_Ordered, Sales_Order.Cust_Order_No, Sales_Ord' +
        'er.Ad_Hoc_Address,'
      '  SUM(Part_Store_Allocation.Quantity_Allocated) as qty_alloc,'
      '  Sales_order_Line.Quantity_Ordered,'
      '  Part.Sell_Pack_Quantity,'
      '  Part.Part_Purchase_Price,'
      '  Part.Part_Cost_List,'
      '  Sales_Order.Cost_Centre,'
      '  Sales_order.Narrative'
      'FROM'
      
        '  Part_Store_Allocation, Store_Stock, Part_Store, Part, Sales_Or' +
        'der, Sales_Order_Line'
      'WHERE'
      
        '  Part_Store_Allocation.Store_Stock = Store_Stock.Store_Stock an' +
        'd'
      
        '  Part_Store_Allocation.Sales_Order = Sales_Order.Sales_Order an' +
        'd'
      '  Sales_Order.Sales_Order = Sales_Order_Line.Sales_Order and'
      '  Store_Stock.Part_Store = Part_Store.Part_Store and'
      '  Store_Stock.Part = Sales_Order_Line.Part and'
      '  Store_Stock.Part = Part.Part  and'
      '  Sales_Order.Sales_Order = :Sel1'
      'GROUP BY'
      '  Part_Store_Allocation.Store_stock,'
      '  Part_Store_Allocation.Picking_List_Ref,'
      '  Part_Store_Allocation.Sales_order_Line_No,'
      
        '  Store_Stock.Part_Bin,Part_Store.Part_Store_Name,Part_Store.Sto' +
        'ck_Bins_In_Use,'
      '  Part_Store.Stock_Lots_In_Use,'
      '  Store_Stock.Part_Store_Lot,'
      '  Part.Part, Part.Part_Description,Sales_Order.Sales_Order,'
      
        '  Sales_Order.Delivery_Customer, Sales_Order.Delivery_Branch, Sa' +
        'les_Order.Customer, Sales_Order.Branch_No, Sales_Order.Date_Requ' +
        'ired,'
      
        '  Sales_Order.Date_Ordered, Sales_Order.Cust_Order_No, Sales_Ord' +
        'er.Ad_Hoc_Address,'
      '  Sales_order_Line.Quantity_Ordered,'
      '  Part.Sell_Pack_Quantity,'
      '  Part.Part_Purchase_Price,'
      '  Part.Part_Cost_List,'
      '  Sales_Order.Cost_Centre,'
      '  Sales_order.Narrative'
      'ORDER BY'
      '  Sales_Order.Sales_Order,'
      '  Part.Part,'
      '  Store_Stock.Part_Bin'
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
    Left = 3
    Top = 104
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Sel1'
        ParamType = ptUnknown
      end>
  end
  object oldGetAllocMasterQuery: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Sel1, Sel2'
      'from'
      '  Int_Sel'
      'where'
      '  Int_Sel.Int_Sel_Code = :Int_Sel_Code and'
      '  (Int_Sel.Sel1 <> 0)'
      'order by'
      '  Sel2, Sel1'
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
    Left = 48
    Top = 32
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Int_Sel_Code'
        ParamType = ptUnknown
      end>
  end
  object UpdAllocDetQuery: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Update Part_Store_Allocation'
      '  Set Picking_List_Ref = :Picking_List_Ref'
      'WHERE'
      '  Part_Store_Allocation.Part_Store_Allocation = :Store_Record'
      '  '
      ' '
      ' '
      ' '
      ' ')
    Left = 8
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Picking_List_Ref'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Store_Record'
        ParamType = ptUnknown
      end>
  end
  object GetAllAllocDetQuery: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT Part_Store_Allocation.Part_Store_Allocation'
      'FROM'
      '  Part_Store_Allocation, Sales_Order'
      'WHERE'
      
        '  Part_Store_Allocation.Sales_Order = Sales_Order.Sales_Order an' +
        'd'
      '  Sales_Order.Sales_Order = :Sel1'
      ''
      ''
      ''
      ''
      ''
      ' '
      ''
      ' '
      ' '
      ' ')
    Left = 16
    Top = 188
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sel1'
        ParamType = ptUnknown
      end>
  end
  object UpdRefQuery: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'update Company'
      'set Picking_List_Ref =:Picking_Ref_No '
      ' ')
    Left = 590
    Top = 118
    ParamData = <
      item
        DataType = ftString
        Name = 'Picking_Ref_No'
        ParamType = ptUnknown
      end>
  end
  object GetCustSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Customer.Name as Cust_Name,'
      'Building_no_name,'
      'Street,'
      'Locale,'
      'Town,'
      'Postcode,'
      'Delivery_Narrative,'
      'Account_Code,'
      'Inv_To_Customer,'
      'Inv_To_Branch'
      'from'
      '  Customer_Branch, Customer'
      'where'
      '  ((Customer_Branch.Customer = :Customer) and'
      '   (Branch_no = :Branch_no)) and'
      '  Customer_Branch.Customer = Customer.Customer'
      ' ')
    Left = 366
    Top = 107
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Branch_No'
        ParamType = ptUnknown
      end>
  end
  object UpdSOHeadSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Update Sales_Order'
      'Set sales_Order.Sales_order_Head_Status = :status'
      'where'
      'Sales_Order.Sales_Order = :Sales_Order'
      ' '
      ' ')
    Left = 374
    Top = 134
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end>
  end
  object GetDelivNarrSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select Narrative_Text'
      'from Narrative_Line'
      'where Narrative = :Narrative'
      ' ')
    Left = 230
    Top = 222
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Narrative'
        ParamType = ptUnknown
      end>
  end
  object GetDelivCountSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select sales_order'
      'from sales_order_delivery'
      'where (sales_order = :sales_order) '
      ' '
      ' ')
    Left = 166
    Top = 180
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'sales_order'
        ParamType = ptUnknown
      end>
  end
  object GetNextSODelivSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select Max(Sales_Order_Delivery) as Last_Code'
      'From Sales_order_Delivery')
    Left = 536
    Top = 140
  end
  object GetAllocMasterQuery: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      
        'select Int_sel.*, Sales_Order.Sales_Order, Sales_Order.Sales_ord' +
        'er_Head_Status'
      'from'
      '  Int_Sel, Sales_Order'
      'where'
      '  (Int_Sel.Int_Sel_Code = :Int_Sel_Code) and'
      
        '  ((Sales_order.Sales_Order = Int_Sel.Sel1) or (:Sales_Order = 0' +
        ')) and'
      '  ((Sales_order.Sales_order_Head_Status >= :Status_from) and'
      '  (Sales_order.Sales_order_Head_Status <= :Status_to)) and'
      '  (Sales_Order.Replenish_Source = 2)'
      ''
      ''
      '  '
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
    Left = 192
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Int_Sel_Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Status_from'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Status_to'
        ParamType = ptUnknown
      end>
  end
  object DummySQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      
        'select Int_sel.*, Sales_Order.Sales_Order, Sales_Order.Sales_ord' +
        'er_Head_Status'
      'from'
      '  Int_Sel, Sales_Order'
      'where'
      '  (Int_Sel.Int_Sel_Code = :Int_Sel_Code) and'
      
        '  ((Sales_order.Sales_Order = Int_Sel.Sel1) or (:Sales_Order = 0' +
        ')) and'
      '  ((Sales_order.Sales_order_Head_Status >= :Status_from) and'
      '  (Sales_order.Sales_order_Head_Status <= :Status_to))and'
      '  (Sales_order.Replenish_Source = 2)'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 246
    Top = 34
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Int_Sel_Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Status_from'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Status_to'
        ParamType = ptUnknown
      end>
  end
  object AdhocSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Name,'
      '  Building_no_name,'
      '  Street,'
      '  Locale,'
      '  Town,'
      '  Postcode,'
      '  Delivery_Narrative'
      'from Ad_hoc_Address'
      'where Ad_hoc_Address = :Ad_hoc_Address'
      ' ')
    Left = 896
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Ad_hoc_Address'
        ParamType = ptInput
      end>
  end
  object AddressSRC: TDataSource
    Left = 176
    Top = 8
  end
  object GetAccountSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Account_Code'
      'from'
      '  Customer_Branch, Customer'
      'where'
      '  ((Customer_Branch.Customer = :Customer) and'
      '   (Branch_no = :Branch_no)) and'
      '  Customer_Branch.Customer = Customer.Customer'
      ' '
      ' ')
    Left = 398
    Top = 67
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Branch_No'
        ParamType = ptUnknown
      end>
  end
  object AddDelivDetSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Insert Into Sales_order_Delivery'
      
        '(Sales_Order, Sales_Order_Delivery_No, Delivery_Date, Despatch_N' +
        'ote_No, Delivery_Type,'
      
        '  Date_Picked, Delivery_Weight_Kilos, No_of_Boxes, Delivery_Inst' +
        'ructions,'
      '  Consignment_Number, Courier, Service_No)'
      'values'
      
        '(:Sales_Order,:Sales_Order_Deliv, :Del_Dt, :Desp_Note_No, :Del_T' +
        'ype,'
      '  :Del_Dt, 0, 0, '#39#39','
      '  '#39#39', :Courier, 0)'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 230
    Top = 196
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Order_Deliv'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Del_Dt'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Desp_Note_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Del_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Del_Dt'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Courier'
        ParamType = ptUnknown
      end>
  end
  object AddDelivLineDetSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Insert Into Sales_order_Delivery_Line'
      
        '(Sales_Order, Sales_Order_Delivery_No, Sales_Order_line_No, Quan' +
        'tity_Delivered,'
      '  Quantity_Picked)'
      'values'
      '(:Sales_Order, :Sales_Order_Deliv, :Sales_order_Line_No, 0, 0)'
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 254
    Top = 156
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Order_Deliv'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_order_Line_No'
        ParamType = ptUnknown
      end>
  end
  object CheckDelivSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Quantity_Delivered'
      'from Sales_order_Delivery_Line'
      
        'where (sales_order = :Sales_Order) and (Sales_Order_Line_No = :S' +
        'ales_Order_Line_No) and'
      '  (Sales_Order_Delivery_No = :Sales_Order_Deliv)'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 302
    Top = 212
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Order_Line_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Order_Deliv'
        ParamType = ptUnknown
      end>
  end
  object GetAllocSerialNoSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select * '
      'from Store_stock_serial_item'
      'where store_stock = :Store_stock and'
      'Sales_order = :Sales_order')
    Left = 729
    Top = 123
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Store_stock'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_order'
        ParamType = ptUnknown
      end>
  end
end
