object frmPBRPWorksOrder: TfrmPBRPWorksOrder
  Left = 229
  Top = 48
  Caption = 'Works Instruction Print'
  ClientHeight = 621
  ClientWidth = 879
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Scaled = False
  TextHeight = 13
  object qrpDetails: TQuickRep
    Left = 32
    Top = 64
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
      Left = 26
      Top = 38
      Width = 730
      Height = 299
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        791.104166666666700000
        1931.458333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object qrlblQuoteCaption: TQRLabel
        Left = 8
        Top = 0
        Width = 364
        Height = 38
        Size.Values = (
          100.541666666666700000
          21.166666666666670000
          0.000000000000000000
          963.083333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'WORKS INSTRUCTIONS'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -32
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 24
      end
      object QRLabel2: TQRLabel
        Left = 159
        Top = 93
        Width = 32
        Height = 19
        Size.Values = (
          50.270833333333330000
          420.687500000000000000
          246.062500000000000000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Date:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRDBText1: TQRDBText
        Left = 200
        Top = 93
        Width = 65
        Height = 19
        Size.Values = (
          50.270833333333330000
          529.166666666666700000
          246.062500000000000000
          171.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Date_Point'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
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
        Left = 612
        Top = 3
        Width = 227
        Height = 25
        Size.Values = (
          66.145833333333330000
          1619.250000000000000000
          7.937500000000000000
          600.604166666666700000)
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
        Font.Height = -21
        Font.Name = 'Arial'
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
        Left = 489
        Top = 4
        Width = 67
        Height = 25
        Size.Values = (
          66.145833333333330000
          1293.812500000000000000
          10.583333333333330000
          177.270833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'WI No:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 16
      end
      object QRLabel5: TQRLabel
        Left = 490
        Top = 36
        Width = 72
        Height = 17
        Size.Values = (
          44.979166666666670000
          1296.458333333333000000
          95.250000000000000000
          190.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Release No:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRDBText5: TQRDBText
        Left = 80
        Top = 38
        Width = 401
        Height = 19
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
        Font.Height = -16
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
        Left = 8
        Top = 38
        Width = 64
        Height = 19
        Size.Values = (
          50.270833333333330000
          21.166666666666670000
          100.541666666666700000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Job Title:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
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
        Left = 612
        Top = 36
        Width = 97
        Height = 17
        Size.Values = (
          44.979166666666670000
          1619.250000000000000000
          95.250000000000000000
          256.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Version_Number'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
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
        Left = 8
        Top = 117
        Width = 721
        Height = 168
        Size.Values = (
          444.500000000000000000
          21.166666666666670000
          309.562500000000000000
          1907.645833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Brush.Style = bsClear
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel1: TQRLabel
        Left = 16
        Top = 237
        Width = 92
        Height = 17
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          627.062500000000000000
          243.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Estimated Qty:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel3: TQRLabel
        Left = 489
        Top = 61
        Width = 99
        Height = 23
        Size.Values = (
          60.854166666666670000
          1293.812500000000000000
          161.395833333333300000
          261.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Start Date:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 14
      end
      object gtQRLabel4: TQRLabel
        Left = 489
        Top = 92
        Width = 122
        Height = 23
        Size.Values = (
          60.854166666666670000
          1293.812500000000000000
          243.416666666666700000
          322.791666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Mailing Date:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 14
      end
      object gtQRLabel5: TQRLabel
        Left = 392
        Top = 237
        Width = 90
        Height = 17
        Size.Values = (
          44.979166666666670000
          1037.166666666667000000
          627.062500000000000000
          238.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer Ref:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel6: TQRLabel
        Left = 392
        Top = 260
        Width = 90
        Height = 17
        Size.Values = (
          44.979166666666670000
          1037.166666666667000000
          687.916666666666700000
          238.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Previous WIN:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRDBText2: TQRDBText
        Left = 120
        Top = 237
        Width = 116
        Height = 17
        Size.Values = (
          44.979166666666670000
          317.500000000000000000
          627.062500000000000000
          306.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Estimated_Quantity'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
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
        Left = 612
        Top = 60
        Width = 96
        Height = 23
        Size.Values = (
          60.854166666666670000
          1619.250000000000000000
          158.750000000000000000
          254.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Date_start'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 14
      end
      object gtQRDBText4: TQRDBText
        Left = 612
        Top = 92
        Width = 138
        Height = 23
        Size.Values = (
          60.854166666666670000
          1619.250000000000000000
          243.416666666666700000
          365.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Date_Required'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 14
      end
      object gtQRDBText5: TQRDBText
        Left = 496
        Top = 260
        Width = 130
        Height = 17
        Size.Values = (
          44.979166666666670000
          1312.333333333333000000
          687.916666666666700000
          343.958333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Previous_WO_number'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
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
        Left = 496
        Top = 236
        Width = 88
        Height = 19
        Size.Values = (
          50.270833333333330000
          1312.333333333333000000
          624.416666666666700000
          232.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Cust_Order_no'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
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
        Left = 16
        Top = 260
        Width = 94
        Height = 17
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          687.916666666666700000
          248.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Is Perso 100%?'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRDBText8: TQRDBText
        Left = 120
        Top = 259
        Width = 130
        Height = 19
        Size.Values = (
          50.270833333333330000
          317.500000000000000000
          685.270833333333300000
          343.958333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Is_Perso_100_percent'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
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
        Left = 7
        Top = 93
        Width = 72
        Height = 19
        Size.Values = (
          50.270833333333330000
          18.520833333333330000
          246.062500000000000000
          190.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Job Bag No:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRDBText9: TQRDBText
        Left = 88
        Top = 93
        Width = 51
        Height = 19
        Size.Values = (
          50.270833333333330000
          232.833333333333300000
          246.062500000000000000
          134.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Job_Bag'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
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
        Left = 19
        Top = 126
        Width = 65
        Height = 20
        Size.Values = (
          52.916666666666670000
          50.270833333333330000
          333.375000000000000000
          171.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrmAddress: TQRMemo
        Left = 99
        Top = 126
        Width = 262
        Height = 96
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLabel10: TQRLabel
        Left = 392
        Top = 126
        Width = 53
        Height = 17
        Size.Values = (
          44.979166666666670000
          1037.166666666667000000
          333.375000000000000000
          140.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Contact:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel7: TQRLabel
        Left = 392
        Top = 147
        Width = 73
        Height = 17
        Size.Values = (
          44.979166666666670000
          1037.166666666667000000
          388.937500000000000000
          193.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Telephone:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel8: TQRLabel
        Left = 392
        Top = 168
        Width = 29
        Height = 17
        Size.Values = (
          44.979166666666670000
          1037.166666666667000000
          444.500000000000000000
          76.729166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fax:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel9: TQRLabel
        Left = 392
        Top = 189
        Width = 41
        Height = 17
        Size.Values = (
          44.979166666666670000
          1037.166666666667000000
          500.062500000000000000
          108.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Email:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel4: TQRLabel
        Left = 392
        Top = 209
        Width = 88
        Height = 19
        Size.Values = (
          50.270833333333330000
          1037.166666666667000000
          552.979166666666700000
          232.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Acc Manager:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblContactName: TQRLabel
        Left = 496
        Top = 126
        Width = 104
        Height = 17
        Size.Values = (
          44.979166666666670000
          1312.333333333333000000
          333.375000000000000000
          275.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblContactName'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblTelephone: TQRLabel
        Left = 496
        Top = 147
        Width = 84
        Height = 17
        Size.Values = (
          44.979166666666670000
          1312.333333333333000000
          388.937500000000000000
          222.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblTelephone'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblFax: TQRLabel
        Left = 496
        Top = 168
        Width = 47
        Height = 17
        Size.Values = (
          44.979166666666670000
          1312.333333333333000000
          444.500000000000000000
          124.354166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblFax'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblEmail: TQRLabel
        Left = 496
        Top = 189
        Width = 58
        Height = 17
        Size.Values = (
          44.979166666666670000
          1312.333333333333000000
          500.062500000000000000
          153.458333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblEmail'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRDBText3: TQRDBText
        Left = 496
        Top = 209
        Width = 127
        Height = 19
        Size.Values = (
          50.270833333333330000
          1312.333333333333000000
          552.979166666666700000
          336.020833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Office_Contact_Name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
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
        Left = 8
        Top = 224
        Width = 721
        Height = 11
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
        Left = 376
        Top = 118
        Width = 9
        Height = 111
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
        Left = 216
        Top = 237
        Width = 70
        Height = 17
        Size.Values = (
          44.979166666666670000
          571.500000000000000000
          627.062500000000000000
          185.208333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Actual Qty:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
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
        Left = 290
        Top = 237
        Width = 94
        Height = 17
        Size.Values = (
          44.979166666666670000
          767.291666666666700000
          627.062500000000000000
          248.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Actual_Quantity'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
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
      Left = 26
      Top = 337
      Width = 730
      Height = 2
      AlignToBottom = False
      BeforePrint = qrgWOrderBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        5.291666666666667000
        1931.458333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'works_order'
      FooterBand = qrgfWOrder
      Master = qrpDetails
      ReprintOnNewPage = False
    end
    object qrsdtlProcesses: TQRSubDetail
      Left = 26
      Top = 385
      Width = 730
      Height = 2
      AfterPrint = qrsdtlProcessesAfterPrint
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        5.291666666666667000
        1931.458333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpDetails
      DataSet = qryWOProcesses
      PrintBefore = False
      PrintIfEmpty = True
    end
    object qrGrpProcesses: TQRGroup
      Left = 26
      Top = 339
      Width = 730
      Height = 46
      AlignToBottom = False
      BeforePrint = qrGrpProcessesBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        121.708333333333300000
        1931.458333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'Process_no'
      FooterBand = qrbGrpProcessFooter
      Master = qrsdtlProcesses
      ReprintOnNewPage = False
      object gtProcess: TQRDBText
        Left = 8
        Top = 3
        Width = 128
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          7.937500000000000000
          338.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryWOProcesses
        DataField = 'Process_Description'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
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
        Left = 68
        Top = 26
        Width = 118
        Height = 17
        Size.Values = (
          44.979166666666670000
          179.916666666666700000
          68.791666666666670000
          312.208333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryWOProcesses
        DataField = 'Target_Receipt_Date'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
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
        Left = 6
        Top = 26
        Width = 61
        Height = 17
        Size.Values = (
          44.979166666666670000
          15.875000000000000000
          68.791666666666670000
          161.395833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Start Date:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qrlblProcessSize: TQRLabel
        Left = 174
        Top = 3
        Width = 88
        Height = 17
        Size.Values = (
          44.979166666666670000
          460.375000000000000000
          7.937500000000000000
          232.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Process Sizes'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtdbTextRunTime: TQRDBText
        Left = 268
        Top = 26
        Width = 53
        Height = 17
        Size.Values = (
          44.979166666666670000
          709.083333333333400000
          68.791666666666680000
          140.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryWOProcesses
        DataField = 'No_of_hours'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
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
        Left = 174
        Top = 26
        Width = 87
        Height = 17
        Size.Values = (
          44.979166666666670000
          460.375000000000000000
          68.791666666666670000
          230.187500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Run Time (hrs):'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object gtlblTeamSize: TQRLabel
        Left = 326
        Top = 26
        Width = 63
        Height = 17
        Size.Values = (
          44.979166666666670000
          862.541666666666700000
          68.791666666666670000
          166.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Team Size:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
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
        Left = 396
        Top = 26
        Width = 37
        Height = 17
        Size.Values = (
          44.979166666666670000
          1047.750000000000000000
          68.791666666666680000
          97.895833333333340000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryWOProcesses
        DataField = 'Team_Count'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
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
        Left = 468
        Top = 3
        Width = 89
        Height = 17
        Size.Values = (
          44.979166666666670000
          1238.250000000000000000
          7.937500000000000000
          235.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Machine Group:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object gtdbtextMachineGroup: TQRDBText
        Left = 564
        Top = 3
        Width = 165
        Height = 17
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
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
        Left = 505
        Top = 26
        Width = 52
        Height = 17
        Size.Values = (
          44.979166666666670000
          1336.145833333333000000
          68.791666666666670000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Machine:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object gtdbTextMachine: TQRDBText
        Left = 564
        Top = 26
        Width = 165
        Height = 17
        Size.Values = (
          44.979166666666670000
          1492.250000000000000000
          68.791666666666680000
          436.562499999999900000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryWOProcesses
        DataField = 'Work_Centre_Name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
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
      Left = 26
      Top = 407
      Width = 730
      Height = 24
      AfterPrint = qrbGrpProcessFooterAfterPrint
      AlignToBottom = False
      BeforePrint = qrbGrpProcessFooterBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        63.500000000000000000
        1931.458333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object gtQRLabel7: TQRLabel
        Left = 8
        Top = 5
        Width = 40
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          13.229166666666670000
          105.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Notes:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrMemoProcessNotes: TQRMemo
        Left = 56
        Top = 5
        Width = 665
        Height = 17
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
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
    end
    object QRSubDetail1: TQRSubDetail
      Left = 26
      Top = 387
      Width = 730
      Height = 20
      AlignToBottom = False
      BeforePrint = QRSubDetail1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.916666666666670000
        1931.458333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrsdtlProcesses
      DataSet = qryWOProcessQ
      PrintBefore = False
      PrintIfEmpty = True
      object gtQRShape2: TQRShape
        Left = 1
        Top = 0
        Width = 728
        Height = 20
        Size.Values = (
          52.916666666666670000
          2.645833333333333000
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
        Left = 177
        Top = 0
        Width = 9
        Height = 20
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
        Left = 184
        Top = 2
        Width = 537
        Height = 17
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
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        HiresExport = False
        Transparent = False
        YIncrement = 50
      end
      object gtQRDBText12: TQRDBText
        Left = 8
        Top = 2
        Width = 169
        Height = 17
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
      Left = 26
      Top = 431
      Width = 730
      Height = 46
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      LinkBand = qrsdtlDelivery
      Size.Values = (
        121.708333333333300000
        1931.458333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrsdtlDelivery
      ReprintOnNewPage = False
      object gtQRLabel14: TQRLabel
        Left = 8
        Top = 4
        Width = 106
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          10.583333333333330000
          280.458333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Despatch Details'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
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
        Top = 26
        Width = 729
        Height = 20
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
        Left = 160
        Top = 26
        Width = 9
        Height = 19
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
        Left = 10
        Top = 29
        Width = 127
        Height = 15
        Size.Values = (
          39.687500000000000000
          26.458333333333330000
          76.729166666666680000
          336.020833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Courier'
        Color = clBtnFace
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
      object gtQRLabel16: TQRLabel
        Left = 170
        Top = 29
        Width = 38
        Height = 15
        Size.Values = (
          39.687500000000000000
          449.791666666666700000
          76.729166666666670000
          100.541666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Service'
        Color = clBtnFace
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
      object gtQRShape14: TQRShape
        Left = 264
        Top = 26
        Width = 9
        Height = 19
        Size.Values = (
          50.270833333333330000
          698.500000000000000000
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
      object gtQRShape15: TQRShape
        Left = 415
        Top = 26
        Width = 9
        Height = 19
        Size.Values = (
          50.270833333333330000
          1098.020833333333000000
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
      object gtQRLabel18: TQRLabel
        Left = 425
        Top = 29
        Width = 77
        Height = 15
        Size.Values = (
          39.687500000000000000
          1124.479166666667000000
          76.729166666666670000
          203.729166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Pack Wgt (gms)'
        Color = clBtnFace
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
      object gtQRShape16: TQRShape
        Left = 504
        Top = 26
        Width = 9
        Height = 19
        Size.Values = (
          50.270833333333330000
          1333.500000000000000000
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
      object gtQRLabel19: TQRLabel
        Left = 518
        Top = 29
        Width = 48
        Height = 15
        Size.Values = (
          39.687500000000000000
          1370.541666666667000000
          76.729166666666670000
          127.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Pack Size'
        Color = clBtnFace
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
      object gtQRShape17: TQRShape
        Left = 569
        Top = 26
        Width = 9
        Height = 19
        Size.Values = (
          50.270833333333330000
          1505.479166666667000000
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
      object gtQRLabel20: TQRLabel
        Left = 580
        Top = 29
        Width = 72
        Height = 15
        Size.Values = (
          39.687500000000000000
          1534.583333333333000000
          76.729166666666670000
          190.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Despatch Date'
        Color = clBtnFace
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
      object gtQRLabel21: TQRLabel
        Left = 676
        Top = 29
        Width = 41
        Height = 15
        Size.Values = (
          39.687500000000000000
          1788.583333333333000000
          76.729166666666670000
          108.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Quantity'
        Color = clBtnFace
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
      object gtQRShape18: TQRShape
        Left = 656
        Top = 26
        Width = 9
        Height = 19
        Size.Values = (
          50.270833333333330000
          1735.666666666667000000
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
      object gtQRShape5: TQRShape
        Left = 337
        Top = 26
        Width = 9
        Height = 19
        Size.Values = (
          50.270833333333330000
          891.645833333333300000
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
        Left = 290
        Top = 29
        Width = 21
        Height = 15
        Size.Values = (
          39.687500000000000000
          767.291666666666700000
          76.729166666666670000
          55.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sort'
        Color = clBtnFace
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
      object gtQRLabel11: TQRLabel
        Left = 364
        Top = 28
        Width = 32
        Height = 15
        Size.Values = (
          39.687500000000000000
          963.083333333333300000
          74.083333333333330000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Speed'
        Color = clBtnFace
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
    object qrsdtlDelivery: TQRSubDetail
      Left = 26
      Top = 477
      Width = 730
      Height = 60
      AlignToBottom = False
      BeforePrint = qrsdtlDeliveryBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        158.750000000000000000
        1931.458333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpDetails
      DataSet = qryWODelivery
      PrintBefore = False
      PrintIfEmpty = True
      object gtQRShape19: TQRShape
        Left = 0
        Top = 0
        Width = 730
        Height = 20
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
        Left = 489
        Top = 2
        Width = 103
        Height = 15
        Size.Values = (
          39.687500000000000000
          1293.812500000000000000
          5.291666666666667000
          272.520833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Color = clWhite
        DataSet = qryWODelivery
        DataField = 'Package_Size_descr'
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
      object QRShape2: TQRShape
        Left = 457
        Top = 20
        Width = 109
        Height = 21
        Size.Values = (
          55.562500000000000000
          1209.145833333333000000
          52.916666666666670000
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
        Left = 320
        Top = 20
        Width = 138
        Height = 21
        Size.Values = (
          55.562500000000000000
          846.666666666666700000
          52.916666666666670000
          365.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRDBText19: TQRDBText
        Left = 646
        Top = 3
        Width = 72
        Height = 15
        Size.Values = (
          39.687500000000000000
          1709.208333333333000000
          7.937500000000000000
          190.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryWODelivery
        DataField = 'Qty_to_Deliver'
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
      object gtQRDBText13: TQRDBText
        Left = 10
        Top = 3
        Width = 145
        Height = 15
        Size.Values = (
          39.687500000000000000
          26.458333333333330000
          7.937500000000000000
          383.645833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryWODelivery
        DataField = 'Courier_Name'
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
      object gtQRDBText14: TQRDBText
        Left = 583
        Top = 3
        Width = 68
        Height = 15
        Size.Values = (
          39.687500000000000000
          1542.520833333333000000
          7.937500000000000000
          179.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Color = clWhite
        DataSet = qryWODelivery
        DataField = 'Delivery_Date'
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
      object gtQRShape20: TQRShape
        Left = 160
        Top = 0
        Width = 9
        Height = 19
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
      object gtQRShape21: TQRShape
        Left = 264
        Top = 0
        Width = 9
        Height = 19
        Size.Values = (
          50.270833333333330000
          698.500000000000000000
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
      object gtQRShape22: TQRShape
        Left = 415
        Top = 0
        Width = 9
        Height = 19
        Size.Values = (
          50.270833333333330000
          1098.020833333333000000
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
      object gtQRShape23: TQRShape
        Left = 504
        Top = 0
        Width = 9
        Height = 19
        Size.Values = (
          50.270833333333330000
          1333.500000000000000000
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
      object gtQRShape24: TQRShape
        Left = 569
        Top = 0
        Width = 9
        Height = 19
        Size.Values = (
          50.270833333333330000
          1505.479166666667000000
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
      object gtQRShape25: TQRShape
        Left = 656
        Top = 0
        Width = 9
        Height = 19
        Size.Values = (
          50.270833333333330000
          1735.666666666667000000
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
        Left = 170
        Top = 3
        Width = 91
        Height = 15
        Size.Values = (
          39.687500000000000000
          449.791666666666700000
          7.937500000000000000
          240.770833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryWODelivery
        DataField = 'Service_Short_Description'
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
      object gtQRDBText17: TQRDBText
        Left = 424
        Top = 3
        Width = 76
        Height = 15
        Size.Values = (
          39.687500000000000000
          1121.833333333333000000
          7.937500000000000000
          201.083333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryWODelivery
        DataField = 'package_weight_gms'
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
      object QRShape1: TQRShape
        Left = 200
        Top = 20
        Width = 121
        Height = 21
        Size.Values = (
          55.562500000000000000
          529.166666666666700000
          52.916666666666670000
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
        Left = 210
        Top = 23
        Width = 99
        Height = 15
        Size.Values = (
          39.687500000000000000
          555.625000000000000000
          60.854166666666670000
          261.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Client Account Code'
        Color = clBtnFace
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
      object gtQRLabel25: TQRLabel
        Left = 474
        Top = 23
        Width = 72
        Height = 15
        Size.Values = (
          39.687500000000000000
          1254.125000000000000000
          60.854166666666670000
          190.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Account Name'
        Color = clBtnFace
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
      object qrlblAccountCode: TQRLabel
        Left = 329
        Top = 23
        Width = 97
        Height = 15
        Size.Values = (
          39.687500000000000000
          870.479166666666700000
          60.854166666666670000
          256.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Client Account Code'
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
      object gtQRShape28: TQRShape
        Left = 565
        Top = 20
        Width = 165
        Height = 21
        Size.Values = (
          55.562500000000000000
          1494.895833333333000000
          52.916666666666670000
          436.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrlblAccountName: TQRLabel
        Left = 578
        Top = 23
        Width = 143
        Height = 15
        Size.Values = (
          39.687500000000000000
          1529.291666666667000000
          60.854166666666670000
          378.354166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Client Account Name'
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
      object QRShape3: TQRShape
        Left = 1
        Top = 20
        Width = 96
        Height = 21
        Size.Values = (
          55.562500000000000000
          2.645833333333333000
          52.916666666666670000
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
        Left = 10
        Top = 23
        Width = 77
        Height = 15
        Size.Values = (
          39.687500000000000000
          26.458333333333330000
          60.854166666666670000
          203.729166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Payment Details'
        Color = clBtnFace
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
      object gtQRShape4: TQRShape
        Left = 96
        Top = 20
        Width = 106
        Height = 21
        Size.Values = (
          55.562500000000000000
          254.000000000000000000
          52.916666666666670000
          280.458333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtlblPayment: TQRLabel
        Left = 104
        Top = 23
        Width = 61
        Height = 15
        Size.Values = (
          39.687500000000000000
          275.166666666666700000
          60.854166666666670000
          161.395833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'gtlblPayment'
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
      object gtQRShape6: TQRShape
        Left = 337
        Top = 0
        Width = 9
        Height = 19
        Size.Values = (
          50.270833333333330000
          891.645833333333300000
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
      object gtQRDBText7: TQRDBText
        Left = 261
        Top = 3
        Width = 81
        Height = 15
        Size.Values = (
          39.687500000000000000
          690.562500000000000000
          7.937500000000000000
          214.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Color = clWhite
        DataSet = qryWODelivery
        DataField = 'Sort_Description'
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
      object gtQRDBText18: TQRDBText
        Left = 336
        Top = 3
        Width = 92
        Height = 15
        Size.Values = (
          39.687500000000000000
          889.000000000000000000
          7.937500000000000000
          243.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Color = clWhite
        DataSet = qryWODelivery
        DataField = 'Speed_Description'
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
    end
    object qrchildDelivery: TQRChildBand
      Left = 26
      Top = 537
      Width = 730
      Height = 23
      AlignToBottom = False
      Enabled = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        60.854166666666670000
        1931.458333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = qrsdtlDelivery
      PrintOrder = cboAfterParent
      object gtQRLabel22: TQRLabel
        Left = 8
        Top = 4
        Width = 77
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          10.583333333333330000
          203.729166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Delivery To:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrmDeliveryAddress: TQRMemo
        Left = 99
        Top = 5
        Width = 262
        Height = 17
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
    end
    object qrgfWOrder: TQRBand
      Left = 26
      Top = 560
      Width = 730
      Height = 45
      AfterPrint = qrgfWOrderAfterPrint
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        119.062500000000000000
        1931.458333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object gtQRLabel23: TQRLabel
        Left = 8
        Top = 5
        Width = 109
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          13.229166666666670000
          288.395833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Additional Notes:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrMemoNotes: TQRMemo
        Left = 8
        Top = 25
        Width = 716
        Height = 17
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
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
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
      'Customer_Branch.Use_Branch_Name'
      'from'
      '  Customer_Branch, Customer'
      'where'
      '  ((Customer_Branch.Customer = :Customer) and'
      '   (Branch_no = :Branch_no)) and'
      '  Customer_Branch.Customer = Customer.Customer')
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
    Left = 370
    Top = 182
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
    Left = 370
    Top = 246
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
    Left = 490
    Top = 274
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
end
