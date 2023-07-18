object frmwtRPJobSheet: TfrmwtRPJobSheet
  Left = 161
  Top = 18
  Width = 932
  Height = 679
  VertScrollBar.Position = 547
  Caption = 'frmwtRPJobSheet'
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
  object qrpJobSheet: TQuickRep
    Left = 64
    Top = -475
    Width = 794
    Height = 1123
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    BeforePrint = qrpJobSheetBeforePrint
    DataSet = qryReport
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Arial'
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
    ReportTitle = 'Job Sheet'
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsMaximized
    object qrgQuote: TQRGroup
      Left = 38
      Top = 1105
      Width = 718
      Height = 2
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = qrgQuoteBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        5.291666666666667000
        1899.708333333333000000)
      Expression = 'quote'
      Master = qrpJobSheet
      ReprintOnNewPage = False
    end
    object qrbPageHeader: TQRBand
      Left = 38
      Top = 38
      Width = 718
      Height = 1067
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Gill Sans MT'
      Font.Style = [fsBold]
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        2823.104166666667000000
        1899.708333333333000000)
      BandType = rbPageHeader
      object gtQRShape70: TgtQRShape
        Left = 418
        Top = 40
        Width = 297
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333330000
          1105.958333333333000000
          105.833333333333300000
          785.812500000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape16: TgtQRShape
        Left = 3
        Top = 124
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
          328.083333333333300000
          955.145833333333300000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape80: TgtQRShape
        Left = 3
        Top = 486
        Width = 462
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333330000
          7.937500000000000000
          1285.875000000000000000
          1222.375000000000000000)
        Pen.Width = 3
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape2: TgtQRShape
        Left = 2
        Top = 40
        Width = 297
        Height = 53
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          140.229166666666700000
          5.291666666666667000
          105.833333333333300000
          785.812500000000000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRDBText2: TgtQRDBText
        Left = 263
        Top = 45
        Width = 24
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          695.854166666666700000
          119.062500000000000000
          63.500000000000000000)
        Alignment = taRightJustify
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
      object QRLabel3: TgtQRLabel
        Left = 11
        Top = 45
        Width = 82
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          29.104166666666670000
          119.062500000000000000
          216.958333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Job Number:'
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
      object QRDBText4: TgtQRDBText
        Left = 120
        Top = 100
        Width = 58
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          58.208333333333330000
          317.500000000000000000
          264.583333333333300000
          153.458333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Reference'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel15: TgtQRLabel
        Left = 568
        Top = 102
        Width = 107
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          58.208333333333330000
          1502.833333333333000000
          269.875000000000000000
          283.104166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CLIENT CONTACT:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object gtQRShape1: TgtQRShape
        Left = 2
        Top = 64
        Width = 297
        Height = 4
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          10.583333333333330000
          5.291666666666667000
          169.333333333333300000
          785.812500000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape3: TgtQRShape
        Left = 103
        Top = 40
        Width = 9
        Height = 53
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          140.229166666666700000
          272.520833333333300000
          105.833333333333300000
          23.812500000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRLabel1: TgtQRLabel
        Left = 11
        Top = 72
        Width = 80
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          29.104166666666670000
          190.500000000000000000
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
      object gtQRDBText1: TgtQRDBText
        Left = 208
        Top = 72
        Width = 79
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          550.333333333333300000
          190.500000000000000000
          209.020833333333300000)
        Alignment = taRightJustify
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
      object gtQRShape15: TgtQRShape
        Left = 3
        Top = 100
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
          264.583333333333300000
          1886.479166666667000000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape17: TgtQRShape
        Left = 362
        Top = 124
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
          328.083333333333300000
          933.979166666666700000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel13: TgtQRLabel
        Left = 9
        Top = 104
        Width = 99
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          23.812500000000000000
          275.166666666666700000
          261.937500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Customer Name:'
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
      object gtQRDBText2: TgtQRDBText
        Left = 136
        Top = 104
        Width = 98
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          359.833333333333300000
          275.166666666666700000
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
      object gtQRShape19: TgtQRShape
        Left = 3
        Top = 148
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
          391.583333333333300000
          1886.479166666667000000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel16: TgtQRLabel
        Left = 427
        Top = 46
        Width = 78
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1129.770833333333000000
          121.708333333333300000
          206.375000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Fitting Date:'
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
      object gtQRLabel3: TgtQRLabel
        Left = 9
        Top = 127
        Width = 50
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          23.812500000000000000
          336.020833333333300000
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
      object qrlblContact: TgtQRLabel
        Left = 136
        Top = 127
        Width = 217
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          359.833333333333300000
          336.020833333333300000
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
      object gtQRLabel5: TgtQRLabel
        Left = 9
        Top = 152
        Width = 100
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          23.812500000000000000
          402.166666666666700000
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
      object gtQRDBText3: TgtQRDBText
        Left = 136
        Top = 152
        Width = 59
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          359.833333333333300000
          402.166666666666700000
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
      object gtQRDBText4: TgtQRDBText
        Left = 608
        Top = 46
        Width = 95
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1608.666666666667000000
          121.708333333333300000
          251.354166666666700000)
        Alignment = taRightJustify
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
      object gtQRShape9: TgtQRShape
        Left = 3
        Top = 172
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
          455.083333333333300000
          1886.479166666667000000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel22: TgtQRLabel
        Left = 9
        Top = 176
        Width = 70
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          23.812500000000000000
          465.666666666666700000
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
      object QRDBText5: TgtQRDBText
        Left = 136
        Top = 176
        Width = 569
        Height = 45
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          119.062500000000000000
          359.833333333333300000
          465.666666666666700000
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
      object QRShape35: TgtQRShape
        Left = 121
        Top = 100
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
          264.583333333333300000
          18.520833333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRLabel2: TgtQRLabel
        Left = 369
        Top = 128
        Width = 64
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          976.312500000000000000
          338.666666666666700000
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
      object gtQRShape4: TgtQRShape
        Left = 3
        Top = 283
        Width = 713
        Height = 198
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          523.875000000000000000
          7.937500000000000000
          748.770833333333300000
          1886.479166666667000000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel4: TgtQRLabel
        Left = 9
        Top = 322
        Width = 109
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          23.812500000000000000
          851.958333333333300000
          288.395833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Pattern Alignment:'
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
      object gtQRLabel7: TgtQRLabel
        Left = 9
        Top = 295
        Width = 322
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          23.812500000000000000
          780.520833333333300000
          851.958333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Colour Correct? Confirm with Production Sheet & State:'
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
      object gtQRLabel9: TgtQRLabel
        Left = 497
        Top = 265
        Width = 24
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1314.979166666667000000
          701.145833333333300000
          63.500000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'YES'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object gtQRLabel10: TgtQRLabel
        Left = 530
        Top = 265
        Width = 19
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1402.291666666667000000
          701.145833333333300000
          50.270833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NO'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object gtQRShape7: TgtQRShape
        Left = 500
        Top = 293
        Width = 20
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1322.916666666667000000
          775.229166666666700000
          52.916666666666670000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape18: TgtQRShape
        Left = 530
        Top = 293
        Width = 20
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1402.291666666667000000
          775.229166666666700000
          52.916666666666670000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel11: TgtQRLabel
        Left = 616
        Top = 265
        Width = 70
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1629.833333333333000000
          701.145833333333300000
          185.208333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'SIGNATURE'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object gtQRShape8: TgtQRShape
        Left = 591
        Top = 293
        Width = 121
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1563.687500000000000000
          775.229166666666700000
          320.145833333333300000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel12: TgtQRLabel
        Left = 558
        Top = 265
        Width = 20
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1476.375000000000000000
          701.145833333333300000
          52.916666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'N/A'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object gtQRShape6: TgtQRShape
        Left = 500
        Top = 320
        Width = 20
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1322.916666666667000000
          846.666666666666700000
          52.916666666666670000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape11: TgtQRShape
        Left = 530
        Top = 320
        Width = 20
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1402.291666666667000000
          846.666666666666700000
          52.916666666666670000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape12: TgtQRShape
        Left = 559
        Top = 320
        Width = 20
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1479.020833333333000000
          846.666666666666700000
          52.916666666666670000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape13: TgtQRShape
        Left = 591
        Top = 320
        Width = 121
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1563.687500000000000000
          846.666666666666700000
          320.145833333333300000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel14: TgtQRLabel
        Left = 9
        Top = 349
        Width = 139
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          23.812500000000000000
          923.395833333333300000
          367.770833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Thickness, please state'
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
      object gtQRShape14: TgtQRShape
        Left = 260
        Top = 347
        Width = 59
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          687.916666666666700000
          918.104166666666700000
          156.104166666666700000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape22: TgtQRShape
        Left = 591
        Top = 347
        Width = 121
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1563.687500000000000000
          918.104166666666700000
          320.145833333333300000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel15: TgtQRLabel
        Left = 9
        Top = 376
        Width = 133
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          23.812500000000000000
          994.833333333333300000
          351.895833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Cracks, are there any?'
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
      object gtQRShape23: TgtQRShape
        Left = 500
        Top = 374
        Width = 20
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1322.916666666667000000
          989.541666666666700000
          52.916666666666670000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape24: TgtQRShape
        Left = 530
        Top = 374
        Width = 20
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1402.291666666667000000
          989.541666666666700000
          52.916666666666670000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape26: TgtQRShape
        Left = 591
        Top = 374
        Width = 121
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1563.687500000000000000
          989.541666666666700000
          320.145833333333300000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel17: TgtQRLabel
        Left = 9
        Top = 403
        Width = 132
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          23.812500000000000000
          1066.270833333333000000
          349.250000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Natural mark or faults?'
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
      object gtQRLabel18: TgtQRLabel
        Left = 9
        Top = 430
        Width = 56
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          23.812500000000000000
          1137.708333333333000000
          148.166666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Upstands'
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
      object gtQRLabel19: TgtQRLabel
        Left = 9
        Top = 457
        Width = 126
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          23.812500000000000000
          1209.145833333333000000
          333.375000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Chopping board, Cut?'
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
      object gtQRShape27: TgtQRShape
        Left = 500
        Top = 455
        Width = 20
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1322.916666666667000000
          1203.854166666667000000
          52.916666666666670000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape28: TgtQRShape
        Left = 530
        Top = 455
        Width = 20
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1402.291666666667000000
          1203.854166666667000000
          52.916666666666670000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape29: TgtQRShape
        Left = 591
        Top = 455
        Width = 121
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1563.687500000000000000
          1203.854166666667000000
          320.145833333333300000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape30: TgtQRShape
        Left = 500
        Top = 401
        Width = 20
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1322.916666666667000000
          1060.979166666667000000
          52.916666666666670000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape31: TgtQRShape
        Left = 530
        Top = 401
        Width = 20
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1402.291666666667000000
          1060.979166666667000000
          52.916666666666670000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape32: TgtQRShape
        Left = 591
        Top = 401
        Width = 121
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1563.687500000000000000
          1060.979166666667000000
          320.145833333333300000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape5: TgtQRShape
        Left = 3
        Top = 514
        Width = 713
        Height = 206
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          545.041666666666700000
          7.937500000000000000
          1359.958333333333000000
          1886.479166666667000000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel6: TgtQRLabel
        Left = 9
        Top = 526
        Width = 201
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          23.812500000000000000
          1391.708333333333000000
          531.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Correct Edge Finish, Please state:'
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
      object gtQRLabel20: TgtQRLabel
        Left = 10
        Top = 491
        Width = 80
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          26.458333333333330000
          1299.104166666667000000
          211.666666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Polished By:'
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
      object gtQRShape35: TgtQRShape
        Left = 591
        Top = 524
        Width = 121
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1563.687500000000000000
          1386.416666666667000000
          320.145833333333300000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape37: TgtQRShape
        Left = 500
        Top = 551
        Width = 20
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1322.916666666667000000
          1457.854166666667000000
          52.916666666666670000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape38: TgtQRShape
        Left = 530
        Top = 551
        Width = 20
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1402.291666666667000000
          1457.854166666667000000
          52.916666666666670000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape40: TgtQRShape
        Left = 591
        Top = 551
        Width = 121
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1563.687500000000000000
          1457.854166666667000000
          320.145833333333300000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel21: TgtQRLabel
        Left = 9
        Top = 553
        Width = 208
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          23.812500000000000000
          1463.145833333333000000
          550.333333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'All edges polished as per template?'
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
      object gtQRShape41: TgtQRShape
        Left = 500
        Top = 580
        Width = 20
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1322.916666666667000000
          1534.583333333333000000
          52.916666666666670000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape42: TgtQRShape
        Left = 530
        Top = 580
        Width = 20
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1402.291666666667000000
          1534.583333333333000000
          52.916666666666670000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape43: TgtQRShape
        Left = 559
        Top = 580
        Width = 20
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1479.020833333333000000
          1534.583333333333000000
          52.916666666666670000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape44: TgtQRShape
        Left = 591
        Top = 580
        Width = 121
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1563.687500000000000000
          1534.583333333333000000
          320.145833333333300000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel22: TgtQRLabel
        Left = 9
        Top = 582
        Width = 204
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          23.812500000000000000
          1539.875000000000000000
          539.750000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Have all notch cut outs been done?'
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
      object gtQRLabel23: TgtQRLabel
        Left = 9
        Top = 638
        Width = 300
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          23.812500000000000000
          1688.041666666667000000
          793.750000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CHECK FOR CHIPS, SNIPS OR BURNS'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object gtQRLabel24: TgtQRLabel
        Left = 9
        Top = 666
        Width = 134
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          23.812500000000000000
          1762.125000000000000000
          354.541666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Upstand List checked?'
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
      object gtQRLabel25: TgtQRLabel
        Left = 9
        Top = 694
        Width = 215
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          23.812500000000000000
          1836.208333333333000000
          568.854166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Chopping board, polished and ready?'
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
      object gtQRShape49: TgtQRShape
        Left = 500
        Top = 692
        Width = 20
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.562500000000000000
          1322.916666666667000000
          1830.916666666667000000
          52.916666666666670000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape50: TgtQRShape
        Left = 530
        Top = 692
        Width = 20
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.562500000000000000
          1402.291666666667000000
          1830.916666666667000000
          52.916666666666670000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape51: TgtQRShape
        Left = 591
        Top = 692
        Width = 121
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.562500000000000000
          1563.687500000000000000
          1830.916666666667000000
          320.145833333333300000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape54: TgtQRShape
        Left = 591
        Top = 664
        Width = 121
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.562500000000000000
          1563.687500000000000000
          1756.833333333333000000
          320.145833333333300000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape55: TgtQRShape
        Left = 3
        Top = 751
        Width = 713
        Height = 230
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          608.541666666666700000
          7.937500000000000000
          1987.020833333333000000
          1886.479166666667000000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel26: TgtQRLabel
        Left = 9
        Top = 790
        Width = 185
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          23.812500000000000000
          2090.208333333333000000
          489.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Sink cut out in correct position?'
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
      object gtQRLabel27: TgtQRLabel
        Left = 9
        Top = 763
        Width = 100
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          23.812500000000000000
          2018.770833333333000000
          264.583333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Drop Drain Board'
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
      object gtQRShape56: TgtQRShape
        Left = 500
        Top = 761
        Width = 20
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1322.916666666667000000
          2013.479166666667000000
          52.916666666666670000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape57: TgtQRShape
        Left = 530
        Top = 761
        Width = 20
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1402.291666666667000000
          2013.479166666667000000
          52.916666666666670000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape58: TgtQRShape
        Left = 591
        Top = 761
        Width = 121
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1563.687500000000000000
          2013.479166666667000000
          320.145833333333300000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape60: TgtQRShape
        Left = 500
        Top = 788
        Width = 20
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1322.916666666667000000
          2084.916666666667000000
          52.916666666666670000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape61: TgtQRShape
        Left = 530
        Top = 788
        Width = 20
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1402.291666666667000000
          2084.916666666667000000
          52.916666666666670000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape63: TgtQRShape
        Left = 591
        Top = 788
        Width = 121
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1563.687500000000000000
          2084.916666666667000000
          320.145833333333300000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel28: TgtQRLabel
        Left = 9
        Top = 817
        Width = 164
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          23.812500000000000000
          2161.645833333333000000
          433.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Tap hole in correct position?'
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
      object gtQRShape64: TgtQRShape
        Left = 500
        Top = 815
        Width = 20
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1322.916666666667000000
          2156.354166666667000000
          52.916666666666670000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape65: TgtQRShape
        Left = 530
        Top = 815
        Width = 20
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1402.291666666667000000
          2156.354166666667000000
          52.916666666666670000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape67: TgtQRShape
        Left = 591
        Top = 815
        Width = 121
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1563.687500000000000000
          2156.354166666667000000
          320.145833333333300000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel29: TgtQRLabel
        Left = 9
        Top = 844
        Width = 101
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          23.812500000000000000
          2233.083333333333000000
          267.229166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Sink polished by:'
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
      object gtQRShape68: TgtQRShape
        Left = 208
        Top = 842
        Width = 256
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          550.333333333333300000
          2227.791666666667000000
          677.333333333333300000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape71: TgtQRShape
        Left = 591
        Top = 842
        Width = 121
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1563.687500000000000000
          2227.791666666667000000
          320.145833333333300000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel30: TgtQRLabel
        Left = 9
        Top = 871
        Width = 168
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          23.812500000000000000
          2304.520833333333000000
          444.500000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Drainer grooves polished by: '
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
      object gtQRLabel31: TgtQRLabel
        Left = 9
        Top = 898
        Width = 138
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          23.812500000000000000
          2375.958333333333000000
          365.125000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Hob in correct position?'
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
      object gtQRLabel32: TgtQRLabel
        Left = 9
        Top = 952
        Width = 120
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          23.812500000000000000
          2518.833333333333000000
          317.500000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Correct edge profile?'
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
      object gtQRShape72: TgtQRShape
        Left = 500
        Top = 923
        Width = 20
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1322.916666666667000000
          2442.104166666667000000
          52.916666666666670000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape73: TgtQRShape
        Left = 530
        Top = 923
        Width = 20
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1402.291666666667000000
          2442.104166666667000000
          52.916666666666670000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape74: TgtQRShape
        Left = 591
        Top = 923
        Width = 121
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1563.687500000000000000
          2442.104166666667000000
          320.145833333333300000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape75: TgtQRShape
        Left = 500
        Top = 896
        Width = 20
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1322.916666666667000000
          2370.666666666667000000
          52.916666666666670000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape76: TgtQRShape
        Left = 530
        Top = 896
        Width = 20
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1402.291666666667000000
          2370.666666666667000000
          52.916666666666670000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape77: TgtQRShape
        Left = 591
        Top = 896
        Width = 121
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1563.687500000000000000
          2370.666666666667000000
          320.145833333333300000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel33: TgtQRLabel
        Left = 9
        Top = 925
        Width = 166
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          23.812500000000000000
          2447.395833333333000000
          439.208333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'All shaping as per template?'
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
      object gtQRShape78: TgtQRShape
        Left = 3
        Top = 228
        Width = 214
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333330000
          7.937500000000000000
          603.250000000000000000
          566.208333333333300000)
        Pen.Width = 3
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape79: TgtQRShape
        Left = 3
        Top = 255
        Width = 214
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333330000
          7.937500000000000000
          674.687500000000000000
          566.208333333333300000)
        Pen.Width = 3
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel34: TgtQRLabel
        Left = 9
        Top = 232
        Width = 46
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          23.812500000000000000
          613.833333333333300000
          121.708333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Cut By:'
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
      object gtQRLabel35: TgtQRLabel
        Left = 9
        Top = 259
        Width = 76
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          23.812500000000000000
          685.270833333333300000
          201.083333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Stacked By:'
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
      object gtQRLabel8: TgtQRLabel
        Left = 209
        Top = 349
        Width = 41
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          552.979166666666700000
          923.395833333333300000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Joint A'
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
      object gtQRLabel36: TgtQRLabel
        Left = 337
        Top = 349
        Width = 41
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          891.645833333333300000
          923.395833333333300000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Joint B'
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
      object gtQRShape10: TgtQRShape
        Left = 388
        Top = 347
        Width = 59
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1026.583333333333000000
          918.104166666666700000
          156.104166666666700000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel37: TgtQRLabel
        Left = 472
        Top = 349
        Width = 41
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1248.833333333333000000
          923.395833333333300000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Joint C'
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
      object gtQRShape20: TgtQRShape
        Left = 522
        Top = 347
        Width = 59
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1381.125000000000000000
          918.104166666666700000
          156.104166666666700000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel38: TgtQRLabel
        Left = 209
        Top = 430
        Width = 42
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          552.979166666666700000
          1137.708333333333000000
          111.125000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Height:'
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
      object gtQRShape21: TgtQRShape
        Left = 260
        Top = 428
        Width = 96
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          687.916666666666700000
          1132.416666666667000000
          254.000000000000000000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel39: TgtQRLabel
        Left = 433
        Top = 430
        Width = 50
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1145.645833333333000000
          1137.708333333333000000
          132.291666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Amount:'
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
      object gtQRShape25: TgtQRShape
        Left = 500
        Top = 428
        Width = 96
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1322.916666666667000000
          1132.416666666667000000
          254.000000000000000000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel40: TgtQRLabel
        Left = 497
        Top = 496
        Width = 24
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1314.979166666667000000
          1312.333333333333000000
          63.500000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'YES'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object gtQRLabel41: TgtQRLabel
        Left = 530
        Top = 496
        Width = 19
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1402.291666666667000000
          1312.333333333333000000
          50.270833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NO'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object gtQRLabel42: TgtQRLabel
        Left = 558
        Top = 496
        Width = 20
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1476.375000000000000000
          1312.333333333333000000
          52.916666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'N/A'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object gtQRLabel43: TgtQRLabel
        Left = 616
        Top = 496
        Width = 70
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1629.833333333333000000
          1312.333333333333000000
          185.208333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'SIGNATURE'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object gtQRShape36: TgtQRShape
        Left = 263
        Top = 524
        Width = 202
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          695.854166666666700000
          1386.416666666667000000
          534.458333333333300000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel44: TgtQRLabel
        Left = 9
        Top = 612
        Width = 139
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          23.812500000000000000
          1619.250000000000000000
          367.770833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Thickness, please state'
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
      object gtQRLabel45: TgtQRLabel
        Left = 209
        Top = 612
        Width = 41
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          552.979166666666700000
          1619.250000000000000000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Joint A'
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
      object gtQRShape33: TgtQRShape
        Left = 260
        Top = 610
        Width = 59
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          687.916666666666700000
          1613.958333333333000000
          156.104166666666700000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel46: TgtQRLabel
        Left = 337
        Top = 612
        Width = 41
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          891.645833333333300000
          1619.250000000000000000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Joint B'
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
      object gtQRShape34: TgtQRShape
        Left = 388
        Top = 610
        Width = 59
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1026.583333333333000000
          1613.958333333333000000
          156.104166666666700000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel47: TgtQRLabel
        Left = 472
        Top = 612
        Width = 41
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1248.833333333333000000
          1619.250000000000000000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Joint C'
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
      object gtQRShape39: TgtQRShape
        Left = 522
        Top = 610
        Width = 59
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1381.125000000000000000
          1613.958333333333000000
          156.104166666666700000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape81: TgtQRShape
        Left = 591
        Top = 610
        Width = 121
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1563.687500000000000000
          1613.958333333333000000
          320.145833333333300000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape45: TgtQRShape
        Left = 556
        Top = 664
        Width = 20
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.562500000000000000
          1471.083333333333000000
          1756.833333333333000000
          52.916666666666670000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel48: TgtQRLabel
        Left = 209
        Top = 666
        Width = 42
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          552.979166666666700000
          1762.125000000000000000
          111.125000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Height:'
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
      object gtQRShape46: TgtQRShape
        Left = 260
        Top = 664
        Width = 61
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.562500000000000000
          687.916666666666700000
          1756.833333333333000000
          161.395833333333300000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel49: TgtQRLabel
        Left = 337
        Top = 666
        Width = 44
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          891.645833333333300000
          1762.125000000000000000
          116.416666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Length:'
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
      object gtQRShape47: TgtQRShape
        Left = 388
        Top = 664
        Width = 61
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.562500000000000000
          1026.583333333333000000
          1756.833333333333000000
          161.395833333333300000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape48: TgtQRShape
        Left = 591
        Top = 638
        Width = 121
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1563.687500000000000000
          1688.041666666667000000
          320.145833333333300000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape52: TgtQRShape
        Left = 3
        Top = 724
        Width = 462
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333330000
          7.937500000000000000
          1915.583333333333000000
          1222.375000000000000000)
        Pen.Width = 3
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel50: TgtQRLabel
        Left = 10
        Top = 729
        Width = 111
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          26.458333333333330000
          1928.812500000000000000
          293.687500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CNC & CUT OUTS'
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
      object gtQRLabel51: TgtQRLabel
        Left = 497
        Top = 734
        Width = 24
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1314.979166666667000000
          1942.041666666667000000
          63.500000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'YES'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object gtQRLabel52: TgtQRLabel
        Left = 530
        Top = 734
        Width = 19
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1402.291666666667000000
          1942.041666666667000000
          50.270833333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NO'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object gtQRLabel53: TgtQRLabel
        Left = 558
        Top = 734
        Width = 20
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1476.375000000000000000
          1942.041666666667000000
          52.916666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'N/A'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object gtQRLabel54: TgtQRLabel
        Left = 616
        Top = 734
        Width = 70
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1629.833333333333000000
          1942.041666666667000000
          185.208333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'SIGNATURE'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object gtQRShape53: TgtQRShape
        Left = 384
        Top = 869
        Width = 80
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1016.000000000000000000
          2299.229166666667000000
          211.666666666666700000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel55: TgtQRLabel
        Left = 225
        Top = 898
        Width = 142
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          595.312500000000000000
          2375.958333333333000000
          375.708333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'State Hob Cut Out Size:'
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
      object gtQRShape59: TgtQRShape
        Left = 368
        Top = 896
        Width = 96
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.562500000000000000
          973.666666666666700000
          2370.666666666667000000
          254.000000000000000000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape62: TgtQRShape
        Left = 500
        Top = 950
        Width = 20
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1322.916666666667000000
          2513.541666666667000000
          52.916666666666670000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape66: TgtQRShape
        Left = 530
        Top = 950
        Width = 20
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1402.291666666667000000
          2513.541666666667000000
          52.916666666666670000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape69: TgtQRShape
        Left = 591
        Top = 950
        Width = 121
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1563.687500000000000000
          2513.541666666667000000
          320.145833333333300000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape82: TgtQRShape
        Left = 527
        Top = 40
        Width = 9
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333330000
          1394.354166666667000000
          105.833333333333300000
          23.812500000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRShape83: TgtQRShape
        Left = 3
        Top = 984
        Width = 713
        Height = 73
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          193.145833333333300000
          7.937500000000000000
          2603.500000000000000000
          1886.479166666667000000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel56: TgtQRLabel
        Left = 233
        Top = 694
        Width = 201
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          616.479166666666700000
          1836.208333333333000000
          531.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'If not ready, Job doesn'#39't go out!'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object gtQRShape84: TgtQRShape
        Left = 500
        Top = 664
        Width = 20
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.562500000000000000
          1322.916666666667000000
          1756.833333333333000000
          52.916666666666670000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape85: TgtQRShape
        Left = 530
        Top = 664
        Width = 20
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.562500000000000000
          1402.291666666667000000
          1756.833333333333000000
          52.916666666666670000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel57: TgtQRLabel
        Left = 287
        Top = 954
        Width = 78
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          759.354166666666700000
          2524.125000000000000000
          206.375000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Please state:'
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
      object gtQRShape86: TgtQRShape
        Left = 368
        Top = 952
        Width = 96
        Height = 21
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          55.562500000000000000
          973.666666666666700000
          2518.833333333333000000
          254.000000000000000000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel58: TgtQRLabel
        Left = 9
        Top = 998
        Width = 358
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          23.812500000000000000
          2640.541666666667000000
          947.208333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Half deposit required. If not ticked, DO NOT cut!'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object gtQRShape87: TgtQRShape
        Left = 484
        Top = 998
        Width = 20
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1280.583333333333000000
          2640.541666666667000000
          52.916666666666670000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel59: TgtQRLabel
        Left = 9
        Top = 1028
        Width = 106
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          23.812500000000000000
          2719.916666666667000000
          280.458333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Signed Paperwork'
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
      object gtQRLabel60: TgtQRLabel
        Left = 199
        Top = 1030
        Width = 60
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          526.520833333333300000
          2725.208333333333000000
          158.750000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Received'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object gtQRShape88: TgtQRShape
        Left = 276
        Top = 1028
        Width = 20
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          730.250000000000000000
          2719.916666666667000000
          52.916666666666670000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel61: TgtQRLabel
        Left = 343
        Top = 1030
        Width = 126
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          907.520833333333300000
          2725.208333333333000000
          333.375000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Sent with templater'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object gtQRShape89: TgtQRShape
        Left = 484
        Top = 1028
        Width = 20
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1280.583333333333000000
          2719.916666666667000000
          52.916666666666670000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel62: TgtQRLabel
        Left = 551
        Top = 998
        Width = 84
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1457.854166666667000000
          2640.541666666667000000
          222.250000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Not Required'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object gtQRShape90: TgtQRShape
        Left = 644
        Top = 996
        Width = 20
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1703.916666666667000000
          2635.250000000000000000
          52.916666666666670000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape91: TgtQRShape
        Left = 500
        Top = 638
        Width = 20
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1322.916666666667000000
          1688.041666666667000000
          52.916666666666670000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape92: TgtQRShape
        Left = 530
        Top = 638
        Width = 20
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1402.291666666667000000
          1688.041666666667000000
          52.916666666666670000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape93: TgtQRShape
        Left = 591
        Top = 869
        Width = 121
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1563.687500000000000000
          2299.229166666667000000
          320.145833333333300000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape2: TgtQRShape
        Left = 418
        Top = 64
        Width = 297
        Height = 4
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          10.583333333333330000
          1105.958333333333000000
          169.333333333333300000
          785.812500000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRLabel63: TgtQRLabel
        Left = 563
        Top = 73
        Width = 111
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1489.604166666667000000
          193.145833333333300000
          293.687500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'READY TO GO'
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
      object gtQRShape94: TgtQRShape
        Left = 692
        Top = 73
        Width = 20
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1830.916666666667000000
          193.145833333333300000
          52.916666666666670000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrlblYourPhone: TgtQRLabel
        Left = 637
        Top = 128
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
          338.666666666666700000
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
      object gtQRShape95: TgtQRShape
        Left = 215
        Top = 228
        Width = 278
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333330000
          568.854166666666700000
          603.250000000000000000
          735.541666666666700000)
        Pen.Width = 3
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel64: TgtQRLabel
        Left = 221
        Top = 233
        Width = 158
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          584.729166666666700000
          616.479166666666700000
          418.041666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Stock Sheet Completed?'
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
      object gtQRShape96: TgtQRShape
        Left = 417
        Top = 229
        Width = 20
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.854166666666670000
          1103.312500000000000000
          605.895833333333300000
          52.916666666666670000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel65: TgtQRLabel
        Left = 389
        Top = 233
        Width = 23
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1029.229166666667000000
          616.479166666666700000
          60.854166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'YES'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object gtQRLabel66: TgtQRLabel
        Left = 446
        Top = 233
        Width = 18
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1180.041666666667000000
          616.479166666666700000
          47.625000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NO'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object gtQRShape97: TgtQRShape
        Left = 473
        Top = 229
        Width = 20
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.854166666666670000
          1251.479166666667000000
          605.895833333333300000
          52.916666666666670000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape98: TgtQRShape
        Left = 215
        Top = 255
        Width = 278
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333330000
          568.854166666666700000
          674.687500000000000000
          735.541666666666700000)
        Pen.Width = 3
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel67: TgtQRLabel
        Left = 222
        Top = 259
        Width = 95
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          587.375000000000000000
          685.270833333333300000
          251.354166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Slab Batch No:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object gtQRLabel68: TgtQRLabel
        Left = 176
        Top = 871
        Width = 206
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          465.666666666666700000
          2304.520833333333000000
          545.041666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '- (MUST BE DEEP & NOT SHARP)'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QRLabel1: TgtQRLabel
      Left = 138
      Top = 29
      Width = 528
      Height = 43
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        113.770833333333300000
        365.125000000000000000
        76.729166666666670000
        1397.000000000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Workshop Quality Control Sheet'
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
  end
  object qryReport: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select  Job.*,'
      '        Operator.Operator_Name,'
      '        (select Sales_order'
      '         from Sales_Order_Line'
      '         where sales_order_line.Job = Job.Job) as Sales_Order'
      'from Job, Operator'
      'where Job = :Job and'
      'Job.Operator = Operator.Operator')
    Left = 43
    Top = 6
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Job'
        ParamType = ptUnknown
      end>
  end
  object qryQElements: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select Quote_element.*, '
      'worktop.description,'
      'Thickness.Thickness_mm'
      'from Quote_element, Worktop, thickness'
      'where Quote = :Quote and'
      'Quote_Element.Worktop = Worktop.Worktop and'
      'Quote_Element.Thickness = Thickness.Thickness'
      'Order By Element_number')
    Left = 208
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Quote'
        ParamType = ptUnknown
      end>
  end
  object dtsReport: TDataSource
    DataSet = qryReport
    Left = 88
    Top = 8
  end
  object qryQCutOuts: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select Quote_CutOut.*, CutOut.Description'
      'from Quote_CutOut, CutOut'
      'where Quote = :Quote and'
      'Quote_CutOut.CutOut = CutOut.CutOut')
    Left = 270
    Top = 6
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Quote'
        ParamType = ptUnknown
      end>
  end
  object qryQEdges: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Quote_Edge.*, Edge_Profile.Description'
      'from Quote_Edge, Edge_Profile'
      'where Quote = :Quote and'
      'Quote_Edge.Edge_Profile = Edge_Profile.Edge_Profile'
      'order by Edge_number')
    Left = 342
    Top = 6
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Quote'
        ParamType = ptUnknown
      end>
  end
  object qryQExtras: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select Quote_Extra.*, Extra_Charge.Description'
      'from Quote_Extra, Extra_Charge'
      'where Quote = :Quote and'
      'Quote_Extra.Extra_Charge = Extra_Charge.Extra_Charge')
    Left = 662
    Top = 17
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Quote'
        ParamType = ptUnknown
      end>
  end
  object qryAddress: TFDQuery
    ConnectionName = 'WT'
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
  object qryCustomer: TFDQuery
    ConnectionName = 'WT'
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
  object qryCompany: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * from company'
      'where company = 1')
    Left = 525
    Top = 7
  end
  object qrygetNotes: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from Notes'
      'where notes_code = :Notes_Code')
    Left = 478
    Top = 13
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Notes_Code'
        ParamType = ptUnknown
      end>
  end
  object qryCompanyAddress: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select Company_Name,'
      'Street,'
      'Locale,'
      'Town_City,'
      'County_State,'
      'Postcode,'
      'Telephone_number,'
      'Fax_Number '
      'from Company')
    Left = 824
    Top = 9
  end
end
