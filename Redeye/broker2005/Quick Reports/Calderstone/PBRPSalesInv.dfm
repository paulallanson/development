object PBRPSalesInvFrm: TPBRPSalesInvFrm
  Left = 234
  Top = 100
  Width = 1132
  Height = 751
  HorzScrollBar.Range = 1200
  VertScrollBar.Position = 108
  VertScrollBar.Range = 2000
  AutoScroll = False
  Caption = 'PBRPSalesInvFrm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -7
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = True
  Scaled = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 7
  object InvoiceReport: TQuickRep
    Left = 24
    Top = -4
    Width = 794
    Height = 1123
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    BeforePrint = InvoiceReportBeforePrint
    DataSet = InvOneHeadSQL
    Font.Charset = ANSI_CHARSET
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
    OnNeedData = InvoiceReportNeedData
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Values = (
      0.000000000000000000
      2970.000000000000000000
      0.000000000000000000
      2100.000000000000000000
      50.000000000000000000
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
    ReportTitle = 'Sales Invoice'
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsMaximized
    object gtQRShape3: TgtQRShape
      Left = 27
      Top = 416
      Width = 750
      Height = 432
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        1143.000000000000000000
        71.437500000000000000
        1100.666666666667000000
        1984.375000000000000000)
      Brush.Style = bsClear
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object InvoiceFooter: TQRBand
      Left = 19
      Top = 505
      Width = 775
      Height = 3
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = InvoiceFooterAfterPrint
      AlignToBottom = False
      BeforePrint = InvoiceFooterBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        7.937500000000000000
        2050.520833333333000000)
      BandType = rbGroupFooter
    end
    object InvoiceGroupHeader: TQRGroup
      Left = 19
      Top = 425
      Width = 775
      Height = 3
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = InvoiceGroupHeaderBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        7.937500000000000000
        2050.520833333333000000)
      FooterBand = InvoiceFooter
      Master = InvoiceReport
      ReprintOnNewPage = False
    end
    object InvoiceHeader: TQRSubDetail
      Left = 19
      Top = 428
      Width = 775
      Height = 4
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
        10.583333333333330000
        2050.520833333333000000)
      Master = InvoiceReport
      PrintBefore = False
      PrintIfEmpty = True
    end
    object InvoiceLine: TQRSubDetail
      Left = 19
      Top = 432
      Width = 775
      Height = 25
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = InvoiceLineAfterPrint
      AlignToBottom = False
      BeforePrint = InvoiceLineBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        66.145833333333330000
        2050.520833333333000000)
      Master = InvoiceReport
      DataSet = InvLineSQL
      PrintBefore = False
      PrintIfEmpty = True
      object Dummy06: TgtQRLabel
        Left = 525
        Top = 0
        Width = 59
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1389.062500000000000000
          0.000000000000000000
          156.104166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NNNN.NN'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object Dummy05: TgtQRLabel
        Left = 120
        Top = 0
        Width = 226
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          317.500000000000000000
          0.000000000000000000
          597.958333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'AAAAAAAAAAAAAAAAAAAAAAAAA'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object Dummy03: TgtQRLabel
        Left = 8
        Top = 0
        Width = 73
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          21.166666666666670000
          0.000000000000000000
          193.145833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NNNNNNNN'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object GoodsTotalLbl: TgtQRLabel
        Left = 574
        Top = 0
        Width = 88
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333300000
          1518.708333333330000000
          0.000000000000000000
          232.833333333333000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'GoodsTotalLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Formata'
        Font.Style = []
        OnPrint = GoodsTotalLblPrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object GoodsLbl: TgtQRLabel
        Left = 530
        Top = 0
        Width = 56
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1402.291666666667000000
          0.000000000000000000
          148.166666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'GoodsLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Formata'
        Font.Style = []
        OnPrint = GoodsLblPrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QtyInvoicedLbl: TgtQRLabel
        Left = -6
        Top = 0
        Width = 85
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          -15.875000000000000000
          0.000000000000000000
          224.895833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QtyInvoicedLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Formata'
        Font.Style = []
        OnPrint = QtyInvoicedLblPrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object GoodsVatLbl: TgtQRLabel
        Left = 654
        Top = 0
        Width = 76
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1730.375000000000000000
          0.000000000000000000
          201.083333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'GoodsVatLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Formata'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lblDescription: TgtQRLabel
        Left = 104
        Top = 0
        Width = 329
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          275.166666666666700000
          0.000000000000000000
          870.479166666666800000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'lblDescription'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Formata'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lblPriceUnit: TgtQRLabel
        Left = 435
        Top = 0
        Width = 67
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1150.937500000000000000
          0.000000000000000000
          177.270833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'lblPriceUnit'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Formata'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object chldbndFormRef: TQRChildBand
      Left = 19
      Top = 457
      Width = 775
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      LinkBand = InvoiceLine
      Size.Values = (
        63.500000000000000000
        2050.520833333333000000)
      ParentBand = InvoiceLine
      object lblFormRef: TgtQRLabel
        Left = 104
        Top = 1
        Width = 329
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          275.166666666666700000
          2.645833333333333000
          870.479166666666800000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'lblFormRef'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Formata'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QRBand1: TQRBand
      Left = 19
      Top = 0
      Width = 775
      Height = 425
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = QRBand1BeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        1124.479166666667000000
        2050.520833333333000000)
      BandType = rbPageHeader
      object qrHeadersShape: TgtQRShape
        Tag = 1
        Left = 8
        Top = 387
        Width = 750
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = True
        Frame.DrawBottom = False
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          79.375000000000000000
          21.166666666666670000
          1023.937500000000000000
          1984.375000000000000000)
        Brush.Color = 14996452
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape1: TgtQRShape
        Left = 8
        Top = 216
        Width = 353
        Height = 128
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          338.666666666666700000
          21.166666666666670000
          571.500000000000000000
          933.979166666666600000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape2: TgtQRShape
        Left = 472
        Top = 216
        Width = 286
        Height = 128
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          338.666666666666700000
          1248.833333333333000000
          571.500000000000000000
          756.708333333333400000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object InvoiceNumberLbl: TgtQRLabel
        Left = 599
        Top = 225
        Width = 110
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1584.854166666667000000
          595.312500000000000000
          291.041666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'InvoiceNumberLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Formata'
        Font.Style = []
        OnPrint = InvoiceNumberLblPrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object InvoiceDateLbl: TgtQRLabel
        Left = 599
        Top = 257
        Width = 84
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1584.854166666667000000
          679.979166666666700000
          222.250000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'InvoiceDateLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Formata'
        Font.Style = []
        OnPrint = InvoiceDateLblPrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object OurJobLbl: TgtQRLabel
        Left = 599
        Top = 289
        Width = 59
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1584.854166666667000000
          764.645833333333300000
          156.104166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'OurJobLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Formata'
        Font.Style = []
        OnPrint = OurJobLblPrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lblCustOrderNo: TgtQRLabel
        Left = 599
        Top = 321
        Width = 154
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1584.854166666667000000
          849.312500000000000000
          407.458333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'lblCustOrderNo'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Formata'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object CustAccount: TgtQRDBText
        Left = 628
        Top = 358
        Width = 86
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1661.583333333333000000
          947.208333333333300000
          227.541666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = CustomerSQL
        DataField = 'Account_Code'
        OnPrint = CustAccountPrint
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel10: TgtQRLabel
        Left = 536
        Top = 358
        Width = 77
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1418.166666666667000000
          947.208333333333300000
          203.729166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Account No.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object CustomerAddMemo: TgtQRMemo
        Left = 64
        Top = 233
        Width = 289
        Height = 106
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          280.458333333333400000
          169.333333333333300000
          616.479166666666800000
          764.645833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Formata'
        Font.Style = []
        Lines.Strings = (
          'Invoice To XXXXXXXXXXXXXXXXXXXXX'
          'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
          'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
          'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
          'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
          'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
          ' ')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlblQuantity: TgtQRLabel
        Tag = 1
        Left = 32
        Top = 393
        Width = 48
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          84.666666666666670000
          1039.812500000000000000
          127.000000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Quantity'
        Color = 14996452
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Formata'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object qrlblDescription: TgtQRLabel
        Tag = 1
        Left = 104
        Top = 393
        Width = 66
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          275.166666666666700000
          1039.812500000000000000
          174.625000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Description'
        Color = 14996452
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Formata'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object qrlblUniTSize: TgtQRLabel
        Tag = 1
        Left = 444
        Top = 393
        Width = 50
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1174.750000000000000000
          1039.812500000000000000
          132.291666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Unit Size'
        Color = 14996452
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Formata'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object qrlblUnitPrice: TgtQRLabel
        Tag = 1
        Left = 522
        Top = 393
        Width = 56
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1381.125000000000000000
          1039.812500000000000000
          148.166666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Unit Price'
        Color = 14996452
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Formata'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object qrlblValue: TgtQRLabel
        Tag = 1
        Left = 624
        Top = 393
        Width = 33
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1651.000000000000000000
          1039.812500000000000000
          87.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Value'
        Color = 14996452
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Formata'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object qrlblVat: TgtQRLabel
        Tag = 1
        Left = 704
        Top = 393
        Width = 24
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1862.666666666667000000
          1039.812500000000000000
          63.500000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'VAT'
        Color = 14996452
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Formata'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object imgReport: TgtQRImage
        Left = 54
        Top = 33
        Width = 633
        Height = 136
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          359.833333333333400000
          142.875000000000000000
          87.312500000000000000
          1674.812500000000000000)
        Stretch = True
      end
      object QRLabel3: TgtQRLabel
        Tag = 2
        Left = 9
        Top = 179
        Width = 142
        Height = 31
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          82.020833333333330000
          23.812500000000000000
          473.604166666666700000
          375.708333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Sales Invoice'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Formata'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 18
      end
      object qrHeadShape: TgtQRShape
        Tag = 1
        Left = 472
        Top = 216
        Width = 121
        Height = 128
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          338.666666666666700000
          1248.833333333333000000
          571.500000000000000000
          320.145833333333300000)
        Brush.Color = 14996452
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape13: TgtQRShape
        Left = 472
        Top = 248
        Width = 286
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          1248.833333333333000000
          656.166666666666800000
          756.708333333333400000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape14: TgtQRShape
        Left = 472
        Top = 278
        Width = 286
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          1248.833333333333000000
          735.541666666666800000
          756.708333333333400000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape15: TgtQRShape
        Left = 472
        Top = 310
        Width = 286
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          1248.833333333333000000
          820.208333333333500000
          756.708333333333400000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrlblInvoiceNo: TgtQRLabel
        Tag = 3
        Left = 477
        Top = 225
        Width = 89
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1262.062500000000000000
          595.312500000000000000
          235.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Invoice Number'
        Color = 14996452
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Formata'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object qrlblInvoiceDate: TgtQRLabel
        Tag = 3
        Left = 477
        Top = 257
        Width = 100
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1262.062500000000000000
          679.979166666666700000
          264.583333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Invoice / Tax Date'
        Color = 14996452
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Formata'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object qrlblJobNumber: TgtQRLabel
        Tag = 3
        Left = 477
        Top = 289
        Width = 94
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1262.062500000000000000
          764.645833333333300000
          248.708333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Our Job Number'
        Color = 14996452
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Formata'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object qrlblOrdernumber: TgtQRLabel
        Tag = 3
        Left = 477
        Top = 320
        Width = 111
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1262.062500000000000000
          846.666666666666700000
          293.687500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Your Order Number'
        Color = 14996452
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Formata'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object qrlblVatNo: TgtQRLabel
        Left = 8
        Top = 349
        Width = 143
        Height = 18
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          21.166666666666670000
          923.395833333333300000
          378.354166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Vat No. GB 106 1749 32'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Formata'
        Font.Style = []
        OnPrint = GoodsValueLblPrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QRBand2: TQRBand
      Left = 19
      Top = 529
      Width = 775
      Height = 277
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
        732.895833333333300000
        2050.520833333333000000)
      BandType = rbPageFooter
      object gtQRShape4: TgtQRShape
        Left = 472
        Top = 24
        Width = 286
        Height = 112
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          296.333333333333400000
          1248.833333333333000000
          63.500000000000000000
          756.708333333333400000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrFootShape: TgtQRShape
        Tag = 1
        Left = 472
        Top = 24
        Width = 143
        Height = 112
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          296.333333333333400000
          1248.833333333333000000
          63.500000000000000000
          378.354166666666700000)
        Brush.Color = 14996452
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape5: TgtQRShape
        Left = 8
        Top = 24
        Width = 441
        Height = 112
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          296.333333333333300000
          21.166666666666670000
          63.500000000000000000
          1166.812500000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrlblTotalGoods: TgtQRLabel
        Tag = 1
        Left = 529
        Top = 29
        Width = 68
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1399.645833333333000000
          76.729166666666670000
          179.916666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total Goods'
        Color = 14996452
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Formata'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object GoodsValueLbl: TgtQRLabel
        Left = 643
        Top = 29
        Width = 89
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1701.270833333333000000
          76.729166666666670000
          235.479166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'GoodsValueLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Formata'
        Font.Style = []
        OnPrint = GoodsValueLblPrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object VATValueLbl: TgtQRLabel
        Left = 656
        Top = 58
        Width = 76
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1735.666666666667000000
          153.458333333333300000
          201.083333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'VATValueLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Formata'
        Font.Style = []
        OnPrint = VATValueLblPrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlblTotalVat: TgtQRLabel
        Tag = 1
        Left = 541
        Top = 58
        Width = 55
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1431.395833333333000000
          153.458333333333300000
          145.520833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total VAT'
        Color = 14996452
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Formata'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object qrlblInvoiceTotal: TgtQRLabel
        Tag = 1
        Left = 507
        Top = 88
        Width = 88
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1341.437500000000000000
          232.833333333333300000
          232.833333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'INVOICE TOTAL'
        Color = 14996452
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Formata'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object TotalValueLbl: TgtQRLabel
        Left = 653
        Top = 88
        Width = 79
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1727.729166666667000000
          232.833333333333300000
          209.020833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'TotalValueLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Formata'
        Font.Style = []
        OnPrint = TotalValueLblPrint
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lblReference: TgtQRLabel
        Left = 11
        Top = 3
        Width = 72
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          29.104166666666670000
          7.937500000000000000
          190.500000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'lblReference'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Formata'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrshpPaymentNotes: TgtQRShape
        Left = 8
        Top = 144
        Width = 750
        Height = 79
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          209.020833333333300000
          21.166666666666670000
          381.000000000000000000
          1984.375000000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape9: TgtQRShape
        Left = 472
        Top = 52
        Width = 286
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          1248.833333333333000000
          137.583333333333300000
          756.708333333333400000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape10: TgtQRShape
        Left = 472
        Top = 80
        Width = 286
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          1248.833333333333000000
          211.666666666666700000
          756.708333333333400000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape11: TgtQRShape
        Left = 472
        Top = 108
        Width = 286
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333333000
          1248.833333333333000000
          285.750000000000000000
          756.708333333333400000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object memPayment: TgtQRMemo
        Tag = 1
        Left = 12
        Top = 146
        Width = 741
        Height = 71
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          187.854166666666700000
          31.750000000000000000
          386.291666666666700000
          1960.562500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Formata'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object qrlblCompanyReg: TgtQRMemo
        Tag = 1
        Left = 10
        Top = 228
        Width = 745
        Height = 29
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          76.729166666666680000
          26.458333333333330000
          603.250000000000000000
          1971.145833333334000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Formata'
        Font.Style = []
        Lines.Strings = (
          
            'VAT registration No. 561 9227 33 | Registered in England No. 248' +
            '4401'
          'Registered office:  Denington Road, Wellingborough, NN8 2RA.  UK')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object qrlblCompanyPort: TgtQRMemo
        Tag = 1
        Left = 10
        Top = 228
        Width = 745
        Height = 29
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          76.729166666666670000
          26.458333333333330000
          603.250000000000000000
          1971.145833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -8
        Font.Name = 'Formata'
        Font.Style = []
        Lines.Strings = (
          'Portako is a trading name of Calderstone Design & Print Ltd.'
          
            'VAT registration No. 561 9227 33 | Registered in England No. 248' +
            '4401 |  Registered office:  Peterbridge House, The Lakes, Northa' +
            'mpton, NN4 7HB. UK')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
      object memoNotes: TgtQRMemo
        Left = 16
        Top = 27
        Width = 425
        Height = 102
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          269.875000000000000000
          42.333333333333330000
          71.437500000000000000
          1124.479166666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Formata'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object LineCharges: TQRSubDetail
      Left = 19
      Top = 481
      Width = 775
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = LineChargesBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.500000000000000000
        2050.520833333333000000)
      Master = InvoiceLine
      DataSet = qryInvLineCharges
      PrintBefore = False
      PrintIfEmpty = True
      object qrlblDetails: TQRLabel
        Left = 104
        Top = 2
        Width = 41
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          275.166666666666700000
          5.291666666666667000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Details'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Formata'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlblAmount: TgtQRLabel
        Left = 603
        Top = 1
        Width = 59
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1595.437500000000000000
          2.645833333333333000
          156.104166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'lblAmount'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Formata'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlblExtrasVat: TgtQRLabel
        Left = 654
        Top = 1
        Width = 76
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          1730.375000000000000000
          2.645833333333333000
          201.083333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'ExtrasVatLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Formata'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object AddChargesFooter: TQRChildBand
      Left = 19
      Top = 508
      Width = 775
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = True
      BeforePrint = AddChargesFooterBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        55.562500000000000000
        2050.520833333333000000)
      ParentBand = InvoiceFooter
      object qrlblPaymentTerms: TgtQRLabel
        Left = 619
        Top = 2
        Width = 113
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1637.770833333333000000
          5.291666666666667000
          298.979166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblPaymentTerms'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Formata'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
  end
  object InvHeadSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Sales_Invoice.*,'
      '           Customer.Name as Customer_Name,'
      '           Customer_Branch.Building_no_Name,'
      '           Customer_Branch.Street,'
      '           Customer_Branch.Locale,'
      '           Customer_Branch.Town,'
      '           Customer_Branch.Postcode'
      'from Sales_Invoice,'
      '        Customer,'
      '        Customer_Branch'
      'where'
      '('
      '(Sales_Invoice.Invoice_or_credit = '#39'I'#39') or'
      '(Sales_Invoice.Invoice_or_credit is null)'
      ') and'
      '(Sales_Invoice.Sales_invoice_Status = 10) AND'
      '(Sales_Invoice.Customer = Customer.Customer) AND'
      '('
      '(Sales_Invoice.Branch_no = Customer_Branch.Branch_no) AND'
      '(Sales_Invoice.Customer = Customer_Branch.Customer)'
      ')'
      'Order by Sales_invoice.Sales_invoice')
    Left = 840
    Top = 56
  end
  object InvHeadSRC: TDataSource
    DataSet = InvOneHeadSQL
    Left = 928
    Top = 463
  end
  object InvLineSQL: TQuery
    DatabaseName = 'PB'
    DataSource = InvHeadSRC
    SQL.Strings = (
      'SELECT  Sales_Invoice_Line.*,'
      '        Price_Unit.Price_Unit,'
      '        Price_Unit.Description AS Sales_Unit_Desc,'
      '        Price_Unit.Price_Unit_Factor,'
      '        Vat_Code.Vat_Rate,'
      '        Vat_Code.Description,'
      '        Vat_Code.VAT_Ref'
      'FROM Vat_Code'
      '      INNER JOIN (Price_Unit'
      '      INNER JOIN Sales_Invoice_Line ON'
      
        '        Price_Unit.Price_Unit = Sales_Invoice_Line.Price_Unit) O' +
        'N'
      '        Vat_Code.Vat_Code = Sales_Invoice_Line.Vat_Code'
      'WHERE Sales_Invoice = :Sales_Invoice and'
      '('
      
        '(Sales_invoice_line.Not_printed <> '#39'Y'#39') or (Sales_invoice_line.N' +
        'ot_printed = null)'
      ')'
      'AND'
      '('
      
        '(Sales_Invoice_line.Goods_Value <> 0) or (:Show_Zero_Values = '#39'Y' +
        #39')'
      ')'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 920
    Top = 104
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Sales_Invoice'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Show_Zero_Values'
        ParamType = ptUnknown
      end>
  end
  object InvLineSRC: TDataSource
    DataSet = InvLineSQL
    Left = 848
    Top = 184
  end
  object CustomerSQL: TQuery
    DatabaseName = 'PB'
    DataSource = InvHeadSRC
    SQL.Strings = (
      'SELECT  Sales_Invoice.Customer,'
      '        Customer.Name AS Customer_name,'
      '        Customer_Branch.Building_No_name,'
      '        Customer_Branch.Street,'
      '        Customer_Branch.Locale,'
      '        Customer_Branch.Town,'
      '        Customer_Branch.Postcode,'
      '        Customer_Branch.Account_Code,'
      '        Payment_Terms.Payment_Terms_Description'
      'FROM (Payment_Terms'
      '        RIGHT JOIN (Customer'
      '        INNER JOIN Customer_Branch'
      
        '            ON (Customer.Customer = Customer_Branch.Customer) AN' +
        'D (Customer.Customer = Customer_Branch.Customer))'
      
        '            ON Payment_Terms.Payment_Terms = Customer.Payment_Te' +
        'rms)'
      
        '        INNER JOIN Sales_Invoice ON (Customer_Branch.Branch_no =' +
        ' Sales_Invoice.Inv_to_Branch) AND (Customer_Branch.Customer = Sa' +
        'les_Invoice.Inv_to_Customer)'
      'WHERE (Sales_Invoice.Sales_Invoice = :Sales_Invoice)')
    Left = 936
    Top = 576
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Sales_Invoice'
        ParamType = ptUnknown
      end>
  end
  object qryComp: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select * from'
      'Company')
    Left = 928
    Top = 521
  end
  object InvOneHeadSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Sales_Invoice.*,'
      '           Customer.Name as Customer_Name,'
      '           Customer_Branch.Building_no_Name,'
      '           Customer_Branch.Street,'
      '           Customer_Branch.Locale,'
      '           Customer_Branch.Town,'
      '           Customer_Branch.Postcode'
      'from Sales_Invoice,'
      '        Customer,'
      '        Customer_Branch'
      'where'
      '(Sales_Invoice.Sales_invoice = :Sales_Invoice) AND '
      '(Sales_Invoice.Customer = Customer.Customer) AND'
      '('
      '(Sales_Invoice.Branch_no = Customer_Branch.Branch_no) AND'
      '(Sales_Invoice.Customer = Customer_Branch.Customer)'
      ')'
      ' ')
    Left = 922
    Top = 289
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Sales_Invoice'
        ParamType = ptUnknown
      end>
  end
  object UpInvHeadSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'update Sales_Invoice'
      'set Sales_Invoice_Status = :Status,'
      '      Invoice_Date = :Invoice_Date,'
      '      Sales_invoice_no = :Sales_Invoice_No'
      'where Sales_invoice = :Sales_Invoice')
    Left = 856
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Invoice_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Invoice_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Invoice'
        ParamType = ptUnknown
      end>
  end
  object UpInvLineSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'update Sales_Invoice_Line'
      'set Sales_Invoice_Status = :Status'
      'where (Sales_invoice = :Sales_Invoice) AND'
      '           (Invoice_Line_No = :Line)')
    Left = 928
    Top = 400
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Invoice'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end>
  end
  object InvRHeadSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Sales_Invoice.*,'
      '           Customer.Name as Customer_Name,'
      '           Customer_Branch.Building_no_Name,'
      '           Customer_Branch.Street,'
      '           Customer_Branch.Locale,'
      '           Customer_Branch.Town,'
      '           Customer_Branch.Postcode'
      'from Sales_Invoice,'
      '        Customer,'
      '        Customer_Branch'
      'where'
      '(Sales_Invoice.Sales_invoice_Status = 20) AND'
      '(Sales_Invoice.Customer = Customer.Customer) AND'
      '('
      '(Sales_Invoice.Branch_no = Customer_Branch.Branch_no) AND'
      '(Sales_Invoice.Customer = Customer_Branch.Customer)'
      ')'
      'order by Sales_Invoice_no')
    Left = 928
    Top = 49
  end
  object NotesSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select Narrative_Text'
      'From Narrative_line'
      'Where (Narrative = :Narrative)'
      'Order By Narrative_Line')
    Left = 920
    Top = 225
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Narrative'
        ParamType = ptUnknown
      end>
  end
  object InvAddChgSQL: TQuery
    DatabaseName = 'PB'
    DataSource = InvLineSRC
    SQL.Strings = (
      'select * '
      'from sales_inv_line_add_chg'
      'where (sales_invoice = :Sales_invoice) and'
      '(Invoice_Line_No = :Invoice_Line_no) and'
      '(Quotation_Price <> 0.00)')
    Left = 926
    Top = 345
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Sales_invoice'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Invoice_Line_no'
        ParamType = ptUnknown
      end>
  end
  object OldInvLineSQL: TQuery
    DatabaseName = 'PB'
    DataSource = InvHeadSRC
    SQL.Strings = (
      'select Sales_invoice_Line.*,'
      '          Purchase_orderLine.*,'
      '          Form_Reference.Form_Reference_id,'
      '          Vat_Code.Vat_Ref,'
      '          Vat_Code.Vat_Rate,'
      '          Price_Unit.Description as Sales_Unit_Desc,'
      '          Price_Unit.Price_Unit_Factor'
      'from Sales_invoice_Line,'
      '        Purchase_OrderLine,'
      '        Form_Reference,'
      '        Vat_Code,'
      '        Price_Unit'
      'where Sales_Invoice = :Sales_Invoice AND'
      '('
      
        '(Sales_Invoice_Line.Purchase_Order = Purchase_OrderLine.Purchase' +
        '_Order) AND'
      '(Sales_Invoice_Line.Line = Purchase_OrderLine.Line)'
      ') and'
      
        '(Purchase_OrderLine.Form_Reference *= Form_Reference.Form_refere' +
        'nce) and'
      '(Sales_Invoice_Line.Vat_Code = Vat_code.Vat_Code) and'
      '(Sales_Invoice_Line.Price_Unit = Price_Unit.Price_Unit)')
    Left = 920
    Top = 168
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Sales_Invoice'
        ParamType = ptUnknown
      end>
  end
  object DeliverySQL: TQuery
    DatabaseName = 'PB'
    DataSource = InvLineSRC
    SQL.Strings = (
      'select top 1 Delivery_Detail.*'
      'from Delivery_Detail'
      'where'
      '('
      '(Purchase_Order = :Purchase_Order) AND'
      '(Line = :Line)'
      ')')
    Left = 392
    Top = 160
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
  object DeliverySRC: TDataSource
    DataSet = DeliverySQL
    Left = 472
    Top = 160
  end
  object AddressSRC: TDataSource
    DataSet = CustSQL
    Left = 80
    Top = 360
  end
  object AdhocSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Name,'
      #9#9#9'Building_no_name,'
      '        Street,'
      '        Locale,'
      '        Town,'
      '        Postcode'
      'from Ad_hoc_Address'
      'where Ad_hoc_Address = :Ad_hoc_Address')
    Left = 201
    Top = 348
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Ad_hoc_Address'
        ParamType = ptUnknown
      end>
  end
  object RepSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Name,'
      #9#9#9'Building_no_name,'
      '        Street,'
      '        Locale,'
      '        Town,'
      '        Postcode'
      'from Rep'
      'where Rep = :Rep')
    Left = 234
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Rep'
        ParamType = ptUnknown
      end>
  end
  object SupplierSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select '#9'Supplier.Name as Supplier_Name,'
      #9#9#9'Building_no_name,'
      '        Street,'
      '        Locale,'
      '        Town,'
      '        Postcode'
      'from Supplier_Branch, Supplier'
      'where Supplier_Branch.Supplier = :Supplier and'
      #9#9#9'Supplier_Branch.Branch_no = :Branch_no and'
      '        Supplier_Branch.Supplier = Supplier.Supplier'
      ' ')
    Left = 307
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_no'
        ParamType = ptUnknown
      end>
  end
  object CompSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Company.Name as Company_Name,'
      #9#9#9'Building_no_name,'
      '        Street,'
      '        Locale,'
      '        Town,'
      '        Postcode'
      'from Company'
      'where Company = 1')
    Left = 341
    Top = 376
  end
  object CustSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Customer.Name as Customer_Name,'
      #9#9#9'Building_no_name,'
      '        Street,'
      '        Locale,'
      '        Town,'
      '        Postcode'
      'from Customer_Branch, Customer'
      'where ((Customer_Branch.Customer = :Customer) and'
      #9#9#9'(Branch_no = :Branch_no)) and'
      '        Customer_Branch.Customer = Customer.Customer')
    Left = 454
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_no'
        ParamType = ptUnknown
      end>
  end
  object CreditHeadSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Sales_Invoice.*,'
      '           Customer.Name as Customer_Name,'
      '           Customer_Branch.Building_no_Name,'
      '           Customer_Branch.Street,'
      '           Customer_Branch.Locale,'
      '           Customer_Branch.Town,'
      '           Customer_Branch.Postcode'
      'from Sales_Invoice,'
      '        Customer,'
      '        Customer_Branch'
      'where'
      '('
      '(Sales_Invoice.Invoice_or_credit = '#39'C'#39') '
      ') and'
      '(Sales_Invoice.Sales_invoice_Status = 10) AND'
      '(Sales_Invoice.Customer = Customer.Customer) AND'
      '('
      '(Sales_Invoice.Branch_no = Customer_Branch.Branch_no) AND'
      '(Sales_Invoice.Customer = Customer_Branch.Customer)'
      ')'
      ' ')
    Left = 448
    Top = 281
  end
  object GetNarrSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select Narrative_Text'
      'From Narrative_Line'
      'Where (Narrative = :Narrative)'
      'Order By Narrative_Line')
    Left = 552
    Top = 125
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Narrative'
        ParamType = ptUnknown
      end>
  end
  object qryPOLine: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT  Purchase_orderLine.Customers_Desc, '
      '        Purchase_OrderLine.Cust_Order_no,'
      '        Form_Reference.Form_Reference_ID,'
      '        Form_Reference.Form_Reference_Descr'
      'FROM Form_Reference'
      '      RIGHT JOIN Purchase_orderLine ON'
      
        '        Form_Reference.Form_Reference = Purchase_orderLine.Form_' +
        'Reference'
      'where Purchase_order = :Purchase_Order and'
      'Line = :Line'
      ' ')
    Left = 584
    Top = 20
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
  object qrySOLine: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Part.Part, '
      '          Part_Description, '
      '          Sales_order_line.Sell_Pack_Quantity, '
      '          Price_Unit'
      'from Sales_order_line, '
      '        Part'
      'where Sales_Order = :Sales_Order and'
      'Sales_Order_Line_no = :Sales_Order_Line_no and'
      '(Sales_order_line.Part = Part.Part)')
    Left = 584
    Top = 47
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Order_Line_no'
        ParamType = ptUnknown
      end>
  end
  object qryJBLine: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Job_Bag_Line_Descr'
      'from Job_Bag_Line_Dets'
      'where Job_Bag = :Job_Bag and'
      'Job_Bag_Line = :Job_Bag_Line')
    Left = 584
    Top = 103
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Job_Bag_Line'
        ParamType = ptUnknown
      end>
  end
  object qryInvCharges: TQuery
    DatabaseName = 'PB'
    DataSource = InvHeadSRC
    SQL.Strings = (
      'select Sales_invoice_Add_Charge.*, VAT_Code.VAT_Rate'
      'from Sales_invoice_Add_Charge, VAT_Code'
      
        'where Sales_invoice_Add_Charge.Sales_Invoice = :Sales_Invoice an' +
        'd'
      'Sales_invoice_Add_Charge.VAT_Code = Vat_Code.Vat_Code')
    Left = 240
    Top = 150
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Invoice'
        ParamType = ptUnknown
      end>
  end
  object qryJBHead: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Job_Bag, Cust_Order_no'
      'from Job_Bag'
      'where Job_Bag = :Job_Bag')
    Left = 664
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job_Bag'
        ParamType = ptUnknown
      end>
  end
  object qrySOHead: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Sales_order, Cust_Order_no'
      'from Sales_order'
      'where Sales_order = :Sales_order')
    Left = 664
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_order'
        ParamType = ptUnknown
      end>
  end
  object qrySIHead: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select *'
      'from Sales_invoice'
      'where Sales_invoice_no = :Sales_Invoice_no')
    Left = 376
    Top = 63
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Invoice_no'
        ParamType = ptUnknown
      end>
  end
  object qryInvLineCharges: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Sales_invoice_Add_Charge.*, VAT_Code.VAT_Rate'
      'from Sales_invoice_Add_Charge, VAT_Code'
      'where'
      '((Sales_invoice_Add_Charge.Sales_Invoice = :Sales_Invoice) and'
      
        '(Sales_invoice_Add_Charge.Invoice_Line_no = :Invoice_Line_no)) a' +
        'nd'
      'Sales_invoice_Add_Charge.VAT_Code = Vat_Code.Vat_Code')
    Left = 928
    Top = 630
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Invoice'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Invoice_Line_no'
        ParamType = ptUnknown
      end>
  end
end
