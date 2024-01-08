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
    Width = 1123
    Height = 794
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
      Left = 38
      Top = 38
      Width = 1047
      Height = 123
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
        325.437500000000000000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object qrlblTitle: TQRLabel
        Left = 350
        Top = 2
        Width = 346
        Height = 23
        Size.Values = (
          60.854166666666670000
          926.041666666666700000
          5.291666666666667000
          915.458333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Customer Contact Summary Report  -'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
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
        Top = 8
        Width = 45
        Height = 23
        Size.Values = (
          60.854166666666670000
          0.000000000000000000
          21.166666666666670000
          119.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = True
        Caption = 'Run Date'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
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
        Left = 8
        Top = 104
        Width = 1028
        Height = 17
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
        Left = 136
        Top = 88
        Width = 85
        Height = 17
        Size.Values = (
          44.979166666666670000
          359.833333333333300000
          232.833333333333300000
          224.895833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer/ Rep'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
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
        Left = 336
        Top = 88
        Width = 47
        Height = 17
        Size.Values = (
          44.979166666666670000
          889.000000000000000000
          232.833333333333300000
          124.354166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Address'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
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
        Left = 504
        Top = 88
        Width = 31
        Height = 17
        Size.Values = (
          44.979166666666670000
          1333.500000000000000000
          232.833333333333300000
          82.020833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Town'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
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
        Left = 600
        Top = 88
        Width = 53
        Height = 17
        Size.Values = (
          44.979166666666670000
          1587.500000000000000000
          232.833333333333300000
          140.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Postcode'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
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
        Left = 662
        Top = 88
        Width = 37
        Height = 17
        Size.Values = (
          44.979166666666670000
          1751.541666666667000000
          232.833333333333300000
          97.895833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Phone'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
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
        Left = 798
        Top = 88
        Width = 36
        Height = 17
        Size.Values = (
          44.979166666666670000
          2111.375000000000000000
          232.833333333333300000
          95.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Status'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
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
        Left = 889
        Top = 88
        Width = 27
        Height = 17
        Size.Values = (
          44.979166666666670000
          2352.145833333333000000
          232.833333333333300000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Type'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
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
        Left = 481
        Top = 32
        Width = 84
        Height = 17
        Size.Values = (
          44.979166666666670000
          1272.645833333333000000
          84.666666666666670000
          222.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'SeqbyQRLabel'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
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
        Top = 56
        Width = 104
        Height = 17
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          148.166666666666700000
          275.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = True
        Caption = 'CustStateQRLabel'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
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
        Left = 472
        Top = 56
        Width = 102
        Height = 17
        Size.Values = (
          44.979166666666670000
          1248.833333333333000000
          148.166666666666700000
          269.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'CustTypeQRLabel'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
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
        Left = 958
        Top = 56
        Width = 73
        Height = 17
        Size.Values = (
          44.979166666666670000
          2534.708333333333000000
          148.166666666666700000
          193.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'RepQRLabel'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
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
        Left = 8
        Top = 88
        Width = 56
        Height = 16
        Size.Values = (
          42.333333333333330000
          21.166666666666670000
          232.833333333333300000
          148.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
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
        Left = 1001
        Top = 8
        Width = 39
        Height = 19
        Size.Values = (
          50.270833333333330000
          2648.479166666667000000
          21.166666666666670000
          103.187500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
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
        Left = 949
        Top = 8
        Width = 44
        Height = 19
        Size.Values = (
          50.270833333333330000
          2510.895833333333000000
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
        Font.Height = -11
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
        Left = 971
        Top = 89
        Width = 55
        Height = 16
        Size.Values = (
          42.333333333333330000
          2569.104166666667000000
          235.479166666666700000
          145.520833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Markup %'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
    end
    object QRCustGroup: TQRGroup
      Left = 38
      Top = 161
      Width = 1047
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
        84.666666666666670000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      FooterBand = QRFootBand
      Master = QRPCustStat
      ReprintOnNewPage = False
      object Sel1QRDBText: TQRDBText
        Left = 112
        Top = 8
        Width = 125
        Height = 17
        Size.Values = (
          44.979166666666670000
          296.333333333333300000
          21.166666666666670000
          330.729166666666700000)
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
        Font.Height = -12
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
        Left = 8
        Top = 8
        Width = 84
        Height = 16
        Size.Values = (
          42.333333333333330000
          21.166666666666670000
          21.166666666666670000
          222.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Contact Status:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
    end
    object QRFootBand: TQRBand
      Left = 38
      Top = 241
      Width = 1047
      Height = 49
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
        129.645833333333300000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRLabel9: TQRLabel
        Left = 0
        Top = 16
        Width = 167
        Height = 17
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          42.333333333333330000
          441.854166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'No of records for this category '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
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
        Left = 248
        Top = 16
        Width = 44
        Height = 17
        Size.Values = (
          44.979166666666670000
          656.166666666666700000
          42.333333333333330000
          116.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
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
      Left = 38
      Top = 193
      Width = 1047
      Height = 24
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
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRDBText2: TQRDBText
        Left = 136
        Top = 3
        Width = 193
        Height = 17
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
        Font.Height = -12
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
        Left = 336
        Top = 3
        Width = 160
        Height = 17
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
        Font.Height = -12
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
        Left = 504
        Top = 3
        Width = 88
        Height = 17
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
        Font.Height = -12
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
        Left = 597
        Top = 3
        Width = 63
        Height = 17
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
        Font.Height = -12
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
        Left = 664
        Top = 3
        Width = 124
        Height = 17
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
        Font.Height = -12
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
        Left = 797
        Top = 3
        Width = 89
        Height = 17
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
        Font.Height = -12
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
        Left = 887
        Top = 3
        Width = 95
        Height = 17
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
        Font.Height = -12
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
        Left = 8
        Top = 3
        Width = 113
        Height = 17
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
        Font.Height = -12
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
        Left = 929
        Top = 4
        Width = 99
        Height = 16
        Size.Values = (
          42.333333333333330000
          2457.979166666667000000
          10.583333333333330000
          261.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = GetDetsQry
        DataField = 'Def_Markup_Perc'
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
      Left = 38
      Top = 217
      Width = 1047
      Height = 24
      AlignToBottom = False
      BeforePrint = ChildBand1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      LinkBand = QRBand2
      Size.Values = (
        63.500000000000000000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = QRBand2
      PrintOrder = cboAfterParent
      object QRDBText1: TQRDBText
        Left = 136
        Top = -1
        Width = 65
        Height = 17
        Size.Values = (
          44.979166666666670000
          359.833333333333300000
          -2.645833333333333000
          171.979166666666700000)
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
        Font.Height = -12
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
        Left = 335
        Top = 0
        Width = 71
        Height = 17
        Size.Values = (
          44.979166666666670000
          886.354166666666700000
          0.000000000000000000
          187.854166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblAddress'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
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
    object GetDetsQryContact_Name: TStringField
      FieldName = 'Contact_Name'
      FixedChar = True
      Size = 80
    end
    object GetDetsQryEmail: TStringField
      FieldName = 'Email'
      FixedChar = True
      Size = 200
    end
    object GetDetsQryContact_Phone: TStringField
      FieldName = 'Contact_Phone'
      FixedChar = True
      Size = 40
    end
    object GetDetsQryMobile_No: TStringField
      FieldName = 'Mobile_No'
      FixedChar = True
      Size = 30
    end
    object GetDetsQryContact_Fax: TStringField
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
    object GetDetsQryContact_Status_Descr: TStringField
      FieldName = 'Contact_Status_Descr'
      FixedChar = True
      Size = 40
    end
    object GetDetsQryBuilding_No_name: TStringField
      FieldName = 'Building_No_name'
      FixedChar = True
      Size = 80
    end
    object GetDetsQryStreet: TStringField
      FieldName = 'Street'
      FixedChar = True
      Size = 80
    end
    object GetDetsQryLocale: TStringField
      FieldName = 'Locale'
      FixedChar = True
      Size = 80
    end
    object GetDetsQryTown: TStringField
      FieldName = 'Town'
      FixedChar = True
      Size = 80
    end
    object GetDetsQryPostcode: TStringField
      FieldName = 'Postcode'
      FixedChar = True
    end
    object GetDetsQryCustomer_Phone: TStringField
      FieldName = 'Customer_Phone'
      FixedChar = True
      Size = 40
    end
    object GetDetsQryCustomer_Fax: TStringField
      FieldName = 'Customer_Fax'
      FixedChar = True
      Size = 40
    end
    object GetDetsQryCustomer_Name: TStringField
      FieldName = 'Customer_Name'
      FixedChar = True
      Size = 80
    end
    object GetDetsQryRep_Name: TStringField
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
    object GetDetsQryAcc_Active: TStringField
      FieldName = 'Inactive'
      FixedChar = True
      Size = 2
    end
    object GetDetsQryPhone: TStringField
      FieldKind = fkCalculated
      FieldName = 'Phone'
      OnGetText = GetDetsQryPhoneGetText
      Size = 30
      Calculated = True
    end
    object GetDetsQryContact_Level_Description: TStringField
      FieldName = 'Contact_Level_Description'
      FixedChar = True
      Size = 100
    end
    object GetDetsQryContact_Type_Description: TStringField
      FieldName = 'Contact_Type_Description'
      FixedChar = True
      Size = 80
    end
  end
end
