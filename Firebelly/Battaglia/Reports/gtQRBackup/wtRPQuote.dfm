object frmwtRPQuote: TfrmwtRPQuote
  Left = 2
  Top = 0
  Width = 1024
  Height = 734
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
    Left = 96
    Top = 10
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
    ReportTitle = 'Quotation print'
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsMaximized
    object qrgQuote: TQRGroup
      Left = 38
      Top = 361
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
      FooterBand = qrbQFooter
      Master = qrpDetails
      ReprintOnNewPage = False
    end
    object qrbPageHeader: TQRBand
      Left = 38
      Top = 38
      Width = 718
      Height = 323
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
        854.604166666666700000
        1899.708333333333000000)
      BandType = rbPageHeader
      object qrlblQuoteCaption: TQRLabel
        Left = 8
        Top = 128
        Width = 153
        Height = 40
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          105.833333333333300000
          21.166666666666670000
          338.666666666666700000
          404.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Quotation'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -32
        Font.Name = 'Book Antiqua'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 24
      end
      object qrmAddress: TQRMemo
        Left = 8
        Top = 176
        Width = 233
        Height = 121
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          320.145833333333400000
          21.166666666666670000
          465.666666666666800000
          616.479166666666800000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel2: TQRLabel
        Left = 575
        Top = 168
        Width = 32
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1521.354166666667000000
          444.500000000000000000
          84.666666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Date:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText1: TQRDBText
        Left = 616
        Top = 168
        Width = 75
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1629.833333333333000000
          444.500000000000000000
          198.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Date_Raised'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText2: TQRDBText
        Left = 616
        Top = 192
        Width = 36
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1629.833333333333000000
          508.000000000000000000
          95.250000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Quote'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel3: TQRLabel
        Left = 505
        Top = 192
        Width = 102
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1336.145833333333000000
          508.000000000000000000
          269.875000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Quote Reference:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel4: TQRLabel
        Left = 557
        Top = 216
        Width = 50
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1473.729166666667000000
          571.500000000000000000
          132.291666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Contact:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText3: TQRDBText
        Left = 616
        Top = 216
        Width = 92
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1629.833333333333000000
          571.500000000000000000
          243.416666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Operator_Name'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText4: TQRDBText
        Left = 616
        Top = 264
        Width = 59
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1629.833333333333000000
          698.500000000000000000
          156.104166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Reference'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel5: TQRLabel
        Left = 513
        Top = 264
        Width = 94
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1357.312500000000000000
          698.500000000000000000
          248.708333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Your Reference:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel16: TQRLabel
        Left = 565
        Top = 240
        Width = 42
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1494.895833333333000000
          635.000000000000000000
          111.125000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Phone:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText6: TQRDBText
        Left = 616
        Top = 240
        Width = 110
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1629.833333333333000000
          635.000000000000000000
          291.041666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Telephone_number'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText5: TQRDBText
        Left = 8
        Top = 305
        Width = 545
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          806.979166666666800000
          1441.979166666667000000)
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
      object qriHeadLogo: TQRImage
        Left = 216
        Top = 0
        Width = 241
        Height = 161
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          425.979166666666700000
          571.500000000000000000
          0.000000000000000000
          637.645833333333400000)
        Stretch = True
      end
    end
    object qrbPageFooter: TQRBand
      Left = 38
      Top = 1330
      Width = 718
      Height = 78
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
        206.375000000000000000
        1899.708333333333000000)
      BandType = rbPageFooter
      object memAddress: TQRRichText
        Left = 112
        Top = 8
        Width = 489
        Height = 65
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          171.979166666666700000
          296.333333333333400000
          21.166666666666670000
          1293.812500000000000000)
        Alignment = taCenter
        AutoStretch = False
        Color = clWindow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
      end
    end
    object qrsdQElements: TQRSubDetail
      Left = 38
      Top = 363
      Width = 718
      Height = 24
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
        63.500000000000000000
        1899.708333333333000000)
      Master = qrpDetails
      DataSet = qryQElements
      PrintBefore = False
      PrintIfEmpty = True
      object lblWorktopSize: TQRLabel
        Left = 320
        Top = 4
        Width = 89
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          846.666666666666600000
          10.583333333333330000
          235.479166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'lblWorktopSize'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lblWorktopArea: TQRLabel
        Left = 440
        Top = 4
        Width = 122
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1164.166666666667000000
          10.583333333333330000
          322.791666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'lblWorktopArea'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object qrsdQCutOuts: TQRSubDetail
      Left = 38
      Top = 387
      Width = 718
      Height = 26
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
        68.791666666666670000
        1899.708333333333000000)
      Master = qrpDetails
      DataSet = qryQCutOuts
      PrintBefore = False
      PrintIfEmpty = True
      object qrlblCutOutDescription: TQRDBText
        Left = 343
        Top = 4
        Width = 66
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          907.520833333333400000
          10.583333333333330000
          174.625000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryQCutOuts
        DataField = 'Description'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlblQuantity: TQRLabel
        Left = 440
        Top = 4
        Width = 122
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1164.166666666667000000
          10.583333333333330000
          322.791666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'qrlblQuantity'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object qrsdQEdges: TQRSubDetail
      Left = 38
      Top = 413
      Width = 718
      Height = 25
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
        66.145833333333340000
        1899.708333333333000000)
      Master = qrpDetails
      DataSet = qryQEdges
      PrintBefore = False
      PrintIfEmpty = True
      object qrlblLength: TQRLabel
        Left = 440
        Top = 4
        Width = 122
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1164.166666666667000000
          10.583333333333330000
          322.791666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'qrlblLength'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlblEdgeDescription: TQRLabel
        Left = 289
        Top = 4
        Width = 120
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          764.645833333333400000
          10.583333333333330000
          317.500000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblEdgeDescription'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object qrsdQExtras: TQRSubDetail
      Left = 38
      Top = 438
      Width = 718
      Height = 26
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
        68.791666666666670000
        1899.708333333333000000)
      Master = qrpDetails
      DataSet = qryQExtras
      PrintBefore = False
      PrintIfEmpty = True
      object qrlblExtraDescription: TQRDBText
        Left = 288
        Top = 5
        Width = 121
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          762.000000000000000000
          13.229166666666670000
          320.145833333333400000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryQExtras
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object qrbQFooter: TQRBand
      Left = 38
      Top = 464
      Width = 718
      Height = 153
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
        404.812500000000000000
        1899.708333333333000000)
      BandType = rbGroupFooter
      object QRShape4: TQRShape
        Left = 496
        Top = 116
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
          306.916666666666700000
          547.687500000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object lblGrossSupply: TQRLabel
        Left = 512
        Top = 8
        Width = 72
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1354.666666666667000000
          21.166666666666670000
          190.500000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'COMPLETE'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel6: TQRLabel
        Left = 512
        Top = 32
        Width = 72
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1354.666666666667000000
          84.666666666666680000
          190.500000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Fixing Team'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel7: TQRLabel
        Left = 460
        Top = 56
        Width = 124
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1217.083333333333000000
          148.166666666666700000
          328.083333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Surveying/Templating'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel8: TQRLabel
        Left = 538
        Top = 80
        Width = 46
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1423.458333333333000000
          211.666666666666700000
          121.708333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Delivery'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlblGrossPrice: TQRLabel
        Left = 612
        Top = 8
        Width = 90
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1619.250000000000000000
          21.166666666666670000
          238.125000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblGrossPrice'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlblInstallation: TQRLabel
        Left = 615
        Top = 32
        Width = 87
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1627.187500000000000000
          84.666666666666680000
          230.187500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblInstallation'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlblSurvey: TQRLabel
        Left = 638
        Top = 56
        Width = 64
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1688.041666666667000000
          148.166666666666700000
          169.333333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblSurvey'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlblDelivery: TQRLabel
        Left = 632
        Top = 80
        Width = 70
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1672.166666666667000000
          211.666666666666700000
          185.208333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblDelivery'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel17: TQRLabel
        Left = 559
        Top = 104
        Width = 26
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1479.020833333333000000
          275.166666666666700000
          68.791666666666670000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'VAT'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel18: TQRLabel
        Left = 552
        Top = 128
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
          338.666666666666700000
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
      object qrlblVAT: TQRLabel
        Left = 652
        Top = 104
        Width = 50
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1725.083333333334000000
          275.166666666666700000
          132.291666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblVAT'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlblGross: TQRLabel
        Left = 637
        Top = 128
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
          338.666666666666700000
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
      object qrlblNett: TQRLabel
        Left = 280
        Top = 32
        Width = 49
        Height = 17
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          740.833333333333400000
          84.666666666666680000
          129.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblNett'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object qrcbAvailability: TQRChildBand
      Left = 38
      Top = 669
      Width = 718
      Height = 52
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
        137.583333333333300000
        1899.708333333333000000)
      ParentBand = qrcbNotes
      object QRLabel9: TQRLabel
        Left = 40
        Top = 8
        Width = 85
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          105.833333333333300000
          21.166666666666670000
          224.895833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'AVAILABILITY'
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
      object qrrchTextAvailability: TQRRichText
        Left = 40
        Top = 26
        Width = 665
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          58.208333333333320000
          105.833333333333300000
          68.791666666666680000
          1759.479166666667000000)
        Alignment = taLeftJustify
        AutoStretch = False
        Color = clWindow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
      end
    end
    object qrcbTerms: TQRChildBand
      Left = 38
      Top = 1278
      Width = 718
      Height = 52
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
        137.583333333333300000
        1899.708333333333000000)
      ParentBand = qrcbSignature
      object QRLabel10: TQRLabel
        Left = 8
        Top = 6
        Width = 141
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          21.166666666666670000
          15.875000000000000000
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
      object qrrchtextTerms: TQRRichText
        Left = 8
        Top = 26
        Width = 697
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          58.208333333333320000
          21.166666666666670000
          68.791666666666680000
          1844.145833333333000000)
        Alignment = taLeftJustify
        AutoStretch = False
        Color = clWindow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
      end
    end
    object qrcbNotes: TQRChildBand
      Left = 38
      Top = 617
      Width = 718
      Height = 52
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
        137.583333333333300000
        1899.708333333333000000)
      ParentBand = qrbQFooter
      object qrlNotes: TQRLabel
        Left = 40
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
          105.833333333333300000
          21.166666666666670000
          119.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NOTES'
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
      object qrrchTextNotes: TQRRichText
        Left = 40
        Top = 26
        Width = 665
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          58.208333333333320000
          105.833333333333300000
          68.791666666666680000
          1759.479166666667000000)
        Alignment = taLeftJustify
        AutoStretch = False
        Color = clWindow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
      end
    end
    object qrcbSignature: TQRChildBand
      Left = 38
      Top = 862
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
      object QRShape8: TQRShape
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
      object QRShape9: TQRShape
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
      object QRLabel13: TQRLabel
        Left = 416
        Top = 64
        Width = 56
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
          148.166666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Signature'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel14: TQRLabel
        Left = 416
        Top = 96
        Width = 66
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
          174.625000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Print Name'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel15: TQRLabel
        Left = 416
        Top = 128
        Width = 28
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
          74.083333333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Date'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRShape1: TQRShape
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
      object QRShape2: TQRShape
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
      object QRShape3: TQRShape
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
      object QRLabel12: TQRLabel
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
      object QRShape5: TQRShape
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
      object QRLabel1: TQRLabel
        Left = 8
        Top = 190
        Width = 101
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          502.708333333333400000
          267.229166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Client Comments'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel19: TQRLabel
        Left = 16
        Top = 32
        Width = 25
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          42.333333333333340000
          84.666666666666680000
          66.145833333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Nett'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel20: TQRLabel
        Left = 16
        Top = 56
        Width = 26
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          42.333333333333340000
          148.166666666666700000
          68.791666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'VAT'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel21: TQRLabel
        Left = 16
        Top = 80
        Width = 29
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          42.333333333333340000
          211.666666666666700000
          76.729166666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlblDepositReqd: TQRLabel
        Left = 16
        Top = 104
        Width = 95
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          42.333333333333340000
          275.166666666666700000
          251.354166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Deposit required'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlblBalanceDue: TQRLabel
        Left = 16
        Top = 128
        Width = 158
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          42.333333333333340000
          338.666666666666700000
          418.041666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Balance due on completion'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlblNettAcc: TQRLabel
        Left = 207
        Top = 32
        Width = 49
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          547.687500000000000000
          84.666666666666680000
          129.645833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblNett'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlblVatAcc: TQRLabel
        Left = 211
        Top = 56
        Width = 45
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          558.270833333333400000
          148.166666666666700000
          119.062500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblVat'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlblGrossAcc: TQRLabel
        Left = 173
        Top = 80
        Width = 83
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          457.729166666666700000
          211.666666666666700000
          219.604166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblGrossAcc'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlblDeposit: TQRLabel
        Left = 187
        Top = 104
        Width = 69
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          494.770833333333400000
          275.166666666666700000
          182.562500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblDeposit'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlblBalance: TQRLabel
        Left = 184
        Top = 128
        Width = 72
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          486.833333333333400000
          338.666666666666700000
          190.500000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblBalance'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel24: TQRLabel
        Left = 8
        Top = 308
        Width = 115
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          814.916666666666800000
          304.270833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Installation Address'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRShape6: TQRShape
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
      object QRShape7: TQRShape
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
      object QRLabel25: TQRLabel
        Left = 8
        Top = 165
        Width = 210
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
          555.625000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Proposed date of Survey/Templates:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel28: TQRLabel
        Left = 392
        Top = 165
        Width = 143
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
          378.354166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Proposed date of Fitting:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRShape10: TQRShape
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
      object QRLabel11: TQRLabel
        Left = 416
        Top = 32
        Width = 57
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1100.666666666667000000
          84.666666666666680000
          150.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Order No.'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRShape11: TQRShape
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
    object qrcbAcceptanceHeader: TQRChildBand
      Left = 38
      Top = 721
      Width = 718
      Height = 141
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
        373.062500000000000000
        1899.708333333333000000)
      ParentBand = qrcbAvailability
      object QRLabel26: TQRLabel
        Left = 220
        Top = 8
        Width = 296
        Height = 40
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          105.833333333333300000
          582.083333333333400000
          21.166666666666670000
          783.166666666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Order Confirmation'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -32
        Font.Name = 'Book Antiqua'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 24
      end
      object QRLabel27: TQRLabel
        Left = 9
        Top = 64
        Width = 102
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          23.812500000000000000
          169.333333333333300000
          269.875000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Quote Reference:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText7: TQRDBText
        Left = 120
        Top = 64
        Width = 36
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          317.500000000000000000
          169.333333333333300000
          95.250000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Quote'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText8: TQRDBText
        Left = 8
        Top = 122
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
          322.791666666666700000
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
        FontSize = 10
      end
      object QRLabel29: TQRLabel
        Left = 9
        Top = 88
        Width = 71
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          23.812500000000000000
          232.833333333333400000
          187.854166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Quote Date:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText9: TQRDBText
        Left = 120
        Top = 88
        Width = 75
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          317.500000000000000000
          232.833333333333400000
          198.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Date_Raised'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel30: TQRLabel
        Left = 360
        Top = 64
        Width = 61
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          952.500000000000000000
          169.333333333333300000
          161.395833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Customer:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText10: TQRDBText
        Left = 432
        Top = 64
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
          169.333333333333300000
          701.145833333333200000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Customer_name'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
  end
  object qryReport: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      
        'select Quote.*, Operator.Operator_Name, Operator.Telephone_numbe' +
        'r'
      'from Quote, Operator'
      'where quote = :Quote and'
      'Quote.Operator = Operator.Operator')
    Left = 379
    Top = 110
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Quote'
        ParamType = ptUnknown
      end>
  end
  object qryQElements: TQuery
    DatabaseName = 'WT'
    DataSource = dtsReport
    SQL.Strings = (
      'select Quote_element.*, '
      'worktop.description,'
      'Thickness.Thickness_mm'
      'from Quote_element, Worktop, thickness'
      'where Quote = :Quote and'
      'Quote_Element.Worktop = Worktop.Worktop and'
      'Quote_Element.Thickness = Thickness.Thickness'
      'Order By Element_number')
    Left = 240
    Top = 24
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
  object qryQCutOuts: TQuery
    DatabaseName = 'WT'
    DataSource = dtsReport
    SQL.Strings = (
      'select Quote_CutOut.*, CutOut.Description'
      'from Quote_CutOut, CutOut'
      'where Quote = :Quote and'
      'Quote_CutOut.CutOut = CutOut.CutOut')
    Left = 238
    Top = 86
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Quote'
        ParamType = ptUnknown
      end>
  end
  object qryQEdges: TQuery
    DatabaseName = 'wt'
    DataSource = dtsReport
    SQL.Strings = (
      'select Quote_Edge.*, Edge_Profile.Description'
      'from Quote_Edge, Edge_Profile'
      'where Quote = :Quote and'
      'Quote_Edge.Edge_Profile = Edge_Profile.Edge_Profile'
      'order by Edge_number')
    Left = 150
    Top = 126
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Quote'
        ParamType = ptUnknown
      end>
  end
  object qryQExtras: TQuery
    DatabaseName = 'WT'
    DataSource = dtsReport
    SQL.Strings = (
      'select Quote_Extra.*, Extra_Charge.Description'
      'from Quote_Extra, Extra_Charge'
      'where Quote = :Quote and'
      'Quote_Extra.Extra_Charge = Extra_Charge.Extra_Charge')
    Left = 198
    Top = 161
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Quote'
        ParamType = ptUnknown
      end>
  end
  object qryAddress: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'select *'
      'from Address'
      'where Address = :Address')
    Left = 342
    Top = 51
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
      'select Customer, Customer_name,'
      'Street,'
      'Locale,'
      'Town_City,'
      'postcode,'
      'County_State,'
      'Vat_Rate,'
      'Credit_Status'
      'from Customer, VAT'
      'where Customer = :Customer and'
      'Customer.VAT = Vat.Vat')
    Left = 342
    Top = 86
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Customer'
        ParamType = ptUnknown
      end>
  end
  object dtsAddress: TDataSource
    Left = 406
    Top = 51
  end
  object qryCompany: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'select * from company'
      'where company = 1')
    Left = 502
    Top = 111
  end
  object qrygetNotes: TQuery
    DatabaseName = 'wt'
    SQL.Strings = (
      'select *'
      'from Notes'
      'where notes_code = :Notes_Code'
      'order by notes_code, notes_line')
    Left = 502
    Top = 61
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Notes_Code'
        ParamType = ptUnknown
      end>
  end
  object qryUpQuote: TQuery
    DatabaseName = 'wT'
    SQL.Strings = (
      'update Quote'
      'set Quote_Status = :Quote_Status'
      'Where Quote = :Quote')
    Left = 326
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
  object qryEndUser: TQuery
    DatabaseName = 'WT'
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
    Left = 342
    Top = 158
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'End_User'
        ParamType = ptUnknown
      end>
  end
  object gtQRFilters1: TgtQRFilters
    Text.XScaleFactor = 1.000000000000000000
    VisibleFilters = [fkHTML, fkPDF, fkRTF, fkGIF, fkJPEG, fkBMP]
    Left = 638
    Top = 72
  end
end
