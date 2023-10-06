object frmPrintingPress: TfrmPrintingPress
  Left = 266
  Top = 103
  Width = 1212
  Height = 817
  HorzScrollBar.Range = 1200
  VertScrollBar.Range = 2000
  Caption = 'Broker Printing Press'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Times New Roman'
  Font.Style = [fsBold]
  Scaled = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 19
  object ReportImage: TImage
    Left = 63
    Top = 32
    Width = 130
    Height = 129
    Stretch = True
  end
  object QuickR: TQuickRep
    Left = 0
    Top = 8
    Width = 794
    Height = 1123
    ShowingPreview = False
    BeforePrint = QuickRBeforePrint
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
    OnNeedData = QuickRNeedData
    OnStartPage = QuickRStartPage
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Continuous = False
    Page.Values = (
      0.000000000000000000
      2970.000000000000000000
      0.000000000000000000
      2100.000000000000000000
      0.000000000000000000
      0.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.OutputBin = Auto
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.UseStandardprinter = True
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
    object LineToPrint: TQRBand
      Left = 0
      Top = 62
      Width = 794
      Height = 19
      Frame.Width = 0
      AfterPrint = LineToPrintAfterPrint
      AlignToBottom = False
      BeforePrint = LineToPrintBeforePrint
      TransparentBand = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        50.270833333333330000
        2100.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object Column1: TQRLabel
        Left = 32
        Top = 0
        Width = 56
        Height = 20
        Size.Values = (
          52.916666666666670000
          84.666666666666670000
          0.000000000000000000
          148.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Column1'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object Column2: TQRLabel
        Left = 285
        Top = 0
        Width = 56
        Height = 20
        Size.Values = (
          52.916666666666670000
          754.062500000000000000
          0.000000000000000000
          148.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Column2'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object Column3: TQRLabel
        Left = 528
        Top = 0
        Width = 56
        Height = 20
        Size.Values = (
          52.916666666666670000
          1397.000000000000000000
          0.000000000000000000
          148.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Column3'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
    end
    object PageHeader: TQRBand
      Left = 0
      Top = 0
      Width = 794
      Height = 40
      AlignToBottom = False
      BeforePrint = PageHeaderBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        2100.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
    end
    object PageFooter: TQRBand
      Left = 0
      Top = 81
      Width = 794
      Height = 40
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        2100.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageFooter
      object qrlblAuthorised: TQRLabel
        Left = 288
        Top = 4
        Width = 233
        Height = 34
        Enabled = False
        Size.Values = (
          89.958333333333330000
          762.000000000000000000
          10.583333333333330000
          616.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'UNAUTHORISED'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -29
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 22
      end
    end
    object imgLogo: TQRImage
      Left = 56
      Top = 296
      Width = 105
      Height = 105
      Enabled = False
      Size.Values = (
        277.812500000000000000
        148.166666666666700000
        783.166666666666700000
        277.812500000000000000)
      XLColumn = 0
      XLNumFormat = nfGeneral
      ActiveInPreview = False
      Stretch = True
    end
    object MyAddress: TQRMemo
      Left = 208
      Top = 240
      Width = 67
      Height = 17
      Size.Values = (
        44.979166666666670000
        550.333333333333300000
        635.000000000000000000
        177.270833333333300000)
      XLColumn = 0
      XLNumFormat = nfGeneral
      ActiveInPreview = False
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      Transparent = False
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 10
    end
    object PageContinued: TQRChildBand
      Left = 0
      Top = 40
      Width = 794
      Height = 22
      AlignToBottom = False
      Enabled = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        58.208333333333330000
        2100.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = PageHeader
      PrintOrder = cboAfterParent
      object labContinued: TQRLabel
        Left = 362
        Top = 0
        Width = 69
        Height = 20
        Size.Values = (
          52.916666666666670000
          957.791666666666700000
          0.000000000000000000
          182.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Continued'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
    end
    object imgLogo1: TQRImage
      Left = 184
      Top = 296
      Width = 105
      Height = 105
      Enabled = False
      Size.Values = (
        277.812500000000000000
        486.833333333333300000
        783.166666666666700000
        277.812500000000000000)
      XLColumn = 0
      XLNumFormat = nfGeneral
      ActiveInPreview = False
      Stretch = True
    end
    object imgLogo2: TQRImage
      Left = 312
      Top = 296
      Width = 105
      Height = 105
      Enabled = False
      Size.Values = (
        277.812500000000000000
        825.500000000000000000
        783.166666666666700000
        277.812500000000000000)
      XLColumn = 0
      XLNumFormat = nfGeneral
      ActiveInPreview = False
      Stretch = True
    end
    object imgLogo3: TQRImage
      Left = 440
      Top = 296
      Width = 105
      Height = 105
      Enabled = False
      Size.Values = (
        277.812500000000000000
        1164.166666666667000000
        783.166666666666700000
        277.812500000000000000)
      XLColumn = 0
      XLNumFormat = nfGeneral
      ActiveInPreview = False
      Stretch = True
    end
    object MyRegAddress: TQRMemo
      Left = 208
      Top = 432
      Width = 67
      Height = 17
      Size.Values = (
        44.979166666666670000
        550.333333333333300000
        1143.000000000000000000
        177.270833333333300000)
      XLColumn = 0
      XLNumFormat = nfGeneral
      ActiveInPreview = False
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = False
      Color = clWhite
      Transparent = False
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 10
    end
  end
end
