object STPOrdRepFrm: TSTPOrdRepFrm
  Left = 72
  Top = 95
  Width = 810
  Height = 585
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
  object PurchOrdQuickReport: TQuickRep
    Left = 8
    Top = 0
    Width = 794
    Height = 1123
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    BeforePrint = PurchOrdQuickReportBeforePrint
    DataSet = GetOrdHedQuery
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Times New Roman'
    Font.Style = [fsItalic]
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
    Page.Values = (
      150
      2970
      0
      2100
      0
      0
      0)
    PrinterSettings.Copies = 1
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.OutputBin = Auto
    PrintIfEmpty = True
    SnapToGrid = True
    Units = MM
    Zoom = 100
    object PageHeaderQRBand: TQRBand
      Left = 0
      Top = 0
      Width = 794
      Height = 495
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = PageHeaderQRBandBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      LinkBand = pogroupheader
      Size.Values = (
        1309.6875
        2100.79166666667)
      BandType = rbPageHeader
      object ReprintQRLabel: TQRLabel
        Left = 603
        Top = 160
        Width = 61
        Height = 23
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.8541666666667
          1595.4375
          423.333333333333
          161.395833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Reprint'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 14
      end
      object SAddr1QRLabel: TQRLabel
        Left = 64
        Top = 201
        Width = 321
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.9166666666667
          169.333333333333
          531.8125
          849.3125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Supplier Address'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object SAddr2QRLabel: TQRLabel
        Left = 64
        Top = 221
        Width = 321
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.9166666666667
          169.333333333333
          584.729166666667
          849.3125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Supplier Address'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object SAddr3QRLabel: TQRLabel
        Left = 64
        Top = 241
        Width = 321
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.9166666666667
          169.333333333333
          637.645833333333
          849.3125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Supplier Address'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object SAddr4QRLabel: TQRLabel
        Left = 64
        Top = 261
        Width = 321
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.9166666666667
          169.333333333333
          690.5625
          849.3125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Supplier Address'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object SAddr5QRLabel: TQRLabel
        Left = 64
        Top = 281
        Width = 321
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.9166666666667
          169.333333333333
          743.479166666667
          849.3125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Supplier Address'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object SAddr6QRLabel: TQRLabel
        Left = 64
        Top = 301
        Width = 321
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.9166666666667
          169.333333333333
          796.395833333333
          849.3125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Supplier Address'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRLabel13: TQRLabel
        Left = 56
        Top = 361
        Width = 45
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.2708333333333
          148.166666666667
          955.145833333333
          119.0625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Phone:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object SPhoneQRLabel: TQRLabel
        Left = 104
        Top = 361
        Width = 289
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625
          275.166666666667
          955.145833333334
          764.645833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Phone'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRLabel4: TQRLabel
        Left = 56
        Top = 381
        Width = 32
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.2708333333333
          148.166666666667
          1008.0625
          84.6666666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Fax:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object SFaxQRLabel: TQRLabel
        Left = 104
        Top = 381
        Width = 289
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625
          275.166666666667
          1008.0625
          764.645833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Fax'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object SEmailQRLabel: TQRLabel
        Left = 104
        Top = 401
        Width = 289
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625
          275.166666666667
          1060.97916666667
          764.645833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'E-mail Address'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object SEmailLegQRLabel: TQRLabel
        Left = 56
        Top = 401
        Width = 49
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.2708333333333
          148.166666666667
          1060.97916666667
          129.645833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'E-mail:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRLabel14: TQRLabel
        Left = 464
        Top = 378
        Width = 93
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.9166666666667
          1227.66666666667
          1000.125
          246.0625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Delivery Date'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRLblAcc: TQRLabel
        Left = 580
        Top = 346
        Width = 100
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.5
          1534.58333333333
          915.458333333333
          264.583333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Account No.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRLabel11: TQRLabel
        Left = 464
        Top = 346
        Width = 65
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.9166666666667
          1227.66666666667
          915.458333333333
          171.979166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'A/C Code'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRLabel10: TQRLabel
        Left = 464
        Top = 312
        Width = 61
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.9166666666667
          1227.66666666667
          825.5
          161.395833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Your Ref'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRLabel6: TQRLabel
        Left = 464
        Top = 280
        Width = 33
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.9166666666667
          1227.66666666667
          740.833333333333
          87.3125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Date'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRLabel5: TQRLabel
        Left = 464
        Top = 248
        Width = 55
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.9166666666667
          1227.66666666667
          656.166666666667
          145.520833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Our Ref'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object OrdNumQRLabel: TQRLabel
        Left = 582
        Top = 248
        Width = 97
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375
          1539.875
          656.166666666667
          256.645833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Order Number:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object PurchOrdDateQRLabel: TQRLabel
        Left = 582
        Top = 280
        Width = 89
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.8541666666667
          1539.875
          740.833333333333
          235.479166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Order Date:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object PurchOrdDescrQRLabel: TQRLabel
        Left = 580
        Top = 312
        Width = 133
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.5
          1534.58333333333
          825.5
          351.895833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Purchase Order'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRLabel9: TQRLabel
        Left = 600
        Top = 192
        Width = 115
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.5625
          1587.5
          508
          304.270833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Purchase Order'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 13
      end
      object QRlblDelDt: TQRLabel
        Left = 582
        Top = 378
        Width = 89
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.8541666666667
          1539.875
          1000.125
          235.479166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Del Date'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRLabel12: TQRLabel
        Left = 691
        Top = 470
        Width = 37
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.2708333333333
          1828.27083333333
          1243.54166666667
          97.8958333333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Value'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRLabel7: TQRLabel
        Left = 566
        Top = 470
        Width = 34
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.2708333333333
          1497.54166666667
          1243.54166666667
          89.9583333333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Price'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRLabel8: TQRLabel
        Left = 440
        Top = 470
        Width = 65
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.2708333333333
          1164.16666666667
          1243.54166666667
          171.979166666667)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Pack Size'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object DescQRLabel: TQRLabel
        Left = 200
        Top = 470
        Width = 73
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.2708333333333
          529.166666666667
          1243.54166666667
          193.145833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Description'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object PartQRLabel: TQRLabel
        Left = 114
        Top = 470
        Width = 50
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.2708333333333
          301.625
          1243.54166666667
          132.291666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Product'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object OrdQtyQRLabel: TQRLabel
        Left = 28
        Top = 470
        Width = 65
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.2708333333333
          74.0833333333333
          1243.54166666667
          171.979166666667)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Ordered'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRLabel3: TQRLabel
        Left = 28
        Top = 454
        Width = 65
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.2708333333333
          74.0833333333333
          1201.20833333333
          171.979166666667)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Qty Ordered'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object PreviewQRLabel: TQRLabel
        Left = 43
        Top = 72
        Width = 51
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625
          113.770833333333
          190.5
          134.9375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Preview'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object qrmCompany: TQRMemo
        Left = 529
        Top = 24
        Width = 208
        Height = 121
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          320.145833333333
          1399.64583333333
          63.5
          550.333333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Garamond'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
    end
    object FooterQRBand: TQRBand
      Left = 0
      Top = 553
      Width = 794
      Height = 152
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = FooterQRBandAfterPrint
      AlignToBottom = True
      BeforePrint = FooterQRBandBeforePrint
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsItalic]
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        402.166666666667
        2100.79166666667)
      BandType = rbGroupFooter
      object TotalQRLabel: TQRLabel
        Left = 462
        Top = 96
        Width = 75
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.2708333333333
          1222.375
          254
          198.4375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Order Total'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object OrderValQRLabel: TQRLabel
        Left = 654
        Top = 96
        Width = 76
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625
          1730.375
          254
          201.083333333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'OrderValQRLabel'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRLabel2: TQRLabel
        Left = 32
        Top = 0
        Width = 109
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.9166666666667
          84.6666666666667
          0
          288.395833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Delivery Address'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object DAddr1QRLabel: TQRLabel
        Left = 64
        Top = 25
        Width = 321
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.3333333333333
          169.333333333333
          66.1458333333333
          849.3125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Supplier Address'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object DAddr2QRLabel: TQRLabel
        Left = 64
        Top = 41
        Width = 321
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.3333333333333
          169.333333333333
          108.479166666667
          849.3125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Supplier Address'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object DAddr3QRLabel: TQRLabel
        Left = 64
        Top = 57
        Width = 321
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.3333333333333
          169.333333333333
          150.8125
          849.3125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Supplier Address'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object DAddr4QRLabel: TQRLabel
        Left = 64
        Top = 73
        Width = 321
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.3333333333333
          169.333333333333
          193.145833333333
          849.3125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Supplier Address'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object DAddr5QRLabel: TQRLabel
        Left = 64
        Top = 89
        Width = 321
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.3333333333333
          169.333333333333
          235.479166666667
          849.3125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Supplier Address'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object DAddr6QRLabel: TQRLabel
        Left = 64
        Top = 105
        Width = 321
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.3333333333333
          169.333333333333
          277.8125
          849.3125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Supplier Address'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object pogroupheader: TQRGroup
      Left = 0
      Top = 495
      Width = 794
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = pogroupheaderBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        13.2291666666667
        2100.79166666667)
      Expression = 'GetOrdHedQuery.Sel1'
      FooterBand = FooterQRBand
      Master = PurchOrdQuickReport
      ReprintOnNewPage = True
    end
    object QRSubDetail1: TQRSubDetail
      Left = 0
      Top = 500
      Width = 794
      Height = 27
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
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      LinkBand = FooterQRBand
      ParentFont = False
      Size.Values = (
        71.4375
        2100.79166666667)
      Master = PurchOrdQuickReport
      DataSet = GetDetsQuery
      PrintBefore = False
      PrintIfEmpty = True
      object PackqtyQRLabel: TQRLabel
        Left = 20
        Top = 1
        Width = 65
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.2708333333333
          52.9166666666667
          2.64583333333333
          171.979166666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'PackqtyQRLabel'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object PartCodeQRLabel: TQRLabel
        Left = 114
        Top = 1
        Width = 80
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.2708333333333
          301.625
          2.64583333333333
          211.666666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Product'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object PartDescrQRLabel: TQRLabel
        Left = 200
        Top = 1
        Width = 249
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.2708333333333
          529.166666666667
          2.64583333333333
          658.8125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Description'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object PurchPriceQRLabel: TQRLabel
        Left = 544
        Top = 1
        Width = 57
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.2708333333333
          1439.33333333333
          2.64583333333333
          150.8125)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Purch Price'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object PackSizeQRLabel: TQRLabel
        Left = 436
        Top = 1
        Width = 65
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.2708333333333
          1153.58333333333
          2.64583333333333
          171.979166666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Pack'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRLblValue: TQRLabel
        Left = 674
        Top = 1
        Width = 55
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.2708333333333
          1783.29166666667
          2.64583333333333
          145.520833333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QRLblValue'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
    end
    object QRSubDetail2: TQRSubDetail
      Left = 0
      Top = 527
      Width = 794
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
        68.7916666666667
        2100.79166666667)
      Master = PurchOrdQuickReport
      DataSet = qryExtraCharges
      PrintBefore = False
      PrintIfEmpty = True
      object qrlblDetails: TQRLabel
        Left = 200
        Top = 3
        Width = 75
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625
          529.166666666667
          7.9375
          198.4375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblDetails'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object qrlblExChrgAmount: TQRLabel
        Left = 680
        Top = 3
        Width = 49
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625
          1799.16666666667
          7.9375
          129.645833333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'ExChrg'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
    end
  end
  object GetDetsDataSource: TDataSource
    DataSet = GetOrdHedQuery
    Left = 312
    Top = 19
  end
  object GetOrdDetQuery: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      
        'SELECT Purch_Ord_Line.Quantity_Ordered,Purch_Ord.Purch_Ord_No as' +
        ' OrdNum,'
      
        '       Purch_Ord_Line.Purch_Ord_Line_No,Purch_Ord.Purch_Ord_Date' +
        ','
      
        '       Purch_Ord_Line.Date_Deliv_Expected,Purch_Ord.Purch_Ord_St' +
        'atus,'
      '       Purch_Ord_Line.Purchase_Price,'
      '       Purch_Ord_Line.Quantity_Ordered,'
      '       Purch_Ord_Line.Cost_Price,'
      '       Purch_Ord.Purch_Ord_Descr,'
      
        '       Part.Part, Part.Part_Description, Part.Purch_Pack_Quantit' +
        'y,'
      '       Supplier_Branch.Account_Code,'
      '       Part_Store.Part_Store_Name as DelNam,'
      '       Part_Store.Internal_Number_and_Stret as DelAdd1,'
      '       Part_Store.Internal_District as DelAdd2,'
      '       Part_Store.Internal_Town as DelAdd3,'
      '       Part_Store.Internal_PostCode as DelAdd4,'
      '       Part_Store.Internal_Phone as DelAdd5,'
      '       Part_Store.Internal_Fax as DelAdd6,'
      '       '#39#39' as DelAdd7,'
      '       Purch_Ord.Sales_order'
      
        'FROM Purch_Ord_Line, Purch_Ord, Part, Part_Store, Supplier_Branc' +
        'h'
      'WHERE ((Purch_Ord.Purch_Ord_No = :Sel1) or (:Sel1 = 0)) AND'
      '      (Purch_Ord.Purch_Ord = Purch_Ord_Line.Purch_Ord) AND'
      '      (Part.Part = Purch_Ord_Line.Part) and'
      '      (Part_Store.Part_Store = Purch_Ord.Part_store)  and'
      '      ((Purch_Ord.Supplier = Supplier_Branch.Supplier) and'
      '      (Purch_Ord.Branch_No = Supplier_Branch.Branch_No))'
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
      ' '
      ' '
      ' ')
    Left = 441
    Top = 122
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
  object GetRecOrdQuery: TQuery
    DatabaseName = 'PB'
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
      '       '#39#39' as DelAdd7'
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
    Left = 402
    Top = 102
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
  object GetDelFromSuppQuery: TQuery
    DatabaseName = 'PB'
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
      '      (Purch_Ord.Purch_Ord_No = :Sel1)'
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
        DataType = ftInteger
        Name = 'Sel1'
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
  object UpdStatusQuery: TQuery
    DatabaseName = 'PB'
    DataSource = GetDetsDataSource
    SQL.Strings = (
      'Update Purch_Ord'
      'Set Purch_Ord_Status = '#39'G'#39
      'Where Purch_Ord_Status = '#39'C'#39' '
      ' ')
    Left = 30
    Top = 14
  end
  object GetDetsQuery: TQuery
    DatabaseName = 'PB'
    Left = 96
    Top = 269
  end
  object GetOrdHedQuery: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Sel1, text100'
      'from'
      '  Int_Sel'
      'where'
      '  (Int_Sel_Code = :Int_Sel_Code) and'
      '  (Sel1 <> 0)'
      'order by'
      '  Sel1'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 342
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Int_Sel_Code'
        ParamType = ptUnknown
      end>
  end
  object GetDelFromStoreQuery: TQuery
    DatabaseName = 'PB'
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
  object GetPFJQuery: TQuery
    DatabaseName = 'PB'
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
  object GetDelivAddQuery: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      '')
    Left = 182
    Top = 31
  end
  object GetSODelAddQuery: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Customer.Name as DelNam,'
      '          Customer_Branch.Building_no_Name as DelAdd1,'
      '          Customer_Branch.Street as DelAdd2,'
      '          Customer_Branch.Locale as DelAdd3,'
      '          Customer_Branch.Town as DelAdd4,'
      '          Customer_Branch.Postcode as DelAdd5,'
      '          Customer_Branch.Phone as DelAdd6,'
      '          Customer_Branch.Fax_number as DelAdd7'
      'from Sales_order, Customer, Customer_Branch'
      'where Sales_Order.SAles_Order = :Sales_order and'
      '('
      '(Sales_order.Delivery_Customer = Customer_branch.Customer) and'
      '(Sales_order.Delivery_Branch = Customer_branch.Branch_no)'
      ') and'
      '(Customer_branch.Customer = Customer.Customer)'
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
  object GetCompSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select * from Company'
      'Where Company = 1')
    Left = 184
    Top = 78
  end
  object qryExtraCharges: TQuery
    DatabaseName = 'PB'
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
    Left = 46
    Top = 178
    ParamData = <
      item
        DataType = ftString
        Name = 'purch_ord_no'
        ParamType = ptUnknown
      end>
  end
end
