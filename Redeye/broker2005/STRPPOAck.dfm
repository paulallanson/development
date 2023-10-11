object STRPPOAckFrm: TSTRPPOAckFrm
  Left = 11
  Top = 115
  Width = 1204
  Height = 619
  VertScrollBar.Position = 3
  Caption = 'Purchase Order Acknowledgement'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PurchOrdQuickReport: TQuickRep
    Left = 24
    Top = 5
    Width = 1123
    Height = 794
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    BeforePrint = PurchOrdQuickReportBeforePrint
    DataSet = GetOrdHedQuery
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
    Page.Values = (
      100.000000000000000000
      2100.000000000000000000
      100.000000000000000000
      2970.000000000000000000
      70.000000000000000000
      70.000000000000000000
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
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsMaximized
    object PageHeaderQRBand: TQRBand
      Left = 26
      Top = 38
      Width = 1070
      Height = 99
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
        261.937500000000000000
        2831.041666666667000000)
      BandType = rbPageHeader
      object gtQRDBText1: TQRDBText
        Left = 830
        Top = 10
        Width = 209
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.854166666666680000
          2196.041666666667000000
          26.458333333333330000
          552.979166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = GetOrdHedQuery
        DataField = 'Supplier_Ack_Number'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 14
      end
      object QRShape3: TQRShape
        Left = 16
        Top = 47
        Width = 753
        Height = 39
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          103.187500000000000000
          42.333333333333330000
          124.354166666666700000
          1992.312500000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object OrdDateQRLabel: TQRLabel
        Left = 790
        Top = 51
        Width = 109
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.854166666666680000
          2090.208333333333000000
          134.937500000000000000
          288.395833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Order Date:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 14
      end
      object PurchOrdDateQRLabel: TQRLabel
        Left = 928
        Top = 51
        Width = 109
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.854166666666680000
          2455.333333333333000000
          134.937500000000000000
          288.395833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Order Date:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 14
      end
      object PurchOrdDescrQRLabel: TQRLabel
        Left = 22
        Top = 56
        Width = 563
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.854166666666680000
          58.208333333333320000
          148.166666666666700000
          1489.604166666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Purchase Order Description'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 14
      end
      object OrdNumQRLabel: TQRLabel
        Left = 422
        Top = 6
        Width = 169
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375000000000000000
          1116.541666666667000000
          15.875000000000000000
          447.145833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Order Number:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 18
      end
      object gtQRLabel1: TQRLabel
        Left = 14
        Top = 6
        Width = 398
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375000000000000000
          37.041666666666670000
          15.875000000000000000
          1053.041666666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Purchase Order Acknowledgement'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 18
      end
      object gtQRLabel2: TQRLabel
        Left = 790
        Top = 10
        Width = 121
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.854166666666680000
          2090.208333333333000000
          26.458333333333330000
          320.145833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Supplier Ref:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 14
      end
    end
    object pogroupheader: TQRGroup
      Left = 26
      Top = 137
      Width = 1070
      Height = 240
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = pogroupheaderBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        635.000000000000000000
        2831.041666666667000000)
      Expression = 'GetOrdHedQuery.Purch_Ord'
      Master = PurchOrdQuickReport
      ReprintOnNewPage = True
      object gtQRShape2: TQRShape
        Left = 416
        Top = 200
        Width = 193
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          1100.666666666667000000
          529.166666666666700000
          510.645833333333300000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape2: TQRShape
        Left = 646
        Top = 40
        Width = 346
        Height = 137
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          362.479166666666700000
          1709.208333333333000000
          105.833333333333300000
          915.458333333333200000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape1: TQRShape
        Left = 64
        Top = 32
        Width = 337
        Height = 137
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          362.479166666666700000
          169.333333333333300000
          84.666666666666680000
          891.645833333333200000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel2: TQRLabel
        Left = 648
        Top = 16
        Width = 84
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1714.500000000000000000
          42.333333333333340000
          222.250000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Deliver To:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRLabel1: TQRLabel
        Left = 62
        Top = 8
        Width = 27
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          164.041666666666700000
          21.166666666666670000
          71.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'To:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object LineQrLabel: TQRLabel
        Left = 0
        Top = 218
        Width = 25
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          576.791666666666800000
          66.145833333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Line'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object PartQRLabel: TQRLabel
        Left = 34
        Top = 218
        Width = 43
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          89.958333333333320000
          576.791666666666800000
          113.770833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Product'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object DescQRLabel: TQRLabel
        Left = 136
        Top = 218
        Width = 64
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          359.833333333333400000
          576.791666666666800000
          169.333333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Description'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object OrdQtyQRLabel: TQRLabel
        Left = 488
        Top = 218
        Width = 54
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          1291.166666666667000000
          576.791666666666800000
          142.875000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Pack Size'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object SAddr5QRLabel: TQRLabel
        Left = 72
        Top = 105
        Width = 321
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          190.500000000000000000
          277.812500000000000000
          849.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Supplier Address'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object SAddr1QRLabel: TQRLabel
        Left = 72
        Top = 41
        Width = 321
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          190.500000000000000000
          108.479166666666700000
          849.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Supplier Address'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object SAddr2QRLabel: TQRLabel
        Left = 72
        Top = 57
        Width = 321
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          190.500000000000000000
          150.812500000000000000
          849.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Supplier Address'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object SAddr3QRLabel: TQRLabel
        Left = 72
        Top = 73
        Width = 321
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          190.500000000000000000
          193.145833333333300000
          849.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Supplier Address'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object SAddr4QRLabel: TQRLabel
        Left = 72
        Top = 89
        Width = 321
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          190.500000000000000000
          235.479166666666700000
          849.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Supplier Address'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object SAddr6QRLabel: TQRLabel
        Left = 72
        Top = 121
        Width = 321
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          190.500000000000000000
          320.145833333333300000
          849.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Supplier Address'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel3: TQRLabel
        Left = 420
        Top = 218
        Width = 52
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1111.250000000000000000
          576.791666666666800000
          137.583333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Order Qty'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel7: TQRLabel
        Left = 803
        Top = 218
        Width = 29
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2124.604166666667000000
          576.791666666666800000
          76.729166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Price'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel12: TQRLabel
        Left = 841
        Top = 218
        Width = 55
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2225.145833333333000000
          576.791666666666800000
          145.520833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Line Total'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object qrlblContact: TQRLabel
        Left = 744
        Top = 16
        Width = 95
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1968.500000000000000000
          42.333333333333340000
          251.354166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblContact'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object DellAddmemo: TQRMemo
        Left = 656
        Top = 49
        Width = 324
        Height = 121
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          320.145833333333300000
          1735.666666666667000000
          129.645833333333300000
          857.250000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = False
        FontSize = 10
      end
      object gtQRLabel3: TQRLabel
        Left = 908
        Top = 218
        Width = 34
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2402.416666666667000000
          576.791666666666800000
          89.958333333333320000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Notes'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object gtQRLabel4: TQRLabel
        Left = 581
        Top = 218
        Width = 29
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1537.229166666667000000
          576.791666666666800000
          76.729166666666680000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Price'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object gtQRLabel6: TQRLabel
        Left = 632
        Top = 218
        Width = 70
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1672.166666666667000000
          576.791666666666800000
          185.208333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Supplied Qty'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object gtQRLabel8: TQRLabel
        Left = 488
        Top = 198
        Width = 44
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          1291.166666666667000000
          523.875000000000000000
          116.416666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Original'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object gtQRLabel5: TQRLabel
        Left = 712
        Top = 218
        Width = 54
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1883.833333333333000000
          576.791666666666800000
          142.875000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Pack Size'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object gtQRShape3: TQRShape
        Left = 632
        Top = 200
        Width = 265
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          1672.166666666667000000
          529.166666666666700000
          701.145833333333200000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRLabel7: TQRLabel
        Left = 744
        Top = 198
        Width = 50
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          1968.500000000000000000
          523.875000000000000000
          132.291666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Supplied'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
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
    object QRSubDetail1: TQRSubDetail
      Left = 26
      Top = 377
      Width = 1070
      Height = 23
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = QRSubDetail1AfterPrint
      AlignToBottom = False
      BeforePrint = QRSubDetail1BeforePrint
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        60.854166666666680000
        2831.041666666667000000)
      Master = PurchOrdQuickReport
      DataSet = GetDetsQuery
      PrintBefore = False
      PrintIfEmpty = True
      object qrlblPackSize: TQRLabel
        Left = 701
        Top = 0
        Width = 65
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1854.729166666667000000
          0.000000000000000000
          171.979166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblPackSize'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object OrigPurchPriceQrLabel: TQRLabel
        Left = 499
        Top = 0
        Width = 111
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1320.270833333333000000
          0.000000000000000000
          293.687500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'OrigPurchPriceQrLabel'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object PackSizeQRLabel: TQRLabel
        Left = 456
        Top = 0
        Width = 86
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1206.500000000000000000
          0.000000000000000000
          227.541666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'PackSizeQRLabel'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object PurchPriceQrLabel: TQRLabel
        Left = 741
        Top = 0
        Width = 91
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1960.562500000000000000
          0.000000000000000000
          240.770833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'PurchPriceQrLabel'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object POrdLineNoQRLabel: TQRLabel
        Left = -8
        Top = 1
        Width = 33
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          -21.166666666666670000
          2.645833333333333000
          87.312500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'LineNo'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object PartCodeQRLabel: TQRLabel
        Left = 34
        Top = 1
        Width = 95
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          89.958333333333320000
          2.645833333333333000
          251.354166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Product'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object PartDescrQRLabel: TQRLabel
        Left = 136
        Top = 1
        Width = 265
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          359.833333333333300000
          2.645833333333333000
          701.145833333333200000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Description'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLblValue: TQRLabel
        Left = 842
        Top = 1
        Width = 55
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          2227.791666666667000000
          2.645833333333333000
          145.520833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QRLblValue'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlblNotes: TQRLabel
        Left = 908
        Top = 1
        Width = 49
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          2402.416666666667000000
          2.645833333333333000
          129.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblNotes'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object PackQTYQrLabel: TQRLabel
        Left = 388
        Top = 0
        Width = 84
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1026.583333333333000000
          0.000000000000000000
          222.250000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'PackQTYQrLabel'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlblSuppliedQty: TQRLabel
        Left = 623
        Top = 0
        Width = 79
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1648.354166666667000000
          0.000000000000000000
          209.020833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblSuppliedQty'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object QRSubDetail2: TQRSubDetail
      Left = 26
      Top = 400
      Width = 1070
      Height = 26
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = QRSubDetail2AfterPrint
      AlignToBottom = False
      BeforePrint = QRSubDetail2BeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        68.791666666666680000
        2831.041666666667000000)
      Master = PurchOrdQuickReport
      DataSet = qryExtraCharges
      PrintBefore = False
      PrintIfEmpty = True
      object qrlblDetails: TQRLabel
        Left = 136
        Top = 3
        Width = 53
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          359.833333333333400000
          7.937500000000000000
          140.229166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblDetails'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlblExChrgAmount: TQRLabel
        Left = 861
        Top = 3
        Width = 36
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2278.062500000000000000
          7.937500000000000000
          95.250000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'ExChrg'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
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
      Left = 26
      Top = 426
      Width = 1070
      Height = 55
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = True
      BeforePrint = QRBand1BeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        145.520833333333300000
        2831.041666666667000000)
      BandType = rbSummary
      object TotalQRLabel: TQRLabel
        Left = 678
        Top = 16
        Width = 118
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1793.875000000000000000
          42.333333333333340000
          312.208333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total Order Value:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object OrderValQRLabel: TQRLabel
        Left = 796
        Top = 16
        Width = 102
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2106.083333333333000000
          42.333333333333340000
          269.875000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'OrderValQRLabel'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
  end
  object GetDetsDataSource: TDataSource
    DataSet = GetOrdHedQuery
    Left = 312
    Top = 19
  end
  object GetOrdDetQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'SELECT Purch_Ord_Line.Quantity_Ordered,Purch_Ord.Purch_Ord_No as' +
        ' OrdNum,'
      
        '       Purch_Ord_Line.Purch_Ord_Line_No,Purch_Ord.Purch_Ord_Date' +
        ','
      
        '       Purch_Ord_Line.Date_Deliv_Expected,Purch_Ord.Purch_Ord_St' +
        'atus,'
      '       Purch_Ord_Line.Purchase_Price,'
      '       Purch_Ord_Line.Original_Purchase_Price,'
      '       Purch_Ord_Line.Quantity_Ordered,'
      '       Purch_Ord_Line.Quantity_Received,'
      '       Purch_Ord_Line.Cost_Price,'
      '       Purch_Ord.Purch_Ord_Descr,'
      '       Part.Part,'
      '       Part.Part_Description,'
      '       Purch_Ord_Line.Purch_Pack_Quantity,'
      '       Purch_Ord_Line.Replacement_For_Line,'
      '       Purch_Ord_Line.Product_Status,'
      '       Purch_Ord_Line.Original_Purch_Pack_Qty,'
      '       Part_Store.Part_Store_Name as DelNam,'
      '       Part_Store.Internal_Number_and_Stret as DelAdd1,'
      '       Part_Store.Internal_District as DelAdd2,'
      '       Part_Store.Internal_Town as DelAdd3,'
      '       Part_Store.Internal_PostCode as DelAdd4,'
      '       Part_Store.Internal_Phone as DelAdd5,'
      '       Part_Store.Internal_Fax as DelAdd6,'
      '       '#39#39' as DelAdd7,'
      '       Purch_Ord.Sales_order,'
      '       Purch_Ord.Narrative'
      'FROM Purch_Ord_Line, Purch_Ord, Part, Part_Store'
      'WHERE ((Purch_Ord.Purch_Ord_No = :Purch_Ord_No)) AND'
      '      (Purch_Ord.Purch_Ord = Purch_Ord_Line.Purch_Ord) AND'
      '      (Part.Part = Purch_Ord_Line.Part) and'
      '      (Part_Store.Part_Store = Purch_Ord.Part_store)'
      'Order By Purch_Ord.Purch_Ord_No,'
      '         Purch_Ord_Line.Purch_Ord_Line_No'
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
    Left = 481
    Top = 122
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Purch_Ord_No'
        ParamType = ptUnknown
      end>
  end
  object GetRecOrdQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'SELECT Purch_Ord_Line.Quantity_Ordered,Purch_ord.Purch_Ord_Rec_r' +
        'ef as OrdNum,'
      
        '       Purch_Ord_Line.Purch_Ord_Line_No,Purch_Ord.Purch_Ord_Date' +
        ','
      
        '       Purch_Ord_Line.Date_Deliv_Expected,Purch_Ord.Purch_Ord_St' +
        'atus,'
      '       Purch_Ord_Line.Purchase_Price,'
      '       Purch_Ord_Line.Quantity_Ordered,'
      '       Purch_Ord.Purch_Ord_Descr,'
      
        '       Part.Part, Part.Part_Description, Part.Purch_Pack_Quantit' +
        'y,'
      '       Part_Store.Part_Store_Name as DelNam,'
      '       Part_Store.Internal_Number_and_Stret as DelAdd1,'
      '       Part_Store.Internal_District as DelAdd2,'
      '       Part_Store.Internal_Town as DelAdd3,'
      '       Part_Store.Internal_PostCode as DelAdd4,'
      '       Part_Store.Internal_Phone as DelAdd5,'
      '       Part_Store.Internal_Fax as DelAdd6,'
      '       '#39#39' as DelAdd7,'
      '       Purch_Ord.Narrative'
      'FROM  Purch_Ord_Line, Purch_Ord, Part, Part_Store'
      'WHERE ((Purch_Ord.Purch_Ord_No = :Sel1) or (:Sel1 = 0)) AND'
      '      (Purch_Ord.Purch_Ord = Purch_Ord_Line.Purch_Ord) AND'
      '      (Part.Part = Purch_Ord_Line.Part) and'
      '      (Part_store.Part_Store = Purch_ord.Part_Store)'
      'Order By Purch_Ord_Rec_Ref,'
      '         Purch_Ord_Line.Purch_Ord_Line_No'
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
      ' ')
    Left = 386
    Top = 118
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Sel1'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Sel1'
        ParamType = ptUnknown
      end>
  end
  object GetDelFromSuppQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Supplier.Name as SuppNam,'
      '       Supplier_Branch.Name,'
      '       Supplier_Branch.Building_No_Name,'
      '       Supplier_Branch.Street,'
      '       Supplier_Branch.Locale,'
      '       Supplier_Branch.Town,'
      '       Supplier_Branch.PostCode,'
      '       Supplier_Branch.Phone as Suppadd5,'
      '       Supplier_Branch.Fax_Number as Suppadd6,'
      '       Supplier_Branch.email as Suppadd7'
      'FROM Supplier, Supplier_Branch, Purch_Ord'
      'WHERE (Supplier.Supplier = Purch_Ord.Supplier) AND'
      '      (Supplier_Branch.Supplier = Purch_Ord.Supplier) AND'
      '      (Supplier_Branch.Branch_No = Purch_Ord.Branch_No) AND'
      '      (Purch_Ord.Purch_Ord_No = :Purch_Ord_No)'
      ''
      ''
      ''
      ''
      ''
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
    Left = 331
    Top = 185
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Purch_Ord_No'
        ParamType = ptUnknown
      end>
    object GetDelFromSuppQuerySuppNam: TStringField
      FieldName = 'SuppNam'
      Size = 40
    end
    object GetDelFromSuppQueryName: TStringField
      FieldName = 'Name'
      Size = 40
    end
    object GetDelFromSuppQueryBuilding_No_Name: TStringField
      FieldName = 'Building_No_Name'
      Size = 40
    end
    object GetDelFromSuppQueryStreet: TStringField
      FieldName = 'Street'
      Size = 40
    end
    object GetDelFromSuppQueryLocale: TStringField
      FieldName = 'Locale'
      Size = 40
    end
    object GetDelFromSuppQueryTown: TStringField
      FieldName = 'Town'
      Size = 40
    end
    object GetDelFromSuppQueryPostCode: TStringField
      FieldName = 'PostCode'
      Size = 10
    end
    object GetDelFromSuppQueryPhone: TStringField
      FieldName = 'Phone'
    end
    object GetDelFromSuppQueryFax_Number: TStringField
      FieldName = 'Fax_Number'
    end
    object GetDelFromSuppQueryemail: TStringField
      FieldName = 'email'
      Size = 40
    end
  end
  object UpdStatusQuery: TFDQuery
    ConnectionName = 'PB'
    MasterSource = GetDetsDataSource
    SQL.Strings = (
      'Update Purch_Ord'
      'Set Purch_Ord_Status = '#39'G'#39
      'Where Purch_Ord_Status = '#39'C'#39' '
      ' ')
    Left = 30
    Top = 14
  end
  object GetDetsQuery: TFDQuery
    ConnectionName = 'PB'
    Left = 96
    Top = 269
  end
  object GetOrdHedQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Purch_Ord'
      'where Purch_Ord = :Purch_Ord')
    Left = 438
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Purch_Ord'
        ParamType = ptUnknown
      end>
  end
  object GetDelFromStoreQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Part_Store.Part_Store_Name as SuppNam,'
      '       Part_Store.Internal_Number_and_Stret as SuppAdd1,'
      '       Part_Store.Internal_District as SuppAdd2,'
      '       Part_Store.Internal_Town as SuppAdd3,'
      '       Part_Store.Internal_PostCode as SuppAdd4,'
      '       Part_Store.Internal_Phone as SuppAdd5,'
      '       Part_Store.Internal_Fax as SuppAdd6,'
      '       '#39#39' as Suppadd7'
      'FROM Part_Store,Purch_Ord'
      'WHERE (Part_Store.Part_Store = Purch_Ord.Part_Store_From) AND'
      '      (Purch_Ord_No.Purch_Ord = :Sel1)'
      ' '
      ' '
      ' ')
    Left = 174
    Top = 203
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sel1'
        ParamType = ptUnknown
      end>
  end
  object GetPFJQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Purch_Ord_Line_Alloc.Parts_For_Job,Parts_For_Job.Job'
      'From Purch_Ord_Line_Alloc, Parts_For_Job, Purch_Ord'
      
        'Where (Purch_ord_Line_Alloc.Parts_For_Job = Parts_For_Job.Parts_' +
        'For_Job) and'
      '  Purch_Ord_Line_Alloc.Purch_Ord_Line_No = :PordLineNo and'
      '  Purch_Ord.Purch_Ord = Purch_Ord_Line_Alloc.Purch_Ord and'
      '  Purch_Ord.Purch_Ord_No = :PurchOrd'
      '  '
      ' '
      ' '
      ' '
      ' ')
    Left = 302
    Top = 102
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PordLineNo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PurchOrd'
        ParamType = ptUnknown
      end>
  end
  object GetDelivAddQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      '')
    Left = 182
    Top = 31
  end
  object GetSODelAddQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select    Sales_Order.Delivery_Contact_Name,'
      '          Customer.Name as DelNam,'
      '          Customer_Branch.Building_no_Name as DelAdd1,'
      '          Customer_Branch.Street as DelAdd2,'
      '          Customer_Branch.Locale as DelAdd3,'
      '          Customer_Branch.Town as DelAdd4,'
      '          Customer_Branch.Postcode as DelAdd5,'
      '          Customer_Branch.Phone as DelAdd6,'
      '          Customer_Branch.Fax_number as DelAdd7,'
      '          Customer_Contact.Name as Contact_Name'
      'from Sales_order, Customer, Customer_Branch, Customer_Contact'
      'where Sales_Order.SAles_Order = :Sales_order and'
      '('
      '(Sales_order.Delivery_Customer = Customer_branch.Customer) and'
      '(Sales_order.Delivery_Branch = Customer_branch.Branch_no)'
      ') and'
      '(Customer_branch.Customer = Customer.Customer) and'
      '('
      '(Customer_Contact.customer = sales_order.customer) and'
      '(Customer_contact.Branch_no = sales_order.branch_no) and'
      '(Customer_contact.contact_no = sales_order.contact_no)'
      ')'
      ' ')
    Left = 534
    Top = 233
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_order'
        ParamType = ptUnknown
      end>
  end
  object CompSRC: TDataSource
    DataSet = GetCompSQL
    Left = 96
    Top = 79
  end
  object GetCompSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select * from Company'
      'Where Company = 1')
    Left = 184
    Top = 78
  end
  object qryExtraCharges: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Purch_Ord_Add_Charge.*,'
      
        '          (Purch_Ord_Add_Charge.Amount + (Purch_Ord_Add_Charge.A' +
        'mount * (Vat_Code.Vat_Rate/100))) as TotalVal'
      'from Purch_Ord_Add_Charge, '
      '        Purch_Ord,'
      '        Vat_Code'
      'Where ((Purch_Ord_Add_Charge.Vat_Code = Vat_Code.Vat_Code) and'
      
        '       (purch_ord.Purch_ord = purch_ord_add_charge.Purch_ord) an' +
        'd'
      '       (Purch_ord.purch_ord_no = :purch_ord_no));'
      '')
    Left = 38
    Top = 138
    ParamData = <
      item
        DataType = ftString
        Name = 'purch_ord_no'
        ParamType = ptUnknown
      end>
  end
  object GetNarrSQL: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select Narrative_Text'
      'From Narrative_Line'
      'Where (Narrative = :Narrative)'
      'Order By Narrative_Line'
      '')
    Left = 526
    Top = 82
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Narrative'
        ParamType = ptUnknown
      end>
  end
  object AddressSRC: TDataSource
    Left = 432
    Top = 292
  end
end
