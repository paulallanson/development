object frmWTRPSOProduction: TfrmWTRPSOProduction
  Left = 203
  Top = 110
  Caption = 'Sales Order Production Report'
  ClientHeight = 472
  ClientWidth = 1152
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Scaled = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 13
  object qrpdetails: TQuickRep
    Left = 144
    Top = 8
    Width = 992
    Height = 1403
    ShowingPreview = False
    BeforePrint = qrpdetailsBeforePrint
    DataSet = qryWorktops
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
    PrinterSettings.PrintQuality = 0
    PrinterSettings.Collate = 0
    PrinterSettings.ColorOption = 0
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
    object qrSubMaterial: TQRSubDetail
      Left = 47
      Top = 194
      Width = 898
      Height = 34
      AfterPrint = qrSubMaterialAfterPrint
      AlignToBottom = False
      BeforePrint = qrSubMaterialBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        71.966666666666670000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpdetails
      DataSet = qryWorktops
      FooterBand = qrgrpFootMaterial
      HeaderBand = qrgrpHeadMaterial
      PrintBefore = False
      PrintIfEmpty = True
      object qrlblMaterialDescription: TQRLabel
        Left = 80
        Top = 5
        Width = 171
        Height = 21
        Size.Values = (
          44.450000000000000000
          169.333333333333300000
          10.583333333333330000
          361.950000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblMaterialDescription'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblArea: TQRLabel
        Left = 599
        Top = 5
        Width = 66
        Height = 21
        Size.Values = (
          44.450000000000000000
          1267.883333333333000000
          10.583333333333330000
          139.700000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblArea'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object qrgrpHeadMaterial: TQRBand
      Left = 47
      Top = 191
      Width = 898
      Height = 3
      AlignToBottom = False
      BeforePrint = qrgrpHeadMaterialBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        6.350000000000000000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupHeader
      object qrlblMaterialTitle: TQRLabel
        Left = 80
        Top = 10
        Width = 148
        Height = 21
        Size.Values = (
          44.450000000000000000
          169.333333333333300000
          21.166666666666670000
          313.266666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Material Type/Brand'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblMaterialCount: TQRLabel
        Left = 543
        Top = 10
        Width = 83
        Height = 21
        Size.Values = (
          44.450000000000000000
          1149.350000000000000000
          21.166666666666670000
          175.683333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Area (sqm)'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object qrSubCutOuts: TQRSubDetail
      Left = 47
      Top = 269
      Width = 898
      Height = 32
      AfterPrint = qrSubCutOutsAfterPrint
      AlignToBottom = False
      BeforePrint = qrSubCutOutsBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        67.733333333333330000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpdetails
      DataSet = qryCutOuts
      HeaderBand = qrgrpHeadCutOuts
      PrintBefore = False
      PrintIfEmpty = True
      object qrlblCutOutDescription: TQRLabel
        Left = 80
        Top = 10
        Width = 491
        Height = 21
        Size.Values = (
          44.979166666666670000
          169.333333333333300000
          21.166666666666670000
          1039.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'qrlblCutOutDescription'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblQuantity: TQRLabel
        Left = 575
        Top = 10
        Width = 91
        Height = 21
        Size.Values = (
          44.450000000000000000
          1217.083333333333000000
          21.166666666666670000
          192.616666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblQuantity'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object qrgrpHeadCutOuts: TQRBand
      Left = 47
      Top = 266
      Width = 898
      Height = 3
      AfterPrint = qrgrpHeadCutOutsAfterPrint
      AlignToBottom = False
      BeforePrint = qrgrpHeadCutOutsBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        6.350000000000000000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupHeader
      object qrlblCutOutTitle: TQRLabel
        Left = 80
        Top = 8
        Width = 64
        Height = 21
        Size.Values = (
          44.450000000000000000
          169.333333333333300000
          16.933333333333330000
          135.466666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cut Outs'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblCutOutCount: TQRLabel
        Left = 567
        Top = 8
        Width = 58
        Height = 21
        Size.Values = (
          44.450000000000000000
          1200.150000000000000000
          16.933333333333330000
          122.766666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Number'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object qrsubEdgeProfile: TQRSubDetail
      Left = 47
      Top = 304
      Width = 898
      Height = 32
      AfterPrint = qrsubEdgeProfileAfterPrint
      AlignToBottom = False
      BeforePrint = qrsubEdgeProfileBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        67.733333333333330000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpdetails
      DataSet = qryEdges
      FooterBand = qrgrpFootEdgeProfile
      HeaderBand = qrgrpEdgeProfile
      PrintBefore = False
      PrintIfEmpty = True
      object qrlblEdgeProfileDescription: TQRLabel
        Left = 80
        Top = 10
        Width = 491
        Height = 21
        Size.Values = (
          44.979166666666670000
          169.333333333333300000
          21.166666666666670000
          1039.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'qrlblEdgeProfileDescription'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblLength: TQRLabel
        Left = 585
        Top = 10
        Width = 80
        Height = 21
        Size.Values = (
          44.450000000000000000
          1238.250000000000000000
          21.166666666666670000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblLength'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object qrgrpEdgeProfile: TQRBand
      Left = 47
      Top = 301
      Width = 898
      Height = 3
      AfterPrint = qrgrpEdgeProfileAfterPrint
      AlignToBottom = False
      BeforePrint = qrgrpEdgeProfileBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        6.350000000000000000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupHeader
      object qrlblEdgeTitle: TQRLabel
        Left = 80
        Top = 9
        Width = 99
        Height = 21
        Size.Values = (
          44.450000000000000000
          169.333333333333300000
          19.050000000000000000
          209.550000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Edge Profiles'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblEdgeCount: TQRLabel
        Left = 546
        Top = 9
        Width = 80
        Height = 21
        Size.Values = (
          44.450000000000000000
          1155.700000000000000000
          19.050000000000000000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Length (m)'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object QRBand1: TQRBand
      Left = 47
      Top = 47
      Width = 898
      Height = 144
      Frame.DrawBottom = True
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        304.800000000000000000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object qrlblCaption: TQRLabel
        Left = 290
        Top = 3
        Width = 319
        Height = 29
        Size.Values = (
          61.383333333333330000
          613.833333333333300000
          6.350000000000000000
          675.216666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Production Requirement Report'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -23
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 14
      end
      object qrlblDateRange: TQRLabel
        Left = 399
        Top = 33
        Width = 102
        Height = 21
        Size.Values = (
          44.450000000000000000
          844.550000000000000000
          69.850000000000000000
          215.900000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'qrlblDateRange'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object gtQRSysData1: TQRSysData
        Left = 820
        Top = 10
        Width = 68
        Height = 21
        Size.Values = (
          44.450000000000000000
          1735.666666666667000000
          21.166666666666670000
          143.933333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsDateTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
        Transparent = False
        ExportAs = exptText
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtQRSysData2: TQRSysData
        Left = 802
        Top = 29
        Width = 84
        Height = 21
        Size.Values = (
          44.450000000000000000
          1697.566666666667000000
          61.383333333333330000
          177.800000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = 'Page: '
        Transparent = False
        ExportAs = exptText
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlblSelection: TQRLabel
        Left = 229
        Top = 57
        Width = 441
        Height = 21
        Size.Values = (
          44.979166666666670000
          484.187500000000000000
          121.708333333333300000
          933.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlblSelection'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qrlblCategoryTitle: TQRLabel
        Left = 80
        Top = 117
        Width = 212
        Height = 21
        Size.Values = (
          44.450000000000000000
          169.333333333333300000
          247.650000000000000000
          448.733333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'CNC - Cut Out Requirements'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblCategoryCount: TQRLabel
        Left = 607
        Top = 117
        Width = 58
        Height = 21
        Size.Values = (
          44.450000000000000000
          1284.816666666667000000
          247.650000000000000000
          122.766666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Number'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object qrgrpFootMaterial: TQRBand
      Left = 47
      Top = 228
      Width = 898
      Height = 38
      AlignToBottom = False
      BeforePrint = qrgrpFootMaterialBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        80.433333333333330000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object gtQRLabel1: TQRLabel
        Left = 390
        Top = 10
        Width = 131
        Height = 21
        Size.Values = (
          44.450000000000000000
          825.500000000000000000
          21.166666666666670000
          277.283333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Total Area (sqm)'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblTotalArea: TQRLabel
        Left = 593
        Top = 10
        Width = 72
        Height = 21
        Size.Values = (
          44.450000000000000000
          1255.183333333333000000
          21.166666666666670000
          152.400000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblArea'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape1: TQRShape
        Left = 355
        Top = 0
        Width = 311
        Height = 10
        Size.Values = (
          21.166666666666670000
          751.416666666666700000
          0.000000000000000000
          658.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
    object qrgrpFootEdgeProfile: TQRBand
      Left = 47
      Top = 336
      Width = 898
      Height = 38
      AlignToBottom = False
      BeforePrint = qrgrpFootEdgeProfileBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        80.433333333333330000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object qrlblTotalLength: TQRLabel
        Left = 534
        Top = 10
        Width = 130
        Height = 21
        Size.Values = (
          44.450000000000000000
          1130.300000000000000000
          21.166666666666670000
          275.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblTotalLength'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel2: TQRLabel
        Left = 383
        Top = 10
        Width = 153
        Height = 21
        Size.Values = (
          44.450000000000000000
          810.683333333333300000
          21.166666666666670000
          323.850000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Total Linear metres'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape3: TQRShape
        Left = 355
        Top = 0
        Width = 311
        Height = 10
        Size.Values = (
          21.166666666666670000
          751.416666666666700000
          0.000000000000000000
          658.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
  end
  object qryWorktops: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Material_Type.Description AS Material_Description,'
      
        '        Sum(((Quote_Element.Depth*Quote_Element.Length)/1000000)' +
        '*Quote_Element.Quantity) AS Total_Area'
      'FROM Customer'
      '        INNER JOIN (Material_Type'
      '        INNER JOIN (Sales_Order'
      '        INNER JOIN (((Quote_Element'
      '        INNER JOIN (Sales_Order_Line'
      '        INNER JOIN Quote'
      '          ON Sales_Order_Line.Quote = Quote.Quote)'
      '          ON Quote_Element.Quote = Quote.Quote)'
      '        INNER JOIN Worktop'
      '          ON Quote_Element.Worktop = Worktop.Worktop)'
      '        INNER JOIN Thickness'
      '          ON Quote_Element.Thickness = Thickness.Thickness)'
      
        '          ON Sales_Order.Sales_Order = Sales_Order_Line.Sales_Or' +
        'der)'
      
        '          ON Material_Type.Material_Type = Worktop.Material_Type' +
        ')'
      '          ON Customer.Customer = Sales_Order.Customer'
      
        'WHERE ((Sales_Order.Date_Required >= :Date_From) and (Sales_orde' +
        'r.Date_Required <= :Date_To)) and'
      '      (Sales_Order.Sales_Order_Status < 1000) and'
      
        '      ((Sales_Order.inactive = '#39'N'#39') or (Sales_Order.inactive is ' +
        'NULL) or (Sales_Order.inactive = '#39#39')) AND'
      
        '      (((Customer.Is_Retail_Customer = :Is_Retail_Customer) AND ' +
        '(Customer.Is_Commercial_Customer = :Is_Commercial_Customer)) or ' +
        '(:Is_Retail_Customer = '#39'A'#39'))'
      ''
      '')
    Left = 976
    Top = 192
    ParamData = <
      item
        Name = 'Date_From'
      end
      item
        Name = 'Date_To'
      end
      item
        Name = 'Is_Retail_Customer'
      end
      item
        Name = 'Is_Commercial_Customer'
      end
      item
        Name = 'Is_Retail_Customer'
      end>
  end
  object qryCutOuts: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Material_Type.Description AS Material_Description,'
      '        Edge_Type.Edge_Type_Description,'
      '        CutOut.Description AS CutOut_Description,'
      '        Sum(Quote_Cutout.Quantity) AS Total_Quantity'
      'FROM Customer'
      '        INNER JOIN (Sales_Order'
      '        INNER JOIN (CutOut'
      '        INNER JOIN ((Sales_Order_Line'
      '        INNER JOIN Quote'
      '          ON Sales_Order_Line.Quote = Quote.Quote)'
      '        INNER JOIN ((Quote_Cutout'
      '        INNER JOIN Material_Type'
      
        '          ON Quote_Cutout.Material_Type = Material_Type.Material' +
        '_Type)'
      '        INNER JOIN Edge_Type'
      '          ON Quote_Cutout.Edge_Type = Edge_Type.Edge_Type)'
      '          ON Quote.Quote = Quote_Cutout.Quote)'
      '          ON CutOut.CutOut = Quote_Cutout.Cutout)'
      
        '          ON Sales_Order.Sales_Order = Sales_Order_Line.Sales_Or' +
        'der)'
      '          ON Customer.Customer = Sales_Order.Customer'
      
        'WHERE ((Sales_Order.Date_Required >= :Date_From) and (Sales_orde' +
        'r.Date_Required <= :Date_To)) and'
      '      (Sales_Order.Sales_Order_Status < 90) and'
      
        '      ((Sales_Order.inactive = '#39'N'#39') or (Sales_Order.inactive is ' +
        'NULL) or (Sales_Order.inactive = '#39#39')) AND'
      
        '      ((Customer.Is_Retail_Customer = :TradeRetail) OR (:TradeRe' +
        'tail = '#39'A'#39'))'
      '')
    Left = 976
    Top = 248
    ParamData = <
      item
        Name = 'Date_From'
      end
      item
        Name = 'Date_To'
      end
      item
        Name = 'TradeRetail'
      end
      item
        Name = 'TradeRetail'
      end>
  end
  object qryEdges: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Edge_profile.Description AS Edge_Profile_Description,'
      '        Material_Type.Description as Material_Description,'
      '        Edge_Type.Edge_Type_Description,'
      '        Sum(Quote_Edge.Length/1000) AS Total_Length'
      'FROM Customer'
      '      INNER JOIN (Sales_Order'
      '      INNER JOIN (Edge_profile'
      '      INNER JOIN ((Sales_Order_Line'
      '      INNER JOIN Quote'
      '        ON Sales_Order_Line.Quote = Quote.Quote)'
      '      INNER JOIN ((Quote_Edge'
      '      INNER JOIN Material_Type'
      
        '        ON Quote_Edge.Material_Type = Material_Type.Material_Typ' +
        'e)'
      '      INNER JOIN Edge_Type'
      '        ON Quote_Edge.Edge_Type = Edge_Type.Edge_Type)'
      '        ON Quote.Quote = Quote_Edge.Quote)'
      '        ON Edge_profile.Edge_profile = Quote_Edge.Edge_profile)'
      
        '        ON Sales_Order.Sales_Order = Sales_Order_Line.Sales_Orde' +
        'r)'
      '        ON Customer.Customer = Sales_Order.Customer'
      
        'WHERE ((Sales_Order.Date_Required >= :Date_From) and (Sales_orde' +
        'r.Date_Required <= :Date_To)) and'
      '      (Sales_Order.Sales_Order_Status < 90) and'
      
        '      ((Sales_Order.inactive = '#39'N'#39') or (Sales_Order.inactive is ' +
        'NULL) or (Sales_Order.inactive = '#39#39')) AND'
      
        '      ((Customer.Is_Retail_Customer = :TradeRetail) OR (:TradeRe' +
        'tail = '#39'A'#39'))'
      '')
    Left = 976
    Top = 312
    ParamData = <
      item
        Name = 'Date_From'
      end
      item
        Name = 'Date_To'
      end
      item
        Name = 'TradeRetail'
      end
      item
        Name = 'TradeRetail'
      end>
  end
  object qryBaseCutOuts: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'FROM Customer'
      '        INNER JOIN (Sales_Order'
      '        INNER JOIN (CutOut'
      '        INNER JOIN ((Sales_Order_Line'
      '        INNER JOIN Quote'
      '          ON Sales_Order_Line.Quote = Quote.Quote)'
      '        INNER JOIN ((Quote_Cutout'
      '        INNER JOIN Material_Type'
      
        '          ON Quote_Cutout.Material_Type = Material_Type.Material' +
        '_Type)'
      '        INNER JOIN Edge_Type'
      '          ON Quote_Cutout.Edge_Type = Edge_Type.Edge_Type)'
      '          ON Quote.Quote = Quote_Cutout.Quote)'
      '          ON CutOut.CutOut = Quote_Cutout.Cutout)'
      
        '          ON Sales_Order.Sales_Order = Sales_Order_Line.Sales_Or' +
        'der)'
      '          ON Customer.Customer = Sales_Order.Customer'
      
        'WHERE ((Sales_Order.Date_Required >= :Date_From) and (Sales_orde' +
        'r.Date_Required <= :Date_To)) and'
      '      (Sales_Order.Sales_Order_Status < 1000) and'
      
        '      ((Sales_Order.inactive = '#39'N'#39') or (Sales_Order.inactive is ' +
        'NULL) or (Sales_Order.inactive = '#39#39')) AND'
      
        '      (((Customer.Is_Retail_Customer = :Is_Retail_Customer) AND ' +
        '(Customer.Is_Commercial_Customer = :Is_Commercial_Customer)) or ' +
        '(:Is_Retail_Customer = '#39'A'#39'))'
      '')
    Left = 1048
    Top = 248
    ParamData = <
      item
        Name = 'Date_From'
      end
      item
        Name = 'Date_To'
      end
      item
        Name = 'Is_Retail_Customer'
      end
      item
        Name = 'Is_Commercial_Customer'
      end
      item
        Name = 'Is_Retail_Customer'
      end>
  end
  object qryBaseEdges: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'FROM Customer'
      '      INNER JOIN (Sales_Order'
      '      INNER JOIN (Edge_profile'
      '      INNER JOIN ((Sales_Order_Line'
      '      INNER JOIN Quote'
      '        ON Sales_Order_Line.Quote = Quote.Quote)'
      '      INNER JOIN ((Quote_Edge'
      '      INNER JOIN Material_Type'
      
        '        ON Quote_Edge.Material_Type = Material_Type.Material_Typ' +
        'e)'
      '      INNER JOIN Edge_Type'
      '        ON Quote_Edge.Edge_Type = Edge_Type.Edge_Type)'
      '        ON Quote.Quote = Quote_Edge.Quote)'
      '        ON Edge_profile.Edge_profile = Quote_Edge.Edge_profile)'
      
        '        ON Sales_Order.Sales_Order = Sales_Order_Line.Sales_Orde' +
        'r)'
      '        ON Customer.Customer = Sales_Order.Customer'
      
        'WHERE ((Sales_Order.Date_Required >= :Date_From) and (Sales_orde' +
        'r.Date_Required <= :Date_To)) and'
      '      (Sales_Order.Sales_Order_Status < 1000) and'
      
        '      ((Sales_Order.inactive = '#39'N'#39') or (Sales_Order.inactive is ' +
        'NULL) or (Sales_Order.inactive = '#39#39')) AND'
      
        '      (((Customer.Is_Retail_Customer = :Is_Retail_Customer) AND ' +
        '(Customer.Is_Commercial_Customer = :Is_Commercial_Customer)) or ' +
        '(:Is_Retail_Customer = '#39'A'#39'))'
      '')
    Left = 1048
    Top = 312
    ParamData = <
      item
        Name = 'Date_From'
      end
      item
        Name = 'Date_To'
      end
      item
        Name = 'Is_Retail_Customer'
      end
      item
        Name = 'Is_Commercial_Customer'
      end
      item
        Name = 'Is_Retail_Customer'
      end>
  end
end
