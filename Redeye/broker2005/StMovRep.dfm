object StMovRepFrm: TStMovRepFrm
  Left = 30
  Top = 104
  Caption = 'Stock Movement Audit Report'
  ClientHeight = 533
  ClientWidth = 1124
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Scaled = False
  OnActivate = FormActivate
  TextHeight = 13
  object StMoveQuickRep: TQuickRep
    Left = 5
    Top = 0
    Width = 1403
    Height = 992
    ShowingPreview = False
    BeforePrint = StMoveQuickRepBeforePrint
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE'
      'QRSTRINGSBAND1')
    Functions.DATA = (
      '0'
      '0'
      #39#39
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poLandscape
    Page.PaperSize = A4
    Page.Continuous = False
    Page.Values = (
      100.000000000000000000
      2100.000000000000000000
      100.000000000000000000
      2970.000000000000000000
      100.000000000000000000
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
    object QRBand2: TQRBand
      Left = 47
      Top = 47
      Width = 1309
      Height = 84
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        177.800000000000000000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object TitleQRLabel: TQRLabel
        Left = 523
        Top = 10
        Width = 294
        Height = 33
        Size.Values = (
          69.850000000000000000
          1107.016666666667000000
          21.166666666666670000
          622.300000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Stock Movement Report'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 16
      end
      object SelDateQRLabel: TQRLabel
        Left = 613
        Top = 40
        Width = 97
        Height = 24
        Size.Values = (
          50.800000000000000000
          1297.516666666667000000
          84.666666666666670000
          205.316666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoStretch = True
        Caption = 'SelDateQRLabel'
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
        FontSize = 8
      end
      object QRSysData1: TQRSysData
        Left = 1186
        Top = 10
        Width = 103
        Height = 23
        Size.Values = (
          48.683333333333330000
          2510.366666666667000000
          21.166666666666670000
          218.016666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = 'Date :'
        Transparent = False
        ExportAs = exptText
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object PageQRSysData: TQRSysData
        Left = 1209
        Top = 40
        Width = 80
        Height = 24
        Size.Values = (
          50.800000000000000000
          2559.050000000000000000
          84.666666666666670000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = 'Page:'
        Transparent = False
        ExportAs = exptText
        VerticalAlignment = tlTop
        FontSize = 8
      end
    end
    object QRSubDetail1: TQRSubDetail
      Left = 47
      Top = 181
      Width = 1309
      Height = 26
      AfterPrint = QRSubDetail1AfterPrint
      AlignToBottom = False
      BeforePrint = QRSubDetail1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        55.033333333333330000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = StMoveQuickRep
      DataSet = GetDetsQuery
      PrintBefore = False
      PrintIfEmpty = True
      object PartQRDBText: TQRDBText
        Left = 10
        Top = 1
        Width = 141
        Height = 19
        Size.Values = (
          39.687500000000000000
          21.166666666666670000
          2.645833333333333000
          298.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = GetDetsQuery
        DataField = 'Part'
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
        FontSize = 8
      end
      object RecDateQRDBText: TQRDBText
        Left = 171
        Top = 1
        Width = 80
        Height = 19
        Size.Values = (
          39.687500000000000000
          362.479166666666700000
          2.645833333333333000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = GetDetsQuery
        DataField = 'Date_Received'
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
        FontSize = 8
      end
      object MoveTypeQRDBText: TQRDBText
        Left = 270
        Top = 1
        Width = 108
        Height = 19
        Size.Values = (
          39.687500000000000000
          571.500000000000000000
          2.645833333333333000
          227.541666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = GetDetsQuery
        DataField = 'Part_Move_Type_Descr'
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
        FontSize = 8
      end
      object BinQRDBText: TQRDBText
        Left = 738
        Top = 1
        Width = 134
        Height = 19
        Size.Values = (
          39.687500000000000000
          1561.041666666667000000
          2.645833333333333000
          283.104166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = GetDetsQuery
        DataField = 'Part_Movement_Bin'
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
        FontSize = 8
      end
      object LotQRDBText: TQRDBText
        Left = 909
        Top = 1
        Width = 91
        Height = 19
        Size.Values = (
          39.687500000000000000
          1923.520833333334000000
          2.645833333333333000
          193.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = GetDetsQuery
        DataField = 'Part_Store_Lot'
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
        FontSize = 8
      end
      object costQRDBText: TQRDBText
        Left = 1086
        Top = 1
        Width = 81
        Height = 19
        Size.Values = (
          39.687500000000000000
          2299.229166666667000000
          2.645833333333333000
          171.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = GetDetsQuery
        DataField = 'Store_Cost'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Mask = #163'######0.00'
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QtyQRDBText: TQRDBText
        Left = 1032
        Top = 1
        Width = 65
        Height = 19
        Size.Values = (
          39.687500000000000000
          2185.458333333333000000
          2.645833333333333000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = GetDetsQuery
        DataField = 'Store_Quantity'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Mask = '######'
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object RefQRDBText: TQRDBText
        Left = 398
        Top = 1
        Width = 174
        Height = 19
        Size.Values = (
          39.687500000000000000
          841.375000000000000000
          2.645833333333333000
          367.770833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = GetDetsQuery
        DataField = 'Part_Movement_Reference'
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
        FontSize = 8
      end
      object StoreQRDBText: TQRDBText
        Left = 588
        Top = 1
        Width = 134
        Height = 19
        Size.Values = (
          39.687500000000000000
          1243.541666666667000000
          2.645833333333333000
          283.104166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = GetDetsQuery
        DataField = 'Part_Store_Name'
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
        FontSize = 8
      end
      object QRDBText11: TQRDBText
        Left = 1180
        Top = 1
        Width = 69
        Height = 19
        Size.Values = (
          39.687500000000000000
          2497.666666666667000000
          2.645833333333333000
          145.520833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = GetDetsQuery
        DataField = 'Audit_User'
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
        FontSize = 8
      end
      object QRLblInUse: TQRLabel
        Left = 1278
        Top = 1
        Width = 19
        Height = 21
        Size.Values = (
          44.979166666666670000
          2704.041666666667000000
          2.645833333333333000
          39.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = ' *'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
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
      Left = 47
      Top = 131
      Width = 1309
      Height = 50
      AlignToBottom = False
      TransparentBand = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        105.833333333333300000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      FooterBand = qrbRepFooter
      Master = QRSubDetail1
      ReprintOnNewPage = True
      object QRLabel2: TQRLabel
        Left = 10
        Top = 21
        Width = 50
        Height = 19
        Size.Values = (
          40.216666666666670000
          21.166666666666670000
          44.450000000000000000
          105.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Product'
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
        FontSize = 8
      end
      object QRLabel13: TQRLabel
        Left = 170
        Top = 23
        Width = 76
        Height = 19
        Size.Values = (
          40.216666666666670000
          359.833333333333300000
          48.683333333333330000
          160.866666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date Moved'
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
        FontSize = 8
      end
      object QRLabel4: TQRLabel
        Left = 270
        Top = 23
        Width = 32
        Height = 19
        Size.Values = (
          40.216666666666670000
          571.500000000000000000
          48.683333333333330000
          67.733333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Type'
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
        FontSize = 8
      end
      object QRLabel10: TQRLabel
        Left = 589
        Top = 23
        Width = 73
        Height = 19
        Size.Values = (
          40.216666666666670000
          1246.716666666667000000
          48.683333333333330000
          154.516666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Warehouse'
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
        FontSize = 8
      end
      object QRLabel5: TQRLabel
        Left = 740
        Top = 23
        Width = 22
        Height = 19
        Size.Values = (
          40.216666666666670000
          1566.333333333333000000
          48.683333333333330000
          46.566666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Bin'
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
        FontSize = 8
      end
      object QRLabel6: TQRLabel
        Left = 909
        Top = 23
        Width = 21
        Height = 19
        Size.Values = (
          40.216666666666670000
          1924.050000000000000000
          48.683333333333330000
          44.450000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Lot'
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
        FontSize = 8
      end
      object qrlblCost: TQRLabel
        Left = 1132
        Top = 23
        Width = 28
        Height = 19
        Size.Values = (
          40.216666666666670000
          2396.066666666667000000
          48.683333333333330000
          59.266666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cost'
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
        FontSize = 8
      end
      object QRLabel8: TQRLabel
        Left = 1040
        Top = 23
        Width = 54
        Height = 19
        Size.Values = (
          40.216666666666670000
          2201.333333333333000000
          48.683333333333330000
          114.300000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Quantity'
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
        FontSize = 8
      end
      object QRLabel9: TQRLabel
        Left = 400
        Top = 23
        Width = 66
        Height = 19
        Size.Values = (
          40.216666666666670000
          846.666666666666700000
          48.683333333333330000
          139.700000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Reference'
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
        FontSize = 8
      end
      object QRLabel11: TQRLabel
        Left = 1179
        Top = 23
        Width = 29
        Height = 19
        Size.Values = (
          40.216666666666670000
          2495.550000000000000000
          48.683333333333330000
          61.383333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'User'
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
        FontSize = 8
      end
      object QRShape1: TQRShape
        Left = 6
        Top = 40
        Width = 1293
        Height = 9
        Size.Values = (
          18.520833333333300000
          13.229166666666700000
          84.666666666666700000
          2735.791666666670000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel1: TQRLabel
        Left = 1257
        Top = 3
        Width = 50
        Height = 39
        Size.Values = (
          82.020833333333340000
          2661.708333333333000000
          5.291666666666667000
          105.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Not in Use'
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
        FontSize = 8
      end
    end
    object qrbRepFooter: TQRBand
      Left = 47
      Top = 207
      Width = 1309
      Height = 32
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        67.733333333333330000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object Group1TotalQRLabel: TQRLabel
        Left = 940
        Top = 10
        Width = 78
        Height = 21
        Size.Values = (
          44.450000000000000000
          1989.666666666667000000
          21.166666666666670000
          165.100000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total Value:'
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
        FontSize = 8
      end
      object TotCostQRExpr: TQRExpr
        Left = 1056
        Top = 10
        Width = 111
        Height = 21
        Size.Values = (
          44.979166666666670000
          2235.729166666667000000
          21.166666666666670000
          235.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Color = clWhite
        Master = QRSubDetail1
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'SUM(GetDetsQuery.Store_Cost)'
        Mask = #163'######0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape3: TQRShape
        Left = 1036
        Top = -3
        Width = 131
        Height = 12
        Size.Values = (
          26.458333333333330000
          2193.395833333333000000
          -5.291666666666667000
          277.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 3
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
    object qrbRepSummary: TQRBand
      Left = 47
      Top = 239
      Width = 1309
      Height = 32
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        67.733333333333330000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRLabel3: TQRLabel
        Left = 927
        Top = 10
        Width = 88
        Height = 21
        Size.Values = (
          44.450000000000000000
          1962.150000000000000000
          21.166666666666670000
          186.266666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Report Value:'
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
        FontSize = 8
      end
      object QRExpr1: TQRExpr
        Left = 1056
        Top = 10
        Width = 111
        Height = 21
        Size.Values = (
          44.979166666666670000
          2235.729166666667000000
          21.166666666666670000
          235.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Color = clWhite
        Master = QRSubDetail1
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'SUM(GetDetsQuery.Store_Cost)'
        Mask = #163'######0.00'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRShape2: TQRShape
        Left = 1036
        Top = -3
        Width = 131
        Height = 12
        Size.Values = (
          26.458333333333330000
          2193.395833333333000000
          -5.291666666666667000
          277.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 3
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
  end
  object GetMoveDataSource: TDataSource
    DataSet = GetUserMoveQuery
    Left = 163
    Top = 35
  end
  object GetUserMoveQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'Select Part_Movement.*, Part_Store.Part_Store_Name, Part_Movemen' +
        't_Type.Part_Move_Type_Descr, Part.Not_In_Use, Part.Part'
      'from Part_Movement, Part_Store, Part_Movement_Type, Part'
      
        'where (Part_Movement.Part_Movement_Store = Part_Store.Part_Store' +
        ') and'
      '  (Part_Movement.Audit_User = :User_Code) and'
      '  (Part_Movement.Print_On_Audit = '#39'Y'#39') and'
      '  (Part_Movement.Audit_Workstation = :WorkStation) and'
      
        '  (Part_Movement.Part_Movement_Type = Part_Movement_Type.Part_Mo' +
        'vement_Type) and'
      '  ((Part.Not_In_Use <> :Not_in_Use) or (:Not_in_Use = '#39#39')) and'
      '  (Part_Movement.Part = Part.Part)'
      
        'Order by Part_Movement.Part_Movement_Type, Part_Store_Name, Date' +
        '_Received')
    Left = 373
    Top = 49
    ParamData = <
      item
        Name = 'User_Code'
        DataType = ftString
      end
      item
        Name = 'WorkStation'
        DataType = ftString
      end
      item
        Name = 'Not_in_Use'
      end
      item
        Name = 'Not_in_Use'
      end>
  end
  object UpdPrtMoveQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Part_Movement'
      'set Print_on_Audit = :sStatus '
      'where Part_Movement.Part_Movement = :Part_Movement')
    Left = 55
    Top = 52
    ParamData = <
      item
        Name = 'sStatus'
        DataType = ftString
      end
      item
        Name = 'Part_Movement'
        DataType = ftInteger
      end>
  end
  object GetDetsQuery: TFDQuery
    ConnectionName = 'PB'
    Left = 232
    Top = 41
  end
  object GetMoveQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Part_Movement.*,'
      '       Part_Store.Part_Store_Name,'
      '       Part_Movement_Type.Part_Move_Type_Descr,'
      '       Part.Not_In_use,'
      '       Part.Part,'
      '       Part.Part_Description,'
      '       (Select Customer.Name'
      '        from Customer'
      
        '        where Customer.Customer = Part.Customer) as Customer_Nam' +
        'e'
      
        'FROM ((Part_Movement LEFT JOIN Part_Movement_Type ON Part_Moveme' +
        'nt.Part_Movement_Type = Part_Movement_Type.Part_Movement_Type)'
      
        '  LEFT JOIN Part_Store ON Part_Movement.Part_Movement_Store = Pa' +
        'rt_Store.Part_Store) left join part on part_Movement.Part ='
      '    part.part'
      
        'WHERE ((Part_Movement.Date_Received >= :Date_from) And (Part_Mov' +
        'ement.Date_Received <= :Date_to) AND'
      
        '    (((Part_Movement.Part >= :PartFrom) and (Part_Movement.Part ' +
        '<= :PartTo)) Or (:Part = '#39'ALL'#39')) AND'
      
        '    ((Part_Movement.Part_Movement_Store = :Store) Or (:Store = 0' +
        ')) and'
      
        '    ((Part_Movement.Part_Movement_Type = :Part_Movement_Type) Or' +
        ' (:Part_Movement_Type = '#39'0'#39')) and'
      '    ((Part.Not_In_Use <> :Not_in_Use) or (:Not_in_Use = '#39#39')))'
      ' '
      ' ')
    Left = 368
    Top = 17
    ParamData = <
      item
        Name = 'Date_from'
        DataType = ftDateTime
      end
      item
        Name = 'Date_To'
        DataType = ftDateTime
      end
      item
        Name = 'PartFrom'
      end
      item
        Name = 'PartTo'
      end
      item
        Name = 'Part'
        DataType = ftString
      end
      item
        Name = 'Store'
        DataType = ftInteger
      end
      item
        Name = 'Store'
        DataType = ftInteger
      end
      item
        Name = 'Part_Movement_Type'
      end
      item
        Name = 'Part_Movement_Type'
      end
      item
        Name = 'Not_in_Use'
      end
      item
        Name = 'Not_in_Use'
      end>
  end
end
