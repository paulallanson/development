object STRPProductListFrm: TSTRPProductListFrm
  Left = 197
  Top = 116
  Caption = 'Product List Report'
  ClientHeight = 592
  ClientWidth = 1299
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  
  TextHeight = 13
  object qrpDetails: TQuickRep
    Left = 56
    Top = 32
    Width = 1123
    Height = 794
    ShowingPreview = False
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
    Page.Orientation = poLandscape
    Page.PaperSize = A4
    Page.Continuous = False
    Page.Values = (
      100.000000000000000000
      2100.000000000000000000
      100.000000000000000000
      2970.000000000000000000
      80.000000000000000000
      80.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.OutputBin = Auto
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrinterSettings.MemoryLimit = 1000000
    PrinterSettings.Collate = 0
    PrinterSettings.ColorOption = 2
    PrintIfEmpty = True
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsMaximized
    PreviewWidth = 500
    PreviewHeight = 500
    PrevInitialZoom = qrZoomToFit
    PreviewDefaultSaveType = stPDF
    PreviewLeft = 0
    PreviewTop = 0
    object qrpPageheader: TQRBand
      Left = 30
      Top = 38
      Width = 1063
      Height = 107
      Frame.DrawBottom = True
      Frame.Style = psDashDot
      AlignToBottom = False
      TransparentBand = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        283.104166666666700000
        2812.520833333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object qrlblTitle: TQRLabel
        Left = 457
        Top = 2
        Width = 148
        Height = 24
        Size.Values = (
          63.500000000000000000
          1209.145833333333000000
          5.291666666666667000
          391.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Product List Report'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 14
      end
      object QRLblSelection: TQRLabel
        Left = 494
        Top = 31
        Width = 74
        Height = 17
        Size.Values = (
          44.979166666666670000
          1307.041666666667000000
          82.020833333333330000
          195.791666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'QRLblSelection'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRSysData2: TQRSysData
        Left = 999
        Top = 8
        Width = 56
        Height = 17
        Size.Values = (
          44.979166666666670000
          2643.187500000000000000
          21.166666666666670000
          148.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
        Transparent = False
        ExportAs = exptText
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRSysData1: TQRSysData
        Left = 989
        Top = 25
        Width = 66
        Height = 15
        Size.Values = (
          39.687500000000000000
          2616.729166666667000000
          66.145833333333330000
          174.625000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
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
        ExportAs = exptText
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel1: TQRLabel
        Left = 6
        Top = 87
        Width = 38
        Height = 15
        Size.Values = (
          39.687500000000000000
          15.875000000000000000
          230.187500000000000000
          100.541666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Product'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel3: TQRLabel
        Left = 135
        Top = 87
        Width = 55
        Height = 15
        Size.Values = (
          39.687500000000000000
          357.187500000000000000
          230.187500000000000000
          145.520833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Description'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlblCostPrice: TQRLabel
        Left = 1008
        Top = 87
        Width = 50
        Height = 15
        Size.Values = (
          39.687500000000000000
          2667.000000000000000000
          230.187500000000000000
          132.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cost Price'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlblCostSize: TQRLabel
        Left = 952
        Top = 72
        Width = 49
        Height = 30
        Size.Values = (
          79.375000000000000000
          2518.833333333333000000
          190.500000000000000000
          129.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Cost Pack Size'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel6: TQRLabel
        Left = 744
        Top = 87
        Width = 45
        Height = 15
        Size.Values = (
          39.687500000000000000
          1968.500000000000000000
          230.187500000000000000
          119.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sell Price'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel7: TQRLabel
        Left = 680
        Top = 72
        Width = 49
        Height = 30
        Size.Values = (
          79.375000000000000000
          1799.166666666667000000
          190.500000000000000000
          129.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Sell Pack Size'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel9: TQRLabel
        Left = 507
        Top = 87
        Width = 71
        Height = 15
        Size.Values = (
          39.687500000000000000
          1341.437500000000000000
          230.187500000000000000
          187.854166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Product Group'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel11: TQRLabel
        Left = 639
        Top = 87
        Width = 23
        Height = 15
        Size.Values = (
          39.687500000000000000
          1690.687500000000000000
          230.187500000000000000
          60.854166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'VAT'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlblGroupSel: TQRLabel
        Left = 494
        Top = 47
        Width = 74
        Height = 17
        Size.Values = (
          44.979166666666670000
          1307.041666666667000000
          124.354166666666700000
          195.791666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'QRLblSelection'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel2: TQRLabel
        Left = 822
        Top = 72
        Width = 49
        Height = 30
        Size.Values = (
          79.375000000000000000
          2174.875000000000000000
          190.500000000000000000
          129.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Discount Price'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel4: TQRLabel
        Left = 886
        Top = 72
        Width = 59
        Height = 30
        Size.Values = (
          79.375000000000000000
          2344.208333333333000000
          190.500000000000000000
          156.104166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Discounted Unit Price'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
    end
    object qrbndgrphdr: TQRGroup
      Left = 30
      Top = 145
      Width = 1063
      Height = 24
      AlignToBottom = False
      Enabled = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.500000000000000000
        2812.520833333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'qryReport.Claim_Description'
      Master = qrsubdetails
      ReprintOnNewPage = False
      object qrlblGroupHeader: TQRLabel
        Left = 5
        Top = 5
        Width = 81
        Height = 16
        Size.Values = (
          42.333333333333330000
          13.229166666666670000
          13.229166666666670000
          214.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Product Group'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object GrpByQRDBText: TQRDBText
        Left = 91
        Top = 5
        Width = 91
        Height = 16
        Size.Values = (
          42.333333333333330000
          240.770833333333300000
          13.229166666666670000
          240.770833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Part_Group_Descr'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
    end
    object qrsubdetails: TQRSubDetail
      Left = 30
      Top = 169
      Width = 1063
      Height = 22
      AfterPrint = qrsubdetailsAfterPrint
      AlignToBottom = False
      BeforePrint = qrsubdetailsBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        58.208333333333330000
        2812.520833333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpDetails
      DataSet = qryReport
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText8: TQRDBText
        Left = 617
        Top = 4
        Width = 93
        Height = 15
        Size.Values = (
          39.687500000000000000
          1632.479166666667000000
          10.583333333333330000
          246.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Sell_Pack_Quantity'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRDBText4: TQRDBText
        Left = 612
        Top = 4
        Width = 51
        Height = 15
        Size.Values = (
          39.687500000000000000
          1619.250000000000000000
          10.583333333333330000
          134.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'VAT_Rate'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrdbCostPrice: TQRDBText
        Left = 957
        Top = 4
        Width = 102
        Height = 15
        Size.Values = (
          39.687500000000000000
          2532.062500000000000000
          10.583333333333330000
          269.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Part_Purchase_Price'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrdbCostSize: TQRDBText
        Left = 893
        Top = 4
        Width = 104
        Height = 15
        Size.Values = (
          39.687500000000000000
          2362.729166666667000000
          10.583333333333330000
          275.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Purch_Pack_Quantity'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRDBText1: TQRDBText
        Left = 4
        Top = 4
        Width = 125
        Height = 15
        Size.Values = (
          39.687500000000000000
          10.583333333333330000
          10.583333333333330000
          330.729166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Part'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRDBText2: TQRDBText
        Left = 134
        Top = 4
        Width = 368
        Height = 15
        Size.Values = (
          39.687500000000000000
          354.541666666666700000
          10.583333333333330000
          973.666666666666900000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = qryReport
        DataField = 'Part_Description'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRDBText3: TQRDBText
        Left = 507
        Top = 4
        Width = 110
        Height = 15
        Size.Values = (
          39.687500000000000000
          1341.437500000000000000
          10.583333333333330000
          291.041666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Part_Group_Descr'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRDBText6: TQRDBText
        Left = 720
        Top = 4
        Width = 70
        Height = 15
        Size.Values = (
          39.687500000000000000
          1905.000000000000000000
          10.583333333333330000
          185.208333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Part_Cost_Cat'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlblDiscPrice: TQRLabel
        Left = 799
        Top = 4
        Width = 66
        Height = 15
        Size.Values = (
          39.687500000000000000
          2114.020833333333000000
          10.583333333333330000
          174.625000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblDiscPrice'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlblUnitPrice: TQRLabel
        Left = 874
        Top = 4
        Width = 63
        Height = 15
        Size.Values = (
          39.687500000000000000
          2312.458333333333000000
          10.583333333333330000
          166.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblUnitPrice'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
    end
  end
  object qryReport: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Part.Part,'
      '        Part.Part_Description,'
      '        Part.Part_Cost_Cat,'
      '        Part.Purch_Pack_Quantity,'
      '        Part.Sell_Pack_Quantity,'
      '        Part.Part_Purchase_Price,'
      '        Part.Part_Group,'
      '        Part_Group.Part_Group_Descr,'
      '        Product_class.Product_class,'
      '        Product_class.Product_Class_Description,'
      '        Vat_Code.Vat_Code,'
      '        Vat_Code.Vat_Rate,'
      '        Customer.Name'
      'FROM ((Product_class'
      '        INNER JOIN (Part_Group'
      '        RIGHT JOIN Part'
      '          ON Part_Group.Part_Group = Part.Part_Group)'
      '          ON Product_class.Product_class = Part.Product_class)'
      '        INNER JOIN Vat_Code'
      '          ON Part.Vat_Code = Vat_Code.Vat_Code)'
      '        LEFT JOIN Customer'
      '          ON Part.Customer = Customer.Customer'
      'WHERE (Part.Part >= :Part_From and'
      '      Part.Part <= :Part_To)'
      '')
    Left = 96
    Top = 16
    ParamData = <
      item
        Name = 'Part_From'
      end
      item
        Name = 'Part_To'
      end>
  end
  object qryDummy: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Part.Part,'
      '        Part.Part_Description,'
      '        Part.Part_Cost_Cat,'
      '        Part.Purch_Pack_Quantity,'
      '        Part.Sell_Pack_Quantity,'
      '        Part.Part_Purchase_Price,'
      '        Part.Part_Group,'
      '        Part_Group.Part_Group_Descr,'
      '        Product_class.Product_class,'
      '        Product_class.Product_Class_Description,'
      '        Vat_Code.Vat_Code,'
      '        Vat_Code.Vat_Rate,'
      '        Customer.Name as Customer_Name'
      'FROM ((Product_class'
      '        INNER JOIN (Part_Group'
      '        RIGHT JOIN Part'
      '          ON Part_Group.Part_Group = Part.Part_Group)'
      '          ON Product_class.Product_class = Part.Product_class)'
      '        INNER JOIN Vat_Code'
      '          ON Part.Vat_Code = Vat_Code.Vat_Code)'
      '        LEFT JOIN Customer'
      '          ON Part.Customer = Customer.Customer'
      'WHERE (Part.Part >= :Part_From and'
      '      Part.Part <= :Part_To) AND'
      
        '      ((Part.Not_in_Use = '#39'N'#39') or (Part.Not_in_Use = :inactive) ' +
        'or (Part.Not_in_Use is NULL))'
      '')
    Left = 232
    Top = 16
    ParamData = <
      item
        Name = 'Part_From'
      end
      item
        Name = 'Part_To'
      end
      item
        Name = 'inactive'
      end>
    object FloatField1: TFloatField
      FieldName = 'Purchase_Order'
    end
    object IntegerField1: TIntegerField
      FieldName = 'Line'
    end
    object IntegerField2: TIntegerField
      FieldName = 'Customer'
    end
    object StringField1: TWideStringField
      FieldName = 'Customers_Desc'
      FixedChar = True
      Size = 80
    end
    object StringField2: TWideStringField
      FieldName = 'Customer_Name'
      FixedChar = True
      Size = 92
    end
    object IntegerField3: TIntegerField
      FieldName = 'FSC_Material_Claim'
    end
    object StringField3: TWideStringField
      FieldName = 'Claim_Description'
      FixedChar = True
      Size = 100
    end
    object StringField4: TWideStringField
      FieldName = 'Claim_Type'
      FixedChar = True
      Size = 10
    end
    object IntegerField4: TIntegerField
      FieldName = 'Product_Type'
    end
    object StringField5: TWideStringField
      FieldName = 'Product_Type_Description'
      FixedChar = True
      Size = 80
    end
    object IntegerField5: TIntegerField
      FieldName = 'FSC_Product_Type_Code'
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'Date_Deliv_Actual'
    end
    object FloatField2: TFloatField
      FieldName = 'Qty_To_Deliver'
    end
    object FloatField3: TFloatField
      FieldName = 'Qty_Received'
      DisplayFormat = '#,###,##0'
    end
  end
end
