object frmwtRPQuote: TfrmwtRPQuote
  Left = 2
  Top = 0
  Width = 1464
  Height = 884
  Caption = 'frmwtRPQuote'
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
    Left = 280
    Top = 26
    Width = 794
    Height = 1535
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    BeforePrint = qrpDetailsBeforePrint
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
      'QRBLOOP')
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
    ReportTitle = 'Quotation print'
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsMaximized
    object qrgQuote: TQRGroup
      Left = 38
      Top = 345
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
      ForceNewPage = True
      Size.Values = (
        5.291666666666667000
        1899.708333333333000000)
      Expression = 'quote'
      FooterBand = qrbQFooter
      Master = qrpDetails
      ReprintOnNewPage = False
    end
    object qrbPageHeader: TQRBand
      Left = 38
      Top = 38
      Width = 718
      Height = 307
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
        812.270833333333300000
        1899.708333333333000000)
      BandType = rbPageHeader
      object gtQRShape2: TgtQRShape
        Left = 8
        Top = 162
        Width = 353
        Height = 116
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          306.916666666666700000
          21.166666666666670000
          428.625000000000000000
          933.979166666666700000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrlblQuoteCaption: TgtQRLabel
        Left = 552
        Top = 8
        Width = 161
        Height = 43
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          113.770833333333300000
          1460.500000000000000000
          21.166666666666670000
          425.979166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Quotation'
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
      object QRDBText5: TgtQRDBText
        Left = 8
        Top = 288
        Width = 697
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          762.000000000000000000
          1844.145833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = qryReport
        DataField = 'Description'
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
      object qriHeadLogo: TgtQRImage
        Left = 8
        Top = 3
        Width = 300
        Height = 62
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          164.041666666666700000
          21.166666666666670000
          7.937500000000000000
          793.750000000000000000)
        Stretch = True
      end
      object qrmemCompanyAdd: TgtQRMemo
        Left = 8
        Top = 70
        Width = 353
        Height = 83
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          219.604166666666700000
          21.166666666666670000
          185.208333333333300000
          933.979166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
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
      object qrmAddress: TgtQRMemo
        Left = 40
        Top = 167
        Width = 233
        Height = 107
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          283.104166666666700000
          105.833333333333300000
          441.854166666666700000
          616.479166666666700000)
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
        Lines.Strings = (
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object gtQRShape6: TgtQRShape
        Left = 400
        Top = 63
        Width = 313
        Height = 215
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          568.854166666666700000
          1058.333333333333000000
          166.687500000000000000
          828.145833333333300000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShape8: TgtQRShape
        Left = 400
        Top = 113
        Width = 313
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          1058.333333333333000000
          298.979166666666700000
          828.145833333333300000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel2: TgtQRLabel
        Left = 405
        Top = 96
        Width = 30
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1071.562500000000000000
          254.000000000000000000
          79.375000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Date:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel3: TgtQRLabel
        Left = 405
        Top = 69
        Width = 56
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1071.562500000000000000
          182.562500000000000000
          148.166666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Quote No:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel4: TgtQRLabel
        Left = 405
        Top = 124
        Width = 46
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1071.562500000000000000
          328.083333333333300000
          121.708333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Contact:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText1: TgtQRDBText
        Left = 634
        Top = 96
        Width = 74
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1677.458333333333000000
          254.000000000000000000
          195.791666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Date_Raised'
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
      object QRDBText2: TgtQRDBText
        Left = 674
        Top = 69
        Width = 34
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1783.291666666667000000
          182.562500000000000000
          89.958333333333330000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Quote'
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
      object QRDBText3: TgtQRDBText
        Left = 568
        Top = 124
        Width = 140
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1502.833333333333000000
          328.083333333333300000
          370.416666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Account_Manager_Name'
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
      object gtQRShape3: TgtQRShape
        Left = 400
        Top = 198
        Width = 313
        Height = 7
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          18.520833333333330000
          1058.333333333333000000
          523.875000000000000000
          828.145833333333300000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel5: TgtQRLabel
        Left = 405
        Top = 206
        Width = 89
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1071.562500000000000000
          545.041666666666700000
          235.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Your Reference:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText4: TgtQRDBText
        Left = 504
        Top = 206
        Width = 204
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1333.500000000000000000
          545.041666666666700000
          539.750000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Reference'
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object gtQRShape7: TgtQRShape
        Left = 400
        Top = 170
        Width = 313
        Height = 3
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          7.937500000000000000
          1058.333333333333000000
          449.791666666666700000
          828.145833333333300000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRLabel2: TgtQRLabel
        Left = 405
        Top = 149
        Width = 68
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1071.562500000000000000
          394.229166666666700000
          179.916666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Your Phone:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object gtQRLabel3: TgtQRLabel
        Left = 405
        Top = 177
        Width = 64
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1071.562500000000000000
          468.312500000000000000
          169.333333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Your Email:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object gtQRLabel4: TgtQRLabel
        Left = 405
        Top = 257
        Width = 74
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1071.562500000000000000
          679.979166666666700000
          195.791666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Lead Source:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object qrlblYourPhone: TgtQRLabel
        Left = 643
        Top = 149
        Width = 65
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1701.270833333333000000
          394.229166666666700000
          171.979166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Your Phone'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object qrlblYourEmail: TgtQRLabel
        Left = 504
        Top = 177
        Width = 204
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1333.500000000000000000
          468.312500000000000000
          539.750000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Your Email'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object gtQRLabel6: TgtQRLabel
        Left = 405
        Top = 231
        Width = 44
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1071.562500000000000000
          611.187500000000000000
          116.416666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Material'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object gtQRDBText2: TgtQRDBText
        Left = 500
        Top = 231
        Width = 208
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1322.916666666667000000
          611.187500000000000000
          550.333333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Material_Description'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object gtQRDBText1: TgtQRDBText
        Left = 501
        Top = 257
        Width = 207
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1325.562500000000000000
          679.979166666666700000
          547.687500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Sales_Lead_Source_Descr'
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
      object gtQRShape11: TgtQRShape
        Left = 400
        Top = 88
        Width = 313
        Height = 4
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          10.583333333333330000
          1058.333333333333000000
          232.833333333333300000
          828.145833333333300000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape4: TgtQRShape
        Left = 400
        Top = 143
        Width = 313
        Height = 3
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          7.937500000000000000
          1058.333333333333000000
          378.354166666666700000
          828.145833333333300000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape5: TgtQRShape
        Left = 400
        Top = 224
        Width = 313
        Height = 8
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          21.166666666666670000
          1058.333333333333000000
          592.666666666666700000
          828.145833333333300000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape10: TgtQRShape
        Left = 400
        Top = 248
        Width = 313
        Height = 8
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          21.166666666666670000
          1058.333333333333000000
          656.166666666666700000
          828.145833333333300000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape13: TgtQRShape
        Left = 494
        Top = 63
        Width = 9
        Height = 215
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          568.854166666666700000
          1307.041666666667000000
          166.687500000000000000
          23.812500000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
    end
    object qrsdQElements: TQRSubDetail
      Left = 38
      Top = 347
      Width = 718
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = qrsdQElementsBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.916666666666670000
        1899.708333333333000000)
      Master = qrpDetails
      DataSet = qryQElements
      PrintBefore = False
      PrintIfEmpty = True
      object lblWorktopSize: TgtQRLabel
        Left = 415
        Top = 2
        Width = 82
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1098.020833333333000000
          5.291666666666667000
          216.958333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'lblWorktopSize'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object lblWorktopArea: TgtQRLabel
        Left = 502
        Top = 2
        Width = 84
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1328.208333333333000000
          5.291666666666667000
          222.250000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'lblWorktopArea'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object lblWorktopTotal: TgtQRLabel
        Left = 615
        Top = 2
        Width = 86
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1627.187500000000000000
          5.291666666666667000
          227.541666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'lblWorktopTotal'
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
    end
    object qrsdQEdges: TQRSubDetail
      Left = 38
      Top = 367
      Width = 718
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = qrsdQEdgesBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.916666666666670000
        1899.708333333333000000)
      Master = qrpDetails
      DataSet = qryQEdges
      PrintBefore = False
      PrintIfEmpty = True
      object qrlblLength: TgtQRLabel
        Left = 523
        Top = 2
        Width = 63
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1383.770833333333000000
          5.291666666666667000
          166.687500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblLength'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object lblEdgeTotal: TgtQRLabel
        Left = 631
        Top = 2
        Width = 70
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1669.520833333333000000
          5.291666666666667000
          185.208333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'lblEdgeTotal'
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
      object qrlblEdgeDescription: TgtQRLabel
        Left = 381
        Top = 2
        Width = 117
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1008.062500000000000000
          5.291666666666667000
          309.562500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblEdgeDescription'
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
    end
    object qrsdQCutOuts: TQRSubDetail
      Left = 38
      Top = 387
      Width = 718
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = qrsdQCutOutsBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.916666666666670000
        1899.708333333333000000)
      Master = qrpDetails
      DataSet = qryQCutOuts
      PrintBefore = False
      PrintIfEmpty = True
      object qrlblQuantity: TgtQRLabel
        Left = 517
        Top = 2
        Width = 69
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1367.895833333333000000
          5.291666666666667000
          182.562500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblQuantity'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object lblCutOutTotal: TgtQRLabel
        Left = 622
        Top = 2
        Width = 79
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1645.708333333333000000
          5.291666666666667000
          209.020833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'lblCutOutTotal'
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
      object qrlblCutOut: TgtQRLabel
        Left = 435
        Top = 2
        Width = 63
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1150.937500000000000000
          5.291666666666667000
          166.687500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblCutOut'
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
    end
    object qrsdQExtras: TQRSubDetail
      Left = 38
      Top = 407
      Width = 718
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = qrsdQExtrasBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.916666666666670000
        1899.708333333333000000)
      Master = qrpDetails
      DataSet = qryQExtras
      FooterBand = qrcbDiscount
      PrintBefore = False
      PrintIfEmpty = True
      object lblExtraTotal: TgtQRLabel
        Left = 633
        Top = 1
        Width = 68
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1674.812500000000000000
          2.645833333333333000
          179.916666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'lblExtraTotal'
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
      object qrlblExtraQuantity: TgtQRLabel
        Left = 481
        Top = 1
        Width = 105
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1272.645833333333000000
          2.645833333333333000
          277.812500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblExtraQuantity'
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
      object qrlblExtraDescription: TgtQRLabel
        Left = 383
        Top = 1
        Width = 115
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1013.354166666667000000
          2.645833333333333000
          304.270833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblExtraDescription'
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
    end
    object qrbQFooter: TQRBand
      Left = 38
      Top = 447
      Width = 718
      Height = 73
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = qrbQFooterAfterPrint
      AlignToBottom = False
      BeforePrint = qrbQFooterBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        193.145833333333300000
        1899.708333333333000000)
      BandType = rbGroupFooter
      object lblGrossSupply: TgtQRLabel
        Left = 518
        Top = 3
        Width = 66
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1370.541666666667000000
          7.937500000000000000
          174.625000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'COMPLETE'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel6: TgtQRLabel
        Left = 516
        Top = 20
        Width = 68
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1365.250000000000000000
          52.916666666666670000
          179.916666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Fixing Team'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel7: TgtQRLabel
        Left = 465
        Top = 37
        Width = 119
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1230.312500000000000000
          97.895833333333330000
          314.854166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Surveying/Templating'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel8: TgtQRLabel
        Left = 540
        Top = 54
        Width = 44
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1428.750000000000000000
          142.875000000000000000
          116.416666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Delivery'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object qrlblGrossPrice: TgtQRLabel
        Left = 614
        Top = 3
        Width = 87
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1624.541666666667000000
          7.937500000000000000
          230.187500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblGrossPrice'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object qrlblInstallation: TgtQRLabel
        Left = 616
        Top = 20
        Width = 85
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1629.833333333333000000
          52.916666666666670000
          224.895833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblInstallation'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object qrlblSurvey: TgtQRLabel
        Left = 640
        Top = 37
        Width = 61
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1693.333333333333000000
          97.895833333333330000
          161.395833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblSurvey'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object qrlblDelivery: TgtQRLabel
        Left = 633
        Top = 54
        Width = 68
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1674.812500000000000000
          142.875000000000000000
          179.916666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblDelivery'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
    end
    object qrcbAvailability: TQRChildBand
      Left = 38
      Top = 656
      Width = 718
      Height = 44
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = qrcbAvailabilityAfterPrint
      AlignToBottom = False
      BeforePrint = qrcbAvailabilityBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        116.416666666666700000
        1899.708333333333000000)
      ParentBand = qrcbNotes
      object QRLabel9: TgtQRLabel
        Left = 0
        Top = 6
        Width = 204
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          15.875000000000000000
          539.750000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'PLEASE NOTE THE FOLLOWING'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrrchTextAvailability: TgtQRRichText
        Left = 0
        Top = 26
        Width = 713
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          0.000000000000000000
          68.791666666666670000
          1886.479166666667000000)
        Alignment = taLeftJustify
        AutoStretch = True
        Color = clWindow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
      end
    end
    object qrcbNotes: TQRChildBand
      Left = 38
      Top = 613
      Width = 718
      Height = 43
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = qrcbNotesBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        113.770833333333300000
        1899.708333333333000000)
      ParentBand = qrcbTotal
      object qrlNotes: TgtQRLabel
        Left = 0
        Top = 8
        Width = 45
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          21.166666666666670000
          119.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NOTES'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrrchTextNotes: TgtQRRichText
        Left = 0
        Top = 26
        Width = 713
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          0.000000000000000000
          68.791666666666670000
          1886.479166666667000000)
        Alignment = taLeftJustify
        AutoStretch = True
        Color = clWindow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'A')
      end
    end
    object qrcbDiscount: TQRBand
      Left = 38
      Top = 427
      Width = 718
      Height = 20
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = qrcbDiscountBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.916666666666670000
        1899.708333333333000000)
      BandType = rbGroupFooter
      object lblDiscount: TgtQRLabel
        Left = 524
        Top = 2
        Width = 60
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1386.416666666667000000
          5.291666666666667000
          158.750000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DISCOUNT'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object qrlblDiscountValue: TgtQRLabel
        Left = 593
        Top = 2
        Width = 108
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1568.979166666667000000
          5.291666666666667000
          285.750000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblDiscountValue'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
    end
    object qrcbTotal: TQRChildBand
      Left = 38
      Top = 564
      Width = 718
      Height = 49
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
        129.645833333333300000
        1899.708333333333000000)
      ParentBand = qrcbSubTotal
      object QRShape4: TgtQRShape
        Left = 496
        Top = -4
        Width = 207
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1312.333333333333000000
          -10.583333333333330000
          547.687500000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel18: TgtQRLabel
        Left = 552
        Top = 8
        Width = 33
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1460.500000000000000000
          21.166666666666670000
          87.312500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total'
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
      object qrlblGross: TgtQRLabel
        Left = 637
        Top = 8
        Width = 65
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1685.395833333333000000
          21.166666666666670000
          171.979166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblGross'
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
      object gtQRLabel5: TgtQRLabel
        Left = 8
        Top = 4
        Width = 189
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          10.583333333333330000
          500.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total Material Required (sqm)'
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
      object qrlblTotalArea: TgtQRLabel
        Left = 202
        Top = 4
        Width = 92
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          534.458333333333300000
          10.583333333333330000
          243.416666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblTotalArea'
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
      object qrlblPriceMatch: TgtQRLabel
        Left = 8
        Top = 30
        Width = 323
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          79.375000000000000000
          854.604166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Price Match Guarantee - see Terms and Conditions'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
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
    object qrcbPriceMatch: TQRChildBand
      Left = 38
      Top = 700
      Width = 718
      Height = 2
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = qrcbPriceMatchBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        5.291666666666667000
        1899.708333333333000000)
      ParentBand = qrcbAvailability
      object qrlblTotalAreaCaption: TgtQRLabel
        Left = 445
        Top = 6
        Width = 162
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1177.395833333333000000
          15.875000000000000000
          428.625000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total Worktop Area (sqm)'
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
      object qrlblTotalArea1: TgtQRLabel
        Left = 614
        Top = 6
        Width = 99
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1624.541666666667000000
          15.875000000000000000
          261.937500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblTotalArea1'
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
    end
    object qrcbAcceptanceHeader: TQRChildBand
      Left = 38
      Top = 1014
      Width = 718
      Height = 187
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = qrcbAcceptanceHeaderAfterPrint
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        494.770833333333300000
        1899.708333333333000000)
      ParentBand = qrcbNotesDirection
      object QRLabel26: TgtQRLabel
        Left = 212
        Top = 8
        Width = 313
        Height = 43
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          113.770833333333300000
          560.916666666666700000
          21.166666666666670000
          828.145833333333300000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Order Confirmation'
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
      object QRLabel27: TgtQRLabel
        Left = 9
        Top = 104
        Width = 97
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
          256.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Quote Reference:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText7: TgtQRDBText
        Left = 120
        Top = 104
        Width = 34
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          317.500000000000000000
          275.166666666666700000
          89.958333333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Quote'
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText8: TgtQRDBText
        Left = 8
        Top = 162
        Width = 465
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          428.625000000000000000
          1230.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = qryReport
        DataField = 'Description'
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel29: TgtQRLabel
        Left = 9
        Top = 128
        Width = 66
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          23.812500000000000000
          338.666666666666700000
          174.625000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Quote Date:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText9: TgtQRDBText
        Left = 120
        Top = 128
        Width = 74
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          317.500000000000000000
          338.666666666666700000
          195.791666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Date_Raised'
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel30: TgtQRLabel
        Left = 360
        Top = 104
        Width = 59
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          952.500000000000000000
          275.166666666666700000
          156.104166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Customer:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText10: TgtQRDBText
        Left = 432
        Top = 104
        Width = 265
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1143.000000000000000000
          275.166666666666700000
          701.145833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Customer_name'
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object gtQRLabel9: TgtQRLabel
        Left = 238
        Top = 56
        Width = 261
        Height = 28
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          74.083333333333330000
          629.708333333333300000
          148.166666666666700000
          690.562500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '(Please sign and return)'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 18
      end
    end
    object qrcbSignature: TQRChildBand
      Left = 38
      Top = 1201
      Width = 718
      Height = 416
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = qrcbSignatureBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        1100.666666666667000000
        1899.708333333333000000)
      ParentBand = qrcbAcceptanceHeader
      object QRShape8: TgtQRShape
        Left = 8
        Top = 24
        Width = 689
        Height = 129
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          341.312500000000000000
          21.166666666666670000
          63.500000000000000000
          1822.979166666667000000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape9: TgtQRShape
        Left = 376
        Top = 24
        Width = 17
        Height = 129
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          341.312500000000000000
          994.833333333333400000
          63.500000000000000000
          44.979166666666670000)
        Pen.Width = 2
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object QRLabel13: TgtQRLabel
        Left = 416
        Top = 64
        Width = 54
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1100.666666666667000000
          169.333333333333300000
          142.875000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Signature'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel14: TgtQRLabel
        Left = 416
        Top = 96
        Width = 63
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1100.666666666667000000
          254.000000000000000000
          166.687500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Print Name'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel15: TgtQRLabel
        Left = 416
        Top = 128
        Width = 27
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1100.666666666667000000
          338.666666666666700000
          71.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Date'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRShape1: TgtQRShape
        Left = 496
        Top = 68
        Width = 193
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1312.333333333333000000
          179.916666666666700000
          510.645833333333300000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape2: TgtQRShape
        Left = 496
        Top = 101
        Width = 193
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1312.333333333333000000
          267.229166666666700000
          510.645833333333300000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape3: TgtQRShape
        Left = 496
        Top = 134
        Width = 193
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1312.333333333333000000
          354.541666666666700000
          510.645833333333300000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel12: TgtQRLabel
        Left = 8
        Top = 6
        Width = 248
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          15.875000000000000000
          656.166666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Please confirm all details and fax back'
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
      object QRShape5: TgtQRShape
        Left = 8
        Top = 208
        Width = 689
        Height = 97
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          256.645833333333400000
          21.166666666666670000
          550.333333333333400000
          1822.979166666667000000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel1: TgtQRLabel
        Left = 8
        Top = 190
        Width = 98
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          502.708333333333300000
          259.291666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Client Comments'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel19: TgtQRLabel
        Left = 16
        Top = 32
        Width = 23
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          84.666666666666670000
          60.854166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Nett'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel20: TgtQRLabel
        Left = 16
        Top = 56
        Width = 22
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          148.166666666666700000
          58.208333333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'VAT'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel21: TgtQRLabel
        Left = 16
        Top = 80
        Width = 28
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          211.666666666666700000
          74.083333333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object qrlblDepositReqd: TgtQRLabel
        Left = 16
        Top = 104
        Width = 93
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          275.166666666666700000
          246.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Deposit required'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object qrlblBalanceDue: TgtQRLabel
        Left = 16
        Top = 128
        Width = 175
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          338.666666666666700000
          463.020833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Balance due prior to completion'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object qrlblNettAcc: TgtQRLabel
        Left = 265
        Top = 32
        Width = 47
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          701.145833333333300000
          84.666666666666670000
          124.354166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblNett'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object qrlblVatAcc: TgtQRLabel
        Left = 270
        Top = 56
        Width = 42
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          714.375000000000000000
          148.166666666666700000
          111.125000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblVat'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object qrlblGrossAcc: TgtQRLabel
        Left = 234
        Top = 80
        Width = 78
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          619.125000000000000000
          211.666666666666700000
          206.375000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblGrossAcc'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object qrlblDeposit: TgtQRLabel
        Left = 244
        Top = 104
        Width = 68
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          645.583333333333300000
          275.166666666666700000
          179.916666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblDeposit'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object qrlblBalance: TgtQRLabel
        Left = 242
        Top = 128
        Width = 70
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          640.291666666666700000
          338.666666666666700000
          185.208333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblBalance'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel24: TgtQRLabel
        Left = 8
        Top = 308
        Width = 110
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          814.916666666666700000
          291.041666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Installation Address'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRShape6: TgtQRShape
        Left = 8
        Top = 324
        Width = 361
        Height = 85
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          224.895833333333300000
          21.166666666666670000
          857.250000000000000000
          955.145833333333500000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape7: TgtQRShape
        Left = 240
        Top = 160
        Width = 137
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333340000
          635.000000000000000000
          423.333333333333300000
          362.479166666666700000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel25: TgtQRLabel
        Left = 8
        Top = 165
        Width = 199
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          436.562500000000000000
          526.520833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Proposed date of Survey/Templates:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRLabel28: TgtQRLabel
        Left = 392
        Top = 165
        Width = 134
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1037.166666666667000000
          436.562500000000000000
          354.541666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Proposed date of Fitting:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRShape10: TgtQRShape
        Left = 560
        Top = 160
        Width = 137
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333340000
          1481.666666666667000000
          423.333333333333300000
          362.479166666666700000)
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel11: TgtQRLabel
        Left = 416
        Top = 32
        Width = 54
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1100.666666666667000000
          84.666666666666670000
          142.875000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Order No.'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRShape11: TgtQRShape
        Left = 496
        Top = 36
        Width = 193
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1312.333333333333000000
          95.250000000000000000
          510.645833333333300000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
    object qrcbTerms: TQRChildBand
      Left = 38
      Top = 1617
      Width = 718
      Height = 41
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = qrcbTermsBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        108.479166666666700000
        1899.708333333333000000)
      ParentBand = qrcbSignature
      object QRLabel10: TgtQRLabel
        Left = 0
        Top = 0
        Width = 141
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          0.000000000000000000
          373.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'TERMS & CONDITIONS'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrrchtextTerms: TgtQRRichText
        Left = 0
        Top = 21
        Width = 713
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          0.000000000000000000
          55.562500000000000000
          1886.479166666667000000)
        Alignment = taLeftJustify
        AutoStretch = True
        Color = clWindow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'A')
      end
    end
    object qrbPageFooter: TQRBand
      Left = 38
      Top = 1658
      Width = 718
      Height = 15
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
        39.687500000000000000
        1899.708333333333000000)
      BandType = rbPageFooter
    end
    object qrcbSubTotal: TQRChildBand
      Left = 38
      Top = 520
      Width = 718
      Height = 44
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = qrcbSubTotalBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        116.416666666666700000
        1899.708333333333000000)
      ParentBand = qrbQFooter
      object qrlblVatRate: TgtQRLabel
        Left = 563
        Top = 26
        Width = 22
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1489.604166666667000000
          68.791666666666670000
          58.208333333333330000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'VAT'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object qrlblVAT: TgtQRLabel
        Left = 656
        Top = 26
        Width = 46
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1735.666666666667000000
          68.791666666666670000
          121.708333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblVAT'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object qrlblNett: TgtQRLabel
        Left = 655
        Top = 8
        Width = 47
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333330000
          1733.020833333333000000
          21.166666666666670000
          124.354166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblNett'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object gtQRShape1: TgtQRShape
        Left = 496
        Top = -4
        Width = 207
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1312.333333333333000000
          -10.583333333333330000
          547.687500000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRLabel1: TgtQRLabel
        Left = 552
        Top = 8
        Width = 33
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1460.500000000000000000
          21.166666666666670000
          87.312500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NETT'
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
    end
    object qrcbNotesDirection: TQRChildBand
      Left = 38
      Top = 702
      Width = 718
      Height = 312
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
        825.500000000000000000
        1899.708333333333000000)
      ParentBand = qrcbPriceMatch
      object gtQRLabel7: TgtQRLabel
        Left = 134
        Top = 22
        Width = 93
        Height = 33
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          87.312500000000000000
          354.541666666666700000
          58.208333333333330000
          246.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NOTES'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 20
      end
      object gtQRLabel8: TgtQRLabel
        Left = 464
        Top = 22
        Width = 151
        Height = 33
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          87.312500000000000000
          1227.666666666667000000
          58.208333333333330000
          399.520833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DIRECTION'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 20
      end
      object gtQRShape15: TgtQRShape
        Left = 0
        Top = 56
        Width = 717
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          0.000000000000000000
          148.166666666666700000
          1897.062500000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape16: TgtQRShape
        Left = 356
        Top = 0
        Width = 9
        Height = 313
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          828.145833333333300000
          941.916666666666700000
          0.000000000000000000
          23.812500000000000000)
        Shape = qrsVertLine
        VertAdjust = 0
      end
    end
  end
  object qryReport: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Quote.*,'
      '        Operator.Operator_Name,'
      '        Operator.Telephone_number,'
      '        Account_Manager.Operator_Name AS Account_Manager_Name,'
      '        Account_Manager.Telephone_number AS AM_Telephone_Number,'
      '        Vat.Vat_rate,'
      '        Sales_Lead_Source.Sales_Lead_Source,'
      '        Sales_Lead_Source.Sales_Lead_Source_Descr,'
      '        Material_Type.Material_Type,'
      '        Material_Type.Description as Material_Description'
      'FROM Material_Type'
      '      INNER JOIN (Vat'
      '      INNER JOIN (Sales_Lead_Source'
      '      INNER JOIN (Operator AS Account_Manager'
      '      RIGHT JOIN (Operator'
      '      INNER JOIN Quote'
      '        ON Operator.Operator = Quote.Operator)'
      '        ON Account_Manager.Operator = Quote.Account_Manager)'
      
        '        ON Sales_Lead_Source.Sales_Lead_Source = Quote.Sales_Lea' +
        'd_Source)'
      '        ON Vat.Vat = Quote.Vat)'
      '        ON Material_Type.Material_Type = Quote.Material_Type'
      'WHERE quote = :Quote')
    Left = 547
    Top = 278
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Quote'
        ParamType = ptUnknown
      end>
  end
  object qryQElements: TFDQuery
    ConnectionName = 'WT'
    MasterSource = dtsReport
    SQL.Strings = (
      'SELECT  Quote_Element.*,'
      '        Thickness.Thickness_mm,'
      '        Worktop.Description,'
      '        Material_Use.Use_Description'
      'FROM Thickness'
      '      INNER JOIN (Worktop'
      '      INNER JOIN (Worktop_thickness'
      '      INNER JOIN (Material_Use'
      '      RIGHT JOIN Quote_Element'
      
        '        ON Material_Use.Material_Use = Quote_Element.Material_Us' +
        'e)'
      
        '        ON (Worktop_thickness.Thickness = Quote_Element.Thicknes' +
        's) AND (Worktop_thickness.Worktop = Quote_Element.Worktop))'
      '        ON Worktop.Worktop = Worktop_thickness.Worktop)'
      '        ON Thickness.Thickness = Worktop_thickness.Thickness'
      'WHERE Quote = :Quote'
      'ORDER BY Element_number')
    Left = 208
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Quote'
        ParamType = ptUnknown
      end>
  end
  object dtsReport: TDataSource
    DataSet = qryReport
    Left = 160
    Top = 16
  end
  object qryQCutOuts: TFDQuery
    ConnectionName = 'WT'
    MasterSource = dtsReport
    SQL.Strings = (
      'select Quote_CutOut.*, CutOut.Description'
      'from Quote_CutOut, CutOut'
      'where Quote = :Quote and'
      'Quote_CutOut.CutOut = CutOut.CutOut')
    Left = 198
    Top = 78
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Quote'
        ParamType = ptUnknown
      end>
  end
  object qryQEdges: TFDQuery
    ConnectionName = 'wt'
    MasterSource = dtsReport
    SQL.Strings = (
      'select Quote_Edge.*, Edge_Profile.Description'
      'from Quote_Edge, Edge_Profile'
      'where Quote = :Quote and'
      'Quote_Edge.Edge_Profile = Edge_Profile.Edge_Profile'
      'order by Edge_number')
    Left = 190
    Top = 126
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Quote'
        ParamType = ptUnknown
      end>
  end
  object qryQExtras: TFDQuery
    ConnectionName = 'WT'
    MasterSource = dtsReport
    SQL.Strings = (
      'select Quote_Extra.*, Extra_Charge.Description'
      'from Quote_Extra, Extra_Charge'
      'where Quote = :Quote and'
      'Quote_Extra.Extra_Charge = Extra_Charge.Extra_Charge')
    Left = 222
    Top = 89
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
      'select Address, Address_name,'
      'Street,'
      'Locale,'
      'Town_City,'
      'County_State,'
      'postcode,'
      'Telephone_Number,'
      'Email_Address,'
      'Web_Address,'
      'Fax_Number'
      'from Address'
      'where Address = :Address')
    Left = 526
    Top = 59
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
      'County_State,'
      'postcode,'
      'Vat_Rate,'
      'Telephone_Number,'
      'Email_Address,'
      'Credit_Status,'
      'End_User_Markup_Percentage'
      'from Customer, VAT'
      'where Customer = :Customer and'
      'Customer.VAT = Vat.Vat')
    Left = 486
    Top = 286
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Customer'
        ParamType = ptUnknown
      end>
  end
  object dtsAddress: TDataSource
    Left = 566
    Top = 67
  end
  object qryCompany: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * from company'
      'where company = 1')
    Left = 542
    Top = 103
  end
  object qrygetNotes: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from Notes'
      'where notes_code = :Notes_Code'
      'order by notes_code, notes_line')
    Left = 662
    Top = 285
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Notes_Code'
        ParamType = ptUnknown
      end>
  end
  object qryUpQuote: TFDQuery
    ConnectionName = 'wT'
    SQL.Strings = (
      'update Quote'
      'set Quote_Status = :Quote_Status'
      'Where Quote = :Quote')
    Left = 358
    Top = 293
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Quote_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quote'
        ParamType = ptUnknown
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
    Left = 246
    Top = 278
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'End_User'
        ParamType = ptUnknown
      end>
  end
  object gtQRFilters1: TgtQRFilters
    HTML.Author = 'Pragnaan'
    HTML.Keywords = 'gtQrFilters'
    HTML.ImageDir = 'Images'
    PDF.Author = 'Pragnaan'
    PDF.Keywords = 'QuickReport, Export, Filters'
    RTF.Author = 'Pragnaan'
    RTF.Keywords = 'QuickReport, Export, Filters'
    RTF.ExportImageFormat = ifBMP
    Text.XScaleFactor = 1.000000000000000000
    VisibleFilters = [fkHTML, fkPDF, fkRTF, fkGIF, fkJPEG, fkBMP]
    Left = 574
    Top = 24
  end
end
