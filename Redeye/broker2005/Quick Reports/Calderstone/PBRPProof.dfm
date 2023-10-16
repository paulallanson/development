object PBRPProofFrm: TPBRPProofFrm
  Left = 193
  Top = 100
  Width = 1017
  Height = 725
  HorzScrollBar.Range = 1200
  VertScrollBar.Position = 225
  VertScrollBar.Range = 2000
  Caption = 'Print Proof Approval Letter'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  Scaled = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 14
  object PrintPOsQuickReport: TQuickRep
    Left = 104
    Top = -121
    Width = 794
    Height = 1123
    ShowingPreview = False
    BeforePrint = PrintPOsQuickReportBeforePrint
    DataSet = GetProofSQL
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Calibri'
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
      Height = 387
      Frame.DrawBottom = True
      AfterPrint = PageHeaderQRBandAfterPrint
      AlignToBottom = False
      BeforePrint = PageHeaderQRBandBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        1023.937500000000000000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object OrderLbl: TQRLabel
        Left = 63
        Top = 268
        Width = 184
        Height = 24
        Enabled = False
        Size.Values = (
          63.500000000000000000
          166.687500000000000000
          709.083333333333300000
          486.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'PROOF APPROVAL No. '
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Calibri'
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
        Top = 268
        Width = 112
        Height = 24
        Size.Values = (
          63.500000000000000000
          169.333333333333300000
          709.083333333333300000
          296.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'PONumberLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Calibri'
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
        Top = 340
        Width = 63
        Height = 20
        Size.Values = (
          52.916666666666670000
          169.333333333333300000
          899.583333333333300000
          166.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'ORDER REF:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object YourRefLbl: TQRLabel
        Left = 64
        Top = 356
        Width = 68
        Height = 21
        Size.Values = (
          55.562500000000000000
          169.333333333333300000
          941.916666666666700000
          179.916666666666700000)
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
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 11
      end
      object AddressMemo: TQRMemo
        Left = 63
        Top = 124
        Width = 273
        Height = 141
        Size.Values = (
          373.062500000000000000
          166.687500000000000000
          328.083333333333400000
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
        Font.Name = 'Calibri'
        Font.Style = []
        Lines.Strings = (
          'For Delivery To:')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 11
      end
      object QRDBText2: TQRDBText
        Left = 64
        Top = 312
        Width = 38
        Height = 20
        Size.Values = (
          52.916666666666670000
          169.333333333333300000
          825.500000000000000000
          100.541666666666700000)
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
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 11
      end
      object QRLabel20: TQRLabel
        Left = 64
        Top = 296
        Width = 64
        Height = 17
        Size.Values = (
          44.979166666666670000
          169.333333333333300000
          783.166666666666700000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'CUSTOMER:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object DateLbl: TQRLabel
        Left = 629
        Top = 124
        Width = 48
        Height = 19
        Size.Values = (
          50.270833333333330000
          1664.229166666667000000
          328.083333333333300000
          127.000000000000000000)
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
        FontSize = 11
      end
      object lblProofRevision: TQRLabel
        Left = 564
        Top = 264
        Width = 113
        Height = 21
        Size.Values = (
          55.562500000000000000
          1492.250000000000000000
          698.500000000000000000
          298.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblProofRevision'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object lblOfficeContact: TQRLabel
        Left = 584
        Top = 168
        Width = 93
        Height = 21
        Size.Values = (
          55.562500000000000000
          1545.166666666667000000
          444.500000000000000000
          246.062500000000000000)
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
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 11
      end
      object gtQRDBText1: TQRDBText
        Left = 592
        Top = 328
        Width = 82
        Height = 19
        Size.Values = (
          50.270833333333330000
          1566.333333333333000000
          867.833333333333300000
          216.958333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 11
      end
      object lblContactDDI: TQRLabel
        Left = 650
        Top = 192
        Width = 27
        Height = 21
        Size.Values = (
          55.562500000000000000
          1719.791666666667000000
          508.000000000000000000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'DDI:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 11
      end
      object lblContactEmail: TQRLabel
        Left = 638
        Top = 216
        Width = 39
        Height = 21
        Size.Values = (
          55.562500000000000000
          1688.041666666667000000
          571.500000000000000000
          103.187500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Email:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 11
      end
    end
    object DetailQRBand: TQRBand
      Left = 38
      Top = 425
      Width = 718
      Height = 672
      AlignToBottom = False
      BeforePrint = DetailQRBandBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        1778.000000000000000000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRShape1: TQRShape
        Left = 0
        Top = 48
        Width = 718
        Height = 4
        Size.Values = (
          10.583333333333330000
          0.000000000000000000
          127.000000000000000000
          1899.708333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel15: TQRLabel
        Left = 580
        Top = 135
        Width = 26
        Height = 20
        Size.Values = (
          52.916666666666670000
          1534.583333333333000000
          357.187500000000000000
          68.791666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel18: TQRLabel
        Left = 0
        Top = 71
        Width = 702
        Height = 20
        Size.Values = (
          52.916666666666670000
          0.000000000000000000
          187.854166666666700000
          1857.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          'I should be grateful if you would check carefully. Tick one of t' +
          'he following options by typing '#39'x'#39' in the relevant box'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 11
      end
      object QRLabel3: TQRLabel
        Left = 0
        Top = 135
        Width = 180
        Height = 19
        Size.Values = (
          50.270833333333330000
          0.000000000000000000
          357.187500000000000000
          476.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'PROCEED, NO AMENDMENTS'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 11
      end
      object QRLabel8: TQRLabel
        Left = 0
        Top = 182
        Width = 124
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          481.541666666666700000
          328.083333333333300000)
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
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 11
      end
      object QRShape7: TQRShape
        Left = 0
        Top = 464
        Width = 718
        Height = 4
        Size.Values = (
          10.583333333333330000
          0.000000000000000000
          1227.666666666667000000
          1899.708333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape9: TQRShape
        Left = 0
        Top = 222
        Width = 718
        Height = 4
        Size.Values = (
          10.583333333333330000
          0.000000000000000000
          587.375000000000000000
          1899.708333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel11: TQRLabel
        Left = 0
        Top = 228
        Width = 95
        Height = 20
        Size.Values = (
          52.916666666666670000
          0.000000000000000000
          603.250000000000000000
          251.354166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'AMENDMENTS:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 11
      end
      object QRLabel13: TQRLabel
        Left = 16
        Top = 6
        Width = 55
        Height = 20
        Size.Values = (
          52.916666666666670000
          42.333333333333330000
          15.875000000000000000
          145.520833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'QUANTITY'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel14: TQRLabel
        Left = 96
        Top = 6
        Width = 50
        Height = 20
        Size.Values = (
          52.916666666666670000
          254.000000000000000000
          15.875000000000000000
          132.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'JOB TITLE'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel16: TQRLabel
        Left = 544
        Top = 6
        Width = 36
        Height = 20
        Size.Values = (
          52.916666666666670000
          1439.333333333333000000
          15.875000000000000000
          95.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'DEPTH'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel17: TQRLabel
        Left = 632
        Top = 6
        Width = 38
        Height = 20
        Size.Values = (
          52.916666666666670000
          1672.166666666667000000
          15.875000000000000000
          100.541666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'WIDTH'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
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
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
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
        Width = 86
        Height = 21
        Size.Values = (
          55.562500000000000000
          42.333333333333330000
          71.437500000000000000
          227.541666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'LabQuantity'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object LabJobTitle: TQRLabel
        Left = 96
        Top = 27
        Width = 409
        Height = 21
        Size.Values = (
          55.562500000000000000
          254.000000000000000000
          71.437500000000000000
          1082.145833333330000000)
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
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object LabDepth: TQRLabel
        Left = 508
        Top = 27
        Width = 67
        Height = 21
        Size.Values = (
          55.562500000000000000
          1344.083333333333000000
          71.437500000000000000
          177.270833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'LabDepth'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri'
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
        Width = 68
        Height = 21
        Size.Values = (
          55.562500000000000000
          1672.166666666667000000
          71.437500000000000000
          179.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'LabWidth'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRLabel1: TQRLabel
        Left = 284
        Top = 135
        Width = 32
        Height = 20
        Size.Values = (
          52.916666666666670000
          751.416666666666700000
          357.187500000000000000
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
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel1: TQRLabel
        Left = 0
        Top = 91
        Width = 438
        Height = 20
        Size.Values = (
          52.916666666666670000
          0.000000000000000000
          240.770833333333300000
          1158.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          'below. Please then Email back to me using the '#39'reply to sender'#39' ' +
          'option.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 11
      end
      object gtQRLabel2: TQRLabel
        Left = 0
        Top = 480
        Width = 80
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          1270.000000000000000000
          211.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Please Note:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 11
      end
      object gtQRMemo1: TQRMemo
        Left = 0
        Top = 500
        Width = 721
        Height = 77
        Size.Values = (
          203.729166666666700000
          0.000000000000000000
          1322.916666666667000000
          1907.645833333333000000)
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
        Font.Name = 'Calibri'
        Font.Style = []
        Lines.Strings = (
          
            'The attached PDF(s) are low resolution and are intended as a vis' +
            'ual composite proof only. The PDF proofing process may not show ' +
            'how actual colour separations might appear on the finished print' +
            'ed job. Also, owing to the different calibrations from monitor t' +
            'o monitor, PDF(s) cannot be interpreted as contract colour proof' +
            's. If you require contract proofs, please contact your account m' +
            'anager.'
          '')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 11
      end
      object gtQRMemo2: TQRMemo
        Left = 0
        Top = 604
        Width = 721
        Height = 37
        Size.Values = (
          97.895833333333320000
          0.000000000000000000
          1598.083333333333000000
          1907.645833333333000000)
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
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        Lines.Strings = (
          
            'No liability can be accepted by Calderstone Design & Print Limit' +
            'ed for incorrect copy once proof(s) approved. Author'#39's correctio' +
            'ns may be charged as extra, to be advised in due course.')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 11
      end
      object gtQRLabel3: TQRLabel
        Left = 580
        Top = 183
        Width = 26
        Height = 20
        Size.Values = (
          52.916666666666670000
          1534.583333333333000000
          484.187500000000000000
          68.791666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel4: TQRLabel
        Left = 284
        Top = 183
        Width = 32
        Height = 20
        Size.Values = (
          52.916666666666670000
          751.416666666666700000
          484.187500000000000000
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
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel5: TQRLabel
        Left = 228
        Top = 136
        Width = 17
        Height = 17
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          44.979166666666670000
          603.250000000000000000
          359.833333333333300000
          44.979166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = ' '
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel6: TQRLabel
        Left = 228
        Top = 184
        Width = 17
        Height = 17
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = True
        Frame.DrawRight = True
        Size.Values = (
          44.979166666666670000
          603.250000000000000000
          486.833333333333300000
          44.979166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = ' '
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel7: TQRLabel
        Left = 324
        Top = 135
        Width = 237
        Height = 20
        Frame.DrawBottom = True
        Size.Values = (
          52.916666666666670000
          857.250000000000000000
          357.187500000000000000
          627.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = ' '
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel8: TQRLabel
        Left = 324
        Top = 183
        Width = 237
        Height = 20
        Frame.DrawBottom = True
        Size.Values = (
          52.916666666666670000
          857.250000000000000000
          484.187500000000000000
          627.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = ' '
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel9: TQRLabel
        Left = 612
        Top = 135
        Width = 93
        Height = 20
        Frame.DrawBottom = True
        Size.Values = (
          52.916666666666670000
          1619.250000000000000000
          357.187500000000000000
          246.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = ' '
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel10: TQRLabel
        Left = 612
        Top = 183
        Width = 93
        Height = 20
        Frame.DrawBottom = True
        Size.Values = (
          52.916666666666670000
          1619.250000000000000000
          484.187500000000000000
          246.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = ' '
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtqrMemo3: TQRMemo
        Left = 2
        Top = 251
        Width = 713
        Height = 207
        Size.Values = (
          547.687500000000000000
          5.291666666666667000
          664.104166666666800000
          1886.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 11
      end
    end
    object QRBand1: TQRBand
      Left = 38
      Top = 1097
      Width = 718
      Height = 16
      AfterPrint = QRBand1AfterPrint
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        42.333333333333330000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageFooter
    end
    object ReportImage: TQRImage
      Left = 152
      Top = 41
      Width = 457
      Height = 96
      Enabled = False
      Size.Values = (
        254.000000000000000000
        402.166666666666600000
        108.479166666666700000
        1209.145833333333000000)
      XLColumn = 0
      XLNumFormat = nfGeneral
      ActiveInPreview = False
      Center = True
      Picture.Data = {
        07544269746D6170DA960000424DDA9600000000000076000000280000006702
        00007D0000000100040000000000649600000000000000000000100000001000
        00004C273B005C264B004B3542006A435A00997A90007FCAC500C7B4C100E4D5
        E000ECEDEC00EBFBF800F9EFF400F7FFFF00FFF7F400FFEFFF00FFF7FF00FFFF
        FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF63114AFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF26FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFBFF727FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFE4368743FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF27FAFFFBFFFFFFFFFFFFFFFFFFFFFFFF16FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF63FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF63F
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFF27FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFFE34FFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFF0FFFFFFFFFBFFFBBFFFFFFFFFFFFBBFFFBBFFFFFBFFFFFFFBFFFF
        FF16FBFA17FFFFBBFFFFFBFFFBFFFBFFFBFFFEFFFFFFCFFFFFFFFFFFFFFF36FF
        FFFFFFFFFFFFFFFFFFFFFFFFBFFF16FFBFFFFFFFFFFFFFFFFFBFFFFFFFFFFBFF
        EBFFBFFFBFFFFFFFFCFFFBFFFFFFFBFFFFFFBFFFBFBFFFFFBFFFFFFFFFFBBFFF
        BFFCFFFFFFFCFFFFFFFFBFFFBFFFFFFFFFBFFFFFFFFFFFFFFFFFBFFFFFFFFFFF
        EFFFFFFFBFFFFFFFFFFFFFFF818FFFFFEBCFFBFFBFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFCFFFFFFFFFFFFFFFBFFFFFFBFFFFF81AFFBFBFFFBEBFFFFEFFCFFFFB
        FFFFFFFFFFFBFFBBFFFFFFBFFFFFBFFCFFEFFFBFFFFFF36FBFFFFFFFFFFCBFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFF63FFFFFBFFFFFFFFFBFBBFFF9FFFFFBFFBFFF
        FFFFFFFFFFFBFFFFFFFFBCFFFFFBBFFFBEFFFFEFFFFFFFFFFFF0FFFFFFFFFFFF
        EFFFFFFFFFFFFEFFFEFFFFFFFFFFFEFFFFFFFFFFFF16EFF717FFFFFBEFFFFBFF
        EFFFFFFEFBBB9FFFFFFBFFFFFFBFFFFFFFFF43FFFFFFFFFFFFFBFFFFFFFAFFFF
        FFFF16FEFFFBFFFFEFFFFEFEFFFFFFFFFFFFFFFFEFFFFFFFBEFFEFFFFFFFFFFF
        FFBBFFEFFBFFFFFFFFFFFFBFBFFFFFFBBFFFFFFFBFFFFCFFEFFFBFFFFFFFFFFE
        FFFFFBFFFFFFFFFFFFFFFFFFFFFFFFEFFFFBFFFFFFFFFFBEFFFFFFBCBFFFFFFF
        F16FFFCFFBFEFBFFFFFFFFFFBEBFEFFFFFEFBFFFFFFFFFFFBEFFBFBCFFFFCFFF
        CFFFFBBFFFFEFF16EFFFFFFFFEFFBBFFFFFBFBBFFFFEFFFFFFFFFEFFFFEFFFBF
        FBBFFFFFFFFFFFFFFFFFF44FFFFFBFFFFFFFFFFFFFFFFFFFEFFFFFBCFBFFFFFF
        FCF817FFFFFFFFFEFFFFFFFFFFEFFFFFFFBFFFEBBBFFFFFFFFFFAFFFFFFFFFFF
        FFFFFFFFBEFFFFFFFFFFFFFFFFF0FFFFFFFFFFFF16FFFFFA4113616F717FF16F
        E732237FFF36FFF71863E7433FFBFFF717FFFFF728FF63136FFF84113418A411
        37FFF631136B628FFFFF9631136FFFFFFFF73111116F311146FF9411148BF633
        137FF16FFF718FFF16FFFFFF71112347FFFF731136FFFF417FF713FFF16FFF71
        8431147FBBFFF43FFF317FFA16FF631136FB6127718FFF631137FFFFFFFFF641
        1348FF631136FF16EFF718F6117738FFF631136FF33FFFFFFF614FFFF614FFA4
        11341AB6227F631136FB16FFF16FF36FF7421147F718FE6313418F34FFFFFFFF
        717FF731341FFE6313417FF427FF713FBF731136FFF16FFF6227728FFF26F628
        FFFFFF631136FFF7313626FF16FF717FFF633136FFFF36FFFFFFFF717FFF714F
        F717FFF611111116FF73114EEFCFFFF6411348FFF7121111E16FFFF824FFFFFF
        FFF0FFFFFFFFBFFF16FFFFF43776316F63EFF16F72477427FF16FFB618D31146
        FBFFFFF617FFFFF618F6367626FF43676318746743DF6267763FA48FFFFF6367
        7616FFFFFFF6167778AB1477623F6467734E61678427F16FFB61FFFF16FFFFFF
        617776426FB71477636FFE116FF611AFF16FFF61A367743EFFFFF63FF7134FF7
        16F6147863FF147D61EFF61677417FFFFFFF41477644F6247763FF16FFF638F1
        47E61DFF6167763EF66FFFFFBF431FFFF414FF4377631FB147E6147863FF16FF
        F16FF06F73467744F617F62676418F66FFFFFFBF617FA347743FF62676418FD1
        16FF611E971477636FF17FFF147E618FFF16FA68BFFFF73677616FD3477416FF
        16FF619EF6167763FFF713FFFBFFCF617FFA33EFF617FBBF61687779F7147733
        FFFFFFE44687438FF617777FF16FFFE33DFFFFFFFFF0FFFFFFFFFBFF16FCBFF1
        6FFFE16F61FFB16F44EFFF44FF16FBB63FE338FFEBFEFFF61FFFEFF61AF16FFF
        61FF16FFF61FFFBBF27A16EFFFFFFFFFFFFFDFFFBF618FFFFFF61AFFFFFF16FF
        F726FFFBF72F16FFFF44F16BFF61FFFF16FFFFFF61FFFEE617F44EBFF63FF616
        4FF4436FF16FFF61FFFFFF27FFFFF63FB6371FC737E16FFFFFFF16FF61FFF16F
        FBF44FFFFFF617FBBFF8A16FFBCFFF36FFF61FF16FF61FF816FFFFFFBFFBFFFF
        FF3417FFA1419F17FFB61FF36FA16FFFFFFF36FFF16FF16F44FFFFFFF618F16F
        FF71FFFEFFFFFFFF638F71DFB61FF16FFF71FF6164FF4436C44FFFE63FF16FBF
        16FF61FFFF16FFFFFFFFBA8FFBF63F718FFF36FF16FF61FFA16FFFAFFFF4317F
        F9FFFF61FF833DFFF618FFFFF617FFFFF34FFFE36FBFBBFFFFFFF44FF61FFFEF
        F16FFF337EFFFFFFFFF0FFFFFFFFFFFF16FBFFF36FFFF16F61FFB16F16FFBF61
        FF16FFF61FF71114FBFFFFF61FFFFFF61F71AFFFE17F16FFF61FFFF861861EFF
        BFFFFFFFFFFFFFFFFFE17FFFFFF63EBFFFFF16FFFF43FFFF743718FFFF61F16F
        FF63FFFF16FFFFFF61FFFFFA43F16FFFF817F4461FF1644FF16BBF61FFFF8427
        FFFBF63FF34E16C71771AFF9FFFB36FF61FF718CCBF61FFFFFE14FFFFFFF71DF
        FFCFFF16FFF61FF16FF61BF71DFBFFFFFFFFFFFFFA1636FF71A17F36FFF61FF3
        6C73AFF9FFFB36FFF36FB16F16F9FFFFF61F718FFF71FFFFFFFFFFFF63FF717F
        F61F718FFF71FF6461FF1644F16FCFF817F16FBF16FF63FFFF36FFFFFFFFFFFF
        FFF61F61FFFF36FF16FF61FF61DEFAFFFFD1644FFFFFFF61FF438FFFF61FFBBB
        FE617FCF816FBBF44FBBFFFFFFFFF61FF61BFFBFF16FE417FFFFFFFFFFF0FFFF
        FFFFFFFF16FEFFB16FFFB36F61FFF16F16BFCF61FF36FFF63FF34A834FFFFF96
        1FFFFFF63F61FBFFF16F16FFC61FF74136F711111317FFFFFFFFFEFFBF717FFF
        FFF61EBFFFFF16BBBF61F84313761FBFFB61F16FFF63FFFF16FFFFFF61B9FBFF
        71E16FFF9F16F36F1771763FF36FFF61FD43137FFFFBF63FE16F44F717713111
        317F16FB61BF61FCFFF61FFFFF717FFFFFFE733113117F16FFB61FF16FB61FF7
        11111137FFFFFFFFF61944FF63F36F6246761FF36F713111317F36FFF16FC16F
        11111111F61F61FCFF61FFFFFFFFFFFF61FFF436761F61FCFF61FF36F1771863
        F16FBBFF16F16FFF36FF61FFFF16FFFFFFFFFFFFFFA43F61FFBB16FF16FF61FF
        711211117F63A63EFFFFFF61F428FBBFF61FFFFBFFF417FF638BB9F63FFFFFFF
        FFFFF61FF63BFFFFF16F417EFFFFFFFFFFF0FFFFFFFFFBBF111113F16FCFB16F
        61FFF36F16FFFF61FF36FFF63F61AFF60FFFFFB6177777761F71DFFF837F16FF
        F61FD3468BFA16777717BFFFFFFFBF8AB734FFFFFFF6177777FF36FEFF61D236
        7FF718BFFF61B16FFF61FFFF16FFFFFF63EFFFFFD1716FFFF817817F3643B818
        F16FFF61F4367FFBFFEFF63F61EC62E717716777727F16FF61FF718FFBF61EFF
        FF61FFFFFFFF716777737F16FFF61FF16FF63FF716777717FFBFFFBFF43B63FF
        44B44FF743111FB16F816777727F16FFF16FF16F34777761F63F717FEF61FFBF
        FFFFFFFF61BBBF64111F717FEF61F717F4643F81716CFFF817F16FFF36CF61FF
        FF16FFFFFFFFFFFF86337F61FFFF16FF16FF63BB816777727E44FF16BFFFFF61
        417FFBFEF61FFFFFFFFF43AF61FFEFF61FFFFFFFFFFFF43FF63FFFFFF1113346
        FEFFFFFFFFF0FFFFFFFFFFBF367787F16FBFB16F617FF16F44FFFF44FF16FFF6
        1F718FF61FFFFFF6111331113FF16BBF61FB36FFF61F62FBFFBF36FFF62EFFFF
        FFFFFF71314AFFFFFFF61111118916FBFF3461AFCFFF16EFBF44F36BBF61BFFD
        27FFFFFF63FFFFFFF1644FBBF62F61FC4444FF36F16FFF61E16FFFFFFFFFF61F
        44FFE3661FF36FFF62FF16FF617FF26FFFF44FFFFF61FFFFFFFFF34FBB71CF16
        FFB61FF16FF617FC36FFE62FFFFFFFFBF34F718F16B63FBFFFF61FF16FF34FBF
        61FF16FFF36FF16F43FFFF43F63FF34FFB61FFFFFFFFFFFF63BBFFFFF61FF34F
        FB61F61FC6434FF3644EFBF61FF16FFF16FF61BFBE17FFFFFFFFFF84134EF961
        BFFF16BF16FF617FF36BFF62FA16FF44FFFFFF6316EBFFBFF63FFFFFBFFFF34F
        61FFFFF61FCFFFF746774169F61FFFFFF36776417FBFFFFFFFF0FFFFFFFFFFFF
        16FFFFF16FFF816F6136616F71677617B71367743FF3477348FFFFF61FFFEFF6
        1BF4377636EB16FFF61FD26774FF7167634FFFFFFFFFFBF63AFBFFFFFFF61FFF
        FFB733666337A247766B616774177136773147761EFFFFFF61BBFBBF81771487
        616F43FF7316FF4471367733F347766EFFFFF71F16FFF4461FF7167634E7147A
        6136661677417FFFFF717FFFFFFFF7167634F7136773397147A613767267634F
        FFFFFFFBF16FF36718B7188467743E7167A6067634F812667167716FD3477416
        F61FF7147741FFFFFFFFFFFF63FFF667743EF7147741F43FF7316FF447247761
        6F813668168A6137741EFFFFFFFFFF336FFCFF61FFF716FA1366613667167634
        F61FFF62EFFFFF61627FFFFFF61FFFFFFFFFC63F618FBBF61FFFFFE7131137FF
        B61FFFCBB16BB9B43FFFFFFFFFF0FFFFFFFFFFFF16FFBFF16FFF716F6342636F
        F632137FB80641247BB8411111EEFFF61FFBFFB61BCF63136FFF17FFC62FF731
        14FFF73114FFFFFFFFFFBBFF44FFFFFFFFF61FFFFFFA1441137FF741136FF631
        337F7164114A63036FFFFFFF61FFFFFF61FF731336EB16FFF10EFF6281631137
        E841234FFFCFF7361AFFF7163FFF73314F61311663616E631237FFBFFFE34FFF
        FFFBFF73114FF8163124761111661616F73124FFFFFFFFFF717FF4463FFF16A4
        31147623116F73114EF814331311616BF843136FF61FBF743213FFFFFFFFBFFF
        61FFF741137FBF743213F16FFE11EFF62E731236EF81433131166363127FFFFF
        FFFFF61AFFFFFF63FFF807F8143461616E73124EF24FFFD26FFFFF61F627FFFE
        F61FFFEFFFFFF61F816FBFF43FBBFFF717FFFFFFF61FFFFFE16FFFF61FFFFFFF
        FFF0FFFFFFFFFFFA16FFFFFFFFBBFFFFFFFFF16FAFFFFFFFCFEFFFFFFFAFFFFF
        FFFFFFE61FFFFFF63FFFFFEFFFFFEFFFFFEFFFFFEFFFFFFFFFFFFFFFFFFFFEFF
        836FFFFFFFE61FFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFAFFFFEFFFFFFFFFFFFF
        61FFFBEE34FFFFFFFFFBEFFCFEFFFFFFBACFFFFFBFFFFFFFFFFFF8343FFFBE34
        3FFFFEFFFFFF16FBBFFFFFFFFFFFFFBFFFF617FFBFEFFFBFFFFFFBDFFFFFFFF1
        6FFBFFEFBBFFFFFFFFFFFFFF61FBF6344FFF44FFFFFEFFF16FFFFFFFFFFFFFFF
        F16FBFFCFFFFFFFFF61FCFFFFF61FFFFFFFFBFFF61FFFFFFFFFFCFFFFF61BFFF
        CFEFFFFFFFFFFFFFBBFFFFFF16FB63FFFFFFFFFFFFFFF71AFCFFFFFEFFFFFFFF
        FFFFFFFFFFFFFFFFFFFBFFFEFFFFFF61FF637FFFF61FFFF87FFFF63FF34FFFA1
        6FFFFFFC17FFFFCFF61FFFFF716FFFF62FFFFFFFFFF0FFFFFFFFFBF71477777F
        FFFFCFFCFBFFB16FFFFFFBFFFFF9FFFFFFFFBBFFFFFFFFF61FFFFFF61FFFCFFF
        FFFFFFFFFFEFFBFFBFFFFFFCFFFFFFFFFFFFF7777428FFFFFFF61777779FFFFF
        FFFFFFFFFFFFFFFCFFFFBFBBFFFBBBFFFFFFFFFF617777633AFFBBFBFFFFFFFB
        FFFFFFFFBFBFFFFFFFFFBBBBFFFFFF316FFFBF401FFFFFFFFFFF16FBBFBFFFBB
        FFFFFFFFFFFF41677646FFFFFFFFFFFFFFFFFFF16FFFFFFFFFFFFFFFFFFFFFFF
        44EFF7136FFF43FFFFBFFFF16FFFBBFFFFFFFFFFF16FBFFFFFFFFFFFF61FFFFB
        BB63FFFFFFFFF877417778FFFFBBFFFBBB63BFFBBFFFFFFFFFFFBFFFFFFFFFEF
        16FF61FFBBFFFFFFFFFFBF3377764FFFEFFFBBBFCFFFFBBFFCBFBBFFBFFBFFFF
        EFFFFF61FFF43787761777D72477616FC7267743EBFFFFFF167777FFF61FFFFF
        714787636FFFFFFFFFF0FFFFFFFFFFF83111111FFFFFFFFFFFFFF16FFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFF61FFFFFF63FFFFFFEFFFFFFFFFFFFFBFFFFFFFFFF
        FFFFFFFFFFFFD1111113FFFFFFF63111116FFFFFBFFFFBFFFFFFFFFFFFFFFFFB
        FFFFFFFFFFFFBFFF61111136EFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFBFFBFFFFF
        FFFFFF128FF9BF813FFFFFFFFBFF7AFFFFFFFFBBFFFFFFFFFFFFF6411147FFFF
        FFFEFFFFBFBBFCF79FFFFFFFCFFFFFFFFFFFFCFF24FFFF317FFF71AFFFFFFBB7
        9FFBFFFFFFFBFFBFF16EF67FFFFFFFFFF63BFFFFFB61FFFFFFFFE111131116FF
        FFFEFFFFFB61FFFFFFFFFFFFFFFFBBFFFFFBFFFC7AFF63FAFFFFFFFFFFFFBFA4
        31147FBFFFFFFFFFFFFFFBBFFFFFFBFFBFFFFFFFFFFFFF61FFBF41111331116F
        641126FFBF731048FBFFFFFE3113116FF61FFFFF73111136EFFFFFFFFFF0FFFF
        FFFFFFFFFBBFFFFBCFFFFFFFFFFF736FFFFFFFFFFEFFFFFFFFFFFFFFBFFFEFBF
        EFFFFFFFEBFFFFFFFFFFFBFFFFFFFFFFFFFBFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFEBFFFFBBFFFFBBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFFFBFFFF9F9
        FBFFFFFFFFFFFFFEFFFFFFBFFFFFFFFBFFFFFFFFFFFFFCEFFFFFFFFFFCFFEFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFBFFFFFBFEFFFFFFFFFFFFFFFFBFFBFFFEFFF
        FFFFFFFFFFFFFFFFFFFFFBEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFF347A24F
        FFFFFFFFF61BFFFEFF61FFFFFFFFBFFFFFFFFFFFFFFFFFFEFF61FFFFFFFFFFFF
        FFFFEFFFFEFFFFFBFFFF61FFFFFFFFFFFFFFFFFFFFFFFFBFFFFFFEFFEFFFFFFF
        EFFFFFFFFEFFFFFBFFFFFFFFCFFFFFBFFFFFBBFFAFFBFFFFFFFFFFFFFFFFFFBB
        EFFFFFFFFFEFFFFFFFBFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFEFBFFFBFFFB
        FFFF816BBFFFFBBFFFCFFFBFFFFFFFFFFFFFFFB9FBFFFFFFFBFFFFFFBBFFBFFE
        FFFFFFFEFFFBFFBFFBFFFFFFFFFFFFFFFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFFFFFFBFFFFFFFFFFFFFBFFFFFFFFBF
        FBBFFFFFFFFFFFFFFFFFFBFFCFFFFFFFFCFFFFFFFFFFFFFFFFFFFFFFFFFFCFFF
        FFFFFFFFFFFFFFBBFFFFBFFFFFFFFFFFFFFFFFFFFBFFFFFFFFFFFFFFFBFFFFFF
        FFFFFFFBFFFFFFFFFFFFBFFFFBFFFFFF97316EFFCBFFFFFBF63FFFFFFC61FFFF
        FFFFCFFFBFFFFCFFFFFFFFFFFC61FFFFFFBFFFFFFFFFFFFFFFFFFFFBFCFF61FF
        FFFFFFFFFFFFFFFFFFFFFFBFFFFFFFFFFFFBFFFFFFFFFFFFFFFFFFBBFFFFFBBF
        CFFFFFBBFFFFFFFFFFFFFFFFFFFCFFBFFFFBFBBBFBFFFFFFFFEBFEFFFEBFFFFB
        FFFBFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFFBBFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFBBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFBFBBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB5555555555555555555
        5555555555555555555555555555555555555555555555555555555555555555
        5555555555555555555555555555555555555555555555555555555555555555
        5555555555555555555555555555555555555555555555555555555555555555
        5555555555555555555555555555555555555555555555555555555555555555
        5555555555555555555555555555555555555555555555555555555555555555
        5555555555555555555555555555555555555555555555555555555555555555
        5555555555555555555555555555555555555555555555555555555555555555
        5555555555555555555555555555555555555555555555555555555555555555
        5559FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFB5555555555555555555555555555555555555555555
        5555555555555555555555555555555555555555555555555555555555555555
        5555555555555555555555555555555555555555555555555555555555555555
        5555555555555555555555555555555555555555555555555555555555555555
        5555555555555555555555555555555555555555555555555555555555555555
        5555555555555555555555555555555555555555555555555555555555555555
        5555555555555555555555555555555555555555555555555555555555555555
        5555555555555555555555555555555555555555555555555555555555555555
        55555555555555555555555555555555555555555559FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF999
        9999999999999999999999999999999999999999999999999999999999999999
        9999999999999999999999999999999999999999999999999999999999999999
        9999999999999999999999999999999999999999999999999999999999999999
        9999999999999999999999999999999999999999999999999999999999999999
        9999999999999999999999999999999999999999999999999999999999999999
        9999999999999999999999999999999999999999999999999999999999999999
        9999999999999999999999999999999999999999999999999999999999999999
        9999999999999999999999999999999999999999999999999999999999999999
        9999999999999999999FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB
        FFFFFFFFFFFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE664222000003467FFFB
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFA640000101010000000348FFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF740010010
        13466666664300047FFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFEFFFF74010002467FFFFFBFFFFFFF763047FFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFE7300000368FFFFFFFFFFFFFEFBBFFA4348FFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF842010047FFFFFFFFFFFFFF
        FBFFFFFFFFF647FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFBF766444434444477FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBBFFFFFFFFF777777777FFBFFFFFFFFF
        FFFFFFFFFFFFBFFFFFA7776666666677FFFFFFFFFBFFFFFFFFFFFFFFFFFFFFFF
        FFFFBBF9FFFFFBBF777777777FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFFFFFFFF
        FFFFFFFFFFFFFFFF63002047FFFFFFFFFFFFFFFFFFFFFFFFFFFFF68FFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFBFFFFEFFEFFFFFBBFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFF866444444668FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF
        FBBBFFFFFFFFFFFFFFFFCFFF86FFFFFFFFFFFFFFFFFFFFFFFFFFBFFFFFFFFFBA
        77777777AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFFFF74300000000000010036FF
        FEFFFFFFFFFFFFF710100000134EFFFFFFFFFFFFFF83010000103FFAFFFFFFFF
        FFFFFFE3220000010000000010014FFFFFFFFFFFFFFFFFFFFF60210001000000
        000000000468FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6200001010101010000
        04FFFFFFFFFFFFFFFFFFFCFFF82000000000238FFFFFFFFFFFFFFFE4000036FF
        FFFFFFFFFFFFFFFFFFFFFF77FFFFFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF622
        0000000203FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF86300001000010036F
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFE320000010006FFFFFFFFFFFFFFFFFFFFF7
        23FFFFFFFFFFFFFFFFFFFFFFFFFF810010001100110000002EFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFAFFFFFFFFA61001000013443300001027FFFFFFFFFFFFFFBFFFF730010
        37FFFFFFFFFFFFFFFFF30001047FFFFFAFFFFFFFFFFFBFFFF410101010000000
        00102EFFFFFFFFFFFFFFFFFFFFFF82010000014466666443000048FFFFAFFFFF
        FFFFFFFFFFFFFFFFFFFFFFF7221010000100001101EFFFFFFFFFFFFFFFFFFFFF
        FFFE4001006DFFFFFFFFFFFFFFFFF7300004AFFFFFFFFFFFFFFFFFFFFFFFFFF6
        36EFFFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE83001026FFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFBFFFFFE40011003446766300026EFFBFFFFFFFFFFFFFFFFFFF
        FFFFFFFF7100126FFFFFFFFFFFFFFFFFFFFFFF7204FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFD4010011000000100106FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6200010246
        7FFFBFFFA640014BBFFFFFFFFFFFFFFFBFB93000EFFFFFFFFFFFFFFFFFF30022
        4FFFFFFFFFFFFFFFFFFFBBBFFA20010047FFFFFFA64207FFFFFFFFFFFFFFFFFF
        FFFFF40000037FFFFFFFFFFF6400004EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        40000047FFFFFE6400AFFFFFFFFFFFFFFFFFFFFFFFFF720103FFFFFFFFFFFFFF
        FFFF6000116FFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6248FFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF400003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF63001
        0047FFFFFFFFA630026FFFFFFFFFFFFFFFFFFFFFFFFFBBFFF40104FFFFFFFFFF
        FFFFFFFBFFFFF71014FFFFFFFFFFFFFFFFFFFFFFFFFFFFF720000368FFFFF763
        06FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFBFFFA400000048FFFFFCFFFFFFF7103FFAFFFFFF
        FFFFFFFFFFFF70017FFFFFFFFFFFFFFFFF700003EFFFFFFFFFFFFFFFFFFFFFFF
        BF300004FFFFBBBFFFF406FFFFFFFFFFFFFFFFFFFFFFF600013FFFFFFFFFFFFF
        FF8400027FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF610104FFFFFFFBBF627FFFFF
        FFFFFFFFFFFFFFFFFFFFF01103FFFEFFFFFFFFFFFFF4100037FFFFFFFFF9FFFF
        FFFFFFFFFFFFFFFFFF7226FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF601004FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFBFFFFF40001048FFFFFFFFFFFFA60014FFFB
        FFFFFFFFFFFFFFFFFFFFFFFFF60007FFFFFFFFFFFFFFFFFFBFFF721004FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF01112EFFBFFFBFF834FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFA31001048FFFFFFFFFFFFFFFF730FBFEFFFFFFFFFFFFFFFFFF3016FFFFFFF
        FFFFFFFFBF400006FFFFFFFFFFFFFFFFFFFFFFFFBF300007FFFCFFFFFFF706FF
        FFFFFFFFFFFFFFFFFFFFB700004FFFFFFFFFFFFFFFFF731026FFFFFFFFFFFFFF
        FFFFFFFFFFFFBBFF720006FFFFFBFFBFF36FFFFFFFFFFFFFFFFFFFFFFFFFF000
        06BBFFFFFFFFFFFFFD4011148FFFFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7304E
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFBFFF720004FBFFBFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFF4200026FFFFFFFFFFFFFFFF62004EFFFFFFFFFFFFFFFFFFFFFFFFFF
        F72009BFFFFFFFFFFFFFFFFFFEF7200003EFFFFFFFFFFFFFFFFFFFFFFFFFFFB9
        20114FFFFFFFFFFF44FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3000016FFFFFFFFFFFFFF
        FFBFF608FFFFFFFFFFFFFFFFFFFFF6003FFFFFFFFFFFFFFFFF20103FFFFFFFFF
        FFFFFFFFFFFFFFFFFF30100FFFFFFFFFFFFF46FFFFFFFFFFFFFFFFFFFFFFF700
        006FFFFFFFFFFFFFFFFFFE30027FFFFFFFFFFFFFFFFFFFFFFFFFFFFF700107FF
        FFFFFFFFF46FFFFFFFFFFFFFFFFFFFFFFFFFF41006FFFFFFFFFFFFFFE310004F
        FFFFFFFFFFBFFFFFFFFFFFFFFFFFFFFFFFFF7006FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF700006FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEF6000006FFFFFFFFF
        FFFFFFFF970004FFFFFFFFFFFFFFFFFFFFFFFFFFF7000FFFFFFFFFFFFFFFFFFF
        FF72000014FFFFFFFFFFFFFFFFFFFFFFFFFFFFBF30004FFFFFFFFFFF74FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFA3000106FFFFFFFFFFFFFFFFFFFB807FFFBFFFFFFFFFFFB
        FBBFF80008FFFFFFFFFFFFFFF601006FFFFFFFFFFFFFFFFFFFFFFFFFFF41100F
        FFFFFFFFFFFF76FFFFFFFFFFFFFFFFFFFFFFF700006BFFFFFFFFFFFFFFFFBBE3
        1027FFFFFFFFFFFFFFFFFFFFFFFFFFFF720027FFFFFFFFFFB77FFFFFFFFFFFFF
        FFFFFFFFFFFFF30006FFFFFFFFFFFFFA300104FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF4007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF20006FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFF7200106FFFFFFFFFFFFFFFFBFFF60016FFFFFFFFF
        FFFFFFFFFFFFFFFFF7001FFFFFFFFFFFFFFFFFFFF720011003FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFBF40104FFFFFFFFFFFF6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4100006
        FFFFFFFFFFFFFFFFFFFFFF34FFFFFFFFFFFFFFFFFFFFFF4116FFFFFFFFFFFFFF
        F30002AFFFFFFFFFFFFFFFFFFFFFFFFFFF40003FFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF00006FFFFFFFFFFFFFFFFFFFF70004FFFFFFFFFFFFFFFFFFFF
        FFFFFFFF700007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40006FFFFFF
        FFFFFFD300014FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7004FFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFF00007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3
        00024FFFFFFFFFFFFFFFFFFFFFF30007FFFFFFFFFFFFFFFFFFFFFFFFF7000FFF
        FFFFFFFFFFFFFFFF7200003304FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40004FFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7000004FFFFFFFFFFFFFFFFFFFFFFF66
        FFFFFFFFFFFFFFFFFFFFFF6003FFFFFFFFFFFFFF800004FFFFFFFFFFFFFFFFFF
        FFFFFFFFFF40013FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00006FFFFF
        FFFFFFFFFFFFFFFF40006FFFFFFBFFFFFFFFFFFFFFFFFFFF700007FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFF40006FFFFFFFFFFFA301014FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFF7003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        F00007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF610003AFFFFFFFFFFFFFFFFFFF
        FFF70003FFFFFFFFFFFFFFFFFFFFFFFFF7000FFFFFFFFFFFFFFFFFF7200103F4
        03FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40004FFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF400103FFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFA2
        008FFFFFFFFFFFFF600007FFFFFFFFFFFFFFFFFFFFFFFFFFFF60014FBFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00007FFFFFFFFFFFFFFFFFFFFF81003FFF
        FFFBFFFFFFFFFFFFFFFFFFFF700007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFF40006FFFFFFFFFFE300014FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFF7003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00007FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFA201006FFFFFFFFFFFFFFFFFFFFFFFF41006FFFFFFFFFFFFFFF
        FFFFFFFFF7001EFFFFFFFFAFFFFFFF7100002AF404FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF40004FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7010027FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4006FFFFFFFFFFBFF31013EFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF60004FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF00007FFFFFFFFFFFFFFFFFFFFFF40006FFFFFFFFFFFFFFFFFFFFFFFFFF
        700007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40006FFFFFFFFF83000
        03AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFBFF4004FFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFF00007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF600103EFFFF
        FFFFFFFFFFFFFFFFFFFF60013FFFFFFFFFFFFFFFFFFFFFFFF7003FFFFFFFFFFF
        FFFFF71011027FF404FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40004FFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFF400004FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFF7003FFFFFFFFFFFF700006FFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF60003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00007FFFFFFFFFFFFF
        FFFFFFFFF60003FFFFFFFFFFFFFFFFFFFFFFFFFF700007FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFF40006FFFFFFBFF400011AFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFBFFFFF82004FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00007FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFF300006FFFFFFFFFFFFFFFFFFFFFFFFF8200
        07FFFFFFFFFFFFFFFFFFFFFFF7004FBFFFFFFFFFBFFFE3000018FFF303FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF40004FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2
        10007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3008FFFF
        FFFFFFF401008FBFFFFFFFFFFFFFFFFFFFFFFFFFFF60004FFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF00007FFFFFFFFFFFFFFFFFFFFFF800108FFFFFFFFF
        FFFFFFFFFFFFFFFF700007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF400
        06FFFFFFFF4000007FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFFFA3001
        6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00007FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF820000EFFFFFFFFFFFFFFFFFFFFFFFFFF31004FFFFFFFFFFFFFFFFFFFFFF
        F7003FFFFFFFFFFFFFFA3000006FFFF403FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        40004FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF701003FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4016FFFFFFFFFFD20004FFBFFFFFFFFF
        FFFFFFFFFFFFFFFFFF60004FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        007FFFFFFFFFFFFFFFFFBFFFCF30106FFFFFFFFFFFFFFFFFFFFFFFFF700007FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40006FFFFFFF6100026FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA30003FBFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFF00007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF600004FFFFFFFFFFFFFF
        FFFFFFFFFFFFF40103FFFFFFFFFFFFFFFFFFFFFFF7003FFFFFFFFFFFFFE30000
        06FFFFF313FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40004FFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF601104FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFBFFF70034444444446300026FFFFFFFBFFFFFFFFFFFFFFFFFFFFFF60004F
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00007FFFFFFFFFFFFFFFFFFFFF
        CF31104FFFFFFFFFFFFFFFFFFFFFFFFF700007FFFFFFFFFAFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF40006FFFFFF7201004FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFF7300017FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00007FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF400006FFFFFFFFFFFFFFFFFFFFFFFFFFF601008FFFFF
        FFFFFFFFFFFFFFFFF7004FBFFFFFFFFFFA3001006FFFFFF314FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF40004FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF410007FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF301100000000200
        102FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF60003FFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF00007FFFFFFFFFFFFFFFFFFFFFFF40013FFFFFFFFFFFFFFFFF
        FFFFFFFF700007BFFFBFFFE3FFFFFFFFFFFFFFFFFFFFFFFFFFFFF30004777646
        100003FFFBBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6101004FFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFF00007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3100
        07EFFFFFFFFFFFFFFFFFFFFFFFFFF601006FFFFFFFFFFFFFFFFFFFFFF7004FFF
        FFFFFFFFF4111104FFFFFFF004FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40004FFC
        FFFFFF47FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF30002FFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFF601366466646400004FFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF60003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00007FFFFF
        FFFFFFFFFFFFFFFFFF60000FFFFFFFFFFFFFFFFFFFFFFFFF700007FFFFFFFF72
        BFFFFFFFFFFFFFFFFFFFFFFFFFFFF40000000010000007FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF74210004FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        F00007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF300008FFFFFFFFFFFFFFFFFFFFFF
        FFFFF700006FFFFFFFFFFFFFFFFFFFFFF7004FFFFFFFFFFF4200004FFFFFFFF0
        04FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40006EFFFFFFFF36FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF41002FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        F8203FFFFFFFF621108FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF60003FFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00007FFFFFFFFFFFFFFFFFFFFFFF60000F
        FFFFFFFFFFFFFFFFFFFFFFFF700007FFFFFFFF62FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFF4000034466642004FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE401
        00003AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00007FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF00000FFFFFFFFFFFFFFFFFFFFFFFFFFFF701006FFFFFFFFFFFFF
        FFFFFFFFF7003FFFFFFFFFE4000004EFFFFFFFF004FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF40004FFFFFFFF724FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF30003FFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4008FFFFFFF30003FBFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF60003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF00007FFFFFFFFFFFFFFFFFFFFFFF400007FFFFFFFFFFFFFFFFFFFFFFFF
        7000067777746400AFFFFFFFFFFFFFFFFFFFFFFFFFFFF40004FFBFFFFE6206FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE620101024EFFBFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFF00007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000FFFFFFF
        FFFFFFFFFFFFFFFFFFFFF700004FFFFFFFFFFFFFFFFFFFFFF7003EFFFFFFFF60
        101038FFFFFFFFF004FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4000477777664206
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF30013FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF6006FFFFFF820006FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF60003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00007FFFFFFFFFFFFF
        FFFFFFFFFF400007FFFFFFFFFFFFFFFFFFFFFFFF70001000010000017FFBFFFF
        FFFFFFFFFFFFFFFFFFFFF40014FFFFFFFFF4107FFFFBFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF400100004FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00007FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF00001FFFFFFFFFFFFFFFFFFFFFFFFFFFF700
        004FFFFFFFFFFFFFFFFFFFFFF7004FFFFFFFF62001039FFFFFFFFFF004FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF4000000100000006FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF31
        003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8203FB
        FFFF60002AFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF60003FFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF00007FFFFFFFFFFFFFFFFFFFFFFF40000FFFFFFFFF
        FFFFFFFFFFFFFFFF70000334343430006FFFFFFFFFFFFFFFFFFFFFFFFFFFF300
        06FFFFFFFFFF302DFFFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFF400000026FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00007FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF10000FFFFFFFFFFFFFFFFFFFFFFFFFFFF600004FFFFFFFFFFFFFFFFFFFFF
        F7004FFFFFFF6000003EFFFFFFFFFFF004FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        4000334434440104FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40003FFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4028FFFFF30004FFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF60003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        007FFFFFFFFFFFFFFFFFFFFFFA20000FFFFFFFFFFFFFFFFFFFFFFFFF700017FF
        FFFFFF844FFFFFFFFFFFFFFFFFFFFFFFFFFFF41006FFBFFFFFFF6004FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFEF400000037FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFF00007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF30000FFFFFFFFFFFFFFF
        FFFFFFFFFFFFF400006FFFFFFFFFFFFFFFFFFFFFF7006FFFFFF7000002AFFFFF
        FFFFFFF004FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40004FFFFFFFFE62FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF41003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFF6106FFFF800107FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF60003F
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00007FFFFFFFFFFFFFFFFFBFFF
        A700013FFFFFFFFFFFFFFFFFFFFFFFFF700007FFFFBFBBFF9FFFFFFFFFFFFFFF
        FFFFFFFFFFFFF40006BFFFFFFFFB80107FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6
        2000104FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00007FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF40000FFFFFFFFFFFFFFFFFFFFFFFFFFFF400006FFFFF
        FFFFFFFFFFFFFFFFF7006FBFFF72000017FFFFFFFFFFFFF004FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF40006FFFFFFFBFF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF60010FFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF303FFFF40003
        FFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF60003FFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF00007FFFFFFFFFFFFFFFFFFFFFF601104FFFFFFFFFFFFFFFFF
        FFFFFFFF700007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40006FFFFFF
        FFFFF3004FFFFFFFFFFFFFFFFFFFFFFFFFFFFF81001026FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFF00007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6000
        27FFFFFFFFFFFFFFFFFFFFFFFFFFF310007FFFFFFFFFFFFFFFFFFFFFF7006FFF
        F72010027FFFFFFFFFFFFFF003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40004FFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF820027FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF4028FBF30006FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF60003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00007FFFFF
        FFFFFFFFFFFFFFFFF301106FFFFFFFFFFFFFFFFFFFFFFFFF700007FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFF40006FFFFFFFFFFF4000EFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF4000037FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        F00007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE00006FFFFFFFFFFFFFFFFFFFFFF
        FFFF700000AFFFFFFFFFFFFFFFFFFFFFF7004FFFE3001027FFFFFFFFFFFFFFF0
        03FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40004FFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFF30106FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF7006FF70000AFFFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF60003FFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00007FFFFFFFFFFFFFFFFFFFBF7000008F
        FFFFFFFFFFFFFFFFFFFFFFFF700007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFF40006FFFFFFFFFFF30006FFFFFFFFFFFFFFFFFFFFFFFFFFFF200127FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00007FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF31004FFFFFFFFFFFFFFFFFFFFFFFFFF600103FFFFFFFFFFFFFF
        FFFFFFFFF7004FFE3201026FFFFFFFFFFFFFFFF003FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF40004FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF60004FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF313FF40004FFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF60003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF00007FFFFFFFFFFFFFFFFFFFFF400104FFFFFFFFFFFFFFFFFFFFFFFFFF
        700007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40006FFFFFFFFFFF300
        06FFFFFFFFFFFFFFFFFFFFFFFFFFF700006FFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFF00007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF60103FFFFFF
        FFFFFFFFFFFFFFFFFFFF310006FFFFFFFFFFFFFFFFFFFFFFF7004FF4201126FF
        FFBFFFFFFFFFFF8000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40004FFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFF82003AEFFFFFFFFFFFFFFFFFFFFFFFF4FBFFFFFFF
        FFFFFFFFFFFFFFFFFFFFF600EF20006FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF60003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00007FFFFFFFFFFFFF
        FFFFFFF6000107FFFFFFFFFFFFFFFFFFFFFFFFFF700007FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFF40006FFFFFFFFFFF30006FFFFFFFFFFFFFFFFFFFFFF
        FFFFF60024FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00007FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFE30027BFFFFFFFFFFFFFFFFFFFFFFF70001
        28FFFFFFFFFFFFFFFFFFFFFFF7006F4200006FFFFFFFFFFFFFFFFF7000FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF40004FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        60004FFFFFFFFFFFFFFFFFFFFFFFFF2FFAFFFFFFFFFFFFFFFFFFFFFFFFFFF800
        660001FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF60003FFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF00007FFFFFFFFFFFFFFFFFFF7200004FFFFFFFFFFF
        FFFFFFFFFFFFFFFF700007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF400
        06FFFFFFFFFFE10016FFFFFFFFFFFFFFFFFFFFFFFFFFF60006FFFFFFFFFFAFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00007FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF62004FFFFFFFFFFFFFFFFFFFFFFFE410004FFFFFFFFFFFFFFFFFFFFFFF
        F70064000004FFFFFFFFFFFFFFFFFF7000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        40004FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA3002AFBFFFFFFFFFFFFFFFF
        FFFFF70FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40340004FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF60003FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        007FFFFFFFFFFFFFFFFFFE3000017FFBFFFFFFFFFFFFFFFFFFFFFFFF700007FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40006FFFFFFFFFF700006FFFFFF
        FFFFFFFFFFFFFFFFFFFFF6110FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFF00007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40008FFFFFFFFFFFF
        FFFFFFFFFF6000019FFFFFFFFFFFFFFFFFFFFFFFF7004000024FFFFFFFFFFFFF
        FFFFFF7000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF40004FFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFF70104FFFFFFFFFFFFFFFFFFFFFFB60FBFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF61001017FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF60003F
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00007FFFFFFFFFFFFFFFFFA300
        0026FFFFFFFFFFFFFFFFFFFFFFFFFFFF700007FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF40006FFFFFFFFFF400006FFFFFFFFFFFFFFFFFFFFFFFFFFB600
        0FFFFFFFFFFFF68FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00007FFFFFFFFFF
        FAFFFFFFFFFFFFFFFFFFFFF83024FFFFFFFFFFFFFFFFFFFFF7200006FFFFFFFF
        FFFFFFFFFFFFFFFFF700000004FFFFFFFFFFFFFFFFFFFF7000FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF40004FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF60006F
        FFFFFFFFFFFFFFFFFFFFD32FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF100003FFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF60104FFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF00007FFFFFFFFFBFFFFFF71110024FFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF701007BFFFFFFFF74FFFFFFFFFFFFFFFFFFFFFFFFFFFF40106FFFFFF
        FFF700002AFFFFFFFFFFFFFFFFFFFFFFFFFFF7000EFFFFFFFFFFF46FFFFFFFFF
        FFFFFFFFFFF48FFFBFFFFFFFF00007FFFFFFFFFFF47FFFFFFFFFFFFFFFFFFFFF
        70004FFBFFFFFFFFFFFFFFFFA301104FFFFFFFFFFFFFFFFFFFFFFFBFF7000102
        4FFFFFFFFFFFFFFFFFFFFF7000FFFFFFFFFFFFFFFFFFFFFFFFFFFFBF41004FFF
        FFFFFFF3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE40006FFFBFFFFFFFFFFFFBFFF4007
        BFFBFFFFFFFFFFFFFFFFFFFFFFFFFFF400106FFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFCF40004FFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF10017FFFFF
        FFFFFFFFFD60000106FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF700007FBFFFFFFF4
        4FFFFFFFFFFFFFFFFFFFFFFFFFFFF30016FFFFFFFFE400026FFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF3016FFFFFFFFFFF24FFFFFFFFFFFFFFFFFFFF44FFFFFFFFFBF
        F20107FBFFFFFBFFF37FFFFFFFFFFFFFFFFFFFFAF61004FFFBFFFFFFFFFFFFF8
        300104FFFFFFFFFFFFFFFFFFFFFFFFBFF7000003AFFFFFFFFFFFFFFFFFFFFF70
        00FFFFFFFFFFFFFFFFFFFFFFFFFFFFBB40006FFFFFFFBFD27FFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF601048FBFFFFFFFFCFFFFF840107BFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFF60001AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9FFFFF40003FFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFF700007FFFFFFFFFFFFD631001026FFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF720007FFFFFFFFF44FFFFFFFFFFFFFFFFFFFFFFF
        FFFFF31006FFFFFFFA400003FFFFFFFFFFFFFFFFFFFFFFFFFFFFBF6003AFFFFF
        FFFF606FFFFFFFFFFFFFFFFFFFF426FEFFFFFFFFF00007FFFFFFFFFE407FFFFF
        FFFFFFFFFFFFFFFFFF62104DFFFFFFFFFFFFFF6110004FFFFFFFFFFFFFFFFFFF
        FFFFFFFFF710003DFFFFFFFFFFFFFFFFFFFFFF6000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF30004FFFFFFFFF627FFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6200147FFFF
        FFFFFFFF74000017FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBF3004FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF30000FFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFF600124EFFFFFFFF76400101004EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        610106FFFFFF76400FFFFFFFFFFFFFFFFFFFFFFFFFFFA20004FFFFFE6310003E
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4004DFFFFFFF7306BFFFFFFFFFFFFFFFF
        FFF70146777777777000067777777643017FFFFFFFFFFFFFFFFFFFFFFFF73003
        6DFFFFFFFFFF74010036FFFFFFFFFFFFFFFFFFFFFFFFFFFFF71001EFFFFFFFFF
        FFFFFFFFFFFFFF4000EFFFFFFFFFFFFFFFFFFFFFFFFFFFFA11104EFFFFF87400
        7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFF9FFE6200034667777664200111006FBFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFBF4006FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        F6201024FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA3010000334443200000
        100368FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF830000100000022010FFFFFFF
        FFFFFFFFFFFFFFFFFFFE400100436441000006EFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF401267FF7642106FFFFFFFFFFFFFFFFFFFFF00000011010010110100
        00000010006FFFFFFFFFFFFFFFFFFFBFFFFFF620004678FFA743000004AFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFF70237FFBFFFFFFFFFFFFFFFFFFFF720004FFFFF
        FFFFFFFFFFFFFFFFFFFFFF9400010000010010006FFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF86300100000001010010344EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        823FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6322000000236FFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFF83320000002000000000023467FFFBFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF7430001000000010000007FFFFFFFFFFFFFFFFFFFFFFF4320000
        000100010246AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF63000000010006B
        FFFFFFFFFFFFFFFFFFFF3000000000000100000000000000006BFFFFFFFFFFFF
        FFFFFFFFFFFFFFE632000000000001368FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        F7027FFFFFFFFFFFFFFFFFFFFF430000110237FFFFFFFFFFFFFFFFFFFFFF4420
        00000000000000104FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE664432003444
        667FFFFFFBFFFFFFFFFFFFFFFFFFFFFFFFFFBFFFF46FFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFA7777FFF77678FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF77778F
        EF77777777778FFFFFFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF77777FBFFFF
        FFFFFF7768FFFFFFFFFFFFFFFFFFFFFFF87777FFF7777777FFBBFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFF64432234467AFFFFFFFFFFFFFFFFFFFFF6467
        78FFFFFFFFFFFFFFFFFFEFF7768FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8644310
        334468FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF37FFFFFFFFFFFFFFFFFFFF
        FF87777FF7777FFFFFFFFFFFFFFFFFFFFFFF87777AFFFFFFFFFFF8766FFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFBFFFFFFFFFFFFFFFFFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFF
        FFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFBFFFFFFBFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFBFFFFFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCBC
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFFFFFFFFBFFFFFBFFFFFFFFFFFFF
        FFFFFFFFFFFFFFBFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFBFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFBBFFBBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFF0}
      Stretch = True
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
      '               Operator.Phone as Contact_Phone,'
      '               Operator.Email as Contact_Email,'
      
        '               Purchase_OrderLine.Depth, Purchase_OrderLine.Widt' +
        'h,'
      
        '               Purchase_OrderLine.Depth_Unit, Purchase_OrderLine' +
        '.Width_Unit,'
      '               Customer_Contact.Name as Cust_Contact_Name,'
      '               Purchase_OrderLine.Form_Reference,'
      '               Purchase_OrderLine.Proof_Revision,'
      '               Customer.Invoice_Location'
      
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
    Left = 80
    Top = 49
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
    Top = 71
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
      '        Operator.Phone as Contact_Phone,'
      '        Operator.Email as Contact_Email,'
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
    Left = 246
    Top = 45
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
    Left = 438
    Top = 62
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
    Top = 112
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
    Left = 494
    Top = 78
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
  object qryInvLocation: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT * '
      'FROM Invoice_location'
      'ORDER BY Invoice_Location')
    Left = 592
    Top = 8
  end
end
