object PBRPProofFrm: TPBRPProofFrm
  Left = 141
  Top = 27
  Width = 951
  Height = 658
  HorzScrollBar.Range = 1200
  VertScrollBar.Range = 2000
  Caption = 'Print Proof Approval Letter'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  Scaled = False
  OnCreate = FormCreate
  TextHeight = 14
  object PrintPOsQuickReport: TQuickRep
    Left = 64
    Top = 8
    Width = 992
    Height = 1403
    ShowingPreview = False
    BeforePrint = PrintPOsQuickReportBeforePrint
    DataSet = GetProofSQL
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
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
    Page.PaperSize = Default
    Page.Continuous = False
    Page.Values = (
      100.000000000000000000
      2970.000000000000000000
      100.000000000000000000
      2100.000000000000000000
      100.000000000000000000
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
    object PageHeaderQRBand: TQRBand
      Left = 47
      Top = 47
      Width = 907
      Height = 534
      AfterPrint = PageHeaderQRBandAfterPrint
      AlignToBottom = False
      BeforePrint = PageHeaderQRBandBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        1130.300000000000000000
        1919.816666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object OrderLbl: TQRLabel
        Left = 631
        Top = 135
        Width = 270
        Height = 51
        Size.Values = (
          107.950000000000000000
          1335.616666666667000000
          285.750000000000000000
          571.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Proof Approval'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -37
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 22
      end
      object PONumberLbl: TQRLabel
        Left = 733
        Top = 335
        Width = 94
        Height = 20
        Size.Values = (
          42.333333333333330000
          1551.516666666667000000
          709.083333333333300000
          198.966666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'PONumberLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel4: TQRLabel
        Left = 50
        Top = 474
        Width = 94
        Height = 25
        Size.Values = (
          52.916666666666670000
          105.833333333333300000
          1003.300000000000000000
          198.966666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'ORDER REF:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object YourRefLbl: TQRLabel
        Left = 50
        Top = 494
        Width = 73
        Height = 26
        Size.Values = (
          55.033333333333330000
          105.833333333333300000
          1045.633333333333000000
          154.516666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'YourRefLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object AddressMemo: TQRMemo
        Left = 50
        Top = 215
        Width = 341
        Height = 156
        Size.Values = (
          330.729166666666700000
          105.833333333333300000
          455.083333333333300000
          722.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        Lines.Strings = (
          'For Delivery To:')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object QRDBText2: TQRDBText
        Left = 50
        Top = 439
        Width = 40
        Height = 25
        Size.Values = (
          52.916666666666670000
          105.833333333333300000
          929.216666666666700000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = GetProofSQL
        DataField = 'Name'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel20: TQRLabel
        Left = 50
        Top = 419
        Width = 93
        Height = 23
        Size.Values = (
          48.683333333333330000
          105.833333333333300000
          886.883333333333300000
          196.850000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'CUSTOMER:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object DateLbl: TQRLabel
        Left = 776
        Top = 369
        Width = 51
        Height = 23
        Size.Values = (
          48.683333333333330000
          1642.533333333333000000
          781.050000000000000000
          107.950000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'DateLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object lblProofRevision: TQRLabel
        Left = 720
        Top = 449
        Width = 106
        Height = 26
        Size.Values = (
          55.033333333333330000
          1524.000000000000000000
          950.383333333333300000
          224.366666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblProofRevision'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object lblOfficeContact: TQRLabel
        Left = 727
        Top = 409
        Width = 99
        Height = 26
        Size.Values = (
          55.033333333333330000
          1538.816666666667000000
          865.716666666666700000
          209.550000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Office Contact:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRMemoCmpnyNm: TQRMemo
        Left = 780
        Top = 110
        Width = 124
        Height = 21
        Enabled = False
        Size.Values = (
          44.450000000000000000
          1651.000000000000000000
          232.833333333333300000
          262.466666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoStretch = True
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object ReportImage: TQRImage
        Left = 3
        Top = 0
        Width = 896
        Height = 113
        Size.Values = (
          238.125000000000000000
          5.291666666666667000
          0.000000000000000000
          1897.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Stretch = True
      end
      object QRDBText1: TQRDBText
        Left = 750
        Top = 499
        Width = 81
        Height = 23
        Enabled = False
        Size.Values = (
          48.683333333333330000
          1587.500000000000000000
          1056.216666666667000000
          171.450000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRShape13: TQRShape
        Left = 50
        Top = 529
        Width = 851
        Height = 5
        Size.Values = (
          10.583333333333330000
          105.833333333333300000
          1119.187500000000000000
          1801.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
    object DetailQRBand: TQRBand
      Left = 47
      Top = 581
      Width = 907
      Height = 840
      AlignToBottom = False
      BeforePrint = DetailQRBandBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        1778.000000000000000000
        1919.816666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRShape1: TQRShape
        Left = 50
        Top = 70
        Width = 851
        Height = 5
        Size.Values = (
          10.583333333333330000
          105.833333333333300000
          148.166666666666700000
          1801.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel12: TQRLabel
        Left = 265
        Top = 149
        Width = 46
        Height = 25
        Size.Values = (
          52.916666666666670000
          560.916666666666700000
          315.383333333333300000
          97.366666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Signed'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel15: TQRLabel
        Left = 765
        Top = 149
        Width = 32
        Height = 25
        Size.Values = (
          52.916666666666670000
          1619.250000000000000000
          315.383333333333300000
          67.733333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRShape5: TQRShape
        Left = 315
        Top = 165
        Width = 188
        Height = 5
        Size.Values = (
          10.583333333333300000
          666.750000000000000000
          349.250000000000000000
          396.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape8: TQRShape
        Left = 795
        Top = 165
        Width = 100
        Height = 5
        Size.Values = (
          10.583333333333300000
          1682.750000000000000000
          349.250000000000000000
          211.666666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel18: TQRLabel
        Left = 50
        Top = 89
        Width = 530
        Height = 25
        Size.Values = (
          52.916666666666670000
          105.833333333333300000
          188.383333333333300000
          1121.833333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          'All proof details have been carefully checked and are approved a' +
          's follows:-'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel3: TQRLabel
        Left = 50
        Top = 149
        Width = 121
        Height = 42
        Size.Values = (
          89.958333333333330000
          105.833333333333300000
          314.854166666666700000
          256.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'PROCEED, NO AMENDMENTS'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel5: TQRLabel
        Left = 50
        Top = 222
        Width = 141
        Height = 49
        Size.Values = (
          103.187500000000000000
          105.833333333333300000
          470.958333333333300000
          298.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'PROCEED, AFTER AMENDMENTS'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel6: TQRLabel
        Left = 265
        Top = 222
        Width = 46
        Height = 25
        Size.Values = (
          52.916666666666670000
          560.916666666666700000
          469.900000000000000000
          97.366666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Signed'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRShape2: TQRShape
        Left = 315
        Top = 239
        Width = 188
        Height = 5
        Size.Values = (
          10.583333333333300000
          666.750000000000000000
          505.354166666667000000
          396.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel7: TQRLabel
        Left = 765
        Top = 222
        Width = 32
        Height = 25
        Size.Values = (
          52.916666666666670000
          1619.250000000000000000
          469.900000000000000000
          67.733333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRShape3: TQRShape
        Left = 795
        Top = 239
        Width = 100
        Height = 5
        Size.Values = (
          10.583333333333300000
          1682.750000000000000000
          505.354166666667000000
          211.666666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel8: TQRLabel
        Left = 50
        Top = 294
        Width = 149
        Height = 26
        Size.Values = (
          55.033333333333330000
          105.833333333333300000
          622.300000000000000000
          315.383333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'AMEND & REPROOF'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel9: TQRLabel
        Left = 265
        Top = 294
        Width = 46
        Height = 25
        Size.Values = (
          52.916666666666670000
          560.916666666666700000
          622.300000000000000000
          97.366666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Signed'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRShape4: TQRShape
        Left = 315
        Top = 310
        Width = 188
        Height = 5
        Size.Values = (
          10.583333333333300000
          666.750000000000000000
          656.166666666667000000
          396.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel10: TQRLabel
        Left = 765
        Top = 294
        Width = 32
        Height = 25
        Size.Values = (
          52.916666666666670000
          1619.250000000000000000
          622.300000000000000000
          67.733333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRShape6: TQRShape
        Left = 795
        Top = 310
        Width = 100
        Height = 5
        Size.Values = (
          10.583333333333300000
          1682.750000000000000000
          656.166666666667000000
          211.666666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape7: TQRShape
        Left = 50
        Top = 350
        Width = 851
        Height = 5
        Size.Values = (
          10.583333333333330000
          105.833333333333300000
          740.833333333333300000
          1801.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape9: TQRShape
        Left = 50
        Top = 548
        Width = 851
        Height = 5
        Size.Values = (
          10.583333333333330000
          105.833333333333300000
          1158.875000000000000000
          1801.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel11: TQRLabel
        Left = 50
        Top = 555
        Width = 308
        Height = 25
        Size.Values = (
          52.916666666666670000
          105.833333333333300000
          1174.750000000000000000
          651.933333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'CUSTOMER REMARKS / SPECIAL NOTES :'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel13: TQRLabel
        Left = 50
        Top = 8
        Width = 78
        Height = 25
        Size.Values = (
          52.916666666666670000
          105.833333333333300000
          16.933333333333330000
          165.100000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'QUANTITY'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel14: TQRLabel
        Left = 150
        Top = 8
        Width = 79
        Height = 25
        Size.Values = (
          52.916666666666670000
          317.500000000000000000
          16.933333333333330000
          167.216666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'JOB TITLE'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel16: TQRLabel
        Left = 740
        Top = 8
        Width = 53
        Height = 25
        Size.Values = (
          52.916666666666670000
          1566.333333333333000000
          16.933333333333330000
          112.183333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'DEPTH'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel17: TQRLabel
        Left = 810
        Top = 8
        Width = 50
        Height = 25
        Size.Values = (
          52.916666666666670000
          1714.500000000000000000
          16.933333333333330000
          105.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'WIDTH'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel25: TQRLabel
        Left = 794
        Top = 34
        Width = 10
        Height = 26
        Size.Values = (
          55.033333333333330000
          1680.633333333333000000
          71.966666666666670000
          21.166666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'X'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel26: TQRLabel
        Left = 50
        Top = 360
        Width = 620
        Height = 26
        Size.Values = (
          55.033333333333330000
          105.833333333333300000
          762.000000000000000000
          1312.333333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          'All paper proofs are paper/laser copies and as such may differ s' +
          'lightly dimensionally.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel27: TQRLabel
        Left = 51
        Top = 434
        Width = 413
        Height = 26
        Size.Values = (
          55.033333333333330000
          107.950000000000000000
          918.633333333333300000
          874.183333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Please check layout, spacing and spelling very carefully '
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel28: TQRLabel
        Left = 444
        Top = 432
        Width = 509
        Height = 23
        Size.Values = (
          48.683333333333330000
          939.800000000000000000
          914.400000000000000000
          1077.383333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'paying particular attention to names and telephone numbers etc.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel30: TQRLabel
        Left = 50
        Top = 458
        Width = 665
        Height = 26
        Size.Values = (
          55.033333333333330000
          105.833333333333300000
          969.433333333333300000
          1407.583333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          'as no liability can be accepted for errors and omissions once th' +
          'e proof has been approved.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel31: TQRLabel
        Left = 51
        Top = 506
        Width = 556
        Height = 26
        Size.Values = (
          55.033333333333330000
          107.950000000000000000
          1071.033333333333000000
          1176.866666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          'Work cannot proceed until we have this proof slip signed and ret' +
          'urned to us.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object LabQuantity: TQRLabel
        Left = 50
        Top = 34
        Width = 79
        Height = 26
        Size.Values = (
          55.033333333333330000
          105.833333333333300000
          71.966666666666670000
          167.216666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'LabQuantity'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object LabJobTitle: TQRLabel
        Left = 150
        Top = 34
        Width = 511
        Height = 26
        Size.Values = (
          55.562500000000000000
          317.500000000000000000
          71.437500000000000000
          1082.145833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'LabJobTitle'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object LabDepth: TQRLabel
        Left = 722
        Top = 34
        Width = 64
        Height = 26
        Size.Values = (
          55.033333333333330000
          1528.233333333333000000
          71.966666666666670000
          135.466666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'LabDepth'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object LabWidth: TQRLabel
        Left = 810
        Top = 34
        Width = 63
        Height = 26
        Size.Values = (
          55.033333333333330000
          1714.500000000000000000
          71.966666666666670000
          133.350000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'LabWidth'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRShape10: TQRShape
        Left = 565
        Top = 165
        Width = 188
        Height = 5
        Size.Values = (
          10.583333333333300000
          1195.916666666670000000
          349.250000000000000000
          396.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape11: TQRShape
        Left = 565
        Top = 239
        Width = 188
        Height = 5
        Size.Values = (
          10.583333333333300000
          1195.916666666670000000
          505.354166666667000000
          396.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape12: TQRShape
        Left = 565
        Top = 310
        Width = 188
        Height = 5
        Size.Values = (
          10.583333333333300000
          1195.916666666670000000
          656.166666666667000000
          396.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel1: TQRLabel
        Left = 515
        Top = 149
        Width = 40
        Height = 25
        Size.Values = (
          52.916666666666670000
          1090.083333333333000000
          315.383333333333300000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Name'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel2: TQRLabel
        Left = 515
        Top = 222
        Width = 40
        Height = 25
        Size.Values = (
          52.916666666666670000
          1090.083333333333000000
          469.900000000000000000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Name'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel19: TQRLabel
        Left = 515
        Top = 294
        Width = 40
        Height = 25
        Size.Values = (
          52.916666666666670000
          1090.083333333333000000
          622.300000000000000000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Name'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel21: TQRLabel
        Left = 51
        Top = 483
        Width = 346
        Height = 26
        Size.Values = (
          55.033333333333330000
          107.950000000000000000
          1022.350000000000000000
          732.366666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Authors corrections will be chargeable as extra.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel22: TQRLabel
        Left = 51
        Top = 385
        Width = 783
        Height = 26
        Size.Values = (
          55.033333333333330000
          107.950000000000000000
          814.916666666666700000
          1657.350000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          'The colours shown on inkjet/laser proofs are not accurate. The a' +
          'ctual colours on the finished job may differ '
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel23: TQRLabel
        Left = 51
        Top = 409
        Width = 134
        Height = 26
        Size.Values = (
          55.033333333333330000
          107.950000000000000000
          865.716666666666700000
          283.633333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'from those shown.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
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
      Top = 1421
      Width = 907
      Height = 20
      AfterPrint = QRBand1AfterPrint
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        42.333333333333330000
        1919.816666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageFooter
    end
  end
  object GetProofSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      
        'SELECT Purchase_OrderLine.Purchase_Order, Purchase_OrderLine.Lin' +
        'e,'
      
        '               Purchase_OrderLine.Supplier_Job_Ref, Purchase_Ord' +
        'erLine.Goods_Required,'
      
        '               Purchase_OrderLine.Enquiry, Purchase_OrderLine.Li' +
        'ne0 as Enquiry_Line,'
      
        '               Purchase_OrderLine.Quantity, Purchase_OrderLine.s' +
        'elling_Price as Price,'
      
        '               Purchase_Order.Date_Point, Purchase_OrderLine.Sup' +
        'pliers_Desc,'
      '               Purchase_OrderLine.Customers_Desc,'
      
        '               Purchase_OrderLine.Cust_Order_no, Purchase_OrderL' +
        'ine.Product_Type,'
      '               Customer.Name, Customer_Branch.Building_No_name,'
      
        '               Customer_Branch.Street, Customer_Branch.Locale, C' +
        'ustomer_Branch.Town, '
      
        '               Customer_Branch.Postcode, Customer_Branch.Custome' +
        'r,'
      
        '               Customer_Branch.Branch_No, Customer_Branch.Narrat' +
        'ive,'
      '               Price_Unit.Description as order_Description,'
      '               Rep.Name as Rep_Name,'
      '               Rep.Rep_Suffix_or_prefix,'
      '               Operator.Name as Contact_Name,'
      
        '               Purchase_OrderLine.Depth, Purchase_OrderLine.Widt' +
        'h,'
      
        '               Purchase_OrderLine.Depth_Unit, Purchase_OrderLine' +
        '.Width_Unit,'
      '               Customer_Contact.Name as Cust_Contact_Name,'
      '               Purchase_OrderLine.Form_Reference,'
      '               Purchase_OrderLine.Proof_Revision'
      
        'FROM Purchase_Order, Customer_Branch, Customer, Purchase_OrderLi' +
        'ne,'
      #9#9'Price_Unit, Rep, Operator, Customer_Contact'
      
        'WHERE (Purchase_Order.Purchase_Order = Purchase_OrderLine.Purcha' +
        'se_Order) and'
      
        '      (Customer_Branch.Customer = Purchase_OrderLine.Customer) a' +
        'nd'
      
        '      (Customer_Branch.Branch_No = Purchase_OrderLine.Branch_No)' +
        ' and'
      '      (Customer.Customer = Customer_Branch.Customer) and'
      '      ('
      
        '      (Customer_Contact.Customer = Purchase_OrderLine.Customer) ' +
        'and'
      
        '      (Customer_Contact.Branch_No = Purchase_OrderLine.Branch_No' +
        ') and'
      
        '      (Customer_Contact.Contact_no = Purchase_OrderLine.Contact_' +
        'no)'
      '      ) and'
      '      (Purchase_OrderLine.Rep = Rep.Rep) and'
      '      (Purchase_OrderLine.sell_Unit = Price_Unit.Price_Unit) and'
      
        '      ((Purchase_Order.Purchase_Order = :Purchase_Order ) or (:P' +
        'urchase_Order = 0)) and'
      
        '      ((Purchase_Order.Operator = :Operator ) or (:Operator = 0)' +
        ') and'
      
        '      ((Purchase_OrderLine.Customer = :Customer ) or (:ByCustome' +
        'r <> '#39'Y'#39')) and'
      
        '      ((Purchase_OrderLine.Branch_No = :Branch_No ) or (:ByBranc' +
        'h <> '#39'Y'#39')) and'
      '      (Purchase_Order.Office_Contact = Operator.Operator)'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 48
    Top = 17
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Operator'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Operator'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ByCustomer'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Branch_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ByBranch'
        ParamType = ptUnknown
      end>
  end
  object GetCompSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select * from Company'
      'Where Company = 1')
    Left = 384
    Top = 6
  end
  object CompSRC: TDataSource
    DataSet = GetCompSQL
    Left = 296
    Top = 7
  end
  object POsSRC: TDataSource
    OnDataChange = POsSRCDataChange
    Left = 128
    Top = 23
  end
  object GetPOSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT  Purchase_OrderLine.Depth,'
      '        Purchase_OrderLine.Width,'
      '        Purchase_OrderLine.Customers_Desc,'
      
        '        Purchase_OrderLine.No_Of_Plates, Enquiry.Customer, Enqui' +
        'ry.Branch_No,'
      '        Purchase_OrderLine.Enquiry, Purchase_OrderLine.Line,'
      '        Operator.Name as Contact_Name,'
      '       '#9'Rep.Name as Rep_Name,'
      '       '#9'Rep.Rep_Suffix_or_Prefix,'
      '         Customer_Contact.Name as Customer_Contact,'
      '         Customer_Contact.Salutation,'
      '         Purchase_OrderLine.Quantity'
      
        'FROM Enquiry, Purchase_OrderLine, Operator, rep, Customer_Contac' +
        't'
      'Where (Purchase_OrderLine.Line = :Line) AND'
      '      (Purchase_OrderLine.Enquiry = :Enquiry) and'
      '      (Enquiry.Enquiry = Purchase_OrderLine.Enquiry) and'
      '      (Enquiry.Office_Contact = Operator.Operator)and'
      '      (Enquiry.rep = rep.rep) and'
      '      ('
      '      (Enquiry.Customer = Customer_Contact.Customer) and'
      '      (Enquiry.Branch_no = Customer_Contact.Branch_no) and'
      '      (Enquiry.Contact_no = Customer_Contact.Contact_no)'
      '      )')
    Left = 214
    Top = 21
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Enquiry'
        ParamType = ptUnknown
      end>
  end
  object FormRefSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select *'
      'from Form_Reference'
      'where Form_Reference = :Form_Reference')
    Left = 462
    Top = 22
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Form_Reference'
        ParamType = ptUnknown
      end>
  end
  object UpdSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Update Proof_History'
      'Set'
      'Proof_Status = :Proof_Status,'
      'Proof_Date = :Proof_Date,'
      'Purchase_Order = :Purchase_Order,'
      'Line = :Line,'
      'Operator = :Operator'
      'Where (Proof_History = :Proof_History)')
    Left = 232
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Proof_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Proof_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Operator'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Proof_History'
        ParamType = ptUnknown
      end>
  end
  object AddSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Insert Into Proof_History'
      '(Proof_History, Proof_Status, Proof_Date, Purchase_Order, Line)'
      'Select Max(Proof_History)+1, '#39'D'#39', :Date, :Order, :Line'
      'From Proof_History'
      ''
      ''
      ' '
      ' ')
    Left = 280
    Top = 168
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'Date'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Order'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Line'
        ParamType = ptInput
      end>
  end
  object qryZero: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Insert Into Proof_History'
      '(Proof_History, Proof_Status, Proof_Date, Purchase_Order, Line)'
      'Select Max(Proof_History)+1, '#39'D'#39', :Date, :Order, :Line'
      'From Proof_History')
    Left = 432
    Top = 168
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'Date'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'Order'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Line'
        ParamType = ptInput
      end>
  end
  object GetLastSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select Proof_History'
      'From Proof_History'
      'Where Proof_Date=:Date and Purchase_Order=:Order and Line=:Line'
      ' ')
    Left = 320
    Top = 168
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'Date'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Order'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Line'
        ParamType = ptInput
      end>
  end
  object UpdPOSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Update Purchase_orderline'
      'set Proof_revision = :Proof_revision'
      'where Purchase_order = :Purchase_Order and'
      'Line = :Line')
    Left = 494
    Top = 166
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Proof_revision'
        ParamType = ptUnknown
      end
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
end
