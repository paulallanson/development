object STPOrdRepFrm: TSTPOrdRepFrm
  Left = -4
  Top = -4
  Caption = 'Purchase Order Print'
  ClientHeight = 541
  ClientWidth = 792
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Scaled = False
  OnCreate = FormCreate
  TextHeight = 13
  object PurchOrdQuickReport: TQuickRep
    Left = 8
    Top = 184
    Width = 992
    Height = 1403
    ShowingPreview = False
    BeforePrint = PurchOrdQuickReportBeforePrint
    DataSet = GetOrdHedQuery
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
    ShowProgress = False
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
      Height = 344
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        728.133333333333300000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object QRShape3: TQRShape
        Left = 20
        Top = 249
        Width = 631
        Height = 49
        Size.Values = (
          103.187500000000000000
          42.333333333333300000
          526.520833333333000000
          1336.145833333330000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object ReprintQRLabel: TQRLabel
        Left = 134
        Top = 0
        Width = 84
        Height = 29
        Size.Values = (
          61.383333333333330000
          283.633333333333300000
          0.000000000000000000
          177.800000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Reprint'
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
      object ReportTitleQRLabel: TQRLabel
        Left = 20
        Top = 158
        Width = 359
        Height = 38
        Enabled = False
        Size.Values = (
          80.433333333333330000
          42.333333333333330000
          334.433333333333300000
          759.883333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'title changes accordingly'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -30
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 18
      end
      object OrdDateQRLabel: TQRLabel
        Left = 18
        Top = 204
        Width = 128
        Height = 29
        Size.Values = (
          61.383333333333330000
          38.100000000000000000
          431.800000000000000000
          270.933333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Order Date:'
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
      object PurchOrdDateQRLabel: TQRLabel
        Left = 168
        Top = 204
        Width = 111
        Height = 29
        Size.Values = (
          60.854166666666700000
          354.541666666667000000
          431.270833333333000000
          235.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Order Date:'
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
      object PurchOrdDescrQRLabel: TQRLabel
        Left = 27
        Top = 260
        Width = 604
        Height = 29
        Size.Values = (
          60.854166666666700000
          58.208333333333300000
          550.333333333333000000
          1277.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Purchase Order Description'
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
      object OrdNumQRLabel: TQRLabel
        Left = 18
        Top = 158
        Width = 214
        Height = 38
        Size.Values = (
          80.433333333333330000
          38.100000000000000000
          334.433333333333300000
          452.966666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Order Number:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -30
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 18
      end
      object ReportImage: TQRImage
        Left = 12
        Top = 35
        Width = 286
        Height = 60
        Size.Values = (
          127.000000000000000000
          25.400000000000000000
          74.083333333333330000
          605.366666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Center = True
        Stretch = True
      end
      object QRMemoAddress: TQRMemo
        Left = 590
        Top = 35
        Width = 211
        Height = 169
        Size.Values = (
          357.187500000000000000
          1248.833333333330000000
          74.083333333333300000
          447.145833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
    end
    object FooterQRBand: TQRBand
      Left = 47
      Top = 791
      Width = 898
      Height = 109
      AfterPrint = FooterQRBandAfterPrint
      AlignToBottom = False
      BeforePrint = FooterQRBandBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        230.716666666666700000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object TotalQRLabel: TQRLabel
        Left = 608
        Top = 40
        Width = 145
        Height = 21
        Size.Values = (
          44.450000000000000000
          1286.933333333333000000
          84.666666666666670000
          306.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total Order Value:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object OrderValQRLabel: TQRLabel
        Left = 785
        Top = 40
        Width = 95
        Height = 21
        Size.Values = (
          44.979166666666700000
          1661.583333333330000000
          84.666666666666700000
          201.083333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'OrderValQRLabel'
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
    object pogroupheader: TQRGroup
      Left = 47
      Top = 391
      Width = 898
      Height = 336
      AlignToBottom = False
      BeforePrint = pogroupheaderBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        711.200000000000000000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'GetOrdHedQuery.Sel1'
      FooterBand = FooterQRBand
      Master = PurchOrdQuickReport
      ReprintOnNewPage = True
      object QRShape2: TQRShape
        Left = 447
        Top = 40
        Width = 432
        Height = 145
        Size.Values = (
          306.916666666667000000
          947.208333333333000000
          84.666666666666700000
          915.458333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRShape1: TQRShape
        Left = 20
        Top = 40
        Width = 421
        Height = 145
        Size.Values = (
          306.916666666667000000
          42.333333333333300000
          84.666666666666700000
          891.645833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel2: TQRLabel
        Left = 450
        Top = 10
        Width = 104
        Height = 25
        Size.Values = (
          52.916666666666670000
          952.500000000000000000
          21.166666666666670000
          220.133333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Deliver To:'
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
      object QRLabel1: TQRLabel
        Left = 18
        Top = 10
        Width = 33
        Height = 25
        Size.Values = (
          52.916666666666670000
          38.100000000000000000
          21.166666666666670000
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
      object QRLabel13: TQRLabel
        Left = 20
        Top = 191
        Width = 57
        Height = 21
        Size.Values = (
          44.450000000000000000
          42.333333333333330000
          404.283333333333300000
          120.650000000000000000)
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
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel4: TQRLabel
        Left = 20
        Top = 216
        Width = 35
        Height = 21
        Size.Values = (
          44.450000000000000000
          42.333333333333330000
          457.200000000000000000
          74.083333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fax:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object LineQrLabel: TQRLabel
        Left = 10
        Top = 281
        Width = 32
        Height = 21
        Size.Values = (
          44.450000000000000000
          21.166666666666670000
          594.783333333333300000
          67.733333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Line'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object PartQRLabel: TQRLabel
        Left = 63
        Top = 281
        Width = 57
        Height = 21
        Size.Values = (
          44.450000000000000000
          133.350000000000000000
          594.783333333333300000
          120.650000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Product'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object DescQRLabel: TQRLabel
        Left = 190
        Top = 281
        Width = 83
        Height = 21
        Size.Values = (
          44.450000000000000000
          402.166666666666700000
          594.783333333333300000
          175.683333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Description'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel6: TQRLabel
        Left = 450
        Top = 216
        Width = 35
        Height = 21
        Size.Values = (
          44.450000000000000000
          952.500000000000000000
          457.200000000000000000
          74.083333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Fax:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel5: TQRLabel
        Left = 450
        Top = 191
        Width = 57
        Height = 21
        Size.Values = (
          44.450000000000000000
          952.500000000000000000
          404.283333333333300000
          120.650000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Phone:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object OrdQtyQRLabel: TQRLabel
        Left = 620
        Top = 281
        Width = 65
        Height = 21
        Size.Values = (
          44.979166666666700000
          1312.333333333330000000
          595.312500000000000000
          137.583333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Pack'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object SAddr5QRLabel: TQRLabel
        Left = 30
        Top = 131
        Width = 401
        Height = 21
        Size.Values = (
          44.979166666666700000
          63.500000000000000000
          277.812500000000000000
          849.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Supplier Address'
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
      object SAddr1QRLabel: TQRLabel
        Left = 30
        Top = 51
        Width = 401
        Height = 21
        Size.Values = (
          44.979166666666700000
          63.500000000000000000
          108.479166666667000000
          849.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Supplier Address'
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
      object SAddr2QRLabel: TQRLabel
        Left = 30
        Top = 71
        Width = 401
        Height = 21
        Size.Values = (
          44.979166666666700000
          63.500000000000000000
          150.812500000000000000
          849.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Supplier Address'
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
      object SAddr3QRLabel: TQRLabel
        Left = 30
        Top = 91
        Width = 401
        Height = 21
        Size.Values = (
          44.979166666666700000
          63.500000000000000000
          193.145833333333000000
          849.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Supplier Address'
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
      object SAddr4QRLabel: TQRLabel
        Left = 30
        Top = 111
        Width = 401
        Height = 21
        Size.Values = (
          44.979166666666700000
          63.500000000000000000
          235.479166666667000000
          849.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Supplier Address'
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
      object SAddr6QRLabel: TQRLabel
        Left = 30
        Top = 151
        Width = 401
        Height = 21
        Size.Values = (
          44.979166666666700000
          63.500000000000000000
          320.145833333333000000
          849.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Supplier Address'
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
      object SPhoneQRLabel: TQRLabel
        Left = 80
        Top = 191
        Width = 361
        Height = 21
        Size.Values = (
          44.979166666666700000
          169.333333333333000000
          404.812500000000000000
          764.645833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Phone'
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
      object SFaxQRLabel: TQRLabel
        Left = 80
        Top = 216
        Width = 361
        Height = 21
        Size.Values = (
          44.979166666666700000
          169.333333333333000000
          457.729166666667000000
          764.645833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Fax'
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
      object SEmailLegQRLabel: TQRLabel
        Left = 20
        Top = 241
        Width = 55
        Height = 21
        Size.Values = (
          44.450000000000000000
          42.333333333333330000
          510.116666666666700000
          116.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'E-mail:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object SEmailQRLabel: TQRLabel
        Left = 80
        Top = 241
        Width = 361
        Height = 21
        Size.Values = (
          44.979166666666700000
          169.333333333333000000
          510.645833333333000000
          764.645833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'E-mail Address'
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
      object DAddr1QRLabel: TQRLabel
        Left = 460
        Top = 51
        Width = 401
        Height = 21
        Size.Values = (
          44.979166666666700000
          973.666666666667000000
          108.479166666667000000
          849.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Supplier Address'
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
      object DAddr2QRLabel: TQRLabel
        Left = 460
        Top = 71
        Width = 401
        Height = 21
        Size.Values = (
          44.979166666666700000
          973.666666666667000000
          150.812500000000000000
          849.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Supplier Address'
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
      object DAddr3QRLabel: TQRLabel
        Left = 460
        Top = 91
        Width = 401
        Height = 21
        Size.Values = (
          44.979166666666700000
          973.666666666667000000
          193.145833333333000000
          849.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Supplier Address'
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
      object DAddr4QRLabel: TQRLabel
        Left = 460
        Top = 111
        Width = 401
        Height = 21
        Size.Values = (
          44.979166666666700000
          973.666666666667000000
          235.479166666667000000
          849.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Supplier Address'
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
      object DAddr5QRLabel: TQRLabel
        Left = 460
        Top = 131
        Width = 401
        Height = 21
        Size.Values = (
          44.979166666666700000
          973.666666666667000000
          277.812500000000000000
          849.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Supplier Address'
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
      object DAddr6QRLabel: TQRLabel
        Left = 460
        Top = 151
        Width = 401
        Height = 21
        Size.Values = (
          44.979166666666700000
          973.666666666667000000
          320.145833333333000000
          849.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Supplier Address'
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
      object DPhoneQRLabel: TQRLabel
        Left = 520
        Top = 191
        Width = 351
        Height = 21
        Size.Values = (
          44.979166666666700000
          1100.666666666670000000
          404.812500000000000000
          743.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Phone'
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
      object DFaxQRLabel: TQRLabel
        Left = 520
        Top = 216
        Width = 351
        Height = 21
        Size.Values = (
          44.979166666666700000
          1100.666666666670000000
          457.729166666667000000
          743.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Fax'
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
      object QRLabel3: TQRLabel
        Left = 520
        Top = 301
        Width = 85
        Height = 21
        Size.Values = (
          44.979166666666700000
          1100.666666666670000000
          637.645833333333000000
          179.916666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Order Qty'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel7: TQRLabel
        Left = 762
        Top = 304
        Width = 38
        Height = 21
        Size.Values = (
          44.450000000000000000
          1612.900000000000000000
          643.466666666666700000
          80.433333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Price'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel8: TQRLabel
        Left = 620
        Top = 301
        Width = 61
        Height = 21
        Size.Values = (
          44.979166666666700000
          1312.333333333330000000
          637.645833333333000000
          129.645833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Size'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel12: TQRLabel
        Left = 840
        Top = 304
        Width = 40
        Height = 21
        Size.Values = (
          44.450000000000000000
          1778.000000000000000000
          643.466666666666700000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Value'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
    end
    object PreviewQRLabel: TQRLabel
      Left = 80
      Top = 50
      Width = 56
      Height = 21
      Size.Values = (
        44.450000000000000000
        169.333333333333300000
        105.833333333333300000
        118.533333333333300000)
      XLColumn = 0
      XLNumFormat = nfGeneral
      ActiveInPreview = False
      Alignment = taLeftJustify
      AlignToBand = False
      Caption = 'preview'
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
    object QRSubDetail1: TQRSubDetail
      Left = 47
      Top = 727
      Width = 898
      Height = 31
      AfterPrint = QRSubDetail1AfterPrint
      AlignToBottom = False
      BeforePrint = QRSubDetail1BeforePrint
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
        65.616666666666670000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = PurchOrdQuickReport
      DataSet = GetDetsQuery
      PrintBefore = False
      PrintIfEmpty = True
      object PackqtyQRLabel: TQRLabel
        Left = 520
        Top = 1
        Width = 81
        Height = 21
        Size.Values = (
          44.979166666666700000
          1100.666666666670000000
          2.645833333333330000
          171.979166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'PackqtyQRLabel'
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
      object POrdLineNoQRLabel: TQRLabel
        Left = 0
        Top = 1
        Width = 41
        Height = 21
        Size.Values = (
          44.979166666666700000
          0.000000000000000000
          2.645833333333330000
          87.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'LineNo'
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
      object PartCodeQRLabel: TQRLabel
        Left = 63
        Top = 1
        Width = 119
        Height = 21
        Size.Values = (
          44.979166666666700000
          132.291666666667000000
          2.645833333333330000
          251.354166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Product'
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
      object PartDescrQRLabel: TQRLabel
        Left = 190
        Top = 1
        Width = 311
        Height = 21
        Size.Values = (
          44.979166666666700000
          402.166666666667000000
          2.645833333333330000
          658.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Description'
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
      object PurchPriceQRLabel: TQRLabel
        Left = 730
        Top = 1
        Width = 71
        Height = 21
        Size.Values = (
          44.979166666666700000
          1545.166666666670000000
          2.645833333333330000
          150.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Purch Price'
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
      object PackSizeQRLabel: TQRLabel
        Left = 620
        Top = 1
        Width = 61
        Height = 21
        Size.Values = (
          44.979166666666700000
          1312.333333333330000000
          2.645833333333330000
          129.645833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Pack'
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
      object QRLblValue: TQRLabel
        Left = 813
        Top = 1
        Width = 69
        Height = 20
        Size.Values = (
          42.333333333333300000
          1719.791666666670000000
          2.645833333333330000
          145.520833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'QRLblValue'
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
    object QRSubDetail2: TQRSubDetail
      Left = 47
      Top = 758
      Width = 898
      Height = 33
      AfterPrint = QRSubDetail2AfterPrint
      AlignToBottom = False
      BeforePrint = QRSubDetail2BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        69.850000000000000000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = PurchOrdQuickReport
      DataSet = qryExtraCharges
      PrintBefore = False
      PrintIfEmpty = True
      object qrlblDetails: TQRLabel
        Left = 190
        Top = 4
        Width = 80
        Height = 21
        Size.Values = (
          44.450000000000000000
          402.166666666666700000
          8.466666666666667000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblDetails'
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
      object qrlblExChrgAmount: TQRLabel
        Left = 826
        Top = 4
        Width = 55
        Height = 21
        Size.Values = (
          44.450000000000000000
          1748.366666666667000000
          8.466666666666667000
          116.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'ExChrg'
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
  end
  object GetDetsDataSource: TDataSource
    DataSet = GetOrdHedQuery
    Left = 312
    Top = 19
  end
  object GetOrdDetQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'SELECT Purch_Ord_Line.Quantity_Ordered,Purch_Ord.Purch_Ord_No as' +
        ' OrdNum,'
      
        '       Purch_Ord_Line.Purch_Ord_Line_No,Purch_Ord.Purch_Ord_Date' +
        ','
      
        '       Purch_Ord_Line.Date_Deliv_Expected,Purch_Ord.Purch_Ord_St' +
        'atus,'
      '       Purch_Ord_Line.Purchase_Price,'
      '       Purch_Ord_Line.Quantity_Ordered,'
      '       Purch_Ord_Line.Cost_Price,'
      '       Purch_Ord.Purch_Ord_Descr,'
      
        '       Part.Part, Part.Part_Description, Part.Purch_Pack_Quantit' +
        'y,'
      '       Part_Store.Part_Store_Name as DelNam,'
      '       Part_Store.Internal_Number_and_Stret as DelAdd1,'
      '       Part_Store.Internal_District as DelAdd2,'
      '       Part_Store.Internal_Town as DelAdd3,'
      '       Part_Store.Internal_PostCode as DelAdd4,'
      '       Part_Store.Internal_Phone as DelAdd5,'
      '       Part_Store.Internal_Fax as DelAdd6,'
      '       '#39#39' as DelAdd7,'
      '       Purch_Ord.Sales_order'
      'FROM Purch_Ord_Line, Purch_Ord, Part, Part_Store'
      'WHERE ((Purch_Ord.Purch_Ord_No = :Sel1) or (:Sel1 = 0)) AND'
      '      (Purch_Ord.Purch_Ord = Purch_Ord_Line.Purch_Ord) AND'
      '      (Part.Part = Purch_Ord_Line.Part) and'
      '      (Part_Store.Part_Store = Purch_Ord.Part_store)'
      'Order By Purch_Ord.Purch_Ord_No,'
      '         Purch_Ord_Line.Purch_Ord_Line_No'
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
      ' '
      ' '
      ' '
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
    Left = 441
    Top = 122
    ParamData = <
      item
        Name = 'Sel1'
        DataType = ftInteger
      end
      item
        Name = 'Sel1'
        DataType = ftInteger
      end>
  end
  object GetRecOrdQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'SELECT Purch_Ord_Line.Quantity_Ordered,Purch_ord.Purch_Ord_Rec_r' +
        'ef as OrdNum,'
      
        '       Purch_Ord_Line.Purch_Ord_Line_No,Purch_Ord.Purch_Ord_Date' +
        ','
      
        '       Purch_Ord_Line.Date_Deliv_Expected,Purch_Ord.Purch_Ord_St' +
        'atus,'
      '       Purch_Ord_Line.Purchase_Price,'
      '       Purch_Ord_Line.Quantity_Ordered,'
      '       Purch_Ord.Purch_Ord_Descr,'
      
        '       Part.Part, Part.Part_Description, Part.Purch_Pack_Quantit' +
        'y,'
      '       Part_Store.Part_Store_Name as DelNam,'
      '       Part_Store.Internal_Number_and_Stret as DelAdd1,'
      '       Part_Store.Internal_District as DelAdd2,'
      '       Part_Store.Internal_Town as DelAdd3,'
      '       Part_Store.Internal_PostCode as DelAdd4,'
      '       Part_Store.Internal_Phone as DelAdd5,'
      '       Part_Store.Internal_Fax as DelAdd6,'
      '       '#39#39' as DelAdd7'
      'FROM  Purch_Ord_Line, Purch_Ord, Part, Part_Store'
      'WHERE ((Purch_Ord.Purch_Ord_No = :Sel1) or (:Sel1 = 0)) AND'
      '      (Purch_Ord.Purch_Ord = Purch_Ord_Line.Purch_Ord) AND'
      '      (Part.Part = Purch_Ord_Line.Part) and'
      '      (Part_store.Part_Store = Purch_ord.Part_Store)'
      'Order By Purch_Ord_Rec_Ref,'
      '         Purch_Ord_Line.Purch_Ord_Line_No'
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
      ' '
      ' '
      ' '
      ' ')
    Left = 386
    Top = 118
    ParamData = <
      item
        Name = 'Sel1'
        DataType = ftInteger
      end
      item
        Name = 'Sel1'
        DataType = ftInteger
      end>
  end
  object GetDelFromSuppQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Supplier.Name as SuppNam,'
      '       Supplier_Branch.Name,'
      '       Supplier_Branch.Building_No_Name,'
      '       Supplier_Branch.Street,'
      '       Supplier_Branch.Locale,'
      '       Supplier_Branch.Town,'
      '       Supplier_Branch.PostCode,'
      '       Supplier_Branch.Phone as Suppadd5,'
      '       Supplier_Branch.Fax_Number as Suppadd6,'
      '       Supplier_Branch.email as Suppadd7'
      'FROM Supplier, Supplier_Branch, Purch_Ord'
      'WHERE (Supplier.Supplier = Purch_Ord.Supplier) AND'
      '      (Supplier_Branch.Supplier = Purch_Ord.Supplier) AND'
      '      (Supplier_Branch.Branch_No = Purch_Ord.Branch_No) AND'
      '      (Purch_Ord.Purch_Ord_No = :Sel1)'
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
      ' ')
    Left = 331
    Top = 185
    ParamData = <
      item
        Name = 'Sel1'
        DataType = ftInteger
      end>
    object GetDelFromSuppQuerySuppNam: TWideStringField
      FieldName = 'SuppNam'
      Size = 40
    end
    object GetDelFromSuppQueryName: TWideStringField
      FieldName = 'Name'
      Size = 40
    end
    object GetDelFromSuppQueryBuilding_No_Name: TWideStringField
      FieldName = 'Building_No_Name'
      Size = 40
    end
    object GetDelFromSuppQueryStreet: TWideStringField
      FieldName = 'Street'
      Size = 40
    end
    object GetDelFromSuppQueryLocale: TWideStringField
      FieldName = 'Locale'
      Size = 40
    end
    object GetDelFromSuppQueryTown: TWideStringField
      FieldName = 'Town'
      Size = 40
    end
    object GetDelFromSuppQueryPostCode: TWideStringField
      FieldName = 'PostCode'
      Size = 10
    end
    object GetDelFromSuppQueryPhone: TWideStringField
      FieldName = 'Phone'
    end
    object GetDelFromSuppQueryFax_Number: TWideStringField
      FieldName = 'Fax_Number'
    end
    object GetDelFromSuppQueryemail: TWideStringField
      FieldName = 'email'
      Size = 40
    end
  end
  object UpdStatusQuery: TFDQuery
    MasterSource = GetDetsDataSource
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Purch_Ord'
      'Set Purch_Ord_Status = '#39'G'#39
      'Where Purch_Ord_Status = '#39'C'#39' '
      ' ')
    Left = 30
    Top = 14
  end
  object GetDetsQuery: TFDQuery
    ConnectionName = 'PB'
    Left = 96
    Top = 269
  end
  object GetOrdHedQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select  Sel1,'
      '        text100,'
      '        Purch_Ord.Purch_Ord,'
      '        Supplier.Name as Name,'
      '        Supplier_Branch.Name as Branch_Name,'
      '        Supplier_Branch.Fax_number'
      'from'
      '  Int_Sel, Purch_Ord, Supplier, Supplier_Branch'
      'where'
      '  (Int_Sel_Code = :Int_Sel_Code) and'
      '  (Sel1 <> 0) and'
      '  (Sel1 = Purch_Ord.Purch_Ord_no) and'
      '  ('
      '  (Purch_Ord.Supplier = Supplier_Branch.Supplier) and'
      '  (Purch_Ord.Branch_no = Supplier_Branch.Branch_no)'
      '  ) and'
      '  (Supplier_Branch.Supplier = Supplier.Supplier)'
      'order by'
      '  Sel1'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 342
    Top = 16
    ParamData = <
      item
        Name = 'Int_Sel_Code'
        DataType = ftInteger
      end>
  end
  object GetDelFromStoreQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Part_Store.Part_Store_Name as SuppNam,'
      '       Part_Store.Internal_Number_and_Stret as SuppAdd1,'
      '       Part_Store.Internal_District as SuppAdd2,'
      '       Part_Store.Internal_Town as SuppAdd3,'
      '       Part_Store.Internal_PostCode as SuppAdd4,'
      '       Part_Store.Internal_Phone as SuppAdd5,'
      '       Part_Store.Internal_Fax as SuppAdd6,'
      '       '#39#39' as Suppadd7'
      'FROM Part_Store,Purch_Ord'
      'WHERE (Part_Store.Part_Store = Purch_Ord.Part_Store_From) AND'
      '      (Purch_Ord_No.Purch_Ord = :Sel1)'
      ' '
      ' '
      ' ')
    Left = 174
    Top = 203
    ParamData = <
      item
        Name = 'Sel1'
      end>
  end
  object GetPFJQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Purch_Ord_Line_Alloc.Parts_For_Job,Parts_For_Job.Job'
      'From Purch_Ord_Line_Alloc, Parts_For_Job, Purch_Ord'
      
        'Where (Purch_ord_Line_Alloc.Parts_For_Job = Parts_For_Job.Parts_' +
        'For_Job) and'
      '  Purch_Ord_Line_Alloc.Purch_Ord_Line_No = :PordLineNo and'
      '  Purch_Ord.Purch_Ord = Purch_Ord_Line_Alloc.Purch_Ord and'
      '  Purch_Ord.Purch_Ord_No = :PurchOrd'
      '  '
      ' '
      ' '
      ' '
      ' ')
    Left = 302
    Top = 102
    ParamData = <
      item
        Name = 'PordLineNo'
      end
      item
        Name = 'PurchOrd'
      end>
  end
  object GetDelivAddQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      '')
    Left = 182
    Top = 31
  end
  object GetSODelAddQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Customer.Name as DelNam,'
      '          Customer_Branch.Building_no_Name as DelAdd1,'
      '          Customer_Branch.Street as DelAdd2,'
      '          Customer_Branch.Locale as DelAdd3,'
      '          Customer_Branch.Town as DelAdd4,'
      '          Customer_Branch.Postcode as DelAdd5,'
      '          Customer_Branch.Phone as DelAdd6,'
      '          Customer_Branch.Fax_number as DelAdd7'
      'from Sales_order, Customer, Customer_Branch'
      'where Sales_Order.SAles_Order = :Sales_order and'
      '('
      '(Sales_order.Delivery_Customer = Customer_branch.Customer) and'
      '(Sales_order.Delivery_Branch = Customer_branch.Branch_no)'
      ') and'
      '(Customer_branch.Customer = Customer.Customer)'
      ' ')
    Left = 534
    Top = 233
    ParamData = <
      item
        Name = 'Sales_order'
      end>
  end
  object CompSRC: TDataSource
    DataSet = GetCompSQL
    Left = 96
    Top = 79
  end
  object GetCompSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select * from Company'
      'Where Company = 1')
    Left = 184
    Top = 78
  end
  object qryExtraCharges: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Purch_Ord_Add_Charge.*,'
      
        '          (Purch_Ord_Add_Charge.Amount + (Purch_Ord_Add_Charge.A' +
        'mount * (Vat_Code.Vat_Rate/100))) as TotalVal'
      'from Purch_Ord_Add_Charge, '
      '        Purch_Ord,'
      '        Vat_Code'
      'Where ((Purch_Ord_Add_Charge.Vat_Code = Vat_Code.Vat_Code) and'
      
        '       (purch_ord.Purch_ord = purch_ord_add_charge.Purch_ord) an' +
        'd'
      '       (Purch_ord.purch_ord_no = :purch_ord_no));'
      '')
    Left = 46
    Top = 178
    ParamData = <
      item
        Name = 'purch_ord_no'
        DataType = ftString
      end>
  end
end
