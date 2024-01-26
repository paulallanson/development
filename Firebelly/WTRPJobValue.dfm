object frmWTRPJobValue: TfrmWTRPJobValue
  Left = 49
  Top = 110
  Caption = 'Job Value Report'
  ClientHeight = 576
  ClientWidth = 1141
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  
  TextHeight = 13
  object qrpDetails: TQuickRep
    Left = 16
    Top = 16
    Width = 1123
    Height = 794
    ShowingPreview = False
    BeforePrint = qrpDetailsBeforePrint
    DataSet = qryJobs
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
    PrinterSettings.PrintQuality = 0
    PrinterSettings.Collate = 0
    PrinterSettings.ColorOption = 0
    PrintIfEmpty = True
    ReportTitle = 'Job Value Report'
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
      Height = 75
      Frame.DrawBottom = True
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        198.437500000000000000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object qrlblCaption: TQRLabel
        Left = 456
        Top = 8
        Width = 122
        Height = 19
        Size.Values = (
          50.270833333333330000
          1206.500000000000000000
          21.166666666666670000
          322.791666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Job Value Report'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRSysData1: TQRSysData
        Left = 971
        Top = 24
        Width = 69
        Height = 17
        Size.Values = (
          44.979166666666670000
          2569.104166666667000000
          63.500000000000000000
          182.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = 'Page: '
        Transparent = False
        ExportAs = exptText
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel3: TQRLabel
        Left = 8
        Top = 57
        Width = 18
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          150.812500000000000000
          47.625000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Job'
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
      object QRLabel4: TQRLabel
        Left = 48
        Top = 57
        Width = 23
        Height = 17
        Size.Values = (
          44.979166666666670000
          127.000000000000000000
          150.812500000000000000
          60.854166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date'
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
      object QRLabel5: TQRLabel
        Left = 112
        Top = 57
        Width = 55
        Height = 17
        Size.Values = (
          44.979166666666670000
          296.333333333333300000
          150.812500000000000000
          145.520833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Description'
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
        Left = 376
        Top = 57
        Width = 52
        Height = 17
        Size.Values = (
          44.979166666666670000
          994.833333333333300000
          150.812500000000000000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Reference'
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
      object QRLabel7: TQRLabel
        Left = 518
        Top = 57
        Width = 45
        Height = 17
        Size.Values = (
          44.979166666666670000
          1370.541666666667000000
          150.812500000000000000
          119.062500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Complete'
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
      object QRLabel8: TQRLabel
        Left = 581
        Top = 57
        Width = 28
        Height = 17
        Size.Values = (
          44.979166666666670000
          1537.229166666667000000
          150.812500000000000000
          74.083333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Install'
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
      object QRLabel9: TQRLabel
        Left = 632
        Top = 57
        Width = 36
        Height = 17
        Size.Values = (
          44.979166666666670000
          1672.166666666667000000
          150.812500000000000000
          95.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Survey'
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
      object QRLabel11: TQRLabel
        Left = 984
        Top = 57
        Width = 32
        Height = 17
        Size.Values = (
          44.979166666666670000
          2603.500000000000000000
          150.812500000000000000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Status'
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
      object QRLabel1: TQRLabel
        Left = 688
        Top = 57
        Width = 40
        Height = 17
        Size.Values = (
          44.979166666666670000
          1820.333333333333000000
          150.812500000000000000
          105.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Delivery'
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
      object QRLabel12: TQRLabel
        Left = 882
        Top = 57
        Width = 24
        Height = 17
        Size.Values = (
          44.979166666666670000
          2333.625000000000000000
          150.812500000000000000
          63.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Total'
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
      object QRLabel14: TQRLabel
        Left = 825
        Top = 57
        Width = 23
        Height = 17
        Size.Values = (
          44.979166666666670000
          2182.812500000000000000
          150.812500000000000000
          60.854166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'VAT'
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
      object qrlblDateRange: TQRLabel
        Left = 475
        Top = 32
        Width = 74
        Height = 17
        Size.Values = (
          44.979166666666670000
          1256.770833333333000000
          84.666666666666670000
          195.791666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'qrlblDateRange'
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
      object QRSysData2: TQRSysData
        Left = 984
        Top = 8
        Width = 56
        Height = 17
        Size.Values = (
          44.979166666666670000
          2603.500000000000000000
          21.166666666666670000
          148.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsDateTime
        Font.Charset = ANSI_CHARSET
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
      object QRLabel17: TQRLabel
        Left = 766
        Top = 57
        Width = 26
        Height = 17
        Size.Values = (
          44.979166666666670000
          2026.708333333333000000
          150.812500000000000000
          68.791666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'NETT'
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
      object gtQRLabel1: TQRLabel
        Left = 915
        Top = 57
        Width = 63
        Height = 17
        Size.Values = (
          44.979166666666670000
          2420.937500000000000000
          150.812500000000000000
          166.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Material Cost'
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
    end
    object qrgCustomerHead: TQRGroup
      Left = 38
      Top = 113
      Width = 1047
      Height = 32
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        84.666666666666670000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'Customer_Name'
      FooterBand = qrbCustomerFooter
      Master = qrpDetails
      ReprintOnNewPage = False
      object QRLabel2: TQRLabel
        Left = 0
        Top = 8
        Width = 47
        Height = 17
        Size.Values = (
          44.979166666666670000
          0.000000000000000000
          21.166666666666670000
          124.354166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer'
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
      object QRDBText1: TQRDBText
        Left = 56
        Top = 8
        Width = 117
        Height = 17
        Size.Values = (
          44.979166666666670000
          148.166666666666700000
          21.166666666666670000
          309.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryJobs
        DataField = 'Customer_Name_Actual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
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
      object QRLabel15: TQRLabel
        Left = 256
        Top = 8
        Width = 74
        Height = 17
        Size.Values = (
          44.979166666666670000
          677.333333333333300000
          21.166666666666670000
          195.791666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Phone Number:'
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
      object QRDBText7: TQRDBText
        Left = 336
        Top = 8
        Width = 90
        Height = 17
        Size.Values = (
          44.979166666666670000
          889.000000000000000000
          21.166666666666670000
          238.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryJobs
        DataField = 'telephone_number'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
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
    object qrsbDetails: TQRSubDetail
      Left = 38
      Top = 145
      Width = 1047
      Height = 19
      AfterPrint = qrsbDetailsAfterPrint
      AlignToBottom = False
      BeforePrint = qrsbDetailsBeforePrint
      TransparentBand = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        50.270833333333330000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpDetails
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText11: TQRDBText
        Left = 657
        Top = 0
        Width = 70
        Height = 15
        Size.Values = (
          39.687500000000000000
          1738.312500000000000000
          0.000000000000000000
          185.208333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryJobs
        DataField = 'Delivery_Price'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRDBText2: TQRDBText
        Left = 20
        Top = 1
        Width = 18
        Height = 15
        Size.Values = (
          39.687500000000000000
          52.916666666666670000
          2.645833333333333000
          47.625000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryJobs
        DataField = 'Job'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRDBText3: TQRDBText
        Left = 48
        Top = 1
        Width = 62
        Height = 15
        Size.Values = (
          39.687500000000000000
          127.000000000000000000
          2.645833333333333000
          164.041666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryJobs
        DataField = 'Date_Raised'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRDBText4: TQRDBText
        Left = 984
        Top = 1
        Width = 115
        Height = 15
        Size.Values = (
          39.687500000000000000
          2603.500000000000000000
          2.645833333333333000
          304.270833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryJobs
        DataField = 'Job_Status_Description'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRDBText5: TQRDBText
        Left = 376
        Top = 1
        Width = 145
        Height = 15
        Size.Values = (
          39.687500000000000000
          994.833333333333300000
          2.645833333333333000
          383.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryJobs
        DataField = 'Reference'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRDBText6: TQRDBText
        Left = 112
        Top = 1
        Width = 257
        Height = 15
        Size.Values = (
          39.687500000000000000
          296.333333333333400000
          2.645833333333333000
          679.979166666666800000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryJobs
        DataField = 'Description'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRDBText10: TQRDBText
        Left = 602
        Top = 0
        Width = 66
        Height = 15
        Size.Values = (
          39.687500000000000000
          1592.791666666667000000
          0.000000000000000000
          174.625000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryJobs
        DataField = 'Survey_price'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlTotal: TQRLabel
        Left = 871
        Top = 0
        Width = 36
        Height = 15
        Size.Values = (
          39.687500000000000000
          2304.520833333333000000
          0.000000000000000000
          95.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlTotal'
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
      object QRDBText8: TQRDBText
        Left = 528
        Top = 0
        Width = 81
        Height = 15
        Size.Values = (
          39.687500000000000000
          1397.000000000000000000
          0.000000000000000000
          214.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryJobs
        DataField = 'Installation_price'
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlComplete: TQRLabel
        Left = 505
        Top = 0
        Width = 57
        Height = 15
        Size.Values = (
          39.687500000000000000
          1336.145833333333000000
          0.000000000000000000
          150.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlComplete'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlVat: TQRLabel
        Left = 819
        Top = 0
        Width = 30
        Height = 15
        Size.Values = (
          39.687500000000000000
          2166.937500000000000000
          0.000000000000000000
          79.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlVat'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlNetttotal: TQRLabel
        Left = 740
        Top = 0
        Width = 52
        Height = 15
        Size.Values = (
          39.687500000000000000
          1957.916666666667000000
          0.000000000000000000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlNetttotal'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlCost: TQRLabel
        Left = 943
        Top = 0
        Width = 35
        Height = 15
        Size.Values = (
          39.687500000000000000
          2495.020833333333000000
          0.000000000000000000
          92.604166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlCost'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
    end
    object qrbCustomerFooter: TQRBand
      Left = 38
      Top = 164
      Width = 1047
      Height = 29
      AfterPrint = qrbCustomerFooterAfterPrint
      AlignToBottom = False
      BeforePrint = qrbCustomerFooterBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        76.729166666666670000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRLabel13: TQRLabel
        Left = 614
        Top = 7
        Width = 87
        Height = 17
        Size.Values = (
          44.979166666666670000
          1624.541666666667000000
          18.520833333333330000
          230.187500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer Total'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlblCustTotal: TQRLabel
        Left = 828
        Top = 7
        Width = 79
        Height = 17
        Size.Values = (
          44.979166666666670000
          2190.750000000000000000
          18.520833333333330000
          209.020833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblCustTotal'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRShape1: TQRShape
        Left = 683
        Top = -1
        Width = 295
        Height = 8
        Size.Values = (
          21.166666666666670000
          1807.104166666667000000
          -2.645833333333333000
          780.520833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrlblCustVat: TQRLabel
        Left = 781
        Top = 7
        Width = 70
        Height = 17
        Size.Values = (
          44.979166666666670000
          2066.395833333333000000
          18.520833333333330000
          185.208333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblCustVat'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlblCustNett: TQRLabel
        Left = 718
        Top = 7
        Width = 74
        Height = 17
        Size.Values = (
          44.979166666666670000
          1899.708333333333000000
          18.520833333333330000
          195.791666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblCustNett'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlblCustCost: TQRLabel
        Left = 900
        Top = 7
        Width = 78
        Height = 17
        Size.Values = (
          44.979166666666670000
          2381.250000000000000000
          18.520833333333330000
          206.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblCustCost'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
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
    object QRBand2: TQRBand
      Left = 38
      Top = 193
      Width = 1047
      Height = 32
      AfterPrint = QRBand2AfterPrint
      AlignToBottom = False
      BeforePrint = QRBand2BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        84.666666666666670000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRLabel10: TQRLabel
        Left = 633
        Top = 7
        Width = 68
        Height = 17
        Size.Values = (
          44.979166666666670000
          1674.812500000000000000
          18.520833333333330000
          179.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Report Total'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRShape2: TQRShape
        Left = 682
        Top = -1
        Width = 295
        Height = 10
        Size.Values = (
          26.458333333333330000
          1804.458333333333000000
          -2.645833333333333000
          780.520833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrlblReportTotal: TQRLabel
        Left = 817
        Top = 7
        Width = 90
        Height = 17
        Size.Values = (
          44.979166666666670000
          2161.645833333333000000
          18.520833333333330000
          238.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblReportTotal'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlblReportVat: TQRLabel
        Left = 770
        Top = 7
        Width = 81
        Height = 17
        Size.Values = (
          44.979166666666670000
          2037.291666666667000000
          18.520833333333330000
          214.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblReportVat'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlblReportNett: TQRLabel
        Left = 707
        Top = 7
        Width = 85
        Height = 17
        Size.Values = (
          44.979166666666670000
          1870.604166666667000000
          18.520833333333330000
          224.895833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblReportNett'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrlblReportCost: TQRLabel
        Left = 890
        Top = 7
        Width = 89
        Height = 17
        Size.Values = (
          44.979166666666670000
          2354.791666666667000000
          18.520833333333330000
          235.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblReportCost'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
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
  end
  object qryJobs: TFDQuery
    ConnectionName = 'Wt'
    SQL.Strings = (
      'SELECT  Job.*,'
      '        Customer.Customer_name as Customer_Name_Actual,'
      '        Customer.telephone_number,'
      '        Job_Status.Job_Status_Description,'
      '        Vat.Vat_Rate,'
      
        '        (SELECT SUM(((((Quote_Slab.Length * Quote_Slab.Depth)/10' +
        '00000) * Quote_Slab.Quantity) * Quote_Slab.Unit_Cost) + ((Quote_' +
        'Slab.Adhesive_Unit_Cost * (Quote_Slab.Adhesive_Quantity/1))))'
      '          FROM Quote_Slab'
      
        '          WHERE (Quote_Slab.Quote = Job.Quote)) as Total_Materia' +
        'ls'
      'FROM (Job_Status'
      '        INNER JOIN (Customer'
      '        INNER JOIN Job'
      '            ON Customer.Customer = Job.Customer)'
      '            ON Job_Status.Job_Status = Job.Job_Status)'
      '        LEFT JOIN Vat'
      '            ON Job.VAT = Vat.Vat'
      'WHERE ((Job.Customer = :Customer) or (0 = :Customer)) and'
      
        '      ((Job.Date_Raised >= :Date_From) and (Job.Date_Raised <= :' +
        'Date_To)) AND'
      '      ((Job.inactive = '#39'N'#39') OR (Job.inactive is NULL))'
      'ORDER BY Job.Customer_Name, Job.Date_Raised'
      ''
      '')
    Left = 208
    Top = 184
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
      end
      item
        Name = 'Customer'
        DataType = ftInteger
      end
      item
        Name = 'Date_From'
        DataType = ftDateTime
      end
      item
        Name = 'Date_To'
        DataType = ftDateTime
      end>
    object qryJobsJob: TFloatField
      FieldName = 'Job'
    end
    object qryJobsJob_Status: TIntegerField
      FieldName = 'Job_Status'
    end
    object qryJobsQuote: TIntegerField
      FieldName = 'Quote'
    end
    object qryJobsCustomer: TIntegerField
      FieldName = 'Customer'
    end
    object qryJobsContact_name: TStringField
      FieldName = 'Contact_name'
      Size = 50
    end
    object qryJobsOrder_ref_no: TStringField
      FieldName = 'Order_ref_no'
      Size = 30
    end
    object qryJobsDate_Raised: TDateTimeField
      FieldName = 'Date_Raised'
    end
    object qryJobsDate_Required: TDateTimeField
      FieldName = 'Date_Required'
    end
    object qryJobsPayment_due: TDateTimeField
      FieldName = 'Payment_due'
    end
    object qryJobsProduction_date: TDateTimeField
      FieldName = 'Production_date'
    end
    object qryJobsTemplate_date: TDateTimeField
      FieldName = 'Template_date'
    end
    object qryJobsInstallation_date: TDateTimeField
      FieldName = 'Installation_date'
    end
    object qryJobsDeposit_amount: TFloatField
      FieldName = 'Deposit_amount'
      DisplayFormat = '#,##0.00'
    end
    object qryJobsDelivery_Price: TFloatField
      FieldName = 'Delivery_Price'
      DisplayFormat = '#,##0.00'
    end
    object qryJobsInstallation_price: TFloatField
      FieldName = 'Installation_price'
      DisplayFormat = '#,##0.00'
    end
    object qryJobsSurvey_price: TFloatField
      FieldName = 'Survey_price'
      DisplayFormat = '#,##0.00'
    end
    object qryJobsOperator: TIntegerField
      FieldName = 'Operator'
    end
    object qryJobsProduction_date_Actual: TDateTimeField
      FieldName = 'Production_date_Actual'
    end
    object qryJobsTemplate_date_actual: TDateTimeField
      FieldName = 'Template_date_actual'
    end
    object qryJobsInstallation_date_actual: TDateTimeField
      FieldName = 'Installation_date_actual'
    end
    object qryJobsDescription: TStringField
      FieldName = 'Description'
      Size = 255
    end
    object qryJobsMaterial_Type: TIntegerField
      FieldName = 'Material_Type'
    end
    object qryJobsExtra_Notes: TIntegerField
      FieldName = 'Extra_Notes'
    end
    object qryJobsAvailability: TIntegerField
      FieldName = 'Availability'
    end
    object qryJobsPayment_Terms: TIntegerField
      FieldName = 'Payment_Terms'
    end
    object qryJobsReference: TStringField
      FieldName = 'Reference'
      Size = 50
    end
    object qryJobsNett_Price: TFloatField
      FieldName = 'Nett_Price'
      DisplayFormat = '#,##0.00'
    end
    object qryJobsInactive: TStringField
      FieldName = 'Inactive'
      Size = 1
    end
    object qryJobsInactive_Reason: TIntegerField
      FieldName = 'Inactive_Reason'
    end
    object qryJobsAddress: TIntegerField
      FieldName = 'Address'
    end
    object qryJobsDiscount_Rate: TFloatField
      FieldName = 'Discount_Rate'
    end
    object qryJobsDiscount_Value: TFloatField
      FieldName = 'Discount_Value'
      DisplayFormat = '#,##0.00'
    end
    object qryJobsCustomer_Name: TStringField
      FieldName = 'Customer_Name'
      Size = 50
    end
    object qryJobsInstall_Address: TIntegerField
      FieldName = 'Install_Address'
    end
    object qryJobsDeposit_Terms: TFloatField
      FieldName = 'Deposit_Terms'
    end
    object qryJobsVAT: TIntegerField
      FieldName = 'VAT'
    end
    object qryJobsQuote_Nett_Price: TFloatField
      FieldName = 'Quote_Nett_Price'
      DisplayFormat = '#,##0.00'
    end
    object qryJobsFitter: TIntegerField
      FieldName = 'Fitter'
    end
    object qryJobsInstall_Name: TStringField
      FieldName = 'Install_Name'
      Size = 30
    end
    object qryJobsInstall_Phone: TStringField
      FieldName = 'Install_Phone'
      Size = 30
    end
    object qryJobsCustomer_Name_Actual: TStringField
      FieldName = 'Customer_Name_Actual'
      Size = 50
    end
    object qryJobstelephone_number: TStringField
      FieldName = 'telephone_number'
      Size = 30
    end
    object qryJobsJob_Status_Description: TStringField
      FieldName = 'Job_Status_Description'
      Size = 50
    end
    object qryJobsVat_Rate: TFloatField
      FieldName = 'Vat_Rate'
    end
    object qryJobsMarkup_Value: TFloatField
      FieldName = 'Markup_Value'
    end
    object qryJobsTotal_Materials: TFloatField
      FieldName = 'Total_Materials'
    end
  end
end
