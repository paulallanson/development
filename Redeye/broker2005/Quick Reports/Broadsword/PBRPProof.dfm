object PBRPProofFrm: TPBRPProofFrm
  Left = 229
  Top = 101
  Width = 918
  Height = 586
  HorzScrollBar.Range = 1200
  VertScrollBar.Position = 1452
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
    Left = 24
    Top = 76
    Width = 794
    Height = 1123
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
    object PageHeaderQRBand: TQRBand
      Left = 38
      Top = 38
      Width = 718
      Height = 371
      Frame.DrawBottom = True
      AfterPrint = PageHeaderQRBandAfterPrint
      AlignToBottom = False
      BeforePrint = PageHeaderQRBandBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        981.604166666666700000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object ReportImage: TQRImage
        Left = 2
        Top = 1
        Width = 713
        Height = 48
        Enabled = False
        Size.Values = (
          127.000000000000000000
          5.291666666666667000
          2.645833333333333000
          1886.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Stretch = True
      end
      object OrderLbl: TQRLabel
        Left = 55
        Top = 76
        Width = 178
        Height = 24
        Enabled = False
        Size.Values = (
          63.500000000000000000
          145.520833333333300000
          201.083333333333300000
          470.958333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'PROOF APPROVAL No. '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      object PONumberLbl: TQRLabel
        Left = 64
        Top = 76
        Width = 107
        Height = 24
        Size.Values = (
          63.500000000000000000
          169.333333333333300000
          201.083333333333300000
          283.104166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'PONumberLbl'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      object QRLabel4: TQRLabel
        Left = 64
        Top = 156
        Width = 60
        Height = 20
        Size.Values = (
          52.916666666666670000
          169.333333333333300000
          412.750000000000000000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'ORDER REF:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial Narrow'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object YourRefLbl: TQRLabel
        Left = 64
        Top = 172
        Width = 67
        Height = 21
        Size.Values = (
          55.562500000000000000
          169.333333333333300000
          455.083333333333300000
          177.270833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'YourRefLbl'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object AddressMemo: TQRMemo
        Left = 64
        Top = 212
        Width = 273
        Height = 153
        Size.Values = (
          404.812500000000000000
          169.333333333333300000
          560.916666666666700000
          722.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial Narrow'
        Font.Style = []
        Lines.Strings = (
          'For Delivery To:')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 12
      end
      object QRDBText2: TQRDBText
        Left = 64
        Top = 128
        Width = 30
        Height = 20
        Size.Values = (
          52.916666666666670000
          169.333333333333300000
          338.666666666666700000
          79.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = GetProofSQL
        DataField = 'Name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel20: TQRLabel
        Left = 64
        Top = 112
        Width = 57
        Height = 17
        Size.Values = (
          44.979166666666670000
          169.333333333333300000
          296.333333333333300000
          150.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'CUSTOMER:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial Narrow'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object DateLbl: TQRLabel
        Left = 432
        Top = 80
        Width = 37
        Height = 17
        Size.Values = (
          44.979166666666670000
          1143.000000000000000000
          211.666666666666700000
          97.895833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'DateLbl'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object lblProofRevision: TQRLabel
        Left = 364
        Top = 112
        Width = 105
        Height = 21
        Size.Values = (
          55.562500000000000000
          963.083333333333300000
          296.333333333333300000
          277.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblProofRevision'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
    end
    object DetailQRBand: TQRBand
      Left = 38
      Top = 409
      Width = 718
      Height = 624
      AlignToBottom = False
      BeforePrint = DetailQRBandBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        1651.000000000000000000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRShape1: TQRShape
        Left = 0
        Top = 112
        Width = 718
        Height = 4
        Size.Values = (
          10.583333333333300000
          0.000000000000000000
          296.333333333333000000
          1899.708333333330000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel12: TQRLabel
        Left = 308
        Top = 175
        Width = 34
        Height = 20
        Size.Values = (
          52.916666666666670000
          814.916666666666700000
          463.020833333333300000
          89.958333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Signed'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel15: TQRLabel
        Left = 572
        Top = 175
        Width = 24
        Height = 20
        Size.Values = (
          52.916666666666670000
          1513.416666666667000000
          463.020833333333300000
          63.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRShape5: TQRShape
        Left = 348
        Top = 188
        Width = 209
        Height = 4
        Size.Values = (
          10.583333333333300000
          920.750000000000000000
          497.416666666667000000
          552.979166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape8: TQRShape
        Left = 596
        Top = 188
        Width = 100
        Height = 4
        Size.Values = (
          10.583333333333300000
          1576.916666666670000000
          497.416666666667000000
          264.583333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel18: TQRLabel
        Left = 0
        Top = 127
        Width = 396
        Height = 20
        Size.Values = (
          52.916666666666670000
          0.000000000000000000
          336.020833333333300000
          1047.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          'All proof details have been carefully checked and are approved a' +
          's follows:-'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel3: TQRLabel
        Left = 0
        Top = 175
        Width = 180
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          463.020833333333300000
          476.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'PROCEED, NO AMENDMENTS'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 11
      end
      object QRLabel5: TQRLabel
        Left = 0
        Top = 234
        Width = 203
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          619.125000000000000000
          537.104166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'PROCEED, AFTER AMENDMENTS'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 11
      end
      object QRLabel6: TQRLabel
        Left = 308
        Top = 234
        Width = 34
        Height = 20
        Size.Values = (
          52.916666666666670000
          814.916666666666700000
          619.125000000000000000
          89.958333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Signed'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRShape2: TQRShape
        Left = 348
        Top = 247
        Width = 209
        Height = 4
        Size.Values = (
          10.583333333333300000
          920.750000000000000000
          653.520833333333000000
          552.979166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel7: TQRLabel
        Left = 572
        Top = 234
        Width = 24
        Height = 20
        Size.Values = (
          52.916666666666670000
          1513.416666666667000000
          619.125000000000000000
          63.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRShape3: TQRShape
        Left = 596
        Top = 247
        Width = 100
        Height = 4
        Size.Values = (
          10.583333333333300000
          1576.916666666670000000
          653.520833333333000000
          264.583333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel8: TQRLabel
        Left = 0
        Top = 291
        Width = 124
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          769.937500000000000000
          328.083333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'AMEND & REPROOF'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 11
      end
      object QRLabel9: TQRLabel
        Left = 308
        Top = 291
        Width = 34
        Height = 20
        Size.Values = (
          52.916666666666670000
          814.916666666666700000
          769.937500000000000000
          89.958333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Signed'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRShape4: TQRShape
        Left = 348
        Top = 304
        Width = 209
        Height = 4
        Size.Values = (
          10.583333333333300000
          920.750000000000000000
          804.333333333333000000
          552.979166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel10: TQRLabel
        Left = 572
        Top = 291
        Width = 24
        Height = 20
        Size.Values = (
          52.916666666666670000
          1513.416666666667000000
          769.937500000000000000
          63.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRShape6: TQRShape
        Left = 596
        Top = 304
        Width = 100
        Height = 4
        Size.Values = (
          10.583333333333300000
          1576.916666666670000000
          804.333333333333000000
          264.583333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape7: TQRShape
        Left = 0
        Top = 336
        Width = 718
        Height = 4
        Size.Values = (
          10.583333333333300000
          0.000000000000000000
          889.000000000000000000
          1899.708333333330000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape9: TQRShape
        Left = -8
        Top = 481
        Width = 718
        Height = 4
        Size.Values = (
          10.583333333333300000
          -21.166666666666700000
          1272.645833333330000000
          1899.708333333330000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel11: TQRLabel
        Left = 0
        Top = 495
        Width = 219
        Height = 20
        Size.Values = (
          52.916666666666670000
          0.000000000000000000
          1309.687500000000000000
          579.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'CUSTOMER REMARKS / SPECIAL NOTES :'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRShape10: TQRShape
        Left = 0
        Top = 609
        Width = 718
        Height = 4
        Size.Values = (
          10.583333333333300000
          0.000000000000000000
          1611.312500000000000000
          1899.708333333330000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel13: TQRLabel
        Left = 16
        Top = 6
        Width = 47
        Height = 20
        Size.Values = (
          52.916666666666670000
          42.333333333333330000
          15.875000000000000000
          124.354166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'QUANTITY'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial Narrow'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel14: TQRLabel
        Left = 128
        Top = 6
        Width = 46
        Height = 20
        Size.Values = (
          52.916666666666670000
          338.666666666666700000
          15.875000000000000000
          121.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'JOB TITLE'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial Narrow'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel16: TQRLabel
        Left = 544
        Top = 6
        Width = 32
        Height = 20
        Size.Values = (
          52.916666666666670000
          1439.333333333333000000
          15.875000000000000000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'DEPTH'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial Narrow'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel17: TQRLabel
        Left = 632
        Top = 6
        Width = 32
        Height = 20
        Size.Values = (
          52.916666666666670000
          1672.166666666667000000
          15.875000000000000000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'WIDTH'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial Narrow'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel25: TQRLabel
        Left = 611
        Top = 27
        Width = 10
        Height = 21
        Size.Values = (
          55.562500000000000000
          1616.604166666667000000
          71.437500000000000000
          26.458333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'X'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRLabel26: TQRLabel
        Left = 0
        Top = 344
        Width = 493
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          910.166666666666700000
          1304.395833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          'All paper proofs are paper/laser copies and as such may differ s' +
          'lightly dimensionally.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial Narrow'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRLabel27: TQRLabel
        Left = 0
        Top = 374
        Width = 331
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          989.541666666666700000
          875.770833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Please check layout, spacing and spelling very carefully '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial Narrow'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRLabel28: TQRLabel
        Left = 330
        Top = 374
        Width = 317
        Height = 21
        Size.Values = (
          55.562500000000000000
          873.125000000000000000
          989.541666666666700000
          838.729166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'paying particular attention to names and telephone'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRLabel29: TQRLabel
        Left = 0
        Top = 393
        Width = 86
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          1039.812500000000000000
          227.541666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'numbers etc. '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRLabel30: TQRLabel
        Left = 88
        Top = 393
        Width = 526
        Height = 21
        Size.Values = (
          55.562500000000000000
          232.833333333333300000
          1039.812500000000000000
          1391.708333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          'as no liability can be accepted for errors and omissions once th' +
          'e proof has been approved.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial Narrow'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRLabel31: TQRLabel
        Left = 0
        Top = 429
        Width = 515
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          1135.062500000000000000
          1362.604166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          'Work cannot proceed until we have this proof slip signed and ret' +
          'urned to us together with'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial Narrow'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRLabel32: TQRLabel
        Left = 0
        Top = 446
        Width = 242
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          1180.041666666667000000
          640.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'your original copy and all previous proofs.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial Narrow'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object LabQuantity: TQRLabel
        Left = 16
        Top = 27
        Width = 76
        Height = 21
        Size.Values = (
          55.562500000000000000
          42.333333333333330000
          71.437500000000000000
          201.083333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'LabQuantity'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object LabJobTitle: TQRLabel
        Left = 128
        Top = 27
        Width = 377
        Height = 41
        Size.Values = (
          108.479166666667000000
          338.666666666667000000
          71.437500000000000000
          997.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'LabJobTitle'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object LabDepth: TQRLabel
        Left = 515
        Top = 27
        Width = 60
        Height = 21
        Size.Values = (
          55.562500000000000000
          1362.604166666667000000
          71.437500000000000000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'LabDepth'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object LabWidth: TQRLabel
        Left = 632
        Top = 27
        Width = 59
        Height = 21
        Size.Values = (
          55.562500000000000000
          1672.166666666667000000
          71.437500000000000000
          156.104166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'LabWidth'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object FormRefLbl: TQRLabel
        Left = 128
        Top = 70
        Width = 63
        Height = 21
        Size.Values = (
          55.562500000000000000
          338.666666666666700000
          185.208333333333300000
          166.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'FormRefLbl'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object FormRefDescLbl: TQRLabel
        Left = 128
        Top = 89
        Width = 89
        Height = 21
        Size.Values = (
          55.562500000000000000
          338.666666666666700000
          235.479166666666700000
          235.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'FormRefDescLbl'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object QRBand1: TQRBand
      Left = 38
      Top = 1033
      Width = 718
      Height = 112
      AfterPrint = QRBand1AfterPrint
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        296.333333333333300000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageFooter
      object QRLabel19: TQRLabel
        Left = 8
        Top = 7
        Width = 97
        Height = 16
        Size.Values = (
          42.333333333333330000
          21.166666666666670000
          18.520833333333330000
          256.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Order Processed By :  '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial Narrow'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRDBText8: TQRDBText
        Left = 120
        Top = 6
        Width = 64
        Height = 16
        Size.Values = (
          42.333333333333330000
          317.500000000000000000
          15.875000000000000000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = GetProofSQL
        DataField = 'Contact_Name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial Narrow'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object labCompanyAddress: TQRMemo
        Left = 152
        Top = 56
        Width = 417
        Height = 41
        Enabled = False
        Size.Values = (
          108.479166666666700000
          402.166666666666700000
          148.166666666666700000
          1103.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
    end
  end
  object GetProofSQL: TFDQuery
    ConnectionName = 'PB'
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
      ' ')
    Left = 56
    Top = 1
    ParamData = <
      item
        Name = 'Purchase_Order'
        DataType = ftInteger
      end
      item
        Name = 'Purchase_Order'
        DataType = ftInteger
      end
      item
        Name = 'Operator'
        DataType = ftInteger
      end
      item
        Name = 'Operator'
        DataType = ftInteger
      end
      item
        Name = 'Customer'
        DataType = ftInteger
      end
      item
        Name = 'ByCustomer'
        DataType = ftString
      end
      item
        Name = 'Branch_No'
        DataType = ftInteger
      end
      item
        Name = 'ByBranch'
        DataType = ftString
      end>
  end
  object GetCompSQL: TFDQuery
    ConnectionName = 'PB'
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
    Left = 136
    Top = 7
  end
  object GetPOSQL: TFDQuery
    ConnectionName = 'PB'
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
    Left = 230
    Top = 85
    ParamData = <
      item
        Name = 'Line'
      end
      item
        Name = 'Enquiry'
      end>
  end
  object FormRefSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Form_Reference'
      'where Form_Reference = :Form_Reference')
    Left = 382
    Top = 102
    ParamData = <
      item
        Name = 'Form_Reference'
      end>
  end
  object UpdSQL: TFDQuery
    ConnectionName = 'PB'
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
        Name = 'Proof_Status'
      end
      item
        Name = 'Proof_Date'
        DataType = ftDateTime
      end
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Operator'
      end
      item
        Name = 'Proof_History'
      end>
  end
  object AddSQL: TFDQuery
    ConnectionName = 'PB'
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
        Name = 'Date'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'Order'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Line'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object qryZero: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Proof_History'
      '(Proof_History, Proof_Status, Proof_Date, Purchase_Order, Line)'
      'Select Max(Proof_History)+1, '#39'D'#39', :Date, :Order, :Line'
      'From Proof_History')
    Left = 432
    Top = 168
    ParamData = <
      item
        Name = 'Date'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'Order'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'Line'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object GetLastSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Proof_History'
      'From Proof_History'
      'Where Proof_Date=:Date and Purchase_Order=:Order and Line=:Line'
      ' ')
    Left = 320
    Top = 168
    ParamData = <
      item
        Name = 'Date'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'Order'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Line'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object UpdPOSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Purchase_orderline'
      'set Proof_revision = :Proof_revision'
      'where Purchase_order = :Purchase_Order and'
      'Line = :Line')
    Left = 430
    Top = 214
    ParamData = <
      item
        Name = 'Proof_revision'
      end
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end>
  end
  object qryGetFSCClaim: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from FSC_Material_Claim'
      'where FSC_Material_Claim = :FSC_Material_Claim')
    Left = 430
    Top = 286
    ParamData = <
      item
        Name = 'FSC_Material_Claim'
      end>
  end
end
