object frmwtRPTemplate: TfrmwtRPTemplate
  Left = 2
  Top = 32
  Caption = 'Template Check List'
  ClientHeight = 699
  ClientWidth = 1362
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  
  OnCreate = FormCreate
  TextHeight = 13
  object qrpDetails: TQuickRep
    Left = 216
    Top = -184
    Width = 794
    Height = 1123
    ShowingPreview = False
    BeforePrint = qrpDetailsBeforePrint
    DataSet = qryReport
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Lucida Sans'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE'
      'QRLOOPBAND1')
    Functions.DATA = (
      '0'
      '0'
      #39#39
      '0')
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
    ReportTitle = 'Template Check List'
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
    object qrgQuote: TQRGroup
      Left = 38
      Top = 1081
      Width = 718
      Height = 2
      AlignToBottom = False
      BeforePrint = qrgQuoteBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        5.291666666666667000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'quote'
      Master = qrpDetails
      ReprintOnNewPage = False
    end
    object qrbPageHeader: TQRBand
      Left = 38
      Top = 38
      Width = 718
      Height = 1043
      AlignToBottom = False
      BeforePrint = qrbPageHeaderBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        2759.604166666667000000
        1899.708333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object gtQRShape14: TQRShape
        Left = 0
        Top = 45
        Width = 360
        Height = 32
        Size.Values = (
          84.666666666666680000
          0.000000000000000000
          119.062500000000000000
          952.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape47: TQRShape
        Left = 359
        Top = 644
        Width = 359
        Height = 85
        Size.Values = (
          224.895833333333300000
          949.854166666666800000
          1703.916666666667000000
          949.854166666666800000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape17: TQRShape
        Left = 359
        Top = 200
        Width = 359
        Height = 231
        Size.Values = (
          611.187500000000000000
          949.854166666666800000
          529.166666666666700000
          949.854166666666800000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape13: TQRShape
        Left = 359
        Top = 138
        Width = 359
        Height = 32
        Size.Values = (
          84.666666666666680000
          949.854166666666800000
          365.125000000000000000
          949.854166666666800000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrlblTemplate: TQRLabel
        Left = 96
        Top = 0
        Width = 572
        Height = 43
        Size.Values = (
          113.770833333333300000
          254.000000000000000000
          0.000000000000000000
          1513.416666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Ruby Granite -Template Check List'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -37
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 28
      end
      object qrmSiteAddress: TQRMemo
        Left = 367
        Top = 225
        Width = 340
        Height = 144
        Size.Values = (
          381.000000000000000000
          971.020833333333200000
          595.312500000000000000
          899.583333333333200000)
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
        FontSize = 10
      end
      object gtQRLabel6: TQRLabel
        Left = 367
        Top = 382
        Width = 61
        Height = 17
        Size.Values = (
          44.979166666666670000
          971.020833333333300000
          1010.708333333333000000
          161.395833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Contact:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRDBText2: TQRDBText
        Left = 430
        Top = 382
        Width = 280
        Height = 17
        Size.Values = (
          44.979166666666670000
          1137.708333333333000000
          1010.708333333333000000
          740.833333333333200000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Install_Name'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel7: TQRLabel
        Left = 367
        Top = 406
        Width = 45
        Height = 17
        Size.Values = (
          44.979166666666670000
          971.020833333333300000
          1074.208333333333000000
          119.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Phone:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRDBText3: TQRDBText
        Left = 430
        Top = 406
        Width = 280
        Height = 17
        Size.Values = (
          44.979166666666670000
          1137.708333333333000000
          1074.208333333333000000
          740.833333333333200000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Install_Phone'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape3: TQRShape
        Left = 0
        Top = 241
        Width = 360
        Height = 51
        Size.Values = (
          134.937500000000000000
          0.000000000000000000
          637.645833333333300000
          952.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape4: TQRShape
        Left = 0
        Top = 107
        Width = 360
        Height = 32
        Size.Values = (
          84.666666666666680000
          0.000000000000000000
          283.104166666666700000
          952.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape5: TQRShape
        Left = 0
        Top = 169
        Width = 360
        Height = 73
        Size.Values = (
          193.145833333333300000
          0.000000000000000000
          447.145833333333400000
          952.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape6: TQRShape
        Left = 0
        Top = 357
        Width = 360
        Height = 74
        Size.Values = (
          195.791666666666700000
          0.000000000000000000
          944.562500000000000000
          952.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel1: TQRLabel
        Left = 8
        Top = 172
        Width = 48
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          455.083333333333300000
          127.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Colour:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel3: TQRLabel
        Left = 7
        Top = 249
        Width = 76
        Height = 17
        Size.Values = (
          44.979166666666670000
          18.520833333333330000
          658.812500000000000000
          201.083333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Edge Detail:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape7: TQRShape
        Left = 0
        Top = 291
        Width = 360
        Height = 67
        Size.Values = (
          177.270833333333300000
          0.000000000000000000
          769.937500000000000000
          952.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel9: TQRLabel
        Left = 7
        Top = 302
        Width = 64
        Height = 17
        Size.Values = (
          44.979166666666670000
          18.520833333333330000
          799.041666666666700000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Upstands:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel10: TQRLabel
        Left = 191
        Top = 330
        Width = 46
        Height = 17
        Size.Values = (
          44.979166666666670000
          505.354166666666700000
          873.125000000000000000
          121.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Height:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRShape7: TQRShape
        Left = 246
        Top = 337
        Width = 83
        Height = 8
        Size.Values = (
          21.166666666666670000
          650.875000000000000000
          891.645833333333300000
          219.604166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRLabel11: TQRLabel
        Left = 335
        Top = 330
        Width = 23
        Height = 17
        Size.Values = (
          44.979166666666670000
          886.354166666666700000
          873.125000000000000000
          60.854166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'mm'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape9: TQRShape
        Left = 359
        Top = 45
        Width = 359
        Height = 94
        Size.Values = (
          248.708333333333300000
          949.854166666666800000
          119.062500000000000000
          949.854166666666800000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel2: TQRLabel
        Left = 368
        Top = 54
        Width = 67
        Height = 17
        Size.Values = (
          44.979166666666670000
          973.666666666666700000
          142.875000000000000000
          177.270833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel5: TQRLabel
        Left = 368
        Top = 146
        Width = 70
        Height = 17
        Size.Values = (
          44.979166666666670000
          973.666666666666700000
          386.291666666666700000
          185.208333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Reference:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRDBText4: TQRDBText
        Left = 439
        Top = 146
        Width = 275
        Height = 17
        Size.Values = (
          44.979166666666670000
          1161.520833333333000000
          386.291666666666700000
          727.604166666666800000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Reference'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape10: TQRShape
        Left = 0
        Top = 624
        Width = 717
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          1651.000000000000000000
          1897.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Brush.Color = clBtnFace
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel14: TQRLabel
        Left = 7
        Top = 627
        Width = 222
        Height = 16
        Size.Values = (
          42.333333333333330000
          18.520833333333330000
          1658.937500000000000000
          587.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Access to site - tick as required.'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape22: TQRShape
        Left = 0
        Top = 644
        Width = 360
        Height = 85
        Size.Values = (
          224.895833333333300000
          0.000000000000000000
          1703.916666666667000000
          952.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape23: TQRShape
        Left = 8
        Top = 656
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          1735.666666666667000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape24: TQRShape
        Left = 8
        Top = 680
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          1799.166666666667000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape25: TQRShape
        Left = 8
        Top = 704
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          1862.666666666667000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape26: TQRShape
        Left = 184
        Top = 656
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          486.833333333333300000
          1735.666666666667000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel22: TQRLabel
        Left = 40
        Top = 656
        Width = 36
        Height = 17
        Size.Values = (
          44.979166666666670000
          105.833333333333300000
          1735.666666666667000000
          95.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Stairs'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel23: TQRLabel
        Left = 40
        Top = 680
        Width = 78
        Height = 17
        Size.Values = (
          44.979166666666670000
          105.833333333333300000
          1799.166666666667000000
          206.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Building Site'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel24: TQRLabel
        Left = 40
        Top = 704
        Width = 88
        Height = 17
        Size.Values = (
          44.979166666666670000
          105.833333333333300000
          1862.666666666667000000
          232.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'PPE Required?'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel25: TQRLabel
        Left = 208
        Top = 656
        Width = 47
        Height = 17
        Size.Values = (
          44.979166666666670000
          550.333333333333300000
          1735.666666666667000000
          124.354166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Parking'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape35: TQRShape
        Left = 359
        Top = 169
        Width = 359
        Height = 32
        Size.Values = (
          84.666666666666680000
          949.854166666666800000
          447.145833333333300000
          949.854166666666800000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel36: TQRLabel
        Left = 367
        Top = 178
        Width = 89
        Height = 16
        Size.Values = (
          42.333333333333330000
          971.020833333333300000
          470.958333333333300000
          235.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sales Person:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrmAddress: TQRMemo
        Left = 439
        Top = 54
        Width = 275
        Height = 17
        Size.Values = (
          44.979166666666670000
          1161.520833333333000000
          142.875000000000000000
          727.604166666666800000)
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
        FontSize = 10
      end
      object qrlblQuoteLabel: TQRLabel
        Left = 9
        Top = 51
        Width = 85
        Height = 19
        Size.Values = (
          50.270833333333330000
          23.812500000000000000
          134.937500000000000000
          224.895833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Quote No:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object qrlblQuote: TQRDBText
        Left = 104
        Top = 51
        Width = 52
        Height = 19
        Size.Values = (
          50.270833333333330000
          275.166666666666700000
          134.937500000000000000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Quote'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object qrlblEdgeDetail: TQRLabel
        Left = 94
        Top = 249
        Width = 259
        Height = 17
        Size.Values = (
          44.979166666666670000
          248.708333333333300000
          658.812500000000000000
          685.270833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'qrlblEdgeDetail'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblUpstand: TQRLabel
        Left = 94
        Top = 302
        Width = 83
        Height = 17
        Size.Values = (
          44.979166666666670000
          248.708333333333300000
          799.041666666666700000
          219.604166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlblUpstand'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblOfficeContact: TQRLabel
        Left = 461
        Top = 178
        Width = 255
        Height = 16
        Size.Values = (
          42.333333333333330000
          1219.729166666667000000
          470.958333333333300000
          674.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlblOfficeContact'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape45: TQRShape
        Left = 0
        Top = 450
        Width = 360
        Height = 175
        Size.Values = (
          463.020833333333300000
          0.000000000000000000
          1190.625000000000000000
          952.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape2: TQRShape
        Left = 0
        Top = 728
        Width = 717
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          1926.166666666667000000
          1897.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Brush.Color = clBtnFace
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape11: TQRShape
        Left = 0
        Top = 748
        Width = 718
        Height = 93
        Size.Values = (
          246.062500000000000000
          0.000000000000000000
          1979.083333333333000000
          1899.708333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel12: TQRLabel
        Left = 7
        Top = 731
        Width = 116
        Height = 16
        Size.Values = (
          42.333333333333330000
          18.520833333333330000
          1934.104166666667000000
          306.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer Notes:'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblColour: TQRLabel
        Left = 63
        Top = 172
        Width = 290
        Height = 46
        Size.Values = (
          121.708333333333300000
          166.687500000000000000
          455.083333333333300000
          767.291666666666800000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlblColour'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel13: TQRLabel
        Left = 368
        Top = 82
        Width = 45
        Height = 17
        Size.Values = (
          44.979166666666670000
          973.666666666666700000
          216.958333333333300000
          119.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Phone:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel15: TQRLabel
        Left = 368
        Top = 111
        Width = 36
        Height = 17
        Size.Values = (
          44.979166666666670000
          973.666666666666700000
          293.687500000000000000
          95.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Email:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblCustomerPhone: TQRLabel
        Left = 439
        Top = 82
        Width = 275
        Height = 17
        Size.Values = (
          44.979166666666670000
          1161.520833333333000000
          216.958333333333300000
          727.604166666666800000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlblCustomerPhone'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblCustomerEmail: TQRLabel
        Left = 439
        Top = 111
        Width = 275
        Height = 17
        Size.Values = (
          44.979166666666670000
          1161.520833333333000000
          293.687500000000000000
          727.604166666666800000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlblCustomerEmail'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape15: TQRShape
        Left = 0
        Top = 76
        Width = 360
        Height = 32
        Size.Values = (
          84.666666666666680000
          0.000000000000000000
          201.083333333333300000
          952.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape16: TQRShape
        Left = 0
        Top = 138
        Width = 360
        Height = 32
        Size.Values = (
          84.666666666666680000
          0.000000000000000000
          365.125000000000000000
          952.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrlblSalesOrder: TQRLabel
        Left = 8
        Top = 83
        Width = 127
        Height = 19
        Size.Values = (
          50.270833333333330000
          21.166666666666670000
          219.604166666666700000
          336.020833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sales Order No:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object qrlblSalesOrderNo: TQRDBText
        Left = 149
        Top = 83
        Width = 97
        Height = 19
        Size.Values = (
          50.270833333333330000
          394.229166666666700000
          219.604166666666700000
          256.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Sales_Order'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object gtQRLabel4: TQRLabel
        Left = 367
        Top = 206
        Width = 142
        Height = 17
        Size.Values = (
          44.979166666666670000
          971.020833333333300000
          545.041666666666700000
          375.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Installation Address:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel17: TQRLabel
        Left = 7
        Top = 462
        Width = 39
        Height = 16
        Size.Values = (
          42.333333333333330000
          18.520833333333330000
          1222.375000000000000000
          103.187500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Make:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel18: TQRLabel
        Left = 7
        Top = 521
        Width = 79
        Height = 17
        Size.Values = (
          44.979166666666670000
          18.520833333333330000
          1378.479166666667000000
          209.020833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Dimensions:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel19: TQRLabel
        Left = 39
        Top = 551
        Width = 199
        Height = 17
        Size.Values = (
          44.979166666666670000
          103.187500000000000000
          1457.854166666667000000
          526.520833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Taken from site, to be returned'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape19: TQRShape
        Left = 8
        Top = 551
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          1457.854166666667000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel20: TQRLabel
        Left = 7
        Top = 489
        Width = 44
        Height = 17
        Size.Values = (
          44.979166666666670000
          18.520833333333330000
          1293.812500000000000000
          116.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Model:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel38: TQRLabel
        Left = 7
        Top = 597
        Width = 109
        Height = 17
        Size.Values = (
          44.979166666666670000
          18.520833333333330000
          1579.562500000000000000
          288.395833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Drainer Grooves:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape21: TQRShape
        Left = 128
        Top = 598
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          338.666666666666700000
          1582.208333333333000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape40: TQRShape
        Left = 192
        Top = 598
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          508.000000000000000000
          1582.208333333333000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape41: TQRShape
        Left = 264
        Top = 598
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          698.500000000000000000
          1582.208333333333000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel39: TQRLabel
        Left = 147
        Top = 597
        Width = 25
        Height = 17
        Size.Values = (
          44.979166666666670000
          388.937500000000000000
          1579.562500000000000000
          66.145833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Left'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel40: TQRLabel
        Left = 211
        Top = 597
        Width = 34
        Height = 17
        Size.Values = (
          44.979166666666670000
          558.270833333333300000
          1579.562500000000000000
          89.958333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Right'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel41: TQRLabel
        Left = 283
        Top = 597
        Width = 31
        Height = 17
        Size.Values = (
          44.979166666666670000
          748.770833333333300000
          1579.562500000000000000
          82.020833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Both'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape42: TQRShape
        Left = 359
        Top = 450
        Width = 359
        Height = 175
        Size.Values = (
          463.020833333333300000
          949.854166666666800000
          1190.625000000000000000
          949.854166666666800000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel43: TQRLabel
        Left = 367
        Top = 462
        Width = 35
        Height = 16
        Size.Values = (
          42.333333333333330000
          971.020833333333300000
          1222.375000000000000000
          92.604166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Make'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel44: TQRLabel
        Left = 367
        Top = 489
        Width = 44
        Height = 17
        Size.Values = (
          44.979166666666670000
          971.020833333333300000
          1293.812500000000000000
          116.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Model:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel45: TQRLabel
        Left = 367
        Top = 521
        Width = 79
        Height = 17
        Size.Values = (
          44.979166666666670000
          971.020833333333300000
          1378.479166666667000000
          209.020833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Dimensions:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape43: TQRShape
        Left = 368
        Top = 551
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          973.666666666666800000
          1457.854166666667000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape44: TQRShape
        Left = 368
        Top = 574
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          973.666666666666800000
          1518.708333333333000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel46: TQRLabel
        Left = 399
        Top = 574
        Width = 100
        Height = 17
        Size.Values = (
          44.979166666666670000
          1055.687500000000000000
          1518.708333333333000000
          264.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Pop Up Socket?'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel47: TQRLabel
        Left = 367
        Top = 598
        Width = 128
        Height = 17
        Size.Values = (
          44.979166666666670000
          971.020833333333300000
          1582.208333333333000000
          338.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Pop Up Dimensions:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape12: TQRShape
        Left = 184
        Top = 680
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          486.833333333333300000
          1799.166666666667000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel16: TQRLabel
        Left = 208
        Top = 680
        Width = 139
        Height = 17
        Size.Values = (
          44.979166666666670000
          550.333333333333300000
          1799.166666666667000000
          367.770833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Parking Ticket Issued?'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape18: TQRShape
        Left = 70
        Top = 473
        Width = 283
        Height = 8
        Size.Values = (
          21.166666666666670000
          185.208333333333300000
          1251.479166666667000000
          748.770833333333200000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape33: TQRShape
        Left = 70
        Top = 505
        Width = 283
        Height = 8
        Size.Values = (
          21.166666666666670000
          185.208333333333300000
          1336.145833333333000000
          748.770833333333200000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape34: TQRShape
        Left = 96
        Top = 537
        Width = 257
        Height = 8
        Size.Values = (
          21.166666666666670000
          254.000000000000000000
          1420.812500000000000000
          679.979166666666800000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape36: TQRShape
        Left = 430
        Top = 473
        Width = 283
        Height = 8
        Size.Values = (
          21.166666666666670000
          1137.708333333333000000
          1251.479166666667000000
          748.770833333333200000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape37: TQRShape
        Left = 430
        Top = 505
        Width = 283
        Height = 8
        Size.Values = (
          21.166666666666670000
          1137.708333333333000000
          1336.145833333333000000
          748.770833333333200000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape38: TQRShape
        Left = 456
        Top = 537
        Width = 257
        Height = 8
        Size.Values = (
          21.166666666666670000
          1206.500000000000000000
          1420.812500000000000000
          679.979166666666800000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape39: TQRShape
        Left = 512
        Top = 609
        Width = 200
        Height = 8
        Size.Values = (
          21.166666666666670000
          1354.666666666667000000
          1611.312500000000000000
          529.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRLabel32: TQRLabel
        Left = 400
        Top = 680
        Width = 147
        Height = 17
        Size.Values = (
          44.979166666666670000
          1058.333333333333000000
          1799.166666666667000000
          388.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Extra Labour Required?'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel34: TQRLabel
        Left = 367
        Top = 626
        Width = 206
        Height = 17
        Size.Values = (
          44.979166666666670000
          971.020833333333300000
          1656.291666666667000000
          545.041666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Additional Fitting Information'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape1: TQRShape
        Left = 0
        Top = 430
        Width = 717
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          1137.708333333333000000
          1897.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Brush.Color = clBtnFace
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel33: TQRLabel
        Left = 366
        Top = 433
        Width = 138
        Height = 16
        Size.Values = (
          42.333333333333330000
          968.375000000000000000
          1145.645833333333000000
          365.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Appliance Info - Hob'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel5: TQRLabel
        Left = 6
        Top = 433
        Width = 138
        Height = 16
        Size.Values = (
          42.333333333333330000
          15.875000000000000000
          1145.645833333333000000
          365.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Appliance Info - Sink'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape46: TQRShape
        Left = 368
        Top = 680
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          973.666666666666700000
          1799.166666666667000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel35: TQRLabel
        Left = 399
        Top = 551
        Width = 199
        Height = 17
        Size.Values = (
          44.979166666666670000
          1055.687500000000000000
          1457.854166666667000000
          526.520833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Taken from site, to be returned'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel49: TQRLabel
        Left = 8
        Top = 115
        Width = 96
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          304.270833333333300000
          254.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Template Date:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel50: TQRLabel
        Left = 8
        Top = 145
        Width = 78
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          383.645833333333300000
          206.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fitting Date:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblTemplateDate: TQRLabel
        Left = 111
        Top = 115
        Width = 234
        Height = 17
        Size.Values = (
          44.979166666666670000
          293.687500000000000000
          304.270833333333400000
          619.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlbltemplateDate'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblFittingDate: TQRLabel
        Left = 111
        Top = 145
        Width = 234
        Height = 17
        Size.Values = (
          44.979166666666670000
          293.687500000000000000
          383.645833333333400000
          619.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlblFittingDate'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel8: TQRLabel
        Left = 191
        Top = 224
        Width = 84
        Height = 17
        Size.Values = (
          44.979166666666670000
          505.354166666666700000
          592.666666666666700000
          222.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'No. of Pieces'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape49: TQRShape
        Left = 278
        Top = 228
        Width = 75
        Height = 8
        Size.Values = (
          21.166666666666670000
          735.541666666666700000
          603.250000000000000000
          198.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRLabel51: TQRLabel
        Left = 7
        Top = 330
        Width = 68
        Height = 17
        Size.Values = (
          44.979166666666670000
          18.520833333333330000
          873.125000000000000000
          179.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Thickness:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape50: TQRShape
        Left = 94
        Top = 337
        Width = 51
        Height = 8
        Size.Values = (
          21.166666666666670000
          248.708333333333300000
          891.645833333333300000
          134.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRLabel52: TQRLabel
        Left = 151
        Top = 330
        Width = 23
        Height = 17
        Size.Values = (
          44.979166666666670000
          399.520833333333300000
          873.125000000000000000
          60.854166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'mm'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel53: TQRLabel
        Left = 7
        Top = 224
        Width = 68
        Height = 17
        Size.Values = (
          44.979166666666670000
          18.520833333333330000
          592.666666666666700000
          179.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Thickness:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape51: TQRShape
        Left = 94
        Top = 228
        Width = 51
        Height = 8
        Size.Values = (
          21.166666666666670000
          248.708333333333300000
          603.250000000000000000
          134.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRLabel54: TQRLabel
        Left = 151
        Top = 224
        Width = 23
        Height = 17
        Size.Values = (
          44.979166666666670000
          399.520833333333300000
          592.666666666666700000
          60.854166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'mm'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel55: TQRLabel
        Left = 7
        Top = 374
        Width = 72
        Height = 17
        Size.Values = (
          44.979166666666670000
          18.520833333333330000
          989.541666666666700000
          190.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Splashback'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblSplashback: TQRLabel
        Left = 94
        Top = 374
        Width = 259
        Height = 17
        Size.Values = (
          44.979166666666670000
          248.708333333333300000
          989.541666666666700000
          685.270833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlblUpstand'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel57: TQRLabel
        Left = 7
        Top = 402
        Width = 49
        Height = 17
        Size.Values = (
          44.979166666666670000
          18.520833333333330000
          1063.625000000000000000
          129.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Length:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape52: TQRShape
        Left = 94
        Top = 409
        Width = 51
        Height = 8
        Size.Values = (
          21.166666666666670000
          248.708333333333300000
          1082.145833333333000000
          134.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRLabel58: TQRLabel
        Left = 151
        Top = 402
        Width = 23
        Height = 17
        Size.Values = (
          44.979166666666670000
          399.520833333333300000
          1063.625000000000000000
          60.854166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'mm'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel59: TQRLabel
        Left = 191
        Top = 402
        Width = 46
        Height = 17
        Size.Values = (
          44.979166666666670000
          505.354166666666700000
          1063.625000000000000000
          121.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Height:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape53: TQRShape
        Left = 246
        Top = 409
        Width = 83
        Height = 8
        Size.Values = (
          21.166666666666670000
          650.875000000000000000
          1082.145833333333000000
          219.604166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRLabel60: TQRLabel
        Left = 335
        Top = 402
        Width = 23
        Height = 17
        Size.Values = (
          44.979166666666670000
          886.354166666666700000
          1063.625000000000000000
          60.854166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'mm'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape54: TQRShape
        Left = 368
        Top = 656
        Width = 15
        Height = 15
        Size.Values = (
          39.687500000000000000
          973.666666666666700000
          1735.666666666667000000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel56: TQRLabel
        Left = 400
        Top = 656
        Width = 154
        Height = 17
        Size.Values = (
          44.979166666666670000
          1058.333333333333000000
          1735.666666666667000000
          407.458333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Extra Support Required?'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape8: TQRShape
        Left = 0
        Top = 840
        Width = 153
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          2222.500000000000000000
          404.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Brush.Color = clBtnFace
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape20: TQRShape
        Left = 152
        Top = 840
        Width = 209
        Height = 21
        Size.Values = (
          55.562500000000000000
          402.166666666666700000
          2222.500000000000000000
          552.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel21: TQRLabel
        Left = 7
        Top = 843
        Width = 129
        Height = 16
        Size.Values = (
          42.333333333333330000
          18.520833333333330000
          2230.437500000000000000
          341.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Templater Sign Off'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape27: TQRShape
        Left = 360
        Top = 840
        Width = 153
        Height = 21
        Size.Values = (
          55.562500000000000000
          952.500000000000000000
          2222.500000000000000000
          404.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Brush.Color = clBtnFace
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel26: TQRLabel
        Left = 367
        Top = 843
        Width = 34
        Height = 16
        Size.Values = (
          42.333333333333330000
          971.020833333333300000
          2230.437500000000000000
          89.958333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape28: TQRShape
        Left = 512
        Top = 840
        Width = 205
        Height = 21
        Size.Values = (
          55.562500000000000000
          1354.666666666667000000
          2222.500000000000000000
          542.395833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape29: TQRShape
        Left = 0
        Top = 880
        Width = 717
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          2328.333333333333000000
          1897.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Brush.Color = clBtnFace
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape30: TQRShape
        Left = 0
        Top = 900
        Width = 718
        Height = 49
        Size.Values = (
          129.645833333333300000
          0.000000000000000000
          2381.250000000000000000
          1899.708333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRMemo1: TQRMemo
        Left = 16
        Top = 903
        Width = 689
        Height = 38
        Size.Values = (
          100.541666666666700000
          42.333333333333330000
          2389.187500000000000000
          1822.979166666667000000)
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
        Font.Name = 'Lucida Sans'
        Font.Style = []
        Lines.Strings = (
          
            'I confirm that templating has been carried out to my specificati' +
            'on & that I have checked & agree with this template sheet. I fur' +
            'ther accept that any amendments to my original order may incur a' +
            'dditional costs.')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object gtQRShape55: TQRShape
        Left = 0
        Top = 948
        Width = 153
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          2508.250000000000000000
          404.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Brush.Color = clBtnFace
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel27: TQRLabel
        Left = 7
        Top = 951
        Width = 125
        Height = 16
        Size.Values = (
          42.333333333333330000
          18.520833333333330000
          2516.187500000000000000
          330.729166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer Sign Off'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape56: TQRShape
        Left = 152
        Top = 948
        Width = 209
        Height = 21
        Size.Values = (
          55.562500000000000000
          402.166666666666700000
          2508.250000000000000000
          552.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel28: TQRLabel
        Left = 367
        Top = 955
        Width = 34
        Height = 16
        Size.Values = (
          42.333333333333330000
          971.020833333333300000
          2526.770833333333000000
          89.958333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape57: TQRShape
        Left = 360
        Top = 948
        Width = 153
        Height = 21
        Size.Values = (
          55.562500000000000000
          952.500000000000000000
          2508.250000000000000000
          404.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Brush.Color = clBtnFace
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape58: TQRShape
        Left = 512
        Top = 948
        Width = 205
        Height = 21
        Size.Values = (
          55.562500000000000000
          1354.666666666667000000
          2508.250000000000000000
          542.395833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel29: TQRLabel
        Left = 367
        Top = 951
        Width = 34
        Height = 16
        Size.Values = (
          42.333333333333330000
          971.020833333333300000
          2516.187500000000000000
          89.958333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape31: TQRShape
        Left = 0
        Top = 860
        Width = 717
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          2275.416666666667000000
          1897.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape32: TQRShape
        Left = 0
        Top = 968
        Width = 717
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          2561.166666666667000000
          1897.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel30: TQRLabel
        Left = 23
        Top = 972
        Width = 637
        Height = 16
        Size.Values = (
          42.333333333333330000
          60.854166666666670000
          2571.750000000000000000
          1685.395833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          'PLEASE NOTE: FABRICATION WILL NOT COMMENCE WITHOUT CUSTOMER SIGN' +
          'ATURE & PAYMENT'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape48: TQRShape
        Left = 0
        Top = 988
        Width = 717
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          2614.083333333333000000
          1897.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape59: TQRShape
        Left = 0
        Top = 1008
        Width = 153
        Height = 21
        Size.Values = (
          55.562500000000000000
          0.000000000000000000
          2667.000000000000000000
          404.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Brush.Color = clBtnFace
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel31: TQRLabel
        Left = 7
        Top = 1011
        Width = 100
        Height = 16
        Size.Values = (
          42.333333333333330000
          18.520833333333330000
          2674.937500000000000000
          264.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Office Sign Off'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape60: TQRShape
        Left = 152
        Top = 1008
        Width = 209
        Height = 21
        Size.Values = (
          55.562500000000000000
          402.166666666666700000
          2667.000000000000000000
          552.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel37: TQRLabel
        Left = 367
        Top = 1011
        Width = 34
        Height = 16
        Size.Values = (
          42.333333333333330000
          971.020833333333300000
          2674.937500000000000000
          89.958333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape61: TQRShape
        Left = 360
        Top = 1008
        Width = 153
        Height = 21
        Size.Values = (
          55.562500000000000000
          952.500000000000000000
          2667.000000000000000000
          404.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Brush.Color = clBtnFace
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape62: TQRShape
        Left = 512
        Top = 1008
        Width = 205
        Height = 21
        Size.Values = (
          55.562500000000000000
          1354.666666666667000000
          2667.000000000000000000
          542.395833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel42: TQRLabel
        Left = 367
        Top = 1011
        Width = 34
        Height = 16
        Size.Values = (
          42.333333333333330000
          971.020833333333300000
          2674.937500000000000000
          89.958333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel48: TQRLabel
        Left = 191
        Top = 302
        Width = 84
        Height = 17
        Size.Values = (
          44.979166666666670000
          505.354166666666700000
          799.041666666666700000
          222.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'No. of Pieces'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape63: TQRShape
        Left = 278
        Top = 308
        Width = 75
        Height = 8
        Size.Values = (
          21.166666666666670000
          735.541666666666700000
          814.916666666666700000
          198.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
    object gtQRSysData1: TQRSysData
      Left = 647
      Top = 1088
      Width = 108
      Height = 16
      Size.Values = (
        42.333333333333330000
        1711.854166666667000000
        2878.666666666667000000
        285.750000000000000000)
      XLColumn = 0
      XLNumFormat = nfGeneral
      ActiveInPreview = False
      Alignment = taRightJustify
      AlignToBand = False
      Color = clWhite
      Data = qrsDateTime
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Lucida Sans'
      Font.Style = []
      ParentFont = False
      Text = 'Printed: '
      Transparent = False
      ExportAs = exptText
      VerticalAlignment = tlTop
      FontSize = 8
    end
  end
  object qryReport: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  sales_order_line.quote,'
      '        sales_order_line.description,'
      '        sales_order.customer_name,'
      '        sales_order.reference,'
      '        sales_order.address,'
      '        sales_order.customer,'
      '        sales_order.contact_name,'
      '        Sales_order_line.Sales_order,'
      '        Sales_Order.Install_address,'
      '        Sales_Order.Install_Name,'
      '        Sales_order.Install_Phone,'
      '        Sales_Order.Account_Manager,'
      '        Operator.Operator_Name as Account_Manager_Name,'
      '        Operator.Telephone_number'
      'FROM Operator'
      '      RIGHT JOIN ((Sales_Order'
      '      INNER JOIN Sales_Order_Line'
      
        '        ON Sales_Order.Sales_Order = Sales_Order_Line.Sales_Orde' +
        'r)'
      '      LEFT JOIN Quote'
      '        ON Sales_Order_Line.Quote = Quote.Quote)'
      '        ON Operator.Operator = Sales_Order.Account_Manager'
      
        'WHERE sales_order_line.sales_order = :sales_order AND Sales_Orde' +
        'r_Line.quote <> 0'
      'ORDER BY sales_order_line.quote')
    Left = 1091
    Top = 116
    ParamData = <
      item
        Name = 'sales_order'
        DataType = ftInteger
      end>
  end
  object dtsReport: TDataSource
    DataSet = qryReport
    Left = 1024
    Top = 62
  end
  object qryAddress: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select *'
      'from Address'
      'where Address = :Address')
    Left = 1030
    Top = 297
    ParamData = <
      item
        Name = 'Address'
      end>
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
      'Telephone_number,'
      'Email_Address'
      'from Customer, VAT'
      'where Customer = :Customer and'
      'Customer.VAT = Vat.Vat')
    Left = 1030
    Top = 364
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
      end>
  end
  object dtsAddress: TDataSource
    Left = 1030
    Top = 233
  end
  object qryCompany: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * from company'
      'where company = 1')
    Left = 1030
    Top = 157
  end
  object qrygetNotes: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from Notes'
      'where notes_code = :Notes_Code'
      'order by notes_code, notes_line')
    Left = 1102
    Top = 51
    ParamData = <
      item
        Name = 'Notes_Code'
      end>
  end
  object qryEndUser: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select End_User, End_User_name,'
      'Street,'
      'Locale,'
      'Town_City,'
      'postcode,'
      'County_State,'
      'Vat_Rate'
      'from End_User, VAT'
      'where End_User = :End_User and'
      'End_User.VAT = Vat.Vat')
    Left = 1030
    Top = 436
    ParamData = <
      item
        Name = 'End_User'
      end>
  end
  object qryQuote: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Quote.Quote,'
      '        Quote.description,'
      '        quote.customer_name,'
      '        quote.reference,'
      '        quote.address,'
      '        quote.customer,'
      '        quote.contact_name,'
      '        0 as Sales_order,'
      '        Quote.Install_address,'
      '        Quote,Install_Name,'
      '        Quote.Install_Phone,'
      '        Quote.Account_Manager,'
      '        Operator.Operator_Name as Account_Manager_Name'
      'FROM Operator'
      '      RIGHT JOIN Quote'
      '        ON Operator.Operator = Quote.Account_Manager'
      'WHERE Quote.Quote = :Quote'
      'ORDER BY Quote.Quote')
    Left = 1107
    Top = 236
    ParamData = <
      item
        Name = 'Quote'
      end>
  end
  object qryQuoteEdge: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Quote_Edge.Quote,'
      '        Quote_Edge.Edge_number,'
      '        Quote_Edge.Edge_profile,'
      '        Edge_profile.Description'
      'FROM Edge_profile'
      '      INNER JOIN Quote_Edge'
      '      ON Edge_profile.Edge_profile = Quote_Edge.Edge_profile'
      'WHERE Quote = :Quote'
      'ORDER BY Quote, Edge_Number')
    Left = 1107
    Top = 364
    ParamData = <
      item
        Name = 'Quote'
      end>
  end
  object qryQuoteThickness: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Quote_Element.Quote,'
      '        Quote_Element.Element_Number,'
      '        Quote_Element.Thickness,'
      '        Thickness.Thickness_mm'
      'FROM Quote_Element'
      '      INNER JOIN Thickness'
      '        ON Quote_Element.Thickness = Thickness.Thickness'
      'WHERE Quote = :Quote'
      'ORDER BY Quote, Element_Number')
    Left = 1107
    Top = 428
    ParamData = <
      item
        Name = 'Quote'
      end>
  end
  object qryQuoteUpstand: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Quote_Element.Quote,'
      '        Quote_Element.Element_Number,'
      '        Quote_Element.Thickness,'
      '        Thickness.Thickness_mm'
      'FROM Quote_Element'
      '    INNER JOIN Thickness'
      '        ON Quote_Element.Thickness = Thickness.Thickness'
      'WHERE Element_number > 1000 AND Quote = :Quote'
      'ORDER BY Quote, Element_Number')
    Left = 1107
    Top = 500
    ParamData = <
      item
        Name = 'Quote'
      end>
  end
  object qryQuoteElement: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  TOP 1'
      '        Quote_Element.Worktop,'
      '        Worktop.Description as Colour,'
      '        Quote_Element.Material_type,'
      '        Material_Type.Description as Material_Type_Desc'
      'FROM (Material_Type'
      '        INNER JOIN Quote_Element'
      
        '          ON Material_Type.Material_Type = Quote_Element.Materia' +
        'l_type)'
      '        INNER JOIN Worktop'
      '          ON Quote_Element.Worktop = Worktop.Worktop'
      'WHERE Quote = :Quote'
      'ORDER BY Quote, Element_Number')
    Left = 1107
    Top = 300
    ParamData = <
      item
        Name = 'Quote'
      end>
  end
  object qryGetSalesOrder: TFDQuery
    ConnectionName = 'Wt'
    SQL.Strings = (
      'select Template_date,'
      '        Date_Required'
      'From Sales_Order'
      'where sales_order = :Sales_Order')
    Left = 1184
    Top = 120
    ParamData = <
      item
        Name = 'Sales_Order'
      end>
  end
  object qryQuoteMaterial: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT DISTINCT'
      '        Quote_Element.Quote,'
      '        Quote_Element.Worktop,'
      '        Worktop.Description AS Colour,'
      '        Material_Type.Description AS Material_Type_Desc,'
      '        Thickness.Thickness_mm,'
      
        '        SUM( (Quote_Element.Depth * Quote_Element.Length)/100000' +
        '0) as Area'
      'FROM Material_Type'
      '        INNER JOIN (Worktop'
      '        INNER JOIN ((Thickness'
      '        INNER JOIN Worktop_thickness'
      '          ON Thickness.Thickness = Worktop_thickness.Thickness)'
      '        INNER JOIN Quote_Element'
      
        '          ON (Worktop_thickness.Thickness = Quote_Element.Thickn' +
        'ess) AND (Worktop_thickness.Worktop = Quote_Element.Worktop))'
      '          ON Worktop.Worktop = Worktop_thickness.Worktop)'
      '          ON Material_Type.Material_Type = Worktop.Material_Type'
      
        'WHERE (Quote_Element.Quote = :Quote) AND (Quote_Element.Element_' +
        'Number < 1000)'
      'GROUP BY'
      '        Quote_Element.Quote,'
      '        Quote_Element.Worktop,'
      '        Worktop.Description,'
      '        Material_Type.Description,'
      '        Thickness.Thickness_mm'
      
        'ORDER BY SUM( (Quote_Element.Depth * Quote_Element.Length)/10000' +
        '00) DESC'
      '')
    Left = 1203
    Top = 300
    ParamData = <
      item
        Name = 'Quote'
      end>
  end
end
