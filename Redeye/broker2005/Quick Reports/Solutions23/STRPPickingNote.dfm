object STRPPickingNoteFrm: TSTRPPickingNoteFrm
  Left = 267
  Top = 99
  Caption = 'Picking Note'
  ClientHeight = 563
  ClientWidth = 851
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  
  TextHeight = 13
  object qrDetails: TQuickRep
    Left = 8
    Top = 8
    Width = 794
    Height = 1123
    ShowingPreview = False
    BeforePrint = qrDetailsBeforePrint
    DataSet = qryReport
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
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
    Page.Continuous = False
    Page.Values = (
      100.000000000000000000
      2970.000000000000000000
      100.000000000000000000
      2100.000000000000000000
      50.000000000000000000
      50.000000000000000000
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
    object PageHeadQRBand: TQRBand
      Left = 19
      Top = 38
      Width = 756
      Height = 336
      Frame.DrawBottom = True
      Frame.Width = 2
      AlignToBottom = False
      BeforePrint = PageHeadQRBandBeforePrint
      TransparentBand = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Gill Sans MT'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        889.000000000000000000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object QRLabel1: TQRLabel
        Left = 14
        Top = 294
        Width = 50
        Height = 33
        Size.Values = (
          87.312500000000000000
          37.041666666666670000
          777.875000000000000000
          132.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'QUANTITY ORDERED'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object PreviewQRLabel: TQRLabel
        Left = 664
        Top = 16
        Width = 80
        Height = 24
        Size.Values = (
          63.500000000000000000
          1756.833333333333000000
          42.333333333333330000
          211.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'PREVIEW'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object NotesQRMemo: TQRMemo
        Left = 16
        Top = 129
        Width = 272
        Height = 100
        Size.Values = (
          264.583333333333300000
          42.333333333333330000
          341.312500000000000000
          719.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        Lines.Strings = (
          'XXXXXXXXXXXXXXXXXXXXXXXX'
          'XXXXXXXXXXXXXXXXXXXXXXXX'
          'XXXXXXXXXXXXXXXXXXXXXXXX'
          'XXXXXXXXXXXXXXXXXXXXXXXX'
          'XXXXXXXXXXXXXXXXXXXXXXXX')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object DelInstructMemo: TQRMemo
        Left = 433
        Top = 127
        Width = 272
        Height = 100
        Size.Values = (
          264.583333333333300000
          1145.645833333333000000
          336.020833333333300000
          719.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object QRLblAccnt: TQRLabel
        Left = 16
        Top = 256
        Width = 90
        Height = 19
        Size.Values = (
          50.270833333333330000
          42.333333333333330000
          677.333333333333300000
          238.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Account number'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object CustRefQRDBText: TQRDBText
        Left = 216
        Top = 256
        Width = 84
        Height = 19
        Size.Values = (
          50.270833333333330000
          571.500000000000000000
          677.333333333333300000
          222.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Cust_Order_No'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object SoNumQRDBText: TQRDBText
        Left = 400
        Top = 256
        Width = 68
        Height = 19
        Size.Values = (
          50.270833333333330000
          1058.333333333333000000
          677.333333333333300000
          179.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Sales_Order'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel6: TQRLabel
        Left = 639
        Top = 311
        Width = 30
        Height = 18
        Size.Values = (
          47.625000000000000000
          1690.687500000000000000
          822.854166666666700000
          79.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'BOXES'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel7: TQRLabel
        Left = 562
        Top = 310
        Width = 45
        Height = 19
        Size.Values = (
          50.270833333333330000
          1486.958333333333000000
          820.208333333333300000
          119.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'PACK SIZE'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel5: TQRLabel
        Left = 296
        Top = 310
        Width = 61
        Height = 19
        Size.Values = (
          50.270833333333330000
          783.166666666666700000
          820.208333333333300000
          161.395833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'DESCRIPTION'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel10: TQRLabel
        Left = 78
        Top = 310
        Width = 45
        Height = 19
        Size.Values = (
          50.270833333333330000
          206.375000000000000000
          820.208333333333300000
          119.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'PRODUCT'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel4: TQRLabel
        Left = 684
        Top = 310
        Width = 17
        Height = 19
        Size.Values = (
          50.270833333333330000
          1809.750000000000000000
          820.208333333333300000
          44.979166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'BIN'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlblAccountLabel: TQRLabel
        Left = 17
        Top = 237
        Width = 94
        Height = 19
        Size.Values = (
          50.270833333333330000
          44.979166666666670000
          627.062500000000000000
          248.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Account Number'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel3: TQRLabel
        Left = 217
        Top = 237
        Width = 79
        Height = 19
        Size.Values = (
          50.270833333333330000
          574.145833333333300000
          627.062500000000000000
          209.020833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer Ref.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel8: TQRLabel
        Left = 401
        Top = 237
        Width = 56
        Height = 19
        Size.Values = (
          50.270833333333330000
          1060.979166666667000000
          627.062500000000000000
          148.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Order No.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel9: TQRLabel
        Left = 545
        Top = 237
        Width = 67
        Height = 19
        Size.Values = (
          50.270833333333330000
          1441.979166666667000000
          627.062500000000000000
          177.270833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Picking Date'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel11: TQRLabel
        Left = 665
        Top = 237
        Width = 75
        Height = 19
        Size.Values = (
          50.270833333333330000
          1759.479166666667000000
          627.062500000000000000
          198.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Pick Note No.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel12: TQRLabel
        Left = 433
        Top = 108
        Width = 113
        Height = 19
        Size.Values = (
          50.270833333333330000
          1145.645833333333000000
          285.750000000000000000
          298.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Delivery Instructions'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel13: TQRLabel
        Left = 17
        Top = 108
        Width = 60
        Height = 19
        Size.Values = (
          50.270833333333330000
          44.979166666666670000
          285.750000000000000000
          158.750000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Deliver To:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel14: TQRLabel
        Left = 316
        Top = 16
        Width = 124
        Height = 31
        Size.Values = (
          82.020833333333330000
          836.083333333333300000
          42.333333333333330000
          328.083333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'PICKING NOTE'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 16
      end
      object qrlblWarehouse: TQRLabel
        Left = 323
        Top = 48
        Width = 104
        Height = 24
        Size.Values = (
          63.500000000000000000
          854.604166666666700000
          127.000000000000000000
          275.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'qrlblWarehouse'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRLabel18: TQRLabel
        Left = 17
        Top = 4
        Width = 59
        Height = 19
        Enabled = False
        Size.Values = (
          50.270833333333330000
          44.979166666666670000
          10.583333333333330000
          156.104166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object CustomerAddMemo: TQRMemo
        Left = 16
        Top = 25
        Width = 272
        Height = 80
        Enabled = False
        Size.Values = (
          211.666666666666700000
          42.333333333333330000
          66.145833333333330000
          719.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        Lines.Strings = (
          'XXXXXXXXXXXXXXXXXXXXXXXX'
          'XXXXXXXXXXXXXXXXXXXXXXXX'
          'XXXXXXXXXXXXXXXXXXXXXXXX'
          'XXXXXXXXXXXXXXXXXXXXXXXX'
          'XXXXXXXXXXXXXXXXXXXXXXXX')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object gtQRDBText1: TQRDBText
        Left = 544
        Top = 256
        Width = 68
        Height = 19
        Size.Values = (
          50.270833333333330000
          1439.333333333333000000
          677.333333333333300000
          179.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Date_picked'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRDBText2: TQRDBText
        Left = 654
        Top = 256
        Width = 89
        Height = 19
        Size.Values = (
          50.270833333333330000
          1730.375000000000000000
          677.333333333333300000
          235.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Picking_List_Ref'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object GroupHeadQRGroup: TQRGroup
      Left = 19
      Top = 374
      Width = 756
      Height = 3
      AlignToBottom = False
      BeforePrint = GroupHeadQRGroupBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        7.937500000000000000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'qryReport.Sales_Order'
      Master = qrDetails
      ReprintOnNewPage = True
    end
    object QRSubDetail1: TQRSubDetail
      Left = 19
      Top = 377
      Width = 756
      Height = 24
      AlignToBottom = False
      BeforePrint = QRSubDetail1BeforePrint
      TransparentBand = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        63.500000000000000000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrDetails
      PrintBefore = False
      PrintIfEmpty = True
      object PartQRDBText: TQRDBText
        Left = 78
        Top = 3
        Width = 211
        Height = 19
        Size.Values = (
          50.270833333333330000
          206.375000000000000000
          7.937500000000000000
          558.270833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Part'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object DescQRDBText: TQRDBText
        Left = 296
        Top = 3
        Width = 249
        Height = 19
        Size.Values = (
          50.270833333333330000
          783.166666666666700000
          7.937500000000000000
          658.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Part_Description'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object BinQRDBText: TQRDBText
        Left = 684
        Top = 3
        Width = 73
        Height = 19
        Size.Values = (
          50.270833333333330000
          1809.750000000000000000
          7.937500000000000000
          193.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Part_Bin'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        Mask = '######'
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRDBText4: TQRDBText
        Left = 550
        Top = 3
        Width = 64
        Height = 19
        Size.Values = (
          50.270833333333330000
          1455.208333333333000000
          7.937500000000000000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Sell_Pack_Quantity'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabelDlvrd: TQRLabel
        Left = 623
        Top = 3
        Width = 50
        Height = 19
        Size.Values = (
          50.270833333333330000
          1648.354166666667000000
          7.937500000000000000
          132.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'QRLabelDlvrd'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabelQty: TQRLabel
        Left = -4
        Top = 3
        Width = 66
        Height = 19
        Size.Values = (
          50.270833333333330000
          -10.583333333333330000
          7.937500000000000000
          174.625000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'QRLabelQty'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object qrdetailSerialNos: TQRSubDetail
      Left = 19
      Top = 419
      Width = 756
      Height = 21
      AfterPrint = qrdetailSerialNosAfterPrint
      AlignToBottom = False
      BeforePrint = qrdetailSerialNosBeforePrint
      Enabled = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        55.562500000000000000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = QRSubDetail1
      DataSet = qryGetSerialNos
      PrintBefore = False
      PrintIfEmpty = True
      object lblSerialCaption: TQRLabel
        Left = 296
        Top = 0
        Width = 83
        Height = 19
        Size.Values = (
          50.270833333333330000
          783.166666666666700000
          0.000000000000000000
          219.604166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Serial Numbers:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object lblSerialRange: TQRLabel
        Left = 400
        Top = 0
        Width = 77
        Height = 19
        Size.Values = (
          50.270833333333330000
          1058.333333333333000000
          0.000000000000000000
          203.729166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'lblSerialRange'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object QRBand1: TQRBand
      Left = 19
      Top = 440
      Width = 756
      Height = 56
      Frame.DrawTop = True
      Frame.Width = 2
      AlignToBottom = True
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        148.166666666666700000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageFooter
      object QRLabel17: TQRLabel
        Left = 1
        Top = 29
        Width = 80
        Height = 19
        Size.Values = (
          50.270833333333330000
          2.645833333333333000
          76.729166666666670000
          211.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Requested by:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRDBText2: TQRDBText
        Left = 96
        Top = 29
        Width = 100
        Height = 19
        Size.Values = (
          50.270833333333330000
          254.000000000000000000
          76.729166666666670000
          264.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Account_Manager'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel19: TQRLabel
        Left = 225
        Top = 29
        Width = 56
        Height = 19
        Size.Values = (
          50.270833333333330000
          595.312500000000000000
          76.729166666666670000
          148.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Picked by:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRShape3: TQRShape
        Left = 304
        Top = 16
        Width = 177
        Height = 29
        Size.Values = (
          76.729166666666670000
          804.333333333333300000
          42.333333333333330000
          468.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel1: TQRLabel
        Left = 501
        Top = 29
        Width = 67
        Height = 19
        Size.Values = (
          50.270833333333330000
          1325.562500000000000000
          76.729166666666670000
          177.270833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Checked by:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRShape1: TQRShape
        Left = 576
        Top = 16
        Width = 177
        Height = 29
        Size.Values = (
          76.729166666666670000
          1524.000000000000000000
          42.333333333333330000
          468.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel2: TQRLabel
        Left = 377
        Top = 29
        Width = 31
        Height = 19
        Size.Values = (
          50.270833333333330000
          997.479166666666700000
          76.729166666666670000
          82.020833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object gtQRLabel3: TQRLabel
        Left = 649
        Top = 29
        Width = 31
        Height = 19
        Size.Values = (
          50.270833333333330000
          1717.145833333333000000
          76.729166666666670000
          82.020833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object chldbndFSCClaim: TQRChildBand
      Left = 19
      Top = 401
      Width = 756
      Height = 18
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        47.625000000000000000
        2000.250000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = QRSubDetail1
      PrintOrder = cboAfterParent
      object gtlblFSCClaim: TQRLabel
        Left = 78
        Top = 1
        Width = 49
        Height = 17
        Size.Values = (
          44.979166666666670000
          206.375000000000000000
          2.645833333333333000
          129.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'FSC Claim:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
    end
  end
  object qryReport: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT'
      '  Sales_Order_Picking.Picking_List_Ref,'
      '  Sales_Order_Picking.Part_Store_Allocation,'
      '  Sales_Order_Picking.Sales_Order,'
      '  Sales_Order_Picking.Sales_order_Line_No,'
      '  Sales_Order_Picking.Part_Bin,'
      '  Sales_Order_Picking.Date_picked,'
      '  Sales_Order_Picking.Invoice_upfront,'
      '  Sales_order_picking.Quantity_to_pick,'
      '  Part_Store.Part_Store_Name,'
      '  Part_Store.Stock_Bins_In_Use,'
      '  Part_Store.Stock_Lots_In_Use,'
      '  Sales_Order_Picking.Part_Store_Lot,'
      '  Part.Part,'
      '  Part.Part_Description,'
      '  Sales_Order.Delivery_Customer,'
      '  Sales_Order.Delivery_Branch,'
      '  Sales_Order.Customer,'
      '  Sales_Order.Branch_No,'
      '  Sales_order_Head_Status,'
      '  Sales_Order.Date_Required,'
      '  Sales_Order.Date_Ordered,'
      '  Sales_Order.Cust_Order_No,'
      '  Sales_Order.Cost_Centre,'
      '  Sales_Order.Ad_Hoc_Address,'
      '  Sales_order_Line.Quantity_Ordered,'
      '  Part.Sell_Pack_Quantity,'
      '  Part.Part_Purchase_Price,'
      '  Part.Part_Cost_List,'
      '  Sales_Order.Cost_Centre,'
      '  Sales_order.Narrative,'
      '  Sales_order.Delivery_Notes,'
      '  Sales_order.Production_Location,'
      '  (select UOM_Description'
      '   from Unit_of_Measure'
      
        '   where Part.Unit_of_Measure = Unit_of_measure.Unit_of_Measure)' +
        ' as UOM,'
      '  Operator.Name as Account_Manager,'
      '  Part.FSC_Material_Claim,'
      '  Part.FSC_Mixed_Percentage,'
      '  Sales_Order_line.Line_is_Sample'
      'FROM'
      
        '  Sales_Order_Picking, Part_Store, Part, Sales_Order, Sales_Orde' +
        'r_Line, Operator'
      'WHERE'
      
        '  Sales_Order_Picking.Sales_Order_Picking = :Sales_Order_Picking' +
        ' and'
      
        '  ((Sales_Order_Picking.Sales_Order = Sales_Order_Line.Sales_Ord' +
        'er) and'
      
        '  (Sales_Order_Picking.Sales_Order_line_no = Sales_Order_Line.Sa' +
        'les_Order_Line_no)) and'
      '  Sales_Order.Sales_Order = Sales_Order_Line.Sales_Order and'
      '  Sales_Order_Picking.Part_Store = Part_Store.Part_Store and'
      '  Sales_Order_Line.Part = Part.Part  and'
      '  Sales_order.Office_Contact = Operator.Operator'
      'ORDER BY'
      '  Sales_Order_Picking.Sales_Order,'
      '  Part.Part,'
      '  Sales_Order_Picking.Part_Bin'
      '')
    Left = 160
    Top = 24
    ParamData = <
      item
        Name = 'Sales_Order_Picking'
      end>
  end
  object GetCustSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Customer.Name as Cust_Name,'
      'Customer_Branch.Name as Branch_Name,'
      'Building_no_name,'
      'Street,'
      'Locale,'
      'Town,'
      'Postcode,'
      'Delivery_Narrative,'
      'Account_Code,'
      'Inv_To_Customer,'
      'Inv_To_Branch,'
      'Short_Code,'
      'HO_Department'
      'from'
      '  Customer_Branch, Customer'
      'where'
      '  ((Customer_Branch.Customer = :Customer) and'
      '   (Branch_no = :Branch_no)) and'
      '  Customer_Branch.Customer = Customer.Customer'
      ' ')
    Left = 366
    Top = 19
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
      end
      item
        Name = 'Branch_No'
        DataType = ftInteger
      end>
  end
  object AdhocSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Name,'
      '  '#39#39' as Branch_Name,'
      '  Building_no_name,'
      '  Street,'
      '  Locale,'
      '  Town,'
      '  Postcode,'
      '  Delivery_Narrative,'
      '  0 as HO_Department'
      'from Ad_hoc_Address'
      'where Ad_hoc_Address = :Ad_hoc_Address'
      ' ')
    Left = 296
    Top = 32
    ParamData = <
      item
        Name = 'Ad_hoc_Address'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object qryGetProduction: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'Select'
      '  Production_Location_Name,'
      '  '#39#39' as Branch_Name,'
      '  Building_no_name,'
      '  Street,'
      '  Locale,'
      '  Town,'
      '  Postcode,'
      '  0 as Delivery_Narrative,'
      '  0 as HO_Department'
      'from Production_location'
      'Where Production_Location = :Production_Location')
    Left = 451
    Top = 3
    ParamData = <
      item
        Name = 'Production_Location'
      end>
  end
  object qryGetJobBag: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select top 1 Job_Bag'
      'from Job_Bag_Line_dets'
      'where sales_order = :sales_order')
    Left = 555
    Top = 35
    ParamData = <
      item
        Name = 'sales_order'
      end>
  end
  object GetAccountSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Account_Code'
      'from'
      '  Customer_Branch, Customer'
      'where'
      '  ((Customer_Branch.Customer = :Customer) and'
      '   (Branch_no = :Branch_no)) and'
      '  Customer_Branch.Customer = Customer.Customer'
      ' '
      ' '
      ' ')
    Left = 630
    Top = 35
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
      end
      item
        Name = 'Branch_No'
        DataType = ftInteger
      end>
  end
  object AddressSRC: TDataSource
    Left = 104
    Top = 32
  end
  object GetCustHOSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Customer.Name as Cust_Name,'
      'Customer_Branch.Name as Branch_Name,'
      'CB.Building_no_name,'
      'CB.Street,'
      'CB.Locale,'
      'CB.Town,'
      'CB.Postcode,'
      'CB.Delivery_Narrative,'
      'CB.Account_Code,'
      'CB.Inv_To_Customer,'
      'CB.Inv_To_Branch,'
      'CB.Short_Code,'
      'Customer_Branch.HO_Department'
      'from'
      '  Customer_Branch, Customer, Customer_Branch CB'
      'where'
      '  ((Customer_Branch.Customer = :Customer) and'
      '   (Customer_Branch.Branch_no = :Branch_no)) and'
      '  ((CB.Customer = :Customer) and'
      '   (CB.Branch_no = 0)) and'
      '  Customer_Branch.Customer = Customer.Customer'
      ' '
      '')
    Left = 389
    Top = 243
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'Customer'
      end>
  end
  object GetDelivNarrSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Narrative_Text'
      'from Narrative_Line'
      'where Narrative = :Narrative'
      ' ')
    Left = 230
    Top = 222
    ParamData = <
      item
        Name = 'Narrative'
      end>
  end
  object AddDelivDetSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Sales_order_Delivery'
      
        '(Sales_Order, Sales_Order_Delivery_No, Delivery_Date, Despatch_N' +
        'ote_No, Delivery_Type,'
      
        '  Date_Picked, Delivery_Weight_Kilos, No_of_Boxes, Delivery_Inst' +
        'ructions,'
      '  Consignment_Number, Courier, Service_No)'
      'values'
      
        '(:Sales_Order,:Sales_Order_Deliv, :Del_Dt, :Desp_Note_No, :Del_T' +
        'ype,'
      '  :Del_Dt, 0, 1, :Delivery_Instructions,'
      '  '#39#39', :Courier, 0)'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 606
    Top = 100
    ParamData = <
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Sales_Order_Deliv'
      end
      item
        Name = 'Del_Dt'
      end
      item
        Name = 'Desp_Note_No'
      end
      item
        Name = 'Del_Type'
        DataType = ftString
      end
      item
        Name = 'Del_Dt'
      end
      item
        Name = 'Delivery_Instructions'
      end
      item
        Name = 'Courier'
        DataType = ftInteger
      end>
  end
  object AddDelivLineDetSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Sales_order_Delivery_Line'
      
        '(Sales_Order, Sales_Order_Delivery_No, Sales_Order_line_No, Quan' +
        'tity_Delivered,'
      '  Quantity_Picked)'
      'values'
      '(:Sales_Order, :Sales_Order_Deliv, :Sales_order_Line_No, 0, 0)'
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 230
    Top = 52
    ParamData = <
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Sales_Order_Deliv'
      end
      item
        Name = 'Sales_order_Line_No'
      end>
  end
  object UpdSOHeadSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Sales_Order'
      'Set sales_Order.Sales_order_Head_Status = :status'
      'where'
      'Sales_Order.Sales_Order = :Sales_Order'
      ' '
      ' ')
    Left = 294
    Top = 86
    ParamData = <
      item
        Name = 'status'
      end
      item
        Name = 'Sales_Order'
      end>
  end
  object CustSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Customer.Name as Customer_Name,'
      #9#9#9'Building_no_name,'
      '        Street,'
      '        Locale,'
      '        Town,'
      '        Postcode,'
      '        Phone,'
      '        Fax_Number,'
      '        Email'
      'from Customer_Branch, Customer'
      'where ((Customer_Branch.Customer = :Customer) and'
      #9#9#9'(Branch_no = :Branch_no)) and'
      '        Customer_Branch.Customer = Customer.Customer'
      ' ')
    Left = 446
    Top = 97
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end>
  end
  object GetDelivCountSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select sales_order'
      'from sales_order_delivery'
      'where (sales_order = :sales_order) '
      ' '
      ' ')
    Left = 230
    Top = 108
    ParamData = <
      item
        Name = 'sales_order'
      end>
  end
  object qryGetSerialNos: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Store_stock_serial_item.*'
      'from Store_stock_serial_item, Part_Store_allocation'
      'where Part_Store_allocation = :Part_Store_allocation and'
      'Store_stock_serial_item.Sales_order = :Sales_order and'
      
        'Part_Store_allocation.store_stock = Store_stock_serial_item.stor' +
        'e_stock')
    Left = 697
    Top = 115
    ParamData = <
      item
        Name = 'Part_Store_allocation'
      end
      item
        Name = 'Sales_order'
      end>
  end
  object CheckDelivSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Quantity_Delivered'
      'from Sales_order_Delivery_Line'
      
        'where (sales_order = :Sales_Order) and (Sales_Order_Line_No = :S' +
        'ales_Order_Line_No) and'
      '  (Sales_Order_Delivery_No = :Sales_Order_Deliv)'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 302
    Top = 212
    ParamData = <
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Sales_Order_Line_No'
      end
      item
        Name = 'Sales_Order_Deliv'
      end>
  end
  object qryGetJobBagReq: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select top 1 Job_Bag'
      'from Job_Bag_Stock_Request'
      'where sales_order = :sales_order')
    Left = 675
    Top = 19
    ParamData = <
      item
        Name = 'sales_order'
      end>
  end
  object qryGetFSCClaim: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from FSC_Material_Claim'
      'where FSC_Material_Claim = :FSC_Material_Claim')
    Left = 694
    Top = 190
    ParamData = <
      item
        Name = 'FSC_Material_Claim'
      end>
  end
  object qryGetDelivery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Sales_Order'
      'FROM Sales_Order_Delivery'
      'WHERE Sales_Order = :Sales_Order')
    Left = 603
    Top = 174
    ParamData = <
      item
        Name = 'Sales_Order'
      end>
  end
end
