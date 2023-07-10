object PBRPSalesbyProdFrm: TPBRPSalesbyProdFrm
  Left = 6
  Top = 125
  Width = 819
  Height = 537
  Caption = 'PBRPSalesbyProdFrm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object qckrpSalesByProd: TQuickRep
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    BeforePrint = qckrpSalesByProdBeforePrint
    DataSet = qrySalesbyProd
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
      60.000000000000000000
      40.000000000000000000
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
    object repQRGroup: TQRGroup
      Left = 23
      Top = 145
      Width = 756
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = repQRGroupBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        84.666666666666670000
        2000.250000000000000000)
      FooterBand = repQRGroupFooter
      Master = QRSubDetail1
      ReprintOnNewPage = False
      object qrDBGrpText: TQRDBText
        Left = 8
        Top = 8
        Width = 105
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          21.166666666666670000
          277.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qrySalesbyProd
        DataField = 'Customer_Name'
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
    end
    object QRBand1: TQRBand
      Left = 23
      Top = 38
      Width = 756
      Height = 107
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = QRBand1AfterPrint
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        283.104166666666700000
        2000.250000000000000000)
      BandType = rbPageHeader
      object qrlblTitle: TQRLabel
        Left = 219
        Top = 8
        Width = 317
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.854166666666670000
          579.437500000000000000
          21.166666666666670000
          838.729166666666700000)
        Alignment = taCenter
        AlignToBand = True
        AutoSize = True
        AutoStretch = False
        Caption = 'Product Usage Report - Run Date: '
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
      object qrlblDateRange: TQRLabel
        Left = 342
        Top = 32
        Width = 72
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          904.875000000000000000
          84.666666666666670000
          190.500000000000000000)
        Alignment = taCenter
        AlignToBand = True
        AutoSize = True
        AutoStretch = False
        Caption = 'Dated from: '
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel1: TQRLabel
        Left = 8
        Top = 85
        Width = 32
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          224.895833333333300000
          84.666666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Order'
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
      object QRLabel5: TQRLabel
        Left = 56
        Top = 85
        Width = 109
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          148.166666666666700000
          224.895833333333300000
          288.395833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Product Description'
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
      object QRLabel15: TQRLabel
        Left = 281
        Top = 85
        Width = 58
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          743.479166666666700000
          224.895833333333300000
          153.458333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Invoice No'
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
      object QRLabel14: TQRLabel
        Left = 348
        Top = 85
        Width = 69
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          920.750000000000000000
          224.895833333333000000
          182.562500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Date'
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
      object QRLabel20: TQRLabel
        Left = 428
        Top = 85
        Width = 45
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1132.416666666667000000
          224.895833333333300000
          119.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Quantity'
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
      object QRLabel6: TQRLabel
        Tag = 10
        Left = 494
        Top = 85
        Width = 72
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1307.041666666667000000
          224.895833333333300000
          190.500000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Goods Value'
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
      object QRLabel13: TQRLabel
        Left = 608
        Top = 8
        Width = 55
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1608.666666666667000000
          21.166666666666670000
          145.520833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Page No.:'
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
      object QRSysData1: TQRSysData
        Left = 672
        Top = 8
        Width = 45
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1778.000000000000000000
          21.166666666666670000
          119.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FontSize = 9
      end
      object QRLabel9: TQRLabel
        Tag = 10
        Left = 606
        Top = 85
        Width = 27
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1603.375000000000000000
          224.895833333333300000
          71.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Cost'
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
      object QRLabel10: TQRLabel
        Tag = 10
        Left = 674
        Top = 85
        Width = 29
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1783.291666666667000000
          224.895833333333300000
          76.729166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Profit'
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
      object QRLabel11: TQRLabel
        Tag = 10
        Left = 726
        Top = 85
        Width = 12
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1920.875000000000000000
          224.895833333333300000
          31.750000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '%'
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
        Tag = 10
        Left = 718
        Top = 69
        Width = 29
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1899.708333333333000000
          182.562500000000000000
          76.729166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Profit'
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
      Left = 23
      Top = 201
      Width = 756
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = QRSubDetail1AfterPrint
      AlignToBottom = False
      BeforePrint = QRSubDetail1BeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.916666666666670000
        2000.250000000000000000)
      Master = qckrpSalesByProd
      DataSet = qrySalesbyProd
      PrintBefore = False
      PrintIfEmpty = True
      object qrdbtxtPOLine: TQRDBText
        Left = 0
        Top = 0
        Width = 29
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          0.000000000000000000
          76.729166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qrySalesbyProd
        DataField = 'Order'
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
      object QRDBText2: TQRDBText
        Left = 282
        Top = 0
        Width = 52
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          746.125000000000000000
          0.000000000000000000
          137.583333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qrySalesbyProd
        DataField = 'InvoiceRef'
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
      object qrdbtxtInvDate: TQRDBText
        Left = 349
        Top = 0
        Width = 63
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          923.395833333333300000
          0.000000000000000000
          166.687500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qrySalesbyProd
        DataField = 'Invoice_Date'
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
      object QRDBText1: TQRDBText
        Left = 431
        Top = 0
        Width = 41
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1140.354166666667000000
          0.000000000000000000
          108.479166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qrySalesbyProd
        DataField = 'Quantity'
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
      object qrdbtxtGoodsValue: TQRDBText
        Tag = 10
        Left = 504
        Top = 0
        Width = 62
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1333.500000000000000000
          0.000000000000000000
          164.041666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qrySalesbyProd
        DataField = 'Total_Goods'
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
      object QRlblCst: TQRLabel
        Left = 592
        Top = 0
        Width = 42
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1566.333333333333000000
          0.000000000000000000
          111.125000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRlblCst'
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
      object QRLblPrft: TQRLabel
        Left = 651
        Top = 0
        Width = 53
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1722.437500000000000000
          0.000000000000000000
          140.229166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRLblPrft'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLblPerc: TQRLabel
        Left = 725
        Top = 0
        Width = 28
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1918.229166666667000000
          0.000000000000000000
          74.083333333333330000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '%%%'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlblDescription: TQRLabel
        Left = 56
        Top = 0
        Width = 213
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          148.166666666666700000
          0.000000000000000000
          563.562500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Line Description or Form Reference or Part'
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
      object qrlblFormReference: TQRLabel
        Left = 176
        Top = 0
        Width = 89
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          465.666666666666700000
          0.000000000000000000
          235.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Form Reference'
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
    object repQRGroup1: TQRGroup
      Left = 23
      Top = 177
      Width = 756
      Height = 3
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      Enabled = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        7.937500000000000000
        2000.250000000000000000)
      FooterBand = repQRGroup1Footer
      Master = QRSubDetail1
      ReprintOnNewPage = False
    end
    object repQRGroupFooter: TQRBand
      Left = 23
      Top = 287
      Width = 756
      Height = 74
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = repQRGroupFooterAfterPrint
      AlignToBottom = False
      BeforePrint = repQRGroupFooterBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        195.791666666666700000
        2000.250000000000000000)
      BandType = rbGroupFooter
      object qrmmAddChrg: TQRMemo
        Left = 176
        Top = 0
        Width = 70
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          465.666666666666700000
          0.000000000000000000
          185.208333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = True
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
      object qrmmAddChrgPrice: TQRMemo
        Left = 472
        Top = 0
        Width = 94
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1248.833333333333000000
          0.000000000000000000
          248.708333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = True
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
      object QRLabel2: TQRLabel
        Left = 268
        Top = 56
        Width = 94
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          709.083333333333300000
          148.166666666666700000
          248.708333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Customer Totals'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlblGoodsGrpTotal: TQRLabel
        Left = 471
        Top = 53
        Width = 94
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1246.187500000000000000
          140.229166666666700000
          248.708333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblGoodsGrpTotal'
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
      object qrlblAddChrgs: TQRLabel
        Left = 56
        Top = 0
        Width = 108
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          148.166666666666700000
          0.000000000000000000
          285.750000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Additional Charges'
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
        Left = 226
        Top = 24
        Width = 136
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          597.958333333333300000
          63.500000000000000000
          359.833333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Additional Charges Total'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlblAddChrgeTot: TQRLabel
        Left = 480
        Top = 21
        Width = 85
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1270.000000000000000000
          55.562500000000000000
          224.895833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblAddChrgeTot'
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
      object QRLblCstGrpTotal: TQRLabel
        Left = 540
        Top = 53
        Width = 94
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1428.750000000000000000
          140.229166666666700000
          248.708333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblGoodsGrpTotal'
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
      object QRLblPrftGrpTotal: TQRLabel
        Left = 596
        Top = 53
        Width = 109
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1576.916666666667000000
          140.229166666666700000
          288.395833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblGoodsGrpTotal'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLblPercGrpTotal: TQRLabel
        Left = 725
        Top = 53
        Width = 28
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1918.229166666667000000
          140.229166666666700000
          74.083333333333330000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '%%%'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrmmAddChrgCost: TQRMemo
        Left = 543
        Top = 0
        Width = 92
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1436.687500000000000000
          0.000000000000000000
          243.416666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = True
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
      object qrlblAddChrgeCostTot: TQRLabel
        Left = 528
        Top = 21
        Width = 107
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1397.000000000000000000
          55.562500000000000000
          283.104166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblAddChrgeCostTot'
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
      object qrmmAddChrgProfit: TQRMemo
        Left = 609
        Top = 0
        Width = 95
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1611.312500000000000000
          0.000000000000000000
          251.354166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = True
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
      object qrlblAddChrgeProfitTot: TQRLabel
        Left = 594
        Top = 21
        Width = 110
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1571.625000000000000000
          55.562500000000000000
          291.041666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblAddChrgeProfitTot'
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
      object QRShape6: TQRShape
        Left = 392
        Top = 17
        Width = 315
        Height = 5
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          13.229166666666700000
          1037.166666666670000000
          44.979166666666700000
          833.437500000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape2: TQRShape
        Left = 392
        Top = 49
        Width = 315
        Height = 5
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          13.229166666666700000
          1037.166666666670000000
          129.645833333333000000
          833.437500000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
    object repQRGroup1Footer: TQRBand
      Left = 23
      Top = 254
      Width = 756
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = repQRGroup1FooterAfterPrint
      AlignToBottom = False
      BeforePrint = repQRGroup1FooterBeforePrint
      Color = clWhite
      Enabled = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        87.312500000000000000
        2000.250000000000000000)
      BandType = rbGroupFooter
      object QRLabel3: TQRLabel
        Left = 311
        Top = 5
        Width = 81
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          822.854166666666700000
          13.229166666666670000
          214.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Product Totals'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlblQtyTotal: TQRLabel
        Left = 411
        Top = 5
        Width = 61
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1087.437500000000000000
          13.229166666666670000
          161.395833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblQtyTotal'
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
      object qrlblGoodsTotal: TQRLabel
        Left = 490
        Top = 5
        Width = 76
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1296.458333333333000000
          13.229166666666670000
          201.083333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblGoodsTotal'
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
      object QRShape1: TQRShape
        Left = 392
        Top = 1
        Width = 315
        Height = 5
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          13.229166666666700000
          1037.166666666670000000
          2.645833333333330000
          833.437500000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLblCstTotal: TQRLabel
        Left = 557
        Top = 5
        Width = 76
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1473.729166666667000000
          13.229166666666670000
          201.083333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblGoodsTotal'
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
      object QRlblPrftTotal: TQRLabel
        Left = 615
        Top = 5
        Width = 89
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1627.187500000000000000
          13.229166666666670000
          235.479166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblGoodsTotal'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLblPercTotal: TQRLabel
        Left = 725
        Top = 5
        Width = 28
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1918.229166666667000000
          13.229166666666670000
          74.083333333333330000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '%%%'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object repQRGroup2: TQRGroup
      Left = 23
      Top = 180
      Width = 756
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = repQRGroup2BeforePrint
      Color = clWhite
      Enabled = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        55.562500000000000000
        2000.250000000000000000)
      FooterBand = repQRGroup2Footer
      Master = QRSubDetail1
      ReprintOnNewPage = False
      object qrlblCustomerBr: TQRLabel
        Left = 24
        Top = 0
        Width = 48
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          63.500000000000000000
          0.000000000000000000
          127.000000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Branch: '
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
    object repQRGroup2Footer: TQRBand
      Left = 23
      Top = 221
      Width = 756
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = repQRGroup2FooterAfterPrint
      AlignToBottom = False
      BeforePrint = repQRGroup2FooterBeforePrint
      Color = clWhite
      Enabled = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        87.312500000000000000
        2000.250000000000000000)
      BandType = rbGroupFooter
      object QRLabel4: TQRLabel
        Left = 303
        Top = 5
        Width = 76
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          801.687500000000000000
          13.229166666666670000
          201.083333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Branch Totals'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape3: TQRShape
        Left = 392
        Top = -3
        Width = 315
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          1037.166666666670000000
          -7.937500000000000000
          833.437500000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrlblQtyGrp2Total: TQRLabel
        Left = 387
        Top = 6
        Width = 85
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1023.937500000000000000
          15.875000000000000000
          224.895833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblQtyGrp2Total'
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
      object qrlblGoodsGrp2Total: TQRLabel
        Left = 465
        Top = 6
        Width = 100
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1230.312500000000000000
          15.875000000000000000
          264.583333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblGoodsGrp2Total'
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
      object QRLblCstGrp2Total: TQRLabel
        Left = 533
        Top = 6
        Width = 100
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1410.229166666667000000
          15.875000000000000000
          264.583333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblGoodsGrp2Total'
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
      object QRLblPrftGrp2Total: TQRLabel
        Left = 589
        Top = 6
        Width = 115
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1558.395833333333000000
          15.875000000000000000
          304.270833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblGoodsGrp2Total'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLblPercGrp2Total: TQRLabel
        Left = 725
        Top = 6
        Width = 28
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1918.229166666667000000
          15.875000000000000000
          74.083333333333330000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '%%%'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object QRBand2: TQRBand
      Left = 23
      Top = 361
      Width = 756
      Height = 44
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = QRBand2BeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        116.416666666666700000
        2000.250000000000000000)
      BandType = rbSummary
      object QRLabel7: TQRLabel
        Left = 296
        Top = 12
        Width = 70
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          783.166666666666700000
          31.750000000000000000
          185.208333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Report Total'
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
      object QRShape4: TQRShape
        Left = 392
        Top = 0
        Width = 315
        Height = 5
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          13.229166666666700000
          1037.166666666670000000
          0.000000000000000000
          833.437500000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape5: TQRShape
        Left = 392
        Top = 32
        Width = 315
        Height = 5
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          13.229166666666700000
          1037.166666666670000000
          84.666666666666700000
          833.437500000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrlblGoodsRepTotal: TQRLabel
        Left = 451
        Top = 12
        Width = 112
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1193.270833333333000000
          31.750000000000000000
          296.333333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblGoodsRepTotal'
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
      object QRLblCstRepTotal: TQRLabel
        Left = 522
        Top = 12
        Width = 112
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1381.125000000000000000
          31.750000000000000000
          296.333333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblGoodsRepTotal'
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
      object QRLblPrftRepTotal: TQRLabel
        Left = 593
        Top = 12
        Width = 112
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1568.979166666667000000
          31.750000000000000000
          296.333333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblGoodsRepTotal'
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
      object QRLblPercRepTotal: TQRLabel
        Left = 725
        Top = 12
        Width = 28
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1918.229166666667000000
          31.750000000000000000
          74.083333333333330000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '%%%'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
  end
  object qrySalesbyProd: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT  Sales_Invoice_Line.Sales_Invoice,'
      '        Sales_Invoice_Line.Invoice_Line_No,'
      '        Sales_Invoice_Line.Purchase_Order,'
      '        Sales_Invoice_Line.Line,'
      '        Sales_Invoice_Line.Qty_Invoiced,'
      '        Sales_Invoice_Line.Goods_Value,'
      '        Sales_Invoice_Line.Vat_Code,'
      '        Sales_Invoice_Line.Vat_Value,'
      '        Sales_Invoice_Line.Price_Unit,'
      '        Sales_Invoice_Line.sales_Order,'
      '        Sales_Invoice_Line.Sales_Order_Line_no,'
      '        Sales_Invoice_Line.Job_Bag,'
      '        Sales_Invoice_Line.Job_Bag_Line,'
      '        Sales_Invoice_Line.Credit_type,'
      '        Sales_Invoice.Invoice_Date,'
      '        Sales_Invoice.Sales_Invoice_No,'
      '        Sales_Invoice.Customer,'
      '        Sales_Invoice.Branch_no,'
      '        Sales_Invoice.Inv_to_Customer,'
      '        Sales_Invoice.Inv_to_Branch,'
      '        Sales_Invoice.Invoice_Or_Credit,'
      '        Sales_Invoice.Sales_Invoice_Type,'
      '        Sales_Invoice.Reference,'
      '        Customer.Name as Customer_Name,'
      '        Customer_Branch.Name as Branch_Name,'
      '        Purchase_OrderLine.Customers_Desc as Description,'
      '        Price_Unit.Price_Unit_Factor'
      'FROM Price_Unit'
      '  INNER JOIN (Purchase_OrderLine'
      '  INNER JOIN (Customer'
      '  INNER JOIN (Customer_Branch'
      '  INNER JOIN (Sales_Invoice'
      '  INNER JOIN Sales_Invoice_Line ON'
      
        '    Sales_Invoice.Sales_Invoice = Sales_Invoice_Line.Sales_Invoi' +
        'ce) ON'
      '    (Customer_Branch.Branch_no = Sales_Invoice.Branch_no) AND'
      '    (Customer_Branch.Customer = Sales_Invoice.Customer)) ON'
      '    Customer.Customer = Customer_Branch.Customer) ON'
      '    (Purchase_OrderLine.Line = Sales_Invoice_Line.Line) AND'
      
        '    (Purchase_OrderLine.Purchase_Order = Sales_Invoice_Line.Purc' +
        'hase_Order)) ON'
      '    Price_Unit.Price_Unit = Sales_Invoice_Line.Price_Unit'
      ' '
      ' '
      ' ')
    Left = 88
    Top = 48
    object qrySalesbyProdSales_Invoice: TIntegerField
      FieldName = 'Sales_Invoice'
    end
    object qrySalesbyProdInvoice_Line_No: TIntegerField
      FieldName = 'Invoice_Line_No'
    end
    object qrySalesbyProdPurchase_Order: TFloatField
      FieldName = 'Purchase_Order'
    end
    object qrySalesbyProdLine: TIntegerField
      FieldName = 'Line'
    end
    object qrySalesbyProdQty_Invoiced: TFloatField
      FieldName = 'Qty_Invoiced'
    end
    object qrySalesbyProdGoods_Value: TFloatField
      FieldName = 'Goods_Value'
    end
    object qrySalesbyProdVat_Code: TIntegerField
      FieldName = 'Vat_Code'
    end
    object qrySalesbyProdVat_Value: TFloatField
      FieldName = 'Vat_Value'
    end
    object qrySalesbyProdPrice_Unit: TIntegerField
      FieldName = 'Price_Unit'
    end
    object qrySalesbyProdsales_Order: TIntegerField
      FieldName = 'sales_Order'
    end
    object qrySalesbyProdSales_Order_Line_no: TIntegerField
      FieldName = 'Sales_Order_Line_no'
    end
    object qrySalesbyProdJob_Bag: TIntegerField
      FieldName = 'Job_Bag'
    end
    object qrySalesbyProdJob_Bag_Line: TIntegerField
      FieldName = 'Job_Bag_Line'
    end
    object qrySalesbyProdCredit_type: TStringField
      FieldName = 'Credit_type'
      FixedChar = True
      Size = 2
    end
    object qrySalesbyProdInvoice_Date: TDateTimeField
      FieldName = 'Invoice_Date'
    end
    object qrySalesbyProdSales_Invoice_No: TStringField
      FieldName = 'Sales_Invoice_No'
      FixedChar = True
      Size = 30
    end
    object qrySalesbyProdCustomer: TIntegerField
      FieldName = 'Customer'
    end
    object qrySalesbyProdBranch_no: TIntegerField
      FieldName = 'Branch_no'
    end
    object qrySalesbyProdInv_to_Customer: TIntegerField
      FieldName = 'Inv_to_Customer'
    end
    object qrySalesbyProdInv_to_Branch: TIntegerField
      FieldName = 'Inv_to_Branch'
    end
    object qrySalesbyProdCustomer_Name: TStringField
      FieldName = 'Customer_Name'
      FixedChar = True
      Size = 80
    end
    object qrySalesbyProdBranch_Name: TStringField
      FieldName = 'Branch_Name'
      FixedChar = True
      Size = 80
    end
    object qrySalesbyProdDescription: TStringField
      FieldName = 'Description'
      FixedChar = True
      Size = 80
    end
    object qrySalesbyProdPrice_Unit_Factor: TFloatField
      FieldName = 'Price_Unit_Factor'
    end
    object qrySalesbyProdQuantity: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Quantity'
      OnGetText = qrySalesbyProdQuantityGetText
      Calculated = True
    end
    object qrySalesbyProdTotal_Goods: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'Total_Goods'
      OnGetText = qrySalesbyProdTotal_GoodsGetText
      Calculated = True
    end
    object qrySalesbyProdInvoiceRef: TStringField
      FieldKind = fkCalculated
      FieldName = 'InvoiceRef'
      OnGetText = qrySalesbyProdInvoiceRefGetText
      Calculated = True
    end
    object qrySalesbyProdOrder: TStringField
      FieldKind = fkCalculated
      FieldName = 'Order'
      OnGetText = qrySalesbyProdOrderGetText
      Calculated = True
    end
    object qrySalesbyProdInvoice_Or_Credit: TStringField
      FieldName = 'Invoice_Or_Credit'
      FixedChar = True
      Size = 2
    end
    object qrySalesbyProdSales_Invoice_Type: TStringField
      FieldName = 'Sales_Invoice_Type'
      FixedChar = True
      Size = 2
    end
    object qrySalesbyProdReference: TStringField
      FieldName = 'Reference'
      FixedChar = True
      Size = 120
    end
  end
  object qryInvAddChrgs: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select sales_invoice_add_charge.details,'
      ' sum(sales_invoice_add_charge.amount) as amount, '
      ' sum(sales_invoice_add_charge.Cost_Price) as Cost_Price'
      'from sales_invoice_add_charge inner join '
      'sales_invoice on (sales_invoice_add_charge.sales_invoice ='
      '                 sales_invoice.sales_invoice)'
      'group by sales_invoice_add_charge.details')
    Left = 135
    Top = 22
    object qryInvAddChrgsdetails: TStringField
      FieldName = 'details'
      FixedChar = True
      Size = 255
    end
    object qryInvAddChrgsamount: TCurrencyField
      FieldName = 'amount'
    end
    object qryInvAddChrgsCost_Price: TFloatField
      FieldName = 'Cost_Price'
    end
  end
  object qryInvAddChrgsbyInvCust: TQuery
    SQL.Strings = (
      'select sales_invoice_add_charge.details,'
      ' sum(sales_invoice_add_charge.amount) as amount, '
      ' sum(sales_invoice_add_charge.Cost_Price) as Cost_Price'
      'from sales_invoice_add_charge inner join '
      
        'sales_invoice on (sales_invoice_add_charge.sales_invoice = sales' +
        '_invoice.sales_invoice) '
      'where sales_invoice.inv_to_customer = :customer'
      'and sales_invoice.invoice_date >= :dateFrom'
      'and sales_invoice.invoice_date <= :dateTo'
      
        'and ((sales_invoice.inactive is NULL) or (sales_invoice.inactive' +
        ' = '#39'N'#39'))'
      'group by sales_invoice_add_charge.details '
      ' '
      ' '
      ' ')
    Left = 207
    Top = 46
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dateFrom'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dateTo'
        ParamType = ptUnknown
      end>
  end
  object qryInvAddChrgsbyOrdCust: TQuery
    SQL.Strings = (
      'select sales_invoice_add_charge.details,'
      ' sum(sales_invoice_add_charge.amount) as amount, '
      ' sum(sales_invoice_add_charge.Cost_Price) as Cost_Price '
      'from sales_invoice_add_charge inner join'
      
        'sales_invoice on (sales_invoice_add_charge.sales_invoice = sales' +
        '_invoice.sales_invoice)  '
      'where sales_invoice.customer = :customer'
      'and sales_invoice.invoice_date >= :dateFrom'
      'and sales_invoice.invoice_date <= :dateTo'
      
        'and ((sales_invoice.inactive is NULL) or (sales_invoice.inactive' +
        ' = '#39'N'#39'))'
      'group by sales_invoice_add_charge.details '
      ' '
      ' ')
    Left = 207
    Top = 94
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dateFrom'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dateTo'
        ParamType = ptUnknown
      end>
  end
  object GetCostsQuery: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      
        'SELECT Sales_Invoice_Line.Qty_Invoiced, Purchase_OrderLine.Order' +
        '_Price,'
      
        '      Purchase_OrderLine.Quantity, Price_Unit.Price_Unit_Factor ' +
        'as Order_Unit_Factor,'
      '      Form_reference.form_reference_id, form_reference_descr'
      'FROM (Price_Unit'
      '  INNER JOIN (Purchase_OrderLine'
      '  INNER JOIN (Sales_Invoice'
      
        '  INNER JOIN Sales_Invoice_Line ON Sales_Invoice.Sales_Invoice =' +
        ' Sales_Invoice_Line.Sales_Invoice)'
      
        '  ON (Purchase_OrderLine.Line = Sales_Invoice_Line.Line) AND (Pu' +
        'rchase_OrderLine.Purchase_Order = Sales_Invoice_Line.Purchase_Or' +
        'der))'
      '  ON (Price_Unit.Price_Unit = Purchase_OrderLine.Order_Unit))'
      
        '  left join form_reference on (purchase_orderline.form_reference' +
        ' = form_reference.form_reference)'
      
        'WHERE (((Sales_Invoice.Sales_Invoice)=:Invoice_No) and (Invoice_' +
        'Line_No = :Line_No));'
      '')
    Left = 320
    Top = 24
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'invoice_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line_No'
        ParamType = ptUnknown
      end>
  end
  object qryAddPOCosts: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select sum(Amount) as Total_Cost'
      'from Purch_Ord_add_charge'
      '  where (Purch_Ord_Add_Charge.Purch_Ord = :Purch_Ord) '
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 320
    Top = 94
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Purch_Ord'
        ParamType = ptUnknown
      end>
  end
  object qryGetSOCosts: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      
        'select sum(Part_Cost*((Quantity_Invoiced*1.0000)/(Purch_Pack_Qua' +
        'ntity*1.0000))) as Total_Cost'
      'from Sales_Order_Line'
      'where Sales_Order = :Sales_Order  and'
      '    (Sales_Order_Line_No = :Sales_Order_Line)'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 320
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Order_Line'
        ParamType = ptUnknown
      end>
  end
  object AddCostsQuery: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select sum(Amount) as Add_Cost'
      'from Purch_Ord_line_add_chg'
      '  where (Purch_Ord_Line_Add_Chg.Purchase_Order = :PurchOrder)'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 248
    Top = 6
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PurchOrder'
        ParamType = ptUnknown
      end>
  end
  object qryGetPOCosts: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select'
      'Purch_Ord.Purch_Ord, Purch_Ord.Purch_ord_no, Supplier.Name,'
      
        'sum((Sales_Invoice_Line.Qty_Invoiced/Purch_ord_Line.Purch_Pack_Q' +
        'uantity)*Purchase_Price) as Total_Cost'
      
        'from Sales_invoice_line, Sales_order, Purch_Ord, Purch_Ord_Line,' +
        ' supplier'
      'where'
      '(Sales_Invoice_Line.Sales_invoice = :Sales_Invoice) and'
      '(Sales_Invoice_Line.Invoice_Line_No = :Line_No) and'
      '(Sales_Invoice_Line.Sales_order = Sales_Order.Sales_order) and'
      '(Sales_Order.Sales_Order = Purch_Ord.Sales_order) and'
      '('
      '(Purch_ord_Line.Purch_ord = Purch_Ord.Purch_ord) and'
      
        '(Purch_ord_Line.Purch_ord_Line_no = Sales_Invoice_Line.Sales_ord' +
        'er_Line_no)'
      ') and'
      '(Purch_Ord.Supplier = Supplier.Supplier)'
      'Group By'
      'Purch_Ord.Purch_Ord, Purch_Ord.Purch_Ord_no, Supplier.Name'
      ' '
      ' '
      ' '
      ' ')
    Left = 392
    Top = 48
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Invoice'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line_No'
        ParamType = ptUnknown
      end>
  end
  object qryGetJBCosts: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT  Sales_Invoice_Line.Sales_Invoice,'
      '        Sales_Invoice_Line.Invoice_Line_No,'
      '        Sales_Invoice_Line.Purchase_Order,'
      '        Sales_Invoice_Line.Line,'
      '        Sales_invoice_Line.Qty_Invoiced,'
      '        Sales_Invoice_Line.Job_Bag,'
      '        Sales_Invoice_Line.Job_Bag_Line,'
      '        Job_Bag_Line_Dets.Job_Bag_Line_Cost,'
      '        Purchase_OrderLine.Order_Price,'
      '        Purchase_OrderLine.Order_Unit,'
      '        Purchase_OrderLine.Quantity,'
      '        Price_Unit.Price_Unit_Factor,'
      '        (select Sum(Amount)'
      '         from Purch_ord_line_Add_Chg'
      
        '         where Purch_Ord_Line_Add_Chg.Purchase_order = Sales_Inv' +
        'oice_Line.Purchase_Order and'
      
        '               Purch_Ord_Line_Add_Chg.Line = Sales_Invoice_Line.' +
        'Line) as Extra_Cost,'
      '        form_reference.form_reference_id,'
      '        form_reference.form_reference_descr'
      'FROM Form_Reference'
      '     RIGHT JOIN (Price_Unit'
      '     RIGHT JOIN (Purchase_OrderLine'
      '     RIGHT JOIN (Job_Bag_Line_Dets'
      '     INNER JOIN Sales_Invoice_Line ON'
      
        '        (Job_Bag_Line_Dets.Job_Bag_Line = Sales_Invoice_Line.Job' +
        '_Bag_Line) AND'
      
        '        (Job_Bag_Line_Dets.Job_Bag = Sales_Invoice_Line.Job_Bag)' +
        ') ON'
      '        (Purchase_OrderLine.Line = Job_Bag_Line_Dets.Line) AND'
      
        '        (Purchase_OrderLine.Purchase_Order = Job_Bag_Line_Dets.P' +
        'urchase_Order)) ON'
      '        Price_Unit.Price_Unit = Purchase_OrderLine.Order_Unit)'
      
        '        ON (Purchase_OrderLine.Form_Reference = Form_Reference.F' +
        'orm_Reference)'
      'WHERE (Sales_Invoice = :Sales_Invoice) and'
      '  (Sales_Invoice_Line.Invoice_Line_No = :line_No)'
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 40
    Top = 280
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Invoice'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'line_No'
        ParamType = ptUnknown
      end>
  end
  object qryCreditLines: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT  Sales_Invoice_Line.Sales_Invoice,'
      '        Sales_Invoice_Line.Invoice_Line_No,'
      '        Sales_Invoice_Line.Qty_Invoiced,'
      '        Sales_Invoice_Line.Price_Unit,'
      '        Price_Unit.Price_Unit_Factor,'
      '        Sales_Invoice_Line.Cost_Price,'
      '        Sales_Invoice_Line.purchase_order,'
      '        Sales_Invoice_Line.Line,'
      '        Sales_Invoice_Line.Job_Bag,'
      '        Sales_Invoice_Line.Job_Bag_Line,'
      '        Sales_Invoice_Line.Sales_Order,'
      '        Sales_Invoice_Line.Sales_Order_line_no'
      'FROM  Price_Unit'
      '      INNER JOIN Sales_Invoice_Line'
      
        '        ON (Price_Unit.Price_Unit = Sales_Invoice_Line.Price_Uni' +
        't)'
      'WHERE (Sales_invoice_Line.Sales_invoice = :Sales_invoice) and'
      '(Sales_Invoice_Line.Invoice_Line_No = :Line_No)'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 182
    Top = 158
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_invoice'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line_No'
        ParamType = ptUnknown
      end>
  end
  object qryPOLineFormRef: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select form_reference.form_reference_id,'
      ' form_reference.form_reference_descr'
      'from purchase_orderline'
      '  left join form_reference'
      
        '    on (purchase_orderline.form_reference = form_reference.form_' +
        'reference)'
      'where purchase_orderline.purchase_order = :purchase_order'
      ' and purchase_orderline.line = :line;')
    Left = 36
    Top = 428
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'purchase_order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'line'
        ParamType = ptUnknown
      end>
  end
  object qryJBLineFormRef: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select form_reference.form_reference_id,'
      ' form_reference.form_reference_descr'
      'from (job_bag_line_dets'
      '  left join purchase_orderline'
      
        '    on ((job_bag_line_dets.purchase_order = purchase_orderline.p' +
        'urchase_order)'
      '       and (job_bag_line_dets.line = purchase_orderline.line)))'
      '  left join form_reference'
      
        '    on (purchase_orderline.form_reference = form_reference.form_' +
        'reference)'
      'where job_bag_line_dets.job_bag = :job_bag'
      ' and job_bag_line_dets.line = :line;')
    Left = 116
    Top = 428
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'job_bag'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'line'
        ParamType = ptUnknown
      end>
  end
  object qrySOLinePart: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select part.part,'
      '  part.part_description'
      'from sales_order_line'
      '  inner join part'
      '    on sales_order_line.part = part.part '
      'where sales_order_line.sales_order = :sales_order'
      '  and sales_order_line.line = :line;'
      ' ')
    Left = 80
    Top = 428
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'sales_order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'line'
        ParamType = ptUnknown
      end>
  end
  object qryGetPO: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select  Purchase_OrderLine.Purchase_Order,'
      '        Purchase_OrderLine.Line,'
      '        Purchase_OrderLine.Contact_no,'
      '        Customer_Contact.Name as Contact_Name,'
      '        Purchase_OrderLine.Cust_Order_No,'
      '        Purchase_Order.Date_Point as Start_Date,'
      '        (select top 1 Delivery_Detail.Date_Deliv_Actual'
      '         from Delivery_Detail'
      '         where'
      
        '            Delivery_Detail.Purchase_Order = Purchase_OrderLine.' +
        'Purchase_Order and'
      '            Delivery_Detail.Line = Purchase_OrderLine.Line and'
      
        '            Delivery_Detail.Qty_Delivered <> 0) as Date_Deliv_Ac' +
        'tual,'
      '        (select top 1 Proof_Date'
      '         from Proof_History, Proof_Status'
      
        '         where Proof_History.purchase_order= purchase_orderline.' +
        'purchase_order and'
      '                Proof_History.line = purchase_orderline.line AND'
      
        '                Proof_History.Proof_Status = Proof_Status.Proof_' +
        'Status AND'
      '                Proof_Status.Proof_Approved = '#39'Y'#39
      '         order by Proof_History Desc) AS Date_Approved'
      'from Purchase_OrderLine, Customer_Contact, Purchase_Order'
      'where Purchase_OrderLine.Purchase_Order = :Purchase_Order and'
      'Purchase_OrderLine.Line = :Line and'
      
        'Purchase_OrderLine.Purchase_Order = Purchase_Order.Purchase_Orde' +
        'r and'
      'Purchase_OrderLine.Customer = Customer_Contact.Customer and'
      'Purchase_OrderLine.Branch_no = Customer_Contact.Branch_no and'
      'Purchase_OrderLine.Contact_No = Customer_Contact.Contact_no')
    Left = 495
    Top = 46
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end>
  end
  object qryGetJB: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select  Job_Bag.Job_Bag,'
      '        Job_Bag.Contact_no,'
      '        Customer_Contact.Name as Contact_Name,'
      '        Job_Bag.Cust_Order_No,'
      '        Job_Bag.Date_Start as Start_Date,'
      '        Job_Bag.Goods_Required as Date_Deliv_Actual'
      'from Job_Bag, Customer_Contact'
      'where Job_Bag = :Job_Bag and'
      'Job_Bag.Customer = Customer_Contact.Customer and'
      'Job_Bag.Branch_no = Customer_Contact.Branch_no and'
      'Job_Bag.Contact_No = Customer_Contact.Contact_no')
    Left = 559
    Top = 46
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end>
  end
  object qryGetSO: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select  Sales_Order.Sales_Order,'
      '        Sales_Order.Contact_no,'
      '        Customer_Contact.Name as Contact_Name,'
      '        Sales_Order.Cust_Order_No,'
      '        Sales_Order.Date_Ordered as Start_Date,'
      '        (select top 1 Date_Picked'
      '         from Sales_Order_Delivery'
      '         where'
      
        '            Sales_Order_Delivery.Sales_Order = Sales_Order.Sales' +
        '_Order) as Date_Deliv_Actual'
      'from Sales_Order, Customer_Contact'
      'where Sales_Order = :Sales_Order and'
      'Sales_Order.Customer = Customer_Contact.Customer and'
      'Sales_Order.Branch_no = Customer_Contact.Branch_no and'
      'Sales_Order.Contact_No = Customer_Contact.Contact_no')
    Left = 623
    Top = 46
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end>
  end
end
