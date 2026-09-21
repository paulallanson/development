object PBRPCreditNoteReasonFrm: TPBRPCreditNoteReasonFrm
  Left = 128
  Top = 129
  Caption = 'Credit Note Reason Analysis'
  ClientHeight = 421
  ClientWidth = 1136
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Scaled = False
  TextHeight = 13
  object qrReport: TQuickRep
    Left = -3
    Top = -5
    Width = 992
    Height = 1403
    ShowingPreview = False
    BeforePrint = qrReportBeforePrint
    DataSet = qryReport
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
    object qrbndGrpHdr: TQRGroup
      Left = 47
      Top = 164
      Width = 898
      Height = 25
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        52.916666666666670000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'Rep_Name'
      FooterBand = qrbndGrpFtr
      Master = qrbDetails
      ReprintOnNewPage = False
      object qrlblGroupHeader: TQRLabel
        Left = 10
        Top = 3
        Width = 34
        Height = 19
        Size.Values = (
          40.216666666666670000
          21.166666666666670000
          6.350000000000000000
          71.966666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Rep: '
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
      object QRDBText6: TQRDBText
        Left = 90
        Top = 3
        Width = 65
        Height = 19
        Size.Values = (
          40.216666666666670000
          190.500000000000000000
          6.350000000000000000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'rep_name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
    end
    object qrbndGrpFtr: TQRBand
      Left = 47
      Top = 262
      Width = 898
      Height = 48
      AfterPrint = qrbndGrpFtrAfterPrint
      AlignToBottom = False
      BeforePrint = qrbndGrpFtrBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        101.600000000000000000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRLabel20: TQRLabel
        Left = 201
        Top = 15
        Width = 64
        Height = 19
        Size.Values = (
          40.216666666666670000
          425.450000000000000000
          31.750000000000000000
          135.466666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Totals for '
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
      object qrlblRepTotalPart: TQRLabel
        Left = 561
        Top = 15
        Width = 100
        Height = 19
        Size.Values = (
          40.216666666666670000
          1187.450000000000000000
          31.750000000000000000
          211.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblRepTotalPart'
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
      object qrlblRepTotalFull: TQRLabel
        Left = 455
        Top = 15
        Width = 97
        Height = 19
        Size.Values = (
          40.216666666666670000
          963.083333333333300000
          31.750000000000000000
          205.316666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblRepTotalFull'
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
      object qrlblRepTotalVAT: TQRLabel
        Left = 669
        Top = 15
        Width = 101
        Height = 19
        Size.Values = (
          40.216666666666670000
          1416.050000000000000000
          31.750000000000000000
          213.783333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblRepTotalVAT'
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
      object qrbdataFooter: TQRDBText
        Left = 271
        Top = 15
        Width = 173
        Height = 19
        Size.Values = (
          39.687500000000000000
          574.145833333333400000
          31.750000000000000000
          365.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'rep_name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlblRepTotal: TQRLabel
        Left = 794
        Top = 15
        Width = 76
        Height = 19
        Size.Values = (
          40.216666666666670000
          1680.633333333333000000
          31.750000000000000000
          160.866666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblRepTotal'
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
        Left = 430
        Top = 5
        Width = 446
        Height = 10
        Size.Values = (
          21.166666666666670000
          910.166666666666700000
          10.583333333333330000
          944.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
    object QRBand2: TQRBand
      Left = 47
      Top = 310
      Width = 898
      Height = 56
      AfterPrint = QRBand2AfterPrint
      AlignToBottom = False
      BeforePrint = QRBand2BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        118.533333333333300000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRLabel21: TQRLabel
        Left = 314
        Top = 15
        Width = 95
        Height = 19
        Size.Values = (
          40.216666666666670000
          664.633333333333300000
          31.750000000000000000
          201.083333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Reports Totals:'
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
      object qrlblGrandTotalPart: TQRLabel
        Left = 549
        Top = 15
        Width = 112
        Height = 19
        Size.Values = (
          40.216666666666670000
          1162.050000000000000000
          31.750000000000000000
          237.066666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblGrandTotalPart'
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
      object qrlblGrandTotalFull: TQRLabel
        Left = 443
        Top = 15
        Width = 109
        Height = 19
        Size.Values = (
          40.216666666666670000
          937.683333333333300000
          31.750000000000000000
          230.716666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblGrandTotalFull'
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
      object qrlblGrandTotalVAT: TQRLabel
        Left = 657
        Top = 15
        Width = 113
        Height = 19
        Size.Values = (
          40.216666666666670000
          1390.650000000000000000
          31.750000000000000000
          239.183333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblGrandTotalVAT'
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
      object QRShape3: TQRShape
        Left = 430
        Top = -4
        Width = 446
        Height = 18
        Size.Values = (
          37.041666666666670000
          910.166666666666700000
          -7.937500000000000000
          944.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 3
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrlblGrandTotal: TQRLabel
        Left = 782
        Top = 15
        Width = 88
        Height = 19
        Size.Values = (
          40.216666666666670000
          1655.233333333333000000
          31.750000000000000000
          186.266666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblGrandTotal'
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
      object QRShape4: TQRShape
        Left = 430
        Top = 35
        Width = 446
        Height = 11
        Size.Values = (
          23.812500000000000000
          910.166666666666700000
          74.083333333333330000
          944.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 3
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
    object qrbDetails: TQRSubDetail
      Left = 47
      Top = 210
      Width = 898
      Height = 25
      AfterPrint = qrbDetailsAfterPrint
      AlignToBottom = False
      BeforePrint = qrbDetailsBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        52.916666666666670000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrReport
      DataSet = qryReport
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText2: TQRDBText
        Left = -3
        Top = 3
        Width = 99
        Height = 19
        Size.Values = (
          40.216666666666670000
          -6.350000000000000000
          6.350000000000000000
          209.550000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'sales_invoice_no'
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
      object QRDBText1: TQRDBText
        Left = 370
        Top = 3
        Width = 101
        Height = 19
        Size.Values = (
          39.687500000000000000
          783.166666666666700000
          5.291666666666667000
          214.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'rep_name'
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
      object qrlblFullCredit: TQRLabel
        Left = 471
        Top = 3
        Width = 80
        Height = 19
        Size.Values = (
          40.216666666666670000
          996.950000000000000000
          6.350000000000000000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblFullCredit'
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
      object qrlblPartCredit: TQRLabel
        Left = 578
        Top = 3
        Width = 83
        Height = 19
        Size.Values = (
          40.216666666666670000
          1223.433333333333000000
          6.350000000000000000
          175.683333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblPartCredit'
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
      object qrlblVATCredit: TQRLabel
        Left = 685
        Top = 3
        Width = 84
        Height = 19
        Size.Values = (
          40.216666666666670000
          1449.916666666667000000
          6.350000000000000000
          177.800000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblVATCredit'
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
      object QRDBText4: TQRDBText
        Left = 110
        Top = 3
        Width = 74
        Height = 19
        Size.Values = (
          40.216666666666670000
          232.833333333333300000
          6.350000000000000000
          156.633333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Invoice_Date'
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
      object QRDBText3: TQRDBText
        Left = 190
        Top = 3
        Width = 171
        Height = 19
        Size.Values = (
          39.687500000000000000
          402.166666666666700000
          5.291666666666667000
          362.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Customer_name'
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
    end
    object qrbReasons: TQRGroup
      Left = 47
      Top = 189
      Width = 898
      Height = 21
      AlignToBottom = False
      BeforePrint = qrbReasonsBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        44.450000000000000000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'qryReport.Credit_note_reason_Descr'
      FooterBand = qrbndReasFtr
      Master = qrbDetails
      ReprintOnNewPage = False
      object QRDBText9: TQRDBText
        Left = 30
        Top = 0
        Width = 159
        Height = 19
        Size.Values = (
          40.216666666666670000
          63.500000000000000000
          0.000000000000000000
          336.550000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'credit_Note_Reason_Descr'
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
    end
    object qrbndReasFtr: TQRBand
      Left = 47
      Top = 235
      Width = 898
      Height = 27
      AfterPrint = qrbndReasFtrAfterPrint
      AlignToBottom = False
      BeforePrint = qrbndReasFtrBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        57.150000000000000000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRDBText7: TQRDBText
        Left = 80
        Top = 5
        Width = 159
        Height = 19
        Size.Values = (
          40.216666666666670000
          169.333333333333300000
          10.583333333333330000
          336.550000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'credit_Note_Reason_Descr'
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
      object qrlblTotalFull: TQRLabel
        Left = 477
        Top = 5
        Width = 74
        Height = 19
        Size.Values = (
          40.216666666666670000
          1009.650000000000000000
          10.583333333333330000
          156.633333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblTotalFull'
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
      object qrlblTotalPart: TQRLabel
        Left = 584
        Top = 5
        Width = 77
        Height = 19
        Size.Values = (
          40.216666666666670000
          1236.133333333333000000
          10.583333333333330000
          162.983333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblTotalPart'
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
      object qrlblTotalVAT: TQRLabel
        Left = 692
        Top = 5
        Width = 78
        Height = 19
        Size.Values = (
          40.216666666666670000
          1464.733333333333000000
          10.583333333333330000
          165.100000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblTotalVAT'
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
      object qrlblTotal: TQRLabel
        Left = 817
        Top = 5
        Width = 53
        Height = 19
        Size.Values = (
          40.216666666666670000
          1729.316666666667000000
          10.583333333333330000
          112.183333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblTotal'
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
    end
    object qrbndPageHeader: TQRBand
      Left = 47
      Top = 47
      Width = 898
      Height = 94
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
        198.966666666666700000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object qrlblTitle: TQRLabel
        Left = 289
        Top = 10
        Width = 320
        Height = 29
        Size.Values = (
          61.383333333333330000
          611.716666666666700000
          21.166666666666670000
          677.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Credit Note Reason Analysis'
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
      object qrlblDateRange: TQRLabel
        Left = 383
        Top = 40
        Width = 132
        Height = 21
        Size.Values = (
          44.450000000000000000
          810.683333333333300000
          84.666666666666670000
          279.400000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Forecast Dated From: '
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
        Left = 808
        Top = 46
        Width = 84
        Height = 19
        Size.Values = (
          40.216666666666670000
          1710.266666666667000000
          97.366666666666670000
          177.800000000000000000)
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
        Text = 'Page: '
        Transparent = False
        ExportAs = exptText
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRSysData2: TQRSysData
        Left = 824
        Top = 20
        Width = 68
        Height = 21
        Size.Values = (
          44.450000000000000000
          1744.133333333333000000
          42.333333333333330000
          143.933333333333300000)
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
        Text = ''
        Transparent = False
        ExportAs = exptText
        VerticalAlignment = tlTop
        FontSize = 8
      end
    end
    object qrChildSummary: TQRChildBand
      Left = 47
      Top = 141
      Width = 898
      Height = 23
      Frame.DrawBottom = True
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        48.683333333333330000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = qrbndPageHeader
      PrintOrder = cboAfterParent
      object QRLabel1: TQRLabel
        Left = 80
        Top = 0
        Width = 45
        Height = 20
        Size.Values = (
          42.333333333333330000
          169.333333333333300000
          0.000000000000000000
          95.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Reason'
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
      object QRLabel2: TQRLabel
        Left = 490
        Top = 0
        Width = 60
        Height = 20
        Size.Values = (
          42.333333333333330000
          1037.166666666667000000
          0.000000000000000000
          127.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Full Credit'
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
      object QRLabel3: TQRLabel
        Left = 597
        Top = 0
        Width = 63
        Height = 20
        Size.Values = (
          42.333333333333330000
          1263.650000000000000000
          0.000000000000000000
          133.350000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Part Credit'
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
      object QRLabel4: TQRLabel
        Left = 700
        Top = 0
        Width = 64
        Height = 19
        Size.Values = (
          40.216666666666670000
          1481.666666666667000000
          0.000000000000000000
          135.466666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'VAT Credit'
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
      object QRLabel5: TQRLabel
        Left = 841
        Top = 0
        Width = 29
        Height = 19
        Size.Values = (
          40.216666666666670000
          1780.116666666667000000
          0.000000000000000000
          61.383333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total'
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
    end
    object qrChildDetail: TQRChildBand
      Left = 47
      Top = 366
      Width = 898
      Height = 23
      Frame.DrawBottom = True
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        48.683333333333330000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = qrbndPageHeader
      PrintOrder = cboAfterParent
      object QRLabel6: TQRLabel
        Left = 30
        Top = 0
        Width = 66
        Height = 20
        Size.Values = (
          42.333333333333330000
          63.500000000000000000
          0.000000000000000000
          139.700000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Credit Note'
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
      object QRLabel7: TQRLabel
        Left = 490
        Top = 0
        Width = 60
        Height = 20
        Size.Values = (
          42.333333333333330000
          1037.166666666667000000
          0.000000000000000000
          127.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Full Credit'
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
      object QRLabel8: TQRLabel
        Left = 597
        Top = 0
        Width = 63
        Height = 20
        Size.Values = (
          42.333333333333330000
          1263.650000000000000000
          0.000000000000000000
          133.350000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Part Credit'
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
      object QRLabel9: TQRLabel
        Left = 700
        Top = 0
        Width = 64
        Height = 19
        Size.Values = (
          40.216666666666670000
          1481.666666666667000000
          0.000000000000000000
          135.466666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'VAT Credit'
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
      object QRLabel10: TQRLabel
        Left = 841
        Top = 0
        Width = 29
        Height = 19
        Size.Values = (
          40.216666666666670000
          1780.116666666667000000
          0.000000000000000000
          61.383333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total'
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
      object QRLabel11: TQRLabel
        Left = 110
        Top = 0
        Width = 28
        Height = 20
        Size.Values = (
          42.333333333333330000
          232.833333333333300000
          0.000000000000000000
          59.266666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date'
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
      object QRLabel12: TQRLabel
        Left = 192
        Top = 0
        Width = 57
        Height = 20
        Size.Values = (
          42.333333333333330000
          406.400000000000000000
          0.000000000000000000
          120.650000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer'
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
      object QRLabel13: TQRLabel
        Left = 370
        Top = 0
        Width = 24
        Height = 20
        Size.Values = (
          42.333333333333330000
          783.166666666666700000
          0.000000000000000000
          50.800000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Rep'
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
    end
  end
  object qryReport: TFDQuery
    ConnectionName = 'PB'
    Left = 47
    Top = 8
  end
  object qryDummy: TFDQuery
    SQL.Strings = (
      'SELECT '#9'Sales_Invoice.Sales_Invoice, '
      #9'Sales_Invoice.Invoice_Date,'
      #9'Sales_Invoice.Sales_Invoice_No,'
      #9'Customer.Name as Customer_Name,'
      #9'Sales_Invoice.Rep,'
      #9'Rep.Name as Rep_Name,'
      #9'Customer_Branch.Customer,'
      #9'Customer_Branch.Branch_no,'
      #9'Customer_Branch.Name as Branch_Name,'
      #9'sales_invoice.credit_note_reason,'
      #9'credit_note_reason.credit_note_reason_descr,'
      #9'sales_invoice_line.Job_Bag,'
      #9'sales_invoice_line.Job_Bag_line,'
      #9'sales_invoice_line.Purchase_Order,'
      #9'CASE WHEN (sales_invoice_line.Purchase_Order <> NULL) THEN'
      #9#9'(Select Purchase_OrderLine.Customers_Desc'
      #9#9' From Purchase_OrderLine'
      #9#9' Where Purchase_Order = sales_invoice_line.Purchase_Order)'
      #9#9'WHEN (sales_invoice_line.Sales_Order <> NULL) THEN'
      #9#9'(Select Part.Part_Description'
      #9#9' from Sales_Order_Line, Part'
      
        #9#9' where Sales_Order_Line.Sales_Order = sales_invoice_line.Sales' +
        '_Order AND'
      
        #9#9#9#9'Sales_Order_Line.Sales_Order_line_no = Sales_invoice_line.Sa' +
        'les_Order_line_no AND'
      #9#9#9#9'Part.Part = Sales_Order_line.Part)'
      #9#9'ELSE'
      #9#9'(Select Job_Bag_Line_Dets.Job_Bag_Line_Descr'
      #9#9' from Job_Bag_Line_Dets'
      
        #9#9' where Job_Bag_Line_Dets.Job_Bag = sales_invoice_line.Job_Bag ' +
        'AND'
      
        #9#9#9#9'Job_Bag_Line_Dets.Job_Bag_Line = Sales_invoice_line.Job_Bag_' +
        'Line)'
      #9'END as Job_Description,'
      #9'CASE WHEN (sales_invoice_line.Purchase_Order <> NULL) THEN'
      #9#9'(Select Operator.Name'
      #9#9' From Purchase_Order, Operator'
      #9#9' Where Purchase_Order = sales_invoice_line.Purchase_Order AND'
      #9#9#9#9'Purchase_Order.Office_Contact = Operator.Operator)'
      #9#9'WHEN (sales_invoice_line.Sales_Order <> NULL) THEN'
      #9#9'(Select Operator.Name'
      #9#9' From Sales_Order, Operator'
      #9#9' Where Sales_Order = sales_invoice_line.Sales_Order AND'
      #9#9#9#9'Sales_Order.Office_Contact = Operator.Operator)'
      #9#9'ELSE'
      #9#9'(Select Operator.Name'
      #9#9' From Job_Bag, Operator'
      #9#9' Where Job_Bag.Job_Bag = sales_invoice_line.Job_Bag AND'
      #9#9#9#9'Job_Bag.Office_Contact = Operator.Operator)'
      #9'END as Office_Contact_Name,'
      #9'(Select Supplier.Name'
      #9#9' From Purchase_Order, Supplier'
      
        #9#9' Where Purchase_Order.Purchase_Order = sales_invoice_line.Purc' +
        'hase_Order AND'
      
        #9#9#9#9'Purchase_Order.Supplier = Supplier.Supplier) as Supplier_Nam' +
        'e,'
      #9'sales_invoice_line.credit_type,'
      #9'sales_invoice_line.Qty_invoiced,'
      #9'sales_invoice_line.goods_value,'
      #9'sales_invoice_line.vat_value,'
      #9'Price_Unit.Price_Unit_Factor,'
      #9'Price_Unit.Description as Price_Unit_Description,'
      '  (select sum(Amount)'
      '   from Sales_Invoice_Add_Charge'
      
        '   where Sales_Invoice_Add_Charge.sales_invoice = sales_invoice.' +
        'sales_invoice) as Extra_Charges'
      'FROM  Price_Unit'
      #9'INNER JOIN (Credit_Note_Reason'
      #9'RIGHT JOIN (Customer'
      #9'INNER JOIN (Customer_Branch'
      #9'INNER JOIN ((Sales_Invoice'
      
        #9'INNER JOIN Sales_Invoice_Line ON Sales_Invoice.Sales_Invoice = ' +
        'Sales_Invoice_Line.Sales_Invoice)'
      #9'INNER JOIN Rep ON'
      #9#9'Sales_Invoice.Rep = Rep.Rep) ON'
      #9#9'(Customer_Branch.Branch_no = Sales_Invoice.Branch_no) AND'
      #9#9'(Customer_Branch.Customer = Sales_Invoice.Customer)) ON'
      #9#9'Customer.Customer = Customer_Branch.Customer) ON'
      
        #9#9'Credit_Note_Reason.Credit_Note_Reason = Sales_Invoice.Credit_N' +
        'ote_Reason) ON'
      #9#9'Price_Unit.Price_Unit = Sales_Invoice_Line.Price_Unit'
      'WHERE Sales_invoice.Invoice_or_credit = '#39'C'#39)
    Left = 165
    Top = 11
  end
end
