object PBRPCustContDetFrm: TPBRPCustContDetFrm
  Left = 22
  Top = 127
  Caption = 'Customer Detail'
  ClientHeight = 431
  ClientWidth = 1242
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Scaled = False
  TextHeight = 13
  object QRPCustStat: TQuickRep
    Left = -24
    Top = 0
    Width = 1403
    Height = 992
    ShowingPreview = False
    BeforePrint = QRPCustStatBeforePrint
    DataSet = GetDetsQry
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
    object QRBand1: TQRBand
      Left = 47
      Top = 47
      Width = 1309
      Height = 154
      AlignToBottom = False
      TransparentBand = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        325.966666666666700000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object qrlblTitle: TQRLabel
        Left = 449
        Top = 3
        Width = 411
        Height = 29
        Size.Values = (
          61.383333333333330000
          950.383333333333300000
          6.350000000000000000
          869.950000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Customer Contact Summary Report  -'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -23
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 14
      end
      object qrlblRunDate: TQRLabel
        Left = 0
        Top = 10
        Width = 55
        Height = 29
        Size.Values = (
          61.383333333333330000
          0.000000000000000000
          21.166666666666670000
          116.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = True
        Caption = 'Run Date'
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
      object QRShape1: TQRShape
        Left = 10
        Top = 130
        Width = 1285
        Height = 21
        Size.Values = (
          44.979166666666700000
          21.166666666666700000
          275.166666666667000000
          2719.916666666670000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel1: TQRLabel
        Left = 170
        Top = 110
        Width = 101
        Height = 21
        Size.Values = (
          44.450000000000000000
          359.833333333333300000
          232.833333333333300000
          213.783333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer/ Rep'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel2: TQRLabel
        Left = 420
        Top = 110
        Width = 55
        Height = 21
        Size.Values = (
          44.450000000000000000
          889.000000000000000000
          232.833333333333300000
          116.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Address'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel3: TQRLabel
        Left = 630
        Top = 110
        Width = 37
        Height = 21
        Size.Values = (
          44.450000000000000000
          1333.500000000000000000
          232.833333333333300000
          78.316666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Town'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel4: TQRLabel
        Left = 750
        Top = 110
        Width = 63
        Height = 21
        Size.Values = (
          44.450000000000000000
          1587.500000000000000000
          232.833333333333300000
          133.350000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Postcode'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel5: TQRLabel
        Left = 828
        Top = 110
        Width = 43
        Height = 21
        Size.Values = (
          44.450000000000000000
          1752.600000000000000000
          232.833333333333300000
          91.016666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Phone'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel7: TQRLabel
        Left = 998
        Top = 110
        Width = 43
        Height = 21
        Size.Values = (
          44.450000000000000000
          2112.433333333333000000
          232.833333333333300000
          91.016666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Status'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel8: TQRLabel
        Left = 1111
        Top = 110
        Width = 33
        Height = 21
        Size.Values = (
          44.450000000000000000
          2351.616666666667000000
          232.833333333333300000
          69.850000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Type'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object SeqbyQRLabel: TQRLabel
        Left = 604
        Top = 40
        Width = 100
        Height = 21
        Size.Values = (
          44.450000000000000000
          1278.466666666667000000
          84.666666666666670000
          211.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'SeqbyQRLabel'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object CustStateQRLabel: TQRLabel
        Left = 0
        Top = 70
        Width = 124
        Height = 21
        Size.Values = (
          44.450000000000000000
          0.000000000000000000
          148.166666666666700000
          262.466666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = True
        Caption = 'CustStateQRLabel'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object CustTypeQRLabel: TQRLabel
        Left = 593
        Top = 70
        Width = 122
        Height = 21
        Size.Values = (
          44.450000000000000000
          1255.183333333333000000
          148.166666666666700000
          258.233333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'CustTypeQRLabel'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object RepQRLabel: TQRLabel
        Left = 1202
        Top = 70
        Width = 86
        Height = 21
        Size.Values = (
          44.450000000000000000
          2544.233333333333000000
          148.166666666666700000
          182.033333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'RepQRLabel'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel10: TQRLabel
        Left = 10
        Top = 110
        Width = 66
        Height = 20
        Size.Values = (
          42.333333333333330000
          21.166666666666670000
          232.833333333333300000
          139.700000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRSysData1: TQRSysData
        Left = 1251
        Top = 10
        Width = 46
        Height = 24
        Size.Values = (
          50.800000000000000000
          2647.950000000000000000
          21.166666666666670000
          97.366666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
        Transparent = False
        ExportAs = exptText
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel11: TQRLabel
        Left = 1186
        Top = 10
        Width = 55
        Height = 24
        Size.Values = (
          50.800000000000000000
          2510.366666666667000000
          21.166666666666670000
          116.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Page No.'
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
      object QRLabel6: TQRLabel
        Left = 1214
        Top = 111
        Width = 65
        Height = 20
        Size.Values = (
          42.333333333333330000
          2569.633333333333000000
          234.950000000000000000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Markup %'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
    end
    object QRCustGroup: TQRGroup
      Left = 47
      Top = 201
      Width = 1309
      Height = 32
      AlignToBottom = False
      TransparentBand = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = True
      ParentFont = False
      Size.Values = (
        67.733333333333330000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      FooterBand = QRFootBand
      Master = QRPCustStat
      ReprintOnNewPage = False
      object Sel1QRDBText: TQRDBText
        Left = 140
        Top = 10
        Width = 150
        Height = 21
        Size.Values = (
          44.450000000000000000
          296.333333333333300000
          21.166666666666670000
          317.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = GetDetsQry
        DataField = 'Contact_Status_Descr'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
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
      object Sel1TitleQRDBText: TQRLabel
        Left = 10
        Top = 10
        Width = 102
        Height = 20
        Size.Values = (
          42.333333333333330000
          21.166666666666670000
          21.166666666666670000
          215.900000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Contact Status:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
    end
    object QRFootBand: TQRBand
      Left = 47
      Top = 293
      Width = 1309
      Height = 61
      AlignToBottom = False
      TransparentBand = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        129.116666666666700000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRLabel9: TQRLabel
        Left = 0
        Top = 20
        Width = 201
        Height = 21
        Size.Values = (
          44.450000000000000000
          0.000000000000000000
          42.333333333333330000
          425.450000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'No of records for this category '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRExpr1: TQRExpr
        Left = 310
        Top = 20
        Width = 53
        Height = 21
        Size.Values = (
          44.450000000000000000
          656.166666666666700000
          42.333333333333330000
          112.183333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        Color = clWhite
        ParentFont = False
        ResetAfterPrint = True
        Transparent = False
        Expression = 'COUNT'
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 9
      end
    end
    object QRBand2: TQRBand
      Left = 47
      Top = 233
      Width = 1309
      Height = 30
      AlignToBottom = False
      TransparentBand = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        63.500000000000000000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRDBText2: TQRDBText
        Left = 170
        Top = 4
        Width = 241
        Height = 21
        Size.Values = (
          44.979166666666700000
          359.833333333333000000
          7.937500000000000000
          510.645833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = GetDetsQry
        DataField = 'Customer_Name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
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
      object QRDBText3: TQRDBText
        Left = 420
        Top = 4
        Width = 200
        Height = 21
        Size.Values = (
          44.979166666666700000
          889.000000000000000000
          7.937500000000000000
          423.333333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = GetDetsQry
        DataField = 'Building_No_name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
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
      object QRDBText5: TQRDBText
        Left = 630
        Top = 4
        Width = 110
        Height = 21
        Size.Values = (
          44.979166666666700000
          1333.500000000000000000
          7.937500000000000000
          232.833333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = GetDetsQry
        DataField = 'Town'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
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
      object QRDBText6: TQRDBText
        Left = 746
        Top = 4
        Width = 79
        Height = 21
        Size.Values = (
          44.979166666666700000
          1579.562500000000000000
          7.937500000000000000
          166.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = GetDetsQry
        DataField = 'Postcode'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
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
      object QRDBText7: TQRDBText
        Left = 830
        Top = 4
        Width = 155
        Height = 21
        Size.Values = (
          44.979166666666700000
          1756.833333333330000000
          7.937500000000000000
          328.083333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = GetDetsQry
        DataField = 'Phone'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
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
      object QRDBText10: TQRDBText
        Left = 996
        Top = 4
        Width = 111
        Height = 21
        Size.Values = (
          44.979166666666700000
          2108.729166666670000000
          7.937500000000000000
          235.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = GetDetsQry
        DataField = 'Contact_Status_Descr'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
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
      object QRDBText11: TQRDBText
        Left = 1109
        Top = 4
        Width = 119
        Height = 21
        Size.Values = (
          44.979166666666700000
          2346.854166666670000000
          7.937500000000000000
          251.354166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = GetDetsQry
        DataField = 'Contact_Type_Description'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
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
      object QRDBText12: TQRDBText
        Left = 10
        Top = 4
        Width = 141
        Height = 21
        Size.Values = (
          44.979166666666700000
          21.166666666666700000
          7.937500000000000000
          298.979166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = GetDetsQry
        DataField = 'Contact_Name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
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
      object QRDBText9: TQRDBText
        Left = 1167
        Top = 5
        Width = 118
        Height = 20
        Size.Values = (
          42.333333333333330000
          2470.150000000000000000
          10.583333333333330000
          249.766666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = GetDetsQry
        DataField = 'Def_Markup_Perc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
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
    object ChildBand1: TQRChildBand
      Left = 47
      Top = 263
      Width = 1309
      Height = 30
      AlignToBottom = False
      BeforePrint = ChildBand1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      LinkBand = QRBand2
      Size.Values = (
        63.500000000000000000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = QRBand2
      PrintOrder = cboAfterParent
      object QRDBText1: TQRDBText
        Left = 170
        Top = -1
        Width = 75
        Height = 21
        Size.Values = (
          44.450000000000000000
          359.833333333333300000
          -2.116666666666667000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = GetDetsQry
        DataField = 'Rep_Name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
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
      object qrlblAddress: TQRLabel
        Left = 419
        Top = 0
        Width = 82
        Height = 21
        Size.Values = (
          44.450000000000000000
          886.883333333333300000
          0.000000000000000000
          173.566666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblAddress'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
    end
  end
  object GetDetsQry: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Customer_Contact.Name AS Contact_Name,'
      '        Customer_Contact.Email,'
      '        Customer_Contact.Phone AS Contact_Phone,'
      '        Customer_Contact.Mobile_No,'
      '        Customer_Contact.Fax_Number AS Contact_Fax,'
      '        Customer_Contact.Contact_Type,'
      '        Customer_Contact.Contact_Level,'
      '        Customer_Contact.Contact_Status,'
      '        Contact_Level.Description as Contact_Level_Description,'
      '        Contact_Status.Contact_Status_Descr,'
      '        Contact_Type.Description as Contact_Type_Description,'
      '        Customer_Branch.Building_No_name,'
      '        Customer_Branch.Street,'
      '        Customer_Branch.Locale,'
      '        Customer_Branch.Town,'
      '        Customer_Branch.Postcode,'
      '        Customer_Branch.Phone AS Customer_Phone,'
      '        Customer_Branch.Fax_Number AS Customer_Fax,'
      '        Customer.Name AS Customer_Name,'
      '        Rep.Name as Rep_Name,'
      '        Customer_Contact.Customer,'
      '        Customer_Contact.Branch_no,'
      '        Customer_Contact.Def_Markup_Perc,'
      '        Acc_Active,'
      '        Customer.Customer_Status,'
      '        Customer_Status.Customer_Status_Descr'
      'FROM Customer_Status'
      '      INNER JOIN ((Rep'
      '      RIGHT JOIN ((Customer'
      '      INNER JOIN Customer_Branch'
      '        ON Customer.Customer = Customer_Branch.Customer)'
      '      LEFT JOIN Reps_Branches'
      
        '        ON (Customer_Branch.Branch_no = Reps_Branches.Branch_no)' +
        ' AND (Customer_Branch.Customer = Reps_Branches.Customer))'
      '        ON Rep.Rep = Reps_Branches.Rep)'
      '      INNER JOIN (Contact_Type'
      '      INNER JOIN (Contact_Status'
      '      RIGHT JOIN (Contact_Level'
      '      RIGHT JOIN Customer_Contact'
      
        '        ON Contact_Level.Contact_Level = Customer_Contact.Contac' +
        't_Level)'
      
        '        ON Contact_Status.Contact_Status = Customer_Contact.Cont' +
        'act_Status)'
      
        '        ON Contact_Type.Contact_Type = Customer_Contact.Contact_' +
        'Type)'
      
        '        ON (Customer_Branch.Branch_no = Customer_Contact.Branch_' +
        'no) AND (Customer_Branch.Customer = Customer_Contact.Customer))'
      
        '        ON Customer_Status.Customer_Status = Customer.Customer_S' +
        'tatus'
      ''
      ''
      ''
      ' ')
    Left = 96
    Top = 24
    object GetDetsQryContact_Name: TWideStringField
      FieldName = 'Contact_Name'
      FixedChar = True
      Size = 80
    end
    object GetDetsQryEmail: TWideStringField
      FieldName = 'Email'
      FixedChar = True
      Size = 200
    end
    object GetDetsQryContact_Phone: TWideStringField
      FieldName = 'Contact_Phone'
      FixedChar = True
      Size = 40
    end
    object GetDetsQryMobile_No: TWideStringField
      FieldName = 'Mobile_No'
      FixedChar = True
      Size = 30
    end
    object GetDetsQryContact_Fax: TWideStringField
      FieldName = 'Contact_Fax'
      FixedChar = True
      Size = 40
    end
    object GetDetsQryContact_Type: TIntegerField
      FieldName = 'Contact_Type'
    end
    object GetDetsQryContact_Level: TIntegerField
      FieldName = 'Contact_Level'
    end
    object GetDetsQryContact_Status: TIntegerField
      FieldName = 'Contact_Status'
    end
    object GetDetsQryContact_Status_Descr: TWideStringField
      FieldName = 'Contact_Status_Descr'
      FixedChar = True
      Size = 40
    end
    object GetDetsQryBuilding_No_name: TWideStringField
      FieldName = 'Building_No_name'
      FixedChar = True
      Size = 80
    end
    object GetDetsQryStreet: TWideStringField
      FieldName = 'Street'
      FixedChar = True
      Size = 80
    end
    object GetDetsQryLocale: TWideStringField
      FieldName = 'Locale'
      FixedChar = True
      Size = 80
    end
    object GetDetsQryTown: TWideStringField
      FieldName = 'Town'
      FixedChar = True
      Size = 80
    end
    object GetDetsQryPostcode: TWideStringField
      FieldName = 'Postcode'
      FixedChar = True
    end
    object GetDetsQryCustomer_Phone: TWideStringField
      FieldName = 'Customer_Phone'
      FixedChar = True
      Size = 40
    end
    object GetDetsQryCustomer_Fax: TWideStringField
      FieldName = 'Customer_Fax'
      FixedChar = True
      Size = 40
    end
    object GetDetsQryCustomer_Name: TWideStringField
      FieldName = 'Customer_Name'
      FixedChar = True
      Size = 80
    end
    object GetDetsQryRep_Name: TWideStringField
      FieldName = 'Rep_Name'
      FixedChar = True
      Size = 80
    end
    object GetDetsQryCustomer: TIntegerField
      FieldName = 'Customer'
    end
    object GetDetsQryBranch_no: TIntegerField
      FieldName = 'Branch_no'
    end
    object GetDetsQryDef_Markup_Perc: TFloatField
      FieldName = 'Def_Markup_Perc'
    end
    object GetDetsQryAcc_Active: TWideStringField
      FieldName = 'Inactive'
      FixedChar = True
      Size = 2
    end
    object GetDetsQryPhone: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'Phone'
      OnGetText = GetDetsQryPhoneGetText
      Size = 30
      Calculated = True
    end
    object GetDetsQryContact_Level_Description: TWideStringField
      FieldName = 'Contact_Level_Description'
      FixedChar = True
      Size = 100
    end
    object GetDetsQryContact_Type_Description: TWideStringField
      FieldName = 'Contact_Type_Description'
      FixedChar = True
      Size = 80
    end
  end
end
