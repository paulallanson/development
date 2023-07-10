object frmwtRPQuoteDecline: TfrmwtRPQuoteDecline
  Left = 49
  Top = 110
  Width = 1173
  Height = 618
  Caption = 'Quote Decline Reason Report'
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
  object qrpDetails: TQuickRep
    Left = 16
    Top = 16
    Width = 1123
    Height = 794
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    BeforePrint = qrpDetailsBeforePrint
    DataSet = qryQuotes
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
    ReportTitle = 'Quotation Report'
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsMaximized
    object QRBand1: TQRBand
      Left = 38
      Top = 38
      Width = 1047
      Height = 75
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        198.437500000000000000
        2770.187500000000000000)
      BandType = rbPageHeader
      object qrlblCaption: TgtQRLabel
        Left = 412
        Top = 8
        Width = 209
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1090.083333333333000000
          21.166666666666670000
          552.979166666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Quote Decline Reason Report'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRLabel3: TgtQRLabel
        Left = 8
        Top = 57
        Width = 30
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          150.812500000000000000
          79.375000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Quote'
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
      object QRLabel4: TgtQRLabel
        Left = 48
        Top = 57
        Width = 23
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          127.000000000000000000
          150.812500000000000000
          60.854166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Date'
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
      object QRLabel5: TgtQRLabel
        Left = 112
        Top = 57
        Width = 55
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          296.333333333333300000
          150.812500000000000000
          145.520833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
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
      object QRLabel6: TgtQRLabel
        Left = 376
        Top = 57
        Width = 52
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          994.833333333333300000
          150.812500000000000000
          137.583333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Reference'
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
      object QRLabel7: TgtQRLabel
        Left = 526
        Top = 57
        Width = 45
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1391.708333333333000000
          150.812500000000000000
          119.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Complete'
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
      object QRLabel8: TgtQRLabel
        Left = 589
        Top = 57
        Width = 28
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1558.395833333333000000
          150.812500000000000000
          74.083333333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Install'
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
      object QRLabel9: TgtQRLabel
        Left = 640
        Top = 57
        Width = 36
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1693.333333333333000000
          150.812500000000000000
          95.250000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Survey'
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
      object QRLabel11: TgtQRLabel
        Left = 864
        Top = 57
        Width = 32
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2286.000000000000000000
          150.812500000000000000
          84.666666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Status'
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
      object QRLabel1: TgtQRLabel
        Left = 696
        Top = 57
        Width = 40
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1841.500000000000000000
          150.812500000000000000
          105.833333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Delivery'
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
      object QRLabel12: TgtQRLabel
        Left = 824
        Top = 57
        Width = 24
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2180.166666666667000000
          150.812500000000000000
          63.500000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total'
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
      object QRLabel14: TgtQRLabel
        Left = 768
        Top = 57
        Width = 23
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2032.000000000000000000
          150.812500000000000000
          60.854166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'VAT'
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
      object qrlblDateRange: TgtQRLabel
        Left = 475
        Top = 32
        Width = 74
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1256.770833333333000000
          84.666666666666670000
          195.791666666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblDateRange'
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
      object QRSysData2: TgtQRSysData
        Left = 981
        Top = 8
        Width = 56
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2595.562500000000000000
          21.166666666666670000
          148.166666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsDateTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FontSize = 8
      end
      object QRSysData1: TgtQRSysData
        Left = 968
        Top = 24
        Width = 69
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2561.166666666667000000
          63.500000000000000000
          182.562500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = 'Page: '
        Transparent = False
        FontSize = 8
      end
      object gtQRLabel1: TgtQRLabel
        Left = 992
        Top = 57
        Width = 47
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2624.666666666667000000
          150.812500000000000000
          124.354166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Requotes'
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
    object qrgCustomerHead: TQRGroup
      Left = 38
      Top = 113
      Width = 1047
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        84.666666666666670000
        2770.187500000000000000)
      Expression = 'Inactive_Reason_Descr'
      FooterBand = qrbCustomerFooter
      Master = qrpDetails
      ReprintOnNewPage = False
      object QRLabel2: TgtQRLabel
        Left = 8
        Top = 8
        Width = 76
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
          201.083333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Decline Reason'
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
      object QRDBText1: TgtQRDBText
        Left = 88
        Top = 8
        Width = 116
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          232.833333333333300000
          21.166666666666670000
          306.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryQuotes
        DataField = 'Inactive_Reason_Descr'
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
    object qrsbDetails: TQRSubDetail
      Left = 38
      Top = 145
      Width = 1047
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = qrsbDetailsAfterPrint
      AlignToBottom = False
      BeforePrint = qrsbDetailsBeforePrint
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
        84.666666666666670000
        2770.187500000000000000)
      Master = qrpDetails
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText11: TgtQRDBText
        Left = 668
        Top = 0
        Width = 70
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1767.416666666667000000
          0.000000000000000000
          185.208333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryQuotes
        DataField = 'Delivery_Price'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText2: TgtQRDBText
        Left = 8
        Top = 1
        Width = 30
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          2.645833333333333000
          79.375000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryQuotes
        DataField = 'Quote'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText3: TgtQRDBText
        Left = 48
        Top = 1
        Width = 62
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          127.000000000000000000
          2.645833333333333000
          164.041666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryQuotes
        DataField = 'Date_Raised'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText5: TgtQRDBText
        Left = 376
        Top = 1
        Width = 145
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          994.833333333333400000
          2.645833333333333000
          383.645833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qryQuotes
        DataField = 'Reference'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText6: TgtQRDBText
        Left = 112
        Top = 17
        Width = 257
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          296.333333333333400000
          44.979166666666670000
          679.979166666666800000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qryQuotes
        DataField = 'Description'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText10: TgtQRDBText
        Left = 610
        Top = 0
        Width = 66
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1613.958333333333000000
          0.000000000000000000
          174.625000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryQuotes
        DataField = 'Survey_price'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlTotal: TgtQRLabel
        Left = 806
        Top = 0
        Width = 43
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          2132.541666666667000000
          0.000000000000000000
          113.770833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlTotal'
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
      object QRDBText8: TgtQRDBText
        Left = 536
        Top = 0
        Width = 81
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1418.166666666667000000
          0.000000000000000000
          214.312500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryQuotes
        DataField = 'Installation_price'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlComplete: TgtQRLabel
        Left = 513
        Top = 0
        Width = 57
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1357.312500000000000000
          0.000000000000000000
          150.812500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlComplete'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlVat: TgtQRLabel
        Left = 761
        Top = 0
        Width = 30
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          2013.479166666667000000
          0.000000000000000000
          79.375000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlVat'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText9: TgtQRDBText
        Left = 112
        Top = 1
        Width = 257
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          296.333333333333400000
          2.645833333333333000
          679.979166666666800000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qryQuotes
        DataField = 'Customer_Name'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlblRequote: TgtQRLabel
        Left = 1004
        Top = 0
        Width = 61
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          2656.416666666667000000
          0.000000000000000000
          161.395833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblRequote'
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
      object qrlblStatus: TgtQRLabel
        Left = 868
        Top = 0
        Width = 125
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          2296.583333333333000000
          0.000000000000000000
          330.729166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'qrlblStatus'
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
    object qrbCustomerFooter: TQRBand
      Left = 38
      Top = 177
      Width = 1047
      Height = 29
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = qrbCustomerFooterAfterPrint
      AlignToBottom = False
      BeforePrint = qrbCustomerFooterBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        76.729166666666670000
        2770.187500000000000000)
      BandType = rbGroupFooter
      object QRLabel13: TgtQRLabel
        Left = 650
        Top = 7
        Width = 28
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1719.791666666667000000
          18.520833333333330000
          74.083333333333330000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total'
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
      object qrlblCustTotal: TgtQRLabel
        Left = 770
        Top = 7
        Width = 79
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2037.291666666667000000
          18.520833333333330000
          209.020833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblCustTotal'
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
      object QRShape1: TgtQRShape
        Left = 688
        Top = -1
        Width = 161
        Height = 8
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          21.166666666666670000
          1820.333333333333000000
          -2.645833333333333000
          425.979166666666700000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel15: TgtQRLabel
        Left = 890
        Top = 7
        Width = 70
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2354.791666666667000000
          18.520833333333330000
          185.208333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Quote Count'
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
      object qrlblCount: TgtQRLabel
        Left = 950
        Top = 7
        Width = 59
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2513.541666666667000000
          18.520833333333330000
          156.104166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblCount'
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
      object QRDBText7: TgtQRDBText
        Left = 532
        Top = 7
        Width = 111
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1407.583333333333000000
          18.520833333333330000
          293.687500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryQuotes
        DataField = 'Reason_Description'
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
      Left = 38
      Top = 206
      Width = 1047
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = QRBand2AfterPrint
      AlignToBottom = False
      BeforePrint = QRBand2BeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        84.666666666666670000
        2770.187500000000000000)
      BandType = rbSummary
      object QRLabel10: TgtQRLabel
        Left = 690
        Top = 7
        Width = 68
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1825.625000000000000000
          18.520833333333330000
          179.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Report Total'
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
      object qrlblReportTotal: TgtQRLabel
        Left = 759
        Top = 7
        Width = 90
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2008.187500000000000000
          18.520833333333330000
          238.125000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblReportTotal'
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
      object QRShape2: TgtQRShape
        Left = 688
        Top = -1
        Width = 161
        Height = 8
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          21.166666666666670000
          1820.333333333333000000
          -2.645833333333333000
          425.979166666666700000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
  end
  object qryQuotes: TQuery
    DatabaseName = 'Wt'
    SQL.Strings = (
      'select Quote.*,'
      '  Customer.Customer_Name as Customer_Name_Actual,'
      '  Customer.telephone_number,'
      '  Quote_Status_Description,'
      '  Vat_Rate,'
      '  Inactive_Reason.Inactive_Reason_Descr,'
      '  Customer.Is_Retail_Customer,'
      '  Customer.Is_Commercial_Customer,'
      '  (SELECT Count(ReQuote.Quote)'
      '   FROM Quote ReQuote'
      '   WHERE (ReQuote.Original_Quote = Quote.Original_Quote) and'
      '         (ReQuote.Quote <> ReQuote.Original_Quote) and'
      
        '         ((ReQuote.Original_Quote <> 0) and (ReQuote.Original_Qu' +
        'ote <> NULL))) as Requote_Count'
      'FROM Inactive_Reason'
      '      RIGHT JOIN (Vat'
      '      INNER JOIN (Quote_Status'
      '      INNER JOIN (Customer'
      '      INNER JOIN Quote ON'
      '        Customer.Customer = Quote.Customer) ON'
      '        Quote_Status.Quote_Status = Quote.Quote_Status) ON'
      '        Vat.Vat = Quote.Vat) ON'
      '        Inactive_Reason.Inactive_Reason = Quote.Inactive_Reason'
      'WHERE'
      '(Quote.inactive = '#39'Y'#39') AND'
      
        '((Quote.Contract_Quote IS NULL) OR (Quote.Contract_Quote = '#39'N'#39'))' +
        ' AND'
      '((Quote.Customer = :Customer) or (0 = :Customer)) and'
      '((Quote.Inactive_Reason = :Code) or (0 = :Code)) and'
      
        '((Quote.Date_Raised >= :Date_From) and (Quote.Date_Raised <= :Da' +
        'te_To)) AND'
      
        '(((Customer.Is_Retail_Customer = :Is_Retail_Customer) AND (Custo' +
        'mer.Is_Commercial_Customer = :Is_Commercial_Customer)) or (:Is_R' +
        'etail_Customer = '#39'A'#39'))'
      'ORDER BY Inactive_Reason_Descr, Quote.Quote_Number, Quote.Quote')
    Left = 208
    Top = 184
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Date_From'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Date_To'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Is_Retail_Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Is_Commercial_Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Is_Retail_Customer'
        ParamType = ptUnknown
      end>
    object qryQuotesQuote: TIntegerField
      FieldName = 'Quote'
    end
    object qryQuotesDate_Required: TDateTimeField
      FieldName = 'Date_Required'
    end
    object qryQuotesDate_Raised: TDateTimeField
      FieldName = 'Date_Raised'
    end
    object qryQuotesCustomer: TIntegerField
      FieldName = 'Customer'
    end
    object qryQuotesDescription: TStringField
      FieldName = 'Description'
      Size = 255
    end
    object qryQuotesOperator: TIntegerField
      FieldName = 'Operator'
    end
    object qryQuotesInstallation_price: TFloatField
      FieldName = 'Installation_price'
      DisplayFormat = '0.00'
    end
    object qryQuotesDelivery_Price: TFloatField
      FieldName = 'Delivery_Price'
      DisplayFormat = '0.00'
    end
    object qryQuotesSurvey_price: TFloatField
      FieldName = 'Survey_price'
      DisplayFormat = '0.00'
    end
    object qryQuotesExtra_Notes: TIntegerField
      FieldName = 'Extra_Notes'
    end
    object qryQuotesAvailability: TIntegerField
      FieldName = 'Availability'
    end
    object qryQuotesPayment_terms: TIntegerField
      FieldName = 'Payment_terms'
    end
    object qryQuotesReference: TStringField
      FieldName = 'Reference'
      Size = 30
    end
    object qryQuotesQuote_Status: TIntegerField
      FieldName = 'Quote_Status'
    end
    object qryQuotesNett_Price: TFloatField
      FieldName = 'Nett_Price'
      DisplayFormat = '0.00'
    end
    object qryQuotesInactive: TStringField
      FieldName = 'Inactive'
      Size = 1
    end
    object qryQuotesInactive_reason: TIntegerField
      FieldName = 'Inactive_reason'
    end
    object qryQuotesMaterial_Type: TIntegerField
      FieldName = 'Material_Type'
    end
    object qryQuotesAddress: TIntegerField
      FieldName = 'Address'
    end
    object qryQuotesContact_Name: TStringField
      FieldName = 'Contact_Name'
      Size = 50
    end
    object qryQuotesVat: TIntegerField
      FieldName = 'Vat'
    end
    object qryQuotesDiscount_Rate: TFloatField
      FieldName = 'Discount_Rate'
    end
    object qryQuotesDiscount_Value: TFloatField
      FieldName = 'Discount_Value'
      DisplayFormat = '0.00'
    end
    object qryQuotesCustomer_Name: TStringField
      FieldName = 'Customer_Name'
      Size = 50
    end
    object qryQuotesTemplate_Date: TDateTimeField
      FieldName = 'Template_Date'
    end
    object qryQuotesTemplate_Date_Actual: TDateTimeField
      FieldName = 'Template_Date_Actual'
    end
    object qryQuotesDeposit_Terms: TFloatField
      FieldName = 'Deposit_Terms'
    end
    object qryQuotesDeposit_Amount: TFloatField
      FieldName = 'Deposit_Amount'
      DisplayFormat = '0.00'
    end
    object qryQuotesInstall_Address: TIntegerField
      FieldName = 'Install_Address'
    end
    object qryQuotesDate_Accepted: TDateTimeField
      FieldName = 'Date_Accepted'
    end
    object qryQuotesCustomer_Name_Actual: TStringField
      FieldName = 'Customer_Name_Actual'
      Size = 50
    end
    object qryQuotesQuote_Status_Description: TStringField
      FieldName = 'Quote_Status_Description'
      Size = 50
    end
    object qryQuotesVat_Rate: TFloatField
      FieldName = 'Vat_Rate'
    end
    object qryQuotestelephone_number: TStringField
      FieldName = 'telephone_number'
      Size = 30
    end
    object qryQuotesMarkup_Value: TFloatField
      FieldName = 'Markup_Value'
    end
    object qryQuotesInactive_Reason_Descr: TStringField
      FieldName = 'Inactive_Reason_Descr'
      Size = 100
    end
    object qryQuotesQuote_Number: TFloatField
      FieldName = 'Quote_Number'
    end
    object qryQuotesOriginal_Quote: TIntegerField
      FieldName = 'Original_Quote'
    end
    object qryQuotesRequote_Count: TIntegerField
      FieldName = 'Requote_Count'
    end
    object qryQuotesIs_Retail_Customer: TStringField
      FieldName = 'Is_Retail_Customer'
      Size = 1
    end
  end
  object qryReQuote: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      
        'SELECT Sum(Quote.Nett_Price - Quote.Discount_Value + Quote.Marku' +
        'p_Value) as Total_Complete,'
      '        Sum(Installation_Price) as Total_Install,'
      '        Sum(Survey_Price) as Total_Survey,'
      '        Sum(Delivery_Price) as Total_Delivery,'
      '        max(Quote_Status) as Requote_Status'
      'FROM Quote'
      
        'WHERE ((Quote.Original_Quote = :Original_Quote) or (Quote.Quote ' +
        '= :Original_Quote)) and'
      '      (Quote.Quote <> :Quote)')
    Left = 326
    Top = 180
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Original_Quote'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Original_Quote'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quote'
        ParamType = ptUnknown
      end>
  end
end
