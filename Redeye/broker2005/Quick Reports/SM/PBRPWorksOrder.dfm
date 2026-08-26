object frmPBRPWorksOrder: TfrmPBRPWorksOrder
  Left = 198
  Top = 53
  Caption = 'Works Instruction Print'
  ClientHeight = 738
  ClientWidth = 1130
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Scaled = False
  TextHeight = 13
  object qrpDetails: TQuickRep
    Left = 96
    Top = -256
    Width = 992
    Height = 1403
    ShowingPreview = False
    BeforePrint = qrpDetailsBeforePrint
    DataSet = qryReport
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Lato'
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
      70.000000000000000000
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
    object qrbPageHeader: TQRBand
      Left = 33
      Top = 47
      Width = 912
      Height = 374
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        791.633333333333300000
        1930.400000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object qrlblQuoteCaption: TQRLabel
        Left = 10
        Top = 0
        Width = 465
        Height = 50
        Size.Values = (
          105.833333333333300000
          21.166666666666670000
          0.000000000000000000
          984.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'WORKS INSTRUCTIONS'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -40
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 24
      end
      object QRLabel2: TQRLabel
        Left = 199
        Top = 116
        Width = 40
        Height = 24
        Size.Values = (
          50.800000000000000000
          421.216666666666700000
          245.533333333333300000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Date:'
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
      object QRDBText1: TQRDBText
        Left = 250
        Top = 116
        Width = 81
        Height = 24
        Size.Values = (
          50.800000000000000000
          529.166666666666700000
          245.533333333333300000
          171.450000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Date_Point'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRDBText2: TQRDBText
        Left = 768
        Top = 4
        Width = 295
        Height = 33
        Size.Values = (
          69.850000000000000000
          1625.600000000000000000
          8.466666666666667000
          624.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Works_Order_Number'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 16
      end
      object QRLabel3: TQRLabel
        Left = 603
        Top = 5
        Width = 89
        Height = 33
        Size.Values = (
          69.850000000000000000
          1276.350000000000000000
          10.583333333333330000
          188.383333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'WI No:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 16
      end
      object QRLabel5: TQRLabel
        Left = 603
        Top = 45
        Width = 89
        Height = 21
        Size.Values = (
          44.450000000000000000
          1276.350000000000000000
          95.250000000000000000
          188.383333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Release No:'
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
      object QRDBText5: TQRDBText
        Left = 100
        Top = 48
        Width = 501
        Height = 24
        Size.Values = (
          50.270833333333330000
          211.666666666666700000
          100.541666666666700000
          1060.979166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = qryReport
        DataField = 'Description'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRLabel1: TQRLabel
        Left = 10
        Top = 48
        Width = 82
        Height = 24
        Size.Values = (
          50.800000000000000000
          21.166666666666670000
          101.600000000000000000
          173.566666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Job Title:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object gtQRDBText1: TQRDBText
        Left = 768
        Top = 45
        Width = 123
        Height = 21
        Size.Values = (
          44.450000000000000000
          1625.600000000000000000
          95.250000000000000000
          260.350000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Version_Number'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape1: TQRShape
        Left = 10
        Top = 145
        Width = 901
        Height = 210
        Size.Values = (
          444.500000000000000000
          21.166666666666670000
          306.916666666666700000
          1907.116666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Brush.Style = bsClear
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel1: TQRLabel
        Left = 20
        Top = 296
        Width = 118
        Height = 21
        Size.Values = (
          44.450000000000000000
          42.333333333333330000
          626.533333333333300000
          249.766666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Estimated Qty:'
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
      object gtQRLabel3: TQRLabel
        Left = 603
        Top = 76
        Width = 140
        Height = 33
        Size.Values = (
          69.850000000000000000
          1276.350000000000000000
          160.866666666666700000
          296.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Start Date:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 16
      end
      object gtQRLabel4: TQRLabel
        Left = 603
        Top = 109
        Width = 172
        Height = 33
        Size.Values = (
          69.850000000000000000
          1276.350000000000000000
          230.716666666666700000
          364.066666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Mailing Date:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 16
      end
      object gtQRLabel5: TQRLabel
        Left = 490
        Top = 296
        Width = 115
        Height = 21
        Size.Values = (
          44.450000000000000000
          1037.166666666667000000
          626.533333333333300000
          243.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer Ref:'
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
      object gtQRLabel6: TQRLabel
        Left = 490
        Top = 325
        Width = 114
        Height = 21
        Size.Values = (
          44.450000000000000000
          1037.166666666667000000
          687.916666666666700000
          241.300000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Previous WIN:'
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
      object gtQRDBText2: TQRDBText
        Left = 150
        Top = 296
        Width = 141
        Height = 21
        Size.Values = (
          44.450000000000000000
          317.500000000000000000
          626.533333333333300000
          298.450000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Estimated_Quantity'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRDBText3: TQRDBText
        Left = 768
        Top = 75
        Width = 134
        Height = 33
        Size.Values = (
          69.850000000000000000
          1625.600000000000000000
          158.750000000000000000
          283.633333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Date_start'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 16
      end
      object gtQRDBText4: TQRDBText
        Left = 768
        Top = 109
        Width = 195
        Height = 33
        Size.Values = (
          69.850000000000000000
          1625.600000000000000000
          230.716666666666700000
          412.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Date_Required'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 16
      end
      object gtQRDBText5: TQRDBText
        Left = 613
        Top = 325
        Width = 166
        Height = 21
        Size.Values = (
          44.450000000000000000
          1297.516666666667000000
          687.916666666666700000
          351.366666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Previous_WO_number'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRDBText6: TQRDBText
        Left = 613
        Top = 295
        Width = 112
        Height = 24
        Size.Values = (
          50.800000000000000000
          1297.516666666667000000
          624.416666666666700000
          237.066666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Cust_Order_no'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel2: TQRLabel
        Left = 20
        Top = 325
        Width = 123
        Height = 21
        Size.Values = (
          44.450000000000000000
          42.333333333333330000
          687.916666666666700000
          260.350000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Is Perso 100%?'
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
      object gtQRDBText8: TQRDBText
        Left = 150
        Top = 324
        Width = 166
        Height = 24
        Size.Values = (
          50.800000000000000000
          317.500000000000000000
          685.800000000000000000
          351.366666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Is_Perso_100_percent'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel8: TQRLabel
        Left = 9
        Top = 116
        Width = 92
        Height = 24
        Size.Values = (
          50.800000000000000000
          19.050000000000000000
          245.533333333333300000
          194.733333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Job Bag No:'
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
      object gtQRDBText9: TQRDBText
        Left = 110
        Top = 116
        Width = 66
        Height = 24
        Size.Values = (
          50.800000000000000000
          232.833333333333300000
          245.533333333333300000
          139.700000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Job_Bag'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel6: TQRLabel
        Left = 24
        Top = 158
        Width = 84
        Height = 25
        Size.Values = (
          52.916666666666670000
          50.800000000000000000
          334.433333333333300000
          177.800000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer:'
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
      object qrmAddress: TQRMemo
        Left = 124
        Top = 158
        Width = 327
        Height = 120
        Size.Values = (
          254.000000000000000000
          261.937500000000000000
          333.375000000000000000
          693.208333333333200000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel10: TQRLabel
        Left = 490
        Top = 158
        Width = 69
        Height = 21
        Size.Values = (
          44.450000000000000000
          1037.166666666667000000
          334.433333333333300000
          146.050000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Contact:'
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
      object QRLabel7: TQRLabel
        Left = 490
        Top = 184
        Width = 88
        Height = 21
        Size.Values = (
          44.450000000000000000
          1037.166666666667000000
          389.466666666666700000
          186.266666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Telephone:'
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
      object QRLabel8: TQRLabel
        Left = 490
        Top = 210
        Width = 35
        Height = 21
        Size.Values = (
          44.450000000000000000
          1037.166666666667000000
          444.500000000000000000
          74.083333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fax:'
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
      object QRLabel9: TQRLabel
        Left = 490
        Top = 236
        Width = 49
        Height = 21
        Size.Values = (
          44.450000000000000000
          1037.166666666667000000
          499.533333333333300000
          103.716666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Email:'
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
      object QRLabel4: TQRLabel
        Left = 490
        Top = 261
        Width = 108
        Height = 24
        Size.Values = (
          50.800000000000000000
          1037.166666666667000000
          552.450000000000000000
          228.600000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Acc Manager:'
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
      object qrlblContactName: TQRLabel
        Left = 613
        Top = 158
        Width = 129
        Height = 21
        Size.Values = (
          44.450000000000000000
          1297.516666666667000000
          334.433333333333300000
          273.050000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblContactName'
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
      object qrlblTelephone: TQRLabel
        Left = 613
        Top = 184
        Width = 106
        Height = 21
        Size.Values = (
          44.450000000000000000
          1297.516666666667000000
          389.466666666666700000
          224.366666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblTelephone'
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
      object qrlblFax: TQRLabel
        Left = 613
        Top = 210
        Width = 57
        Height = 21
        Size.Values = (
          44.450000000000000000
          1297.516666666667000000
          444.500000000000000000
          120.650000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblFax'
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
      object qrlblEmail: TQRLabel
        Left = 613
        Top = 236
        Width = 71
        Height = 21
        Size.Values = (
          44.450000000000000000
          1297.516666666667000000
          499.533333333333300000
          150.283333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblEmail'
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
      object QRDBText3: TQRDBText
        Left = 613
        Top = 261
        Width = 161
        Height = 24
        Size.Values = (
          50.800000000000000000
          1297.516666666667000000
          552.450000000000000000
          340.783333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Office_Contact_Name'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape9: TQRShape
        Left = 10
        Top = 280
        Width = 901
        Height = 14
        Size.Values = (
          29.104166666666670000
          21.166666666666670000
          592.666666666666800000
          1907.645833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape10: TQRShape
        Left = 470
        Top = 148
        Width = 11
        Height = 139
        Size.Values = (
          293.687500000000000000
          994.833333333333400000
          312.208333333333400000
          23.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRLabel13: TQRLabel
        Left = 270
        Top = 296
        Width = 89
        Height = 21
        Size.Values = (
          44.450000000000000000
          571.500000000000000000
          626.533333333333300000
          188.383333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Actual Qty:'
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
      object gtQRDBText11: TQRDBText
        Left = 363
        Top = 296
        Width = 115
        Height = 21
        Size.Values = (
          44.450000000000000000
          768.350000000000000000
          626.533333333333300000
          243.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Actual_Quantity'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object qrgWOrder: TQRGroup
      Left = 33
      Top = 421
      Width = 912
      Height = 3
      AlignToBottom = False
      BeforePrint = qrgWOrderBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        6.350000000000000000
        1930.400000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'works_order'
      FooterBand = qrgfWOrder
      Master = qrpDetails
      ReprintOnNewPage = False
    end
    object qrsdtlProcesses: TQRSubDetail
      Left = 33
      Top = 481
      Width = 912
      Height = 3
      AfterPrint = qrsdtlProcessesAfterPrint
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        6.350000000000000000
        1930.400000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpDetails
      DataSet = qryWOProcesses
      PrintBefore = False
      PrintIfEmpty = True
    end
    object qrGrpProcesses: TQRGroup
      Left = 34
      Top = 424
      Width = 912
      Height = 57
      AlignToBottom = False
      BeforePrint = qrGrpProcessesBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        120.650000000000000000
        1930.400000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'Process_no'
      FooterBand = qrbGrpProcessFooter
      Master = qrsdtlProcesses
      ReprintOnNewPage = False
      object gtProcess: TQRDBText
        Left = 10
        Top = 4
        Width = 164
        Height = 21
        Size.Values = (
          44.450000000000000000
          21.166666666666670000
          8.466666666666667000
          347.133333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryWOProcesses
        DataField = 'Process_Description'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRDBText10: TQRDBText
        Left = 97
        Top = 34
        Width = 140
        Height = 18
        Size.Values = (
          38.100000000000000000
          205.316666666666700000
          71.966666666666670000
          296.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryWOProcesses
        DataField = 'Target_Receipt_Date'
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
      object gtQRLabel9: TQRLabel
        Left = 8
        Top = 33
        Width = 87
        Height = 21
        Size.Values = (
          44.450000000000000000
          16.933333333333330000
          69.850000000000000000
          184.150000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Start Date:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblProcessSize: TQRLabel
        Left = 218
        Top = 4
        Width = 112
        Height = 21
        Size.Values = (
          44.450000000000000000
          461.433333333333300000
          8.466666666666667000
          237.066666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Process Sizes'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtdbTextRunTime: TQRDBText
        Left = 335
        Top = 33
        Width = 66
        Height = 21
        Size.Values = (
          44.450000000000000000
          709.083333333333300000
          69.850000000000000000
          139.700000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryWOProcesses
        DataField = 'No_of_hours'
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
      object gtlblRunTime: TQRLabel
        Left = 202
        Top = 33
        Width = 124
        Height = 21
        Size.Values = (
          44.450000000000000000
          427.566666666666700000
          69.850000000000000000
          262.466666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Run Time (hrs):'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtlblTeamSize: TQRLabel
        Left = 408
        Top = 33
        Width = 79
        Height = 21
        Size.Values = (
          44.450000000000000000
          863.600000000000000000
          69.850000000000000000
          167.216666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Team Size:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object gtdbtextTeamSize: TQRDBText
        Left = 495
        Top = 33
        Width = 46
        Height = 21
        Size.Values = (
          44.450000000000000000
          1047.750000000000000000
          69.850000000000000000
          97.366666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryWOProcesses
        DataField = 'Team_Count'
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
      object gtlblMAchineGroup: TQRLabel
        Left = 571
        Top = 4
        Width = 126
        Height = 21
        Size.Values = (
          44.450000000000000000
          1208.616666666667000000
          8.466666666666667000
          266.700000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Machine Group:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtdbtextMachineGroup: TQRDBText
        Left = 705
        Top = 4
        Width = 206
        Height = 21
        Size.Values = (
          44.979166666666670000
          1492.250000000000000000
          7.937500000000000000
          436.562499999999900000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryWOProcesses
        DataField = 'Work_Centre_Group_Name'
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
      object gtlblMachine: TQRLabel
        Left = 626
        Top = 33
        Width = 71
        Height = 21
        Size.Values = (
          44.450000000000000000
          1325.033333333333000000
          69.850000000000000000
          150.283333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Machine:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtdbTextMachine: TQRDBText
        Left = 705
        Top = 33
        Width = 206
        Height = 21
        Size.Values = (
          44.450000000000000000
          1492.250000000000000000
          69.850000000000000000
          436.033333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryWOProcesses
        DataField = 'Work_Centre_Name'
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
    end
    object qrbGrpProcessFooter: TQRBand
      Left = 33
      Top = 512
      Width = 912
      Height = 30
      AfterPrint = qrbGrpProcessFooterAfterPrint
      AlignToBottom = False
      BeforePrint = qrbGrpProcessFooterBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.500000000000000000
        1930.400000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object gtQRLabel7: TQRLabel
        Left = 10
        Top = 6
        Width = 53
        Height = 21
        Size.Values = (
          44.450000000000000000
          21.166666666666670000
          12.700000000000000000
          112.183333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Notes:'
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
      object qrMemoProcessNotes: TQRMemo
        Left = 70
        Top = 6
        Width = 831
        Height = 21
        Size.Values = (
          44.979166666666670000
          148.166666666666700000
          13.229166666666670000
          1759.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
    end
    object QRSubDetail1: TQRSubDetail
      Left = 33
      Top = 484
      Width = 912
      Height = 28
      AlignToBottom = False
      BeforePrint = QRSubDetail1BeforePrint
      TransparentBand = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Lato'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        59.266666666666670000
        1930.400000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrsdtlProcesses
      DataSet = qryWOProcessQ
      PrintBefore = False
      PrintIfEmpty = True
      object gtQRShape2: TQRShape
        Left = 0
        Top = 0
        Width = 910
        Height = 27
        Size.Values = (
          57.150000000000000000
          0.000000000000000000
          0.000000000000000000
          1926.166666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape3: TQRShape
        Left = 221
        Top = 0
        Width = 11
        Height = 25
        Size.Values = (
          52.916666666666660000
          468.312500000000100000
          0.000000000000000000
          23.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Brush.Color = clBtnFace
        Pen.Width = 2
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object qrmAnswer: TQRRichText
        Left = 230
        Top = 3
        Width = 671
        Height = 21
        Size.Values = (
          44.979166666666670000
          486.833333333333400000
          5.291666666666667000
          1420.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AutoStretch = False
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = []
        HiresExport = False
        Transparent = False
        YIncrement = 50
      end
      object gtQRDBText12: TQRDBText
        Left = 10
        Top = 3
        Width = 211
        Height = 21
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          5.291666666666667000
          447.145833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryWOProcessQ
        DataField = 'Question_text'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object qrgrpDelivery: TQRGroup
      Left = 33
      Top = 542
      Width = 912
      Height = 57
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      LinkBand = qrsdtlDelivery
      Size.Values = (
        120.650000000000000000
        1930.400000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrsdtlDelivery
      ReprintOnNewPage = False
      object gtQRLabel14: TQRLabel
        Left = 10
        Top = 5
        Width = 133
        Height = 21
        Size.Values = (
          44.450000000000000000
          21.166666666666670000
          10.583333333333330000
          281.516666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Despatch Details'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape12: TQRShape
        Left = 0
        Top = 33
        Width = 911
        Height = 25
        Size.Values = (
          52.916666666666660000
          0.000000000000000000
          68.791666666666680000
          1928.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Brush.Color = clBtnFace
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape13: TQRShape
        Left = 200
        Top = 33
        Width = 11
        Height = 24
        Size.Values = (
          50.270833333333330000
          423.333333333333300000
          68.791666666666680000
          23.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Brush.Color = clBtnFace
        Pen.Width = 3
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRLabel15: TQRLabel
        Left = 12
        Top = 36
        Width = 188
        Height = 19
        Size.Values = (
          39.687500000000000000
          26.458333333333330000
          76.729166666666670000
          396.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Courier'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtQRLabel16: TQRLabel
        Left = 213
        Top = 36
        Width = 43
        Height = 19
        Size.Values = (
          40.216666666666670000
          450.850000000000000000
          76.200000000000000000
          91.016666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Service'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtQRShape14: TQRShape
        Left = 380
        Top = 33
        Width = 11
        Height = 24
        Size.Values = (
          50.270833333333330000
          804.333333333333300000
          68.791666666666670000
          23.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Brush.Color = clBtnFace
        Pen.Width = 3
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRShape5: TQRShape
        Left = 641
        Top = 33
        Width = 11
        Height = 24
        Size.Values = (
          50.270833333333330000
          1357.312500000000000000
          68.791666666666670000
          23.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Brush.Color = clBtnFace
        Pen.Width = 3
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRLabel10: TQRLabel
        Left = 399
        Top = 36
        Width = 244
        Height = 19
        Size.Values = (
          39.687500000000000000
          844.020833333333300000
          76.729166666666670000
          515.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Sort'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtQRLabel11: TQRLabel
        Left = 655
        Top = 35
        Width = 250
        Height = 19
        Size.Values = (
          39.687500000000000000
          1386.416666666667000000
          74.083333333333330000
          529.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Speed'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
    end
    object qrsdtlDelivery: TQRSubDetail
      Left = 33
      Top = 599
      Width = 912
      Height = 115
      AlignToBottom = False
      BeforePrint = qrsdtlDeliveryBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        243.416666666666700000
        1930.400000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpDetails
      DataSet = qryWODelivery
      PrintBefore = False
      PrintIfEmpty = True
      object gtQRShape18: TQRShape
        Left = 648
        Top = 50
        Width = 265
        Height = 26
        Size.Values = (
          55.562500000000000000
          1370.541666666667000000
          105.833333333333300000
          560.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape17: TQRShape
        Left = 387
        Top = 50
        Width = 262
        Height = 26
        Size.Values = (
          55.562500000000000000
          820.208333333333300000
          105.833333333333300000
          555.625000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape6: TQRShape
        Left = 387
        Top = 25
        Width = 264
        Height = 26
        Size.Values = (
          55.562500000000000000
          820.208333333333300000
          52.916666666666670000
          558.270833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Brush.Color = clBtnFace
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape16: TQRShape
        Left = 206
        Top = 50
        Width = 181
        Height = 26
        Size.Values = (
          55.562500000000000000
          436.562500000000000000
          105.833333333333300000
          383.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape5: TQRShape
        Left = 206
        Top = 25
        Width = 181
        Height = 26
        Size.Values = (
          55.562500000000000000
          436.562500000000000000
          52.916666666666670000
          383.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Brush.Color = clBtnFace
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape15: TQRShape
        Left = 1
        Top = 50
        Width = 205
        Height = 26
        Size.Values = (
          55.562500000000000000
          2.645833333333333000
          105.833333333333300000
          433.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape4: TQRShape
        Left = 1
        Top = 25
        Width = 205
        Height = 26
        Size.Values = (
          55.562500000000000000
          2.645833333333333000
          52.916666666666670000
          433.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Brush.Color = clBtnFace
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape19: TQRShape
        Left = 0
        Top = 0
        Width = 912
        Height = 25
        Size.Values = (
          52.916666666666660000
          0.000000000000000000
          0.000000000000000000
          1931.458333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRDBText16: TQRDBText
        Left = 398
        Top = 54
        Width = 244
        Height = 19
        Size.Values = (
          39.687500000000000000
          841.375000000000000000
          113.770833333333300000
          515.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryWODelivery
        DataField = 'Package_Size_descr'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
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
      object QRShape2: TQRShape
        Left = 571
        Top = 75
        Width = 136
        Height = 26
        Size.Values = (
          55.562500000000000000
          1209.145833333333000000
          158.750000000000000000
          288.395833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Brush.Color = clBtnFace
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape26: TQRShape
        Left = 400
        Top = 75
        Width = 173
        Height = 26
        Size.Values = (
          55.562500000000000000
          846.666666666666700000
          158.750000000000000000
          365.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRDBText19: TQRDBText
        Left = 213
        Top = 54
        Width = 162
        Height = 19
        Size.Values = (
          39.687500000000000000
          449.791666666666700000
          113.770833333333300000
          343.958333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryWODelivery
        DataField = 'Qty_to_Deliver'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
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
      object gtQRDBText13: TQRDBText
        Left = 12
        Top = 4
        Width = 188
        Height = 19
        Size.Values = (
          39.687500000000000000
          26.458333333333330000
          7.937500000000000000
          396.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryWODelivery
        DataField = 'Courier_Name'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
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
      object gtQRDBText14: TQRDBText
        Left = 12
        Top = 54
        Width = 188
        Height = 19
        Size.Values = (
          39.687500000000000000
          26.458333333333330000
          113.770833333333300000
          396.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryWODelivery
        DataField = 'Delivery_Date'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
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
      object gtQRShape21: TQRShape
        Left = 380
        Top = 0
        Width = 11
        Height = 24
        Size.Values = (
          50.270833333333330000
          804.333333333333300000
          0.000000000000000000
          23.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Brush.Color = clBtnFace
        Pen.Width = 3
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRDBText15: TQRDBText
        Left = 213
        Top = 4
        Width = 162
        Height = 19
        Size.Values = (
          39.687500000000000000
          449.791666666666700000
          7.937500000000000000
          343.958333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryWODelivery
        DataField = 'Service_Short_Description'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
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
      object gtQRDBText17: TQRDBText
        Left = 655
        Top = 54
        Width = 250
        Height = 19
        Size.Values = (
          39.687500000000000000
          1386.416666666667000000
          113.770833333333300000
          529.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryWODelivery
        DataField = 'package_weight_gms'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
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
      object QRShape1: TQRShape
        Left = 250
        Top = 75
        Width = 151
        Height = 26
        Size.Values = (
          55.562500000000000000
          529.166666666666700000
          158.750000000000000000
          320.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Brush.Color = clBtnFace
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel24: TQRLabel
        Left = 262
        Top = 79
        Width = 120
        Height = 19
        Size.Values = (
          40.216666666666670000
          554.566666666666700000
          167.216666666666700000
          254.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Client Account Code'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtQRLabel25: TQRLabel
        Left = 593
        Top = 79
        Width = 87
        Height = 19
        Size.Values = (
          40.216666666666670000
          1255.183333333333000000
          167.216666666666700000
          184.150000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Account Name'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlblAccountCode: TQRLabel
        Left = 411
        Top = 79
        Width = 121
        Height = 19
        Size.Values = (
          39.687500000000000000
          870.479166666666700000
          166.687500000000000000
          256.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Client Account Code'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtQRShape28: TQRShape
        Left = 706
        Top = 75
        Width = 206
        Height = 26
        Size.Values = (
          55.562500000000000000
          1494.895833333333000000
          158.750000000000000000
          436.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrlblAccountName: TQRLabel
        Left = 723
        Top = 79
        Width = 179
        Height = 19
        Size.Values = (
          39.687500000000000000
          1529.291666666667000000
          166.687500000000000000
          378.354166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Client Account Name'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRShape3: TQRShape
        Left = 1
        Top = 75
        Width = 120
        Height = 26
        Size.Values = (
          55.562500000000000000
          2.645833333333333000
          158.750000000000000000
          254.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Brush.Color = clBtnFace
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel17: TQRLabel
        Left = 12
        Top = 79
        Width = 97
        Height = 19
        Size.Values = (
          40.216666666666670000
          25.400000000000000000
          167.216666666666700000
          205.316666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Payment Details'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtQRShape4: TQRShape
        Left = 120
        Top = 75
        Width = 132
        Height = 26
        Size.Values = (
          55.562500000000000000
          254.000000000000000000
          158.750000000000000000
          280.458333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtlblPayment: TQRLabel
        Left = 130
        Top = 79
        Width = 77
        Height = 19
        Size.Values = (
          40.216666666666670000
          275.166666666666700000
          167.216666666666700000
          162.983333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'gtlblPayment'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtQRShape6: TQRShape
        Left = 641
        Top = 0
        Width = 12
        Height = 24
        Size.Values = (
          50.270833333333330000
          1357.312500000000000000
          0.000000000000000000
          26.458333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Brush.Color = clBtnFace
        Pen.Width = 3
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRDBText7: TQRDBText
        Left = 398
        Top = 4
        Width = 244
        Height = 19
        Size.Values = (
          39.687500000000000000
          841.375000000000000000
          7.937500000000000000
          515.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryWODelivery
        DataField = 'Sort_Description'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
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
      object gtQRDBText18: TQRDBText
        Left = 655
        Top = 4
        Width = 250
        Height = 19
        Size.Values = (
          39.687500000000000000
          1386.416666666667000000
          7.937500000000000000
          529.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryWODelivery
        DataField = 'Speed_Description'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
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
      object gtQRShape20: TQRShape
        Left = 200
        Top = 0
        Width = 11
        Height = 24
        Size.Values = (
          50.270833333333330000
          423.333333333333300000
          0.000000000000000000
          23.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Brush.Color = clBtnFace
        Pen.Width = 3
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRLabel19: TQRLabel
        Left = 398
        Top = 27
        Width = 244
        Height = 19
        Size.Values = (
          39.687500000000000000
          841.375000000000000000
          58.208333333333330000
          515.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Pack Size'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtQRLabel20: TQRLabel
        Left = 12
        Top = 27
        Width = 188
        Height = 19
        Size.Values = (
          39.687500000000000000
          26.458333333333330000
          58.208333333333330000
          396.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Despatch Date'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtQRLabel21: TQRLabel
        Left = 213
        Top = 27
        Width = 162
        Height = 19
        Size.Values = (
          39.687500000000000000
          449.791666666666700000
          58.208333333333330000
          343.958333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Quantity'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRShape7: TQRShape
        Left = 648
        Top = 25
        Width = 264
        Height = 26
        Size.Values = (
          55.562500000000000000
          1370.541666666667000000
          52.916666666666670000
          558.270833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Brush.Color = clBtnFace
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel18: TQRLabel
        Left = 655
        Top = 27
        Width = 250
        Height = 19
        Size.Values = (
          39.687500000000000000
          1386.416666666667000000
          58.208333333333330000
          529.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Pack Wgt (gms)'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
    end
    object qrchildDelivery: TQRChildBand
      Left = 33
      Top = 714
      Width = 912
      Height = 29
      AlignToBottom = False
      Enabled = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        61.383333333333330000
        1930.400000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = qrsdtlDelivery
      PrintOrder = cboAfterParent
      object gtQRLabel22: TQRLabel
        Left = 10
        Top = 5
        Width = 95
        Height = 21
        Size.Values = (
          44.450000000000000000
          21.166666666666670000
          10.583333333333330000
          201.083333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Delivery To:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrmDeliveryAddress: TQRMemo
        Left = 124
        Top = 6
        Width = 328
        Height = 21
        Size.Values = (
          44.979166666666670000
          261.937500000000000000
          13.229166666666670000
          693.208333333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
    end
    object qrgfWOrder: TQRBand
      Left = 33
      Top = 824
      Width = 912
      Height = 56
      AfterPrint = qrgfWOrderAfterPrint
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        118.533333333333300000
        1930.400000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object gtQRLabel23: TQRLabel
        Left = 10
        Top = 6
        Width = 136
        Height = 21
        Size.Values = (
          44.450000000000000000
          21.166666666666670000
          12.700000000000000000
          287.866666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Additional Notes:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrMemoNotes: TQRMemo
        Left = 10
        Top = 31
        Width = 895
        Height = 21
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          66.145833333333340000
          1894.416666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
    end
    object QRBand1: TQRBand
      Left = 33
      Top = 934
      Width = 912
      Height = 50
      Frame.DrawTop = True
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        1930.400000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageFooter
      object gtQRLabel12: TQRLabel
        Left = 10
        Top = 16
        Width = 211
        Height = 21
        Size.Values = (
          44.450000000000000000
          21.166666666666670000
          33.866666666666670000
          446.616666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer Payment Terms:'
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
      object qrlblPaymentTerms: TQRLabel
        Left = 230
        Top = 16
        Width = 140
        Height = 21
        Size.Values = (
          44.450000000000000000
          486.833333333333300000
          33.866666666666670000
          296.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblPaymentTerms'
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
    object QRGroup1: TQRGroup
      Left = 33
      Top = 743
      Width = 912
      Height = 57
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        120.650000000000000000
        1930.400000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrsdtPOrders
      ReprintOnNewPage = False
      object gtQRLabel26: TQRLabel
        Left = 10
        Top = 5
        Width = 184
        Height = 21
        Size.Values = (
          44.450000000000000000
          21.166666666666670000
          10.583333333333330000
          389.466666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Purchase Order Details'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape7: TQRShape
        Left = 0
        Top = 33
        Width = 911
        Height = 25
        Size.Values = (
          52.916666666666660000
          0.000000000000000000
          68.791666666666680000
          1928.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Brush.Color = clBtnFace
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel27: TQRLabel
        Left = 12
        Top = 36
        Width = 69
        Height = 19
        Size.Values = (
          40.216666666666670000
          25.400000000000000000
          76.200000000000000000
          146.050000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'PO Number'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtQRShape8: TQRShape
        Left = 100
        Top = 33
        Width = 11
        Height = 24
        Size.Values = (
          50.270833333333330000
          211.666666666666700000
          68.791666666666680000
          23.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Brush.Color = clBtnFace
        Pen.Width = 3
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRLabel28: TQRLabel
        Left = 393
        Top = 36
        Width = 66
        Height = 19
        Size.Values = (
          40.216666666666670000
          831.850000000000000000
          76.200000000000000000
          139.700000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Description'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtQRShape11: TQRShape
        Left = 811
        Top = 33
        Width = 11
        Height = 24
        Size.Values = (
          50.270833333333330000
          1717.145833333333000000
          68.791666666666680000
          23.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Brush.Color = clBtnFace
        Pen.Width = 3
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRLabel29: TQRLabel
        Left = 825
        Top = 36
        Width = 50
        Height = 19
        Size.Values = (
          40.216666666666670000
          1746.250000000000000000
          76.200000000000000000
          105.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Quantity'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object gtQRShape31: TQRShape
        Left = 380
        Top = 33
        Width = 11
        Height = 24
        Size.Values = (
          50.270833333333330000
          804.333333333333200000
          68.791666666666680000
          23.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Brush.Color = clBtnFace
        Pen.Width = 3
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRLabel30: TQRLabel
        Left = 113
        Top = 36
        Width = 48
        Height = 19
        Size.Values = (
          40.216666666666670000
          239.183333333333300000
          76.200000000000000000
          101.600000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Supplier'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
    end
    object qrsdtPOrders: TQRSubDetail
      Left = 33
      Top = 800
      Width = 912
      Height = 24
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        50.800000000000000000
        1930.400000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpDetails
      DataSet = qryWOPOrders
      PrintBefore = False
      PrintIfEmpty = True
      object gtQRShape29: TQRShape
        Left = 0
        Top = 0
        Width = 912
        Height = 25
        Size.Values = (
          52.916666666666670000
          0.000000000000000000
          0.000000000000000000
          1930.400000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRDBText20: TQRDBText
        Left = 12
        Top = 4
        Width = 95
        Height = 19
        Size.Values = (
          40.216666666666670000
          25.400000000000000000
          8.466666666666667000
          201.083333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryWOPOrders
        DataField = 'Purchase_Order'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
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
      object gtQRShape27: TQRShape
        Left = 100
        Top = 0
        Width = 11
        Height = 24
        Size.Values = (
          50.270833333333330000
          211.666666666666700000
          0.000000000000000000
          23.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Brush.Color = clBtnFace
        Pen.Width = 3
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRShape30: TQRShape
        Left = 811
        Top = 0
        Width = 11
        Height = 24
        Size.Values = (
          50.270833333333330000
          1717.145833333333000000
          0.000000000000000000
          23.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Brush.Color = clBtnFace
        Pen.Width = 3
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRDBText21: TQRDBText
        Left = 393
        Top = 4
        Width = 419
        Height = 19
        Size.Values = (
          39.687500000000000000
          830.791666666666800000
          7.937500000000000000
          886.354166666666900000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryWOPOrders
        DataField = 'Customers_Desc'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
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
      object gtQRDBText22: TQRDBText
        Left = 825
        Top = 4
        Width = 50
        Height = 19
        Size.Values = (
          40.216666666666670000
          1746.250000000000000000
          8.466666666666667000
          105.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryWOPOrders
        DataField = 'Quantity'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
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
      object gtQRShape32: TQRShape
        Left = 380
        Top = 0
        Width = 11
        Height = 24
        Size.Values = (
          50.270833333333330000
          804.333333333333200000
          0.000000000000000000
          23.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Brush.Color = clBtnFace
        Pen.Width = 3
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRDBText23: TQRDBText
        Left = 113
        Top = 4
        Width = 269
        Height = 19
        Size.Values = (
          39.687500000000000000
          238.125000000000000000
          7.937500000000000000
          568.854166666666800000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryWOPOrders
        DataField = 'Supplier_Name'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
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
    object qrChildReturnAddress: TQRChildBand
      Left = 33
      Top = 880
      Width = 912
      Height = 54
      AlignToBottom = False
      Enabled = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        114.300000000000000000
        1930.400000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = qrgfWOrder
      PrintOrder = cboAfterParent
      object gtQRLabel31: TQRLabel
        Left = 10
        Top = 9
        Width = 131
        Height = 21
        Size.Values = (
          44.450000000000000000
          21.166666666666670000
          19.050000000000000000
          277.283333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Return Address:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrmReturnAddress: TQRMemo
        Left = 154
        Top = 10
        Width = 507
        Height = 21
        Size.Values = (
          44.979166666666670000
          325.437500000000000000
          21.166666666666670000
          1074.208333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
    end
  end
  object qryReport: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select  Works_Order.*,'
      '        Operator.Name as Office_Contact_Name,'
      '        (select top 1 Job_Bag'
      '        from Job_Bag_Works_Order'
      
        '        where Works_order.Works_Order = Job_Bag_Works_Order.Work' +
        's_Order) as Job_Bag'
      'from Works_Order, Operator'
      'where Works_order_Number = :Works_Order_Number and'
      'Works_order.Office_Contact = Operator.Operator')
    Left = 379
    Top = 38
    ParamData = <
      item
        Name = 'Works_Order_Number'
      end>
  end
  object qryCustomer: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select Customer.Name as Customer_Name,'
      'Building_no_name,'
      'Street,'
      'Locale,'
      'Town,'
      'Postcode,'
      'Delivery_Narrative,'
      'Account_Code,'
      'Customer_Branch.Name as Branch_Name,'
      'Customer_Branch.Use_Branch_Name,'
      'Payment_Terms.Payment_Terms_Description'
      'FROM Payment_Terms'
      '  RIGHT JOIN (Customer'
      '  INNER JOIN Customer_Branch'
      '    ON Customer.Customer = Customer_Branch.Customer)'
      '    ON Payment_Terms.Payment_Terms = Customer.Payment_Terms'
      'where'
      '  ((Customer_Branch.Customer = :Customer) and'
      '   (Branch_no = :Branch_no))')
    Left = 472
    Top = 40
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end>
  end
  object dtsAddress: TDataSource
    Left = 440
    Top = 40
  end
  object qryContact: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select Customer_Contact.Name as Contact_Name,'
      '        Customer_Contact.Email,'
      '        Customer_Contact.Phone,'
      '        Customer_Contact.Fax_Number,'
      '        Customer_Contact.Mobile_no,'
      '        Customer_Branch.Name as Branch_Name,'
      '        Customer_Branch.Phone as Branch_Phone,'
      '        Customer_Branch.Fax_Number as Branch_Fax_number'
      'from Customer_Contact, Customer_Branch'
      'where Customer_Contact.Customer = :Customer and'
      '      Customer_Contact.Branch_no = :Branch_no and'
      '      Customer_Contact.Contact_no = :Contact_no and'
      '      ('
      '      (Customer_Contact.Customer = Customer_Branch.Customer) and'
      '      (Customer_Contact.Branch_no = Customer_Branch.Branch_no)'
      '      )')
    Left = 80
    Top = 40
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
      end
      item
        Name = 'Branch_no'
        DataType = ftInteger
      end
      item
        Name = 'Contact_no'
        DataType = ftInteger
      end>
  end
  object qryWOProcesses: TFDQuery
    MasterSource = dtsReport
    ConnectionName = 'pb'
    SQL.Strings = (
      'SELECT Works_Order_Process.*, '
      #9'Process.Process_Description, '
      #9'Process.Short_Desc, '
      #9'Process_Group.Is_Work_Centre_Based, '
      #9'(select Process_Number_Type.Number_Type_Short_Desc        '
      #9' from Process_Number_Type        '
      
        #9' where Process_Number_Type.Number_Type = Process.Number_Type) A' +
        'S Number_Type_Short_Desc, '
      #9'(select Paper_Size.Short_Description        '
      #9' from Paper_Size        '
      
        #9' where Paper_Size.Paper_Size = Works_Order_Process.Paper_Size) ' +
        'AS Paper_Description, '
      #9'Work_Centre_Group.Work_Centre_Group_Name, '
      #9'Work_Centre.Work_Centre_Name'
      'FROM Work_Centre '
      #9'RIGHT JOIN (Work_Centre_Group '
      #9'RIGHT JOIN ((Process_Group '
      #9'INNER JOIN Process '
      #9#9'ON Process_Group.Process_Group = Process.Process_Group) '
      #9'INNER JOIN Works_Order_Process '
      #9#9'ON Process.Process = Works_Order_Process.Process) '
      
        #9#9'ON Work_Centre_Group.Work_Centre_Group = Works_Order_Process.W' +
        'ork_Centre_Group) '
      #9#9'ON Work_Centre.Work_Centre = Works_Order_Process.Work_Centre'
      'WHERE (Works_Order_Process.Works_Order = :Works_Order) AND '
      #9'(Works_Order_Process.Process = Process.Process)'
      'ORDER BY Works_Order_Process.Process_no'
      '')
    Left = 376
    Top = 112
    ParamData = <
      item
        Name = 'Works_Order'
      end>
  end
  object dtsReport: TDataSource
    DataSet = qryReport
    Left = 298
    Top = 38
  end
  object qrygetNotes: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select *'
      'from Narrative_line'
      'where narrative = :Narrative'
      'order by narrative, narrative_line')
    Left = 182
    Top = 37
    ParamData = <
      item
        Name = 'Narrative'
      end>
  end
  object qryWOProcessQ: TFDQuery
    MasterSource = dtsWOProcesses
    ConnectionName = 'pb'
    SQL.Strings = (
      'select '#9'Works_Order_Process_Detail.Process_Answer,'
      #9'Process_Question.Question_Text'
      'from Works_Order_Process_detail, Process_Question'
      'where ('
      '(Works_Order_Process_Detail.Works_Order = :Works_Order) and'
      '(Works_Order_Process_Detail.Process_no = :Process_no) and'
      '(Works_Order_Process_Detail.Process = :Process)'
      ') and'
      '('
      
        '(Works_Order_Process_Detail.Process = Process_Question.Process) ' +
        'and'
      
        '(Works_Order_Process_Detail.Question = Process_Question.Question' +
        ')'
      ')'
      'Order By Process_Question.Sequence_no')
    Left = 562
    Top = 70
    ParamData = <
      item
        Name = 'Works_Order'
      end
      item
        Name = 'Process_no'
      end
      item
        Name = 'Process'
      end>
  end
  object dtsWOProcesses: TDataSource
    DataSet = qryWOProcesses
    Left = 288
    Top = 112
  end
  object qryWODelivery: TFDQuery
    MasterSource = dtsReport
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Works_Order_Delivery.*,'
      'Courier.Courier_Name,'
      'Courier.Delivery_Address_Req,'
      'Courier_Service.Service_Description,'
      'Courier_Service.Service_Short_Description,'
      '(Select Package_Size_Description'
      ' from Package_Size'
      
        ' where Package_Size.Package_Size = Works_Order_Delivery.Package_' +
        'size) as Package_Size_descr,'
      '(Select Sort_Description'
      ' from Courier_Sort'
      
        ' where Courier_Sort.Courier_Sort = Works_Order_Delivery.Courier_' +
        'Sort) as Sort_Description,'
      '(Select Speed_Description'
      ' from Courier_Speed'
      
        ' where Courier_Speed.Courier_Speed = Works_Order_Delivery.Courie' +
        'r_Speed) as Speed_Description'
      'from Works_order_Delivery, Courier, Courier_service'
      'where Works_Order = :works_order and'
      '('
      '(Works_order_delivery.Courier = Courier_service.courier) and'
      '(Works_order_delivery.Service_no = courier_service.service_no)'
      ') and'
      '(Courier_service.courier = courier.courier)'
      'order by delivery_no')
    Left = 218
    Top = 38
    ParamData = <
      item
        Name = 'works_order'
      end>
  end
  object qryUpWO: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Works_Order'
      'set Works_Order_Status = 20'
      'where Works_Order = :Works_Order')
    Left = 706
    Top = 42
    ParamData = <
      item
        Name = 'Works_Order'
      end>
  end
  object OldqryWOProcesses: TFDQuery
    SQL.Strings = (
      'select Works_Order_Process.*,'
      '      Process.Process_Description,'
      '      Process.Short_Desc,'
      '      Process_Group.Is_Work_Centre_Based,'
      '      (select Process_Number_Type.Number_Type_Short_Desc'
      '       from Process_Number_Type'
      
        '       where Process_Number_Type.Number_Type = Process.Number_Ty' +
        'pe) as Number_Type_Short_Desc,'
      '      (select Paper_Size.Short_Description'
      '       from Paper_Size'
      
        '       where Paper_Size.Paper_Size = Works_Order_Process.Paper_S' +
        'ize) as Paper_Description'
      'from Works_Order_Process, Process, Process_Group'
      'where Works_order = :Works_Order and'
      'Works_order_Process.Process = Process.Process and'
      'Process.Process_Group = Process_Group.Process_Group'
      'Order By Process_Group.Sequence_no, Process_no')
    Left = 490
    Top = 108
    ParamData = <
      item
        Name = 'Works_Order'
      end>
  end
  object qryWOPOrders: TFDQuery
    MasterSource = dtsReport
    ConnectionName = 'pb'
    SQL.Strings = (
      'SELECT  Job_Bag_Line_Dets.Purchase_Order,'
      '        Job_Bag_Line_Dets.Line,'
      '        Purchase_OrderLine.Quantity,'
      '        Purchase_OrderLine.Customers_Desc,'
      '        Purchase_Order.Supplier,'
      '        Purchase_Order.Branch_No,'
      '        Job_Bag_Line_Dets.Job_Bag_Line_Type,'
      '        Supplier_Branch.Name,'
      '        Supplier.Name as Supplier_Name,'
      '        Job_Bag_Line_Dets.Job_Bag'
      'FROM Supplier'
      '      INNER JOIN (Supplier_Branch'
      '      INNER JOIN (Purchase_Order'
      '      INNER JOIN (Purchase_OrderLine'
      '      INNER JOIN Job_Bag_Line_Dets'
      
        '          ON (Purchase_OrderLine.Line = Job_Bag_Line_Dets.Line) ' +
        'AND (Purchase_OrderLine.Purchase_Order = Job_Bag_Line_Dets.Purch' +
        'ase_Order))'
      
        '          ON Purchase_Order.Purchase_Order = Purchase_OrderLine.' +
        'Purchase_Order)'
      
        '          ON (Supplier_Branch.Branch_no = Purchase_Order.Branch_' +
        'No) AND (Supplier_Branch.Supplier = Purchase_Order.Supplier))'
      '          ON Supplier.Supplier = Supplier_Branch.Supplier'
      'WHERE Job_Bag_Line_dets.Job_Bag = :Job_Bag AND'
      '      Job_Bag_Line_Dets.Job_Bag_Line_Type = '#39'P'#39
      ''
      ''
      ''
      ''
      '')
    Left = 696
    Top = 96
    ParamData = <
      item
        Name = 'Job_Bag'
      end>
  end
  object dsWOPOrders: TDataSource
    DataSet = qryWOPOrders
    Left = 760
    Top = 96
  end
  object qryGetCompAddr: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select   Name,'
      '         Company.Building_No_Name,'
      '         Company.Street,'
      '         Company.Locale,'
      '         Company.Town,'
      '         '#39#39' as County,'
      '         Company.PostCode,'
      '         Company.Phone,'
      '         '#39#39' as Branch_Name,'
      '         '#39'N'#39' as Use_Branch_Name,'
      '         Delivery_Narrative'
      'From Company'
      'Where (Company = 1)'
      '')
    Left = 928
    Top = 6
  end
  object qryGetCustAddr: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select   Customer.Name,'
      '         Customer_Branch.Building_No_Name,'
      '         Customer_Branch.Street,'
      '         Customer_Branch.Locale,'
      '         Customer_Branch.Town,'
      '         Customer_Branch.County,'
      '         Customer_Branch.PostCode,'
      '         Customer_Branch.Phone,'
      '         Customer.Customer,'
      '         Customer_Branch.Branch_No,'
      '         Customer_Branch.Delivery_Narrative,'
      '         Customer_Branch.Name as Branch_Name,'
      '         Customer_Branch.Use_Branch_Name'
      'From Customer_Branch, Customer'
      'Where (Customer_Branch.Customer = :Customer) and'
      '      (Customer_Branch.Branch_No = :Branch_No) and'
      '      (Customer.Customer = Customer_Branch.Customer)'
      ' ')
    Left = 928
    Top = 54
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_No'
      end>
  end
  object qryGetAddHocAddr: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select   Name,'
      '         Building_No_name,'
      '         Street,'
      '         Locale,'
      '         Town,'
      '         '#39#39' as County,'
      '         Postcode,'
      '         '#39'N'#39' as Use_Branch_Name,'
      '         Delivery_Narrative'
      'From Ad_Hoc_Address'
      'Where (Ad_Hoc_Address = :Ad_Hoc_Address)'
      '')
    Left = 928
    Top = 114
    ParamData = <
      item
        Name = 'Ad_Hoc_Address'
      end>
  end
  object dtsReturnAddress: TDataSource
    Left = 1016
    Top = 8
  end
  object qryGetCompBrAddr: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select   Company.Name,'
      '         Company_Branch.Building_No_Name,'
      '         Company_Branch.Street,'
      '         Company_Branch.Locale,'
      '         Company_Branch.Town,'
      '         Company_Branch.County,'
      '         Company_Branch.PostCode,'
      '         '#39'N'#39' as Use_Branch_Name,'
      '         '#39#39' as Branch_Name,'
      '         Company_Branch.Delivery_Narrative'
      'From Company, Company_Branch'
      
        'Where (Company_Branch.Company = 1) and (Company_Branch.Company =' +
        ' 1 and Company_Branch.Branch_no = :Branch_no)')
    Left = 928
    Top = 168
    ParamData = <
      item
        Name = 'Branch_no'
      end>
  end
end
