object STRPSlwMvngStkRepfrm: TSTRPSlwMvngStkRepfrm
  Left = 65
  Top = 122
  Width = 798
  Height = 480
  HorzScrollBar.Position = 289
  Caption = 'Slow Moving Stock Report'
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
  object qrDetails: TQuickRep
    Left = -289
    Top = 0
    Width = 1123
    Height = 794
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    BeforePrint = qrDetailsBeforePrint
    DataSet = qrySlwMvngStk
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
    Page.Orientation = poLandscape
    Page.PaperSize = A4
    Page.Values = (
      100.000000000000000000
      2100.000000000000000000
      100.000000000000000000
      2970.000000000000000000
      50.000000000000000000
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
    PrintIfEmpty = False
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsMaximized
    object qrbndDetail: TQRBand
      Left = 19
      Top = 187
      Width = 1066
      Height = 38
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = qrbndDetailAfterPrint
      AlignToBottom = False
      BeforePrint = qrbndDetailBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        100.541666666666700000
        2820.458333333333000000)
      BandType = rbDetail
      object QRDBText1: TQRDBText
        Left = 5
        Top = 0
        Width = 20
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          13.229166666666670000
          0.000000000000000000
          52.916666666666660000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qrySlwMvngStk
        DataField = 'Part'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText2: TQRDBText
        Left = 5
        Top = 16
        Width = 55
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          13.229166666666670000
          42.333333333333340000
          145.520833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qrySlwMvngStk
        DataField = 'Description'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText4: TQRDBText
        Left = 489
        Top = 0
        Width = 74
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1293.812500000000000000
          0.000000000000000000
          195.791666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qrySlwMvngStk
        DataField = 'Stock_Quantity'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText5: TQRDBText
        Left = 685
        Top = 0
        Width = 62
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1812.395833333333000000
          0.000000000000000000
          164.041666666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qrySlwMvngStk
        DataField = 'Stock_Value'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText6: TQRDBText
        Left = 886
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
          2344.208333333333000000
          0.000000000000000000
          105.833333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qrySlwMvngStk
        DataField = 'part_bin'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlblBoxCountVal: TQRLabel
        Left = 627
        Top = 0
        Width = 54
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1658.937500000000000000
          0.000000000000000000
          142.875000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Box_Count'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText7: TQRDBText
        Left = 563
        Top = 0
        Width = 51
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1489.604166666667000000
          0.000000000000000000
          134.937500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qrySlwMvngStk
        DataField = 'Pack_Size'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText8: TQRDBText
        Left = 760
        Top = 0
        Width = 52
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2010.833333333333000000
          0.000000000000000000
          137.583333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qrySlwMvngStk
        DataField = 'Part_Store'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText10: TQRDBText
        Left = 943
        Top = 0
        Width = 51
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2495.020833333333000000
          0.000000000000000000
          134.937500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qrySlwMvngStk
        DataField = 'Stock_Ref'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLblInUse: TQRLabel
        Left = 1022
        Top = 0
        Width = 15
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333300000
          2704.041666666670000000
          0.000000000000000000
          39.687500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = ' *'
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
      object QRDBText11: TQRDBText
        Left = 192
        Top = 0
        Width = 172
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          508.000000000000000000
          0.000000000000000000
          455.083333333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qrySlwMvngStk
        DataField = 'Cust_Name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRDBText12: TQRDBText
        Left = 192
        Top = 16
        Width = 172
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          508.000000000000000000
          42.333333333333300000
          455.083333333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qrySlwMvngStk
        DataField = 'Rep_Name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLblSlsOrd: TQRLabel
        Left = 372
        Top = 0
        Width = 63
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          984.250000000000000000
          0.000000000000000000
          166.687500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRLblSlsOrd'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLblDtReq: TQRLabel
        Left = 453
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
          1198.562500000000000000
          0.000000000000000000
          156.104166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRLblDtReq'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object QRBand: TQRBand
      Left = 19
      Top = 38
      Width = 1066
      Height = 149
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        394.229166666666700000
        2820.458333333333000000)
      BandType = rbPageHeader
      object TitleQRLabel: TQRLabel
        Left = 406
        Top = 8
        Width = 253
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333340000
          1074.208333333333000000
          21.166666666666670000
          669.395833333333400000)
        Alignment = taCenter
        AlignToBand = True
        AutoSize = True
        AutoStretch = False
        Caption = 'Slow Moving Stock Report '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 16
      end
      object qrlblDateSince: TQRLabel
        Left = 389
        Top = 40
        Width = 288
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333340000
          1029.229166666667000000
          105.833333333333300000
          762.000000000000000000)
        Alignment = taCenter
        AlignToBand = True
        AutoSize = True
        AutoStretch = False
        Caption = 'Report showing stock with no movements since:- '
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
      object qrPart: TQRLabel
        Left = 8
        Top = 96
        Width = 47
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          254.000000000000000000
          124.354166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Product/'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
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
        Left = 0
        Top = 128
        Width = 1050
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          34.395833333333300000
          0.000000000000000000
          338.666666666667000000
          2778.125000000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrlblDesc: TQRLabel
        Left = 8
        Top = 112
        Width = 64
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          296.333333333333400000
          169.333333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Description'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlblPack: TQRLabel
        Left = 448
        Top = 112
        Width = 52
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1185.333333333333000000
          296.333333333333300000
          137.583333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Date Req.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlblStock: TQRLabel
        Left = 518
        Top = 112
        Width = 45
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1370.541666666667000000
          296.333333333333300000
          119.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'In Stock'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel4: TQRLabel
        Left = 870
        Top = 112
        Width = 64
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2301.875000000000000000
          296.333333333333300000
          169.333333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Bin location'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel3: TQRLabel
        Left = 624
        Top = 112
        Width = 57
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1651.000000000000000000
          296.333333333333300000
          150.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Box Count'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel5: TQRLabel
        Left = 688
        Top = 112
        Width = 66
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1820.333333333333000000
          296.333333333333300000
          174.625000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Stock Value'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
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
        Left = 760
        Top = 112
        Width = 31
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2010.833333333333000000
          296.333333333333300000
          82.020833333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Store'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel2: TQRLabel
        Left = 568
        Top = 112
        Width = 53
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1502.833333333333000000
          296.333333333333300000
          140.229166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Pack Size'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel6: TQRLabel
        Left = 374
        Top = 112
        Width = 66
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          989.541666666666600000
          296.333333333333300000
          174.625000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Sales Order'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel7: TQRLabel
        Left = 944
        Top = 112
        Width = 56
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2497.666666666667000000
          296.333333333333300000
          148.166666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Stock Ref.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel8: TQRLabel
        Left = 1006
        Top = 112
        Width = 56
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          2661.708333333333000000
          296.333333333333300000
          148.166666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Not in Use'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object PageQRSysData: TQRSysData
        Left = 867
        Top = 40
        Width = 91
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          2293.937500000000000000
          105.833333333333300000
          240.770833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = 'Page:'
        Transparent = False
        FontSize = 11
      end
      object QRSysData2: TQRSysData
        Left = 867
        Top = 16
        Width = 118
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625000000000000000
          2293.937500000000000000
          42.333333333333340000
          312.208333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = 'Date :'
        Transparent = False
        FontSize = 11
      end
      object qrlblRange: TQRLabel
        Left = 487
        Top = 64
        Width = 92
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333340000
          1288.520833333333000000
          169.333333333333300000
          243.416666666666700000)
        Alignment = taCenter
        AlignToBand = True
        AutoSize = True
        AutoStretch = False
        Caption = 'From Product - '
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
      object QRLblCust: TQRLabel
        Left = 485
        Top = 88
        Width = 95
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333340000
          1283.229166666667000000
          232.833333333333300000
          251.354166666666700000)
        Alignment = taCenter
        AlignToBand = True
        AutoSize = True
        AutoStretch = False
        Caption = 'From Customer '
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
      object QRLabel12: TQRLabel
        Left = 192
        Top = 96
        Width = 60
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          508.000000000000000000
          254.000000000000000000
          158.750000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Customer/'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel13: TQRLabel
        Left = 208
        Top = 112
        Width = 22
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          550.333333333333400000
          296.333333333333400000
          58.208333333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Rep'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object QRBand2: TQRBand
      Left = 19
      Top = 225
      Width = 1066
      Height = 32
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = QRBand2BeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        84.666666666666680000
        2820.458333333333000000)
      BandType = rbSummary
      object QRLabel9: TQRLabel
        Left = 564
        Top = 8
        Width = 96
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1492.250000000000000000
          21.166666666666670000
          254.000000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total Stock Value'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object qrlblTotalStkVal: TQRLabel
        Left = 680
        Top = 8
        Width = 66
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1799.166666666667000000
          21.166666666666670000
          174.625000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Stock Value'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRShape2: TQRShape
        Left = 565
        Top = 4
        Width = 188
        Height = 1
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          2.645833333333330000
          1494.895833333330000000
          10.583333333333300000
          497.416666666667000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
  end
  object qrySlwMvngStk: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select   store_stock.part as Part,'
      '         part.part_description as Description,'
      '         part.Not_In_Use,'
      '         Customer.name as Cust_Name,'
      '         Rep.Name as Rep_Name,'
      '         store_stock.Stock_Pack_Quantity as Pack_Size,'
      '         part_store.part_store_name as Part_Store,'
      '         store_stock.part_bin,'
      '         store_stock.Store_stock_description as Stock_Ref,'
      '          sum(store_stock.Store_Quantity) as Stock_Quantity,'
      '          sum(store_stock.Store_Cost) as Stock_Value'
      'FROM Rep RIGHT JOIN (Reps_Branches RIGHT JOIN ((((Part'
      #9#9'RIGHT JOIN Store_Stock ON Part.Part = Store_Stock.Part) '
      
        #9#9'LEFT JOIN Part_Store ON Store_Stock.Part_Store = Part_Store.Pa' +
        'rt_Store)'
      #9#9'LEFT JOIN Customer ON Part.Customer = Customer.Customer)'
      
        #9#9'LEFT JOIN Customer_Branch ON Customer.Customer = Customer_Bran' +
        'ch.Customer) '
      #9#9#9'ON (Reps_Branches.Branch_no = Customer_Branch.Branch_no) '
      #9#9#9'AND (Reps_Branches.Customer = Customer_Branch.Customer))'
      #9#9#9'ON Rep.Rep = Reps_Branches.Rep'
      
        'where     (store_stock.part >= :PartFrom) and (store_stock.part ' +
        '<= :PartTo) and'
      
        '          ((Part.Not_In_Use <> :Not_in_Use) or (:Not_in_Use = '#39#39 +
        ')) and'
      
        '          (((Part.Customer = :Customer) and (Part.Branch_No = :C' +
        'ustBranch)) or (:Customer = 0)) and'
      '          ((:Rep = 0) or (Rep.Rep = :Rep)) AND'
      '          (store_stock.date_received <= :DateFrom) AND'
      
        '          (Store_Stock.Part not in (select distinct Part from sa' +
        'les_order_line, sales_order'
      
        #9#9#9'    WHERE sales_order_line.sales_order = sales_order.sales_or' +
        'der and'
      #9#9#9#9'        sales_order.date_required > :DateFrom))'
      'group by  store_stock.part,'
      '          part.part_description,'
      '          Part.Not_In_use,'
      '          Customer.name,'
      '          Rep.Name,'
      '          store_stock.Stock_Pack_Quantity,'
      '          part_store.part_store_name,'
      '          store_stock.part_bin,'
      '          store_stock.Store_stock_description'
      'order by store_stock.part'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 344
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PartFrom'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PartTo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Not_in_Use'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Not_in_Use'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CustBranch'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Rep'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Rep'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DateFrom'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DateFrom'
        ParamType = ptUnknown
      end>
  end
  object DataSource1: TDataSource
    DataSet = qrySlwMvngStk
    Left = 66
    Top = 16
  end
  object SQLGetSlsDt: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      
        'SELECT distinct Sales_Order.Sales_Order, Sales_Order.Date_Requir' +
        'ed'
      'FROM Sales_Order INNER JOIN (Part INNER JOIN Sales_Order_line'
      'ON Part.Part = Sales_Order_line.Part)'
      'ON Sales_Order.Sales_Order = Sales_Order_line.Sales_Order'
      'where sales_order_line.part = :part and'
      
        '((Sales_Order.Date_Required <= :Date) or (Sales_Order.Date_Requi' +
        'red is null))'
      'order by Sales_Order.Date_Required desc,'
      'sales_order.sales_order desc'
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    Left = 259
    Top = 54
    ParamData = <
      item
        DataType = ftInteger
        Name = 'part'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Date'
        ParamType = ptUnknown
      end>
  end
  object gtQRFilters1: TgtQRFilters
    HTML.Author = 'Gnostice'
    HTML.Keywords = 'gtQrFilters'
    HTML.ImageDir = 'Images'
    PDF.Author = 'Gnostice'
    PDF.Keywords = 'QuickReport, Export, Filters'
    RTF.Author = 'Gnostice'
    RTF.Keywords = 'QuickReport, Export, Filters'
    RTF.ExportImageFormat = ifBMP
    Text.XScaleFactor = 1.000000000000000000
    VisibleFilters = [fkHTML, fkPDF, fkRTF, fkExcel, fkText, fkGIF, fkJPEG, fkBMP, fkEMF, fkWMF]
    Left = 480
    Top = 46
  end
  object qrySlowMvgNoRep: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT '#9'Store_Stock.Store_Quantity as Stock_Quantity,'
      #9'Store_Stock.Store_Cost as Stock_Value, '
      #9'Store_Stock.Part, '
      #9'Part.Part_Description as Description,'
      #9'Part.Not_In_Use,'
      #9'Store_Stock.Stock_Pack_Quantity as Pack_Size,'
      #9'Store_Stock.Store_Stock_Description as Stock_Ref,'
      #9'Store_Stock.Part_Bin, '
      #9'Store_Stock.Date_Received, '
      #9'Customer.Name AS Cust_Name, '
      #9'Part_Store.Part_Store_Name as Part_Store,'
      '  Part.Customer,'
      '  Part.Branch_no,'
      '  (select top 1 Rep.Name'
      '   from Rep, Reps_Branches'
      '   where (Reps_Branches.customer = Part.Customer and'
      '         Reps_Branches.branch_no = Part.Branch_no) and'
      '         Rep.Rep = Reps_Branches.Rep) as Rep_Name'
      'FROM Part_Store '
      #9'INNER JOIN ((Part '
      #9'LEFT JOIN Customer ON Part.Customer = Customer.Customer) '
      
        #9'INNER JOIN Store_Stock ON Part.Part = Store_Stock.Part) ON Part' +
        '_Store.Part_Store = Store_Stock.Part_Store'
      
        'WHERE     (store_stock.part >= :PartFrom) and (store_stock.part ' +
        '<= :PartTo) and'
      
        '          ((Part.Not_In_Use <> :Not_in_Use) or (:Not_in_Use = '#39#39 +
        ')) and'
      
        '          (((Part.Customer = :Customer) and (Part.Branch_No = :C' +
        'ustBranch)) or (:Customer = 0)) AND'
      '          (store_stock.date_received <= :DateFrom) AND'
      
        '          (Store_Stock.Part not in (select distinct Part from sa' +
        'les_order_line, sales_order'
      
        #9#9#9'    WHERE sales_order_line.sales_order = sales_order.sales_or' +
        'der and'
      #9#9#9#9'        sales_order.date_required > :DateFrom))'
      'ORDER BY Store_Stock.Part'
      ''
      '')
    Left = 346
    Top = 110
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PartFrom'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PartTo'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Not_in_Use'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Not_in_Use'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'CustBranch'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DateFrom'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DateFrom'
        ParamType = ptUnknown
      end>
  end
end
