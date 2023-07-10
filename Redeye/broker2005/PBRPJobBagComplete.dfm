object PBRPJobBagCompleteFrm: TPBRPJobBagCompleteFrm
  Left = 44
  Top = 50
  Width = 1211
  Height = 579
  VertScrollBar.Position = 2
  Caption = 'Job Bag WIP report'
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
    Left = 32
    Top = 22
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
    Font.Height = -11
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
      20.000000000000000000
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
    object QRBand2: TQRBand
      Left = 19
      Top = 38
      Width = 1097
      Height = 99
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Frame.Style = psDashDot
      AlignToBottom = False
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        261.937500000000000000
        2902.479166666667000000)
      BandType = rbPageHeader
      object qrlblTitle: TQRLabel
        Left = 472
        Top = 2
        Width = 152
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          1248.833333333333000000
          5.291666666666667000
          402.166666666666700000)
        Alignment = taCenter
        AlignToBand = True
        AutoSize = True
        AutoStretch = False
        Caption = 'Job Bag WIP Report'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 14
      end
      object QRLabel3: TQRLabel
        Left = 218
        Top = 80
        Width = 144
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          576.791666666666700000
          211.666666666666700000
          381.000000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Customer Name & Description'
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
      object RunDateQRLabel: TQRLabel
        Left = 998
        Top = 5
        Width = 83
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          2640.541666666667000000
          13.229166666666670000
          219.604166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'RunDateQRLabel'
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
      object QRLabel2: TQRLabel
        Left = 8
        Top = 80
        Width = 40
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          21.166666666666670000
          211.666666666666700000
          105.833333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Job Bag'
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
      object QuantityLbl: TQRLabel
        Left = 732
        Top = 80
        Width = 41
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1936.750000000000000000
          211.666666666666700000
          108.479166666666700000)
        Alignment = taRightJustify
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
      object QRLabel5: TQRLabel
        Left = 802
        Top = 80
        Width = 54
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2121.958333333333000000
          211.666666666666700000
          142.875000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Cost Value'
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
      object QRLabel6: TQRLabel
        Left = 879
        Top = 80
        Width = 59
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2325.687500000000000000
          211.666666666666700000
          156.104166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Sales Value'
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
      object QRLabel7: TQRLabel
        Left = 1056
        Top = 80
        Width = 39
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2794.000000000000000000
          211.666666666666700000
          103.187500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'On Hold'
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
      object QRLabel8: TQRLabel
        Left = 1023
        Top = 64
        Width = 29
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2706.687500000000000000
          169.333333333333300000
          76.729166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '%age'
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
      object QRLabel9: TQRLabel
        Left = 1020
        Top = 80
        Width = 33
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2698.750000000000000000
          211.666666666666700000
          87.312500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Margin'
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
      object QRLblTotBy: TQRLabel
        Left = 519
        Top = 32
        Width = 58
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1373.187500000000000000
          84.666666666666670000
          153.458333333333300000)
        Alignment = taCenter
        AlignToBand = True
        AutoSize = True
        AutoStretch = False
        Caption = 'QRLblTotBy'
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
      object QRSysData1: TQRSysData
        Left = 997
        Top = 25
        Width = 66
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          2637.895833333333000000
          66.145833333333330000
          174.625000000000000000)
        Alignment = taLeftJustify
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
        Text = 'Page '
        Transparent = False
        FontSize = 8
      end
      object QRLabel11: TQRLabel
        Left = 136
        Top = 80
        Width = 69
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          359.833333333333300000
          211.666666666666700000
          182.562500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Date Required'
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
      object QRLabel4: TQRLabel
        Left = 664
        Top = 80
        Width = 49
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1756.833333333333000000
          211.666666666666700000
          129.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Start Date'
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
      object QRLabel16: TQRLabel
        Left = 64
        Top = 80
        Width = 59
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          169.333333333333300000
          211.666666666666700000
          156.104166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Date Raised'
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
      object QRLabel1: TQRLabel
        Left = 554
        Top = 80
        Width = 97
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1465.791666666667000000
          211.666666666666700000
          256.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Customer Order No.'
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
      object QRLabel10: TQRLabel
        Left = 971
        Top = 81
        Width = 33
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          2569.104166666667000000
          214.312500000000000000
          87.312500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Margin'
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
      object QRLabel12: TQRLabel
        Left = 448
        Top = 80
        Width = 90
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1185.333333333333000000
          211.666666666666700000
          238.125000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Account Manager.'
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
    object QRSubDetail1: TQRSubDetail
      Left = 19
      Top = 177
      Width = 1097
      Height = 35
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = QRSubDetail1AfterPrint
      AlignToBottom = False
      BeforePrint = QRSubDetail1BeforePrint
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        92.604166666666670000
        2902.479166666667000000)
      Master = qrpDetails
      DataSet = qryReport
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBQuantityText1: TQRDBText
        Left = 684
        Top = 2
        Width = 89
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1809.750000000000000000
          5.291666666666667000
          235.479166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Job_Bag_Quantity'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object TotalCostLbl: TQRLabel
        Left = 795
        Top = 2
        Width = 60
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2103.437500000000000000
          5.291666666666667000
          158.750000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'TotalCostLbl'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object TotalSellLbl: TQRLabel
        Left = 884
        Top = 2
        Width = 55
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2338.916666666667000000
          5.291666666666667000
          145.520833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'TotalSellLbl'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object MarginQRBLabel: TQRLabel
        Left = 973
        Top = 2
        Width = 33
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2574.395833333333000000
          5.291666666666667000
          87.312500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Margin'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object MargPercQRLabel: TQRLabel
        Left = 1022
        Top = 2
        Width = 31
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2704.041666666667000000
          5.291666666666667000
          82.020833333333330000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '%Age'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText1: TQRDBText
        Left = 8
        Top = 2
        Width = 43
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          21.166666666666670000
          5.291666666666667000
          113.770833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Job_Bag'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLblDesc: TQRLabel
        Left = 216
        Top = 16
        Width = 337
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          571.500000000000000000
          42.333333333333330000
          891.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'qrlblDesc'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText2: TQRDBText
        Left = 136
        Top = 2
        Width = 82
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          359.833333333333300000
          5.291666666666667000
          216.958333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Goods_Required'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText7: TQRDBText
        Left = 664
        Top = 2
        Width = 52
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1756.833333333333000000
          5.291666666666667000
          137.583333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Date_Start'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText9: TQRDBText
        Left = 64
        Top = 2
        Width = 52
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          169.333333333333300000
          5.291666666666667000
          137.583333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Date_Point'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLblCust: TQRLabel
        Left = 216
        Top = 2
        Width = 52
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          571.500000000000000000
          5.291666666666667000
          137.583333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRLblCust'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object RepQRFooter: TQRBand
      Left = 19
      Top = 254
      Width = 1097
      Height = 31
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = RepQRFooterBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        82.020833333333330000
        2902.479166666667000000)
      BandType = rbGroupFooter
      object Totals: TQRLabel
        Left = 585
        Top = 8
        Width = 186
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1547.812500000000000000
          21.166666666666670000
          492.125000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Total Sales Value'
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
      object QRLblGroupSales: TQRLabel
        Left = 849
        Top = 8
        Width = 97
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2246.312500000000000000
          21.166666666666670000
          256.645833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRLblGroupSales'
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
      object QRShape1: TQRShape
        Left = 686
        Top = 1
        Width = 369
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          1815.041666666667000000
          2.645833333333333000
          976.312500000000000000)
        Pen.Width = 2
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLblGroupCost: TQRLabel
        Left = 796
        Top = 8
        Width = 61
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2106.083333333333000000
          21.166666666666670000
          161.395833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'lblGrpTotal'
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
      object QRlblGroupMargin: TQRLabel
        Left = 910
        Top = 8
        Width = 97
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2407.708333333333000000
          21.166666666666670000
          256.645833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRLblGroupSales'
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
      object QRlblGroupMarginPerc: TQRLabel
        Left = 958
        Top = 8
        Width = 97
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2534.708333333333000000
          21.166666666666670000
          256.645833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRLblGroupSales'
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
    end
    object qrSummary: TQRBand
      Left = 19
      Top = 285
      Width = 1097
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = qrSummaryBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        84.666666666666670000
        2902.479166666667000000)
      BandType = rbSummary
      object QRLabel15: TQRLabel
        Left = 695
        Top = 7
        Width = 75
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1838.854166666667000000
          18.520833333333330000
          198.437500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Report Totals'
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
      object QRLblReportSales: TQRLabel
        Left = 841
        Top = 7
        Width = 100
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2225.145833333333000000
          18.520833333333330000
          264.583333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRLblReportSales'
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
      object QRShape2: TQRShape
        Left = 685
        Top = -3
        Width = 369
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          1812.395833333333000000
          -7.937500000000000000
          976.312500000000000000)
        Pen.Width = 2
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLblReportCost: TQRLabel
        Left = 778
        Top = 7
        Width = 78
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2058.458333333333000000
          18.520833333333330000
          206.375000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'lblReportTotal'
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
      object QRlblReportMargin: TQRLabel
        Left = 903
        Top = 7
        Width = 104
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2389.187500000000000000
          18.520833333333330000
          275.166666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRlblReportMargin'
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
      object QRlblReportMarginPerc: TQRLabel
        Left = 926
        Top = 7
        Width = 129
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2450.041666666667000000
          18.520833333333330000
          341.312500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRlblReportMarginPerc'
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
    end
    object RepQRGroup: TQRGroup
      Left = 19
      Top = 137
      Width = 1097
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        42.333333333333330000
        2902.479166666667000000)
      FooterBand = RepQRFooter
      Master = QRSubDetail1
      ReprintOnNewPage = False
      object GrpByQRDBText: TQRDBText
        Left = 11
        Top = 0
        Width = 82
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          29.104166666666670000
          0.000000000000000000
          216.958333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
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
    object JobQRGroup: TQRGroup
      Left = 19
      Top = 153
      Width = 1097
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = JobQRGroupBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.500000000000000000
        2902.479166666667000000)
      Expression = 'qryReport.Job_Bag'
      FooterBand = JobQRFooter
      Master = QRSubDetail1
      ReprintOnNewPage = False
      object QRLabel13: TQRLabel
        Left = 9
        Top = 4
        Width = 47
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          23.812500000000000000
          10.583333333333330000
          124.354166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Job Bag:'
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
      object QRDBText5: TQRDBText
        Left = 64
        Top = 4
        Width = 43
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          169.333333333333300000
          10.583333333333330000
          113.770833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Job_Bag'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel14: TQRLabel
        Left = 152
        Top = 4
        Width = 67
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          402.166666666666700000
          10.583333333333330000
          177.270833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Description:'
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
      object QRDBText6: TQRDBText
        Left = 232
        Top = 4
        Width = 78
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          613.833333333333300000
          10.583333333333330000
          206.375000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Job_Bag_Descr'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object JobQRFooter: TQRBand
      Left = 19
      Top = 212
      Width = 1097
      Height = 42
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = JobQRFooterAfterPrint
      AlignToBottom = False
      BeforePrint = JobQRFooterBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        111.125000000000000000
        2902.479166666667000000)
      BandType = rbGroupFooter
      object qrshapeJobBag: TQRShape
        Left = 686
        Top = -4
        Width = 369
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          31.750000000000000000
          1815.041666666667000000
          -10.583333333333330000
          976.312500000000000000)
        Pen.Width = 2
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLblJobSales: TQRLabel
        Left = 889
        Top = 5
        Width = 52
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2352.145833333333000000
          13.229166666666670000
          137.583333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'lblGrpTotal'
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
      object QRLblJobCost: TQRLabel
        Left = 805
        Top = 5
        Width = 52
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2129.895833333333000000
          13.229166666666670000
          137.583333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'lblGrpTotal'
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
      object QRlblMargin: TQRLabel
        Left = 949
        Top = 5
        Width = 58
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2510.895833333333000000
          13.229166666666670000
          153.458333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRlblMargin'
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
      object QRlblMarginPerc: TQRLabel
        Left = 975
        Top = 5
        Width = 80
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2579.687500000000000000
          13.229166666666670000
          211.666666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRlblMarginPerc'
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
      object qrdbJobNumber: TQRDBText
        Left = 8
        Top = 5
        Width = 43
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          13.229166666666670000
          113.770833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Job_Bag'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrdbJobDate: TQRDBText
        Left = 136
        Top = 5
        Width = 82
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          359.833333333333300000
          13.229166666666670000
          216.958333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Goods_Required'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrdbJobDescription: TQRDBText
        Left = 216
        Top = 22
        Width = 361
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          571.500000000000000000
          58.208333333333330000
          955.145833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Job_Bag_Descr'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrdbJobQuantity: TQRDBText
        Left = 733
        Top = 5
        Width = 41
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1939.395833333333000000
          13.229166666666670000
          108.479166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Quantity'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlblJobBagTotal: TQRLabel
        Left = 688
        Top = 5
        Width = 35
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1820.333333333333000000
          13.229166666666670000
          92.604166666666670000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Totals'
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
      object QRDBText8: TQRDBText
        Left = 664
        Top = 5
        Width = 52
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1756.833333333333000000
          13.229166666666670000
          137.583333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Date_Start'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrdbJobCustomer: TQRDBText
        Left = 216
        Top = 5
        Width = 225
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          571.500000000000000000
          13.229166666666670000
          595.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Customer_Name'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText10: TQRDBText
        Left = 64
        Top = 5
        Width = 52
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          169.333333333333300000
          13.229166666666670000
          137.583333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Date_Point'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText3: TQRDBText
        Left = 555
        Top = 5
        Width = 105
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1468.437500000000000000
          13.229166666666670000
          277.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Cust_Order_No'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText4: TQRDBText
        Left = 1060
        Top = 5
        Width = 33
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2804.583333333333000000
          13.229166666666670000
          87.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'On_Hold'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText11: TQRDBText
        Left = 448
        Top = 5
        Width = 105
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1185.333333333333000000
          13.229166666666670000
          277.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Account_Manager'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
  end
  object qryReport: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT'
      '      Job_Bag_Line_Dets.Job_Bag,'
      #9'    Job_Bag_Line_Dets.Job_Bag_Line,'
      #9'    Job_Bag_Line_Dets.Job_Bag_Line_Descr,'
      #9'    Customer.Name AS Customer_Name,'
      #9'    Supplier.Name AS Supplier_Name,'
      #9'    Job_Bag_Line_Dets.Job_Bag_Line_Cost,'
      #9'    Job_Bag_Line_Dets.Job_Bag_Line_Sell,'
      #9'    Job_Bag_Line_Dets.Job_Bag_Quantity,'
      #9'    Job_Bag_Line_Dets.VAT_Code,'
      #9'    Job_Bag_Line_Dets.Job_Bag_Line_Type,'
      #9'    Job_Bag_Line_Dets.Purchase_Order,'
      #9'    Job_Bag_Line_Dets.Line, '
      #9'    Job_Bag.Cust_Order_No, '
      #9'    Rep.Rep, '
      #9'    Rep.Name AS Rep_Name, '
      #9'    Vat_Code.Vat_Rate, '
      #9'    Job_Bag.Date_Point, '
      #9'    Job_Bag.Date_Start, '
      #9'    Job_Bag.Quantity, '
      #9'    Job_Bag.Customer, '
      #9'    Job_Bag.Branch_No, '
      #9'    Customer_Branch.Name AS Customer_Branch_Name, '
      '      Customer.Analysis_Code_1, '
      '      Customer.Analysis_Code_2, '
      '      (SELECT CB.Account_Code '
      '       FROM Customer_Branch CB '
      '       WHERE CB.Customer = Customer_Branch.Inv_To_Customer AND '
      
        '             CB.Branch_No = Customer_Branch.Inv_To_Branch) AS Ac' +
        'count_Code, '
      #9'    Job_Bag_Line_Dets.Supplier, '
      #9'    Job_Bag_Line_Dets.Branch_No AS Supplier_Branch_no, '
      #9'    Supplier_Branch.Name AS Supplier_Branch_Name, '
      #9'    Purchase_OrderLine.Inactive, '
      '      Job_Bag.Job_Bag_Descr, '
      '      Job_Bag.Office_Contact, '
      '      Operator.Name as Account_Manager, '
      '      Job_Bag.Goods_Required, '
      '      Job_Bag.Ready_for_Invoicing, '
      '      Job_Bag_Line_Dets.Product_Type '
      'FROM Purchase_OrderLine'
      #9'    RIGHT JOIN (Vat_Code '
      #9'    INNER JOIN ((Supplier '
      #9'    INNER JOIN Supplier_Branch ON '
      #9#9'    Supplier.Supplier = Supplier_Branch.Supplier) '
      #9'    INNER JOIN (Customer '
      '      INNER JOIN ((Rep '
      #9'    INNER JOIN (Customer_Branch '
      #9'    INNER JOIN Job_Bag ON '
      #9#9'    (Customer_Branch.Branch_no = Job_Bag.Branch_No) AND '
      #9#9'    (Customer_Branch.Customer = Job_Bag.Customer)) ON '
      #9#9'    Rep.Rep = Job_Bag.Rep) '
      #9'    INNER JOIN Job_Bag_Line_Dets ON '
      #9#9'    Job_Bag.Job_Bag = Job_Bag_Line_Dets.Job_Bag) ON '
      #9#9'    Customer.Customer = Customer_Branch.Customer) ON '
      
        #9#9'    (Supplier_Branch.Branch_no = Job_Bag_Line_Dets.Branch_No) ' +
        'AND '
      
        #9#9'    (Supplier_Branch.Supplier = Job_Bag_Line_Dets.Supplier)) O' +
        'N '
      '        Vat_Code.Vat_Code = Job_Bag_Line_Dets.VAT_Code) ON '
      #9#9'    (Purchase_OrderLine.Line = Job_Bag_Line_Dets.Line) AND '
      
        #9#9'    (Purchase_OrderLine.Purchase_Order = Job_Bag_Line_Dets.Pur' +
        'chase_Order) '
      
        '      INNER JOIN Operator ON Job_Bag.Office_Contact = Operator.O' +
        'perator '
      'WHERE     (Job_Bag.Job_Bag_Status < 30) AND'
      '          (Job_Bag.On_Hold = '#39'N'#39') AND'
      
        '          ((Job_Bag.Invoice_This_Week = :Invoice_This_Week) OR (' +
        ':Invoice_This_Week = '#39'A'#39')) AND'
      
        '          ((Job_Bag.Production_Complete = :Production_Complete) ' +
        'OR (:Production_Complete = '#39'A'#39')) AND'
      '          ((Purchase_orderLine.InActive <> '#39'Y'#39') or'
      '           (Purchase_orderLine.Inactive is NULL)) AND'
      '          ((Job_Bag_Line_Dets.InActive = '#39'N'#39') or'
      '           (Job_Bag_Line_Dets.Inactive is NULL)) AND'
      '          ((Job_Bag.InActive = '#39'N'#39') or'
      '           (Job_Bag.Inactive is NULL)) AND'
      
        '          ((Job_bag.Goods_Required >= :Date_From) AND (Job_bag.G' +
        'oods_Required <= :Date_To)) AND'
      
        '          ((Job_Bag.Customer = :Customer) OR (:Customer = 0)) AN' +
        'D'
      
        '          ((Job_Bag.Office_Contact = :Office_Contact) OR (:Offic' +
        'e_Contact = 0))'
      ''
      ''
      '')
    Left = 550
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Invoice_This_Week'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Invoice_This_Week'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Production_Complete'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Production_Complete'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_From'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_To'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Office_Contact'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Office_Contact'
        ParamType = ptUnknown
      end>
  end
  object qryGetPOLine: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Purchase_OrderLine.Product_Type, Product_Type.Description'
      'from Purchase_OrderLine, Product_Type'
      'where Purchase_Order = :Purchase_Order and'
      'Purchase_OrderLine.Product_Type = Product_Type.Product_Type')
    Left = 755
    Top = 44
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end>
  end
  object qryGetProdType: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Product_Type.Product_Type, Product_Type.Description'
      'from Product_Type'
      'where Product_Type = :Product_Type')
    Left = 395
    Top = 44
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Product_Type'
        ParamType = ptUnknown
      end>
  end
  object qryGetSuppInvoice: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT '#9'Supplier_Invoice_Line.Supplier_Invoice,'
      #9'Supplier_Invoice_Line.Invoice_Line_No,'
      #9'Supplier_Invoice_Line.Qty_Invoiced,'
      #9'Supplier_Invoice_Line.Goods_Value,'
      #9'Price_Unit.Price_Unit_Factor'
      'FROM Price_Unit'
      '  INNER JOIN Supplier_Invoice_Line'
      '    ON Price_Unit.Price_Unit = Supplier_Invoice_Line.Price_Unit'
      'WHERE Job_Bag = :Job_Bag and Job_Bag_Line = :Job_Bag_Line')
    Left = 864
    Top = 46
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
  object qryGetSalesInvoice: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT '#9'Sales_Invoice_Line.Sales_Invoice, '
      #9'Sales_Invoice_Line.Invoice_Line_No, '
      #9'Sales_Invoice_Line.Qty_Invoiced, '
      #9'Sales_Invoice_Line.Goods_Value, '
      #9'Price_Unit.Price_Unit_Factor, '
      #9'SUM(Sales_Invoice_Add_charge.Amount) as Total_Charges'
      'FROM (Price_Unit '
      #9'INNER JOIN Sales_Invoice_Line '
      #9#9'ON Price_Unit.Price_Unit = Sales_Invoice_Line.Price_Unit) '
      #9'LEFT JOIN Sales_Invoice_Add_charge '
      
        #9#9'ON (Sales_Invoice_Line.Invoice_Line_No = Sales_Invoice_Add_cha' +
        'rge.Invoice_line_no) AND (Sales_Invoice_Line.Sales_Invoice = Sal' +
        'es_Invoice_Add_charge.Sales_Invoice)'
      'WHERE Job_Bag = :Job_Bag and Job_Bag_Line = :Job_Bag_Line'
      'GROUP BY'
      ' '#9'Sales_Invoice_Line.Sales_Invoice, '
      #9'Sales_Invoice_Line.Invoice_Line_No, '
      #9'Sales_Invoice_Line.Qty_Invoiced, '
      #9'Sales_Invoice_Line.Goods_Value, '
      #9'Price_Unit.Price_Unit_Factor')
    Left = 984
    Top = 46
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
  object qryGetSuppPOInvoice: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT '#9'Supplier_Invoice_Line.Supplier_Invoice,'
      #9'Supplier_Invoice_Line.Invoice_Line_No,'
      #9'Supplier_Invoice_Line.Qty_Invoiced,'
      #9'Supplier_Invoice_Line.Goods_Value,'
      #9'Price_Unit.Price_Unit_Factor,'
      #9'SUM(Supplier_Invoice_Charge.Amount) as Total_Charges'
      'FROM Price_Unit '
      #9'INNER JOIN (Supplier_Invoice_Line '
      #9'LEFT JOIN Supplier_Invoice_Charge '
      
        #9#9'ON (Supplier_Invoice_Line.Supplier_Invoice = Supplier_Invoice_' +
        'Charge.Supplier_Invoice) '
      
        #9#9#9'AND (Supplier_Invoice_Line.Purchase_Order = Supplier_Invoice_' +
        'Charge.Purchase_Order) '
      
        #9#9#9'AND (Supplier_Invoice_Line.Line = Supplier_Invoice_Charge.Lin' +
        'e)) '
      #9#9'ON Price_Unit.Price_Unit = Supplier_Invoice_Line.Price_Unit'
      
        'WHERE Supplier_Invoice_Line.Purchase_order = :Purchase_order and' +
        ' Supplier_Invoice_Line.Line = :Line'
      'GROUP BY Supplier_Invoice_Line.Supplier_Invoice,'
      #9'Supplier_Invoice_Line.Invoice_Line_No,'
      #9'Supplier_Invoice_Line.Qty_Invoiced,'
      #9'Supplier_Invoice_Line.Goods_Value,'
      #9'Price_Unit.Price_Unit_Factor')
    Left = 232
    Top = 38
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Purchase_order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end>
  end
  object qryGetPO: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT Purchase_Order.Date_Point'
      'From Purchase_Order'
      'WHERE Purchase_Order.Purchase_Order = :Purchase_Order')
    Left = 147
    Top = 36
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end>
  end
  object qryDummy: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT'
      '      Job_Bag_Line_Dets.Job_Bag,'
      #9'    Job_Bag_Line_Dets.Job_Bag_Line,'
      #9'    Job_Bag_Line_Dets.Job_Bag_Line_Descr,'
      #9'    Customer.Name AS Customer_Name,'
      #9'    Supplier.Name AS Supplier_Name,'
      #9'    Job_Bag_Line_Dets.Job_Bag_Line_Cost,'
      #9'    Job_Bag_Line_Dets.Job_Bag_Line_Sell,'
      #9'    Job_Bag_Line_Dets.Job_Bag_Quantity,'
      #9'    Job_Bag_Line_Dets.VAT_Code,'
      #9'    Job_Bag_Line_Dets.Job_Bag_Line_Type,'
      #9'    Job_Bag_Line_Dets.Purchase_Order,'
      #9'    Job_Bag_Line_Dets.Line, '
      #9'    Job_Bag.Cust_Order_No, '
      #9'    Job_Bag.On_Hold, '
      #9'    Rep.Rep,'
      #9'    Rep.Name AS Rep_Name, '
      #9'    Vat_Code.Vat_Rate, '
      #9'    Job_Bag.Date_Point, '
      #9'    Job_Bag.Date_Start, '
      #9'    Job_Bag.Quantity, '
      #9'    Job_Bag.Customer, '
      #9'    Job_Bag.Branch_No, '
      #9'    Customer_Branch.Name AS Customer_Branch_Name, '
      '      Customer.Analysis_Code_1, '
      '      Customer.Analysis_Code_2, '
      '      (SELECT CB.Account_Code '
      '       FROM Customer_Branch CB '
      '       WHERE CB.Customer = Customer_Branch.Inv_To_Customer AND '
      
        '             CB.Branch_No = Customer_Branch.Inv_To_Branch) AS Ac' +
        'count_Code, '
      #9'    Job_Bag_Line_Dets.Supplier, '
      #9'    Job_Bag_Line_Dets.Branch_No AS Supplier_Branch_no, '
      #9'    Supplier_Branch.Name AS Supplier_Branch_Name, '
      #9'    Purchase_OrderLine.Inactive, '
      '      Job_Bag.Job_Bag_Descr, '
      '      Job_Bag.Office_Contact, '
      '      Operator.Name as Account_Manager, '
      '      Job_Bag.Goods_Required, '
      '      Job_Bag.Ready_for_Invoicing, '
      '      Job_Bag_Line_Dets.Product_Type '
      'FROM Purchase_OrderLine'
      #9'    RIGHT JOIN (Vat_Code '
      #9'    INNER JOIN ((Supplier '
      #9'    INNER JOIN Supplier_Branch ON '
      #9#9'    Supplier.Supplier = Supplier_Branch.Supplier) '
      #9'    INNER JOIN (Customer '
      '      INNER JOIN ((Rep '
      #9'    INNER JOIN (Customer_Branch '
      #9'    INNER JOIN Job_Bag ON '
      #9#9'    (Customer_Branch.Branch_no = Job_Bag.Branch_No) AND '
      #9#9'    (Customer_Branch.Customer = Job_Bag.Customer)) ON '
      #9#9'    Rep.Rep = Job_Bag.Rep) '
      #9'    INNER JOIN Job_Bag_Line_Dets ON '
      #9#9'    Job_Bag.Job_Bag = Job_Bag_Line_Dets.Job_Bag) ON '
      #9#9'    Customer.Customer = Customer_Branch.Customer) ON '
      
        #9#9'    (Supplier_Branch.Branch_no = Job_Bag_Line_Dets.Branch_No) ' +
        'AND '
      
        #9#9'    (Supplier_Branch.Supplier = Job_Bag_Line_Dets.Supplier)) O' +
        'N '
      '        Vat_Code.Vat_Code = Job_Bag_Line_Dets.VAT_Code) ON '
      #9#9'    (Purchase_OrderLine.Line = Job_Bag_Line_Dets.Line) AND '
      
        #9#9'    (Purchase_OrderLine.Purchase_Order = Job_Bag_Line_Dets.Pur' +
        'chase_Order) '
      
        '      INNER JOIN Operator ON Job_Bag.Office_Contact = Operator.O' +
        'perator '
      'WHERE     (Job_Bag.Job_Bag_Status < 30) AND'
      '          (Job_Bag.On_Hold = '#39'N'#39') AND'
      
        '          ((Job_Bag.Invoice_This_Week = :Invoice_This_Week) OR (' +
        ':Invoice_This_Week = '#39'A'#39')) AND'
      
        '          ((Job_Bag.Production_Complete = :Production_Complete) ' +
        'OR (:Production_Complete = '#39'A'#39')) AND'
      '          ((Purchase_orderLine.InActive <> '#39'Y'#39') or'
      '           (Purchase_orderLine.Inactive is NULL)) AND'
      '          ((Job_Bag_Line_Dets.InActive = '#39'N'#39') or'
      '           (Job_Bag_Line_Dets.Inactive is NULL)) AND'
      '          ((Job_Bag.InActive = '#39'N'#39') or'
      '           (Job_Bag.Inactive is NULL)) AND'
      
        '          ((Job_bag.Goods_Required >= :Date_From) AND (Job_bag.G' +
        'oods_Required <= :Date_To)) AND'
      
        '          ((Job_Bag.Customer = :Customer) OR (:Customer = 0)) AN' +
        'D'
      
        '          ((Job_Bag.Office_Contact = :Office_Contact) OR (:Offic' +
        'e_Contact = 0))'
      ''
      ''
      '')
    Left = 638
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Invoice_This_Week'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Invoice_This_Week'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Production_Complete'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Production_Complete'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_From'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_To'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Office_Contact'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Office_Contact'
        ParamType = ptUnknown
      end>
  end
end
