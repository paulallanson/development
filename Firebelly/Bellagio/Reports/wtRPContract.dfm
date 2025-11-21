object frmWTRPContract: TfrmWTRPContract
  Left = 178
  Top = 125
  Caption = 'Contract Quote Report'
  ClientHeight = 611
  ClientWidth = 1327
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Scaled = False
  OnCreate = FormCreate
  TextHeight = 13
  object qrpDetails: TQuickRep
    Left = 16
    Top = -320
    Width = 1403
    Height = 992
    ShowingPreview = False
    BeforePrint = qrpDetailsBeforePrint
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
    Page.Orientation = poLandscape
    Page.PaperSize = A4
    Page.Continuous = False
    Page.Values = (
      100.000000000000000000
      2100.000000000000000000
      100.000000000000000000
      2970.000000000000000000
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
    PrevInitialZoom = qrZoom100
    PreviewDefaultSaveType = stPDF
    PreviewLeft = 0
    PreviewTop = 0
    object qrbPageHeader: TQRBand
      Left = 24
      Top = 47
      Width = 1356
      Height = 434
      Frame.DrawBottom = True
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        918.633333333333300000
        2870.200000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object gtQRShape3: TQRShape
        Left = 15
        Top = 160
        Width = 876
        Height = 261
        Size.Values = (
          552.979166666666700000
          31.750000000000000000
          338.666666666666700000
          1854.729166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrlblQuoteCaption: TQRLabel
        Left = 680
        Top = 10
        Width = 204
        Height = 54
        Size.Values = (
          114.300000000000000000
          1439.333333333333000000
          21.166666666666670000
          431.800000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Quotation'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -47
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 28
      end
      object QRDBText4: TQRDBText
        Left = 130
        Top = 300
        Width = 67
        Height = 21
        Size.Values = (
          44.450000000000000000
          275.166666666666700000
          635.000000000000000000
          141.816666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Developer'
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
      object QRLabel5: TQRLabel
        Left = 21
        Top = 300
        Width = 67
        Height = 21
        Size.Values = (
          44.450000000000000000
          44.450000000000000000
          635.000000000000000000
          141.816666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Developer'
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
      object QRDBText5: TQRDBText
        Left = 130
        Top = 369
        Width = 750
        Height = 21
        Size.Values = (
          44.979166666666670000
          275.166666666666700000
          780.520833333333300000
          1587.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = qryReport
        DataField = 'Contract_Description'
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
      object qriHeadLogo: TQRImage
        Left = 15
        Top = 0
        Width = 225
        Height = 150
        Size.Values = (
          317.500000000000000000
          31.750000000000000000
          0.000000000000000000
          476.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Stretch = True
      end
      object qrmAddress: TQRMemo
        Left = 130
        Top = 170
        Width = 211
        Height = 114
        Size.Values = (
          240.770833333333300000
          275.166666666666700000
          359.833333333333400000
          447.145833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
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
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object gtQRLabel6: TQRLabel
        Left = 21
        Top = 170
        Width = 66
        Height = 21
        Size.Values = (
          44.450000000000000000
          44.450000000000000000
          359.833333333333300000
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
      object gtQRLabel7: TQRLabel
        Left = 21
        Top = 369
        Width = 75
        Height = 21
        Size.Values = (
          44.450000000000000000
          44.450000000000000000
          781.050000000000000000
          158.750000000000000000)
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
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object gtQRShape5: TQRShape
        Left = 15
        Top = 323
        Width = 876
        Height = 10
        Size.Values = (
          21.166666666666670000
          31.750000000000000000
          682.625000000000000000
          1854.729166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape6: TQRShape
        Left = 620
        Top = 160
        Width = 271
        Height = 169
        Size.Values = (
          357.187500000000000000
          1312.333333333333000000
          338.666666666666700000
          574.145833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel2: TQRLabel
        Left = 629
        Top = 219
        Width = 36
        Height = 20
        Size.Values = (
          42.333333333333330000
          1331.383333333333000000
          463.550000000000000000
          76.200000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date:'
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
      object QRDBText1: TQRDBText
        Left = 788
        Top = 219
        Width = 96
        Height = 20
        Size.Values = (
          42.333333333333330000
          1667.933333333333000000
          463.550000000000000000
          203.200000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Contract_Date'
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
      object QRDBText2: TQRDBText
        Left = 783
        Top = 176
        Width = 101
        Height = 20
        Size.Values = (
          42.333333333333330000
          1657.350000000000000000
          372.533333333333300000
          213.783333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Quote_Number'
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
        Left = 719
        Top = 260
        Width = 165
        Height = 20
        Size.Values = (
          42.333333333333330000
          1521.883333333333000000
          550.333333333333300000
          349.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Account_Manager_Name'
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
        Left = 728
        Top = 297
        Width = 155
        Height = 21
        Size.Values = (
          44.450000000000000000
          1540.933333333333000000
          628.650000000000000000
          328.083333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'AM_Telephone_number'
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
      object QRLabel16: TQRLabel
        Left = 629
        Top = 297
        Width = 47
        Height = 21
        Size.Values = (
          44.450000000000000000
          1331.383333333333000000
          628.650000000000000000
          99.483333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Phone:'
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
        Left = 629
        Top = 260
        Width = 56
        Height = 20
        Size.Values = (
          42.333333333333330000
          1331.383333333333000000
          550.333333333333300000
          118.533333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Contact:'
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
        Left = 629
        Top = 176
        Width = 127
        Height = 20
        Size.Values = (
          42.333333333333330000
          1331.383333333333000000
          372.533333333333300000
          268.816666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Contract Quote No:'
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
      object gtQRShape4: TQRShape
        Left = 15
        Top = 289
        Width = 876
        Height = 5
        Size.Values = (
          10.583333333333330000
          31.750000000000000000
          611.187500000000000000
          1854.729166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape7: TQRShape
        Left = 109
        Top = 161
        Width = 11
        Height = 260
        Size.Values = (
          550.333333333333300000
          230.187500000000000000
          341.312500000000000000
          23.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsVertLine
        VertAdjust = 0
      end
      object gtQRShape8: TQRShape
        Left = 620
        Top = 245
        Width = 271
        Height = 9
        Size.Values = (
          18.520833333333340000
          1312.333333333333000000
          518.583333333333400000
          574.145833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRShape9: TQRShape
        Left = 620
        Top = 205
        Width = 271
        Height = 9
        Size.Values = (
          18.520833333333340000
          1312.333333333333000000
          433.916666666666700000
          574.145833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrlblCompanyAdd: TQRLabel
        Left = 249
        Top = 124
        Width = 421
        Height = 19
        Size.Values = (
          40.216666666666670000
          527.050000000000000000
          262.466666666666700000
          891.116666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 
          'Unit 6, Follifoot Ridge Business Park, Pannal Road, Harrogate, H' +
          'G3 1DL'
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
      object gtQRShape1: TQRShape
        Left = 15
        Top = 356
        Width = 876
        Height = 10
        Size.Values = (
          21.166666666666670000
          31.750000000000000000
          754.062500000000000000
          1854.729166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object gtQRLabel1: TQRLabel
        Left = 21
        Top = 335
        Width = 56
        Height = 21
        Size.Values = (
          44.450000000000000000
          44.450000000000000000
          709.083333333333300000
          118.533333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Location'
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
      object gtQRDBText1: TQRDBText
        Left = 130
        Top = 335
        Width = 89
        Height = 21
        Size.Values = (
          44.450000000000000000
          275.166666666666700000
          709.083333333333300000
          188.383333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Site_Location'
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
    object qrgQuote: TQRGroup
      Left = 24
      Top = 481
      Width = 1356
      Height = 3
      AfterPrint = qrgQuoteAfterPrint
      AlignToBottom = False
      BeforePrint = qrgQuoteBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        6.350000000000000000
        2870.200000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'Contract_quote'
      Master = qrpDetails
      ReprintOnNewPage = False
    end
    object qrsdContractLine: TQRSubDetail
      Left = 24
      Top = 578
      Width = 1356
      Height = 33
      AfterPrint = qrsdContractLineAfterPrint
      AlignToBottom = False
      BeforePrint = qrsdContractLineBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        69.850000000000000000
        2870.200000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpDetails
      DataSet = qryContractLine
      FooterBand = qrbTotals
      HeaderBand = qrbContractLineHeader
      PrintBefore = False
      PrintIfEmpty = True
      object gtQRShapeDrawing: TQRShape
        Left = 3
        Top = 0
        Width = 188
        Height = 33
        Size.Values = (
          69.850000000000000000
          6.350000000000000000
          0.000000000000000000
          397.933333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShapeOption5: TQRShape
        Left = 854
        Top = 0
        Width = 168
        Height = 33
        Size.Values = (
          68.791666666666670000
          1807.104166666667000000
          0.000000000000000000
          354.541666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShapeOption1: TQRShape
        Left = 189
        Top = 0
        Width = 168
        Height = 33
        Size.Values = (
          68.791666666666670000
          399.520833333333300000
          0.000000000000000000
          354.541666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShapeOption2: TQRShape
        Left = 355
        Top = 0
        Width = 168
        Height = 33
        Size.Values = (
          69.850000000000000000
          751.416666666666700000
          0.000000000000000000
          355.600000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShapeOption3: TQRShape
        Left = 521
        Top = 0
        Width = 168
        Height = 33
        Size.Values = (
          68.791666666666670000
          1103.312500000000000000
          0.000000000000000000
          354.541666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShapeOption4: TQRShape
        Left = 687
        Top = 0
        Width = 168
        Height = 33
        Size.Values = (
          68.791666666666670000
          1455.208333333333000000
          0.000000000000000000
          354.541666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrlblOption1: TQRLabel
        Left = 269
        Top = 8
        Width = 33
        Height = 20
        Size.Values = (
          42.333333333333330000
          569.383333333333300000
          16.933333333333330000
          69.850000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = #163'0.00'
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
      object qrlblOption2: TQRLabel
        Left = 440
        Top = 8
        Width = 33
        Height = 20
        Size.Values = (
          42.333333333333330000
          931.333333333333300000
          16.933333333333330000
          69.850000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = #163'0.00'
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
      object qrlblOption3: TQRLabel
        Left = 606
        Top = 8
        Width = 33
        Height = 20
        Size.Values = (
          42.333333333333330000
          1282.700000000000000000
          16.933333333333330000
          69.850000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = #163'0.00'
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
      object qrlblOption4: TQRLabel
        Left = 770
        Top = 8
        Width = 33
        Height = 20
        Size.Values = (
          42.333333333333330000
          1629.833333333333000000
          16.933333333333330000
          69.850000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = #163'0.00'
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
      object gtQRShapeOption6: TQRShape
        Left = 1020
        Top = 0
        Width = 168
        Height = 33
        Size.Values = (
          68.791666666666670000
          2159.000000000000000000
          0.000000000000000000
          354.541666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrlblOption5: TQRLabel
        Left = 940
        Top = 8
        Width = 33
        Height = 20
        Size.Values = (
          42.333333333333330000
          1989.666666666667000000
          16.933333333333330000
          69.850000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = #163'0.00'
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
      object qrlblOption6: TQRLabel
        Left = 1102
        Top = 8
        Width = 33
        Height = 20
        Size.Values = (
          42.333333333333330000
          2332.566666666667000000
          16.933333333333330000
          69.850000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = #163'0.00'
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
      object qrlblDrawingNumberMemo: TQRRichText
        Left = 8
        Top = 8
        Width = 177
        Height = 20
        Enabled = False
        Size.Values = (
          42.333333333333330000
          15.875000000000000000
          15.875000000000000000
          375.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AutoStretch = True
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        HiresExport = False
        Transparent = False
        YIncrement = 50
        Lines.Strings = (
          'qrlblDrawingNo')
      end
      object qrlblDrawingNumber: TQRLabel
        Left = 8
        Top = 8
        Width = 179
        Height = 20
        Size.Values = (
          42.333333333333330000
          15.875000000000000000
          15.875000000000000000
          378.354166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'qrlblDrawingNumber'
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
      object gtQRShapeOption7: TQRShape
        Left = 1186
        Top = 0
        Width = 168
        Height = 33
        Size.Values = (
          68.791666666666670000
          2510.895833333333000000
          0.000000000000000000
          354.541666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrlblOption7: TQRLabel
        Left = 1262
        Top = 8
        Width = 33
        Height = 20
        Size.Values = (
          42.333333333333330000
          2671.233333333333000000
          16.933333333333330000
          69.850000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = #163'0.00'
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
    object qrbContractLineHeader: TQRBand
      Left = 24
      Top = 547
      Width = 1356
      Height = 31
      AfterPrint = qrbContractLineHeaderAfterPrint
      AlignToBottom = False
      BeforePrint = qrbContractLineHeaderBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        65.616666666666670000
        2870.200000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupHeader
      object gtQRShapeHead1: TQRShape
        Left = 189
        Top = 0
        Width = 168
        Height = 33
        Size.Values = (
          69.850000000000000000
          400.050000000000000000
          0.000000000000000000
          355.600000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShapeHead0: TQRShape
        Left = 3
        Top = 0
        Width = 186
        Height = 33
        Size.Values = (
          69.850000000000000000
          6.350000000000000000
          0.000000000000000000
          393.700000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrlblOptionHead0: TQRRichText
        Left = 195
        Top = 8
        Width = 171
        Height = 20
        Enabled = False
        Size.Values = (
          42.333333333333330000
          412.750000000000000000
          15.875000000000000000
          362.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AutoStretch = True
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        HiresExport = False
        Transparent = False
        YIncrement = 50
        Lines.Strings = (
          'Option Description')
      end
      object qrlblDrawing: TQRLabel
        Left = 8
        Top = 8
        Width = 79
        Height = 20
        Size.Values = (
          42.333333333333330000
          16.933333333333330000
          16.933333333333330000
          167.216666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Drawing Ref'
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
      object qrlblOptionHead1: TQRLabel
        Left = 192
        Top = 8
        Width = 160
        Height = 20
        Size.Values = (
          42.333333333333330000
          407.458333333333300000
          15.875000000000000000
          338.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'Option 1'
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
      object gtQRShapeHead2: TQRShape
        Left = 355
        Top = 0
        Width = 168
        Height = 33
        Size.Values = (
          69.850000000000000000
          751.416666666666700000
          0.000000000000000000
          355.600000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrlblOptionHead2: TQRLabel
        Left = 359
        Top = 8
        Width = 160
        Height = 20
        Size.Values = (
          42.333333333333330000
          759.354166666666700000
          15.875000000000000000
          338.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'Option 2'
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
      object gtQRShapeHead3: TQRShape
        Left = 521
        Top = 0
        Width = 168
        Height = 33
        Size.Values = (
          69.850000000000000000
          1102.783333333333000000
          0.000000000000000000
          355.600000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrlblOptionHead3: TQRLabel
        Left = 526
        Top = 8
        Width = 160
        Height = 20
        Size.Values = (
          42.333333333333330000
          1113.895833333333000000
          15.875000000000000000
          338.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'Option 3'
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
      object gtQRShapeHead4: TQRShape
        Left = 687
        Top = 0
        Width = 168
        Height = 33
        Size.Values = (
          69.850000000000000000
          1454.150000000000000000
          0.000000000000000000
          355.600000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrlblOptionHead4: TQRLabel
        Left = 693
        Top = 8
        Width = 160
        Height = 20
        Size.Values = (
          42.333333333333330000
          1466.850000000000000000
          16.933333333333330000
          338.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'Option 4'
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
      object gtQRShapeHead5: TQRShape
        Left = 854
        Top = 0
        Width = 168
        Height = 33
        Size.Values = (
          69.850000000000000000
          1807.633333333333000000
          0.000000000000000000
          355.600000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrlblOptionHead5: TQRLabel
        Left = 859
        Top = 8
        Width = 160
        Height = 20
        Size.Values = (
          42.333333333333330000
          1817.687500000000000000
          15.875000000000000000
          338.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'Option 5'
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
      object gtQRShapeHead6: TQRShape
        Left = 1020
        Top = 0
        Width = 168
        Height = 33
        Size.Values = (
          69.850000000000000000
          2159.000000000000000000
          0.000000000000000000
          355.600000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrlblOptionHead6: TQRLabel
        Left = 1025
        Top = 8
        Width = 160
        Height = 20
        Size.Values = (
          42.333333333333330000
          2169.583333333333000000
          15.875000000000000000
          338.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'Option 6'
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
      object gtQRShapeHead7: TQRShape
        Left = 1186
        Top = 0
        Width = 168
        Height = 33
        Size.Values = (
          69.850000000000000000
          2510.366666666667000000
          0.000000000000000000
          355.600000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrlblOptionHead7: TQRLabel
        Left = 1190
        Top = 8
        Width = 160
        Height = 20
        Size.Values = (
          42.333333333333330000
          2518.833333333333000000
          15.875000000000000000
          338.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Caption = 'Option 7'
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
    object qrcbNotes: TQRChildBand
      Left = 24
      Top = 484
      Width = 1356
      Height = 63
      AlignToBottom = False
      BeforePrint = qrcbNotesBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        133.350000000000000000
        2870.200000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = qrgQuote
      PrintOrder = cboAfterParent
      object qrlNotes: TQRLabel
        Left = 15
        Top = 10
        Width = 55
        Height = 21
        Size.Values = (
          44.450000000000000000
          31.750000000000000000
          21.166666666666670000
          116.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'NOTES'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsUnderline]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrrchTextNotes: TQRRichText
        Left = 15
        Top = 33
        Width = 876
        Height = 27
        Size.Values = (
          58.208333333333330000
          31.750000000000000000
          68.791666666666670000
          1854.729166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AutoStretch = False
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        HiresExport = False
        Transparent = False
        YIncrement = 50
      end
    end
    object qrbTotals: TQRBand
      Left = 24
      Top = 611
      Width = 1356
      Height = 42
      AfterPrint = qrbTotalsAfterPrint
      AlignToBottom = False
      BeforePrint = qrbTotalsBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        88.900000000000000000
        2870.200000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object gtQRLabel4: TQRLabel
        Left = 9
        Top = 8
        Width = 49
        Height = 21
        Size.Values = (
          44.450000000000000000
          19.050000000000000000
          16.933333333333330000
          103.716666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Totals'
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
      object gtQRShapeTotal1: TQRShape
        Left = 189
        Top = 0
        Width = 168
        Height = 33
        Size.Values = (
          68.791666666666670000
          399.520833333333300000
          0.000000000000000000
          354.541666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShapeTotal2: TQRShape
        Left = 355
        Top = 0
        Width = 168
        Height = 33
        Size.Values = (
          68.791666666666670000
          751.416666666666700000
          0.000000000000000000
          354.541666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShapeTotal3: TQRShape
        Left = 521
        Top = 0
        Width = 168
        Height = 33
        Size.Values = (
          68.791666666666670000
          1103.312500000000000000
          0.000000000000000000
          354.541666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShapeTotal4: TQRShape
        Left = 687
        Top = 0
        Width = 168
        Height = 33
        Size.Values = (
          68.791666666666670000
          1455.208333333333000000
          0.000000000000000000
          354.541666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShapeTotal5: TQRShape
        Left = 854
        Top = 0
        Width = 168
        Height = 33
        Size.Values = (
          68.791666666666670000
          1807.104166666667000000
          0.000000000000000000
          354.541666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShapeTotal6: TQRShape
        Left = 1020
        Top = 0
        Width = 168
        Height = 33
        Size.Values = (
          68.791666666666670000
          2159.000000000000000000
          0.000000000000000000
          354.541666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShapeTotal7: TQRShape
        Left = 1186
        Top = 0
        Width = 168
        Height = 33
        Size.Values = (
          68.791666666666670000
          2510.895833333333000000
          0.000000000000000000
          354.541666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrlblOptionTotal1: TQRLabel
        Left = 260
        Top = 8
        Width = 42
        Height = 21
        Size.Values = (
          44.450000000000000000
          550.333333333333300000
          16.933333333333330000
          88.900000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = #163'0.00'
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
      object qrlblOptionTotal2: TQRLabel
        Left = 430
        Top = 8
        Width = 42
        Height = 21
        Size.Values = (
          44.450000000000000000
          910.166666666666700000
          16.933333333333330000
          88.900000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = #163'0.00'
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
      object qrlblOptionTotal3: TQRLabel
        Left = 596
        Top = 8
        Width = 42
        Height = 21
        Size.Values = (
          44.450000000000000000
          1261.533333333333000000
          16.933333333333330000
          88.900000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = #163'0.00'
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
      object qrlblOptionTotal4: TQRLabel
        Left = 760
        Top = 8
        Width = 42
        Height = 21
        Size.Values = (
          44.450000000000000000
          1608.666666666667000000
          16.933333333333330000
          88.900000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = #163'0.00'
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
      object qrlblOptionTotal5: TQRLabel
        Left = 930
        Top = 8
        Width = 42
        Height = 21
        Size.Values = (
          44.450000000000000000
          1968.500000000000000000
          16.933333333333330000
          88.900000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = #163'0.00'
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
      object qrlblOptionTotal6: TQRLabel
        Left = 1093
        Top = 8
        Width = 42
        Height = 21
        Size.Values = (
          44.450000000000000000
          2313.516666666667000000
          16.933333333333330000
          88.900000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = #163'0.00'
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
      object qrlblOptionTotal7: TQRLabel
        Left = 1253
        Top = 8
        Width = 42
        Height = 21
        Size.Values = (
          44.450000000000000000
          2652.183333333333000000
          16.933333333333330000
          88.900000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = #163'0.00'
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
    end
    object qrbContractLineFooter: TQRChildBand
      Left = 24
      Top = 757
      Width = 1356
      Height = 72
      AfterPrint = qrbContractLineFooterAfterPrint
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        152.400000000000000000
        2870.200000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = qrbOptionSummary
      PrintOrder = cboAfterParent
      object gtQRLabel2: TQRLabel
        Left = 14
        Top = 30
        Width = 193
        Height = 21
        Size.Values = (
          44.450000000000000000
          29.633333333333330000
          63.500000000000000000
          408.516666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = '(All prices are Excluding VAT)'
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
    object qrcbAvailability: TQRChildBand
      Left = 24
      Top = 829
      Width = 1356
      Height = 65
      AlignToBottom = False
      BeforePrint = qrcbAvailabilityBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        137.583333333333300000
        2870.200000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = qrbContractLineFooter
      PrintOrder = cboAfterParent
      object QRLabel9: TQRLabel
        Left = 15
        Top = 9
        Width = 106
        Height = 21
        Size.Values = (
          44.450000000000000000
          31.750000000000000000
          19.050000000000000000
          224.366666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'CONDITIONS:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = [fsUnderline]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrrchTextAvailability: TQRRichText
        Left = 15
        Top = 33
        Width = 861
        Height = 27
        Size.Values = (
          58.208333333333330000
          31.750000000000000000
          68.791666666666670000
          1822.979166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AutoStretch = False
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        HiresExport = False
        Transparent = False
        YIncrement = 50
      end
    end
    object qrbOptionSummary: TQRChildBand
      Left = 24
      Top = 721
      Width = 1356
      Height = 36
      AfterPrint = qrbOptionSummaryAfterPrint
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        76.200000000000000000
        2870.200000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = qrbOptionHeader
      PrintOrder = cboAfterParent
      object qrlblColourOptions: TQRLabel
        Left = 9
        Top = 8
        Width = 87
        Height = 21
        Size.Values = (
          44.450000000000000000
          19.050000000000000000
          16.933333333333330000
          184.150000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Colour Options'
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
      object qrtxtOptionColours1: TQRRichText
        Left = 198
        Top = 8
        Width = 144
        Height = 21
        Size.Values = (
          44.979166666666670000
          418.041666666666700000
          15.875000000000000000
          304.270833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AutoStretch = True
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        HiresExport = False
        Transparent = False
        YIncrement = 50
        Lines.Strings = (
          'qrtxtOptionColours'
          '1')
      end
      object qrtxtOptionColours2: TQRRichText
        Left = 368
        Top = 8
        Width = 144
        Height = 21
        Size.Values = (
          44.979166666666670000
          777.875000000000000000
          15.875000000000000000
          304.270833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AutoStretch = True
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        HiresExport = False
        Transparent = False
        YIncrement = 50
        Lines.Strings = (
          'qrtxtOptionColours'
          '2')
      end
      object qrtxtOptionColours3: TQRRichText
        Left = 537
        Top = 8
        Width = 144
        Height = 21
        Size.Values = (
          44.979166666666670000
          1137.708333333333000000
          15.875000000000000000
          304.270833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AutoStretch = True
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        HiresExport = False
        Transparent = False
        YIncrement = 50
        Lines.Strings = (
          'qrtxtOptionColours'
          '3')
      end
      object qrtxtOptionColours4: TQRRichText
        Left = 698
        Top = 8
        Width = 144
        Height = 21
        Size.Values = (
          44.979166666666670000
          1476.375000000000000000
          15.875000000000000000
          304.270833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AutoStretch = True
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        HiresExport = False
        Transparent = False
        YIncrement = 50
        Lines.Strings = (
          'qrtxtOptionColours'
          '4')
      end
      object qrtxtOptionColours5: TQRRichText
        Left = 867
        Top = 8
        Width = 144
        Height = 21
        Size.Values = (
          44.979166666666670000
          1836.208333333333000000
          15.875000000000000000
          304.270833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AutoStretch = True
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        HiresExport = False
        Transparent = False
        YIncrement = 50
        Lines.Strings = (
          'qrtxtOptionColours'
          '5')
      end
      object qrtxtOptionColours6: TQRRichText
        Left = 1038
        Top = 8
        Width = 144
        Height = 21
        Size.Values = (
          44.979166666666670000
          2196.041666666667000000
          15.875000000000000000
          304.270833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AutoStretch = True
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        HiresExport = False
        Transparent = False
        YIncrement = 50
        Lines.Strings = (
          'qrtxtOptionColours'
          '6')
      end
      object qrtxtOptionColours7: TQRRichText
        Left = 1200
        Top = 8
        Width = 144
        Height = 21
        Size.Values = (
          44.979166666666670000
          2540.000000000000000000
          15.875000000000000000
          304.270833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AutoStretch = True
        Color = clWindow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        HiresExport = False
        Transparent = False
        YIncrement = 50
        Lines.Strings = (
          'qrtxtOptionColours'
          '6')
      end
    end
    object qrbTemplateFitting: TQRChildBand
      Left = 24
      Top = 653
      Width = 1356
      Height = 42
      AfterPrint = qrbTemplateFittingAfterPrint
      AlignToBottom = False
      BeforePrint = qrbTemplateFittingBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        88.900000000000000000
        2870.200000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = qrbTotals
      PrintOrder = cboAfterParent
      object gtQRShape10: TQRShape
        Left = 3
        Top = 0
        Width = 188
        Height = 33
        Size.Values = (
          68.791666666666670000
          5.291666666666667000
          0.000000000000000000
          396.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRShapeTemplate: TQRShape
        Left = 189
        Top = 0
        Width = 168
        Height = 33
        Size.Values = (
          68.791666666666670000
          399.520833333333300000
          0.000000000000000000
          354.541666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object gtQRLabel3: TQRLabel
        Left = 9
        Top = 8
        Width = 160
        Height = 21
        Size.Values = (
          44.450000000000000000
          19.050000000000000000
          16.933333333333330000
          338.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Template, Fitting & Delivery'
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
      object qrlblTemplatePrice: TQRLabel
        Left = 269
        Top = 8
        Width = 33
        Height = 21
        Size.Values = (
          44.450000000000000000
          569.383333333333300000
          16.933333333333330000
          69.850000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = #163'0.00'
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
    object qrbOptionHeader: TQRChildBand
      Left = 24
      Top = 695
      Width = 1356
      Height = 26
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        55.033333333333330000
        2870.200000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = qrbTemplateFitting
      PrintOrder = cboAfterParent
    end
  end
  object qryReport: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'SELECT  Contract_Quote.Contract_Quote,'
      '        Contract_Quote.Contract_Date,'
      '        Contract_Quote.Contract_Quote_Number,'
      '        Contract_Quote.Customer,'
      '        Contract_Quote.Contract_Description,'
      '        Contract_Quote.Developer,'
      '        Contract_Quote.Site_Location,'
      '        Contract_Quote.Notes,'
      '        Contract_Quote.Customer_Name,'
      '        Contract_Quote.Operator,'
      '        Operator.Operator_Name,'
      '        Contract_Quote.Account_Manager,'
      '        Account_Manager.Operator_Name as Account_Manager_Name,'
      '        Account_Manager.Telephone_Number as AM_Telephone_Number,'
      '        Contract_Quote.Contact_Name,'
      '        Contract_Quote.Address,'
      '        Contract_Quote.Revenue_Centre,'
      '        Contract_Quote.Quote_Number'
      'FROM Operator AS Account_Manager'
      '      RIGHT JOIN (Operator'
      '      INNER JOIN Contract_Quote'
      '        ON Operator.Operator = Contract_Quote.Operator)'
      
        '        ON Account_Manager.Operator = Contract_Quote.Account_Man' +
        'ager'
      'WHERE Contract_quote = :Contract_Quote')
    Left = 51
    Top = 14
    ParamData = <
      item
        Name = 'Contract_Quote'
      end>
  end
  object dtsReport: TDataSource
    DataSet = qryReport
    Left = 120
    Top = 16
  end
  object qryCompany: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select * from company'
      'where company = 1')
    Left = 350
    Top = 23
  end
  object qryCustomer: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select Customer, Customer_name,'
      'Street,'
      'Locale,'
      'Town_City,'
      'postcode,'
      'County_State,'
      'Vat_Rate,'
      'Credit_Status,'
      'Installation_Price,'
      'Survey_Price,'
      'Delivery_Price'
      'from Customer, VAT'
      'where Customer = :Customer and'
      'Customer.VAT = Vat.Vat')
    Left = 582
    Top = 22
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
      end>
  end
  object dtsAddress: TDataSource
    Left = 502
    Top = 19
  end
  object qryAddress: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'select *'
      'from Address'
      'where Address = :Address')
    Left = 654
    Top = 27
    ParamData = <
      item
        Name = 'Address'
      end>
  end
  object qrygetNotes: TFDQuery
    ConnectionName = 'wt'
    SQL.Strings = (
      'select *'
      'from Notes'
      'where notes_code = :Notes_Code'
      'order by notes_code, notes_line')
    Left = 726
    Top = 29
    ParamData = <
      item
        Name = 'Notes_Code'
      end>
  end
  object qryContractLine: TFDQuery
    MasterSource = dtsReport
    ConnectionName = 'wt'
    SQL.Strings = (
      'Select * '
      'from Contract_Quote_Line'
      'Where Contract_Quote = :Contract_Quote'
      'Order By Line_Number')
    Left = 120
    Top = 98
    ParamData = <
      item
        Name = 'Contract_Quote'
      end>
  end
  object qryContractOption: TFDQuery
    MasterSource = dtsContractLine
    ConnectionName = 'WT'
    SQL.Strings = (
      'Select *'
      'FROM Contract_Quote_Line_Option'
      'WHERE Contract_Quote = :Contract_Quote AND'
      'Line_Number = :Line_Number'
      'ORDER BY Option_Number')
    Left = 320
    Top = 98
    ParamData = <
      item
        Name = 'Contract_Quote'
      end
      item
        Name = 'Line_Number'
      end>
  end
  object dtsContractLine: TDataSource
    DataSet = qryContractLine
    Left = 200
    Top = 96
  end
  object qryOptionHeaders: TFDQuery
    MasterSource = dtsReport
    ConnectionName = 'WT'
    SQL.Strings = (
      'Select Option_Description'
      'FROM Contract_Quote_Line_Option'
      'WHERE Contract_Quote = :Contract_Quote AND'
      'Line_Number = 1'
      'ORDER BY Option_Number')
    Left = 424
    Top = 98
    ParamData = <
      item
        Name = 'Contract_Quote'
      end>
  end
  object qryOptionHeadersHeight: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'Select Option_Description'
      'FROM Contract_Quote_Line_Option'
      'WHERE Contract_Quote = :Contract_Quote AND'
      'Line_Number = 1'
      'ORDER BY Option_Number')
    Left = 528
    Top = 98
    ParamData = <
      item
        Name = 'Contract_Quote'
      end>
  end
  object qryOptionColours: TFDQuery
    MasterSource = dtsContractLine
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT  Contract_Quote.Contract_Quote,'
      '        Contract_Quote_Line_Option.Line_Number,'
      '        Contract_Quote_Line_Option.Option_Number,'
      '        Customer_Worktop.Group_Number,'
      '        Customer_Worktop.Worktop,'
      '        Worktop.Description as Worktop_Description'
      'FROM ((Contract_Quote'
      '        INNER JOIN Contract_Quote_Line'
      
        '          ON Contract_Quote.Contract_Quote = Contract_Quote_Line' +
        '.Contract_Quote)'
      '        INNER JOIN Contract_Quote_Line_Option'
      
        '          ON (Contract_Quote_Line.Line_Number = Contract_Quote_L' +
        'ine_Option.Line_Number)'
      
        '            AND (Contract_Quote_Line.Contract_Quote = Contract_Q' +
        'uote_Line_Option.Contract_Quote))'
      '        INNER JOIN (Worktop'
      '        INNER JOIN Customer_Worktop'
      '          ON Worktop.Worktop = Customer_Worktop.Worktop)'
      
        '          ON (Contract_Quote_Line_Option.Group_Number = Customer' +
        '_Worktop.Group_Number)'
      
        '            AND (Contract_Quote.Customer = Customer_Worktop.Cust' +
        'omer)'
      'WHERE Contract_Quote.Contract_Quote = :Contract_Quote AND'
      '      Contract_Quote_Line_Option.Line_Number = 1'
      
        'ORDER BY Contract_Quote_Line_Option.Option_Number, Worktop.Descr' +
        'iption'
      '')
    Left = 614
    Top = 211
    ParamData = <
      item
        Name = 'Contract_Quote'
      end>
  end
  object qryRevenueCentre: TFDQuery
    ConnectionName = 'WT'
    SQL.Strings = (
      'SELECT *'
      'FROM Revenue_Centre'
      'WHERE Revenue_Centre = :Revenue_Centre')
    Left = 840
    Top = 88
    ParamData = <
      item
        Name = 'Revenue_Centre'
      end>
  end
end
