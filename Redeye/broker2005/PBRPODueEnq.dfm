object PBRPODueEnqFrm: TPBRPODueEnqFrm
  Left = 19
  Top = 110
  Width = 806
  Height = 612
  HorzScrollBar.Range = 1200
  VertScrollBar.Range = 2000
  Caption = 'Overdue Enquiries'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  Scaled = False
  TextHeight = 14
  object QRLabel6: TQRLabel
    Left = 560
    Top = 220
    Width = 12
    Height = 12
    Size.Values = (
      26.458333333333300000
      1185.333333333330000000
      465.666666666667000000
      26.458333333333300000)
    XLColumn = 0
    XLNumFormat = nfGeneral
    ActiveInPreview = False
    Alignment = taLeftJustify
    AlignToBand = False
    Caption = 'Fax:'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
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
  object QRDBText6: TQRDBText
    Left = 630
    Top = 220
    Width = 12
    Height = 12
    Size.Values = (
      26.458333333333300000
      1333.500000000000000000
      465.666666666667000000
      26.458333333333300000)
    XLColumn = 0
    XLNumFormat = nfGeneral
    ActiveInPreview = False
    Alignment = taLeftJustify
    AlignToBand = False
    Color = clWhite
    DataSet = GetCompSQL
    DataField = 'Fax_number'
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
  object QRLabel7: TQRLabel
    Left = 560
    Top = 266
    Width = 12
    Height = 12
    Size.Values = (
      26.458333333333300000
      1185.333333333330000000
      563.562500000000000000
      26.458333333333300000)
    XLColumn = 0
    XLNumFormat = nfGeneral
    ActiveInPreview = False
    Alignment = taLeftJustify
    AlignToBand = False
    Caption = 'Fax:'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
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
  object QRDBText7: TQRDBText
    Left = 630
    Top = 266
    Width = 12
    Height = 12
    Size.Values = (
      26.458333333333300000
      1333.500000000000000000
      563.562500000000000000
      26.458333333333300000)
    XLColumn = 0
    XLNumFormat = nfGeneral
    ActiveInPreview = False
    Alignment = taLeftJustify
    AlignToBand = False
    Color = clWhite
    DataSet = GetCompSQL
    DataField = 'Fax_number'
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
  object PrintODueEnqQuickReport: TQuickRep
    Left = 0
    Top = 0
    Width = 992
    Height = 1403
    ShowingPreview = False
    BeforePrint = PrintODueEnqQuickReportBeforePrint
    DataSet = GetEnquiriesSQL
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
    Page.PaperSize = Default
    Page.Continuous = False
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
    ReportTitle = 'Overdue Enquiries'
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
    object PageHeaderQRBand: TQRBand
      Left = 47
      Top = 47
      Width = 898
      Height = 413
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        874.183333333333300000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object ODueDateQRLabel: TQRLabel
        Left = 372
        Top = 50
        Width = 154
        Height = 29
        Size.Values = (
          61.383333333333330000
          787.400000000000000000
          105.833333333333300000
          325.966666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Overdue As At:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -23
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 14
      end
      object QRShape1: TQRShape
        Left = 10
        Top = 130
        Width = 421
        Height = 141
        Size.Values = (
          298.979166666667000000
          21.166666666666700000
          275.166666666667000000
          891.645833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel1: TQRLabel
        Left = 10
        Top = 100
        Width = 33
        Height = 25
        Size.Values = (
          52.916666666666670000
          21.166666666666670000
          211.666666666666700000
          69.850000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'To:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -20
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object SupNamQRDBText: TQRDBText
        Left = 20
        Top = 140
        Width = 43
        Height = 21
        Size.Values = (
          44.450000000000000000
          42.333333333333330000
          296.333333333333300000
          91.016666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = GetEnquiriesSQL
        DataField = 'Name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = 'Arial'
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
      object SupAdd1QRDBText: TQRDBText
        Left = 20
        Top = 160
        Width = 139
        Height = 21
        Size.Values = (
          44.450000000000000000
          42.333333333333330000
          338.666666666666700000
          294.216666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = GetEnquiriesSQL
        DataField = 'Building_No_Name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = 'Arial'
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
      object SupAdd2QRDBText: TQRDBText
        Left = 20
        Top = 180
        Width = 44
        Height = 21
        Size.Values = (
          44.450000000000000000
          42.333333333333330000
          381.000000000000000000
          93.133333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = GetEnquiriesSQL
        DataField = 'Street'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = 'Arial'
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
      object SuppAdd3QRDBText: TQRDBText
        Left = 20
        Top = 200
        Width = 49
        Height = 21
        Size.Values = (
          44.450000000000000000
          42.333333333333330000
          423.333333333333300000
          103.716666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = GetEnquiriesSQL
        DataField = 'Locale'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = 'Arial'
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
      object SupTownQRDBText: TQRDBText
        Left = 20
        Top = 220
        Width = 39
        Height = 21
        Size.Values = (
          44.450000000000000000
          42.333333333333330000
          465.666666666666700000
          82.550000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = GetEnquiriesSQL
        DataField = 'Town'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = 'Arial'
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
      object QRShape2: TQRShape
        Left = 490
        Top = 130
        Width = 391
        Height = 141
        Size.Values = (
          298.979166666667000000
          1037.166666666670000000
          275.166666666667000000
          828.145833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel2: TQRLabel
        Left = 500
        Top = 100
        Width = 57
        Height = 25
        Size.Values = (
          52.916666666666670000
          1058.333333333333000000
          211.666666666666700000
          120.650000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'From:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -20
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRDBText1: TQRDBText
        Left = 510
        Top = 220
        Width = 39
        Height = 21
        Size.Values = (
          44.450000000000000000
          1079.500000000000000000
          465.666666666666700000
          82.550000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = GetCompSQL
        DataField = 'Town'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = 'Arial'
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
      object QRDBText2: TQRDBText
        Left = 510
        Top = 200
        Width = 49
        Height = 21
        Size.Values = (
          44.450000000000000000
          1079.500000000000000000
          423.333333333333300000
          103.716666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = GetCompSQL
        DataField = 'Locale'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = 'Arial'
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
      object QRDBText3: TQRDBText
        Left = 510
        Top = 180
        Width = 44
        Height = 21
        Size.Values = (
          44.450000000000000000
          1079.500000000000000000
          381.000000000000000000
          93.133333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = GetCompSQL
        DataField = 'Street'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = 'Arial'
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
      object QRDBText4: TQRDBText
        Left = 510
        Top = 160
        Width = 139
        Height = 21
        Size.Values = (
          44.450000000000000000
          1079.500000000000000000
          338.666666666666700000
          294.216666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = GetCompSQL
        DataField = 'Building_No_Name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = 'Arial'
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
      object QRDBText5: TQRDBText
        Left = 510
        Top = 140
        Width = 43
        Height = 21
        Size.Values = (
          44.450000000000000000
          1079.500000000000000000
          296.333333333333300000
          91.016666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = GetCompSQL
        DataField = 'Name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = 'Arial'
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
      object QRLabel4: TQRLabel
        Left = 510
        Top = 280
        Width = 53
        Height = 21
        Size.Values = (
          44.450000000000000000
          1079.500000000000000000
          592.666666666666700000
          112.183333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Phone:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      object QRLabel5: TQRLabel
        Left = 510
        Top = 300
        Width = 32
        Height = 21
        Size.Values = (
          44.450000000000000000
          1079.500000000000000000
          635.000000000000000000
          67.733333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fax:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      object PhoneQRDBText: TQRDBText
        Left = 580
        Top = 280
        Width = 48
        Height = 21
        Size.Values = (
          44.450000000000000000
          1227.666666666667000000
          592.666666666666700000
          101.600000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = GetCompSQL
        DataField = 'Phone'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = 'Arial'
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
      object FaxQRDBText: TQRDBText
        Left = 580
        Top = 300
        Width = 91
        Height = 21
        Size.Values = (
          44.450000000000000000
          1227.666666666667000000
          635.000000000000000000
          192.616666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = GetCompSQL
        DataField = 'Fax_number'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = 'Arial'
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
      object SupPostCodeQRDBText: TQRDBText
        Left = 20
        Top = 240
        Width = 72
        Height = 21
        Size.Values = (
          44.450000000000000000
          42.333333333333330000
          508.000000000000000000
          152.400000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = GetEnquiriesSQL
        DataField = 'PostCode'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = 'Arial'
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
      object QRDBText9: TQRDBText
        Left = 510
        Top = 240
        Width = 72
        Height = 21
        Size.Values = (
          44.450000000000000000
          1079.500000000000000000
          508.000000000000000000
          152.400000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = GetCompSQL
        DataField = 'PostCode'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = 'Arial'
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
      object QRLabel9: TQRLabel
        Left = 0
        Top = 383
        Width = 109
        Height = 21
        Size.Values = (
          44.450000000000000000
          0.000000000000000000
          810.683333333333300000
          230.716666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Our Reference'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      object QRLabel11: TQRLabel
        Left = 120
        Top = 383
        Width = 113
        Height = 21
        Size.Values = (
          44.979166666666700000
          254.000000000000000000
          809.625000000000000000
          238.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Job Description'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      object QRLabel10: TQRLabel
        Left = 520
        Top = 383
        Width = 92
        Height = 21
        Size.Values = (
          44.450000000000000000
          1100.666666666667000000
          810.683333333333300000
          194.733333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Required By'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      object QRLabel12: TQRLabel
        Left = 660
        Top = 383
        Width = 73
        Height = 21
        Size.Values = (
          44.450000000000000000
          1397.000000000000000000
          810.683333333333300000
          154.516666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Quantities'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      object QRLabel13: TQRLabel
        Left = 20
        Top = 280
        Width = 53
        Height = 21
        Size.Values = (
          44.450000000000000000
          42.333333333333330000
          592.666666666666700000
          112.183333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Phone:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      object QRLabel14: TQRLabel
        Left = 20
        Top = 300
        Width = 32
        Height = 21
        Size.Values = (
          44.450000000000000000
          42.333333333333330000
          635.000000000000000000
          67.733333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fax:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      object OurPhoneQRDBText: TQRDBText
        Left = 90
        Top = 280
        Width = 48
        Height = 21
        Size.Values = (
          44.450000000000000000
          190.500000000000000000
          592.666666666666700000
          101.600000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = GetEnquiriesSQL
        DataField = 'Phone'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = 'Arial'
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
      object OurFaxQRDBText: TQRDBText
        Left = 90
        Top = 300
        Width = 91
        Height = 21
        Size.Values = (
          44.450000000000000000
          190.500000000000000000
          635.000000000000000000
          192.616666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = GetEnquiriesSQL
        DataField = 'Fax_number'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = 'Arial'
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
      object EMailQRDBText: TQRDBText
        Left = 580
        Top = 323
        Width = 41
        Height = 21
        Size.Values = (
          44.450000000000000000
          1227.666666666667000000
          683.683333333333300000
          86.783333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = GetCompSQL
        DataField = 'Email'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = 'Arial'
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
      object QRLabel15: TQRLabel
        Left = 510
        Top = 323
        Width = 52
        Height = 21
        Size.Values = (
          44.450000000000000000
          1079.500000000000000000
          683.683333333333300000
          110.066666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'E-Mail:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      object RunDateQRLabel: TQRLabel
        Left = 324
        Top = 10
        Width = 249
        Height = 36
        Size.Values = (
          76.200000000000000000
          685.800000000000000000
          21.166666666666670000
          527.050000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Overdue Enquiries'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -30
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 18
      end
    end
    object DetailQRBand: TQRBand
      Left = 47
      Top = 465
      Width = 898
      Height = 38
      AlignToBottom = False
      BeforePrint = DetailQRBandBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        80.433333333333330000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRLabel8: TQRLabel
        Left = 70
        Top = 3
        Width = 6
        Height = 21
        Size.Values = (
          44.450000000000000000
          148.166666666666700000
          6.350000000000000000
          12.700000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '/'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      object JobDescrQRDBText: TQRDBText
        Left = 125
        Top = 3
        Width = 387
        Height = 21
        Size.Values = (
          44.979166666666700000
          264.583333333333000000
          5.291666666666670000
          820.208333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = GetEnquiriesSQL
        DataField = 'Form_Description'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = 'Arial'
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
      object DateQRDBText: TQRDBText
        Left = 520
        Top = 3
        Width = 154
        Height = 21
        Size.Values = (
          44.450000000000000000
          1100.666666666667000000
          6.350000000000000000
          325.966666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = GetEnquiriesSQL
        DataField = 'Req_Response_Date'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        OnPrint = DateQRDBTextPrint
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object EnqLineQRLabel: TQRLabel
        Left = 81
        Top = 3
        Width = 123
        Height = 21
        Size.Values = (
          44.450000000000000000
          171.450000000000000000
          6.350000000000000000
          260.350000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'EnqLineQRLabel'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      object QtysQRMemo: TQRMemo
        Left = 660
        Top = 3
        Width = 221
        Height = 21
        Size.Values = (
          44.979166666666700000
          1397.000000000000000000
          5.291666666666670000
          468.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'Memo to hold'
          'quantity info')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object EnqNoLab: TQRLabel
        Left = -55
        Top = 3
        Width = 123
        Height = 21
        Size.Values = (
          44.450000000000000000
          -116.416666666666700000
          6.350000000000000000
          260.350000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'EnqLineQRLabel'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
    object FooterQRBand: TQRBand
      Left = 47
      Top = 503
      Width = 898
      Height = 51
      AlignToBottom = False
      BeforePrint = FooterQRBandBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        107.950000000000000000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageFooter
      object PageNoQRLabel: TQRLabel
        Left = 40
        Top = 15
        Width = 73
        Height = 21
        Size.Values = (
          44.450000000000000000
          84.666666666666670000
          31.750000000000000000
          154.516666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Rep Page'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
      object SuppBranchPageNoQRLabel: TQRLabel
        Left = 570
        Top = 15
        Width = 140
        Height = 21
        Size.Values = (
          44.450000000000000000
          1206.500000000000000000
          31.750000000000000000
          296.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Supp/Branch Page'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
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
    object BranchQRGroup: TQRGroup
      Left = 47
      Top = 460
      Width = 898
      Height = 5
      AlignToBottom = False
      BeforePrint = BranchQRBandBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        10.583333333333330000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'GetEnquiriesSQL.Branch_No OR GetEnquiriesSQL.Supplier'
      Master = PrintODueEnqQuickReport
      ReprintOnNewPage = False
    end
  end
  object GetEnquiriesSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'SELECT DISTINCT Supplier.Supplier, Supplier_Branch.Branch_no, Su' +
        'pplier.Name,'
      
        '  Supplier_Branch.Building_No_name, Supplier_Branch.Street, Supp' +
        'lier_Branch.Locale,'
      
        '  Supplier_Branch.Town, Supplier_Branch.Postcode, Supplier_Branc' +
        'h.Phone,'
      
        '  Supplier_Branch.Fax_Number, EnquiryLine.Enquiry, EnquiryLine.L' +
        'ine,'
      '  Supplier_Branch.Supplier, Supplier_Branch.Name AS Branch_Name,'
      
        '  Supplier_Branch.Branch_no, Supplier_Branch.Email, EnquiryLine.' +
        'Form_Description,'
      
        '  EnquiryLine.Req_Response_Date, Supplier_BranchContacts.Email a' +
        's Cont_Email,'
      
        '  Supplier_BranchContacts.Salutation, Supplier_BranchContacts.Na' +
        'me as Contact_Name,'
      '  Supplier_BranchContacts.ExportFilter,'
      '  ExportFilter.Description AS ExportFilter_Descr'
      
        'FROM (Enquiry INNER JOIN (EnquiryLine INNER JOIN (Supplier_Branc' +
        'h'
      '    INNER JOIN ((Supplier_BranchContacts RIGHT JOIN (Supplier'
      
        '    INNER JOIN Supplier_Enquiry ON Supplier.Supplier = Supplier_' +
        'Enquiry.Supplier)'
      
        '    ON (Supplier_BranchContacts.Supplier = Supplier_Enquiry.Supp' +
        'lier)'
      
        '    AND (Supplier_BranchContacts.Branch_no = Supplier_Enquiry.Br' +
        'anch_no)'
      
        '    AND (Supplier_BranchContacts.Contact_no = Supplier_Enquiry.C' +
        'ontact_no))'
      '    LEFT JOIN ExportFilter'
      
        '    ON Supplier_BranchContacts.Exportfilter = ExportFilter.Expor' +
        'tfilter)'
      '    ON (Supplier_Branch.Branch_no = Supplier_Enquiry.Branch_no)'
      '    AND (Supplier_Branch.Supplier = Supplier_Enquiry.Supplier))'
      '    ON (EnquiryLine.Line = Supplier_Enquiry.Line)'
      '    AND (EnquiryLine.Enquiry = Supplier_Enquiry.Enquiry))'
      '    ON Enquiry.Enquiry = EnquiryLine.Enquiry) INNER JOIN Rep'
      '    ON Enquiry.Rep = Rep.Rep'
      'WHERE'
      ' (((Enquiry.Rep = :Rep) or (:Rep = 0)) and'
      '  ((Supplier_Branch.Branch_no)=:Branch_no) AND'
      '  ((Supplier_Branch.Supplier)=:Supplier) AND'
      '  ((EnquiryLine.Req_Response_Date)<:ODue_Date) AND'
      '  ((Supplier_Enquiry.Act_Response_Date) Is Null) AND'
      '  ((EnquiryLine.Enq_InActive)<>'#39'Y'#39')) OR'
      ' (((Enquiry.Rep = :Rep) or (:Rep = 0)) and'
      '  ((EnquiryLine.Req_Response_Date)<:ODue_Date) AND'
      '  ((Supplier_Enquiry.Act_Response_Date) Is Null) AND'
      '  ((EnquiryLine.Enq_InActive)<>'#39'Y'#39') AND ((:Supplier)=0))'
      'ORDER BY Supplier.Name, EnquiryLine.Enquiry, EnquiryLine.Line'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' ')
    Left = 336
    Top = 47
    ParamData = <
      item
        Name = 'Rep'
      end
      item
        Name = 'Rep'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'Supplier'
        DataType = ftInteger
      end
      item
        Name = 'ODue_Date'
        DataType = ftDateTime
      end
      item
        Name = 'Rep'
      end
      item
        Name = 'Rep'
      end
      item
        Name = 'ODue_Date'
        DataType = ftDateTime
      end
      item
        Name = 'Supplier'
        DataType = ftInteger
      end>
  end
  object EnquiriesSRC: TDataSource
    DataSet = GetEnquiriesSQL
    Left = 424
    Top = 50
  end
  object CompSRC: TDataSource
    DataSet = GetCompSQL
    Left = 499
    Top = 113
  end
  object GetCompSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select * from Company'
      'Where Company = 1')
    Left = 424
    Top = 111
  end
  object GetQtysSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Distinct Quantity From Enquiry_LineQuantity'
      'Where (Enquiry = :Enquiry) and'
      '      (Line = :Line)'
      'Order By Quantity'
      ' ')
    Left = 232
    Top = 112
    ParamData = <
      item
        Name = 'Enquiry'
      end
      item
        Name = 'Line'
      end>
  end
end
