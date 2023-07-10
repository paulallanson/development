object STPOrdRepFrm: TSTPOrdRepFrm
  Left = -4
  Top = 0
  Width = 1246
  Height = 706
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
    Top = 184
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
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrintIfEmpty = True
    ShowProgress = False
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsMaximized
    object PageHeaderQRBand: TQRBand
      Left = 38
      Top = 38
      Width = 718
      Height = 275
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
        727.604166666666700000
        1899.708333333333000000)
      BandType = rbPageHeader
      object QRShape3: TQRShape
        Left = 16
        Top = 199
        Width = 505
        Height = 39
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          103.187500000000000000
          42.333333333333300000
          526.520833333333000000
          1336.145833333330000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object ReprintQRLabel: TQRLabel
        Left = 643
        Top = 160
        Width = 68
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.854166666666670000
          1701.270833333333000000
          423.333333333333300000
          179.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Reprint'
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
      object ReportTitleQRLabel: TQRLabel
        Left = 16
        Top = 126
        Width = 290
        Height = 30
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375000000000000000
          42.333333333333330000
          333.375000000000000000
          767.291666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'title changes accordingly'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -24
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = False
        FontSize = 18
      end
      object OrdDateQRLabel: TQRLabel
        Left = 14
        Top = 163
        Width = 109
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.854166666666670000
          37.041666666666670000
          431.270833333333300000
          288.395833333333300000)
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
        Left = 134
        Top = 163
        Width = 89
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.854166666666700000
          354.541666666667000000
          431.270833333333000000
          235.479166666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
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
        Top = 208
        Width = 483
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.854166666666700000
          58.208333333333300000
          550.333333333333000000
          1277.937500000000000000)
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
        Left = 14
        Top = 126
        Width = 169
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375000000000000000
          37.041666666666670000
          333.375000000000000000
          447.145833333333300000)
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
      object QRMemoAddress: TQRMemo
        Left = 536
        Top = 4
        Width = 169
        Height = 135
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          357.187500000000000000
          1418.166666666667000000
          10.583333333333330000
          447.145833333333300000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = False
        FontSize = 9
      end
      object ReportImage: TgtQRImage
        Left = 13
        Top = 6
        Width = 255
        Height = 70
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          185.208333333333300000
          34.395833333333330000
          15.875000000000000000
          674.687500000000000000)
        Stretch = True
      end
    end
    object FooterQRBand: TQRBand
      Left = 38
      Top = 633
      Width = 718
      Height = 87
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = FooterQRBandAfterPrint
      AlignToBottom = False
      BeforePrint = FooterQRBandBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        230.187500000000000000
        1899.708333333333000000)
      BandType = rbGroupFooter
      object TotalQRLabel: TQRLabel
        Left = 486
        Top = 32
        Width = 118
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1285.875000000000000000
          84.666666666666680000
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
        Left = 628
        Top = 32
        Width = 76
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          1661.583333333330000000
          84.666666666666700000
          201.083333333333000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'OrderValQRLabel'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object pogroupheader: TQRGroup
      Left = 38
      Top = 313
      Width = 718
      Height = 269
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
        711.729166666666700000
        1899.708333333333000000)
      Expression = 'GetOrdHedQuery.Sel1'
      FooterBand = FooterQRBand
      Master = PurchOrdQuickReport
      ReprintOnNewPage = True
      object QRShape2: TQRShape
        Left = 358
        Top = 32
        Width = 346
        Height = 116
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          306.916666666667000000
          947.208333333333000000
          84.666666666666700000
          915.458333333333000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape1: TQRShape
        Left = 16
        Top = 32
        Width = 337
        Height = 116
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          306.916666666667000000
          42.333333333333300000
          84.666666666666700000
          891.645833333333000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel2: TQRLabel
        Left = 360
        Top = 8
        Width = 84
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          952.500000000000000000
          21.166666666666670000
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
        Left = 14
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
          37.041666666666670000
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
      object QRLabel13: TQRLabel
        Left = 16
        Top = 153
        Width = 46
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          404.812500000000000000
          121.708333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Phone:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel4: TQRLabel
        Left = 16
        Top = 173
        Width = 29
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          457.729166666666700000
          76.729166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Fax:'
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
      object LineQrLabel: TQRLabel
        Left = 8
        Top = 225
        Width = 25
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          595.312500000000000000
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
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object PartQRLabel: TQRLabel
        Left = 50
        Top = 225
        Width = 46
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          132.291666666666700000
          595.312500000000000000
          121.708333333333300000)
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
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object DescQRLabel: TQRLabel
        Left = 152
        Top = 225
        Width = 66
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          402.166666666666600000
          595.312500000000000000
          174.625000000000000000)
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
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel6: TQRLabel
        Left = 360
        Top = 173
        Width = 29
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          952.500000000000000000
          457.729166666666700000
          76.729166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Fax:'
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
      object QRLabel5: TQRLabel
        Left = 360
        Top = 153
        Width = 46
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          952.500000000000000000
          404.812500000000000000
          121.708333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Phone:'
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
      object OrdQtyQRLabel: TQRLabel
        Left = 496
        Top = 225
        Width = 52
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          1312.333333333330000000
          595.312500000000000000
          137.583333333333000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Pack'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object SAddr5QRLabel: TQRLabel
        Left = 24
        Top = 105
        Width = 321
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          63.500000000000000000
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
        Left = 24
        Top = 41
        Width = 321
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          63.500000000000000000
          108.479166666667000000
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
        Left = 24
        Top = 57
        Width = 321
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          63.500000000000000000
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
        Left = 24
        Top = 73
        Width = 321
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          63.500000000000000000
          193.145833333333000000
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
        Left = 24
        Top = 89
        Width = 321
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          63.500000000000000000
          235.479166666667000000
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
        Left = 24
        Top = 121
        Width = 321
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          63.500000000000000000
          320.145833333333000000
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
      object SPhoneQRLabel: TQRLabel
        Left = 64
        Top = 153
        Width = 289
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          169.333333333333000000
          404.812500000000000000
          764.645833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Phone'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object SFaxQRLabel: TQRLabel
        Left = 64
        Top = 173
        Width = 289
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          169.333333333333000000
          457.729166666667000000
          764.645833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Fax'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object SEmailLegQRLabel: TQRLabel
        Left = 16
        Top = 193
        Width = 45
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          42.333333333333340000
          510.645833333333300000
          119.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'E-mail:'
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
      object SEmailQRLabel: TQRLabel
        Left = 64
        Top = 193
        Width = 289
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          169.333333333333000000
          510.645833333333000000
          764.645833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'E-mail Address'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object DAddr1QRLabel: TQRLabel
        Left = 368
        Top = 41
        Width = 321
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          973.666666666667000000
          108.479166666667000000
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
      object DAddr2QRLabel: TQRLabel
        Left = 368
        Top = 57
        Width = 321
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          973.666666666667000000
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
      object DAddr3QRLabel: TQRLabel
        Left = 368
        Top = 73
        Width = 321
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          973.666666666667000000
          193.145833333333000000
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
      object DAddr4QRLabel: TQRLabel
        Left = 368
        Top = 89
        Width = 321
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          973.666666666667000000
          235.479166666667000000
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
      object DAddr5QRLabel: TQRLabel
        Left = 368
        Top = 105
        Width = 321
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          973.666666666667000000
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
      object DAddr6QRLabel: TQRLabel
        Left = 368
        Top = 121
        Width = 321
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          973.666666666667000000
          320.145833333333000000
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
      object DPhoneQRLabel: TQRLabel
        Left = 416
        Top = 153
        Width = 281
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          1100.666666666670000000
          404.812500000000000000
          743.479166666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Phone'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object DFaxQRLabel: TQRLabel
        Left = 416
        Top = 173
        Width = 281
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          1100.666666666670000000
          457.729166666667000000
          743.479166666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Fax'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel3: TQRLabel
        Left = 416
        Top = 241
        Width = 68
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          1100.666666666670000000
          637.645833333333000000
          179.916666666667000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Order Qty'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel7: TQRLabel
        Left = 609
        Top = 243
        Width = 31
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1611.312500000000000000
          642.937500000000000000
          82.020833333333340000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Price'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel8: TQRLabel
        Left = 496
        Top = 241
        Width = 49
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          1312.333333333330000000
          637.645833333333000000
          129.645833333333000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Size'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel12: TQRLabel
        Left = 671
        Top = 243
        Width = 33
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1775.354166666667000000
          642.937500000000000000
          87.312500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Value'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
    end
    object PreviewQRLabel: TQRLabel
      Left = 704
      Top = 232
      Width = 43
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.979166666666670000
        1862.666666666667000000
        613.833333333333300000
        113.770833333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'preview'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
    object QRSubDetail1: TQRSubDetail
      Left = 38
      Top = 582
      Width = 718
      Height = 25
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
      ParentFont = False
      Size.Values = (
        66.145833333333330000
        1899.708333333333000000)
      Master = PurchOrdQuickReport
      DataSet = GetDetsQuery
      PrintBefore = False
      PrintIfEmpty = True
      object PackqtyQRLabel: TQRLabel
        Left = 416
        Top = 1
        Width = 65
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          1100.666666666670000000
          2.645833333333330000
          171.979166666667000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'PackqtyQRLabel'
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
      object POrdLineNoQRLabel: TQRLabel
        Left = 0
        Top = 1
        Width = 33
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          0.000000000000000000
          2.645833333333330000
          87.312500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'LineNo'
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
      object PartCodeQRLabel: TQRLabel
        Left = 50
        Top = 1
        Width = 95
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          132.291666666667000000
          2.645833333333330000
          251.354166666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
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
      object PartDescrQRLabel: TQRLabel
        Left = 152
        Top = 1
        Width = 249
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          402.166666666667000000
          2.645833333333330000
          658.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
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
      object PurchPriceQRLabel: TQRLabel
        Left = 584
        Top = 1
        Width = 57
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          1545.166666666670000000
          2.645833333333330000
          150.812500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Purch Price'
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
      object PackSizeQRLabel: TQRLabel
        Left = 496
        Top = 1
        Width = 49
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          1312.333333333330000000
          2.645833333333330000
          129.645833333333000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Pack'
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
      object QRLblValue: TQRLabel
        Left = 650
        Top = 1
        Width = 55
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          1719.791666666670000000
          2.645833333333330000
          145.520833333333000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QRLblValue'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
    end
    object QRSubDetail2: TQRSubDetail
      Left = 38
      Top = 607
      Width = 718
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
        68.791666666666670000
        1899.708333333333000000)
      Master = PurchOrdQuickReport
      DataSet = qryExtraCharges
      PrintBefore = False
      PrintIfEmpty = True
      object qrlblDetails: TQRLabel
        Left = 152
        Top = 3
        Width = 65
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          402.166666666666600000
          7.937500000000000000
          171.979166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblDetails'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlblExChrgAmount: TQRLabel
        Left = 661
        Top = 3
        Width = 44
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1748.895833333334000000
          7.937500000000000000
          116.416666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'ExChrg'
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
      '       Part_Store.Part_Store_Name as DelNam,'
      '       Part_Store.Internal_Number_and_Stret as DelAdd1,'
      '       Part_Store.Internal_District as DelAdd2,'
      '       Part_Store.Internal_Town as DelAdd3,'
      '       Part_Store.Internal_PostCode as DelAdd4,'
      '       Part_Store.Internal_Phone as DelAdd5,'
      '       Part_Store.Internal_Fax as DelAdd6,'
      '       '#39#39' as DelAdd7,'
      '       Purch_Ord.Sales_order'
      'FROM Purch_Ord_Line, Purch_Ord, Part, Part_Store'
      'WHERE ((Purch_Ord.Purch_Ord_No = :Sel1) or (:Sel1 = 0)) AND'
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
      'select  Sel1,'
      '        text100,'
      '        Purch_Ord.Purch_Ord,'
      '        Supplier.Name as Name,'
      '        Supplier_Branch.Name as Branch_Name,'
      '        Supplier_Branch.Fax_number'
      'from'
      '  Int_Sel, Purch_Ord, Supplier, Supplier_Branch'
      'where'
      '  (Int_Sel_Code = :Int_Sel_Code) and'
      '  (Sel1 <> 0) and'
      '  (Sel1 = Purch_Ord.Purch_Ord_no) and'
      '  ('
      '  (Purch_Ord.Supplier = Supplier_Branch.Supplier) and'
      '  (Purch_Ord.Branch_no = Supplier_Branch.Branch_no)'
      '  ) and'
      '  (Supplier_Branch.Supplier = Supplier.Supplier)'
      'order by'
      '  Sel1'
      ' '
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
