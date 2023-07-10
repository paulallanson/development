object frmwtRPPOrder: TfrmwtRPPOrder
  Left = 170
  Top = 5
  Width = 1206
  Height = 746
  Caption = 'Purchase Order Print'
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
    Left = 24
    Top = 10
    Width = 1123
    Height = 794
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
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
    object qrgPurchaseOrder: TQRGroup
      Left = 38
      Top = 369
      Width = 1047
      Height = 2
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = qrgPurchaseOrderBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        5.291666666666667000
        2770.187500000000000000)
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
        875.770833333333300000
        2770.187500000000000000)
      BandType = rbPageHeader
      object QRShape7: TgtQRShape
        Left = 0
        Top = 299
        Width = 1041
        Height = 31
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          82.020833333333330000
          0.000000000000000000
          791.104166666666700000
          2754.312500000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape2: TgtQRShape
        Left = 675
        Top = 65
        Width = 366
        Height = 90
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          238.125000000000000000
          1785.937500000000000000
          171.979166666666700000
          968.375000000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrlblSOCaption: TgtQRLabel
        Left = 613
        Top = 2
        Width = 417
        Height = 56
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          148.166666666666700000
          1621.895833333333000000
          5.291666666666667000
          1103.312500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'PURCHASE ORDER'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -48
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 36
      end
      object QRLabel2: TgtQRLabel
        Left = 691
        Top = 102
        Width = 77
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          1828.270833333333000000
          269.875000000000000000
          203.729166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Order Date:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText1: TgtQRDBText
        Left = 945
        Top = 101
        Width = 82
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          2500.312500000000000000
          267.229166666666700000
          216.958333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
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
        WordWrap = True
        FontSize = 9
      end
      object QRDBText2: TgtQRDBText
        Left = 920
        Top = 73
        Width = 107
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          2434.166666666667000000
          193.145833333333300000
          283.104166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
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
        WordWrap = True
        FontSize = 10
      end
      object QRLabel3: TgtQRLabel
        Left = 691
        Top = 73
        Width = 124
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          1828.270833333333000000
          193.145833333333300000
          328.083333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Purchase Order No:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel1: TgtQRLabel
        Left = 19
        Top = 180
        Width = 57
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          50.270833333333330000
          476.250000000000000000
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
      object QRLabel9: TgtQRLabel
        Left = 30
        Top = 309
        Width = 221
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          79.375000000000000000
          817.562500000000000000
          584.729166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Description/Customer/Reference'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel12: TgtQRLabel
        Left = 678
        Top = 309
        Width = 65
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          1793.875000000000000000
          817.562500000000000000
          171.979166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Unit Cost'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel14: TgtQRLabel
        Left = 802
        Top = 309
        Width = 64
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          2121.958333333333000000
          817.562500000000000000
          169.333333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Sub Total'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel15: TgtQRLabel
        Left = 965
        Top = 309
        Width = 71
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          2553.229166666667000000
          817.562500000000000000
          187.854166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total Nett'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object memAddress: TgtQRRichText
        Left = 56
        Top = 83
        Width = 281
        Height = 62
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          164.041666666666700000
          148.166666666666700000
          219.604166666666700000
          743.479166666666700000)
        Alignment = taCenter
        AutoStretch = False
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Gill Sans MT'
        Font.Style = []
      end
      object QRShape6: TgtQRShape
        Left = 821
        Top = 64
        Width = 9
        Height = 90
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          238.125000000000000000
          2172.229166666667000000
          169.333333333333300000
          23.812500000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape3: TgtQRShape
        Left = 675
        Top = 93
        Width = 366
        Height = 5
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          13.229166666666670000
          1785.937500000000000000
          246.062500000000000000
          968.375000000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape1: TgtQRShape
        Left = 675
        Top = 123
        Width = 366
        Height = 3
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          7.937500000000000000
          1785.937500000000000000
          325.437500000000000000
          968.375000000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape1: TgtQRShape
        Left = 0
        Top = 152
        Width = 336
        Height = 140
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          370.416666666666700000
          0.000000000000000000
          402.166666666666700000
          889.000000000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrmAddress: TgtQRMemo
        Left = 9
        Top = 175
        Width = 320
        Height = 109
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          288.395833333333300000
          23.812500000000000000
          463.020833333333300000
          846.666666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
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
      object gtQRLabel1: TgtQRLabel
        Left = 691
        Top = 134
        Width = 99
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          1828.270833333333000000
          354.541666666666700000
          261.937500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Date Required:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object gtQRDBText1: TgtQRDBText
        Left = 888
        Top = 133
        Width = 139
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          2349.500000000000000000
          351.895833333333300000
          367.770833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
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
        WordWrap = True
        FontSize = 9
      end
      object gtQRLabel2: TgtQRLabel
        Left = 9
        Top = 156
        Width = 54
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          23.812500000000000000
          412.750000000000000000
          142.875000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Supplier'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object gtQRLabel5: TgtQRLabel
        Left = 888
        Top = 309
        Width = 61
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          2349.500000000000000000
          817.562500000000000000
          161.395833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Discount'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object gtQRLabel6: TgtQRLabel
        Left = 616
        Top = 309
        Width = 25
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          1629.833333333333000000
          817.562500000000000000
          66.145833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Qty'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object gtQRLabel7: TgtQRLabel
        Left = 4
        Top = 309
        Width = 19
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          10.583333333333330000
          817.562500000000000000
          50.270833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'No'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object gtQRLabel9: TgtQRLabel
        Left = 411
        Top = 309
        Width = 95
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          1087.437500000000000000
          817.562500000000000000
          251.354166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Slab Size (mm)'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object gtQRLabel10: TgtQRLabel
        Left = 520
        Top = 309
        Width = 64
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          1375.833333333333000000
          817.562500000000000000
          169.333333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Our Order'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object gtQRShape3: TgtQRShape
        Left = 675
        Top = 173
        Width = 366
        Height = 119
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          314.854166666666700000
          1785.937500000000000000
          457.729166666666700000
          968.375000000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel11: TgtQRLabel
        Left = 691
        Top = 211
        Width = 74
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          1828.270833333333000000
          558.270833333333300000
          195.791666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Telephone:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object gtQRDBText6: TgtQRDBText
        Left = 832
        Top = 210
        Width = 195
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          2201.333333333333000000
          555.625000000000000000
          515.937500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
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
        WordWrap = True
        FontSize = 9
      end
      object gtQRDBText7: TgtQRDBText
        Left = 879
        Top = 180
        Width = 148
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          2325.687500000000000000
          476.250000000000000000
          391.583333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
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
        WordWrap = True
        FontSize = 10
      end
      object gtQRLabel12: TgtQRLabel
        Left = 691
        Top = 180
        Width = 86
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          1828.270833333333000000
          476.250000000000000000
          227.541666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Our Contact:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object gtQRShape4: TgtQRShape
        Left = 821
        Top = 173
        Width = 9
        Height = 119
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          314.854166666666700000
          2172.229166666667000000
          457.729166666666700000
          23.812500000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRShape5: TgtQRShape
        Left = 675
        Top = 201
        Width = 366
        Height = 4
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          10.583333333333330000
          1785.937500000000000000
          531.812500000000000000
          968.375000000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape6: TgtQRShape
        Left = 675
        Top = 231
        Width = 366
        Height = 2
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          5.291666666666667000
          1785.937500000000000000
          611.187500000000000000
          968.375000000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRLabel13: TgtQRLabel
        Left = 691
        Top = 239
        Width = 40
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          1828.270833333333000000
          632.354166666666700000
          105.833333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Email:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object gtQRShape7: TgtQRShape
        Left = 675
        Top = 261
        Width = 366
        Height = 2
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          5.291666666666667000
          1785.937500000000000000
          690.562500000000000000
          968.375000000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRLabel14: TgtQRLabel
        Left = 691
        Top = 270
        Width = 94
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          1828.270833333333000000
          714.375000000000000000
          248.708333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Our Reference'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object gtQRDBText10: TgtQRDBText
        Left = 832
        Top = 270
        Width = 195
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          2201.333333333333000000
          714.375000000000000000
          515.937500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
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
        WordWrap = True
        FontSize = 9
      end
      object gtQRDBText2: TgtQRDBText
        Left = 832
        Top = 239
        Width = 195
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          2201.333333333333000000
          632.354166666666700000
          515.937500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
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
        WordWrap = True
        FontSize = 9
      end
      object qriHeadLogo: TgtQRImage
        Left = 3
        Top = 0
        Width = 385
        Height = 81
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          214.312500000000000000
          7.937500000000000000
          0.000000000000000000
          1018.645833333333000000)
        Stretch = True
      end
    end
    object qrsdPOLines: TQRSubDetail
      Left = 38
      Top = 371
      Width = 1047
      Height = 23
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = qrsdPOLinesBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        60.854166666666670000
        2770.187500000000000000)
      Master = qrpDetails
      DataSet = qryPOLine
      PrintBefore = False
      PrintIfEmpty = True
      object gtQRDBText8: TgtQRDBText
        Left = 521
        Top = 4
        Width = 71
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1378.479166666667000000
          10.583333333333330000
          187.854166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
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
        WordWrap = True
        FontSize = 9
      end
      object qrlblSlabDescription: TgtQRLabel
        Left = 388
        Top = 4
        Width = 119
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1026.583333333333000000
          10.583333333333330000
          314.854166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblSlabDescription'
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
      object qrlblTotalLineCost: TgtQRLabel
        Left = 928
        Top = 4
        Width = 107
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          2455.333333333333000000
          10.583333333333330000
          283.104166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblTotalLineCost'
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
      object QRDBText7: TgtQRDBText
        Left = 590
        Top = 4
        Width = 51
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1561.041666666667000000
          10.583333333333330000
          134.937500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
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
        WordWrap = True
        FontSize = 9
      end
      object gtlblLineCount: TgtQRLabel
        Left = 9
        Top = 4
        Width = 86
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          23.812500000000000000
          10.583333333333330000
          227.541666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'gtlblLineCount'
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
      object qrlblUnitCost: TgtQRLabel
        Left = 667
        Top = 4
        Width = 77
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1764.770833333333000000
          10.583333333333330000
          203.729166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblUnitCost'
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
      object qrlblLineCost: TgtQRLabel
        Left = 790
        Top = 4
        Width = 77
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          2090.208333333333000000
          10.583333333333330000
          203.729166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblLineCost'
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
      object qrlblDiscountValue: TgtQRLabel
        Left = 836
        Top = 4
        Width = 112
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          2211.916666666667000000
          10.583333333333330000
          296.333333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblDiscountValue'
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
      object qrlblDescription: TgtQRLabel
        Left = 30
        Top = 4
        Width = 355
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          79.375000000000000000
          10.583333333333330000
          939.270833333333300000)
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
        WordWrap = True
        FontSize = 9
      end
    end
    object qrbPOFooter: TQRBand
      Left = 38
      Top = 418
      Width = 1047
      Height = 150
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = True
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        396.875000000000000000
        2770.187500000000000000)
      BandType = rbPageFooter
      object qrshpPayment: TgtQRShape
        Left = 368
        Top = 22
        Width = 370
        Height = 123
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          325.437500000000000000
          973.666666666666700000
          58.208333333333330000
          978.958333333333300000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape10: TgtQRShape
        Left = 882
        Top = 9
        Width = 159
        Height = 32
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          84.666666666666670000
          2333.625000000000000000
          23.812500000000000000
          420.687500000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrlblNett: TgtQRLabel
        Left = 972
        Top = 17
        Width = 61
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          2571.750000000000000000
          44.979166666666670000
          161.395833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblNett'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object gtQRLabel4: TgtQRLabel
        Left = 760
        Top = 17
        Width = 116
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          2010.833333333333000000
          44.979166666666670000
          306.916666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total Order Value'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRShape9: TgtQRShape
        Left = 0
        Top = 6
        Width = 1042
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          0.000000000000000000
          15.875000000000000000
          2756.958333333333000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object memDeliveryNotes: TgtQRMemo
        Left = 374
        Top = 41
        Width = 355
        Height = 90
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          238.125000000000000000
          989.541666666666700000
          108.479166666666700000
          939.270833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
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
        WordWrap = True
        FontSize = 9
      end
      object gtQRLabel16: TgtQRLabel
        Left = 374
        Top = 25
        Width = 98
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          989.541666666666700000
          66.145833333333330000
          259.291666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Delivery Notes'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object gtQRShape2: TgtQRShape
        Left = 0
        Top = 22
        Width = 336
        Height = 123
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          325.437500000000000000
          0.000000000000000000
          58.208333333333330000
          889.000000000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrmDeliveryAddress: TgtQRMemo
        Left = 12
        Top = 46
        Width = 313
        Height = 90
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          238.125000000000000000
          31.750000000000000000
          121.708333333333300000
          828.145833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
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
      object gtQRLabel3: TgtQRLabel
        Left = 12
        Top = 27
        Width = 75
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          37.041666666666670000
          31.750000000000000000
          71.437500000000000000
          198.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Delivery To'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
    end
    object gtQRShape9: TgtQRShape
      Left = 1078
      Top = 337
      Width = 1
      Height = 278
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        735.541666666666700000
        2852.208333333333000000
        891.645833333333300000
        2.645833333333333000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object gtQRShape10: TgtQRShape
      Left = 38
      Top = 337
      Width = 1
      Height = 278
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        735.541666666666700000
        100.541666666666700000
        891.645833333333300000
        2.645833333333333000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object gtQRShape11: TgtQRShape
      Left = 993
      Top = 337
      Width = 1
      Height = 278
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        735.541666666666700000
        2627.312500000000000000
        891.645833333333300000
        2.645833333333333000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object gtQRShape8: TgtQRShape
      Left = 920
      Top = 337
      Width = 1
      Height = 278
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        735.541666666666700000
        2434.166666666667000000
        891.645833333333300000
        2.645833333333333000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object gtQRShape12: TgtQRShape
      Left = 798
      Top = 337
      Width = 1
      Height = 278
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        735.541666666666700000
        2111.375000000000000000
        891.645833333333300000
        2.645833333333333000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object gtQRShape15: TgtQRShape
      Left = 628
      Top = 337
      Width = 1
      Height = 278
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        735.541666666666700000
        1661.583333333333000000
        891.645833333333300000
        2.645833333333333000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object gtQRShape16: TgtQRShape
      Left = 551
      Top = 337
      Width = 1
      Height = 278
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        735.541666666666700000
        1457.854166666667000000
        891.645833333333300000
        2.645833333333333000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object gtQRShape17: TgtQRShape
      Left = 427
      Top = 337
      Width = 1
      Height = 278
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        735.541666666666700000
        1129.770833333333000000
        891.645833333333300000
        2.645833333333333000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object gtQRShape18: TgtQRShape
      Left = 63
      Top = 337
      Width = 1
      Height = 278
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        735.541666666666700000
        166.687500000000000000
        891.645833333333300000
        2.645833333333333000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object gtQRShape13: TgtQRShape
      Left = 687
      Top = 337
      Width = 1
      Height = 278
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        735.541666666666700000
        1817.687500000000000000
        891.645833333333300000
        2.645833333333333000)
      Shape = qrsVertLine
      VertAdjust = 0
    end
    object ChildBand1: TQRChildBand
      Left = 38
      Top = 394
      Width = 1047
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = ChildBand1BeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        58.208333333333330000
        2770.187500000000000000)
      ParentBand = qrsdPOLines
      object qrlblCustomerReference: TgtQRLabel
        Left = 30
        Top = 4
        Width = 355
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          79.375000000000000000
          10.583333333333330000
          939.270833333333300000)
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
        WordWrap = True
        FontSize = 9
      end
    end
    object qrbPurchaseOrderFooter: TQRBand
      Left = 38
      Top = 416
      Width = 1047
      Height = 2
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = qrbPurchaseOrderFooterAfterPrint
      AlignToBottom = True
      BeforePrint = qrbPurchaseOrderFooterBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        5.291666666666667000
        2770.187500000000000000)
      BandType = rbGroupFooter
    end
  end
  object qryReport: TQuery
    DatabaseName = 'wt'
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
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end>
  end
  object dtsReport: TDataSource
    DataSet = qryReport
    Left = 912
    Top = 24
  end
  object qrySupplier: TQuery
    DatabaseName = 'WT'
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
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end>
  end
  object qryCompany: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'select * from company'
      'where company = 1')
    Left = 678
    Top = 151
  end
  object qrygetNotes: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'select *'
      'from Notes'
      'where notes_code = :Notes_Code'
      'order by notes_code, notes_line')
    Left = 806
    Top = 239
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Notes_Code'
        ParamType = ptUnknown
      end>
  end
  object qryPOLine: TQuery
    DatabaseName = 'wt'
    DataSource = dtsReport
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
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end>
  end
  object qryCompanyAddress: TQuery
    DatabaseName = 'wt'
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
  object GetNarrSQL: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'Select Notes_Text'
      'From Notes'
      'Where (Notes_Code = :Notes_Code)'
      'Order By Notes_Line')
    Left = 848
    Top = 589
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Notes_Code'
        ParamType = ptUnknown
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
  object qryUpPO: TQuery
    DatabaseName = 'wT'
    SQL.Strings = (
      'update Purchase_Order'
      'set Purchase_Order_Status = :Purchase_Order_Status'
      'Where Purchase_Order = :Purchase_Order')
    Left = 326
    Top = 293
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Purchase_Order_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end>
  end
end
