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
    Width = 992
    Height = 1403
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
      Top = 77
      Width = 992
      Height = 24
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
        50.800000000000000000
        2099.733333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object Column1: TQRLabel
        Left = 40
        Top = 0
        Width = 72
        Height = 25
        Size.Values = (
          52.916666666666670000
          84.666666666666670000
          0.000000000000000000
          152.400000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Column1'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -20
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
        Left = 356
        Top = 0
        Width = 72
        Height = 25
        Size.Values = (
          52.916666666666670000
          753.533333333333300000
          0.000000000000000000
          152.400000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Column2'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -20
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
        Left = 660
        Top = 0
        Width = 72
        Height = 25
        Size.Values = (
          52.916666666666670000
          1397.000000000000000000
          0.000000000000000000
          152.400000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Column3'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -20
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
      Width = 992
      Height = 50
      AlignToBottom = False
      BeforePrint = PageHeaderBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        2099.733333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
    end
    object PageFooter: TQRBand
      Left = 0
      Top = 101
      Width = 992
      Height = 50
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        2099.733333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageFooter
      object qrlblAuthorised: TQRLabel
        Left = 360
        Top = 5
        Width = 299
        Height = 43
        Enabled = False
        Size.Values = (
          91.016666666666670000
          762.000000000000000000
          10.583333333333330000
          632.883333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'UNAUTHORISED'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -37
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
      Left = 70
      Top = 370
      Width = 131
      Height = 131
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
      Left = 260
      Top = 300
      Width = 84
      Height = 21
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
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 10
    end
    object PageContinued: TQRChildBand
      Left = 0
      Top = 50
      Width = 992
      Height = 27
      AlignToBottom = False
      Enabled = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        57.150000000000000000
        2099.733333333333000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = PageHeader
      PrintOrder = cboAfterParent
      object labContinued: TQRLabel
        Left = 453
        Top = 0
        Width = 87
        Height = 25
        Size.Values = (
          52.916666666666670000
          958.850000000000000000
          0.000000000000000000
          184.150000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Continued'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -20
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
      Left = 230
      Top = 370
      Width = 131
      Height = 131
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
      Left = 390
      Top = 370
      Width = 131
      Height = 131
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
      Left = 550
      Top = 370
      Width = 131
      Height = 131
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
      Left = 260
      Top = 540
      Width = 84
      Height = 21
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
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      FullJustify = False
      MaxBreakChars = 0
      FontSize = 10
    end
  end
end
