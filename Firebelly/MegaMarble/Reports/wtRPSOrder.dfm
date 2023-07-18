object frmwtRPSOrder: TfrmwtRPSOrder
  Left = 237
  Top = 92
  Width = 1119
  Height = 746
  Caption = 'Sales Order Print'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object qrpDetails: TQuickRep
    Left = 40
    Top = -142
    Width = 794
    Height = 1123
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    BeforePrint = qrpDetailsBeforePrint
    DataSet = qryReport
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
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
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Values = (
      0.000000000000000000
      2970.000000000000000000
      150.000000000000000000
      2100.000000000000000000
      100.000000000000000000
      0.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.OutputBin = Auto
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrintIfEmpty = True
    ReportTitle = 'Sales Order Print'
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsMaximized
    object qrgSalesOrder: TQRGroup
      Left = 38
      Top = 445
      Width = 756
      Height = 2
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = qrgSalesOrderBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        5.291666666666667000
        2000.250000000000000000)
      Expression = 'sales_order'
      FooterBand = qrbSOFooter
      Master = qrpDetails
      ReprintOnNewPage = False
    end
    object qrbPageHeader: TQRBand
      Left = 38
      Top = 57
      Width = 756
      Height = 388
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = qrbPageHeaderBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        1026.583333333333000000
        2000.250000000000000000)
      BandType = rbPageHeader
      object QRShape7: TgtQRShape
        Left = 8
        Top = 354
        Width = 714
        Height = 31
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          82.020833333333340000
          21.166666666666670000
          936.625000000000100000
          1889.125000000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape3: TgtQRShape
        Left = 8
        Top = 301
        Width = 713
        Height = 49
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          129.645833333333300000
          21.166666666666670000
          796.395833333333300000
          1886.479166666667000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape2: TgtQRShape
        Left = 448
        Top = 71
        Width = 273
        Height = 80
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          211.666666666666700000
          1185.333333333333000000
          187.854166666666700000
          722.312500000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel2: TgtQRLabel
        Left = 459
        Top = 105
        Width = 63
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1214.437500000000000000
          277.812500000000000000
          166.687500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Order Date:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText1: TgtQRDBText
        Left = 647
        Top = 105
        Width = 68
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1711.854166666667000000
          277.812500000000000000
          179.916666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Date_Raised'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText2: TgtQRDBText
        Left = 646
        Top = 78
        Width = 69
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1709.208333333333000000
          206.375000000000000000
          182.562500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Sales_Order'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel3: TgtQRLabel
        Left = 459
        Top = 78
        Width = 53
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1214.437500000000000000
          206.375000000000000000
          140.229166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Order No:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText4: TgtQRDBText
        Left = 15
        Top = 330
        Width = 201
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          39.687500000000000000
          873.125000000000000000
          531.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Reference'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel5: TgtQRLabel
        Left = 15
        Top = 307
        Width = 90
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          39.687500000000000000
          812.270833333333300000
          238.125000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Your Reference:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel1: TgtQRLabel
        Left = 16
        Top = 181
        Width = 57
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          478.895833333333300000
          150.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Customer'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object qrlblFitDateLabel: TgtQRLabel
        Left = 473
        Top = 306
        Width = 101
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1251.479166666667000000
          809.625000000000000000
          267.229166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Proposed Fit date:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel9: TgtQRLabel
        Left = 16
        Top = 364
        Width = 55
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          42.333333333333330000
          963.083333333333300000
          145.520833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Description'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel12: TgtQRLabel
        Left = 456
        Top = 364
        Width = 41
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1206.500000000000000000
          963.083333333333300000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Quantity'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel14: TgtQRLabel
        Left = 520
        Top = 364
        Width = 46
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1375.833333333333000000
          963.083333333333300000
          121.708333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Unit Price'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel15: TgtQRLabel
        Left = 659
        Top = 364
        Width = 46
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1743.604166666667000000
          963.083333333333300000
          121.708333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total Nett'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlblTemplateDateLabel: TgtQRLabel
        Left = 233
        Top = 306
        Width = 140
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          616.479166666666700000
          809.625000000000000000
          370.416666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Proposed Template date:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape6: TgtQRShape
        Left = 549
        Top = 70
        Width = 9
        Height = 80
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          211.666666666666700000
          1452.562500000000000000
          185.208333333333300000
          23.812500000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape3: TgtQRShape
        Left = 448
        Top = 93
        Width = 273
        Height = 5
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          13.229166666666670000
          1185.333333333333000000
          246.062500000000000000
          722.312500000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape1: TgtQRShape
        Left = 448
        Top = 122
        Width = 273
        Height = 5
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          13.229166666666670000
          1185.333333333333000000
          322.791666666666700000
          722.312500000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape1: TgtQRShape
        Left = 8
        Top = 158
        Width = 328
        Height = 137
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          362.479166666666700000
          21.166666666666670000
          418.041666666666700000
          867.833333333333300000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrmAddress: TgtQRMemo
        Left = 14
        Top = 179
        Width = 289
        Height = 105
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          277.812500000000000000
          37.041666666666670000
          473.604166666666700000
          764.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object gtQRLabel1: TgtQRLabel
        Left = 459
        Top = 133
        Width = 82
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1214.437500000000000000
          351.895833333333300000
          216.958333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Your Order No.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object gtQRDBText1: TgtQRDBText
        Left = 560
        Top = 133
        Width = 155
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1481.666666666667000000
          351.895833333333300000
          410.104166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Order_Ref_No'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object gtQRShape2: TgtQRShape
        Left = 386
        Top = 158
        Width = 336
        Height = 137
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          362.479166666666700000
          1021.291666666667000000
          418.041666666666700000
          889.000000000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrmSiteAddress: TgtQRMemo
        Left = 400
        Top = 179
        Width = 289
        Height = 105
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          277.812500000000000000
          1058.333333333333000000
          473.604166666666700000
          764.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object gtQRShape4: TgtQRShape
        Left = 221
        Top = 301
        Width = 9
        Height = 49
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          129.645833333333300000
          584.729166666666700000
          796.395833333333300000
          23.812500000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRShape5: TgtQRShape
        Left = 453
        Top = 301
        Width = 9
        Height = 49
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          129.645833333333300000
          1198.562500000000000000
          796.395833333333300000
          23.812500000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRShape6: TgtQRShape
        Left = 8
        Top = 322
        Width = 713
        Height = 5
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          13.229166666666670000
          21.166666666666670000
          851.958333333333300000
          1886.479166666667000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRLabel2: TgtQRLabel
        Left = 14
        Top = 162
        Width = 57
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          37.041666666666670000
          428.625000000000000000
          150.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Customer'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object gtQRLabel3: TgtQRLabel
        Left = 398
        Top = 162
        Width = 61
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1053.041666666667000000
          428.625000000000000000
          161.395833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Installation'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object gtQRLabel7: TgtQRLabel
        Left = 584
        Top = 364
        Width = 48
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1545.166666666667000000
          963.083333333333300000
          127.000000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'VAT Rate'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlblTemplateDate: TgtQRLabel
        Left = 232
        Top = 329
        Width = 86
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          613.833333333333300000
          870.479166666666700000
          227.541666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblTemplateDate'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlblDateRequired: TgtQRLabel
        Left = 472
        Top = 329
        Width = 86
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1248.833333333333000000
          870.479166666666700000
          227.541666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblDateRequired'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qriHeadLogo: TgtQRImage
        Left = 8
        Top = 4
        Width = 245
        Height = 133
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          351.895833333333300000
          21.166666666666670000
          10.583333333333330000
          648.229166666666700000)
        Stretch = True
      end
      object memAddress: TgtQRMemo
        Left = 259
        Top = 6
        Width = 76
        Height = 131
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          346.604166666666700000
          685.270833333333300000
          15.875000000000000000
          201.083333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = True
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
    end
    object qrsdSOLines: TQRSubDetail
      Left = 38
      Top = 447
      Width = 756
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = qrsdSOLinesBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.500000000000000000
        2000.250000000000000000)
      Master = qrpDetails
      DataSet = qrySOLine
      PrintBefore = False
      PrintIfEmpty = True
      object qrlblUnitPrice: TgtQRLabel
        Left = 512
        Top = 4
        Width = 63
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1354.666666666667000000
          10.583333333333330000
          166.687500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblUnitPrice'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlblTotalPrice: TgtQRLabel
        Left = 645
        Top = 4
        Width = 68
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1706.562500000000000000
          10.583333333333330000
          179.916666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblTotalPrice'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText7: TgtQRDBText
        Left = 463
        Top = 4
        Width = 41
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1225.020833333333000000
          10.583333333333330000
          108.479166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qrySOLine
        DataField = 'Quantity'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlblDescription: TgtQRLabel
        Left = 16
        Top = 4
        Width = 433
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          42.333333333333340000
          10.583333333333330000
          1145.645833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'qrlblDescription'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object gtQRDBText2: TgtQRDBText
        Left = 586
        Top = 4
        Width = 46
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1550.458333333333000000
          10.583333333333330000
          121.708333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qrySOLine
        DataField = 'Vat_Rate'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object qrbSOFooter: TQRBand
      Left = 38
      Top = 572
      Width = 756
      Height = 194
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = qrbSOFooterAfterPrint
      AlignToBottom = True
      BeforePrint = qrbSOFooterBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        513.291666666666700000
        2000.250000000000000000)
      BandType = rbGroupFooter
      object qrshpPayment: TgtQRShape
        Left = 8
        Top = 39
        Width = 385
        Height = 122
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          322.791666666666700000
          21.166666666666670000
          103.187500000000000000
          1018.645833333333000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape10: TgtQRShape
        Left = 641
        Top = 9
        Width = 81
        Height = 183
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          484.187500000000000000
          1695.979166666667000000
          23.812500000000000000
          214.312500000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape7: TgtQRShape
        Left = 642
        Top = 127
        Width = 78
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          1698.625000000000000000
          336.020833333333400000
          206.375000000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape15: TgtQRShape
        Left = 642
        Top = 97
        Width = 78
        Height = 4
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          10.583333333333330000
          1698.625000000000000000
          256.645833333333400000
          206.375000000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape14: TgtQRShape
        Left = 642
        Top = 66
        Width = 78
        Height = 4
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          10.583333333333330000
          1698.625000000000000000
          174.625000000000000000
          206.375000000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape13: TgtQRShape
        Left = 642
        Top = 36
        Width = 78
        Height = 6
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          15.875000000000000000
          1698.625000000000000000
          95.250000000000000000
          206.375000000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel17: TgtQRLabel
        Left = 535
        Top = 47
        Width = 49
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1415.520833333333000000
          124.354166666666700000
          129.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total VAT'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel18: TgtQRLabel
        Left = 535
        Top = 77
        Width = 63
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1415.520833333333000000
          203.729166666666700000
          166.687500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Order Total'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlblVAT: TgtQRLabel
        Left = 670
        Top = 47
        Width = 43
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1772.708333333333000000
          124.354166666666700000
          113.770833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblVAT'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlblGross: TgtQRLabel
        Left = 653
        Top = 77
        Width = 60
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1727.729166666667000000
          203.729166666666700000
          158.750000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblGross'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlblNett: TgtQRLabel
        Left = 673
        Top = 17
        Width = 40
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1780.645833333333000000
          44.979166666666670000
          105.833333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblNett'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlblDeposit: TgtQRLabel
        Left = 656
        Top = 137
        Width = 57
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1735.666666666667000000
          362.479166666666700000
          150.812500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblDeposit'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel13: TgtQRLabel
        Left = 535
        Top = 168
        Width = 82
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1415.520833333333000000
          444.500000000000000000
          216.958333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Balance to pay:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlblBalance: TgtQRLabel
        Left = 645
        Top = 168
        Width = 68
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1706.562500000000000000
          444.500000000000000000
          179.916666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblBalance'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object gtQRShape8: TgtQRShape
        Left = 756
        Top = 5
        Width = 6
        Height = 682
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          1804.458333333333000000
          2000.250000000000000000
          13.229166666666670000
          15.875000000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRLabel4: TgtQRLabel
        Left = 535
        Top = 17
        Width = 46
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1415.520833333333000000
          44.979166666666670000
          121.708333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total Nett'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object gtQRLabel5: TgtQRLabel
        Left = 535
        Top = 107
        Width = 73
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1415.520833333333000000
          283.104166666666700000
          193.145833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Deposit To Pay'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object gtQRLabel6: TgtQRLabel
        Left = 535
        Top = 137
        Width = 60
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1415.520833333333000000
          362.479166666666700000
          158.750000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Deposit Paid'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape9: TgtQRShape
        Left = 8
        Top = 6
        Width = 713
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          21.166666666666670000
          15.875000000000000000
          1886.479166666667000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrlblToPay: TgtQRLabel
        Left = 662
        Top = 107
        Width = 51
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1751.541666666667000000
          283.104166666666700000
          134.937500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblToPay'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object gtQRShape12: TgtQRShape
        Left = 642
        Top = 158
        Width = 78
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          1698.625000000000000000
          418.041666666666700000
          206.375000000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object memPayment: TgtQRMemo
        Left = 16
        Top = 49
        Width = 369
        Height = 104
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          275.166666666666700000
          42.333333333333340000
          129.645833333333300000
          976.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'Payment by cheque payable etc.')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlblDepositTerms: TgtQRLabel
        Left = 443
        Top = 107
        Width = 70
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1172.104166666667000000
          283.104166666666700000
          185.208333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Deposit Terms'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlblPaymentTerms: TgtQRLabel
        Left = 15
        Top = 19
        Width = 92
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          39.687500000000000000
          50.270833333333330000
          243.416666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Payment Terms:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object gtQRLabel8: TgtQRLabel
        Left = 15
        Top = 171
        Width = 406
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          39.687500000000000000
          452.437500000000000000
          1074.208333333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 
          'Order subject to our standard Terms and Conditions which are ava' +
          'ilable on request.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object QRBand1: TQRBand
      Left = 38
      Top = 766
      Width = 756
      Height = 45
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        119.062500000000000000
        2000.250000000000000000)
      BandType = rbPageFooter
    end
    object gtQRShape9: TgtQRShape
      Left = 756
      Top = 411
      Width = 6
      Height = 483
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        1277.937500000000000000
        2000.250000000000000000
        1087.437500000000000000
        15.875000000000000000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object gtQRShape10: TgtQRShape
      Left = 43
      Top = 411
      Width = 6
      Height = 483
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        1277.937500000000000000
        113.770833333333300000
        1087.437500000000000000
        15.875000000000000000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object gtQRShape11: TgtQRShape
      Left = 676
      Top = 411
      Width = 6
      Height = 483
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        1277.937500000000000000
        1788.583333333333000000
        1087.437500000000000000
        15.875000000000000000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object qrsdQElements: TQRSubDetail
      Left = 38
      Top = 471
      Width = 756
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = qrsdQElementsBeforePrint
      Color = clWhite
      Enabled = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.500000000000000000
        2000.250000000000000000)
      Master = qrsdSOLines
      DataSet = qryQElements
      PrintBefore = False
      PrintIfEmpty = True
      object lblWorktopSize: TgtQRLabel
        Left = 273
        Top = 2
        Width = 72
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          722.312500000000000000
          5.291666666666667000
          190.500000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'lblWorktopSize'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object lblWorktopArea: TgtQRLabel
        Left = 375
        Top = 2
        Width = 75
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          992.187500000000000000
          5.291666666666667000
          198.437500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'lblWorktopArea'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object qrsdQCutOuts: TQRSubDetail
      Left = 38
      Top = 495
      Width = 756
      Height = 26
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = qrsdQCutOutsBeforePrint
      Color = clWhite
      Enabled = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        68.791666666666670000
        2000.250000000000000000)
      Master = qrsdSOLines
      DataSet = qryQCutOuts
      PrintBefore = False
      PrintIfEmpty = True
      object qrlblQuantity: TgtQRLabel
        Left = 389
        Top = 3
        Width = 61
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1029.229166666667000000
          7.937500000000000000
          161.395833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblQuantity'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlblCutOut: TgtQRLabel
        Left = 291
        Top = 3
        Width = 54
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          769.937500000000000000
          7.937500000000000000
          142.875000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblCutOut'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object qrsdQEdges: TQRSubDetail
      Left = 38
      Top = 521
      Width = 756
      Height = 25
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = qrsdQEdgesBeforePrint
      Color = clWhite
      Enabled = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        66.145833333333330000
        2000.250000000000000000)
      Master = qrsdSOLines
      DataSet = qryQEdges
      PrintBefore = False
      PrintIfEmpty = True
      object qrlblLength: TgtQRLabel
        Left = 396
        Top = 2
        Width = 54
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1047.750000000000000000
          5.291666666666667000
          142.875000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblLength'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlblEdgeDescription: TgtQRLabel
        Left = 246
        Top = 3
        Width = 99
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          650.875000000000000000
          7.937500000000000000
          261.937500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblEdgeDescription'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object qrsdQExtras: TQRSubDetail
      Left = 38
      Top = 546
      Width = 756
      Height = 26
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = qrsdQExtrasBeforePrint
      Color = clWhite
      Enabled = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        68.791666666666670000
        2000.250000000000000000)
      Master = qrsdSOLines
      DataSet = qryQExtras
      PrintBefore = False
      PrintIfEmpty = True
      object qrlblExtraQuantity: TgtQRDBText
        Left = 408
        Top = 4
        Width = 41
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1079.500000000000000000
          10.583333333333330000
          108.479166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataField = 'Quantity'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlblExtraDescription: TgtQRLabel
        Left = 245
        Top = 3
        Width = 100
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          648.229166666666700000
          7.937500000000000000
          264.583333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblExtraDescription'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object qrlblSOCaption: TgtQRLabel
      Left = 472
      Top = 40
      Width = 289
      Height = 85
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        224.895833333333300000
        1248.833333333333000000
        105.833333333333300000
        764.645833333333300000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = False
      AutoStretch = False
      Caption = 'ORDER CONFIRMATION'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -37
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 28
    end
  end
  object qryReport: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Sales_Order.*,'
      '        Operator.Operator_Name,'
      '        Operator.Telephone_number,'
      '        Account_Manager.Operator_Name as Account_Manager_Name,'
      '        Account_Manager.Telephone_number as AM_Telephone_Number'
      'FROM Operator AS Account_Manager'
      '        RIGHT JOIN (Operator'
      '        INNER JOIN Sales_Order'
      '          ON Operator.Operator = Sales_Order.Operator)'
      
        '          ON Account_Manager.Operator = Sales_Order.Account_Mana' +
        'ger'
      'WHERE Sales_Order.Sales_Order = :Sales_Order AND'
      '(Sales_Order.Operator = Operator.Operator)')
    Left = 379
    Top = 110
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end>
  end
  object dtsReport: TDataSource
    DataSet = qryReport
    Left = 296
    Top = 56
  end
  object qryAddress: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select *'
      'from Address'
      'where Address = :Address')
    Left = 374
    Top = 35
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Address'
        ParamType = ptUnknown
      end>
  end
  object qryCustomer: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT'
      '      Customer,'
      '      Customer_name,'
      '      Street,'
      '      Locale,'
      '      Town_City,'
      '      postcode,'
      '      County_State,'
      '      Vat.Vat_Rate,'
      '      Telephone_Number,'
      '      Email_Address,'
      '      Credit_Status,'
      '      Payment_Terms.Payment_Terms_Description'
      'FROM Payment_Terms'
      '    RIGHT JOIN (Vat'
      '    INNER JOIN Customer'
      '      ON Vat.Vat = Customer.Vat)'
      '      ON Payment_Terms.Payment_Terms = Customer.Payment_Terms'
      'WHERE Customer = :Customer')
    Left = 454
    Top = 38
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Customer'
        ParamType = ptUnknown
      end>
  end
  object dtsAddress: TDataSource
    Left = 230
    Top = 51
  end
  object qryCompany: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * from company'
      'where company = 1')
    Left = 414
    Top = 159
  end
  object qrygetNotes: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from Notes'
      'where notes_code = :Notes_Code'
      'order by notes_code, notes_line')
    Left = 206
    Top = 199
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Notes_Code'
        ParamType = ptUnknown
      end>
  end
  object qryEndUser: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select End_User, End_User_name,'
      'Street,'
      'Locale,'
      'Town_City,'
      'postcode,'
      'County_State,'
      'Vat_Rate'
      'from End_User, VAT'
      'where End_User = :End_User and'
      'End_User.VAT = Vat.Vat')
    Left = 342
    Top = 158
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'End_User'
        ParamType = ptUnknown
      end>
  end
  object qrySOLine: TFDQuery
    ConnectionName = 'wt'
    MasterSource = dtsReport
    SQL.Strings = (
      'SELECT Sales_Order_Line.Sales_Order,'
      '  Sales_Order_Line.Sales_order_Line_no,'
      '  Sales_Order_Line.Job,'
      '  Sales_Order_Line.Unit_price,'
      '  Sales_Order_Line.Quantity,'
      '  Sales_Order_Line.Sell_Unit,'
      
        '  ((Sales_Order_Line.Quantity / Sales_Order_Line.Sell_unit)* Sal' +
        'es_Order_Line.Unit_Price) as Total_Price,'
      '  Sales_Order_Line.Nett_Price,'
      '  Sales_Order_Line.Discount_Value,'
      '  Sales_Order_Line.Markup_Value,'
      '  Sales_Order_Line.Waste_Value,'
      '  Sales_Order_Line.Installation_price,'
      '  Sales_Order_Line.Survey_price,'
      '  Sales_Order_Line.Delivery_Price,'
      '  Sales_Order_Line.Description,'
      '  Sales_Order_Line.Product,'
      '  Sales_Order_Line.Quote,'
      '  Sales_Order_Line.Vat,'
      '  Vat.Vat_Rate,'
      '  Vat.Description as VAT_Description'
      'FROM Sales_Order_Line'
      '  INNER JOIN Vat ON Sales_Order_Line.Vat = Vat.Vat'
      'WHERE Sales_Order = :Sales_Order'
      'Order BY Sales_Order_Line_no')
    Left = 406
    Top = 288
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end>
    object qrySOLineSales_Order: TIntegerField
      FieldName = 'Sales_Order'

    end
    object qrySOLineSales_order_Line_no: TIntegerField
      FieldName = 'Sales_order_Line_no'

    end
    object qrySOLineJob: TFloatField
      FieldName = 'Job'

    end
    object qrySOLineUnit_price: TFloatField
      FieldName = 'Unit_price'

      DisplayFormat = '0.00'
    end
    object qrySOLineQuantity: TIntegerField
      FieldName = 'Quantity'

    end
    object qrySOLineSell_Unit: TIntegerField
      FieldName = 'Sell_Unit'

    end
    object qrySOLineTotal_Price: TFloatField
      FieldName = 'Total_Price'

      DisplayFormat = '0.00'
    end
    object qrySOLineNett_Price: TFloatField
      FieldName = 'Nett_Price'

      DisplayFormat = '0.00'
    end
    object qrySOLineDiscount_Value: TFloatField
      FieldName = 'Discount_Value'

      DisplayFormat = '0.00'
    end
    object qrySOLineInstallation_price: TFloatField
      FieldName = 'Installation_price'

      DisplayFormat = '0.00'
    end
    object qrySOLineSurvey_price: TFloatField
      FieldName = 'Survey_price'

      DisplayFormat = '0.00'
    end
    object qrySOLineDelivery_Price: TFloatField
      FieldName = 'Delivery_Price'

      DisplayFormat = '0.00'
    end
    object qrySOLineDescription: TStringField
      FieldName = 'Description'

      Size = 50
    end
    object qrySOLineProduct: TIntegerField
      FieldName = 'Product'

    end
    object qrySOLineVat: TIntegerField
      FieldName = 'Vat'

    end
    object qrySOLineVat_Rate: TFloatField
      FieldName = 'Vat_Rate'

      DisplayFormat = '0.00%'
    end
    object qrySOLineVAT_Description: TStringField
      FieldName = 'VAT_Description'

      Size = 40
    end
    object qrySOLineQuote: TIntegerField
      FieldName = 'Quote'

    end
    object qrySOLineMarkup_Value: TFloatField
      FieldName = 'Markup_Value'
    end
    object qrySOLineWaste_Value: TFloatField
      FieldName = 'Waste_Value'
    end
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
      'Email_Address,'
      'Web_Address '
      'from Company')
    Left = 432
    Top = 201
  end
  object GetNarrSQL: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'Select Notes_Text'
      'From Notes'
      'Where (Notes_Code = :Notes_Code)'
      'Order By Notes_Line')
    Left = 240
    Top = 21
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Notes_Code'
        ParamType = ptUnknown
      end>
  end
  object qryQElements: TFDQuery
    ConnectionName = 'WT'
    MasterSource = dtsSOLine
    SQL.Strings = (
      'SELECT  Quote_Element.*,'
      '        Thickness.Thickness_mm,'
      '        Worktop.Description,'
      '        Material_Use.Use_Description'
      'FROM Thickness'
      '      INNER JOIN (Worktop'
      '      INNER JOIN (Worktop_thickness'
      '      INNER JOIN (Material_Use'
      '      RIGHT JOIN Quote_Element'
      
        '        ON Material_Use.Material_Use = Quote_Element.Material_Us' +
        'e)'
      
        '        ON (Worktop_thickness.Thickness = Quote_Element.Thicknes' +
        's) AND (Worktop_thickness.Worktop = Quote_Element.Worktop))'
      '        ON Worktop.Worktop = Worktop_thickness.Worktop)'
      '        ON Thickness.Thickness = Worktop_thickness.Thickness'
      'WHERE Quote = :Quote'
      'ORDER BY Element_number')
    Left = 840
    Top = 24
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Quote'
        ParamType = ptUnknown
      end>
  end
  object qryQEdges: TFDQuery
    ConnectionName = 'wt'
    MasterSource = dtsSOLine
    SQL.Strings = (
      'select Quote_Edge.*, Edge_Profile.Description'
      'from Quote_Edge, Edge_Profile'
      'where Quote = :Quote and'
      'Quote_Edge.Edge_Profile = Edge_Profile.Edge_Profile'
      'order by Edge_number')
    Left = 910
    Top = 22
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Quote'
        ParamType = ptUnknown
      end>
  end
  object qryQCutOuts: TFDQuery
    ConnectionName = 'WT'
    MasterSource = dtsSOLine
    SQL.Strings = (
      'select Quote_CutOut.*, CutOut.Description'
      'from Quote_CutOut, CutOut'
      'where Quote = :Quote and'
      'Quote_CutOut.CutOut = CutOut.CutOut')
    Left = 974
    Top = 22
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Quote'
        ParamType = ptUnknown
      end>
  end
  object qryQExtras: TFDQuery
    ConnectionName = 'WT'
    MasterSource = dtsSOLine
    SQL.Strings = (
      'select Quote_Extra.*, Extra_Charge.Description'
      'from Quote_Extra, Extra_Charge'
      'where Quote = :Quote and'
      'Quote_Extra.Extra_Charge = Extra_Charge.Extra_Charge')
    Left = 1038
    Top = 25
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Quote'
        ParamType = ptUnknown
      end>
  end
  object dtsSOLine: TDataSource
    DataSet = qrySOLine
    Left = 478
    Top = 291
  end
  object qryUpSOStatus: TFDQuery
    ConnectionName = 'wT'
    SQL.Strings = (
      'update Sales_Order'
      'set Sales_Order_Status = :Sales_Order_Status'
      'Where Sales_Order = :Sales_Order')
    Left = 326
    Top = 293
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Order_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end>
  end
end
