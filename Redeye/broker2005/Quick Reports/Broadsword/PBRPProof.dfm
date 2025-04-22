object PBRPProofFrm: TPBRPProofFrm
  Left = 229
  Top = 101
  Width = 918
  Height = 586
  HorzScrollBar.Range = 1200
  VertScrollBar.Position = 1452
  VertScrollBar.Range = 2000
  Caption = 'Print Proof Approval Letter'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  Scaled = False
  OnCreate = FormCreate
  TextHeight = 14
  object PrintPOsQuickReport: TQuickRep
    Left = 24
    Top = 76
    Width = 992
    Height = 1403
    ShowingPreview = False
    BeforePrint = PrintPOsQuickReportBeforePrint
    DataSet = GetProofSQL
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial Narrow'
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
    PrinterSettings.PrintQuality = 0
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
    object PageHeaderQRBand: TQRBand
      Left = 47
      Top = 47
      Width = 898
      Height = 464
      Frame.DrawBottom = True
      AfterPrint = PageHeaderQRBandAfterPrint
      AlignToBottom = False
      BeforePrint = PageHeaderQRBandBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        982.133333333333300000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object ReportImage: TQRImage
        Left = 3
        Top = 1
        Width = 286
        Height = 60
        Enabled = False
        Size.Values = (
          127.000000000000000000
          6.350000000000000000
          2.116666666666667000
          605.366666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Stretch = True
      end
      object OrderLbl: TQRLabel
        Left = 69
        Top = 95
        Width = 224
        Height = 30
        Enabled = False
        Size.Values = (
          63.500000000000000000
          146.050000000000000000
          201.083333333333300000
          474.133333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'PROOF APPROVAL No. '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -23
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 14
      end
      object PONumberLbl: TQRLabel
        Left = 80
        Top = 95
        Width = 130
        Height = 30
        Size.Values = (
          63.500000000000000000
          169.333333333333300000
          201.083333333333300000
          275.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'PONumberLbl'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -23
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 14
      end
      object QRLabel4: TQRLabel
        Left = 80
        Top = 195
        Width = 69
        Height = 25
        Size.Values = (
          52.916666666666670000
          169.333333333333300000
          412.750000000000000000
          146.050000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'ORDER REF:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object YourRefLbl: TQRLabel
        Left = 80
        Top = 215
        Width = 82
        Height = 26
        Size.Values = (
          55.033333333333330000
          169.333333333333300000
          455.083333333333300000
          173.566666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'YourRefLbl'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object AddressMemo: TQRMemo
        Left = 80
        Top = 265
        Width = 341
        Height = 191
        Size.Values = (
          404.812500000000000000
          169.333333333333300000
          560.916666666666700000
          722.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -20
        Font.Name = 'Arial Narrow'
        Font.Style = []
        Lines.Strings = (
          'For Delivery To:')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 12
      end
      object QRDBText2: TQRDBText
        Left = 80
        Top = 160
        Width = 39
        Height = 25
        Size.Values = (
          52.916666666666670000
          169.333333333333300000
          338.666666666666700000
          82.550000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = GetProofSQL
        DataField = 'Name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel20: TQRLabel
        Left = 80
        Top = 140
        Width = 67
        Height = 21
        Size.Values = (
          44.450000000000000000
          169.333333333333300000
          296.333333333333300000
          141.816666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'CUSTOMER:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object DateLbl: TQRLabel
        Left = 537
        Top = 100
        Width = 49
        Height = 23
        Size.Values = (
          48.683333333333330000
          1136.650000000000000000
          211.666666666666700000
          103.716666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'DateLbl'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object lblProofRevision: TQRLabel
        Left = 458
        Top = 140
        Width = 128
        Height = 26
        Size.Values = (
          55.033333333333330000
          969.433333333333300000
          296.333333333333300000
          270.933333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'lblProofRevision'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
    end
    object DetailQRBand: TQRBand
      Left = 47
      Top = 511
      Width = 898
      Height = 780
      AlignToBottom = False
      BeforePrint = DetailQRBandBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        1651.000000000000000000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRShape1: TQRShape
        Left = 0
        Top = 140
        Width = 897
        Height = 5
        Size.Values = (
          10.583333333333300000
          0.000000000000000000
          296.333333333333000000
          1899.708333333330000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel12: TQRLabel
        Left = 385
        Top = 219
        Width = 45
        Height = 25
        Size.Values = (
          52.916666666666670000
          814.916666666666700000
          463.550000000000000000
          95.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Signed'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial Narrow'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel15: TQRLabel
        Left = 715
        Top = 219
        Width = 31
        Height = 25
        Size.Values = (
          52.916666666666670000
          1513.416666666667000000
          463.550000000000000000
          65.616666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial Narrow'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRShape5: TQRShape
        Left = 435
        Top = 235
        Width = 261
        Height = 5
        Size.Values = (
          10.583333333333300000
          920.750000000000000000
          497.416666666667000000
          552.979166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape8: TQRShape
        Left = 745
        Top = 235
        Width = 125
        Height = 5
        Size.Values = (
          10.583333333333300000
          1576.916666666670000000
          497.416666666667000000
          264.583333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel18: TQRLabel
        Left = 0
        Top = 159
        Width = 514
        Height = 25
        Size.Values = (
          52.916666666666670000
          0.000000000000000000
          336.550000000000000000
          1087.966666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          'All proof details have been carefully checked and are approved a' +
          's follows:-'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel3: TQRLabel
        Left = 0
        Top = 219
        Width = 220
        Height = 26
        Size.Values = (
          55.033333333333330000
          0.000000000000000000
          463.550000000000000000
          465.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'PROCEED, NO AMENDMENTS'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -18
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 11
      end
      object QRLabel5: TQRLabel
        Left = 0
        Top = 293
        Width = 247
        Height = 26
        Size.Values = (
          55.033333333333330000
          0.000000000000000000
          620.183333333333300000
          522.816666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'PROCEED, AFTER AMENDMENTS'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -18
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 11
      end
      object QRLabel6: TQRLabel
        Left = 385
        Top = 293
        Width = 45
        Height = 25
        Size.Values = (
          52.916666666666670000
          814.916666666666700000
          620.183333333333300000
          95.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Signed'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial Narrow'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRShape2: TQRShape
        Left = 435
        Top = 309
        Width = 261
        Height = 5
        Size.Values = (
          10.583333333333300000
          920.750000000000000000
          653.520833333333000000
          552.979166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel7: TQRLabel
        Left = 715
        Top = 293
        Width = 31
        Height = 25
        Size.Values = (
          52.916666666666670000
          1513.416666666667000000
          620.183333333333300000
          65.616666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial Narrow'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRShape3: TQRShape
        Left = 745
        Top = 309
        Width = 125
        Height = 5
        Size.Values = (
          10.583333333333300000
          1576.916666666670000000
          653.520833333333000000
          264.583333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel8: TQRLabel
        Left = 0
        Top = 364
        Width = 151
        Height = 26
        Size.Values = (
          55.033333333333330000
          0.000000000000000000
          770.466666666666700000
          319.616666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'AMEND & REPROOF'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -18
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 11
      end
      object QRLabel9: TQRLabel
        Left = 385
        Top = 364
        Width = 45
        Height = 25
        Size.Values = (
          52.916666666666670000
          814.916666666666700000
          770.466666666666700000
          95.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Signed'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial Narrow'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRShape4: TQRShape
        Left = 435
        Top = 380
        Width = 261
        Height = 5
        Size.Values = (
          10.583333333333300000
          920.750000000000000000
          804.333333333333000000
          552.979166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel10: TQRLabel
        Left = 715
        Top = 364
        Width = 31
        Height = 25
        Size.Values = (
          52.916666666666670000
          1513.416666666667000000
          770.466666666666700000
          65.616666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial Narrow'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRShape6: TQRShape
        Left = 745
        Top = 380
        Width = 125
        Height = 5
        Size.Values = (
          10.583333333333300000
          1576.916666666670000000
          804.333333333333000000
          264.583333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape7: TQRShape
        Left = 0
        Top = 420
        Width = 897
        Height = 5
        Size.Values = (
          10.583333333333300000
          0.000000000000000000
          889.000000000000000000
          1899.708333333330000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape9: TQRShape
        Left = -10
        Top = 601
        Width = 897
        Height = 5
        Size.Values = (
          10.583333333333300000
          -21.166666666666700000
          1272.645833333330000000
          1899.708333333330000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel11: TQRLabel
        Left = 0
        Top = 619
        Width = 284
        Height = 25
        Size.Values = (
          52.916666666666670000
          0.000000000000000000
          1310.216666666667000000
          601.133333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'CUSTOMER REMARKS / SPECIAL NOTES :'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -17
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRShape10: TQRShape
        Left = 0
        Top = 761
        Width = 897
        Height = 5
        Size.Values = (
          10.583333333333300000
          0.000000000000000000
          1611.312500000000000000
          1899.708333333330000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel13: TQRLabel
        Left = 20
        Top = 8
        Width = 57
        Height = 25
        Size.Values = (
          52.916666666666670000
          42.333333333333330000
          16.933333333333330000
          120.650000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'QUANTITY'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel14: TQRLabel
        Left = 160
        Top = 8
        Width = 56
        Height = 25
        Size.Values = (
          52.916666666666670000
          338.666666666666700000
          16.933333333333330000
          118.533333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'JOB TITLE'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel16: TQRLabel
        Left = 680
        Top = 8
        Width = 38
        Height = 25
        Size.Values = (
          52.916666666666670000
          1439.333333333333000000
          16.933333333333330000
          80.433333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'DEPTH'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel17: TQRLabel
        Left = 790
        Top = 8
        Width = 37
        Height = 25
        Size.Values = (
          52.916666666666670000
          1672.166666666667000000
          16.933333333333330000
          78.316666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'WIDTH'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel25: TQRLabel
        Left = 764
        Top = 34
        Width = 12
        Height = 26
        Size.Values = (
          55.033333333333330000
          1617.133333333333000000
          71.966666666666670000
          25.400000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'X'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRLabel26: TQRLabel
        Left = 0
        Top = 430
        Width = 619
        Height = 26
        Size.Values = (
          55.033333333333330000
          0.000000000000000000
          910.166666666666700000
          1310.216666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          'All paper proofs are paper/laser copies and as such may differ s' +
          'lightly dimensionally.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Arial Narrow'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRLabel27: TQRLabel
        Left = 0
        Top = 468
        Width = 412
        Height = 26
        Size.Values = (
          55.033333333333330000
          0.000000000000000000
          990.600000000000000000
          872.066666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Please check layout, spacing and spelling very carefully '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Arial Narrow'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRLabel28: TQRLabel
        Left = 413
        Top = 468
        Width = 399
        Height = 26
        Size.Values = (
          55.033333333333330000
          874.183333333333300000
          990.600000000000000000
          844.550000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'paying particular attention to names and telephone'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRLabel29: TQRLabel
        Left = 0
        Top = 491
        Width = 108
        Height = 26
        Size.Values = (
          55.033333333333330000
          0.000000000000000000
          1039.283333333333000000
          228.600000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'numbers etc. '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRLabel30: TQRLabel
        Left = 110
        Top = 491
        Width = 661
        Height = 26
        Size.Values = (
          55.033333333333330000
          232.833333333333300000
          1039.283333333333000000
          1399.116666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          'as no liability can be accepted for errors and omissions once th' +
          'e proof has been approved.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Arial Narrow'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRLabel31: TQRLabel
        Left = 0
        Top = 536
        Width = 651
        Height = 26
        Size.Values = (
          55.033333333333330000
          0.000000000000000000
          1134.533333333333000000
          1377.950000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          'Work cannot proceed until we have this proof slip signed and ret' +
          'urned to us together with'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Arial Narrow'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRLabel32: TQRLabel
        Left = 0
        Top = 558
        Width = 304
        Height = 26
        Size.Values = (
          55.033333333333330000
          0.000000000000000000
          1181.100000000000000000
          643.466666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'your original copy and all previous proofs.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Arial Narrow'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object LabQuantity: TQRLabel
        Left = 20
        Top = 34
        Width = 95
        Height = 26
        Size.Values = (
          55.033333333333330000
          42.333333333333330000
          71.966666666666670000
          201.083333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'LabQuantity'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object LabJobTitle: TQRLabel
        Left = 160
        Top = 34
        Width = 471
        Height = 51
        Size.Values = (
          108.479166666667000000
          338.666666666667000000
          71.437500000000000000
          997.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'LabJobTitle'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object LabDepth: TQRLabel
        Left = 643
        Top = 34
        Width = 76
        Height = 26
        Size.Values = (
          55.033333333333330000
          1361.016666666667000000
          71.966666666666670000
          160.866666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'LabDepth'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object LabWidth: TQRLabel
        Left = 790
        Top = 34
        Width = 74
        Height = 26
        Size.Values = (
          55.033333333333330000
          1672.166666666667000000
          71.966666666666670000
          156.633333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'LabWidth'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object FormRefLbl: TQRLabel
        Left = 160
        Top = 87
        Width = 82
        Height = 26
        Size.Values = (
          55.033333333333330000
          338.666666666666700000
          184.150000000000000000
          173.566666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'FormRefLbl'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object FormRefDescLbl: TQRLabel
        Left = 160
        Top = 111
        Width = 116
        Height = 26
        Size.Values = (
          55.033333333333330000
          338.666666666666700000
          234.950000000000000000
          245.533333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'FormRefDescLbl'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object QRBand1: TQRBand
      Left = 47
      Top = 1291
      Width = 898
      Height = 140
      AfterPrint = QRBand1AfterPrint
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        296.333333333333300000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageFooter
      object QRLabel19: TQRLabel
        Left = 10
        Top = 9
        Width = 110
        Height = 20
        Size.Values = (
          42.333333333333330000
          21.166666666666670000
          19.050000000000000000
          232.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Order Processed By :  '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRDBText8: TQRDBText
        Left = 150
        Top = 8
        Width = 73
        Height = 20
        Size.Values = (
          42.333333333333330000
          317.500000000000000000
          16.933333333333330000
          154.516666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = GetProofSQL
        DataField = 'Contact_Name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial Narrow'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object labCompanyAddress: TQRMemo
        Left = 190
        Top = 70
        Width = 521
        Height = 51
        Enabled = False
        Size.Values = (
          108.479166666666700000
          402.166666666666700000
          148.166666666666700000
          1103.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
    end
  end
  object GetProofSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'SELECT Purchase_OrderLine.Purchase_Order, Purchase_OrderLine.Lin' +
        'e,'
      
        '               Purchase_OrderLine.Supplier_Job_Ref, Purchase_Ord' +
        'erLine.Goods_Required,'
      
        '               Purchase_OrderLine.Enquiry, Purchase_OrderLine.Li' +
        'ne0 as Enquiry_Line,'
      
        '               Purchase_OrderLine.Quantity, Purchase_OrderLine.s' +
        'elling_Price as Price,'
      
        '               Purchase_Order.Date_Point, Purchase_OrderLine.Sup' +
        'pliers_Desc,'
      '               Purchase_OrderLine.Customers_Desc,'
      
        '               Purchase_OrderLine.Cust_Order_no, Purchase_OrderL' +
        'ine.Product_Type,'
      '               Customer.Name, Customer_Branch.Building_No_name,'
      
        '               Customer_Branch.Street, Customer_Branch.Locale, C' +
        'ustomer_Branch.Town, '
      
        '               Customer_Branch.Postcode, Customer_Branch.Custome' +
        'r,'
      
        '               Customer_Branch.Branch_No, Customer_Branch.Narrat' +
        'ive,'
      '               Price_Unit.Description as order_Description,'
      '               Rep.Name as Rep_Name,'
      '               Rep.Rep_Suffix_or_prefix,'
      '               Operator.Name as Contact_Name,'
      
        '               Purchase_OrderLine.Depth, Purchase_OrderLine.Widt' +
        'h,'
      
        '               Purchase_OrderLine.Depth_Unit, Purchase_OrderLine' +
        '.Width_Unit,'
      '               Customer_Contact.Name as Cust_Contact_Name,'
      '               Purchase_OrderLine.Form_Reference,'
      '               Purchase_OrderLine.Proof_Revision'
      
        'FROM Purchase_Order, Customer_Branch, Customer, Purchase_OrderLi' +
        'ne,'
      #9#9'Price_Unit, Rep, Operator, Customer_Contact'
      
        'WHERE (Purchase_Order.Purchase_Order = Purchase_OrderLine.Purcha' +
        'se_Order) and'
      
        '      (Customer_Branch.Customer = Purchase_OrderLine.Customer) a' +
        'nd'
      
        '      (Customer_Branch.Branch_No = Purchase_OrderLine.Branch_No)' +
        ' and'
      '      (Customer.Customer = Customer_Branch.Customer) and'
      '      ('
      
        '      (Customer_Contact.Customer = Purchase_OrderLine.Customer) ' +
        'and'
      
        '      (Customer_Contact.Branch_No = Purchase_OrderLine.Branch_No' +
        ') and'
      
        '      (Customer_Contact.Contact_no = Purchase_OrderLine.Contact_' +
        'no)'
      '      ) and'
      '      (Purchase_OrderLine.Rep = Rep.Rep) and'
      '      (Purchase_OrderLine.sell_Unit = Price_Unit.Price_Unit) and'
      
        '      ((Purchase_Order.Purchase_Order = :Purchase_Order ) or (:P' +
        'urchase_Order = 0)) and'
      
        '      ((Purchase_Order.Operator = :Operator ) or (:Operator = 0)' +
        ') and'
      
        '      ((Purchase_OrderLine.Customer = :Customer ) or (:ByCustome' +
        'r <> '#39'Y'#39')) and'
      
        '      ((Purchase_OrderLine.Branch_No = :Branch_No ) or (:ByBranc' +
        'h <> '#39'Y'#39')) and'
      '      (Purchase_Order.Office_Contact = Operator.Operator)'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 56
    Top = 1
    ParamData = <
      item
        Name = 'Purchase_Order'
        DataType = ftInteger
      end
      item
        Name = 'Purchase_Order'
        DataType = ftInteger
      end
      item
        Name = 'Operator'
        DataType = ftInteger
      end
      item
        Name = 'Operator'
        DataType = ftInteger
      end
      item
        Name = 'Customer'
        DataType = ftInteger
      end
      item
        Name = 'ByCustomer'
        DataType = ftString
      end
      item
        Name = 'Branch_No'
        DataType = ftInteger
      end
      item
        Name = 'ByBranch'
        DataType = ftString
      end>
  end
  object GetCompSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select * from Company'
      'Where Company = 1')
    Left = 384
    Top = 6
  end
  object CompSRC: TDataSource
    DataSet = GetCompSQL
    Left = 296
    Top = 7
  end
  object POsSRC: TDataSource
    OnDataChange = POsSRCDataChange
    Left = 136
    Top = 7
  end
  object GetPOSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Purchase_OrderLine.Depth,'
      '        Purchase_OrderLine.Width,'
      '        Purchase_OrderLine.Customers_Desc,'
      
        '        Purchase_OrderLine.No_Of_Plates, Enquiry.Customer, Enqui' +
        'ry.Branch_No,'
      '        Purchase_OrderLine.Enquiry, Purchase_OrderLine.Line,'
      '        Operator.Name as Contact_Name,'
      '       '#9'Rep.Name as Rep_Name,'
      '       '#9'Rep.Rep_Suffix_or_Prefix,'
      '         Customer_Contact.Name as Customer_Contact,'
      '         Customer_Contact.Salutation,'
      '         Purchase_OrderLine.Quantity'
      
        'FROM Enquiry, Purchase_OrderLine, Operator, rep, Customer_Contac' +
        't'
      'Where (Purchase_OrderLine.Line = :Line) AND'
      '      (Purchase_OrderLine.Enquiry = :Enquiry) and'
      '      (Enquiry.Enquiry = Purchase_OrderLine.Enquiry) and'
      '      (Enquiry.Office_Contact = Operator.Operator)and'
      '      (Enquiry.rep = rep.rep) and'
      '      ('
      '      (Enquiry.Customer = Customer_Contact.Customer) and'
      '      (Enquiry.Branch_no = Customer_Contact.Branch_no) and'
      '      (Enquiry.Contact_no = Customer_Contact.Contact_no)'
      '      )')
    Left = 230
    Top = 85
    ParamData = <
      item
        Name = 'Line'
      end
      item
        Name = 'Enquiry'
      end>
  end
  object FormRefSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Form_Reference'
      'where Form_Reference = :Form_Reference')
    Left = 382
    Top = 102
    ParamData = <
      item
        Name = 'Form_Reference'
      end>
  end
  object UpdSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Proof_History'
      'Set'
      'Proof_Status = :Proof_Status,'
      'Proof_Date = :Proof_Date,'
      'Purchase_Order = :Purchase_Order,'
      'Line = :Line,'
      'Operator = :Operator'
      'Where (Proof_History = :Proof_History)')
    Left = 232
    Top = 168
    ParamData = <
      item
        Name = 'Proof_Status'
      end
      item
        Name = 'Proof_Date'
        DataType = ftDateTime
      end
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Operator'
      end
      item
        Name = 'Proof_History'
      end>
  end
  object AddSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Proof_History'
      '(Proof_History, Proof_Status, Proof_Date, Purchase_Order, Line)'
      'Select Max(Proof_History)+1, '#39'D'#39', :Date, :Order, :Line'
      'From Proof_History'
      ''
      ''
      ' '
      ' ')
    Left = 280
    Top = 168
    ParamData = <
      item
        Name = 'Date'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'Order'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Line'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object qryZero: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Proof_History'
      '(Proof_History, Proof_Status, Proof_Date, Purchase_Order, Line)'
      'Select Max(Proof_History)+1, '#39'D'#39', :Date, :Order, :Line'
      'From Proof_History')
    Left = 432
    Top = 168
    ParamData = <
      item
        Name = 'Date'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'Order'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'Line'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object GetLastSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Proof_History'
      'From Proof_History'
      'Where Proof_Date=:Date and Purchase_Order=:Order and Line=:Line'
      ' ')
    Left = 320
    Top = 168
    ParamData = <
      item
        Name = 'Date'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'Order'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Line'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object UpdPOSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Purchase_orderline'
      'set Proof_revision = :Proof_revision'
      'where Purchase_order = :Purchase_Order and'
      'Line = :Line')
    Left = 430
    Top = 214
    ParamData = <
      item
        Name = 'Proof_revision'
      end
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end>
  end
  object qryGetFSCClaim: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from FSC_Material_Claim'
      'where FSC_Material_Claim = :FSC_Material_Claim')
    Left = 430
    Top = 286
    ParamData = <
      item
        Name = 'FSC_Material_Claim'
      end>
  end
end
