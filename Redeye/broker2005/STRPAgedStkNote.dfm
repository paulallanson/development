object STRPAgedStkNoteFrm: TSTRPAgedStkNoteFrm
  Left = 143
  Top = 112
  Caption = 'Destroy Notification'
  ClientHeight = 557
  ClientWidth = 873
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  
  TextHeight = 13
  object qrpDetails: TQuickRep
    Left = 16
    Top = 16
    Width = 794
    Height = 1123
    ShowingPreview = False
    DataSet = qryReport
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
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Continuous = False
    Page.Values = (
      100.000000000000000000
      2970.000000000000000000
      100.000000000000000000
      2100.000000000000000000
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
    object QRBand1: TQRBand
      Left = 38
      Top = 38
      Width = 718
      Height = 115
      Frame.DrawTop = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Frame.Width = 3
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        304.270833333333300000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object QRLabel1: TQRLabel
        Left = 167
        Top = 8
        Width = 389
        Height = 33
        Size.Values = (
          87.312500000000000000
          441.854166666666700000
          21.166666666666670000
          1029.229166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Destruction of Stock Notification'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 20
      end
      object QRSysData1: TQRSysData
        Left = 656
        Top = 16
        Width = 56
        Height = 17
        Size.Values = (
          44.979166666666670000
          1735.666666666667000000
          42.333333333333340000
          148.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
        Transparent = False
        ExportAs = exptText
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlblDateSince: TQRLabel
        Left = 327
        Top = 50
        Width = 70
        Height = 17
        Size.Values = (
          44.979166666666670000
          865.187500000000000000
          132.291666666666700000
          185.208333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'qrlblDateSince'
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
    object qrgStoreStock: TQRGroup
      Left = 38
      Top = 153
      Width = 718
      Height = 920
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Frame.Width = 2
      AlignToBottom = False
      BeforePrint = qrgStoreStockBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        2434.166666666667000000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'store_stock'
      Master = qrpDetails
      ReprintOnNewPage = False
      object QRLabel2: TQRLabel
        Left = 32
        Top = 64
        Width = 69
        Height = 17
        Size.Values = (
          44.979166666666670000
          84.666666666666680000
          169.333333333333300000
          182.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Product Code:'
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
      object QRLabel3: TQRLabel
        Left = 32
        Top = 120
        Width = 55
        Height = 17
        Size.Values = (
          44.979166666666670000
          84.666666666666680000
          317.500000000000000000
          145.520833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Description'
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
      object QRDBText1: TQRDBText
        Left = 32
        Top = 80
        Width = 35
        Height = 23
        Size.Values = (
          60.854166666666680000
          84.666666666666680000
          211.666666666666700000
          92.604166666666680000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Part'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 14
      end
      object QRDBText2: TQRDBText
        Left = 32
        Top = 136
        Width = 97
        Height = 23
        Size.Values = (
          60.854166666666680000
          84.666666666666680000
          359.833333333333400000
          256.645833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoStretch = True
        Color = clWhite
        DataSet = qryReport
        DataField = 'Description'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 14
      end
      object QRLabel4: TQRLabel
        Left = 32
        Top = 8
        Width = 57
        Height = 17
        Size.Values = (
          44.979166666666670000
          84.666666666666680000
          21.166666666666670000
          150.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Warehouse'
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
      object QRLabel5: TQRLabel
        Left = 496
        Top = 8
        Width = 60
        Height = 17
        Size.Values = (
          44.979166666666670000
          1312.333333333333000000
          21.166666666666670000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Bin Location'
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
      object QRDBText3: TQRDBText
        Left = 32
        Top = 24
        Width = 449
        Height = 23
        Size.Values = (
          60.854166666666680000
          84.666666666666680000
          63.500000000000000000
          1187.979166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Part_Store_Name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 14
      end
      object QRDBText4: TQRDBText
        Left = 496
        Top = 24
        Width = 217
        Height = 23
        Size.Values = (
          60.854166666666680000
          1312.333333333333000000
          63.500000000000000000
          574.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Bin'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 14
      end
      object QRShape1: TQRShape
        Left = 0
        Top = 168
        Width = 717
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          444.500000000000000000
          1897.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 4
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel6: TQRLabel
        Left = 32
        Top = 184
        Width = 51
        Height = 17
        Size.Values = (
          44.979166666666670000
          84.666666666666680000
          486.833333333333400000
          134.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total Units'
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
      object QRLabel7: TQRLabel
        Left = 232
        Top = 184
        Width = 44
        Height = 17
        Size.Values = (
          44.979166666666670000
          613.833333333333400000
          486.833333333333400000
          116.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Pack Qty'
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
      object QRLabel8: TQRLabel
        Left = 408
        Top = 184
        Width = 62
        Height = 17
        Size.Values = (
          44.979166666666670000
          1079.500000000000000000
          486.833333333333400000
          164.041666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Receipt Date'
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
      object QRDBText5: TQRDBText
        Left = 32
        Top = 208
        Width = 69
        Height = 23
        Size.Values = (
          60.854166666666680000
          84.666666666666680000
          550.333333333333400000
          182.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Quantity'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 14
      end
      object QRDBText6: TQRDBText
        Left = 232
        Top = 208
        Width = 91
        Height = 23
        Size.Values = (
          60.854166666666680000
          613.833333333333400000
          550.333333333333400000
          240.770833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Pack_Size'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 14
      end
      object lblDateReceived: TQRLabel
        Left = 408
        Top = 208
        Width = 141
        Height = 23
        Size.Values = (
          60.854166666666680000
          1079.500000000000000000
          550.333333333333400000
          373.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'lblDateReceived'
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
      object QRLabel9: TQRLabel
        Left = 32
        Top = 272
        Width = 29
        Height = 17
        Size.Values = (
          44.979166666666670000
          84.666666666666680000
          719.666666666666800000
          76.729166666666680000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Value'
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
      object QRLabel10: TQRLabel
        Left = 608
        Top = 184
        Width = 49
        Height = 17
        Size.Values = (
          44.979166666666670000
          1608.666666666667000000
          486.833333333333400000
          129.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Days held'
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
      object qrlblDays: TQRLabel
        Left = 608
        Top = 208
        Width = 80
        Height = 23
        Size.Values = (
          60.854166666666680000
          1608.666666666667000000
          550.333333333333400000
          211.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblDays'
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
      object qrlblValue: TQRLabel
        Left = 32
        Top = 296
        Width = 85
        Height = 23
        Size.Values = (
          60.854166666666680000
          84.666666666666680000
          783.166666666666800000
          224.895833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblValue'
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
      object QRLabel11: TQRLabel
        Left = 408
        Top = 272
        Width = 81
        Height = 17
        Size.Values = (
          44.979166666666670000
          1079.500000000000000000
          719.666666666666800000
          214.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Last Usage Date'
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
      object qrlblLastUsageDate: TQRLabel
        Left = 408
        Top = 296
        Width = 168
        Height = 23
        Size.Values = (
          60.854166666666680000
          1079.500000000000000000
          783.166666666666800000
          444.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblLastUsageDate'
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
      object QRShape2: TQRShape
        Left = 0
        Top = 336
        Width = 717
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          889.000000000000000000
          1897.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 4
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel12: TQRLabel
        Left = 32
        Top = 360
        Width = 47
        Height = 17
        Size.Values = (
          44.979166666666670000
          84.666666666666680000
          952.500000000000000000
          124.354166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer'
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
      object QRDBText7: TQRDBText
        Left = 32
        Top = 384
        Width = 449
        Height = 23
        Size.Values = (
          60.854166666666680000
          84.666666666666680000
          1016.000000000000000000
          1187.979166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'CustName'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 14
      end
      object QRShape3: TQRShape
        Left = 32
        Top = 512
        Width = 17
        Height = 17
        Frame.Width = 4
        Size.Values = (
          44.979166666666670000
          84.666666666666680000
          1354.666666666667000000
          44.979166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape4: TQRShape
        Left = 32
        Top = 536
        Width = 17
        Height = 17
        Frame.Width = 4
        Size.Values = (
          44.979166666666670000
          84.666666666666680000
          1418.166666666667000000
          44.979166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape5: TQRShape
        Left = 32
        Top = 560
        Width = 17
        Height = 17
        Frame.Width = 4
        Size.Values = (
          44.979166666666670000
          84.666666666666680000
          1481.666666666667000000
          44.979166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel13: TQRLabel
        Left = 64
        Top = 512
        Width = 46
        Height = 17
        Size.Values = (
          44.979166666666670000
          169.333333333333300000
          1354.666666666667000000
          121.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Destroy'
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
      object QRLabel14: TQRLabel
        Left = 64
        Top = 536
        Width = 91
        Height = 17
        Size.Values = (
          44.979166666666670000
          169.333333333333300000
          1418.166666666667000000
          240.770833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Return to Client'
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
      object QRLabel15: TQRLabel
        Left = 64
        Top = 560
        Width = 97
        Height = 17
        Size.Values = (
          44.979166666666670000
          169.333333333333300000
          1481.666666666667000000
          256.645833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Remain in Stock'
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
      object QRShape6: TQRShape
        Left = 191
        Top = 528
        Width = 519
        Height = 297
        Frame.Width = 4
        Size.Values = (
          785.812500000000000000
          505.354166666666700000
          1397.000000000000000000
          1373.187500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel16: TQRLabel
        Left = 192
        Top = 510
        Width = 64
        Height = 17
        Size.Values = (
          44.979166666666670000
          508.000000000000000000
          1349.375000000000000000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Comments'
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
      object QRLabel17: TQRLabel
        Left = 32
        Top = 862
        Width = 60
        Height = 17
        Size.Values = (
          44.979166666666670000
          84.666666666666680000
          2280.708333333333000000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Signature:'
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
      object QRLabel18: TQRLabel
        Left = 112
        Top = 864
        Width = 341
        Height = 17
        Size.Values = (
          44.979166666666670000
          296.333333333333400000
          2286.000000000000000000
          902.229166666666800000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          '................................................................' +
          '.....................'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel19: TQRLabel
        Left = 520
        Top = 862
        Width = 32
        Height = 17
        Size.Values = (
          44.979166666666670000
          1375.833333333333000000
          2280.708333333333000000
          84.666666666666680000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date:'
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
      object QRLabel20: TQRLabel
        Left = 560
        Top = 864
        Width = 113
        Height = 17
        Size.Values = (
          44.979166666666670000
          1481.666666666667000000
          2286.000000000000000000
          298.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '............................'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRShape7: TQRShape
        Left = 0
        Top = 472
        Width = 717
        Height = 15
        Size.Values = (
          39.687500000000000000
          0.000000000000000000
          1248.833333333333000000
          1897.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 4
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
  end
  object qryReport: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select    store_stock.part as Part,'
      '          part.part_description as Description,'
      '          part.part_Cost_Cat as Sales_Value,'
      '          part.Sell_Pack_Quantity as Sell_Pack_Size,'
      '          part_store.part_store_name as Part_Store_Name,'
      '          Part.Not_In_Use,'
      '          Customer.name as CustName,'
      '          Rep.Name as Rep_Name,'
      '          store_stock.part_bin as Bin,'
      '          store_Stock.Part_Store_Lot as Lot,'
      '          store_stock.Store_stock_description as Stock_Ref,'
      '          store_stock.store_quantity as Quantity,'
      '          store_Stock.Stock_Pack_Quantity as Pack_Size,'
      '          (store_stock.store_Cost) as Stock_Value,'
      '          Store_Stock.Part_Store,'
      '          store_stock.date_received,'
      '          store_stock.invoice_upfront'
      
        'FROM ((Customer RIGHT JOIN ((part INNER JOIN (store_stock INNER ' +
        'JOIN'
      
        '    part_store ON store_stock.Part_Store = part_store.Part_Store' +
        ')'
      '    ON part.Part = store_stock.Part)'
      
        '    LEFT JOIN Customer_Branch ON (part.Branch_no = Customer_Bran' +
        'ch.Branch_no)'
      '    AND (part.Customer = Customer_Branch.Customer))'
      '    ON Customer.Customer = Customer_Branch.Customer)'
      
        '    LEFT JOIN Reps_Branches ON (Customer_Branch.Branch_no = Reps' +
        '_Branches.Branch_no)'
      '    AND (Customer_Branch.Customer = Reps_Branches.Customer))'
      '    LEFT JOIN Rep ON Reps_Branches.Rep = Rep.Rep'
      
        'where     (((:theDate - store_stock.date_received) > :noOfDays) ' +
        'and'
      
        '      (Store_Stock.Part >= :PartFrom) and (Store_Stock.Part <= :' +
        'PartTo)) and'
      
        '        ((part.not_in_use <> :Not_in_Use) or (:Not_In_use = '#39#39'))' +
        ' and'
      
        '          (((Part.Customer = :Customer) and (Part.Branch_No = :C' +
        'ustBranch)) or (:Customer = 0)) and'
      '          ((:Rep = 0) or (Rep.Rep = :Rep))'
      'order by  store_stock.part'
      ''
      ''
      ''
      ''
      ''
      ' '
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
    Left = 40
    Top = 144
    ParamData = <
      item
        Name = 'theDate'
        DataType = ftDateTime
      end
      item
        Name = 'noOfDays'
        DataType = ftInteger
      end
      item
        Name = 'PartFrom'
        DataType = ftString
      end
      item
        Name = 'PartTo'
        DataType = ftString
      end
      item
        Name = 'Not_in_Use'
        DataType = ftString
      end
      item
        Name = 'Not_In_use'
        DataType = ftString
      end
      item
        Name = 'Customer'
        DataType = ftInteger
      end
      item
        Name = 'CustBranch'
        DataType = ftInteger
      end
      item
        Name = 'Customer'
        DataType = ftInteger
      end
      item
        Name = 'Rep'
        DataType = ftInteger
      end
      item
        Name = 'Rep'
        DataType = ftInteger
      end>
  end
  object qryDummy: TFDQuery
    SQL.Strings = (
      'select TOP :Max_Records store_stock.part as Part,'
      '          part.part_description as Description,'
      '          part.part_Cost_Cat as Sales_Value,'
      '          part.Sell_Pack_Quantity as Sell_Pack_Size,'
      '          part_store.part_store_name as Part_Store_Name,'
      '          Part.Not_In_Use,'
      '          Customer.name as CustName,'
      '          store_stock.part_bin as Bin,'
      '          store_Stock.Part_Store_Lot as Lot,'
      '          store_stock.Store_stock_description as Stock_Ref,'
      '          store_stock.store_quantity as Quantity,'
      '          store_Stock.Stock_Pack_Quantity as Pack_Size,'
      '          (store_stock.store_Cost) as Stock_Value,'
      '          Store_Stock.Part_Store,'
      '          store_stock.date_received,'
      '          store_stock.invoice_upfront,'
      '          store_stock.store_stock'
      
        'FROM ((Customer RIGHT JOIN ((part INNER JOIN (store_stock INNER ' +
        'JOIN'
      
        '    part_store ON store_stock.Part_Store = part_store.Part_Store' +
        ')'
      '    ON part.Part = store_stock.Part)'
      
        '    LEFT JOIN Customer_Branch ON (part.Branch_no = Customer_Bran' +
        'ch.Branch_no)'
      '    AND (part.Customer = Customer_Branch.Customer))'
      '    ON Customer.Customer = Customer_Branch.Customer))'
      
        'where     (((:theDate - store_stock.date_received) > :noOfDays) ' +
        'and'
      
        '      (Store_Stock.Part >= :PartFrom) and (Store_Stock.Part <= :' +
        'PartTo)) and'
      
        '        ((part.not_in_use <> :Not_in_Use) or (:Not_In_use = '#39#39'))' +
        ' and'
      
        '          (((Part.Customer = :Customer) and (Part.Branch_No = :C' +
        'ustBranch)) or (:Customer = 0)) and'
      
        '          ((Store_Stock.Part_Store = :Part_store) or (:Part_Stor' +
        'e = 0)) and'
      
        '          ((Store_Stock.Part_Bin >= :Bin_From) and (Store_Stock.' +
        'Part_Bin <= :Bin_To))'
      
        'order by  Part_Store_Name, store_stock.part_bin, store_stock.par' +
        't')
    Left = 110
    Top = 14
    ParamData = <
      item
        Name = 'Max_Records'
      end
      item
        Name = 'theDate'
      end
      item
        Name = 'noOfDays'
      end
      item
        Name = 'PartFrom'
      end
      item
        Name = 'PartTo'
      end
      item
        Name = 'Not_in_Use'
      end
      item
        Name = 'Not_In_use'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'CustBranch'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Part_store'
      end
      item
        Name = 'Part_Store'
      end
      item
        Name = 'Bin_From'
      end
      item
        Name = 'Bin_To'
      end>
  end
  object qryLastUsageDate: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select top 1 date_received as Sales_Dt'
      'from part_movement'
      'where (Part_Movement.Part = :Part) and'
      '  (Part_movement.Part_Movement_Bin = :Bin) and'
      '  (Part_movement.Part_Store_Lot = :Lot) and'
      '  (Part_Movement.Part_Movement_Store = :Store) and'
      '  (Part_Movement.Part_Movement_Type = '#39'D'#39')'
      'Order by Date_received desc'
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 214
    Top = 22
    ParamData = <
      item
        Name = 'Part'
        DataType = ftString
      end
      item
        Name = 'Bin'
        DataType = ftString
      end
      item
        Name = 'Lot'
        DataType = ftString
      end
      item
        Name = 'Store'
        DataType = ftInteger
      end>
  end
end
