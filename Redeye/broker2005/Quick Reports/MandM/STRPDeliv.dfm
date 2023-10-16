object STRPDelivfrm: TSTRPDelivfrm
  Left = 14
  Top = 75
  Caption = 'Sales Order Despatch Note '
  ClientHeight = 720
  ClientWidth = 1034
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Scaled = True
  OnCreate = FormCreate
  TextHeight = 13
  object PickSOListQuickReport: TQuickRep
    Left = 32
    Top = 16
    Width = 816
    Height = 1056
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
    PrinterSettings.Collate = 0
    PrinterSettings.ColorOption = 2
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
      Top = 38
      Width = 816
      Height = 163
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
        431.270833333333300000
        2159.000000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object PreviewQRLabel: TQRLabel
        Left = 680
        Top = 8
        Width = 80
        Height = 24
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
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object NotesQRMemo: TQRMemo
        Left = 24
        Top = 31
        Width = 272
        Height = 122
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
        Font.Height = -16
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
        Left = 392
        Top = 31
        Width = 272
        Height = 122
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
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 12
      end
      object QRLabel9: TQRLabel
        Left = 24
        Top = 8
        Width = 118
        Height = 24
        Size.Values = (
          63.500000000000000000
          63.500000000000000000
          21.166666666666670000
          312.208333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Delivery Address'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
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
      Top = 201
      Width = 816
      Height = 120
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
        Left = 16
        Top = 9
        Width = 94
        Height = 20
        Size.Values = (
          52.916666666666670000
          42.333333333333330000
          23.812500000000000000
          248.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Account Code'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
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
        Left = 168
        Top = 9
        Width = 95
        Height = 20
        Size.Values = (
          52.916666666666670000
          444.500000000000000000
          23.812500000000000000
          251.354166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer Ref'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
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
        Left = 656
        Top = 9
        Width = 109
        Height = 20
        Size.Values = (
          52.916666666666670000
          1735.666666666667000000
          23.812500000000000000
          288.395833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sales Order No.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
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
        Left = 168
        Top = 29
        Width = 102
        Height = 20
        Size.Values = (
          52.916666666666670000
          444.500000000000000000
          76.729166666666670000
          269.875000000000000000)
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
        Font.Height = -16
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
        Left = 656
        Top = 29
        Width = 78
        Height = 20
        Size.Values = (
          52.916666666666670000
          1735.666666666667000000
          76.729166666666670000
          206.375000000000000000)
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
        Font.Height = -16
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
        Left = 634
        Top = 98
        Width = 59
        Height = 20
        Size.Values = (
          52.916666666666670000
          1677.458333333333000000
          259.291666666666700000
          156.104166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Quantity'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
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
        Left = 176
        Top = 98
        Width = 78
        Height = 20
        Size.Values = (
          52.916666666666670000
          465.666666666666700000
          259.291666666666700000
          206.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Description'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
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
        Left = 558
        Top = 98
        Width = 65
        Height = 20
        Size.Values = (
          52.916666666666670000
          1476.375000000000000000
          259.291666666666700000
          171.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Pack Size'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
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
        Left = 536
        Top = 9
        Width = 96
        Height = 20
        Size.Values = (
          52.916666666666670000
          1418.166666666667000000
          23.812500000000000000
          254.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Delivery Date'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
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
        Left = 432
        Top = 9
        Width = 97
        Height = 20
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
        Font.Height = -16
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
        Left = 432
        Top = 29
        Width = 98
        Height = 20
        Size.Values = (
          52.916666666666670000
          1143.000000000000000000
          76.729166666666670000
          259.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'DelNoQRLabel'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
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
        Left = 536
        Top = 29
        Width = 80
        Height = 20
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
        Font.Height = -16
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
        Left = 747
        Top = 98
        Width = 43
        Height = 20
        Size.Values = (
          52.916666666666670000
          1976.437500000000000000
          259.291666666666700000
          113.770833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Boxes'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
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
        Left = 16
        Top = 29
        Width = 101
        Height = 20
        Size.Values = (
          52.916666666666670000
          42.333333333333330000
          76.729166666666670000
          267.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Account number'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
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
        Left = 16
        Top = 98
        Width = 91
        Height = 20
        Size.Values = (
          52.916666666666670000
          42.333333333333330000
          259.291666666666700000
          240.770833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Product Code'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
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
      Top = 321
      Width = 816
      Height = 25
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
        66.145833333333330000
        2159.000000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = PickSOListQuickReport
      DataSet = GetAllocDetQuery
      PrintBefore = False
      PrintIfEmpty = True
      object PartQRDBText: TQRDBText
        Left = 16
        Top = 2
        Width = 153
        Height = 20
        Size.Values = (
          52.916666666666660000
          42.333333333333340000
          5.291666666666667000
          404.812500000000000000)
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
        Font.Height = -16
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
        Left = 176
        Top = 2
        Width = 377
        Height = 20
        Size.Values = (
          52.916666666666660000
          465.666666666666800000
          5.291666666666667000
          997.479166666666900000)
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
        Font.Height = -16
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
      object QRDBText4: TQRDBText
        Left = 558
        Top = 2
        Width = 64
        Height = 20
        Size.Values = (
          52.916666666666660000
          1476.375000000000000000
          5.291666666666667000
          169.333333333333300000)
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
        Font.Height = -16
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
        Left = 701
        Top = 2
        Width = 91
        Height = 20
        Size.Values = (
          52.916666666666670000
          1854.729166666667000000
          5.291666666666667000
          240.770833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'QRLabelDlvrd'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
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
        Left = 627
        Top = 2
        Width = 66
        Height = 20
        Size.Values = (
          52.916666666666660000
          1658.937500000000000000
          5.291666666666667000
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
        Font.Height = -16
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
      Top = 369
      Width = 816
      Height = 21
      AlignToBottom = False
      BeforePrint = qrdetailSerialNosBeforePrint
      Enabled = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        55.562500000000000000
        2159.000000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = QRSubDetail1
      DataSet = GetAllocSerialNoSQL
      PrintBefore = False
      PrintIfEmpty = True
      object lblSerialCaption: TQRLabel
        Left = 120
        Top = 0
        Width = 98
        Height = 20
        Size.Values = (
          52.916666666666670000
          317.500000000000000000
          0.000000000000000000
          259.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Serial Numbers:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object lblSerialRange: TQRLabel
        Left = 224
        Top = 0
        Width = 87
        Height = 20
        Size.Values = (
          52.916666666666670000
          592.666666666666700000
          0.000000000000000000
          230.187500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'lblSerialRange'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
    end
    object chldbndFSCClaim: TQRChildBand
      Left = 0
      Top = 346
      Width = 816
      Height = 23
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      LinkBand = QRSubDetail1
      Size.Values = (
        60.854166666666670000
        2159.000000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = QRSubDetail1
      PrintOrder = cboAfterParent
      object gtlblFSCClaim: TQRLabel
        Left = 16
        Top = 3
        Width = 65
        Height = 16
        Size.Values = (
          42.333333333333330000
          42.333333333333330000
          7.937500000000000000
          171.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'FSC Claim:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
  end
  object AllocDataSource: TDataSource
    DataSet = GetAllocMasterQuery
    Left = 17
    Top = 70
  end
  object GetAllocDetQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Part.Part, Part.Part_Description,Sales_Order.Sales_Order,'
      
        '  Sales_Order.Delivery_Customer, Sales_Order.Delivery_Branch, Sa' +
        'les_Order.Customer, Sales_Order.Branch_No, Sales_Order.Date_Requ' +
        'ired,'
      
        '  Sales_Order.Date_Ordered, Sales_Order.Cust_Order_No, Sales_Ord' +
        'er.Ad_Hoc_Address,'
      '  Sales_order_Line.Quantity_Ordered,'
      '  Sales_Order_Line.Quantity_Delivered,'
      '  Sales_order_Line.Sell_Pack_Quantity,'
      '  Part.Part_Purchase_Price,'
      '  Part.Part_Cost_List,'
      '  Sales_Order.Cost_Centre,'
      '  Sales_order.Narrative,'
      '  Sales_order_line.sales_order_line_no,'
      '  Part.FSC_Material_Claim,'
      '  Part.FSC_Mixed_Percentage'
      'FROM'
      ' Part, Sales_Order, Sales_Order_Line'
      'WHERE'
      '  Sales_Order.Sales_Order = Sales_Order_Line.Sales_Order and'
      '  Sales_order_Line.Part = Part.Part and'
      '  Sales_Order.Sales_Order = :Sel1'
      'ORDER BY'
      '  Sales_Order.Sales_Order,'
      '  Part.Part'
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
    Left = 51
    Top = 104
    ParamData = <
      item
        Name = 'Sel1'
        DataType = ftInteger
      end>
  end
  object oldGetAllocMasterQuery: TFDQuery
    ConnectionName = 'PB'
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
        Name = 'Int_Sel_Code'
        DataType = ftInteger
      end>
  end
  object UpdAllocDetQuery: TFDQuery
    ConnectionName = 'PB'
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
    Left = 48
    Top = 152
    ParamData = <
      item
        Name = 'Picking_List_Ref'
      end
      item
        Name = 'Store_Record'
      end>
  end
  object GetAllAllocDetQuery: TFDQuery
    ConnectionName = 'PB'
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
    Left = 56
    Top = 212
    ParamData = <
      item
        Name = 'Sel1'
      end>
  end
  object UpdRefQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update Company'
      'set Picking_List_Ref =:Picking_Ref_No '
      ' ')
    Left = 590
    Top = 118
    ParamData = <
      item
        Name = 'Picking_Ref_No'
        DataType = ftString
      end>
  end
  object GetCustSQL: TFDQuery
    ConnectionName = 'PB'
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
      'Inv_To_Branch,'
      'Customer_Branch.Name as Branch_Name,'
      'Customer_Branch.Use_Branch_Name'
      'from'
      '  Customer_Branch, Customer'
      'where'
      '  ((Customer_Branch.Customer = :Customer) and'
      '   (Branch_no = :Branch_no)) and'
      '  Customer_Branch.Customer = Customer.Customer'
      ' '
      ' ')
    Left = 366
    Top = 107
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
      end
      item
        Name = 'Branch_No'
        DataType = ftInteger
      end>
  end
  object UpdSOHeadSQL: TFDQuery
    ConnectionName = 'PB'
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
        Name = 'status'
      end
      item
        Name = 'Sales_Order'
      end>
  end
  object GetDelivNarrSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Narrative_Text'
      'from Narrative_Line'
      'where Narrative = :Narrative'
      ' ')
    Left = 230
    Top = 222
    ParamData = <
      item
        Name = 'Narrative'
      end>
  end
  object AddDelivDetSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Sales_order_Delivery'
      
        '(Sales_Order, Sales_Order_Line_No, Sales_Order_Delivery, Quantit' +
        'y_Delivered,'
      '  Delivery_Date, Despatch_Note_No)'
      'values'
      
        '(:Sales_Order, :Sales_Order_Line_No, :Sales_Order_Deliv, :Qty_De' +
        'liv, :Del_Dt,'
      '  :Desp_Note_No)'
      ' ')
    Left = 230
    Top = 196
    ParamData = <
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Sales_Order_Line_No'
      end
      item
        Name = 'Sales_Order_Deliv'
      end
      item
        Name = 'Qty_Deliv'
      end
      item
        Name = 'Del_Dt'
      end
      item
        Name = 'Desp_Note_No'
      end>
  end
  object GetDelivCountSQL: TFDQuery
    ConnectionName = 'PB'
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
        Name = 'sales_order'
      end>
  end
  object GetNextSODelivSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Max(Sales_Order_Delivery) as Last_Code'
      'From Sales_order_Delivery')
    Left = 536
    Top = 140
  end
  object GetAllocMasterQuery: TFDQuery
    ConnectionName = 'PB'
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
      '  (Sales_Order.Replenish_Source >= 2)'
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
        Name = 'Int_Sel_Code'
        DataType = ftInteger
      end
      item
        Name = 'Sales_Order'
        DataType = ftInteger
      end
      item
        Name = 'Status_from'
        DataType = ftInteger
      end
      item
        Name = 'Status_to'
        DataType = ftInteger
      end>
  end
  object DummySQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'select Int_sel.*, Sales_Order.Sales_Order, Sales_Order.Sales_ord' +
        'er_Head_Status'
      'from'
      '  Int_Sel, Sales_Order'
      'where'
      '  (Int_Sel.Int_Sel_Code = :Int_Sel_Code) and'
      
        '  ((Sales_order.Sales_Order = Int_Sel.Sel1) or (:Sales_Order = 0' +
        ')) and'
      '  (Sales_order.Sales_order_Head_Status >= :Status_from) and'
      '  (Sales_order.Replenish_Source >= 2)'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 246
    Top = 34
    ParamData = <
      item
        Name = 'Int_Sel_Code'
        DataType = ftInteger
      end
      item
        Name = 'Sales_Order'
        DataType = ftInteger
      end
      item
        Name = 'Status_from'
      end>
  end
  object AdhocSQL: TFDQuery
    ConnectionName = 'PB'
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
        Name = 'Ad_hoc_Address'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object AddressSRC: TDataSource
    Left = 112
    Top = 8
  end
  object GetAccountSQL: TFDQuery
    ConnectionName = 'PB'
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
        Name = 'Customer'
        DataType = ftInteger
      end
      item
        Name = 'Branch_No'
        DataType = ftInteger
      end>
  end
  object GetAllocSerialNoSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * '
      'from sales_order_line_serial_no'
      'where Sales_order = :Sales_order and '
      '  Sales_order_line_no = :Sales_order_line_no')
    Left = 313
    Top = 139
    ParamData = <
      item
        Name = 'Sales_order'
      end
      item
        Name = 'Sales_order_line_no'
      end>
  end
  object qryGetFSCClaim: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from FSC_Material_Claim'
      'where FSC_Material_Claim = :FSC_Material_Claim')
    Left = 726
    Top = 198
    ParamData = <
      item
        Name = 'FSC_Material_Claim'
      end>
  end
end
