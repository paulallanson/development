object STRPPickfrm: TSTRPPickfrm
  Left = 5
  Top = 29
  Caption = 'Sales Order Pick Note '
  ClientHeight = 609
  ClientWidth = 1181
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
    Left = 32
    Top = 16
    Width = 1123
    Height = 794
    ShowingPreview = False
    BeforePrint = PickSOListQuickReportBeforePrint
    DataSet = GetAllocMasterQuery
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Gill Sans MT'
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
      65.000000000000000000
      50.000000000000000000
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
      Left = 25
      Top = 38
      Width = 1080
      Height = 336
      Frame.DrawBottom = True
      Frame.Width = 2
      AfterPrint = PageHeadQRBandAfterPrint
      AlignToBottom = False
      BeforePrint = PageHeadQRBandBeforePrint
      TransparentBand = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Gill Sans MT'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        889.000000000000000000
        2857.500000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object QRLabel1: TQRLabel
        Left = 23
        Top = 294
        Width = 58
        Height = 33
        Size.Values = (
          87.312500000000000000
          60.854166666666680000
          777.875000000000000000
          153.458333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Quantity Ordered'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object PreviewQRLabel: TQRLabel
        Left = 984
        Top = 32
        Width = 80
        Height = 24
        Size.Values = (
          63.500000000000000000
          2603.500000000000000000
          84.666666666666680000
          211.666666666666700000)
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
        Font.Height = -16
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object NotesQRMemo: TQRMemo
        Left = 344
        Top = 129
        Width = 272
        Height = 100
        Size.Values = (
          264.583333333333300000
          910.166666666666800000
          341.312500000000000000
          719.666666666666800000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = []
        Lines.Strings = (
          'XXXXXXXXXXXXXXXXXXXXXXXX'
          'XXXXXXXXXXXXXXXXXXXXXXXX'
          'XXXXXXXXXXXXXXXXXXXXXXXX'
          'XXXXXXXXXXXXXXXXXXXXXXXX'
          'XXXXXXXXXXXXXXXXXXXXXXXX')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object DelInstructMemo: TQRMemo
        Left = 793
        Top = 127
        Width = 272
        Height = 100
        Size.Values = (
          264.583333333333300000
          2098.145833333333000000
          336.020833333333300000
          719.666666666666800000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object QRLblAccnt: TQRLabel
        Left = 16
        Top = 256
        Width = 90
        Height = 18
        Size.Values = (
          47.625000000000000000
          42.333333333333330000
          677.333333333333300000
          238.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Account number'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object CustRefQRDBText: TQRDBText
        Left = 208
        Top = 256
        Width = 84
        Height = 18
        Size.Values = (
          47.625000000000000000
          550.333333333333300000
          677.333333333333300000
          222.250000000000000000)
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
        Font.Height = -12
        Font.Name = 'Lato'
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
      object DelNoQRLabel: TQRLabel
        Left = 736
        Top = 256
        Width = 105
        Height = 18
        Size.Values = (
          47.625000000000000000
          1947.333333333333000000
          677.333333333333300000
          277.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'DelNoQRLabel'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object DespDtQRLbl: TQRLabel
        Left = 576
        Top = 256
        Width = 80
        Height = 18
        Size.Values = (
          47.625000000000000000
          1524.000000000000000000
          677.333333333333300000
          211.666666666666700000)
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
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object SoNumQRDBText: TQRDBText
        Left = 440
        Top = 256
        Width = 65
        Height = 18
        Size.Values = (
          47.625000000000000000
          1164.166666666667000000
          677.333333333333300000
          171.979166666666700000)
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
        Font.Height = -12
        Font.Name = 'Lato'
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
      object QRLabel6: TQRLabel
        Left = 721
        Top = 295
        Width = 53
        Height = 32
        Size.Values = (
          84.666666666666680000
          1907.645833333333000000
          780.520833333333400000
          140.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Units to Pick'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel7: TQRLabel
        Left = 570
        Top = 310
        Width = 48
        Height = 17
        Size.Values = (
          44.979166666666670000
          1508.125000000000000000
          820.208333333333300000
          127.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Unit Size'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel5: TQRLabel
        Left = 304
        Top = 310
        Width = 64
        Height = 17
        Size.Values = (
          44.979166666666670000
          804.333333333333300000
          820.208333333333300000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Description'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel10: TQRLabel
        Left = 86
        Top = 310
        Width = 46
        Height = 17
        Size.Values = (
          44.979166666666670000
          227.541666666666700000
          820.208333333333300000
          121.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Product'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel4: TQRLabel
        Left = 784
        Top = 310
        Width = 19
        Height = 17
        Size.Values = (
          44.979166666666670000
          2074.333333333333000000
          820.208333333333300000
          50.270833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Bin'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qrlblAccountLabel: TQRLabel
        Left = 17
        Top = 237
        Width = 94
        Height = 17
        Size.Values = (
          44.979166666666670000
          44.979166666666670000
          627.062500000000000000
          248.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Account Number'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel3: TQRLabel
        Left = 209
        Top = 237
        Width = 77
        Height = 17
        Size.Values = (
          44.979166666666670000
          552.979166666666700000
          627.062500000000000000
          203.729166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer Ref.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel8: TQRLabel
        Left = 441
        Top = 237
        Width = 55
        Height = 17
        Size.Values = (
          44.979166666666670000
          1166.812500000000000000
          627.062500000000000000
          145.520833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Order No.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel9: TQRLabel
        Left = 577
        Top = 237
        Width = 80
        Height = 17
        Size.Values = (
          44.979166666666670000
          1526.645833333333000000
          627.062500000000000000
          211.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Despatch Date'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel11: TQRLabel
        Left = 745
        Top = 237
        Width = 95
        Height = 17
        Size.Values = (
          44.979166666666670000
          1971.145833333333000000
          627.062500000000000000
          251.354166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Delivery Note No.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel12: TQRLabel
        Left = 793
        Top = 108
        Width = 113
        Height = 17
        Size.Values = (
          44.979166666666670000
          2098.145833333333000000
          285.750000000000000000
          298.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Delivery Instructions'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel13: TQRLabel
        Left = 345
        Top = 108
        Width = 58
        Height = 17
        Size.Values = (
          44.979166666666670000
          912.812500000000000000
          285.750000000000000000
          153.458333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Deliver To:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel14: TQRLabel
        Left = 456
        Top = 24
        Width = 167
        Height = 36
        Size.Values = (
          95.250000000000000000
          1206.500000000000000000
          63.500000000000000000
          441.854166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Picking Note'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -29
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 22
      end
      object qrLblShortCode: TQRLabel
        Left = 626
        Top = 128
        Width = 86
        Height = 24
        Size.Values = (
          63.500000000000000000
          1656.291666666667000000
          338.666666666666700000
          227.541666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrLblShortCode'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qrlblWarehouse: TQRLabel
        Left = 496
        Top = 64
        Width = 92
        Height = 24
        Size.Values = (
          63.500000000000000000
          1312.333333333333000000
          169.333333333333300000
          243.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'qrlblWarehouse'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel2: TQRLabel
        Left = 641
        Top = 294
        Width = 56
        Height = 33
        Size.Values = (
          87.312500000000000000
          1695.979166666667000000
          777.875000000000000000
          148.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Unit of Measure'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel15: TQRLabel
        Left = 897
        Top = 296
        Width = 53
        Height = 31
        Size.Values = (
          82.020833333333340000
          2373.312500000000000000
          783.166666666666800000
          140.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Units Picked'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel18: TQRLabel
        Left = 17
        Top = 108
        Width = 57
        Height = 17
        Size.Values = (
          44.979166666666670000
          44.979166666666670000
          285.750000000000000000
          150.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object CustomerAddMemo: TQRMemo
        Left = 16
        Top = 129
        Width = 272
        Height = 100
        Size.Values = (
          264.583333333333300000
          42.333333333333330000
          341.312500000000000000
          719.666666666666800000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = []
        Lines.Strings = (
          'XXXXXXXXXXXXXXXXXXXXXXXX'
          'XXXXXXXXXXXXXXXXXXXXXXXX'
          'XXXXXXXXXXXXXXXXXXXXXXXX'
          'XXXXXXXXXXXXXXXXXXXXXXXX'
          'XXXXXXXXXXXXXXXXXXXXXXXX')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object gtQRLabel1: TQRLabel
        Left = 1001
        Top = 237
        Width = 65
        Height = 17
        Size.Values = (
          44.979166666666670000
          2648.479166666667000000
          627.062500000000000000
          171.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cost Centre'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object gtQRDBText3: TQRDBText
        Left = 1001
        Top = 256
        Width = 66
        Height = 18
        Size.Values = (
          47.625000000000000000
          2648.479166666667000000
          677.333333333333300000
          174.625000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataField = 'Cost_Centre'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
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
    object GroupHeadQRGroup: TQRGroup
      Left = 25
      Top = 374
      Width = 1080
      Height = 3
      AlignToBottom = False
      BeforePrint = GroupHeadQRGroupBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        7.937500000000000000
        2857.500000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'GetAllocMasterQuery.Sales_Order'
      Master = PickSOListQuickReport
      ReprintOnNewPage = True
    end
    object QRSubDetail1: TQRSubDetail
      Left = 25
      Top = 377
      Width = 1080
      Height = 24
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
        63.500000000000000000
        2857.500000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = PickSOListQuickReport
      DataSet = GetAllocDetQuery
      PrintBefore = False
      PrintIfEmpty = True
      object PartQRDBText: TQRDBText
        Left = 86
        Top = 3
        Width = 211
        Height = 18
        Size.Values = (
          47.625000000000000000
          227.541666666666700000
          7.937500000000000000
          558.270833333333400000)
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
        Font.Height = -12
        Font.Name = 'Lato'
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
      object DescQRDBText: TQRDBText
        Left = 304
        Top = 3
        Width = 249
        Height = 18
        Size.Values = (
          47.625000000000000000
          804.333333333333200000
          7.937500000000000000
          658.812500000000000000)
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
        Font.Height = -12
        Font.Name = 'Lato'
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
      object BinQRDBText: TQRDBText
        Left = 784
        Top = 3
        Width = 73
        Height = 18
        Size.Values = (
          47.625000000000000000
          2074.333333333333000000
          7.937500000000000000
          193.145833333333300000)
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
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = []
        Mask = '######'
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
        Left = 558
        Top = 3
        Width = 64
        Height = 18
        Size.Values = (
          47.625000000000000000
          1476.375000000000000000
          7.937500000000000000
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
        Font.Height = -12
        Font.Name = 'Lato'
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
      object QRLabelDlvrd: TQRLabel
        Left = 715
        Top = 3
        Width = 50
        Height = 18
        Size.Values = (
          47.625000000000000000
          1891.770833333333000000
          7.937500000000000000
          132.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'QRLabelDlvrd'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabelQty: TQRLabel
        Left = 3
        Top = 3
        Width = 66
        Height = 18
        Size.Values = (
          47.625000000000000000
          7.937500000000000000
          7.937500000000000000
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
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRDBText1: TQRDBText
        Left = 628
        Top = 3
        Width = 64
        Height = 18
        Size.Values = (
          47.625000000000000000
          1661.583333333333000000
          7.937500000000000000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = GetAllocDetQuery
        DataField = 'UOM'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
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
      object QRShape1: TQRShape
        Left = 872
        Top = 2
        Width = 81
        Height = 19
        Size.Values = (
          50.270833333333330000
          2307.166666666667000000
          5.291666666666667000
          214.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrlblOverPick: TQRLabel
        Left = 958
        Top = 4
        Width = 114
        Height = 17
        Size.Values = (
          44.979166666666670000
          2534.708333333333000000
          10.583333333333330000
          301.625000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'DO NOT OVER PICK'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
    end
    object qrdetailSerialNos: TQRSubDetail
      Left = 25
      Top = 401
      Width = 1080
      Height = 21
      AfterPrint = qrdetailSerialNosAfterPrint
      AlignToBottom = False
      BeforePrint = qrdetailSerialNosBeforePrint
      Enabled = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        55.562500000000000000
        2857.500000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = QRSubDetail1
      DataSet = GetAllocSerialNoSQL
      PrintBefore = False
      PrintIfEmpty = True
      object lblSerialCaption: TQRLabel
        Left = 304
        Top = 0
        Width = 92
        Height = 19
        Size.Values = (
          50.270833333333330000
          804.333333333333300000
          0.000000000000000000
          243.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Serial Numbers:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object lblSerialRange: TQRLabel
        Left = 408
        Top = 0
        Width = 82
        Height = 19
        Size.Values = (
          50.270833333333330000
          1079.500000000000000000
          0.000000000000000000
          216.958333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'lblSerialRange'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object QRBand1: TQRBand
      Left = 25
      Top = 422
      Width = 1080
      Height = 44
      Frame.DrawTop = True
      Frame.Width = 2
      AlignToBottom = True
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        116.416666666666700000
        2857.500000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageFooter
      object QRLabel17: TQRLabel
        Left = 9
        Top = 21
        Width = 76
        Height = 17
        Size.Values = (
          44.979166666666670000
          23.812500000000000000
          55.562500000000000000
          201.083333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Requested by:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRDBText2: TQRDBText
        Left = 96
        Top = 21
        Width = 98
        Height = 18
        Size.Values = (
          47.625000000000000000
          254.000000000000000000
          55.562500000000000000
          259.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = GetAllocDetQuery
        DataField = 'Account_Manager'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
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
      object QRLabel19: TQRLabel
        Left = 769
        Top = 21
        Width = 56
        Height = 17
        Size.Values = (
          44.979166666666670000
          2034.645833333333000000
          55.562500000000000000
          148.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Picked by:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRShape3: TQRShape
        Left = 840
        Top = 8
        Width = 238
        Height = 29
        Size.Values = (
          76.729166666666680000
          2222.500000000000000000
          21.166666666666670000
          629.708333333333200000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
    end
  end
  object AllocDataSource: TDataSource
    DataSet = GetAllocMasterQuery
    Left = 161
    Top = 70
  end
  object GetAllocDetQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT'
      '  Part_Store_Allocation.Store_stock,'
      '  Part_Store_Allocation.Picking_List_Ref,'
      '  Part_Store_Allocation.Sales_order_Line_No,'
      '  Store_Stock.Part_Bin,'
      '  Store_Stock.Invoice_upfront,'
      '  Part_Store.Part_Store_Name,'
      '  Part_Store.Stock_Bins_In_Use,'
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
      '  Sales_order.Narrative,'
      '  Sales_order.Delivery_Notes,'
      '  Sales_order.Production_Location,'
      '  (select UOM_Description'
      '   from Unit_of_Measure'
      
        '   where Part.Unit_of_Measure = Unit_of_measure.Unit_of_Measure)' +
        ' as UOM,'
      '  Operator.Name as Account_Manager'
      'FROM'
      
        '  Part_Store_Allocation, Store_Stock, Part_Store, Part, Sales_Or' +
        'der, Sales_Order_Line, Operator'
      'WHERE'
      
        '  Part_Store_Allocation.Store_Stock = Store_Stock.Store_Stock an' +
        'd'
      
        '  ((Part_Store_Allocation.Sales_Order = Sales_Order_Line.Sales_O' +
        'rder) and'
      
        '  (Part_Store_Allocation.Sales_Order_line_no = Sales_Order_Line.' +
        'Sales_Order_Line_no)) and'
      '  Sales_Order.Sales_Order = Sales_Order_Line.Sales_Order and'
      '  Store_Stock.Part_Store = Part_Store.Part_Store and'
      '  Store_Stock.Part = Sales_Order_Line.Part and'
      '  Store_Stock.Part = Part.Part  and'
      '  Sales_order.Office_Contact = Operator.Operator and'
      '  Sales_Order.Sales_Order = :Sel1'
      'GROUP BY'
      '  Part_Store_Allocation.Store_stock,'
      '  Part_Store_Allocation.Picking_List_Ref,'
      '  Part_Store_Allocation.Sales_order_Line_No,'
      '  Store_Stock.Part_Bin,'
      '  Store_Stock.Invoice_upfront,'
      '  Part_Store.Part_Store_Name,'
      '  Part_Store.Stock_Bins_In_Use,'
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
      '  Sales_order.Narrative,'
      '  Sales_order.Delivery_Notes,'
      '  Sales_order.Production_Location,'
      '  Operator.Name,'
      '  Part.Unit_of_Measure'
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
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 83
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
    Left = 88
    Top = 160
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
    Left = 88
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
      'Customer_Branch.Name as Branch_Name,'
      'Building_no_name,'
      'Street,'
      'Locale,'
      'Town,'
      'Postcode,'
      'Delivery_Narrative,'
      'Account_Code,'
      'Inv_To_Customer,'
      'Inv_To_Branch,'
      'Short_Code,'
      'HO_Department'
      'from'
      '  Customer_Branch, Customer'
      'where'
      '  ((Customer_Branch.Customer = :Customer) and'
      '   (Branch_no = :Branch_no)) and'
      '  Customer_Branch.Customer = Customer.Customer'
      ' ')
    Left = 286
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
    Left = 382
    Top = 94
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
        Name = 'Int_Sel_Code'
        DataType = ftInteger
      end
      item
        Name = 'Sales_Order'
        DataType = ftInteger
      end
      item
        Name = 'Status_from'
      end
      item
        Name = 'Status_to'
      end>
  end
  object AdhocSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Name,'
      '  '#39#39' as Branch_Name,'
      '  Building_no_name,'
      '  Street,'
      '  Locale,'
      '  Town,'
      '  Postcode,'
      '  Delivery_Narrative,'
      '  0 as HO_Department'
      'from Ad_hoc_Address'
      'where Ad_hoc_Address = :Ad_hoc_Address'
      ' ')
    Left = 600
    Top = 48
    ParamData = <
      item
        Name = 'Ad_hoc_Address'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object AddressSRC: TDataSource
    Left = 136
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
      ' '
      ' ')
    Left = 518
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
  object AddDelivLineDetSQL: TFDQuery
    ConnectionName = 'PB'
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
        Name = 'Sales_Order'
      end
      item
        Name = 'Sales_Order_Deliv'
      end
      item
        Name = 'Sales_order_Line_No'
      end>
  end
  object CheckDelivSQL: TFDQuery
    ConnectionName = 'PB'
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
        Name = 'Sales_Order'
      end
      item
        Name = 'Sales_Order_Line_No'
      end
      item
        Name = 'Sales_Order_Deliv'
      end>
  end
  object AddDelivDetSQL: TFDQuery
    ConnectionName = 'PB'
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
      '  :Del_Dt, 0, 1, :Delivery_Instructions,'
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
        Name = 'Sales_Order'
      end
      item
        Name = 'Sales_Order_Deliv'
      end
      item
        Name = 'Del_Dt'
      end
      item
        Name = 'Desp_Note_No'
      end
      item
        Name = 'Del_Type'
        DataType = ftString
      end
      item
        Name = 'Del_Dt'
      end
      item
        Name = 'Delivery_Instructions'
      end
      item
        Name = 'Courier'
        DataType = ftInteger
      end>
  end
  object GetAllocSerialNoSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * '
      'from Store_stock_serial_item'
      'where store_stock = :Store_stock and'
      'Sales_order = :Sales_order')
    Left = 729
    Top = 123
    ParamData = <
      item
        Name = 'Store_stock'
      end
      item
        Name = 'Sales_order'
      end>
  end
  object GetCustHOSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Customer.Name as Cust_Name,'
      'Customer_Branch.Name as Branch_Name,'
      'CB.Building_no_name,'
      'CB.Street,'
      'CB.Locale,'
      'CB.Town,'
      'CB.Postcode,'
      'CB.Delivery_Narrative,'
      'CB.Account_Code,'
      'CB.Inv_To_Customer,'
      'CB.Inv_To_Branch,'
      'CB.Short_Code,'
      'Customer_Branch.HO_Department'
      'from'
      '  Customer_Branch, Customer, Customer_Branch CB'
      'where'
      '  ((Customer_Branch.Customer = :Customer) and'
      '   (Customer_Branch.Branch_no = :Branch_no)) and'
      '  ((CB.Customer = :Customer) and'
      '   (CB.Branch_no = 0)) and'
      '  Customer_Branch.Customer = Customer.Customer'
      ' '
      '')
    Left = 389
    Top = 243
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'Customer'
      end>
  end
  object qryCompany: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select In_Use_By'
      'from Company'
      'Where Company = 1'
      ' '
      ' ')
    Left = 88
    Top = 264
  end
  object qryGetProduction: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'Select'
      '  Production_Location_Name,'
      '  '#39#39' as Branch_Name,'
      '  Building_no_name,'
      '  Street,'
      '  Locale,'
      '  Town,'
      '  Postcode,'
      '  0 as Delivery_Narrative,'
      '  0 as HO_Department'
      'from Production_location'
      'Where Production_Location = :Production_Location')
    Left = 395
    Top = 299
    ParamData = <
      item
        Name = 'Production_Location'
      end>
  end
  object qryGetJobBag: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select top 1 Job_Bag'
      'from Job_Bag_Line_dets'
      'where sales_order = :sales_order')
    Left = 547
    Top = 307
    ParamData = <
      item
        Name = 'sales_order'
      end>
  end
  object CustSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Customer.Name as Customer_Name,'
      #9#9#9'Building_no_name,'
      '        Street,'
      '        Locale,'
      '        Town,'
      '        Postcode,'
      '        Phone,'
      '        Fax_Number,'
      '        Email'
      'from Customer_Branch, Customer'
      'where ((Customer_Branch.Customer = :Customer) and'
      #9#9#9'(Branch_no = :Branch_no)) and'
      '        Customer_Branch.Customer = Customer.Customer'
      ' ')
    Left = 438
    Top = 33
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end>
  end
  object qryGetJobBagReq: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select top 1 Job_Bag'
      'from Job_Bag_Stock_Request'
      'where sales_order = :sales_order')
    Left = 547
    Top = 387
    ParamData = <
      item
        Name = 'sales_order'
      end>
  end
end
