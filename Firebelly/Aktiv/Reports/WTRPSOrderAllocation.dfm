object frmWTRPSOrderAllocation: TfrmWTRPSOrderAllocation
  Left = 238
  Top = 104
  Width = 1013
  Height = 591
  Caption = 'Sales Order/Job Allocation Sheet'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object qrpDetails: TQuickRep
    Left = 32
    Top = 56
    Width = 794
    Height = 1123
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
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
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrintIfEmpty = True
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsMaximized
    object qrbPageHeader: TQRBand
      Left = 38
      Top = 38
      Width = 718
      Height = 147
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
        388.937500000000000000
        1899.708333333333000000)
      BandType = rbPageHeader
      object qrlblSOCaption: TQRLabel
        Left = 545
        Top = 0
        Width = 168
        Height = 43
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          113.770833333333300000
          1441.979166666667000000
          0.000000000000000000
          444.500000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Job Sheet'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -37
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 28
      end
      object qriHeadLogo: TQRImage
        Left = 3
        Top = 0
        Width = 385
        Height = 81
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          214.312500000000000000
          7.937500000000000000
          0.000000000000000000
          1018.645833333333000000)
        Stretch = True
      end
      object memAddress: TQRRichText
        Left = 4
        Top = 82
        Width = 321
        Height = 57
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          150.812500000000000000
          10.583333333333330000
          216.958333333333300000
          849.312500000000000000)
        Alignment = taCenter
        AutoStretch = False
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
        Font.Style = []
      end
    end
    object qrsdFitterDateTimes: TQRSubDetail
      Left = 38
      Top = 241
      Width = 718
      Height = 312
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = qrsdFitterDateTimesBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        825.500000000000000000
        1899.708333333333000000)
      Master = qrpDetails
      DataSet = qryReport
      PrintBefore = False
      PrintIfEmpty = True
      object gtQRShape1: TQRShape
        Left = 8
        Top = 229
        Width = 707
        Height = 49
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          129.645833333333300000
          21.166666666666670000
          605.895833333333300000
          1870.604166666667000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape3: TQRShape
        Left = 8
        Top = 173
        Width = 707
        Height = 49
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          129.645833333333300000
          21.166666666666670000
          457.729166666666700000
          1870.604166666667000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRDBText4: TQRDBText
        Left = 15
        Top = 202
        Width = 201
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          39.687500000000000000
          534.458333333333300000
          531.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Reference'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel5: TQRLabel
        Left = 15
        Top = 179
        Width = 120
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          39.687500000000000000
          473.604166666666700000
          317.500000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Customer Reference:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel1: TQRLabel
        Left = 16
        Top = 53
        Width = 57
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          140.229166666666700000
          150.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Customer'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object qrlblFitDateLabel: TQRLabel
        Left = 473
        Top = 178
        Width = 44
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1251.479166666667000000
          470.958333333333300000
          116.416666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Fit date:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlblTemplateDateLabel: TQRLabel
        Left = 233
        Top = 178
        Width = 83
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          616.479166666666700000
          470.958333333333300000
          219.604166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Template date:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape1: TQRShape
        Left = 8
        Top = 30
        Width = 328
        Height = 137
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          362.479166666666700000
          21.166666666666670000
          79.375000000000000000
          867.833333333333300000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrmAddress: TQRMemo
        Left = 14
        Top = 51
        Width = 289
        Height = 105
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          277.812500000000000000
          37.041666666666670000
          134.937500000000000000
          764.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object gtQRShape2: TQRShape
        Left = 380
        Top = 30
        Width = 336
        Height = 137
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          362.479166666666700000
          1005.416666666667000000
          79.375000000000000000
          889.000000000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrmSiteAddress: TQRMemo
        Left = 392
        Top = 51
        Width = 289
        Height = 114
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          301.625000000000000000
          1037.166666666667000000
          134.937500000000000000
          764.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object gtQRShape4: TQRShape
        Left = 221
        Top = 173
        Width = 9
        Height = 49
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          129.645833333333300000
          584.729166666666700000
          457.729166666666700000
          23.812500000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRShape5: TQRShape
        Left = 453
        Top = 173
        Width = 9
        Height = 49
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          129.645833333333300000
          1198.562500000000000000
          457.729166666666700000
          23.812500000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRShape6: TQRShape
        Left = 8
        Top = 194
        Width = 707
        Height = 5
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          13.229166666666670000
          21.166666666666670000
          513.291666666666700000
          1870.604166666667000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRLabel2: TQRLabel
        Left = 14
        Top = 34
        Width = 57
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          37.041666666666670000
          89.958333333333330000
          150.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Customer'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object gtQRLabel3: TQRLabel
        Left = 392
        Top = 34
        Width = 61
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1037.166666666667000000
          89.958333333333330000
          161.395833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Installation'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlblTemplateDate: TQRLabel
        Left = 232
        Top = 201
        Width = 86
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          613.833333333333300000
          531.812500000000000000
          227.541666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblTemplateDate'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlblDateRequired: TQRLabel
        Left = 472
        Top = 201
        Width = 86
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1248.833333333333000000
          531.812500000000000000
          227.541666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblDateRequired'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object gtQRDBText2: TQRDBText
        Left = 15
        Top = 234
        Width = 690
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          39.687500000000000000
          619.125000000000000000
          1825.625000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = qryReport
        DataField = 'Descriptive_Reference'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object gtQRShape9: TQRShape
        Left = 8
        Top = 2
        Width = 329
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333330000
          21.166666666666670000
          5.291666666666667000
          870.479166666666700000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape10: TQRShape
        Left = 100
        Top = 2
        Width = 9
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333330000
          264.583333333333300000
          5.291666666666667000
          23.812500000000000000)
        Pen.Width = 2
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRLabel6: TQRLabel
        Left = 18
        Top = 7
        Width = 80
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          47.625000000000000000
          18.520833333333330000
          211.666666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Sales Order:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object gtQRDBText3: TQRDBText
        Left = 116
        Top = 7
        Width = 79
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          306.916666666666700000
          18.520833333333330000
          209.020833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Sales_Order'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object gtQRShape15: TQRShape
        Left = 381
        Top = 2
        Width = 334
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333330000
          1008.062500000000000000
          5.291666666666667000
          883.708333333333300000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel7: TQRLabel
        Left = 391
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
          1034.520833333333000000
          18.520833333333330000
          74.083333333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Job:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object gtQRDBText6: TQRDBText
        Left = 489
        Top = 7
        Width = 24
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1293.812500000000000000
          18.520833333333330000
          63.500000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Job'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object gtQRShape16: TQRShape
        Left = 476
        Top = 2
        Width = 9
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333330000
          1259.416666666667000000
          5.291666666666667000
          23.812500000000000000)
        Pen.Width = 2
        Shape = qrsVertLine
        VertAdjust = 0
      end
    end
    object qrgFitter: TQRGroup
      Left = 38
      Top = 185
      Width = 718
      Height = 2
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      Enabled = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        5.291666666666667000
        1899.708333333333000000)
      Expression = 'Fitter_Name'
      Master = qrsdFitterDateTimes
      ReprintOnNewPage = False
    end
    object grpDate: TQRGroup
      Left = 38
      Top = 187
      Width = 718
      Height = 54
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = grpDateBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        142.875000000000000000
        1899.708333333333000000)
      Expression = 'Date_Required'
      Master = qrsdFitterDateTimes
      ReprintOnNewPage = False
      object gtQRShape11: TQRShape
        Left = 504
        Top = 0
        Width = 209
        Height = 51
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          134.937500000000000000
          1333.500000000000000000
          0.000000000000000000
          552.979166666666700000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape12: TQRShape
        Left = 581
        Top = 0
        Width = 9
        Height = 51
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          134.937500000000000000
          1537.229166666667000000
          0.000000000000000000
          23.812500000000000000)
        Pen.Width = 2
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRShape13: TQRShape
        Left = 8
        Top = 26
        Width = 329
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333330000
          21.166666666666670000
          68.791666666666670000
          870.479166666666700000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape14: TQRShape
        Left = 101
        Top = 26
        Width = 6
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333330000
          267.229166666666700000
          68.791666666666670000
          15.875000000000000000)
        Pen.Width = 2
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object qrlblJobType: TQRLabel
        Left = 18
        Top = 31
        Width = 44
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          47.625000000000000000
          82.020833333333330000
          116.416666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Fitters:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object gtQRDBText4: TQRDBText
        Left = 116
        Top = 31
        Width = 78
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          306.916666666666700000
          82.020833333333330000
          206.375000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Fitter_Name'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object gtQRLabel5: TQRLabel
        Left = 512
        Top = 29
        Width = 34
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1354.666666666667000000
          76.729166666666670000
          89.958333333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Date:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object gtQRDBText5: TQRDBText
        Left = 596
        Top = 29
        Width = 95
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1576.916666666667000000
          76.729166666666670000
          251.354166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Date_Required'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object gtQRShape7: TQRShape
        Left = 504
        Top = 22
        Width = 209
        Height = 5
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          13.229166666666670000
          1333.500000000000000000
          58.208333333333330000
          552.979166666666700000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRLabel1: TQRLabel
        Left = 512
        Top = 5
        Width = 63
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1354.666666666667000000
          13.229166666666670000
          166.687500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Job Type:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object gtQRDBText1: TQRDBText
        Left = 596
        Top = 5
        Width = 62
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1576.916666666667000000
          13.229166666666670000
          164.041666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Job_Type'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QRBand1: TQRBand
      Left = 38
      Top = 553
      Width = 718
      Height = 88
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
        232.833333333333300000
        1899.708333333333000000)
      BandType = rbPageFooter
      object gtQRShape8: TQRShape
        Left = 8
        Top = 5
        Width = 707
        Height = 52
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          137.583333333333300000
          21.166666666666670000
          13.229166666666670000
          1870.604166666667000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRMemo1: TQRMemo
        Left = 16
        Top = 8
        Width = 689
        Height = 41
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          108.479166666666700000
          42.333333333333330000
          21.166666666666670000
          1822.979166666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Lines.Strings = (
          
            'NOTE:  Pictures must be taken on site of every project and then ' +
            'e-mailed to Fiona (or send by "Whatsapp") to keep on record.  No' +
            ' excuses!!')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object gtQRSysData1: TgtQRSysData
        Left = 607
        Top = 64
        Width = 108
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1606.020833333333000000
          169.333333333333300000
          285.750000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
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
        FontSize = 8
      end
    end
  end
  object qryReport: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'SELECT DISTINCT'
      'Sales_Order.Sales_Order,'
      'Sales_Order.Customer,'
      'Sales_Order.Reference,'
      'Sales_Order.Contact_name,'
      'Sales_Order.Order_ref_no,'
      'Sales_Order.Install_Address,'
      'Sales_Order.Inactive,'
      'Sales_Order.Customer_Name,'
      'Sales_Order.Address,'
      'Sales_Order.Install_Name,'
      'Sales_Order.Install_Phone,'
      'Sales_Order.Descriptive_Reference,'
      'Sales_Order.Template_Date AS Date_Required,'
      'Sales_Order.Template_Date,'
      'Fitter.Fitter_Name,'
      'Sales_Order_Line.Job,'
      #39'Template'#39' as Job_Type'
      'FROM (Fitter'
      '  INNER JOIN Sales_Order'
      '    ON Fitter.Fitter = Sales_Order.Templater)'
      '  INNER JOIN Sales_Order_Line'
      '    ON Sales_Order.Sales_Order = Sales_Order_Line.Sales_Order'
      'WHERE ((Sales_Order.Templater = :Fitter) or (:Fitter = 0)) AND'
      '      (Sales_Order.Supply_Only <> '#39'Y'#39') AND'
      '      (Sales_Order.Sales_Order_Status < 50) AND'
      
        '      ((Sales_Order.Template_Date >= :Date_From) AND (Sales_Orde' +
        'r.Template_Date <= :Date_To))'
      'UNION ALL'
      'SELECT DISTINCT'
      'Sales_Order.Sales_Order,'
      'Sales_Order.Customer,'
      'Sales_Order.Reference,'
      'Sales_Order.Contact_name,'
      'Sales_Order.Order_ref_no,'
      'Sales_Order.Install_Address,'
      'Sales_Order.Inactive,'
      'Sales_Order.Customer_Name,'
      'Sales_Order.Address,'
      'Sales_Order.Install_Name,'
      'Sales_Order.Install_Phone,'
      'Sales_Order.Descriptive_Reference,'
      'Sales_Order.Date_Required,'
      'Sales_Order.Template_Date,'
      'Fitter.Fitter_Name,'
      'Sales_Order_Line.Job,'
      #39'Fitting'#39' as Job_Type'
      'FROM (Fitter'
      '  INNER JOIN Sales_Order'
      '    ON Fitter.Fitter = Sales_Order.Fitter)'
      '  INNER JOIN Sales_Order_Line'
      '    ON Sales_Order.Sales_Order = Sales_Order_Line.Sales_Order'
      'WHERE ((Sales_Order.Templater = :Fitter) or (:Fitter = 0)) AND'
      '      (Sales_Order.Supply_Only <> '#39'Y'#39') AND'
      
        '      ((Sales_Order.Sales_Order_Status >= 50) AND (Sales_Order.S' +
        'ales_Order_Status < 100)) AND'
      
        '      ((Sales_Order.Date_Required >= :Date_From) AND (Sales_Orde' +
        'r.Date_Required <= :Date_To))'
      'UNION ALL'
      'SELECT DISTINCT'
      'Sales_Order.Sales_Order,'
      'Sales_Order.Customer,'
      'Sales_Order.Reference,'
      'Sales_Order.Contact_name,'
      'Sales_Order.Order_ref_no,'
      'Sales_Order.Install_Address,'
      'Sales_Order.Inactive,'
      'Sales_Order.Customer_Name,'
      'Sales_Order.Address,'
      'Sales_Order.Install_Name,'
      'Sales_Order.Install_Phone,'
      'Sales_Order.Descriptive_Reference,'
      'Sales_Order.Date_Required,'
      'Sales_Order.Template_Date,'
      'Fitter.Fitter_Name,'
      'Sales_Order_Line.Job,'
      #39'Supply Only'#39' as Job_Type'
      'FROM (Fitter'
      '  INNER JOIN Sales_Order'
      '    ON Fitter.Fitter = Sales_Order.Fitter)'
      '  INNER JOIN Sales_Order_Line'
      '    ON Sales_Order.Sales_Order = Sales_Order_Line.Sales_Order'
      'WHERE ((Sales_Order.Templater = :Fitter) or (:Fitter = 0)) AND'
      '      (Sales_Order.Supply_Only = '#39'Y'#39') AND'
      
        '      ((Sales_Order.Sales_Order_Status >= 10) AND (Sales_Order.S' +
        'ales_Order_Status < 100)) AND'
      
        '      ((Sales_Order.Date_Required >= :Date_From) AND (Sales_Orde' +
        'r.Date_Required <= :Date_To))'
      'ORDER BY Fitter_Name, Date_Required')
    Left = 430
    Top = 30
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Fitter'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Fitter'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_From'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_To'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Fitter'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Fitter'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_From'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_To'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Fitter'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Fitter'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_From'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_To'
        ParamType = ptUnknown
      end>
  end
  object dtsAddress: TDataSource
    Left = 718
    Top = 19
  end
  object qryAddress: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'select *'
      'from Address'
      'where Address = :Address')
    Left = 558
    Top = 27
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Address'
        ParamType = ptUnknown
      end>
  end
  object qryCustomer: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'SELECT'
      '      Customer,'
      '      Customer_name,'
      '      Street,'
      '      Locale,'
      '      Town_City,'
      '      postcode,'
      '      County_State,'
      '      Vat.Vat_Rate,'
      '      Telephone_Number,'
      '      Email_Address,'
      '      Credit_Status,'
      '      Payment_Terms.Payment_Terms_Description'
      'FROM Payment_Terms'
      '    RIGHT JOIN (Vat'
      '    INNER JOIN Customer'
      '      ON Vat.Vat = Customer.Vat)'
      '      ON Payment_Terms.Payment_Terms = Customer.Payment_Terms'
      'WHERE Customer = :Customer')
    Left = 486
    Top = 30
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Customer'
        ParamType = ptUnknown
      end>
  end
  object qryCompanyAddress: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'select Street,'
      'Locale,'
      'Town_City,'
      'County_State,'
      'Postcode,'
      'Telephone_number,'
      'Fax_Number, '
      'Company_Name,'
      'VAT_Number,'
      'Email_Address,'
      'Web_Address '
      'from Company')
    Left = 784
    Top = 17
  end
  object qryCompany: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'select * from company'
      'where company = 1')
    Left = 694
    Top = 7
  end
  object qrygetNotes: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'select *'
      'from Notes'
      'where notes_code = :Notes_Code'
      'order by notes_code, notes_line')
    Left = 622
    Top = 15
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Notes_Code'
        ParamType = ptUnknown
      end>
  end
end
