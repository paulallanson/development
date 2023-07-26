object PBRPRepsPerformFrm: TPBRPRepsPerformFrm
  Left = 0
  Top = 0
  Width = 1171
  Height = 694
  Caption = 'Rep Performance Report'
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
  object QckRpRpsPrft: TQuickRep
    Left = 24
    Top = 8
    Width = 1123
    Height = 794
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    BeforePrint = QckRpRpsPrftBeforePrint
    DataSet = SQLRepPrft
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
      50.000000000000000000
      50.000000000000000000
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
    object PageHeader: TQRBand
      Left = 19
      Top = 38
      Width = 1085
      Height = 59
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = PageHeaderBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        156.104166666666700000
        2870.729166666667000000)
      BandType = rbPageHeader
      object QRSysData1: TQRSysData
        Left = 484
        Top = 8
        Width = 117
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          1280.583333333333000000
          21.166666666666670000
          309.562500000000000000)
        Alignment = taCenter
        AlignToBand = True
        AutoSize = True
        Color = clWhite
        Data = qrsReportTitle
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        FontSize = 14
      end
      object PageNumQrl: TQRLabel
        Left = 8
        Top = 32
        Width = 75
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          84.666666666666670000
          198.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'PageNumQrl'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object WhichSideQRL: TQRLabel
        Left = 8
        Top = 8
        Width = 52
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
          137.583333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'LeftRight'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlblTitle: TQRLabel
        Left = 331
        Top = 8
        Width = 422
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.854166666666670000
          875.770833333333300000
          21.166666666666670000
          1116.541666666667000000)
        Alignment = taCenter
        AlignToBand = True
        AutoSize = True
        AutoStretch = False
        Caption = 'Reps Annual Performance Report - Run Date: '
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
        Left = 498
        Top = 32
        Width = 88
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1317.625000000000000000
          84.666666666666670000
          232.833333333333300000)
        Alignment = taCenter
        AlignToBand = True
        AutoSize = True
        AutoStretch = False
        Caption = 'Financial Year:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object PageHeaderLeft: TQRChildBand
      Left = 19
      Top = 97
      Width = 1085
      Height = 50
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = PageHeaderLeftBeforePrint
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        132.291666666666700000
        2870.729166666667000000)
      ParentBand = PageHeader
      object QRLabel1: TQRLabel
        Left = 2
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
          5.291666666666667000
          0.000000000000000000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Period'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object PageHeaderRight: TQRChildBand
      Left = 19
      Top = 197
      Width = 1085
      Height = 50
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = PageHeaderRightBeforePrint
      Color = clWhite
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        132.291666666666700000
        2870.729166666667000000)
      ParentBand = PageHeaderMiddle
      object QRLabel11: TQRLabel
        Left = 2
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
          5.291666666666667000
          0.000000000000000000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Period'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QRSubDetailpg1: TQRSubDetail
      Left = 19
      Top = 252
      Width = 1085
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = QRSubDetailpg1BeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        13.229166666666670000
        2870.729166666667000000)
      Master = QckRpRpsPrft
      DataSet = SQLRepPrft
      FooterBand = QRFootPg1
      PrintBefore = False
      PrintIfEmpty = True
    end
    object QRFootPg1: TQRBand
      Left = 19
      Top = 287
      Width = 1085
      Height = 50
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = QRFootPg1AfterPrint
      AlignToBottom = False
      BeforePrint = QRFootPg1BeforePrint
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        132.291666666666700000
        2870.729166666667000000)
      BandType = rbGroupFooter
      object QRLabel2: TQRLabel
        Left = 2
        Top = 13
        Width = 45
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          5.291666666666667000
          34.395833333333340000
          119.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Totals:- '
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
    object QRGrpHeadPg2: TQRBand
      Left = 19
      Top = 337
      Width = 1085
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = QRGrpHeadPg2BeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        13.229166666666670000
        2870.729166666667000000)
      BandType = rbGroupHeader
    end
    object QRSubDetailpg2: TQRSubDetail
      Left = 19
      Top = 347
      Width = 1085
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = QRSubDetailpg2BeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        13.229166666666670000
        2870.729166666667000000)
      Master = QckRpRpsPrft
      DataSet = SQLRepPrft
      FooterBand = QRFootPg2
      HeaderBand = QRGrpHeadPg2
      PrintBefore = False
      PrintIfEmpty = True
    end
    object QRGrpPg1: TQRGroup
      Left = 19
      Top = 247
      Width = 1085
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = QRGrpPg1BeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        13.229166666666670000
        2870.729166666667000000)
      Expression = 'sqlrepprft.period'
      FooterBand = QRDtlpg1
      Master = QRSubDetailpg1
      ReprintOnNewPage = False
    end
    object QRDtlpg1: TQRBand
      Left = 19
      Top = 257
      Width = 1085
      Height = 30
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = QRDtlpg1BeforePrint
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        79.375000000000000000
        2870.729166666667000000)
      BandType = rbGroupFooter
      object QRDBText1: TQRDBText
        Left = 0
        Top = 0
        Width = 76
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
          201.083333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = SQLRepPrft
        DataField = 'period_description'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
    end
    object QRGrpPg2: TQRGroup
      Left = 19
      Top = 342
      Width = 1085
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = QRGrpPg2BeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        13.229166666666670000
        2870.729166666667000000)
      Expression = 'sqlrepprft.period'
      FooterBand = QRDtlpg2
      Master = QRSubDetailpg2
      ReprintOnNewPage = False
    end
    object QRDtlpg2: TQRBand
      Left = 19
      Top = 352
      Width = 1085
      Height = 30
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = QRDtlpg2BeforePrint
      Color = clWhite
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        79.375000000000000000
        2870.729166666667000000)
      BandType = rbGroupFooter
      object QRDBText4: TQRDBText
        Left = 0
        Top = 0
        Width = 76
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
          201.083333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = SQLRepPrft
        DataField = 'period_description'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
    end
    object QRFootPg2: TQRBand
      Left = 19
      Top = 382
      Width = 1085
      Height = 50
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = QRFootPg2AfterPrint
      AlignToBottom = False
      BeforePrint = QRFootPg2BeforePrint
      Color = clWhite
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        132.291666666666700000
        2870.729166666667000000)
      BandType = rbGroupFooter
      object QRLabel3: TQRLabel
        Left = 2
        Top = 13
        Width = 45
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          5.291666666666667000
          34.395833333333340000
          119.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Totals:- '
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
    object PageHeaderMiddle: TQRChildBand
      Left = 19
      Top = 147
      Width = 1085
      Height = 50
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = PageHeaderMiddleBeforePrint
      Color = clWhite
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        132.291666666666700000
        2870.729166666667000000)
      ParentBand = PageHeaderLeft
      object QRLabel4: TQRLabel
        Left = 2
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
          5.291666666666667000
          0.000000000000000000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Period'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QRGrpHeadPg3: TQRBand
      Left = 19
      Top = 432
      Width = 1085
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = QRGrpHeadPg3BeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        13.229166666666670000
        2870.729166666667000000)
      BandType = rbGroupHeader
    end
    object QRGrpPg3: TQRGroup
      Left = 19
      Top = 437
      Width = 1085
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = QRGrpPg3BeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        13.229166666666670000
        2870.729166666667000000)
      Expression = 'sqlrepprft.period'
      FooterBand = QRDtlPg3
      Master = QRSubDetailpg3
      ReprintOnNewPage = False
    end
    object QRSubDetailpg3: TQRSubDetail
      Left = 19
      Top = 442
      Width = 1085
      Height = 5
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = QRSubDetailpg3BeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        13.229166666666670000
        2870.729166666667000000)
      Master = QckRpRpsPrft
      DataSet = SQLRepPrft
      FooterBand = QRFootpg3
      HeaderBand = QRGrpHeadPg3
      PrintBefore = False
      PrintIfEmpty = True
    end
    object QRDtlPg3: TQRBand
      Left = 19
      Top = 447
      Width = 1085
      Height = 30
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = QRDtlPg3BeforePrint
      Color = clWhite
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        79.375000000000000000
        2870.729166666667000000)
      BandType = rbGroupFooter
      object QRDBText2: TQRDBText
        Left = 0
        Top = 0
        Width = 76
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
          201.083333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = SQLRepPrft
        DataField = 'period_description'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 7
      end
    end
    object QRFootpg3: TQRBand
      Left = 19
      Top = 477
      Width = 1085
      Height = 50
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = QRFootpg3BeforePrint
      Color = clWhite
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        132.291666666666700000
        2870.729166666667000000)
      BandType = rbGroupFooter
      object QRLabel5: TQRLabel
        Left = 2
        Top = 13
        Width = 45
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          5.291666666666667000
          34.395833333333340000
          119.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Totals:- '
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
      object QRLblTotSell: TQRLabel
        Left = 155
        Top = 3
        Width = 248
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          410.104166666667000000
          7.937500000000000000
          656.166666666667000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 
          '----------------------------------------------------------------' +
          '-------------------'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = False
        FontSize = 7
      end
    end
  end
  object DataSRCRepPrft: TDataSource
    Left = 206
    Top = 78
  end
  object SQLRepPrft: TFDQuery
    ConnectionName = 'PB'
    MasterSource = DataSRCRepPrft
    SQL.Strings = (
      'SELECT Rep_Budget.Rep,'
      #9'Rep_Budget.Period,'
      #9'Rep_Budget.Turnover_Value,'
      #9'Rep_Budget.Profit_Value,'
      #9'Period.Description as Period_Description,'
      #9'Rep.Name as Rep_Name,'
      #9'sum(int_sel.sel4) as Total_Sales,'
      #9'sum(int_sel.sel5) as Total_Cost'
      'FROM Rep '
      #9'RIGHT JOIN (Period '
      #9'RIGHT JOIN (Int_Sel '
      #9'RIGHT JOIN Rep_Budget ON '
      #9#9'(Int_Sel.Sel2 = Rep_Budget.Period) AND '
      #9#9'(Int_Sel.Sel1 = Rep_Budget.Rep)) ON '
      #9#9'Period.Period = Rep_Budget.Period) ON '
      #9#9'Rep.Rep = Rep_Budget.Rep'
      
        'WHERE ((rep_budget.period >= :period_from) and (rep_budget.perio' +
        'd <= :period_to)) AND'
      '  ((rep_budget.rep = :Rep) or (:Rep = 0))'
      'GROUP BY'
      '  Rep_Budget.Rep,'
      #9'Rep_Budget.Period,'
      #9'Rep_Budget.Turnover_Value,'
      #9'Rep_Budget.Profit_Value,'
      #9'Period.Description,'
      #9'Rep.Name'
      'ORDER BY Rep_Budget.Period, rep.name'
      ''
      ' ')
    Left = 334
    Top = 78
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'period_from'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'period_to'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Rep'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Rep'
        ParamType = ptUnknown
      end>
  end
  object SQLRep: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select '#9'distinct rep.rep,'
      #9'rep.name as rep_name'
      'from '#9'Rep_Budget,'
      #9'rep'
      
        'where (((Rep_Budget.period >= :period_from) and (Rep_Budget.peri' +
        'od <= :period_to)) and'
      #9'Rep_Budget.rep = rep.rep and'
      '  ((Rep_Budget.Rep = :Rep) or (:Rep = 0)))'
      'order by  rep.name'
      '')
    Left = 446
    Top = 78
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'period_from'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'period_to'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'rep'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Rep'
        ParamType = ptUnknown
      end>
  end
  object oldSQLRepPrft: TFDQuery
    ConnectionName = 'PB'
    MasterSource = DataSRCRepPrft
    SQL.Strings = (
      'select'
      '  int_sel.sel1 as Rep,'
      #9'rep.name as rep_name,'
      #9'int_sel.sel2 as Period,'
      #9'period.description as period_description,'
      #9'sum(int_sel.sel3) as Total_Sales,'
      #9'sum(int_sel.sel4) as Total_Cost'
      'from '#9'int_sel,'
      #9'rep,'
      #9'period'
      
        'where ((((int_sel.sel2 >= :period_from) and (int_sel.sel2 <= :pe' +
        'riod_to)) and'
      #9'int_sel.sel1 = rep.rep and'
      #9'int_sel.sel2 = period.period)  and'
      '  ((int_sel.sel1 = :Rep) or (:Rep = 0)))'
      'group by'
      '  int_sel.sel1,'
      '  rep.name,'
      '  int_sel.sel2,'
      #9'period.description'
      'order by int_sel.sel2, rep.name'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 598
    Top = 78
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'period_from'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'period_to'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Rep'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Rep'
        ParamType = ptUnknown
      end>
  end
end
