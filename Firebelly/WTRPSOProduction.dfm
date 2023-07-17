object frmWTRPSOProduction: TfrmWTRPSOProduction
  Left = 203
  Top = 110
  Width = 1168
  Height = 511
  Caption = 'Sales Order Production Report'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object qrpdetails: TQuickRep
    Left = 144
    Top = 8
    Width = 794
    Height = 1123
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    BeforePrint = qrpdetailsBeforePrint
    DataSet = qryWorktops
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
    object qrSubMaterial: TQRSubDetail
      Left = 38
      Top = 155
      Width = 718
      Height = 27
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = qrSubMaterialAfterPrint
      AlignToBottom = False
      BeforePrint = qrSubMaterialBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        71.437500000000000000
        1899.708333333333000000)
      Master = qrpdetails
      DataSet = qryWorktops
      FooterBand = qrgrpFootMaterial
      HeaderBand = qrgrpHeadMaterial
      PrintBefore = False
      PrintIfEmpty = True
      object qrlblMaterialDescription: TQRLabel
        Left = 64
        Top = 4
        Width = 136
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          169.333333333333300000
          10.583333333333330000
          359.833333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblMaterialDescription'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlblArea: TQRLabel
        Left = 480
        Top = 4
        Width = 52
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1270.000000000000000000
          10.583333333333330000
          137.583333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblArea'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object qrgrpHeadMaterial: TQRBand
      Left = 38
      Top = 153
      Width = 718
      Height = 2
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = qrgrpHeadMaterialBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        5.291666666666667000
        1899.708333333333000000)
      BandType = rbGroupHeader
      object qrlblMaterialTitle: TQRLabel
        Left = 64
        Top = 8
        Width = 117
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          169.333333333333300000
          21.166666666666670000
          309.562500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Material Type/Brand'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlblMaterialCount: TQRLabel
        Left = 434
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
          1148.291666666667000000
          21.166666666666670000
          171.979166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Area (sqm)'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object qrSubCutOuts: TQRSubDetail
      Left = 38
      Top = 214
      Width = 718
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = qrSubCutOutsAfterPrint
      AlignToBottom = False
      BeforePrint = qrSubCutOutsBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        84.666666666666670000
        1899.708333333333000000)
      Master = qrpdetails
      DataSet = qryCutOuts
      HeaderBand = qrgrpHeadCutOuts
      PrintBefore = False
      PrintIfEmpty = True
      object qrlblCutOutDescription: TQRLabel
        Left = 64
        Top = 8
        Width = 393
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          169.333333333333300000
          21.166666666666670000
          1039.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'qrlblCutOutDescription'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlblQuantity: TQRLabel
        Left = 458
        Top = 8
        Width = 74
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1211.791666666667000000
          21.166666666666670000
          195.791666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblQuantity'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object qrgrpHeadCutOuts: TQRBand
      Left = 38
      Top = 212
      Width = 718
      Height = 2
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = qrgrpHeadCutOutsAfterPrint
      AlignToBottom = False
      BeforePrint = qrgrpHeadCutOutsBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        5.291666666666667000
        1899.708333333333000000)
      BandType = rbGroupHeader
      object qrlblCutOutTitle: TQRLabel
        Left = 64
        Top = 6
        Width = 53
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          169.333333333333300000
          15.875000000000000000
          140.229166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Cut Outs'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlblCutOutCount: TQRLabel
        Left = 454
        Top = 6
        Width = 46
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1201.208333333333000000
          15.875000000000000000
          121.708333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Number'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object qrsubEdgeProfile: TQRSubDetail
      Left = 38
      Top = 248
      Width = 718
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = qrsubEdgeProfileAfterPrint
      AlignToBottom = False
      BeforePrint = qrsubEdgeProfileBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        84.666666666666670000
        1899.708333333333000000)
      Master = qrpdetails
      DataSet = qryEdges
      FooterBand = qrgrpFootEdgeProfile
      HeaderBand = qrgrpEdgeProfile
      PrintBefore = False
      PrintIfEmpty = True
      object qrlblEdgeProfileDescription: TQRLabel
        Left = 64
        Top = 8
        Width = 393
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          169.333333333333300000
          21.166666666666670000
          1039.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'qrlblEdgeProfileDescription'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlblLength: TQRLabel
        Left = 468
        Top = 8
        Width = 64
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1238.250000000000000000
          21.166666666666670000
          169.333333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblLength'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object qrgrpEdgeProfile: TQRBand
      Left = 38
      Top = 246
      Width = 718
      Height = 2
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = qrgrpEdgeProfileAfterPrint
      AlignToBottom = False
      BeforePrint = qrgrpEdgeProfileBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        5.291666666666667000
        1899.708333333333000000)
      BandType = rbGroupHeader
      object qrlblEdgeTitle: TQRLabel
        Left = 64
        Top = 7
        Width = 78
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          169.333333333333300000
          18.520833333333330000
          206.375000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Edge Profiles'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlblEdgeCount: TQRLabel
        Left = 437
        Top = 7
        Width = 63
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1156.229166666667000000
          18.520833333333330000
          166.687500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Length (m)'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QRBand1: TQRBand
      Left = 38
      Top = 38
      Width = 718
      Height = 115
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
        304.270833333333300000
        1899.708333333333000000)
      BandType = rbPageHeader
      object qrlblCaption: TQRLabel
        Left = 226
        Top = 2
        Width = 269
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.854166666666670000
          597.958333333333300000
          5.291666666666667000
          711.729166666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Production Requirement Report'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 14
      end
      object qrlblDateRange: TQRLabel
        Left = 316
        Top = 26
        Width = 88
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          836.083333333333300000
          68.791666666666670000
          232.833333333333300000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblDateRange'
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
      object gtQRSysData1: TQRSysData
        Left = 654
        Top = 8
        Width = 56
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1730.375000000000000000
          21.166666666666670000
          148.166666666666700000)
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
        Transparent = False
        FontSize = 8
      end
      object gtQRSysData2: TQRSysData
        Left = 640
        Top = 23
        Width = 69
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1693.333333333333000000
          60.854166666666670000
          182.562500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = 'Page: '
        Transparent = False
        FontSize = 8
      end
      object qrlblSelection: TQRLabel
        Left = 183
        Top = 46
        Width = 353
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          484.187500000000000000
          121.708333333333300000
          933.979166666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'qrlblSelection'
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
      object qrlblCategoryTitle: TQRLabel
        Left = 64
        Top = 94
        Width = 169
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          169.333333333333300000
          248.708333333333300000
          447.145833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'CNC - Cut Out Requirements'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlblCategoryCount: TQRLabel
        Left = 486
        Top = 94
        Width = 46
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1285.875000000000000000
          248.708333333333300000
          121.708333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Number'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object qrgrpFootMaterial: TQRBand
      Left = 38
      Top = 182
      Width = 718
      Height = 30
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = qrgrpFootMaterialBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        79.375000000000000000
        1899.708333333333000000)
      BandType = rbGroupFooter
      object gtQRLabel1: TQRLabel
        Left = 312
        Top = 8
        Width = 105
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          825.500000000000000000
          21.166666666666670000
          277.812500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total Area (sqm)'
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
      object qrlblTotalArea: TQRLabel
        Left = 472
        Top = 8
        Width = 60
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1248.833333333333000000
          21.166666666666670000
          158.750000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblArea'
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
      object gtQRShape1: TQRShape
        Left = 284
        Top = 0
        Width = 249
        Height = 8
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          21.166666666666670000
          751.416666666666700000
          0.000000000000000000
          658.812500000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
    object qrgrpFootEdgeProfile: TQRBand
      Left = 38
      Top = 280
      Width = 718
      Height = 30
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = qrgrpFootEdgeProfileBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        79.375000000000000000
        1899.708333333333000000)
      BandType = rbGroupFooter
      object qrlblTotalLength: TQRLabel
        Left = 426
        Top = 8
        Width = 106
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1127.125000000000000000
          21.166666666666670000
          280.458333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblTotalLength'
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
        Left = 304
        Top = 8
        Width = 125
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          804.333333333333300000
          21.166666666666670000
          330.729166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total Linear metres'
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
      object gtQRShape3: TQRShape
        Left = 284
        Top = 0
        Width = 249
        Height = 8
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          21.166666666666670000
          751.416666666666700000
          0.000000000000000000
          658.812500000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
  end
  object qryWorktops: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'SELECT  Material_Type.Description AS Material_Description,'
      
        '        Sum(((Quote_Element.Depth*Quote_Element.Length)/1000000)' +
        '*Quote_Element.Quantity) AS Total_Area'
      'FROM Customer'
      '        INNER JOIN (Material_Type'
      '        INNER JOIN (Sales_Order'
      '        INNER JOIN (((Quote_Element'
      '        INNER JOIN (Sales_Order_Line'
      '        INNER JOIN Quote'
      '          ON Sales_Order_Line.Quote = Quote.Quote)'
      '          ON Quote_Element.Quote = Quote.Quote)'
      '        INNER JOIN Worktop'
      '          ON Quote_Element.Worktop = Worktop.Worktop)'
      '        INNER JOIN Thickness'
      '          ON Quote_Element.Thickness = Thickness.Thickness)'
      
        '          ON Sales_Order.Sales_Order = Sales_Order_Line.Sales_Or' +
        'der)'
      
        '          ON Material_Type.Material_Type = Worktop.Material_Type' +
        ')'
      '          ON Customer.Customer = Sales_Order.Customer'
      
        'WHERE ((Sales_Order.Date_Required >= :Date_From) and (Sales_orde' +
        'r.Date_Required <= :Date_To)) and'
      '      (Sales_Order.Sales_Order_Status < 1000) and'
      
        '      ((Sales_Order.inactive = '#39'N'#39') or (Sales_Order.inactive is ' +
        'NULL) or (Sales_Order.inactive = '#39#39')) AND'
      
        '      (((Customer.Is_Retail_Customer = :Is_Retail_Customer) AND ' +
        '(Customer.Is_Commercial_Customer = :Is_Commercial_Customer)) or ' +
        '(:Is_Retail_Customer = '#39'A'#39'))'
      ''
      '')
    Left = 976
    Top = 192
    ParamData = <
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
        Name = 'Is_Retail_Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Is_Commercial_Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Is_Retail_Customer'
        ParamType = ptUnknown
      end>
  end
  object qryCutOuts: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'SELECT  Material_Type.Description AS Material_Description,'
      '        Edge_Type.Edge_Type_Description,'
      '        CutOut.Description AS CutOut_Description,'
      '        Sum(Quote_Cutout.Quantity) AS Total_Quantity'
      'FROM Customer'
      '        INNER JOIN (Sales_Order'
      '        INNER JOIN (CutOut'
      '        INNER JOIN ((Sales_Order_Line'
      '        INNER JOIN Quote'
      '          ON Sales_Order_Line.Quote = Quote.Quote)'
      '        INNER JOIN ((Quote_Cutout'
      '        INNER JOIN Material_Type'
      
        '          ON Quote_Cutout.Material_Type = Material_Type.Material' +
        '_Type)'
      '        INNER JOIN Edge_Type'
      '          ON Quote_Cutout.Edge_Type = Edge_Type.Edge_Type)'
      '          ON Quote.Quote = Quote_Cutout.Quote)'
      '          ON CutOut.CutOut = Quote_Cutout.Cutout)'
      
        '          ON Sales_Order.Sales_Order = Sales_Order_Line.Sales_Or' +
        'der)'
      '          ON Customer.Customer = Sales_Order.Customer'
      
        'WHERE ((Sales_Order.Date_Required >= :Date_From) and (Sales_orde' +
        'r.Date_Required <= :Date_To)) and'
      '      (Sales_Order.Sales_Order_Status < 90) and'
      
        '      ((Sales_Order.inactive = '#39'N'#39') or (Sales_Order.inactive is ' +
        'NULL) or (Sales_Order.inactive = '#39#39')) AND'
      
        '      ((Customer.Is_Retail_Customer = :TradeRetail) OR (:TradeRe' +
        'tail = '#39'A'#39'))'
      '')
    Left = 976
    Top = 248
    ParamData = <
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
        Name = 'TradeRetail'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TradeRetail'
        ParamType = ptUnknown
      end>
  end
  object qryEdges: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'SELECT  Edge_profile.Description AS Edge_Profile_Description,'
      '        Material_Type.Description as Material_Description,'
      '        Edge_Type.Edge_Type_Description,'
      '        Sum(Quote_Edge.Length/1000) AS Total_Length'
      'FROM Customer'
      '      INNER JOIN (Sales_Order'
      '      INNER JOIN (Edge_profile'
      '      INNER JOIN ((Sales_Order_Line'
      '      INNER JOIN Quote'
      '        ON Sales_Order_Line.Quote = Quote.Quote)'
      '      INNER JOIN ((Quote_Edge'
      '      INNER JOIN Material_Type'
      
        '        ON Quote_Edge.Material_Type = Material_Type.Material_Typ' +
        'e)'
      '      INNER JOIN Edge_Type'
      '        ON Quote_Edge.Edge_Type = Edge_Type.Edge_Type)'
      '        ON Quote.Quote = Quote_Edge.Quote)'
      '        ON Edge_profile.Edge_profile = Quote_Edge.Edge_profile)'
      
        '        ON Sales_Order.Sales_Order = Sales_Order_Line.Sales_Orde' +
        'r)'
      '        ON Customer.Customer = Sales_Order.Customer'
      
        'WHERE ((Sales_Order.Date_Required >= :Date_From) and (Sales_orde' +
        'r.Date_Required <= :Date_To)) and'
      '      (Sales_Order.Sales_Order_Status < 90) and'
      
        '      ((Sales_Order.inactive = '#39'N'#39') or (Sales_Order.inactive is ' +
        'NULL) or (Sales_Order.inactive = '#39#39')) AND'
      
        '      ((Customer.Is_Retail_Customer = :TradeRetail) OR (:TradeRe' +
        'tail = '#39'A'#39'))'
      '')
    Left = 976
    Top = 312
    ParamData = <
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
        Name = 'TradeRetail'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TradeRetail'
        ParamType = ptUnknown
      end>
  end
  object qryBaseCutOuts: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'FROM Customer'
      '        INNER JOIN (Sales_Order'
      '        INNER JOIN (CutOut'
      '        INNER JOIN ((Sales_Order_Line'
      '        INNER JOIN Quote'
      '          ON Sales_Order_Line.Quote = Quote.Quote)'
      '        INNER JOIN ((Quote_Cutout'
      '        INNER JOIN Material_Type'
      
        '          ON Quote_Cutout.Material_Type = Material_Type.Material' +
        '_Type)'
      '        INNER JOIN Edge_Type'
      '          ON Quote_Cutout.Edge_Type = Edge_Type.Edge_Type)'
      '          ON Quote.Quote = Quote_Cutout.Quote)'
      '          ON CutOut.CutOut = Quote_Cutout.Cutout)'
      
        '          ON Sales_Order.Sales_Order = Sales_Order_Line.Sales_Or' +
        'der)'
      '          ON Customer.Customer = Sales_Order.Customer'
      
        'WHERE ((Sales_Order.Date_Required >= :Date_From) and (Sales_orde' +
        'r.Date_Required <= :Date_To)) and'
      '      (Sales_Order.Sales_Order_Status < 1000) and'
      
        '      ((Sales_Order.inactive = '#39'N'#39') or (Sales_Order.inactive is ' +
        'NULL) or (Sales_Order.inactive = '#39#39')) AND'
      
        '      (((Customer.Is_Retail_Customer = :Is_Retail_Customer) AND ' +
        '(Customer.Is_Commercial_Customer = :Is_Commercial_Customer)) or ' +
        '(:Is_Retail_Customer = '#39'A'#39'))'
      '')
    Left = 1048
    Top = 248
    ParamData = <
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
        Name = 'Is_Retail_Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Is_Commercial_Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Is_Retail_Customer'
        ParamType = ptUnknown
      end>
  end
  object qryBaseEdges: TQuery
    DatabaseName = 'WT'
    SQL.Strings = (
      'FROM Customer'
      '      INNER JOIN (Sales_Order'
      '      INNER JOIN (Edge_profile'
      '      INNER JOIN ((Sales_Order_Line'
      '      INNER JOIN Quote'
      '        ON Sales_Order_Line.Quote = Quote.Quote)'
      '      INNER JOIN ((Quote_Edge'
      '      INNER JOIN Material_Type'
      
        '        ON Quote_Edge.Material_Type = Material_Type.Material_Typ' +
        'e)'
      '      INNER JOIN Edge_Type'
      '        ON Quote_Edge.Edge_Type = Edge_Type.Edge_Type)'
      '        ON Quote.Quote = Quote_Edge.Quote)'
      '        ON Edge_profile.Edge_profile = Quote_Edge.Edge_profile)'
      
        '        ON Sales_Order.Sales_Order = Sales_Order_Line.Sales_Orde' +
        'r)'
      '        ON Customer.Customer = Sales_Order.Customer'
      
        'WHERE ((Sales_Order.Date_Required >= :Date_From) and (Sales_orde' +
        'r.Date_Required <= :Date_To)) and'
      '      (Sales_Order.Sales_Order_Status < 1000) and'
      
        '      ((Sales_Order.inactive = '#39'N'#39') or (Sales_Order.inactive is ' +
        'NULL) or (Sales_Order.inactive = '#39#39')) AND'
      
        '      (((Customer.Is_Retail_Customer = :Is_Retail_Customer) AND ' +
        '(Customer.Is_Commercial_Customer = :Is_Commercial_Customer)) or ' +
        '(:Is_Retail_Customer = '#39'A'#39'))'
      '')
    Left = 1048
    Top = 312
    ParamData = <
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
        Name = 'Is_Retail_Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Is_Commercial_Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Is_Retail_Customer'
        ParamType = ptUnknown
      end>
  end
end
