object PBRPFSCClaimFrm: TPBRPFSCClaimFrm
  Left = 264
  Top = 113
  Caption = 'FSC Claim Report'
  ClientHeight = 592
  ClientWidth = 1204
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Scaled = False
  OnCreate = FormCreate
  TextHeight = 13
  object qrpDetails: TQuickRep
    Left = 56
    Top = 32
    Width = 794
    Height = 1123
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
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Continuous = False
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
      Left = 38
      Top = 38
      Width = 718
      Height = 75
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
        198.437500000000000000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object qrlblTitle: TQRLabel
        Left = 278
        Top = 2
        Width = 161
        Height = 24
        Size.Values = (
          63.500000000000000000
          735.541666666666700000
          5.291666666666667000
          425.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Material Claim Report'
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
        Left = 322
        Top = 31
        Width = 74
        Height = 17
        Size.Values = (
          44.979166666666670000
          851.958333333333300000
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
      object qrlblDateSelection: TQRLabel
        Left = 315
        Top = 50
        Width = 87
        Height = 17
        Size.Values = (
          44.979166666666670000
          833.437500000000000000
          132.291666666666700000
          230.187500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'qrlblDateSelection'
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
        Left = 655
        Top = 8
        Width = 56
        Height = 17
        Size.Values = (
          44.979166666666670000
          1733.020833333333000000
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
        Left = 645
        Top = 25
        Width = 66
        Height = 15
        Size.Values = (
          39.687500000000000000
          1706.562500000000000000
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
    end
    object qrHeadFSC: TQRGroup
      Left = 38
      Top = 130
      Width = 718
      Height = 24
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.500000000000000000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'qryReport.Claim_Description'
      FooterBand = qrFootFSC
      Master = qrsubdetails
      ReprintOnNewPage = False
      object QRLabel2: TQRLabel
        Left = 8
        Top = 5
        Width = 101
        Height = 16
        Size.Values = (
          42.333333333333330000
          21.166666666666670000
          13.229166666666670000
          267.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Material Category:'
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
        Left = 115
        Top = 5
        Width = 86
        Height = 16
        Size.Values = (
          42.333333333333330000
          304.270833333333300000
          13.229166666666670000
          227.541666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Claim_Description'
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
    object qrFootProductType: TQRBand
      Left = 38
      Top = 202
      Width = 718
      Height = 26
      AfterPrint = qrFootProductTypeAfterPrint
      AlignToBottom = False
      BeforePrint = qrFootProductTypeBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        68.791666666666670000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRDBText6: TQRDBText
        Left = 136
        Top = 6
        Width = 128
        Height = 15
        Size.Values = (
          39.687500000000000000
          359.833333333333300000
          15.875000000000000000
          338.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Product_Type_Description'
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
      object QRDBText7: TQRDBText
        Left = 264
        Top = 6
        Width = 125
        Height = 15
        Size.Values = (
          39.687500000000000000
          698.500000000000000000
          15.875000000000000000
          330.729166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'FSC_Product_Type_Code'
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
      object qrlblReceived: TQRLabel
        Left = 414
        Top = 5
        Width = 66
        Height = 17
        Size.Values = (
          44.979166666666670000
          1095.375000000000000000
          13.229166666666670000
          174.625000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblReceived'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
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
      object qrlblInStock: TQRLabel
        Left = 517
        Top = 5
        Width = 56
        Height = 17
        Size.Values = (
          44.979166666666670000
          1367.895833333333000000
          13.229166666666670000
          148.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblInStock'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
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
      object qrlblDespatched: TQRLabel
        Left = 608
        Top = 5
        Width = 79
        Height = 17
        Size.Values = (
          44.979166666666670000
          1608.666666666667000000
          13.229166666666670000
          209.020833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblDespatched'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
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
      object qrshpproductTypeLine: TQRShape
        Left = 407
        Top = -3
        Width = 281
        Height = 10
        Size.Values = (
          26.458333333333330000
          1076.854166666667000000
          -7.937500000000000000
          743.479166666666800000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
    object qrsubdetails: TQRSubDetail
      Left = 38
      Top = 178
      Width = 718
      Height = 24
      AfterPrint = qrsubdetailsAfterPrint
      AlignToBottom = False
      BeforePrint = qrsubdetailsBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.500000000000000000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpDetails
      DataSet = qryReport
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText1: TQRDBText
        Left = -5
        Top = 4
        Width = 81
        Height = 15
        Size.Values = (
          39.687500000000000000
          -13.229166666666670000
          10.583333333333330000
          214.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Purchase_Order'
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
        Left = 82
        Top = 4
        Width = 255
        Height = 15
        Size.Values = (
          39.687500000000000000
          216.958333333333400000
          10.583333333333330000
          674.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Customers_Desc'
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
        Left = 308
        Top = 4
        Width = 89
        Height = 15
        Size.Values = (
          39.687500000000000000
          814.916666666666700000
          10.583333333333330000
          235.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Date_Deliv_Actual'
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
        Left = 410
        Top = 4
        Width = 69
        Height = 15
        Size.Values = (
          39.687500000000000000
          1084.791666666667000000
          10.583333333333330000
          182.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Qty_Received'
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
      object qrlblPOInStock: TQRLabel
        Left = 502
        Top = 3
        Width = 70
        Height = 17
        Size.Values = (
          44.979166666666670000
          1328.208333333333000000
          7.937500000000000000
          185.208333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblPOInStock'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
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
      object qrlblPODespatched: TQRLabel
        Left = 595
        Top = 3
        Width = 93
        Height = 17
        Size.Values = (
          44.979166666666670000
          1574.270833333333000000
          7.937500000000000000
          246.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblPODespatched'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
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
    object qrHeadProductType: TQRGroup
      Left = 38
      Top = 154
      Width = 718
      Height = 24
      AlignToBottom = False
      Enabled = False
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
        63.500000000000000000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'qryReport.Product_Type_Description'
      FooterBand = qrFootProductType
      Master = qrsubdetails
      ReprintOnNewPage = False
      object QRDBText5: TQRDBText
        Left = 104
        Top = 5
        Width = 128
        Height = 15
        Size.Values = (
          39.687500000000000000
          275.166666666666700000
          13.229166666666670000
          338.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Product_Type_Description'
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
      object QRLabel4: TQRLabel
        Left = 24
        Top = 4
        Width = 77
        Height = 16
        Size.Values = (
          42.333333333333330000
          63.500000000000000000
          10.583333333333330000
          203.729166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Product Type:'
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
    end
    object qrFootFSC: TQRBand
      Left = 38
      Top = 228
      Width = 718
      Height = 40
      AfterPrint = qrFootFSCAfterPrint
      AlignToBottom = False
      BeforePrint = qrFootFSCBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRDBText9: TQRDBText
        Left = 211
        Top = 10
        Width = 101
        Height = 16
        Size.Values = (
          42.333333333333330000
          558.270833333333300000
          26.458333333333330000
          267.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Claim_Description'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlblFSCReceived: TQRLabel
        Left = 382
        Top = 11
        Width = 97
        Height = 17
        Size.Values = (
          44.979166666666670000
          1010.708333333333000000
          29.104166666666670000
          256.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblFSCReceived'
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
      object qrlblFSCInStock: TQRLabel
        Left = 485
        Top = 11
        Width = 88
        Height = 17
        Size.Values = (
          44.979166666666670000
          1283.229166666667000000
          29.104166666666670000
          232.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblFSCInStock'
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
      object qrlblFSCDespatched: TQRLabel
        Left = 575
        Top = 11
        Width = 112
        Height = 17
        Size.Values = (
          44.979166666666670000
          1521.354166666667000000
          29.104166666666670000
          296.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblFSCDespatched'
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
      object QRLabel10: TQRLabel
        Left = 328
        Top = 10
        Width = 38
        Height = 16
        Size.Values = (
          42.333333333333330000
          867.833333333333300000
          26.458333333333330000
          100.541666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Totals:'
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
      object QRShape1: TQRShape
        Left = 408
        Top = 0
        Width = 281
        Height = 11
        Size.Values = (
          29.104166666666670000
          1079.500000000000000000
          0.000000000000000000
          743.479166666666800000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape2: TQRShape
        Left = 408
        Top = 25
        Width = 281
        Height = 13
        Size.Values = (
          34.395833333333340000
          1079.500000000000000000
          66.145833333333340000
          743.479166666666800000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
    object qrbDetailHeader: TQRChildBand
      Left = 38
      Top = 268
      Width = 718
      Height = 17
      Frame.DrawBottom = True
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        44.979166666666670000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      PrintOrder = cboAfterParent
      object QRLabel3: TQRLabel
        Left = 27
        Top = 0
        Width = 48
        Height = 16
        Size.Values = (
          42.333333333333330000
          71.437500000000000000
          0.000000000000000000
          127.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Order No.'
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
      object QRLabel5: TQRLabel
        Left = 432
        Top = 0
        Width = 46
        Height = 16
        Size.Values = (
          42.333333333333330000
          1143.000000000000000000
          0.000000000000000000
          121.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Received'
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
        Left = 534
        Top = 0
        Width = 39
        Height = 17
        Size.Values = (
          44.979166666666670000
          1412.875000000000000000
          0.000000000000000000
          103.187500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'In Stock'
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
      object QRLabel14: TQRLabel
        Left = 629
        Top = 0
        Width = 59
        Height = 17
        Size.Values = (
          44.979166666666670000
          1664.229166666667000000
          0.000000000000000000
          156.104166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Despatched'
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
      object QRLabel15: TQRLabel
        Left = 83
        Top = 0
        Width = 55
        Height = 16
        Size.Values = (
          42.333333333333330000
          219.604166666666700000
          0.000000000000000000
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
      object QRLabel16: TQRLabel
        Left = 346
        Top = 0
        Width = 53
        Height = 16
        Size.Values = (
          42.333333333333330000
          915.458333333333300000
          0.000000000000000000
          140.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date Rec'#39'd'
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
    object qrbSummaryHeader: TQRChildBand
      Left = 38
      Top = 113
      Width = 718
      Height = 17
      Frame.DrawBottom = True
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        44.979166666666670000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = qrpPageheader
      PrintOrder = cboAfterParent
      object QRLabel6: TQRLabel
        Left = 136
        Top = 0
        Width = 65
        Height = 16
        Size.Values = (
          42.333333333333330000
          359.833333333333300000
          0.000000000000000000
          171.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Product Type'
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
        Left = 296
        Top = 0
        Width = 89
        Height = 16
        Size.Values = (
          42.333333333333330000
          783.166666666666700000
          0.000000000000000000
          235.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'FSC Product Code'
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
      object QRLabel8: TQRLabel
        Left = 432
        Top = 0
        Width = 46
        Height = 16
        Size.Values = (
          42.333333333333330000
          1143.000000000000000000
          0.000000000000000000
          121.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Received'
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
      object QRLabel12: TQRLabel
        Left = 534
        Top = 0
        Width = 39
        Height = 17
        Size.Values = (
          44.979166666666670000
          1412.875000000000000000
          0.000000000000000000
          103.187500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'In Stock'
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
      object QRLabel13: TQRLabel
        Left = 629
        Top = 0
        Width = 59
        Height = 17
        Size.Values = (
          44.979166666666670000
          1664.229166666667000000
          0.000000000000000000
          156.104166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Despatched'
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
      'SELECT '#9'Purchase_OrderLine.Purchase_Order,'
      #9'Purchase_OrderLine.Line,'
      #9'Purchase_OrderLine.Customer,'
      '  Purchase_orderLine.Customers_Desc,'
      #9'Customer.Name as Customer_Name,'
      #9'FSC_Material_Claim.FSC_Material_Claim,'
      #9'FSC_Material_Claim.Claim_Description,'
      #9'FSC_Material_Claim.Claim_Type,'
      #9'Product_Type.Product_Type,'
      #9'Product_Type.Description as Product_Type_Description,'
      #9'Product_Type.FSC_Product_Type_Code, '
      #9'Delivery_Detail.Date_Deliv_Actual,'
      #9'sum(Delivery_Detail.Qty_to_Deliver) as Qty_To_Deliver,'
      #9'sum(Delivery_Detail.Qty_Delivered) as Qty_Received'
      'FROM (Customer '
      #9'INNER JOIN (Customer_Branch '
      #9'INNER JOIN (Product_Type '
      #9'INNER JOIN (FSC_Material_Claim '
      #9'INNER JOIN Purchase_OrderLine '
      
        #9#9'ON FSC_Material_Claim.FSC_Material_Claim = Purchase_OrderLine.' +
        'FSC_Material_Claim) '
      
        #9#9'ON Product_Type.Product_Type = Purchase_OrderLine.Product_Type' +
        ') '
      
        #9#9'ON (Customer_Branch.Branch_no = Purchase_OrderLine.Branch_no) ' +
        'AND (Customer_Branch.Customer = Purchase_OrderLine.Customer)) '
      #9#9'ON Customer.Customer = Customer_Branch.Customer) '
      #9'INNER JOIN Delivery_Detail '
      
        #9#9'ON (Purchase_OrderLine.Line = Delivery_Detail.Line) AND (Purch' +
        'ase_OrderLine.Purchase_Order = Delivery_Detail.Purchase_Order)'
      'WHERE'
      '      ('
      
        '      (Purchase_OrderLine.FSC_Material_Claim = :FSC_Material_Cla' +
        'im) or (0 = :FSC_Material_Claim)'
      '      ) and'
      '      ('
      
        '      (FSC_Material_Claim.Claim_Type = :Claim_Type) or ('#39'BOTH'#39' =' +
        ' :Claim_Type)'
      '      ) and'
      '      ('
      
        '      (Purchase_OrderLine.Product_Type = :Product_Type) or (0 = ' +
        ':Product_Type)) and'
      '      ('
      '      (Delivery_Detail.Date_Deliv_Actual >= :Date_From) and'
      '      (Delivery_Detail.Date_Deliv_Actual <= :Date_To)'
      '      )'
      'GROUP BY Purchase_OrderLine.Purchase_Order,'
      #9'Purchase_OrderLine.Line, '
      #9'Purchase_OrderLine.Customer, '
      #9'Customer.Name, '
      '  Purchase_orderLine.Customers_Desc,'
      #9'FSC_Material_Claim.FSC_Material_Claim, '
      #9'FSC_Material_Claim.Claim_Description,'
      #9'FSC_Material_Claim.Claim_Type,'
      #9'Product_Type.Product_Type, '
      #9'Product_Type.Description, '
      #9'Product_Type.FSC_Product_Type_Code, '
      #9'Delivery_Detail.Date_Deliv_Actual'
      
        'ORDER BY '#9'FSC_Material_Claim.Claim_Description, Product_Type.Des' +
        'cription, Purchase_OrderLine.Purchase_Order'
      ''
      '')
    Left = 96
    Top = 16
    ParamData = <
      item
        Name = 'FSC_Material_Claim'
        DataType = ftInteger
      end
      item
        Name = 'FSC_Material_Claim'
        DataType = ftInteger
      end
      item
        Name = 'Claim_Type'
      end
      item
        Name = 'Claim_Type'
      end
      item
        Name = 'Product_Type'
        DataType = ftInteger
      end
      item
        Name = 'Product_Type'
        DataType = ftInteger
      end
      item
        Name = 'Date_From'
        DataType = ftDateTime
      end
      item
        Name = 'Date_To'
        DataType = ftDateTime
      end>
    object qryReportPurchase_Order: TFloatField
      FieldName = 'Purchase_Order'
    end
    object qryReportLine: TIntegerField
      FieldName = 'Line'
    end
    object qryReportCustomer: TIntegerField
      FieldName = 'Customer'
    end
    object qryReportCustomers_Desc: TStringField
      FieldName = 'Customers_Desc'
      FixedChar = True
      Size = 80
    end
    object qryReportCustomer_Name: TStringField
      FieldName = 'Customer_Name'
      FixedChar = True
      Size = 92
    end
    object qryReportFSC_Material_Claim: TIntegerField
      FieldName = 'FSC_Material_Claim'
    end
    object qryReportClaim_Description: TStringField
      FieldName = 'Claim_Description'
      FixedChar = True
      Size = 100
    end
    object qryReportClaim_Type: TStringField
      FieldName = 'Claim_Type'
      FixedChar = True
      Size = 10
    end
    object qryReportProduct_Type: TIntegerField
      FieldName = 'Product_Type'
    end
    object qryReportProduct_Type_Description: TStringField
      FieldName = 'Product_Type_Description'
      FixedChar = True
      Size = 80
    end
    object qryReportFSC_Product_Type_Code: TIntegerField
      FieldName = 'FSC_Product_Type_Code'
    end
    object qryReportDate_Deliv_Actual: TDateTimeField
      FieldName = 'Date_Deliv_Actual'
    end
    object qryReportQty_To_Deliver: TFloatField
      FieldName = 'Qty_To_Deliver'
    end
    object qryReportQty_Received: TFloatField
      FieldName = 'Qty_Received'
      DisplayFormat = '#,###,##0'
    end
  end
  object qryGetStock: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select  Purchase_Order,'
      '        Date_Received,'
      '        SUM(Store_Quantity) as Total_Stock'
      'from Store_Stock'
      'where Purchase_order = :Purchase_order and'
      '      Date_Received = :Date_Received'
      'GROUP BY'
      '        Purchase_Order,'
      '        Date_Received')
    Left = 288
    Top = 8
    ParamData = <
      item
        Name = 'Purchase_order'
      end
      item
        Name = 'Date_Received'
      end>
  end
end
