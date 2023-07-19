object frmWTRPJobCutSched: TfrmWTRPJobCutSched
  Left = 223
  Top = 106
  Width = 897
  Height = 718
  Caption = 'Cutting Schedule'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object qrpCutSchedule: TQuickRep
    Left = 16
    Top = 32
    Width = 794
    Height = 1123
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    BeforePrint = qrpCutScheduleBeforePrint
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
    ReportTitle = 'Cutting Schedule'
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsMaximized
    object qrgJob: TQRGroup
      Left = 38
      Top = 369
      Width = 718
      Height = 0
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = qrgJobAfterPrint
      AlignToBottom = False
      BeforePrint = qrgJobBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        0.000000000000000000
        1899.708333333333000000)
      Expression = 'Job'
      Master = qrpCutSchedule
      ReprintOnNewPage = False
    end
    object qrsdElement: TQRSubDetail
      Left = 38
      Top = 369
      Width = 718
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      BeforePrint = qrsdElementBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        55.562500000000000000
        1899.708333333333000000)
      Master = qrpCutSchedule
      DataSet = qryJElements
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText6: TQRDBText
        Left = 416
        Top = 0
        Width = 313
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1100.666666666667000000
          0.000000000000000000
          828.145833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qryJElements
        DataField = 'description'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText5: TQRDBText
        Left = 317
        Top = 0
        Width = 89
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          838.729166666666700000
          0.000000000000000000
          235.479166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryJElements
        DataField = 'Thickness_mm'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText4: TQRDBText
        Left = 315
        Top = 0
        Width = 35
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          833.437500000000000000
          0.000000000000000000
          92.604166666666670000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryJElements
        DataField = 'Depth'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText3: TQRDBText
        Left = 254
        Top = 0
        Width = 40
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          672.041666666666700000
          0.000000000000000000
          105.833333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryJElements
        DataField = 'Length'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText2: TQRDBText
        Left = 186
        Top = 0
        Width = 50
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          492.125000000000000000
          0.000000000000000000
          132.291666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryJElements
        DataField = 'Quantity'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRShape1: TQRShape
        Left = 38
        Top = 0
        Width = 2
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          100.541666666666700000
          0.000000000000000000
          5.291666666666667000)
        Pen.Width = 2
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape2: TQRShape
        Left = 242
        Top = 0
        Width = 6
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          640.291666666666800000
          0.000000000000000000
          15.875000000000000000)
        Pen.Width = 2
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape3: TQRShape
        Left = 204
        Top = 0
        Width = 6
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          539.750000000000000000
          0.000000000000000000
          15.875000000000000000)
        Pen.Width = 2
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape4: TQRShape
        Left = 299
        Top = 0
        Width = 6
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          791.104166666666800000
          0.000000000000000000
          15.875000000000000000)
        Pen.Width = 2
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape6: TQRShape
        Left = 356
        Top = 0
        Width = 6
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          941.916666666666800000
          0.000000000000000000
          15.875000000000000000)
        Pen.Width = 2
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape8: TQRShape
        Left = 408
        Top = 0
        Width = 6
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1079.500000000000000000
          0.000000000000000000
          15.875000000000000000)
        Pen.Width = 2
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object qrlblCount: TQRLabel
        Left = -26
        Top = 0
        Width = 59
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          -68.791666666666670000
          0.000000000000000000
          156.104166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblCount'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlblDescription: TQRLabel
        Left = 48
        Top = 0
        Width = 145
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          127.000000000000000000
          0.000000000000000000
          383.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'qrlblDescription'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QRBand1: TQRBand
      Left = 38
      Top = 38
      Width = 718
      Height = 331
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        875.770833333333300000
        1899.708333333333000000)
      BandType = rbPageHeader
      object gtQRShape15: TQRShape
        Left = 3
        Top = 142
        Width = 713
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333330000
          7.937500000000000000
          375.708333333333300000
          1886.479166666667000000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape19: TQRShape
        Left = 3
        Top = 190
        Width = 713
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333330000
          7.937500000000000000
          502.708333333333300000
          1886.479166666667000000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape17: TQRShape
        Left = 362
        Top = 166
        Width = 353
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333330000
          957.791666666666700000
          439.208333333333300000
          933.979166666666700000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape1: TQRShape
        Left = 416
        Top = 57
        Width = 297
        Height = 80
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          211.666666666666700000
          1100.666666666667000000
          150.812500000000000000
          785.812500000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel1: TQRLabel
        Left = 432
        Top = 1
        Width = 282
        Height = 43
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          113.770833333333300000
          1143.000000000000000000
          2.645833333333333000
          746.125000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Cutting Schedule'
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
      object QRLabel2: TQRLabel
        Left = 8
        Top = 146
        Width = 61
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          386.291666666666700000
          161.395833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Customer:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText1: TQRDBText
        Left = 134
        Top = 146
        Width = 98
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          354.541666666666700000
          386.291666666666700000
          259.291666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Customer_Name'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel3: TQRLabel
        Left = 4
        Top = 309
        Width = 34
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          10.583333333333330000
          817.562500000000000000
          89.958333333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Panel'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel4: TQRLabel
        Left = 48
        Top = 309
        Width = 66
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          127.000000000000000000
          817.562500000000000000
          174.625000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Description'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel5: TQRLabel
        Left = 214
        Top = 309
        Width = 22
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          566.208333333333300000
          817.562500000000000000
          58.208333333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Qty'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel6: TQRLabel
        Left = 256
        Top = 309
        Width = 40
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          677.333333333333300000
          817.562500000000000000
          105.833333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Length'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel8: TQRLabel
        Left = 315
        Top = 309
        Width = 35
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          833.437500000000000000
          817.562500000000000000
          92.604166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Depth'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel10: TQRLabel
        Left = 368
        Top = 309
        Width = 32
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          973.666666666666700000
          817.562500000000000000
          84.666666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Thick'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel11: TQRLabel
        Left = 416
        Top = 309
        Width = 47
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1100.666666666667000000
          817.562500000000000000
          124.354166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Material'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlblDateRequired: TQRLabel
        Left = 603
        Top = 115
        Width = 103
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1595.437500000000000000
          304.270833333333300000
          272.520833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblDateRequired'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlblJobNumber: TQRLabel
        Left = 603
        Top = 60
        Width = 103
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1595.437500000000000000
          158.750000000000000000
          272.520833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblJobNumber'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlblSalesOrder: TQRLabel
        Left = 616
        Top = 86
        Width = 90
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1629.833333333333000000
          227.541666666666700000
          238.125000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblSalesOrder'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel13: TQRLabel
        Left = 4
        Top = 281
        Width = 77
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          10.583333333333330000
          743.479166666666700000
          203.729166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CUTTING '
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object gtQRShape2: TQRShape
        Left = 416
        Top = 79
        Width = 297
        Height = 5
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          13.229166666666670000
          1100.666666666667000000
          209.020833333333300000
          785.812500000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape3: TQRShape
        Left = 416
        Top = 108
        Width = 297
        Height = 5
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          13.229166666666670000
          1100.666666666667000000
          285.750000000000000000
          785.812500000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRLabel1: TQRLabel
        Left = 425
        Top = 61
        Width = 82
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1124.479166666667000000
          161.395833333333300000
          216.958333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Job Number:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object gtQRLabel2: TQRLabel
        Left = 425
        Top = 116
        Width = 72
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1124.479166666667000000
          306.916666666666700000
          190.500000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Fitting Date:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object gtQRLabel3: TQRLabel
        Left = 425
        Top = 87
        Width = 74
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1124.479166666667000000
          230.187500000000000000
          195.791666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Sales Order:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object gtQRShape16: TQRShape
        Left = 3
        Top = 166
        Width = 361
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333330000
          7.937500000000000000
          439.208333333333300000
          955.145833333333300000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel5: TQRLabel
        Left = 8
        Top = 170
        Width = 50
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          449.791666666666700000
          132.291666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Contact:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlblContact: TQRLabel
        Left = 134
        Top = 169
        Width = 217
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          354.541666666666700000
          447.145833333333300000
          574.145833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'qrlblContact'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object gtQRLabel6: TQRLabel
        Left = 377
        Top = 170
        Width = 64
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          997.479166666666700000
          449.791666666666700000
          169.333333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Telephone:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlblYourPhone: TQRLabel
        Left = 637
        Top = 170
        Width = 69
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1685.395833333333000000
          449.791666666666700000
          182.562500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Your Phone'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object gtQRLabel7: TQRLabel
        Left = 8
        Top = 194
        Width = 100
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          513.291666666666700000
          264.583333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Client Reference:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object gtQRDBText3: TQRDBText
        Left = 134
        Top = 193
        Width = 59
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          354.541666666666700000
          510.645833333333300000
          156.104166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Reference'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object gtQRShape9: TQRShape
        Left = 3
        Top = 214
        Width = 713
        Height = 53
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          140.229166666666700000
          7.937500000000000000
          566.208333333333300000
          1886.479166666667000000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel8: TQRLabel
        Left = 8
        Top = 218
        Width = 70
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          576.791666666666700000
          185.208333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Description:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object gtQRDBText1: TQRDBText
        Left = 134
        Top = 218
        Width = 569
        Height = 45
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          119.062500000000000000
          354.541666666666700000
          576.791666666666700000
          1505.479166666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Description'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object gtQRShape4: TQRShape
        Left = 541
        Top = 57
        Width = 9
        Height = 80
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          211.666666666666700000
          1431.395833333333000000
          150.812500000000000000
          23.812500000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRShape35: TQRShape
        Left = 121
        Top = 142
        Width = 7
        Height = 124
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          328.083333333333300000
          320.145833333333300000
          375.708333333333300000
          18.520833333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
    end
    object QRBand2: TQRBand
      Left = 38
      Top = 390
      Width = 718
      Height = 243
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
        642.937500000000000000
        1899.708333333333000000)
      BandType = rbPageFooter
      object gtQRShape5: TQRShape
        Left = 4
        Top = 31
        Width = 229
        Height = 170
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          449.791666666666700000
          10.583333333333330000
          82.020833333333330000
          605.895833333333300000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRSysData1: TgtQRSysData
        Left = 594
        Top = 218
        Width = 120
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1571.625000000000000000
          576.791666666666700000
          317.500000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsDateTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = 'Date Printed: '
        Transparent = False
        FontSize = 8
      end
      object gtQRLabel4: TQRLabel
        Left = 5
        Top = 12
        Width = 63
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          13.229166666666670000
          31.750000000000000000
          166.687500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Installation'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object qrmSiteAddress: TQRMemo
        Left = 8
        Top = 36
        Width = 217
        Height = 157
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          415.395833333333300000
          21.166666666666670000
          95.250000000000000000
          574.145833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object gtQRShape6: TQRShape
        Left = 248
        Top = 31
        Width = 465
        Height = 170
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          449.791666666666700000
          656.166666666666700000
          82.020833333333330000
          1230.312500000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel9: TQRLabel
        Left = 253
        Top = 12
        Width = 70
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          669.395833333333300000
          31.750000000000000000
          185.208333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Order Notes'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object qrrchTextNotes: TQRRichText
        Left = 255
        Top = 40
        Width = 450
        Height = 153
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          404.812500000000000000
          674.687500000000000000
          105.833333333333300000
          1190.625000000000000000)
        Alignment = taLeftJustify
        AutoStretch = False
        Color = clWindow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
      end
    end
  end
  object qryReport: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'select Job.*,'
      '        Customer.Customer_Name,'
      '        (select Sales_order'
      '         from Sales_Order_Line'
      '         where sales_order_line.Job = Job.Job) as Sales_Order,'
      '        (select Sales_order.Extra_Notes'
      '         from Sales_Order_Line, sales_order'
      '         where sales_order_line.Job = Job.Job AND'
      
        '                     sales_order_line.sales_order = sales_order.' +
        'sales_order) as Sales_Order_Extra_Notes'
      'from Job, Customer'
      'where Job = :Job and'
      'Job.Customer = Customer.Customer')
    Left = 160
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job'
        ParamType = ptUnknown
      end>
  end
  object dtsReport: TDataSource
    DataSet = qryReport
    Left = 216
    Top = 16
  end
  object qryJElements: TQuery
    DatabaseName = 'WT'
    DataSource = dtsReport
    SQL.Strings = (
      'SELECT  Job_Element.*,'
      '        Thickness.Thickness_mm,'
      '        Worktop.Description,'
      '        Material_Use.Use_Description'
      'FROM Thickness'
      '      INNER JOIN (Worktop'
      '      INNER JOIN (Worktop_thickness'
      '      INNER JOIN (Material_Use'
      '      RIGHT JOIN Job_Element'
      '        ON Material_Use.Material_Use = Job_Element.Material_Use)'
      
        '        ON (Worktop_thickness.Thickness = Job_Element.Thickness)' +
        ' AND (Worktop_thickness.Worktop = Job_Element.Worktop))'
      '        ON Worktop.Worktop = Worktop_thickness.Worktop)'
      '        ON Thickness.Thickness = Worktop_thickness.Thickness'
      'where Job = :Job'
      'Order By Element_number')
    Left = 488
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Job'
        ParamType = ptUnknown
      end>
  end
  object qryUpJStatus: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'update Job'
      'set Job_status = :Job_Status'
      'where Job = :Job')
    Left = 77
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Job'
        ParamType = ptUnknown
      end>
  end
  object qryUpSOStatus: TQuery
    DatabaseName = 'wt'
    Left = 77
    Top = 16
  end
  object qrygetNotes: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'select *'
      'from Notes'
      'where notes_code = :Notes_Code')
    Left = 414
    Top = 13
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Notes_Code'
        ParamType = ptUnknown
      end>
  end
  object qryCustomer: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'select Customer, Customer_name,'
      'Street,'
      'Locale,'
      'Town_City,'
      'postcode,'
      'County_State,'
      'Telephone_Number,'
      'Vat_Rate'
      'from Customer, VAT'
      'where Customer = :Customer and'
      'Customer.VAT = Vat.Vat')
    Left = 718
    Top = 14
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end>
  end
  object dtsAddress: TDataSource
    Left = 582
    Top = 11
  end
  object qryAddress: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'select *'
      'from Address'
      'where Address = :Address')
    Left = 414
    Top = 11
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Address'
        ParamType = ptUnknown
      end>
  end
end
