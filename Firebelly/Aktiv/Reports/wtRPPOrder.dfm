object frmwtRPPOrder: TfrmwtRPPOrder
  Left = 170
  Top = 5
  Caption = 'Purchase Order Print'
  ClientHeight = 707
  ClientWidth = 1190
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Scaled = True
  OnCreate = FormCreate
  TextHeight = 13
  object qrpDetails: TQuickRep
    Left = 24
    Top = 10
    Width = 1123
    Height = 794
    ShowingPreview = False
    BeforePrint = qrpDetailsBeforePrint
    DataSet = qryReport
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Lucida Sans'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE'
      'QRLOOPBAND1')
    Functions.DATA = (
      '0'
      '0'
      #39#39
      '0')
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
    ReportTitle = 'Sales Order Print'
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
    object qrgPurchaseOrder: TQRGroup
      Left = 38
      Top = 369
      Width = 1047
      Height = 2
      AlignToBottom = False
      BeforePrint = qrgPurchaseOrderBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        5.291666666666667000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'purchase_order'
      FooterBand = qrbPurchaseOrderFooter
      Master = qrpDetails
      ReprintOnNewPage = False
    end
    object qrbPageHeader: TQRBand
      Left = 38
      Top = 38
      Width = 1047
      Height = 331
      AlignToBottom = False
      BeforePrint = qrbPageHeaderBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        875.770833333333300000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object QRShape7: TQRShape
        Left = 0
        Top = 299
        Width = 1041
        Height = 31
        Size.Values = (
          82.020833333333330000
          0.000000000000000000
          791.104166666666700000
          2754.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape2: TQRShape
        Left = 675
        Top = 65
        Width = 366
        Height = 90
        Size.Values = (
          238.125000000000000000
          1785.937500000000000000
          171.979166666666700000
          968.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrlblSOCaption: TQRLabel
        Left = 613
        Top = 2
        Width = 417
        Height = 56
        Size.Values = (
          148.166666666666700000
          1621.895833333333000000
          5.291666666666667000
          1103.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'PURCHASE ORDER'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -48
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 36
      end
      object QRLabel2: TQRLabel
        Left = 691
        Top = 102
        Width = 77
        Height = 14
        Size.Values = (
          37.041666666666670000
          1828.270833333333000000
          269.875000000000000000
          203.729166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Order Date:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRDBText1: TQRDBText
        Left = 945
        Top = 101
        Width = 82
        Height = 16
        Size.Values = (
          42.333333333333330000
          2500.312500000000000000
          267.229166666666700000
          216.958333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Date_Raised'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
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
        Left = 920
        Top = 73
        Width = 107
        Height = 16
        Size.Values = (
          42.333333333333330000
          2434.166666666667000000
          193.145833333333300000
          283.104166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Purchase_Order'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Sans'
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
      object QRLabel3: TQRLabel
        Left = 691
        Top = 73
        Width = 124
        Height = 14
        Size.Values = (
          37.041666666666670000
          1828.270833333333000000
          193.145833333333300000
          328.083333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Purchase Order No:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel1: TQRLabel
        Left = 19
        Top = 180
        Width = 57
        Height = 17
        Size.Values = (
          44.979166666666670000
          50.270833333333330000
          476.250000000000000000
          150.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel9: TQRLabel
        Left = 30
        Top = 309
        Width = 221
        Height = 14
        Size.Values = (
          37.041666666666670000
          79.375000000000000000
          817.562500000000000000
          584.729166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Description/Customer/Reference'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel12: TQRLabel
        Left = 678
        Top = 309
        Width = 65
        Height = 14
        Size.Values = (
          37.041666666666670000
          1793.875000000000000000
          817.562500000000000000
          171.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Unit Cost'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel14: TQRLabel
        Left = 802
        Top = 309
        Width = 64
        Height = 14
        Size.Values = (
          37.041666666666670000
          2121.958333333333000000
          817.562500000000000000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sub Total'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel15: TQRLabel
        Left = 965
        Top = 309
        Width = 71
        Height = 14
        Size.Values = (
          37.041666666666670000
          2553.229166666667000000
          817.562500000000000000
          187.854166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Total Nett'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object memAddress: TQRRichText
        Left = 56
        Top = 83
        Width = 281
        Height = 62
        Size.Values = (
          164.041666666666700000
          148.166666666666700000
          219.604166666666700000
          743.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AutoStretch = False
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        HiresExport = False
        Transparent = False
        YIncrement = 50
      end
      object QRShape6: TQRShape
        Left = 821
        Top = 64
        Width = 9
        Height = 90
        Size.Values = (
          238.125000000000000000
          2172.229166666667000000
          169.333333333333300000
          23.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape3: TQRShape
        Left = 675
        Top = 93
        Width = 366
        Height = 5
        Size.Values = (
          13.229166666666670000
          1785.937500000000000000
          246.062500000000000000
          968.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape1: TQRShape
        Left = 675
        Top = 123
        Width = 366
        Height = 3
        Size.Values = (
          7.937500000000000000
          1785.937500000000000000
          325.437500000000000000
          968.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape1: TQRShape
        Left = 0
        Top = 152
        Width = 336
        Height = 140
        Size.Values = (
          370.416666666666700000
          0.000000000000000000
          402.166666666666700000
          889.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrmAddress: TQRMemo
        Left = 9
        Top = 175
        Width = 320
        Height = 109
        Size.Values = (
          288.395833333333300000
          23.812500000000000000
          463.020833333333300000
          846.666666666666700000)
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
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object gtQRLabel1: TQRLabel
        Left = 691
        Top = 134
        Width = 99
        Height = 14
        Size.Values = (
          37.041666666666670000
          1828.270833333333000000
          354.541666666666700000
          261.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date Required:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object gtQRDBText1: TQRDBText
        Left = 888
        Top = 133
        Width = 139
        Height = 14
        Size.Values = (
          37.041666666666670000
          2349.500000000000000000
          351.895833333333300000
          367.770833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Date_Required'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object gtQRLabel2: TQRLabel
        Left = 9
        Top = 156
        Width = 54
        Height = 16
        Size.Values = (
          42.333333333333330000
          23.812500000000000000
          412.750000000000000000
          142.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Supplier'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object gtQRLabel5: TQRLabel
        Left = 888
        Top = 309
        Width = 61
        Height = 14
        Size.Values = (
          37.041666666666670000
          2349.500000000000000000
          817.562500000000000000
          161.395833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Discount'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object gtQRLabel6: TQRLabel
        Left = 616
        Top = 309
        Width = 25
        Height = 14
        Size.Values = (
          37.041666666666670000
          1629.833333333333000000
          817.562500000000000000
          66.145833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Qty'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object gtQRLabel7: TQRLabel
        Left = 4
        Top = 309
        Width = 19
        Height = 14
        Size.Values = (
          37.041666666666670000
          10.583333333333330000
          817.562500000000000000
          50.270833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'No'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object gtQRLabel9: TQRLabel
        Left = 411
        Top = 309
        Width = 95
        Height = 14
        Size.Values = (
          37.041666666666670000
          1087.437500000000000000
          817.562500000000000000
          251.354166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Slab Size (mm)'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object gtQRLabel10: TQRLabel
        Left = 520
        Top = 309
        Width = 64
        Height = 14
        Size.Values = (
          37.041666666666670000
          1375.833333333333000000
          817.562500000000000000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Our Order'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object gtQRShape3: TQRShape
        Left = 675
        Top = 173
        Width = 366
        Height = 119
        Size.Values = (
          314.854166666666700000
          1785.937500000000000000
          457.729166666666700000
          968.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel11: TQRLabel
        Left = 691
        Top = 211
        Width = 74
        Height = 14
        Size.Values = (
          37.041666666666670000
          1828.270833333333000000
          558.270833333333300000
          195.791666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Telephone:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object gtQRDBText6: TQRDBText
        Left = 832
        Top = 210
        Width = 195
        Height = 14
        Size.Values = (
          37.041666666666670000
          2201.333333333333000000
          555.625000000000000000
          515.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Office_Contact_Telephone'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object gtQRDBText7: TQRDBText
        Left = 879
        Top = 180
        Width = 148
        Height = 16
        Size.Values = (
          42.333333333333330000
          2325.687500000000000000
          476.250000000000000000
          391.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Office_Contact_Name'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Sans'
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
      object gtQRLabel12: TQRLabel
        Left = 691
        Top = 180
        Width = 86
        Height = 14
        Size.Values = (
          37.041666666666670000
          1828.270833333333000000
          476.250000000000000000
          227.541666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Our Contact:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object gtQRShape4: TQRShape
        Left = 821
        Top = 173
        Width = 9
        Height = 119
        Size.Values = (
          314.854166666666700000
          2172.229166666667000000
          457.729166666666700000
          23.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRShape5: TQRShape
        Left = 675
        Top = 201
        Width = 366
        Height = 4
        Size.Values = (
          10.583333333333330000
          1785.937500000000000000
          531.812500000000000000
          968.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape6: TQRShape
        Left = 675
        Top = 231
        Width = 366
        Height = 2
        Size.Values = (
          5.291666666666667000
          1785.937500000000000000
          611.187500000000000000
          968.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRLabel13: TQRLabel
        Left = 691
        Top = 239
        Width = 40
        Height = 14
        Size.Values = (
          37.041666666666670000
          1828.270833333333000000
          632.354166666666700000
          105.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Email:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object gtQRShape7: TQRShape
        Left = 675
        Top = 261
        Width = 366
        Height = 2
        Size.Values = (
          5.291666666666667000
          1785.937500000000000000
          690.562500000000000000
          968.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRLabel14: TQRLabel
        Left = 691
        Top = 270
        Width = 94
        Height = 14
        Size.Values = (
          37.041666666666670000
          1828.270833333333000000
          714.375000000000000000
          248.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Our Reference'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object gtQRDBText10: TQRDBText
        Left = 832
        Top = 270
        Width = 195
        Height = 14
        Size.Values = (
          37.041666666666670000
          2201.333333333333000000
          714.375000000000000000
          515.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Reference'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object gtQRDBText2: TQRDBText
        Left = 832
        Top = 239
        Width = 195
        Height = 14
        Size.Values = (
          37.041666666666670000
          2201.333333333333000000
          632.354166666666700000
          515.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Office_Contact_Email'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qriHeadLogo: TQRImage
        Left = 3
        Top = 0
        Width = 385
        Height = 81
        Size.Values = (
          214.312500000000000000
          7.937500000000000000
          0.000000000000000000
          1018.645833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Stretch = True
      end
    end
    object qrsdPOLines: TQRSubDetail
      Left = 38
      Top = 371
      Width = 1047
      Height = 23
      AlignToBottom = False
      BeforePrint = qrsdPOLinesBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        60.854166666666670000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpDetails
      DataSet = qryPOLine
      PrintBefore = False
      PrintIfEmpty = True
      object gtQRDBText8: TQRDBText
        Left = 521
        Top = 4
        Width = 71
        Height = 16
        Size.Values = (
          42.333333333333330000
          1378.479166666667000000
          10.583333333333330000
          187.854166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryPOLine
        DataField = 'Sales_Order'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
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
      object qrlblSlabDescription: TQRLabel
        Left = 388
        Top = 4
        Width = 119
        Height = 16
        Size.Values = (
          42.333333333333330000
          1026.583333333333000000
          10.583333333333330000
          314.854166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblSlabDescription'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qrlblTotalLineCost: TQRLabel
        Left = 928
        Top = 4
        Width = 107
        Height = 16
        Size.Values = (
          42.333333333333330000
          2455.333333333333000000
          10.583333333333330000
          283.104166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblTotalLineCost'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRDBText7: TQRDBText
        Left = 590
        Top = 4
        Width = 51
        Height = 16
        Size.Values = (
          42.333333333333330000
          1561.041666666667000000
          10.583333333333330000
          134.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryPOLine
        DataField = 'Quantity'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
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
      object gtlblLineCount: TQRLabel
        Left = 9
        Top = 4
        Width = 86
        Height = 16
        Size.Values = (
          42.333333333333330000
          23.812500000000000000
          10.583333333333330000
          227.541666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'gtlblLineCount'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qrlblUnitCost: TQRLabel
        Left = 667
        Top = 4
        Width = 77
        Height = 16
        Size.Values = (
          42.333333333333330000
          1764.770833333333000000
          10.583333333333330000
          203.729166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblUnitCost'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qrlblLineCost: TQRLabel
        Left = 790
        Top = 4
        Width = 77
        Height = 16
        Size.Values = (
          42.333333333333330000
          2090.208333333333000000
          10.583333333333330000
          203.729166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblLineCost'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qrlblDiscountValue: TQRLabel
        Left = 836
        Top = 4
        Width = 112
        Height = 16
        Size.Values = (
          42.333333333333330000
          2211.916666666667000000
          10.583333333333330000
          296.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblDiscountValue'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qrlblDescription: TQRLabel
        Left = 30
        Top = 4
        Width = 355
        Height = 16
        Size.Values = (
          42.333333333333330000
          79.375000000000000000
          10.583333333333330000
          939.270833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'qrlblDescription'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
    end
    object qrbPOFooter: TQRBand
      Left = 38
      Top = 418
      Width = 1047
      Height = 150
      AlignToBottom = True
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        396.875000000000000000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageFooter
      object qrshpPayment: TQRShape
        Left = 368
        Top = 22
        Width = 370
        Height = 123
        Size.Values = (
          325.437500000000000000
          973.666666666666700000
          58.208333333333330000
          978.958333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape10: TQRShape
        Left = 882
        Top = 9
        Width = 159
        Height = 32
        Size.Values = (
          84.666666666666670000
          2333.625000000000000000
          23.812500000000000000
          420.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrlblNett: TQRLabel
        Left = 972
        Top = 17
        Width = 61
        Height = 16
        Size.Values = (
          42.333333333333330000
          2571.750000000000000000
          44.979166666666670000
          161.395833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblNett'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object gtQRLabel4: TQRLabel
        Left = 760
        Top = 17
        Width = 116
        Height = 16
        Size.Values = (
          42.333333333333330000
          2010.833333333333000000
          44.979166666666670000
          306.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Total Order Value'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRShape9: TQRShape
        Left = 0
        Top = 6
        Width = 1042
        Height = 7
        Size.Values = (
          18.520833333333330000
          0.000000000000000000
          15.875000000000000000
          2756.958333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object memDeliveryNotes: TQRMemo
        Left = 374
        Top = 41
        Width = 355
        Height = 90
        Size.Values = (
          238.125000000000000000
          989.541666666666700000
          108.479166666666700000
          939.270833333333300000)
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
        Font.Name = 'Lucida Sans'
        Font.Style = []
        Lines.Strings = (
          'Delivery Notes')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object gtQRLabel16: TQRLabel
        Left = 374
        Top = 25
        Width = 98
        Height = 16
        Size.Values = (
          42.333333333333330000
          989.541666666666700000
          66.145833333333330000
          259.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Delivery Notes'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object gtQRShape2: TQRShape
        Left = 0
        Top = 22
        Width = 336
        Height = 123
        Size.Values = (
          325.437500000000000000
          0.000000000000000000
          58.208333333333330000
          889.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrmDeliveryAddress: TQRMemo
        Left = 12
        Top = 46
        Width = 313
        Height = 90
        Size.Values = (
          238.125000000000000000
          31.750000000000000000
          121.708333333333300000
          828.145833333333300000)
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
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object gtQRLabel3: TQRLabel
        Left = 12
        Top = 27
        Width = 75
        Height = 14
        Size.Values = (
          37.041666666666670000
          31.750000000000000000
          71.437500000000000000
          198.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Delivery To'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
    end
    object gtQRShape9: TQRShape
      Left = 1078
      Top = 337
      Width = 1
      Height = 278
      Size.Values = (
        735.541666666666700000
        2852.208333333333000000
        891.645833333333300000
        2.645833333333333000)
      XLColumn = 0
      XLNumFormat = nfGeneral
      ActiveInPreview = False
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object gtQRShape10: TQRShape
      Left = 38
      Top = 337
      Width = 1
      Height = 278
      Size.Values = (
        735.541666666666700000
        100.541666666666700000
        891.645833333333300000
        2.645833333333333000)
      XLColumn = 0
      XLNumFormat = nfGeneral
      ActiveInPreview = False
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object gtQRShape11: TQRShape
      Left = 993
      Top = 337
      Width = 1
      Height = 278
      Size.Values = (
        735.541666666666700000
        2627.312500000000000000
        891.645833333333300000
        2.645833333333333000)
      XLColumn = 0
      XLNumFormat = nfGeneral
      ActiveInPreview = False
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object gtQRShape8: TQRShape
      Left = 920
      Top = 337
      Width = 1
      Height = 278
      Size.Values = (
        735.541666666666700000
        2434.166666666667000000
        891.645833333333300000
        2.645833333333333000)
      XLColumn = 0
      XLNumFormat = nfGeneral
      ActiveInPreview = False
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object gtQRShape12: TQRShape
      Left = 798
      Top = 337
      Width = 1
      Height = 278
      Size.Values = (
        735.541666666666700000
        2111.375000000000000000
        891.645833333333300000
        2.645833333333333000)
      XLColumn = 0
      XLNumFormat = nfGeneral
      ActiveInPreview = False
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object gtQRShape15: TQRShape
      Left = 628
      Top = 337
      Width = 1
      Height = 278
      Size.Values = (
        735.541666666666700000
        1661.583333333333000000
        891.645833333333300000
        2.645833333333333000)
      XLColumn = 0
      XLNumFormat = nfGeneral
      ActiveInPreview = False
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object gtQRShape16: TQRShape
      Left = 551
      Top = 337
      Width = 1
      Height = 278
      Size.Values = (
        735.541666666666700000
        1457.854166666667000000
        891.645833333333300000
        2.645833333333333000)
      XLColumn = 0
      XLNumFormat = nfGeneral
      ActiveInPreview = False
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object gtQRShape17: TQRShape
      Left = 427
      Top = 337
      Width = 1
      Height = 278
      Size.Values = (
        735.541666666666700000
        1129.770833333333000000
        891.645833333333300000
        2.645833333333333000)
      XLColumn = 0
      XLNumFormat = nfGeneral
      ActiveInPreview = False
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object gtQRShape18: TQRShape
      Left = 63
      Top = 337
      Width = 1
      Height = 278
      Size.Values = (
        735.541666666666700000
        166.687500000000000000
        891.645833333333300000
        2.645833333333333000)
      XLColumn = 0
      XLNumFormat = nfGeneral
      ActiveInPreview = False
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object gtQRShape13: TQRShape
      Left = 687
      Top = 337
      Width = 1
      Height = 278
      Size.Values = (
        735.541666666666700000
        1817.687500000000000000
        891.645833333333300000
        2.645833333333333000)
      XLColumn = 0
      XLNumFormat = nfGeneral
      ActiveInPreview = False
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object ChildBand1: TQRChildBand
      Left = 38
      Top = 394
      Width = 1047
      Height = 22
      AlignToBottom = False
      BeforePrint = ChildBand1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        58.208333333333330000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = qrsdPOLines
      PrintOrder = cboAfterParent
      object qrlblCustomerReference: TQRLabel
        Left = 30
        Top = 4
        Width = 355
        Height = 16
        Size.Values = (
          42.333333333333330000
          79.375000000000000000
          10.583333333333330000
          939.270833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'qrlblCustomerReference'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
    end
    object qrbPurchaseOrderFooter: TQRBand
      Left = 38
      Top = 416
      Width = 1047
      Height = 2
      AfterPrint = qrbPurchaseOrderFooterAfterPrint
      AlignToBottom = True
      BeforePrint = qrbPurchaseOrderFooterBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        5.291666666666667000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
    end
  end
  object qryReport: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Purchase_Order.Purchase_Order,'
      '        Purchase_Order.Supplier,'
      '        Purchase_Order.Descriptive_Reference,'
      '        Purchase_Order.Reference,'
      '        Purchase_Order.Date_Raised,'
      '        Purchase_Order.Date_Required,'
      '        Purchase_Order.Operator,'
      '        Purchase_Order.Goods_Receipt_Number,'
      '        Purchase_Order.Purchase_Order_Status,'
      '        Purchase_Order.Cut_Off_Date,'
      '        Purchase_Order.Contact_No,'
      '        Supplier_contact.Contact_name,'
      '        Purchase_Order.Notes,'
      '        Operator.Operator_Name,'
      '        Operator.Telephone_number,'
      '        Office_Contact.Operator_Name AS Office_Contact_Name,'
      
        '        Office_Contact.Telephone_number AS Office_Contact_Teleph' +
        'one,'
      '        Office_Contact.Email_Address AS Office_Contact_Email,'
      '        Supplier_contact.Contact_name,'
      '        Supplier.Supplier_Name,'
      '        Purchase_Order_Status.Status_Description'
      'FROM Purchase_Order_Status'
      '        INNER JOIN (Supplier'
      '        INNER JOIN (Supplier_contact'
      '        INNER JOIN (Operator AS Office_Contact'
      '        RIGHT JOIN (Operator'
      '        INNER JOIN Purchase_Order'
      '              ON Operator.Operator = Purchase_Order.Operator)'
      
        '              ON Office_Contact.Operator = Purchase_Order.Office' +
        '_Contact)'
      
        '              ON (Supplier_contact.Contact_no = Purchase_Order.C' +
        'ontact_No) AND (Supplier_contact.Supplier = Purchase_Order.Suppl' +
        'ier))'
      '              ON Supplier.Supplier = Supplier_contact.Supplier)'
      
        '              ON Purchase_Order_Status.Purchase_Order_Status = P' +
        'urchase_Order.Purchase_Order_Status'
      'WHERE Purchase_Order.Purchase_Order = :Purchase_Order')
    Left = 843
    Top = 22
    ParamData = <
      item
        Name = 'Purchase_Order'
      end>
  end
  object dtsReport: TDataSource
    DataSet = qryReport
    Left = 912
    Top = 24
  end
  object qrySupplier: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT'
      '    Supplier,'
      '    Supplier_name,'
      '    Street,'
      '    Locale,'
      '    Town_City,'
      '    Postcode,'
      '    County_State,'
      '    Telephone_Number,'
      '    Email_Address'
      'FROM Supplier'
      'WHERE Supplier = :Supplier')
    Left = 854
    Top = 518
    ParamData = <
      item
        Name = 'Supplier'
      end>
  end
  object qryCompany: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * from company'
      'where company = 1')
    Left = 678
    Top = 151
  end
  object qrygetNotes: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from Notes'
      'where notes_code = :Notes_Code'
      'order by notes_code, notes_line')
    Left = 806
    Top = 239
    ParamData = <
      item
        Name = 'Notes_Code'
      end>
  end
  object qryPOLine: TFDQuery
    MasterSource = dtsReport
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Purchase_orderline.Purchase_Order,'
      '        Purchase_orderline.Line_no,'
      '        Purchase_orderline.Stock_item,'
      '        Stock_item.Stock_Description,'
      '        Purchase_orderline.Depth,'
      '        Purchase_orderline.Length,'
      '        Purchase_orderline.Description,'
      '        Purchase_orderline.Unit_cost,'
      '        Purchase_orderline.Price_unit,'
      '        Purchase_orderline.Quantity,'
      '        Purchase_orderline.Date_Required,'
      '        Purchase_orderline.Date_Received,'
      '        Purchase_orderline.Product,'
      '        Product.Product_Description,'
      '        Product.Product_code,'
      '        Purchase_orderline.Worktop,'
      '        Worktop.Description as Worktop_Description,'
      '        Worktop.Material_Type,'
      '        Purchase_orderline.Thickness,'
      '        Thickness.Thickness_mm,'
      '        Purchase_orderline.Quantity_Delivered,'
      '        Purchase_orderline.Quantity_Invoiced,'
      '        Purchase_orderline.Discount_Percentage,'
      '        Purchase_orderline.Notes,'
      '        Purchase_orderline.Supplier_Product_Code,'
      '        Purchase_orderline.Sales_Order,'
      '        Purchase_orderline.Sales_Order_Line_no,'
      '        Purchase_orderline.Slab_Depth,'
      '        Purchase_orderline.Slab_Length,'
      '        Purchase_orderline.Slab_Description,'
      '        Purchase_orderline.Cost_Pack_Quantity,'
      '        Purchase_orderLine.Vat,'
      '        Vat.Vat_Rate,'
      '        Sales_Order.Reference,'
      '        Sales_Order.Customer_Name'
      'FROM (Stock_item'
      '      RIGHT JOIN (Worktop'
      '      RIGHT JOIN (Vat'
      '      RIGHT JOIN (Thickness'
      '      RIGHT JOIN (Sales_Order_Line'
      '      RIGHT JOIN (Purchase_orderline'
      '      LEFT JOIN Product'
      '          ON Purchase_orderline.Product = Product.Product)'
      
        '          ON (Sales_Order_Line.Sales_Order = Purchase_orderline.' +
        'Sales_Order) AND (Sales_Order_Line.Sales_order_Line_no = Purchas' +
        'e_orderline.Sales_Order_Line_No))'
      '          ON Thickness.Thickness = Purchase_orderline.Thickness)'
      '          ON Vat.Vat = Purchase_orderline.Vat)'
      '          ON Worktop.Worktop = Purchase_orderline.Worktop)'
      
        '          ON Stock_item.Stock_item = Purchase_orderline.Stock_it' +
        'em)'
      '      LEFT JOIN Sales_Order'
      
        '          ON Purchase_orderline.Sales_Order = Sales_Order.Sales_' +
        'Order'
      'WHERE Purchase_OrderLine.Purchase_Order = :Purchase_Order')
    Left = 678
    Top = 88
    ParamData = <
      item
        Name = 'Purchase_Order'
      end>
  end
  object qryCompanyAddress: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Street,'
      'Locale,'
      'Town_City,'
      'County_State,'
      'Postcode,'
      'Telephone_number,'
      'Fax_Number, '
      'Company_Name,'
      'VAT_Number,'
      'Company_Name '
      'from Company')
    Left = 856
    Top = 441
  end
  object GetNarrSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Select Notes_Text'
      'From Notes'
      'Where (Notes_Code = :Notes_Code)'
      'Order By Notes_Line')
    Left = 848
    Top = 589
    ParamData = <
      item
        Name = 'Notes_Code'
      end>
  end
  object dtsPOLine: TDataSource
    DataSet = qryPOLine
    Left = 742
    Top = 91
  end
  object dtsAddress: TDataSource
    DataSet = qrySupplier
    Left = 846
    Top = 656
  end
  object qryUpPO: TFDQuery
    ConnectionName = 'wT'
    SQL.Strings = (
      'update Purchase_Order'
      'set Purchase_Order_Status = :Purchase_Order_Status'
      'Where Purchase_Order = :Purchase_Order')
    Left = 326
    Top = 293
    ParamData = <
      item
        Name = 'Purchase_Order_Status'
      end
      item
        Name = 'Purchase_Order'
      end>
  end
end
