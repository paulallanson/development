object frmWTRPContract: TfrmWTRPContract
  Left = 294
  Top = 96
  Width = 1314
  Height = 620
  Caption = 'Contract Quote Report'
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
    Top = 40
    Width = 794
    Height = 1123
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    BeforePrint = qrpDetailsBeforePrint
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
    Page.Values = (
      100.000000000000000000
      2970.000000000000000000
      100.000000000000000000
      2100.000000000000000000
      80.000000000000000000
      80.000000000000000000
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
    object qrbPageHeader: TQRBand
      Left = 30
      Top = 38
      Width = 734
      Height = 419
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
        1108.604166666667000000
        1942.041666666667000000)
      BandType = rbPageHeader
      object gtQRShape3: TgtQRShape
        Left = 8
        Top = 316
        Width = 701
        Height = 89
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          235.479166666666700000
          21.166666666666670000
          836.083333333333300000
          1854.729166666667000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrlblQuoteCaption: TgtQRLabel
        Left = 544
        Top = 8
        Width = 161
        Height = 43
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          113.770833333333300000
          1439.333333333333000000
          21.166666666666670000
          425.979166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Quotation'
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
      object QRDBText4: TgtQRDBText
        Left = 95
        Top = 321
        Width = 57
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          251.354166666666700000
          849.312500000000000000
          150.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Developer'
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
      object QRLabel5: TgtQRLabel
        Left = 13
        Top = 321
        Width = 57
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          34.395833333333330000
          849.312500000000000000
          150.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Developer'
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
      object QRDBText5: TgtQRDBText
        Left = 95
        Top = 367
        Width = 610
        Height = 32
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          84.666666666666670000
          251.354166666666700000
          971.020833333333300000
          1613.958333333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Contract_Description'
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
      object gtQRLabel7: TgtQRLabel
        Left = 13
        Top = 367
        Width = 64
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          34.395833333333330000
          971.020833333333300000
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
      object gtQRShape5: TgtQRShape
        Left = 8
        Top = 334
        Width = 701
        Height = 8
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          21.166666666666670000
          21.166666666666670000
          883.708333333333300000
          1854.729166666667000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape6: TgtQRShape
        Left = 496
        Top = 71
        Width = 217
        Height = 122
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          322.791666666666700000
          1312.333333333333000000
          187.854166666666700000
          574.145833333333300000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel2: TgtQRLabel
        Left = 503
        Top = 108
        Width = 30
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1330.854166666667000000
          285.750000000000000000
          79.375000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Date:'
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
      object QRDBText1: TgtQRDBText
        Left = 627
        Top = 108
        Width = 80
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1658.937500000000000000
          285.750000000000000000
          211.666666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Contract_Date'
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
      object QRDBText2: TgtQRDBText
        Left = 621
        Top = 77
        Width = 86
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1643.062500000000000000
          203.729166666666700000
          227.541666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Quote_Number'
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
      object QRDBText3: TgtQRDBText
        Left = 567
        Top = 139
        Width = 140
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1500.187500000000000000
          367.770833333333300000
          370.416666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Account_Manager_Name'
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
      object QRDBText6: TgtQRDBText
        Left = 574
        Top = 168
        Width = 133
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1518.708333333333000000
          444.500000000000000000
          351.895833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'AM_Telephone_number'
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
      object QRLabel16: TgtQRLabel
        Left = 503
        Top = 168
        Width = 40
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1330.854166666667000000
          444.500000000000000000
          105.833333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Phone:'
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
      object QRLabel4: TgtQRLabel
        Left = 503
        Top = 139
        Width = 46
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1330.854166666667000000
          367.770833333333300000
          121.708333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Contact:'
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
      object QRLabel3: TgtQRLabel
        Left = 503
        Top = 77
        Width = 69
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1330.854166666667000000
          203.729166666666700000
          182.562500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Contract No:'
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
      object gtQRShape7: TgtQRShape
        Left = 83
        Top = 316
        Width = 9
        Height = 89
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          235.479166666666700000
          219.604166666666700000
          836.083333333333300000
          23.812500000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRShape8: TgtQRShape
        Left = 496
        Top = 128
        Width = 217
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          1312.333333333333000000
          338.666666666666700000
          574.145833333333300000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape9: TgtQRShape
        Left = 496
        Top = 101
        Width = 217
        Height = 3
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          7.937500000000000000
          1312.333333333333000000
          267.229166666666700000
          574.145833333333300000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape1: TgtQRShape
        Left = 8
        Top = 358
        Width = 701
        Height = 8
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          21.166666666666670000
          21.166666666666670000
          947.208333333333300000
          1854.729166666667000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRLabel1: TgtQRLabel
        Left = 13
        Top = 343
        Width = 48
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          34.395833333333330000
          907.520833333333300000
          127.000000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Location'
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
      object gtQRDBText1: TgtQRDBText
        Left = 95
        Top = 343
        Width = 76
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          251.354166666666700000
          907.520833333333300000
          201.083333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Site_Location'
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
      object qriHeadLogo: TgtQRImage
        Left = 12
        Top = 6
        Width = 300
        Height = 62
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          164.041666666666700000
          31.750000000000000000
          15.875000000000000000
          793.750000000000000000)
        Stretch = True
      end
      object memAddress: TgtQRMemo
        Left = 11
        Top = 70
        Width = 353
        Height = 83
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          219.604166666666700000
          29.104166666666670000
          185.208333333333300000
          933.979166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
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
      object gtQRShape12: TgtQRShape
        Left = 496
        Top = 159
        Width = 217
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          1312.333333333333000000
          420.687500000000000000
          574.145833333333300000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape13: TgtQRShape
        Left = 575
        Top = 71
        Width = 9
        Height = 122
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          322.791666666666700000
          1521.354166666667000000
          187.854166666666700000
          23.812500000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape1: TgtQRShape
        Left = 8
        Top = 161
        Width = 353
        Height = 147
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          388.937500000000000000
          21.166666666666670000
          425.979166666666700000
          933.979166666666700000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrmAddress: TgtQRMemo
        Left = 40
        Top = 175
        Width = 225
        Height = 121
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          320.145833333333300000
          105.833333333333300000
          463.020833333333300000
          595.312500000000000000)
        Alignment = taLeftJustify
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
        WordWrap = True
        FontSize = 9
      end
    end
    object qrgQuote: TQRGroup
      Left = 30
      Top = 457
      Width = 734
      Height = 2
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = qrgQuoteAfterPrint
      AlignToBottom = False
      BeforePrint = qrgQuoteBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        5.291666666666667000
        1942.041666666667000000)
      Expression = 'Contract_quote'
      Master = qrpDetails
      ReprintOnNewPage = False
    end
    object qrsdContractLine: TQRSubDetail
      Left = 30
      Top = 534
      Width = 734
      Height = 26
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = qrsdContractLineAfterPrint
      AlignToBottom = False
      BeforePrint = qrsdContractLineBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        68.791666666666670000
        1942.041666666667000000)
      Master = qrpDetails
      DataSet = qryContractLine
      FooterBand = qrbTemplateFitting
      HeaderBand = qrbContractLineHeader
      PrintBefore = False
      PrintIfEmpty = True
      object gtQRShapeDrawing: TgtQRShape
        Left = 2
        Top = 0
        Width = 150
        Height = 26
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          68.791666666666670000
          5.291666666666667000
          0.000000000000000000
          396.875000000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShapeOption5: TgtQRShape
        Left = 727
        Top = 0
        Width = 145
        Height = 26
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          68.791666666666670000
          1923.520833333333000000
          0.000000000000000000
          383.645833333333300000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShapeOption1: TgtQRShape
        Left = 151
        Top = 0
        Width = 145
        Height = 26
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          68.791666666666670000
          399.520833333333300000
          0.000000000000000000
          383.645833333333300000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShapeOption2: TgtQRShape
        Left = 295
        Top = 0
        Width = 145
        Height = 26
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          68.791666666666670000
          780.520833333333300000
          0.000000000000000000
          383.645833333333300000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShapeOption3: TgtQRShape
        Left = 439
        Top = 0
        Width = 145
        Height = 26
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          68.791666666666670000
          1161.520833333333000000
          0.000000000000000000
          383.645833333333300000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShapeOption4: TgtQRShape
        Left = 583
        Top = 0
        Width = 145
        Height = 26
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          68.791666666666670000
          1542.520833333333000000
          0.000000000000000000
          383.645833333333300000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrlblOption1: TgtQRLabel
        Left = 230
        Top = 6
        Width = 28
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          608.541666666666700000
          15.875000000000000000
          74.083333333333330000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #163'0.00'
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
      object qrlblOption2: TgtQRLabel
        Left = 374
        Top = 6
        Width = 28
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          989.541666666666700000
          15.875000000000000000
          74.083333333333330000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #163'0.00'
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
      object qrlblOption3: TgtQRLabel
        Left = 515
        Top = 6
        Width = 28
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1362.604166666667000000
          15.875000000000000000
          74.083333333333330000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #163'0.00'
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
      object qrlblOption4: TgtQRLabel
        Left = 654
        Top = 6
        Width = 28
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1730.375000000000000000
          15.875000000000000000
          74.083333333333330000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #163'0.00'
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
      object gtQRShapeOption6: TgtQRShape
        Left = 871
        Top = 0
        Width = 145
        Height = 26
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          68.791666666666670000
          2304.520833333333000000
          0.000000000000000000
          383.645833333333300000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrlblOption5: TgtQRLabel
        Left = 798
        Top = 6
        Width = 28
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          2111.375000000000000000
          15.875000000000000000
          74.083333333333330000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #163'0.00'
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
      object qrlblOption6: TgtQRLabel
        Left = 940
        Top = 6
        Width = 28
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          2487.083333333333000000
          15.875000000000000000
          74.083333333333330000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #163'0.00'
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
      object qrlblDrawingNumberMemo: TgtQRRichText
        Left = 6
        Top = 6
        Width = 142
        Height = 16
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          15.875000000000000000
          15.875000000000000000
          375.708333333333300000)
        Alignment = taLeftJustify
        AutoStretch = True
        Color = clWindow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'qrlblDrawingNo')
      end
      object qrlblDrawingNumber: TgtQRLabel
        Left = 6
        Top = 6
        Width = 143
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          15.875000000000000000
          15.875000000000000000
          378.354166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'qrlblDrawingNumber'
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
    object qrbContractLineHeader: TQRBand
      Left = 30
      Top = 509
      Width = 734
      Height = 25
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = qrbContractLineHeaderAfterPrint
      AlignToBottom = False
      BeforePrint = qrbContractLineHeaderBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        66.145833333333330000
        1942.041666666667000000)
      BandType = rbGroupHeader
      object qrlblOptionHead0: TgtQRRichText
        Left = 156
        Top = 6
        Width = 137
        Height = 16
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          412.750000000000000000
          15.875000000000000000
          362.479166666666700000)
        Alignment = taCenter
        AutoStretch = True
        Color = clWindow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Lines.Strings = (
          'Option '
          'Description')
      end
      object gtQRShapeHead0: TgtQRShape
        Left = 2
        Top = 0
        Width = 150
        Height = 26
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          68.791666666666670000
          5.291666666666667000
          0.000000000000000000
          396.875000000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShapeHead1: TgtQRShape
        Left = 151
        Top = 0
        Width = 145
        Height = 26
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          68.791666666666670000
          399.520833333333300000
          0.000000000000000000
          383.645833333333300000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShapeHead2: TgtQRShape
        Left = 295
        Top = 0
        Width = 145
        Height = 26
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          68.791666666666670000
          780.520833333333300000
          0.000000000000000000
          383.645833333333300000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShapeHead3: TgtQRShape
        Left = 439
        Top = 0
        Width = 145
        Height = 26
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          68.791666666666670000
          1161.520833333333000000
          0.000000000000000000
          383.645833333333300000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShapeHead4: TgtQRShape
        Left = 583
        Top = 0
        Width = 145
        Height = 26
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          68.791666666666670000
          1542.520833333333000000
          0.000000000000000000
          383.645833333333300000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrlblDrawing: TgtQRLabel
        Left = 6
        Top = 6
        Width = 67
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          15.875000000000000000
          15.875000000000000000
          177.270833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Drawing Ref'
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
      object qrlblOptionHead1: TgtQRLabel
        Left = 156
        Top = 6
        Width = 137
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          412.750000000000000000
          15.875000000000000000
          362.479166666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'Option 1'
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
      object qrlblOptionHead2: TgtQRLabel
        Left = 299
        Top = 6
        Width = 137
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          791.104166666666700000
          15.875000000000000000
          362.479166666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'Option 2'
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
      object qrlblOptionHead3: TgtQRLabel
        Left = 442
        Top = 6
        Width = 137
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1169.458333333333000000
          15.875000000000000000
          362.479166666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'Option 3'
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
      object qrlblOptionHead4: TgtQRLabel
        Left = 586
        Top = 6
        Width = 137
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1550.458333333333000000
          15.875000000000000000
          362.479166666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'Option 4'
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
      object gtQRShapeHead5: TgtQRShape
        Left = 727
        Top = 0
        Width = 145
        Height = 26
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          68.791666666666670000
          1923.520833333333000000
          0.000000000000000000
          383.645833333333300000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShapeHead6: TgtQRShape
        Left = 871
        Top = 0
        Width = 145
        Height = 26
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          68.791666666666670000
          2304.520833333333000000
          0.000000000000000000
          383.645833333333300000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrlblOptionHead5: TgtQRLabel
        Left = 731
        Top = 6
        Width = 137
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1934.104166666667000000
          15.875000000000000000
          362.479166666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'Option 5'
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
      object qrlblOptionHead6: TgtQRLabel
        Left = 875
        Top = 6
        Width = 137
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          2315.104166666667000000
          15.875000000000000000
          362.479166666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'Option 6'
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
    object qrcbNotes: TQRChildBand
      Left = 30
      Top = 459
      Width = 734
      Height = 50
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = qrcbNotesBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        132.291666666666700000
        1942.041666666667000000)
      ParentBand = qrgQuote
      object qrlNotes: TgtQRLabel
        Left = 12
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
          31.750000000000000000
          21.166666666666670000
          119.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NOTES'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrrchTextNotes: TgtQRRichText
        Left = 12
        Top = 26
        Width = 701
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          58.208333333333330000
          31.750000000000000000
          68.791666666666670000
          1854.729166666667000000)
        Alignment = taLeftJustify
        AutoStretch = False
        Color = clWindow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
      end
    end
    object qrbTemplateFitting: TQRBand
      Left = 30
      Top = 560
      Width = 734
      Height = 34
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = qrbTemplateFittingAfterPrint
      AlignToBottom = False
      BeforePrint = qrbTemplateFittingBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        89.958333333333330000
        1942.041666666667000000)
      BandType = rbGroupFooter
      object gtQRShape10: TgtQRShape
        Left = 2
        Top = -1
        Width = 150
        Height = 26
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          68.791666666666670000
          5.291666666666667000
          -2.645833333333333000
          396.875000000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShapeTemplate: TgtQRShape
        Left = 151
        Top = -1
        Width = 145
        Height = 26
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          68.791666666666670000
          399.520833333333300000
          -2.645833333333333000
          383.645833333333300000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel3: TgtQRLabel
        Left = 7
        Top = 5
        Width = 130
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          18.520833333333330000
          13.229166666666670000
          343.958333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Template, Fitting & Delivery'
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
      object qrlblTemplatePrice: TgtQRLabel
        Left = 230
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
          608.541666666666700000
          13.229166666666670000
          74.083333333333330000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #163'0.00'
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
    object qrbContractLineFooter: TQRChildBand
      Left = 30
      Top = 623
      Width = 734
      Height = 58
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = qrbContractLineFooterAfterPrint
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        153.458333333333300000
        1942.041666666667000000)
      ParentBand = qrbOptionSummary
      object gtQRLabel2: TgtQRLabel
        Left = 9
        Top = 24
        Width = 160
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          23.812500000000000000
          63.500000000000000000
          423.333333333333300000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '(All prices are Excluding VAT)'
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
    object qrcbAvailability: TQRChildBand
      Left = 30
      Top = 681
      Width = 734
      Height = 52
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = qrcbAvailabilityBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        137.583333333333300000
        1942.041666666667000000)
      ParentBand = qrbContractLineFooter
      object QRLabel9: TgtQRLabel
        Left = 12
        Top = 7
        Width = 83
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          31.750000000000000000
          18.520833333333330000
          219.604166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CONDITIONS:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrrchTextAvailability: TgtQRRichText
        Left = 12
        Top = 26
        Width = 689
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          58.208333333333330000
          31.750000000000000000
          68.791666666666670000
          1822.979166666667000000)
        Alignment = taLeftJustify
        AutoStretch = False
        Color = clWindow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
      end
    end
    object qrbOptionSummary: TQRChildBand
      Left = 30
      Top = 594
      Width = 734
      Height = 29
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = qrbOptionSummaryAfterPrint
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        76.729166666666670000
        1942.041666666667000000)
      ParentBand = qrbTemplateFitting
      object qrlblColourOptions: TgtQRLabel
        Left = 7
        Top = 6
        Width = 72
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          18.520833333333330000
          15.875000000000000000
          190.500000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Colour Options'
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
      object qrtxtOptionColours1: TgtQRRichText
        Left = 174
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
          460.375000000000000000
          15.875000000000000000
          304.270833333333300000)
        Alignment = taLeftJustify
        AutoStretch = True
        Color = clWindow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'qrtxtOptionColours1')
      end
      object qrtxtOptionColours2: TgtQRRichText
        Left = 318
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
          841.375000000000000000
          15.875000000000000000
          304.270833333333300000)
        Alignment = taLeftJustify
        AutoStretch = True
        Color = clWindow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'qrtxtOptionColours2')
      end
      object qrtxtOptionColours3: TgtQRRichText
        Left = 462
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
          1222.375000000000000000
          15.875000000000000000
          304.270833333333300000)
        Alignment = taLeftJustify
        AutoStretch = True
        Color = clWindow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'qrtxtOptionColours3')
      end
      object qrtxtOptionColours4: TgtQRRichText
        Left = 606
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
          1603.375000000000000000
          15.875000000000000000
          304.270833333333300000)
        Alignment = taLeftJustify
        AutoStretch = True
        Color = clWindow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'qrtxtOptionColours4')
      end
      object qrtxtOptionColours5: TgtQRRichText
        Left = 750
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
          1984.375000000000000000
          15.875000000000000000
          304.270833333333300000)
        Alignment = taLeftJustify
        AutoStretch = True
        Color = clWindow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'qrtxtOptionColours'
          '5')
      end
      object qrtxtOptionColours6: TgtQRRichText
        Left = 894
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
          2365.375000000000000000
          15.875000000000000000
          304.270833333333300000)
        Alignment = taLeftJustify
        AutoStretch = True
        Color = clWindow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'qrtxtOptionColours'
          '6')
      end
    end
  end
  object qryReport: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Contract_Quote.Contract_Quote,'
      '        Contract_Quote.Quote_Number,'
      '        Contract_Quote.Contract_Date,'
      '        Contract_Quote.Contract_Quote_Number,'
      '        Contract_Quote.Customer,'
      '        Contract_Quote.Contract_Description,'
      '        Contract_Quote.Developer,'
      '        Contract_Quote.Site_Location,'
      '        Contract_Quote.Notes,'
      '        Contract_Quote.Customer_Name,'
      '        Contract_Quote.Operator,'
      '        Operator.Operator_Name,'
      '        Contract_Quote.Account_Manager,'
      '        Account_Manager.Operator_Name as Account_Manager_Name,'
      '        Account_Manager.Telephone_Number as AM_Telephone_Number,'
      '        Contract_Quote.Contact_Name'
      'FROM Operator AS Account_Manager'
      '      RIGHT JOIN (Operator'
      '      INNER JOIN Contract_Quote'
      '        ON Operator.Operator = Contract_Quote.Operator)'
      
        '        ON Account_Manager.Operator = Contract_Quote.Account_Man' +
        'ager'
      'WHERE Contract_quote = :Contract_Quote')
    Left = 3
    Top = 65534
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Contract_Quote'
        ParamType = ptUnknown
      end>
  end
  object dtsReport: TDataSource
    DataSet = qryReport
    Left = 120
  end
  object qryCompany: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * from company'
      'where company = 1')
    Left = 350
    Top = 23
  end
  object qryCustomer: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select Customer, Customer_name,'
      'Street,'
      'Locale,'
      'Town_City,'
      'postcode,'
      'County_State,'
      'Vat_Rate,'
      'Credit_Status,'
      'Installation_Price,'
      'Survey_Price,'
      'Delivery_Price'
      'from Customer, VAT'
      'where Customer = :Customer and'
      'Customer.VAT = Vat.Vat')
    Left = 582
    Top = 22
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Customer'
        ParamType = ptUnknown
      end>
  end
  object dtsAddress: TDataSource
    Left = 502
    Top = 19
  end
  object qryAddress: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select *'
      'from Address'
      'where Address = :Address')
    Left = 654
    Top = 27
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Address'
        ParamType = ptUnknown
      end>
  end
  object qrygetNotes: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from Notes'
      'where notes_code = :Notes_Code'
      'order by notes_code, notes_line')
    Left = 726
    Top = 29
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Notes_Code'
        ParamType = ptUnknown
      end>
  end
  object qryContractLine: TFDQuery
    ConnectionName = 'wt'
    MasterSource = dtsReport
    SQL.Strings = (
      'Select * '
      'from Contract_Quote_Line'
      'Where Contract_Quote = :Contract_Quote'
      'Order By Line_Number')
    Left = 72
    Top = 218
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Contract_Quote'
        ParamType = ptUnknown
      end>
  end
  object qryContractOption: TFDQuery
    ConnectionName = 'WT'
    MasterSource = dtsContractLine
    SQL.Strings = (
      'Select *'
      'FROM Contract_Quote_Line_Option'
      'WHERE Contract_Quote = :Contract_Quote AND'
      'Line_Number = :Line_Number'
      'ORDER BY Option_Number')
    Left = 272
    Top = 218
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Contract_Quote'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line_Number'
        ParamType = ptUnknown
      end>
  end
  object dtsContractLine: TDataSource
    DataSet = qryContractLine
    Left = 152
    Top = 216
  end
  object qryOptionHeaders: TFDQuery
    ConnectionName = 'WT'
    MasterSource = dtsReport
    SQL.Strings = (
      'Select Option_Description'
      'FROM Contract_Quote_Line_Option'
      'WHERE Contract_Quote = :Contract_Quote AND'
      'Line_Number = 1'
      'ORDER BY Option_Number')
    Left = 376
    Top = 218
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Contract_Quote'
        ParamType = ptUnknown
      end>
  end
  object qryOptionHeadersHeight: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Select Option_Description'
      'FROM Contract_Quote_Line_Option'
      'WHERE Contract_Quote = :Contract_Quote AND'
      'Line_Number = 1'
      'ORDER BY Option_Number')
    Left = 480
    Top = 218
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Contract_Quote'
        ParamType = ptUnknown
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
      'Email_Address,'
      'Web_Address '
      'from Company')
    Left = 432
    Top = 201
  end
  object qryOptionColours: TFDQuery
    ConnectionName = 'WT'
    MasterSource = dtsContractLine
    SQL.Strings = (
      'SELECT  Contract_Quote.Contract_Quote,'
      '        Contract_Quote_Line_Option.Line_Number,'
      '        Contract_Quote_Line_Option.Option_Number,'
      '        Customer_Worktop.Group_Number,'
      '        Customer_Worktop.Worktop,'
      '        Worktop.Description as Worktop_Description'
      'FROM ((Contract_Quote'
      '        INNER JOIN Contract_Quote_Line'
      
        '          ON Contract_Quote.Contract_Quote = Contract_Quote_Line' +
        '.Contract_Quote)'
      '        INNER JOIN Contract_Quote_Line_Option'
      
        '          ON (Contract_Quote_Line.Line_Number = Contract_Quote_L' +
        'ine_Option.Line_Number)'
      
        '            AND (Contract_Quote_Line.Contract_Quote = Contract_Q' +
        'uote_Line_Option.Contract_Quote))'
      '        INNER JOIN (Worktop'
      '        INNER JOIN Customer_Worktop'
      '          ON Worktop.Worktop = Customer_Worktop.Worktop)'
      
        '          ON (Contract_Quote_Line_Option.Group_Number = Customer' +
        '_Worktop.Group_Number)'
      
        '            AND (Contract_Quote.Customer = Customer_Worktop.Cust' +
        'omer)'
      'WHERE Contract_Quote.Contract_Quote = :Contract_Quote AND'
      '      Contract_Quote_Line_Option.Line_Number = 1'
      'ORDER BY Contract_Quote_Line_Option.Option_Number'
      '')
    Left = 694
    Top = 219
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Contract_Quote'
        ParamType = ptUnknown
      end>
  end
end
