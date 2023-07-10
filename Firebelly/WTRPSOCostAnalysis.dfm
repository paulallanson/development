object frmWTRPSOCostAnalysis: TfrmWTRPSOCostAnalysis
  Left = 43
  Top = 110
  Width = 1177
  Height = 615
  Caption = 'Sales Order Cost Analysis Report'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
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
    DataSet = qrySalesOrders
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
    ReportTitle = 'Sales Orders due for templating Quote Report'
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsMaximized
    object qrbGroupHeader: TQRGroup
      Left = 38
      Top = 128
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
      ForceNewPage = False
      Size.Values = (
        84.666666666666670000
        2770.187500000000000000)
      FooterBand = qrbGroupFooter
      Master = qrpDetails
      ReprintOnNewPage = False
      object qrlblSortBy: TgtQRLabel
        Left = 0
        Top = 8
        Width = 47
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          21.166666666666670000
          124.354166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Customer'
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
      object qrGroupbyText: TgtQRDBText
        Left = 80
        Top = 8
        Width = 80
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          211.666666666666700000
          21.166666666666670000
          211.666666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qrySalesOrders
        DataField = 'Customer_Name'
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
      Top = 160
      Width = 1047
      Height = 23
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
        60.854166666666670000
        2770.187500000000000000)
      Master = qrpDetails
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText2: TgtQRDBText
        Left = 0
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
          0.000000000000000000
          2.645833333333333000
          164.041666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qrySalesOrders
        DataField = 'Sales_Order'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrdbDate: TgtQRDBText
        Left = 68
        Top = 1
        Width = 62
        Height = 15
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          179.916666666666700000
          2.645833333333333000
          164.041666666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qrySalesOrders
        DataField = 'Date_Raised'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText5: TgtQRDBText
        Left = 320
        Top = 1
        Width = 153
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          846.666666666666600000
          2.645833333333333000
          404.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qrySalesOrders
        DataField = 'Reference'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText6: TgtQRDBText
        Left = 136
        Top = 1
        Width = 185
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          359.833333333333400000
          2.645833333333333000
          489.479166666666600000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qrySalesOrders
        DataField = 'Customer_Name'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText4: TgtQRDBText
        Left = 774
        Top = 1
        Width = 67
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          2047.875000000000000000
          2.645833333333333000
          177.270833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qrySalesOrders
        DataField = 'Goods_Value'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText10: TgtQRDBText
        Left = 584
        Top = 1
        Width = 89
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1545.166666666667000000
          2.645833333333333000
          235.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qrySalesOrders
        DataField = 'Rep_Name'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object gtQRDBText2: TgtQRDBText
        Left = 675
        Top = 1
        Width = 89
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1785.937500000000000000
          2.645833333333333000
          235.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qrySalesOrders
        DataField = 'Sales_Order_Status_Desc'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlblCost: TgtQRLabel
        Left = 871
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
          2304.520833333333000000
          0.000000000000000000
          113.770833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblCost'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlblCostPerc: TgtQRLabel
        Left = 976
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
          2582.333333333333000000
          0.000000000000000000
          171.979166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblCostPerc'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object gtQRDBText1: TgtQRDBText
        Left = 472
        Top = 1
        Width = 97
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1248.833333333333000000
          2.645833333333333000
          256.645833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qrySalesOrders
        DataField = 'Order_Ref_No'
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlblMargin: TgtQRLabel
        Left = 936
        Top = 0
        Width = 53
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          2476.500000000000000000
          0.000000000000000000
          140.229166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblMargin'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlblReportDate: TgtQRLabel
        Left = 62
        Top = 1
        Width = 75
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          164.041666666666700000
          2.645833333333333000
          198.437500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblReportDate'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object qrbGroupFooter: TQRBand
      Left = 38
      Top = 183
      Width = 1047
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = qrbGroupFooterAfterPrint
      AlignToBottom = False
      BeforePrint = qrbGroupFooterBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        84.666666666666670000
        2770.187500000000000000)
      BandType = rbGroupFooter
      object qrlblCustPerc: TgtQRLabel
        Left = 964
        Top = 7
        Width = 77
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2550.583333333333000000
          18.520833333333330000
          203.729166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblCustPerc'
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
      object qrlblCustMargin: TgtQRLabel
        Left = 898
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
          2375.958333333333000000
          18.520833333333330000
          238.125000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblCustMargin'
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
      object qrlblCustCost: TgtQRLabel
        Left = 837
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
          2214.562500000000000000
          18.520833333333330000
          206.375000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblCustCost'
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
      object qrlblCustGoods: TgtQRLabel
        Left = 753
        Top = 7
        Width = 88
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1992.312500000000000000
          18.520833333333330000
          232.833333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblCustGoods'
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
        Left = 792
        Top = -1
        Width = 249
        Height = 8
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          21.166666666666670000
          2095.500000000000000000
          -2.645833333333333000
          658.812500000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrGroupbyFootText: TgtQRDBText
        Left = 623
        Top = 7
        Width = 108
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1648.354166666667000000
          18.520833333333330000
          285.750000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qrySalesOrders
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
      object QRLabel2: TgtQRLabel
        Left = 738
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
          1952.625000000000000000
          18.520833333333330000
          74.083333333333330000)
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
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object QRBand2: TQRBand
      Left = 38
      Top = 215
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
      object qrlblReportPerc: TgtQRLabel
        Left = 953
        Top = 7
        Width = 88
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2521.479166666667000000
          18.520833333333330000
          232.833333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblReportPerc'
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
      object qrlblReportMargin: TgtQRLabel
        Left = 887
        Top = 7
        Width = 101
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2346.854166666667000000
          18.520833333333330000
          267.229166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblReportMargin'
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
      object qrlblReportCost: TgtQRLabel
        Left = 827
        Top = 7
        Width = 89
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2188.104166666667000000
          18.520833333333330000
          235.479166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblReportCost'
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
      object qrlblReportGoods: TgtQRLabel
        Left = 743
        Top = 7
        Width = 99
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1965.854166666667000000
          18.520833333333330000
          261.937500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblReportGoods'
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
      object QRLabel10: TgtQRLabel
        Left = 698
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
          1846.791666666667000000
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
      object QRShape2: TgtQRShape
        Left = 792
        Top = -1
        Width = 249
        Height = 8
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          21.166666666666670000
          2095.500000000000000000
          -2.645833333333333000
          658.812500000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
    object QRBand1: TQRBand
      Left = 38
      Top = 38
      Width = 1047
      Height = 90
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
        238.125000000000000000
        2770.187500000000000000)
      BandType = rbPageHeader
      object qrlblCaption: TgtQRLabel
        Left = 396
        Top = 2
        Width = 243
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1047.750000000000000000
          5.291666666666667000
          642.937500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Sales Orders Cost Analysis Report'
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
      object QRSysData1: TgtQRSysData
        Left = 976
        Top = 23
        Width = 69
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2582.333333333333000000
          60.854166666666670000
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
      object QRLabel3: TgtQRLabel
        Left = 0
        Top = 71
        Width = 59
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          187.854166666666700000
          156.104166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Sales Order'
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
      object qrlblDate: TgtQRLabel
        Left = 70
        Top = 71
        Width = 54
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          185.208333333333300000
          187.854166666666700000
          142.875000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Order Date'
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
        Left = 136
        Top = 71
        Width = 47
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          359.833333333333300000
          187.854166666666700000
          124.354166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Customer'
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
        Left = 320
        Top = 71
        Width = 52
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          846.666666666666700000
          187.854166666666700000
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
      object QRLabel12: TgtQRLabel
        Left = 1004
        Top = 71
        Width = 36
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2656.416666666667000000
          187.854166666666700000
          95.250000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Cost %'
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
        Top = 25
        Width = 74
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1256.770833333333000000
          66.145833333333330000
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
        Left = 990
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
          2619.375000000000000000
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
      object QRLabel9: TgtQRLabel
        Left = 806
        Top = 71
        Width = 33
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2132.541666666667000000
          187.854166666666700000
          87.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Goods'
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
        Left = 851
        Top = 71
        Width = 63
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2251.604166666667000000
          187.854166666666700000
          166.687500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Material Cost'
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
        Left = 584
        Top = 71
        Width = 20
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1545.166666666667000000
          187.854166666666700000
          52.916666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Rep'
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
      object qrlblSelection: TgtQRLabel
        Left = 479
        Top = 45
        Width = 65
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1267.354166666667000000
          119.062500000000000000
          171.979166666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblSelection'
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
      object gtQRLabel2: TgtQRLabel
        Left = 675
        Top = 71
        Width = 32
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1785.937500000000000000
          187.854166666666700000
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
      object gtQRLabel1: TgtQRLabel
        Left = 472
        Top = 71
        Width = 98
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1248.833333333333000000
          187.854166666666700000
          259.291666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Customer Order Ref'
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
      object gtQRLabel3: TgtQRLabel
        Left = 955
        Top = 71
        Width = 33
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2526.770833333333000000
          187.854166666666700000
          87.312500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Margin'
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
  end
  object qrySalesOrders: TQuery
    DatabaseName = 'Wt'
    SQL.Strings = (
      'SELECT  Sales_Order.Sales_Order,'
      '        Sales_Order.Date_Raised,'
      '        Sales_Order.Descriptive_Reference,'
      '        Sales_Order.Sales_Order_Status,'
      '        Sales_Order_Status.Sales_Order_Status_Desc,'
      '        Sales_Order.Template_Date,'
      '        Sales_Order.Date_Required,'
      '        Sales_Order.Install_Address,'
      '        Sales_Order.Customer_Name,'
      '        Sales_Order.Reference,'
      '        Sales_Order.Order_Ref_no,'
      '        Customer.Telephone_number,'
      '        Customer.Is_Retail_Customer,'
      '        Customer.Is_Commercial_Customer,'
      '        Sales_Order.Goods_Value,'
      '        Sales_Order.VAT_Value,'
      
        '        (Sales_Order.VAT_Value + Sales_Order.Goods_Value) as Tot' +
        'al_Value,'
      
        '        (SELECT SUM(((((Quote_Slab.Length * Quote_Slab.Depth)/10' +
        '00000) * Quote_Slab.Quantity) * Quote_Slab.Unit_Cost) + ((Quote_' +
        'Slab.Adhesive_Unit_Cost * (Quote_Slab.Adhesive_Quantity/1))))'
      '          FROM Sales_Order_Line'
      '              INNER JOIN Quote_Slab'
      '                ON Sales_Order_Line.Quote = Quote_Slab.Quote'
      
        '          WHERE (Sales_Order_Line.Sales_Order = Sales_order.Sale' +
        's_Order)) as Total_Materials,'
      '        Sales_Order.Rep,'
      '        Rep.Rep_Name,'
      '        Sales_Order.Account_Manager,'
      '        Operator.Operator_Name as Account_Manager_Name'
      'FROM Operator'
      '      INNER JOIN (Sales_Order_Status'
      '      INNER JOIN (Rep'
      '      INNER JOIN (Customer'
      '      INNER JOIN Sales_Order'
      '        ON Customer.Customer = Sales_Order.Customer)'
      '        ON Rep.Rep = Sales_Order.Rep)'
      
        '        ON Sales_Order_Status.Sales_Order_Status = Sales_Order.S' +
        'ales_Order_Status)'
      '        ON Operator.Operator = Sales_Order.Account_Manager'
      'WHERE'
      '((Sales_Order.Rep = :Rep) or (0 = :Rep)) AND'
      
        '((Sales_Order.inactive = '#39'N'#39') or (Sales_Order.inactive IS NULL))' +
        ' AND'
      
        '(((Customer.Is_Retail_Customer = :Is_Retail_Customer) AND (Custo' +
        'mer.Is_Commercial_Customer = :Is_Commercial_Customer)) or (:Is_R' +
        'etail_Customer = '#39'A'#39')) AND'
      '')
    Left = 208
    Top = 184
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Rep'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Rep'
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
    object qrySalesOrdersSales_Order: TIntegerField
      FieldName = 'Sales_Order'
      Origin = 'WT.Sales_Order.Sales_Order'
    end
    object qrySalesOrdersDate_Raised: TDateTimeField
      FieldName = 'Date_Raised'
      Origin = 'WT.Sales_Order.Date_Raised'
    end
    object qrySalesOrdersSales_Order_Status: TIntegerField
      FieldName = 'Sales_Order_Status'
      Origin = 'WT.Sales_Order.Sales_Order_Status'
    end
    object qrySalesOrdersSales_Order_Status_Desc: TStringField
      FieldName = 'Sales_Order_Status_Desc'
      Origin = 'WT.Sales_Order_Status.Sales_Order_Status_Desc'
      Size = 30
    end
    object qrySalesOrdersTemplate_Date: TDateTimeField
      FieldName = 'Template_Date'
      Origin = 'WT.Sales_Order.Template_Date'
    end
    object qrySalesOrdersInstall_Address: TIntegerField
      FieldName = 'Install_Address'
      Origin = 'WT.Sales_Order.Install_Address'
    end
    object qrySalesOrdersCustomer_Name: TStringField
      FieldName = 'Customer_Name'
      Origin = 'WT.Sales_Order.Customer_Name'
      Size = 50
    end
    object qrySalesOrdersReference: TStringField
      FieldName = 'Reference'
      Origin = 'WT.Sales_Order.Reference'
      Size = 30
    end
    object qrySalesOrdersTelephone_number: TStringField
      FieldName = 'Telephone_number'
      Origin = 'WT.Customer.Telephone_number'
      Size = 30
    end
    object qrySalesOrdersGoods_Value: TFloatField
      FieldName = 'Goods_Value'
      Origin = 'WT.Sales_Order.Goods_Value'
      DisplayFormat = '0.00'
    end
    object qrySalesOrdersVAT_Value: TFloatField
      FieldName = 'VAT_Value'
      Origin = 'WT.Sales_Order.VAT_Value'
      DisplayFormat = '0.00'
    end
    object qrySalesOrdersTotal_Value: TFloatField
      FieldName = 'Total_Value'
      Origin = 'WT.Sales_Order.VAT_Value'
      DisplayFormat = '0.00'
    end
    object qrySalesOrdersRep: TIntegerField
      FieldName = 'Rep'
      Origin = 'WT.Sales_Order.Rep'
    end
    object qrySalesOrdersRep_Name: TStringField
      FieldName = 'Rep_Name'
      Origin = 'WT.Rep.Rep_Name'
      Size = 50
    end
    object qrySalesOrdersDescriptive_Reference: TStringField
      FieldName = 'Descriptive_Reference'
      Size = 150
    end
    object qrySalesOrdersDate_Required: TDateTimeField
      FieldName = 'Date_Required'
      Origin = 'WT.Sales_Order.Date_Required'
    end
    object qrySalesOrdersTotal_Materials: TFloatField
      FieldName = 'Total_Materials'
    end
    object qrySalesOrdersOrder_Ref_no: TStringField
      FieldName = 'Order_Ref_no'
      Size = 30
    end
    object qrySalesOrdersIs_Retail_Customer: TStringField
      FieldName = 'Is_Retail_Customer'
      Size = 1
    end
    object qrySalesOrdersAccount_Manager: TIntegerField
      FieldName = 'Account_Manager'
    end
    object qrySalesOrdersAccount_Manager_Name: TStringField
      FieldName = 'Account_Manager_Name'
      Size = 50
    end
    object qrySalesOrdersIs_Commercial_Customer: TStringField
      FieldName = 'Is_Commercial_Customer'
      Size = 1
    end
  end
end
