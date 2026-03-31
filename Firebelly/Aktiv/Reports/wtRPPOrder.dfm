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
  Scaled = False
  OnCreate = FormCreate
  TextHeight = 13
  object qrpDetails: TQuickRep
    Left = 24
    Top = 10
    Width = 1403
    Height = 992
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
    PrevInitialZoom = qrZoom100
    PreviewDefaultSaveType = stPDF
    PreviewLeft = 0
    PreviewTop = 0
    object qrgPurchaseOrder: TQRGroup
      Left = 47
      Top = 461
      Width = 1309
      Height = 3
      AlignToBottom = False
      BeforePrint = qrgPurchaseOrderBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        6.350000000000000000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'purchase_order'
      FooterBand = qrbPurchaseOrderFooter
      Master = qrpDetails
      ReprintOnNewPage = False
    end
    object qrbPageHeader: TQRBand
      Left = 47
      Top = 47
      Width = 1309
      Height = 414
      AlignToBottom = False
      BeforePrint = qrbPageHeaderBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        876.300000000000000000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object QRShape7: TQRShape
        Left = 0
        Top = 374
        Width = 1301
        Height = 36
        Size.Values = (
          76.200000000000000000
          0.000000000000000000
          791.633333333333300000
          2753.783333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape2: TQRShape
        Left = 844
        Top = 81
        Width = 458
        Height = 113
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
        Left = 762
        Top = 3
        Width = 529
        Height = 70
        Size.Values = (
          148.166666666666700000
          1612.900000000000000000
          6.350000000000000000
          1119.716666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'PURCHASE ORDER'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -60
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
        Left = 864
        Top = 128
        Width = 91
        Height = 18
        Size.Values = (
          38.100000000000000000
          1828.800000000000000000
          270.933333333333300000
          192.616666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Order Date:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
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
        Left = 1186
        Top = 126
        Width = 97
        Height = 20
        Size.Values = (
          42.333333333333330000
          2510.366666666667000000
          266.700000000000000000
          205.316666666666700000)
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
        Font.Height = -15
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
        Left = 1149
        Top = 91
        Width = 135
        Height = 20
        Size.Values = (
          42.333333333333330000
          2432.050000000000000000
          192.616666666666700000
          285.750000000000000000)
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
        Font.Height = -17
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
        Left = 864
        Top = 91
        Width = 147
        Height = 18
        Size.Values = (
          38.100000000000000000
          1828.800000000000000000
          192.616666666666700000
          311.150000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Purchase Order No:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel9: TQRLabel
        Left = 38
        Top = 386
        Width = 255
        Height = 18
        Size.Values = (
          38.100000000000000000
          80.433333333333330000
          817.033333333333300000
          539.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Description/Customer/Reference'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
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
        Left = 848
        Top = 386
        Width = 73
        Height = 18
        Size.Values = (
          38.100000000000000000
          1794.933333333333000000
          817.033333333333300000
          154.516666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Unit Cost'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
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
        Left = 1002
        Top = 386
        Width = 75
        Height = 18
        Size.Values = (
          38.100000000000000000
          2120.900000000000000000
          817.033333333333300000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sub Total'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
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
        Left = 1214
        Top = 386
        Width = 81
        Height = 18
        Size.Values = (
          38.100000000000000000
          2569.633333333333000000
          817.033333333333300000
          171.450000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Total Nett'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
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
        Left = 70
        Top = 104
        Width = 351
        Height = 78
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
        Left = 1026
        Top = 80
        Width = 11
        Height = 113
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
        Left = 844
        Top = 116
        Width = 458
        Height = 6
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
        Left = 844
        Top = 154
        Width = 458
        Height = 4
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
        Left = 2
        Top = 188
        Width = 420
        Height = 175
        Size.Values = (
          370.416666666666700000
          4.233333333333333000
          397.933333333333300000
          889.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrmAddress: TQRMemo
        Left = 11
        Top = 222
        Width = 400
        Height = 136
        Size.Values = (
          287.866666666666700000
          23.283333333333330000
          469.900000000000000000
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
        Font.Height = -15
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object gtQRLabel1: TQRLabel
        Left = 864
        Top = 168
        Width = 115
        Height = 18
        Size.Values = (
          38.100000000000000000
          1828.800000000000000000
          355.600000000000000000
          243.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date Required:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
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
        Left = 1110
        Top = 166
        Width = 174
        Height = 18
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
        Font.Height = -15
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
      object gtQRLabel5: TQRLabel
        Left = 1110
        Top = 386
        Width = 69
        Height = 18
        Size.Values = (
          38.100000000000000000
          2349.500000000000000000
          817.033333333333300000
          146.050000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Discount'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
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
        Left = 770
        Top = 386
        Width = 29
        Height = 18
        Size.Values = (
          38.100000000000000000
          1629.833333333333000000
          817.033333333333300000
          61.383333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Qty'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
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
        Left = 5
        Top = 386
        Width = 22
        Height = 18
        Size.Values = (
          38.100000000000000000
          10.583333333333330000
          817.033333333333300000
          46.566666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'No'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
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
        Left = 514
        Top = 386
        Width = 113
        Height = 18
        Size.Values = (
          38.100000000000000000
          1087.966666666667000000
          817.033333333333300000
          239.183333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Slab Size (mm)'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
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
        Left = 650
        Top = 386
        Width = 76
        Height = 18
        Size.Values = (
          38.100000000000000000
          1375.833333333333000000
          817.033333333333300000
          160.866666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Our Order'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
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
        Left = 844
        Top = 216
        Width = 458
        Height = 149
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
        Left = 864
        Top = 264
        Width = 84
        Height = 18
        Size.Values = (
          38.100000000000000000
          1828.800000000000000000
          558.800000000000000000
          177.800000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Telephone:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
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
        Left = 1040
        Top = 262
        Width = 244
        Height = 18
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
        Font.Height = -15
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
        Left = 1094
        Top = 225
        Width = 190
        Height = 20
        Size.Values = (
          42.333333333333330000
          2315.633333333333000000
          476.250000000000000000
          402.166666666666700000)
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
        Font.Height = -17
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
        Left = 864
        Top = 225
        Width = 100
        Height = 18
        Size.Values = (
          38.100000000000000000
          1828.800000000000000000
          476.250000000000000000
          211.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Our Contact:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
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
        Left = 1026
        Top = 216
        Width = 11
        Height = 149
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
        Left = 844
        Top = 251
        Width = 458
        Height = 5
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
        Left = 844
        Top = 289
        Width = 458
        Height = 3
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
        Left = 864
        Top = 299
        Width = 46
        Height = 18
        Size.Values = (
          38.100000000000000000
          1828.800000000000000000
          632.883333333333300000
          97.366666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Email:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
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
        Left = 844
        Top = 326
        Width = 458
        Height = 3
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
        Left = 864
        Top = 338
        Width = 109
        Height = 18
        Size.Values = (
          38.100000000000000000
          1828.800000000000000000
          715.433333333333300000
          230.716666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Our Reference'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
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
        Left = 1040
        Top = 338
        Width = 244
        Height = 18
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
        Font.Height = -15
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
        Left = 1040
        Top = 299
        Width = 244
        Height = 18
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
        Font.Height = -15
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
        Left = 4
        Top = 0
        Width = 481
        Height = 101
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
      object gtQRLabel2: TQRLabel
        Left = 11
        Top = 196
        Width = 62
        Height = 20
        Size.Values = (
          42.333333333333330000
          23.283333333333330000
          414.866666666666700000
          131.233333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Supplier'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
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
    object qrsdPOLines: TQRSubDetail
      Left = 47
      Top = 464
      Width = 1309
      Height = 29
      AlignToBottom = False
      BeforePrint = qrsdPOLinesBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        61.383333333333330000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpDetails
      DataSet = qryPOLine
      PrintBefore = False
      PrintIfEmpty = True
      object gtQRDBText8: TQRDBText
        Left = 651
        Top = 5
        Width = 89
        Height = 20
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
        Font.Height = -15
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
        Left = 486
        Top = 5
        Width = 148
        Height = 20
        Size.Values = (
          42.333333333333330000
          1028.700000000000000000
          10.583333333333330000
          313.266666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblSlabDescription'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
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
        Left = 1160
        Top = 5
        Width = 134
        Height = 20
        Size.Values = (
          42.333333333333330000
          2455.333333333333000000
          10.583333333333330000
          283.633333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblTotalLineCost'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
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
        Left = 739
        Top = 5
        Width = 63
        Height = 20
        Size.Values = (
          42.333333333333330000
          1564.216666666667000000
          10.583333333333330000
          133.350000000000000000)
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
        Font.Height = -15
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
        Left = 11
        Top = 5
        Width = 108
        Height = 20
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
        Font.Height = -15
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
        Left = 833
        Top = 5
        Width = 97
        Height = 20
        Size.Values = (
          42.333333333333330000
          1763.183333333333000000
          10.583333333333330000
          205.316666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblUnitCost'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
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
        Left = 986
        Top = 5
        Width = 97
        Height = 20
        Size.Values = (
          42.333333333333330000
          2087.033333333333000000
          10.583333333333330000
          205.316666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblLineCost'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
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
        Left = 1045
        Top = 5
        Width = 140
        Height = 20
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
        Font.Height = -15
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
        Left = 38
        Top = 5
        Width = 444
        Height = 20
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
        Font.Height = -15
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
      Left = 47
      Top = 523
      Width = 1309
      Height = 188
      AlignToBottom = True
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        397.933333333333300000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageFooter
      object qrshpPayment: TQRShape
        Left = 460
        Top = 27
        Width = 462
        Height = 154
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
        Left = 1102
        Top = 11
        Width = 199
        Height = 40
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
        Left = 1222
        Top = 21
        Width = 69
        Height = 20
        Size.Values = (
          42.333333333333330000
          2586.566666666667000000
          44.450000000000000000
          146.050000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblNett'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
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
        Left = 957
        Top = 21
        Width = 138
        Height = 20
        Size.Values = (
          42.333333333333330000
          2025.650000000000000000
          44.450000000000000000
          292.100000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Total Order Value'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
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
        Top = 8
        Width = 1302
        Height = 9
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
        Left = 468
        Top = 51
        Width = 444
        Height = 113
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
        Font.Height = -15
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
        Left = 468
        Top = 31
        Width = 113
        Height = 20
        Size.Values = (
          42.333333333333330000
          990.600000000000000000
          65.616666666666670000
          239.183333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Delivery Notes'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
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
        Top = 27
        Width = 420
        Height = 154
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
        Left = 15
        Top = 57
        Width = 391
        Height = 113
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
        Font.Height = -15
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object gtQRLabel3: TQRLabel
        Left = 15
        Top = 34
        Width = 88
        Height = 18
        Size.Values = (
          38.100000000000000000
          31.750000000000000000
          71.966666666666670000
          186.266666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Delivery To'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
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
      Left = 1347
      Top = 421
      Width = 1
      Height = 348
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
      Left = 47
      Top = 421
      Width = 1
      Height = 348
      Size.Values = (
        736.600000000000000000
        99.483333333333330000
        891.116666666666700000
        2.116666666666667000)
      XLColumn = 0
      XLNumFormat = nfGeneral
      ActiveInPreview = False
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object gtQRShape11: TQRShape
      Left = 1241
      Top = 421
      Width = 1
      Height = 348
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
      Left = 1150
      Top = 421
      Width = 1
      Height = 348
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
      Left = 998
      Top = 421
      Width = 1
      Height = 348
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
      Left = 785
      Top = 421
      Width = 1
      Height = 348
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
      Left = 689
      Top = 421
      Width = 1
      Height = 348
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
      Left = 534
      Top = 421
      Width = 1
      Height = 348
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
      Left = 79
      Top = 421
      Width = 1
      Height = 348
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
      Left = 859
      Top = 421
      Width = 1
      Height = 348
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
      Left = 47
      Top = 493
      Width = 1309
      Height = 27
      AlignToBottom = False
      BeforePrint = ChildBand1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        57.150000000000000000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = qrsdPOLines
      PrintOrder = cboAfterParent
      object qrlblCustomerReference: TQRLabel
        Left = 38
        Top = 5
        Width = 444
        Height = 20
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
        Font.Height = -15
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
      Left = 47
      Top = 520
      Width = 1309
      Height = 3
      AfterPrint = qrbPurchaseOrderFooterAfterPrint
      AlignToBottom = True
      BeforePrint = qrbPurchaseOrderFooterBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        6.350000000000000000
        2770.716666666667000000)
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
