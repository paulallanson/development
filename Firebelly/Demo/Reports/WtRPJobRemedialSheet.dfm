object frmwtRPJobRemedialSheet: TfrmwtRPJobRemedialSheet
  Left = 41
  Top = 104
  Width = 1298
  Height = 759
  Caption = 'frmwtRPJobRemedialSheet'
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
  object qrpJobSheet: TQuickRep
    Left = 216
    Top = 50
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
    Font.Height = -13
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
    ReportTitle = 'Job Fitting Sheet'
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsMaximized
    object qrgQuote: TQRGroup
      Left = 38
      Top = 38
      Width = 718
      Height = 1035
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = qrgQuoteAfterPrint
      AlignToBottom = False
      BeforePrint = qrgQuoteBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        2738.437500000000000000
        1899.708333333333000000)
      Expression = 'quote'
      Master = qrpJobSheet
      ReprintOnNewPage = False
      object gtQRShape4: TgtQRShape
        Left = 3
        Top = 145
        Width = 713
        Height = 32
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          84.666666666666670000
          7.937500000000000000
          383.645833333333300000
          1886.479166666667000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrlblSOCaption: TgtQRLabel
        Left = 424
        Top = -5
        Width = 294
        Height = 86
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          227.541666666666700000
          1121.833333333333000000
          -13.229166666666670000
          777.875000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'REMEDIAL SHEET'
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
      object gtQRShape1: TgtQRShape
        Left = 504
        Top = 81
        Width = 212
        Height = 56
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          148.166666666666700000
          1333.500000000000000000
          214.312500000000000000
          560.916666666666700000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRDBText2: TgtQRDBText
        Left = 629
        Top = 114
        Width = 79
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1664.229166666667000000
          301.625000000000000000
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
      object gtQRLabel2: TgtQRLabel
        Left = 524
        Top = 114
        Width = 62
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1386.416666666667000000
          301.625000000000000000
          164.041666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Order No:'
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
      object gtQRShape2: TgtQRShape
        Left = 590
        Top = 80
        Width = 9
        Height = 56
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          148.166666666666700000
          1561.041666666667000000
          211.666666666666700000
          23.812500000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRShape3: TgtQRShape
        Left = 504
        Top = 107
        Width = 212
        Height = 5
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          13.229166666666670000
          1333.500000000000000000
          283.104166666666700000
          560.916666666666700000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape5: TgtQRShape
        Left = 3
        Top = 632
        Width = 713
        Height = 177
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          468.312500000000100000
          7.937500000000000000
          1672.166666666667000000
          1886.479166666667000000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel24: TgtQRLabel
        Left = 8
        Top = 612
        Width = 185
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          21.166666666666670000
          1619.250000000000000000
          489.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Remedial Action to be taken:'
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
      object gtQRShape6: TgtQRShape
        Left = 3
        Top = 432
        Width = 713
        Height = 177
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          468.312500000000100000
          7.937500000000000000
          1143.000000000000000000
          1886.479166666667000000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel4: TgtQRLabel
        Left = 8
        Top = 411
        Width = 166
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          1087.437500000000000000
          439.208333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Details of Remedial Work:'
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
      object gtQRShape15: TgtQRShape
        Left = 3
        Top = 176
        Width = 713
        Height = 32
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          84.666666666666670000
          7.937500000000000000
          465.666666666666700000
          1886.479166666667000000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape16: TgtQRShape
        Left = 3
        Top = 206
        Width = 713
        Height = 32
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          84.666666666666670000
          7.937500000000000000
          545.041666666666700000
          1886.479166666667000000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape17: TgtQRShape
        Left = 3
        Top = 236
        Width = 713
        Height = 32
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          84.666666666666670000
          7.937500000000000000
          624.416666666666700000
          1886.479166666667000000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel13: TgtQRLabel
        Left = 8
        Top = 184
        Width = 106
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          486.833333333333300000
          280.458333333333300000)
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
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText8: TgtQRDBText
        Left = 200
        Top = 184
        Width = 98
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          529.166666666666700000
          486.833333333333300000
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
      object gtQRShape18: TgtQRShape
        Left = 177
        Top = 144
        Width = 7
        Height = 122
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          322.791666666666700000
          468.312500000000000000
          381.000000000000000000
          18.520833333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRShape20: TgtQRShape
        Left = 3
        Top = 272
        Width = 713
        Height = 137
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          362.479166666666700000
          7.937500000000000000
          719.666666666666700000
          1886.479166666667000000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrrchTextInstallAddress: TgtQRRichText
        Left = 144
        Top = 280
        Width = 241
        Height = 97
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          256.645833333333300000
          381.000000000000000000
          740.833333333333300000
          637.645833333333300000)
        Alignment = taLeftJustify
        AutoStretch = False
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'InstallAddress')
      end
      object QRLabel4: TgtQRLabel
        Left = 8
        Top = 280
        Width = 84
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          21.166666666666670000
          740.833333333333300000
          222.250000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Site Address:'
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
      object QRLabel3: TgtQRLabel
        Left = 524
        Top = 88
        Width = 49
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1386.416666666667000000
          232.833333333333300000
          129.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Job No.'
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
      object gtQRShape22: TgtQRShape
        Left = 3
        Top = 384
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
          1016.000000000000000000
          1886.479166666667000000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape21: TgtQRShape
        Left = 129
        Top = 273
        Width = 7
        Height = 136
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          359.833333333333300000
          341.312500000000000000
          722.312500000000000000
          18.520833333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRLabel14: TgtQRLabel
        Left = 9
        Top = 388
        Width = 123
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          23.812500000000000000
          1026.583333333333000000
          325.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Site Contact Name:'
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
      object QRDBText3: TgtQRDBText
        Left = 144
        Top = 387
        Width = 241
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          381.000000000000000000
          1023.937500000000000000
          637.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Install_Name'
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
      object QRLabel15: TgtQRLabel
        Left = 8
        Top = 212
        Width = 53
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          560.916666666666700000
          140.229166666666700000)
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
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object gtQRLabel15: TgtQRLabel
        Left = 393
        Top = 388
        Width = 107
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1039.812500000000000000
          1026.583333333333000000
          283.104166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Contact Number:'
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
      object QRDBText6: TgtQRDBText
        Left = 512
        Top = 388
        Width = 201
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1354.666666666667000000
          1026.583333333333000000
          531.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Install_Phone'
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
        Left = 200
        Top = 212
        Width = 201
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          529.166666666666700000
          560.916666666666700000
          531.812500000000000000)
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
      object QRLabel5: TgtQRLabel
        Left = 8
        Top = 242
        Width = 111
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          21.166666666666670000
          640.291666666666700000
          293.687500000000000000)
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
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText4: TgtQRDBText
        Left = 200
        Top = 242
        Width = 59
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          529.166666666666700000
          640.291666666666700000
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
      object gtQRShape24: TgtQRShape
        Left = 385
        Top = 385
        Width = 7
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          1018.645833333333000000
          1018.645833333333000000
          18.520833333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRShape25: TgtQRShape
        Left = 497
        Top = 385
        Width = 7
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          1314.979166666667000000
          1018.645833333333000000
          18.520833333333330000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRDBText2: TgtQRDBText
        Left = 684
        Top = 88
        Width = 24
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1809.750000000000000000
          232.833333333333300000
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
      object gtQRShape26: TgtQRShape
        Left = 542
        Top = 145
        Width = 9
        Height = 32
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          84.666666666666670000
          1434.041666666667000000
          383.645833333333300000
          23.812500000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRLabel1: TgtQRLabel
        Left = 428
        Top = 153
        Width = 97
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1132.416666666667000000
          404.812500000000000000
          256.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Date Arranged:'
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
        Left = 8
        Top = 854
        Width = 101
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          21.166666666666670000
          2259.541666666667000000
          267.229166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Revisit Required?'
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
        Left = 8
        Top = 820
        Width = 262
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          21.166666666666670000
          2169.583333333333000000
          693.208333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Remedial completed to customer satisfaction'
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
      object gtQRLabel6: TgtQRLabel
        Left = 8
        Top = 900
        Width = 41
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          21.166666666666670000
          2381.250000000000000000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Signed'
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
        Left = 8
        Top = 964
        Width = 41
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          21.166666666666670000
          2550.583333333333000000
          108.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Signed'
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
      object gtQRLabel8: TgtQRLabel
        Left = 400
        Top = 900
        Width = 28
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1058.333333333333000000
          2381.250000000000000000
          74.083333333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Date'
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
        Left = 400
        Top = 964
        Width = 28
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1058.333333333333000000
          2550.583333333333000000
          74.083333333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Date'
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
      object gtQRLabel10: TgtQRLabel
        Left = 400
        Top = 854
        Width = 84
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1058.333333333333000000
          2259.541666666667000000
          222.250000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Date Arranged'
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
      object gtQRShape32: TgtQRShape
        Left = 104
        Top = 910
        Width = 265
        Height = 8
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          21.166666666666670000
          275.166666666666700000
          2407.708333333333000000
          701.145833333333400000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape7: TgtQRShape
        Left = 104
        Top = 974
        Width = 265
        Height = 8
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          21.166666666666670000
          275.166666666666700000
          2577.041666666667000000
          701.145833333333400000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape8: TgtQRShape
        Left = 512
        Top = 910
        Width = 187
        Height = 8
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          21.166666666666670000
          1354.666666666667000000
          2407.708333333333000000
          494.770833333333400000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape9: TgtQRShape
        Left = 512
        Top = 974
        Width = 187
        Height = 8
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          21.166666666666670000
          1354.666666666667000000
          2577.041666666667000000
          494.770833333333400000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape10: TgtQRShape
        Left = 512
        Top = 867
        Width = 187
        Height = 8
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          21.166666666666670000
          1354.666666666667000000
          2293.937500000000000000
          494.770833333333400000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape27: TgtQRShape
        Left = 184
        Top = 856
        Width = 15
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          486.833333333333400000
          2264.833333333333000000
          39.687500000000000000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape11: TgtQRShape
        Left = 256
        Top = 856
        Width = 15
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          677.333333333333400000
          2264.833333333333000000
          39.687500000000000000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel11: TgtQRLabel
        Left = 152
        Top = 854
        Width = 24
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          402.166666666666700000
          2259.541666666667000000
          63.500000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Yes'
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
      object gtQRLabel12: TgtQRLabel
        Left = 224
        Top = 854
        Width = 17
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          592.666666666666700000
          2259.541666666667000000
          44.979166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'No'
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
      object gtQRLabel16: TgtQRLabel
        Left = 8
        Top = 924
        Width = 125
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          21.166666666666670000
          2444.750000000000000000
          330.729166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'on behalf of customer'
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
      object gtQRLabel17: TgtQRLabel
        Left = 8
        Top = 988
        Width = 71
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          21.166666666666670000
          2614.083333333333000000
          187.854166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'on behalf of '
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
      object qrlblCompany: TgtQRLabel
        Left = 80
        Top = 988
        Width = 56
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          211.666666666666700000
          2614.083333333333000000
          148.166666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Company'
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
      object gtQRShape12: TgtQRShape
        Left = 414
        Top = 145
        Width = 9
        Height = 32
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          84.666666666666670000
          1095.375000000000000000
          383.645833333333300000
          23.812500000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRLabel18: TgtQRLabel
        Left = 8
        Top = 153
        Width = 72
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          404.812500000000000000
          190.500000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Logged by:'
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
      object gtQRShape13: TgtQRShape
        Left = 328
        Top = 824
        Width = 15
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          867.833333333333500000
          2180.166666666667000000
          39.687500000000000000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape14: TgtQRShape
        Left = 392
        Top = 824
        Width = 15
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          39.687500000000000000
          1037.166666666667000000
          2180.166666666667000000
          39.687500000000000000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel19: TgtQRLabel
        Left = 296
        Top = 822
        Width = 24
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          783.166666666666700000
          2174.875000000000000000
          63.500000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Yes'
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
        Left = 360
        Top = 822
        Width = 17
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          952.500000000000000000
          2174.875000000000000000
          44.979166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'No'
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
      object qriHeadLogo: TgtQRImage
        Left = 12
        Top = 6
        Width = 270
        Height = 85
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          224.895833333333300000
          31.750000000000000000
          15.875000000000000000
          714.375000000000000000)
        Stretch = True
      end
      object memAddress: TgtQRMemo
        Left = 283
        Top = 6
        Width = 134
        Height = 123
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          325.437500000000000000
          748.770833333333300000
          15.875000000000000000
          354.541666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
    end
    object gtQRSysData1: TgtQRSysData
      Left = 647
      Top = 1088
      Width = 108
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.333333333333330000
        1711.854166666667000000
        2878.666666666667000000
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
  object qryReport: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select  Job.*,'
      '        Operator.Operator_Name,'
      '        (select Sales_order'
      '         from Sales_Order_Line'
      '         where sales_order_line.Job = Job.Job) as Sales_Order,'
      '         (select Sales_order.Order_Ref_No'
      '         from Sales_Order_Line, sales_Order'
      '         where sales_order_line.Job = Job.Job and'
      
        '               Sales_Order_line.sales_Order = Sales_order.sales_' +
        'order) as Order_Ref_No'
      'from Job, Operator'
      'where Job = :Job and'
      'Job.Operator = Operator.Operator')
    Left = 1035
    Top = 54
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Job'
        ParamType = ptUnknown
      end>
  end
  object dtsReport: TDataSource
    DataSet = qryReport
    Left = 1152
    Top = 136
  end
  object qryAddress: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select *'
      'from Address'
      'where Address = :Address')
    Left = 1046
    Top = 331
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
      'Vat_Rate'
      'from Customer, VAT'
      'where Customer = :Customer and'
      'Customer.VAT = Vat.Vat')
    Left = 1046
    Top = 390
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end>
  end
  object dtsAddress: TDataSource
    Left = 1110
    Top = 331
  end
  object qryCompany: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * from company'
      'where company = 1')
    Left = 1149
    Top = 522
  end
  object qrygetNotes: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from Notes'
      'where notes_code = :Notes_Code')
    Left = 1182
    Top = 213
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Notes_Code'
        ParamType = ptUnknown
      end>
  end
  object qryUpJStatus: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'update Job'
      
        'set Job_status = :Job_Status, Production_Date_Actual = :Producti' +
        'on_Date_Actual'
      'where Job = :Job')
    Left = 1152
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Production_Date_Actual'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Job'
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
      'Fax_Number,'
      'Email_Address,'
      'Web_Address '
      'from Company')
    Left = 1048
    Top = 521
  end
  object qryJRemedials: TFDQuery
    ConnectionName = 'Wt'
    MasterSource = dtsReport
    SQL.Strings = (
      'select Job_Remedial.*, Fitter.Fitter_Name'
      'from Job_Remedial, Fitter'
      'where Job= :Job and'
      'Job_Remedial.Fitter = Fitter.Fitter'
      'ORDER BY Job, Remedial_Number')
    Left = 1043
    Top = 450
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job'
        ParamType = ptUnknown
      end>
  end
  object qryJobEdge: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Job_Edge.Job,'
      '        Job_Edge.Edge_number,'
      '        Job_Edge.Edge_profile,'
      '        Edge_profile.Description'
      'FROM Edge_profile'
      '      INNER JOIN Job_Edge'
      '      ON Edge_profile.Edge_profile = Job_Edge.Edge_profile'
      'WHERE Job = :Job'
      'ORDER BY Job, Edge_Number')
    Left = 1043
    Top = 118
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job'
        ParamType = ptUnknown
      end>
  end
  object qryJobThickness: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Job_Element.Job,'
      '        Job_Element.Element_Number,'
      '        Job_Element.Thickness,'
      '        Thickness.Thickness_mm'
      'FROM Job_Element'
      '      INNER JOIN Thickness'
      '        ON Job_Element.Thickness = Thickness.Thickness'
      'WHERE Job = :Job'
      'ORDER BY Job, Element_Number')
    Left = 1043
    Top = 182
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job'
        ParamType = ptUnknown
      end>
  end
  object qryJobUpstand: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT DISTINCT Material_Use.Use_Description'
      'FROM Material_Use'
      '  RIGHT JOIN (Job_Element'
      '  INNER JOIN Thickness'
      '    ON Job_Element.Thickness = Thickness.Thickness)'
      '    ON Material_Use.Material_Use = Job_Element.Material_Use'
      'WHERE Element_number > 1000 AND Job = :Job'
      'GROUP BY Material_Use.Use_Description'
      '')
    Left = 1043
    Top = 254
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Job'
        ParamType = ptUnknown
      end>
  end
end
