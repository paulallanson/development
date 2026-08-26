object frmPBRPNonConform: TfrmPBRPNonConform
  Left = 263
  Top = 9
  Caption = 'Job Bag Print'
  ClientHeight = 818
  ClientWidth = 1159
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Scaled = False
  TextHeight = 13
  object qrpDetails: TQuickRep
    Left = 32
    Top = 32
    Width = 992
    Height = 1403
    Frame.DrawTop = True
    Frame.DrawBottom = True
    Frame.DrawLeft = True
    Frame.DrawRight = True
    Frame.Width = 3
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
    object qrbPageHeader: TQRBand
      Left = 47
      Top = 47
      Width = 898
      Height = 254
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Frame.Width = 2
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        537.633333333333300000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object qrlblQuoteCaption: TQRLabel
        Left = 10
        Top = 16
        Width = 325
        Height = 45
        Size.Values = (
          95.250000000000000000
          21.166666666666670000
          33.866666666666670000
          687.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Non Conformance'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -37
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 22
      end
      object QRLabel2: TQRLabel
        Left = 648
        Top = 164
        Width = 87
        Height = 19
        Size.Values = (
          40.216666666666670000
          1371.600000000000000000
          347.133333333333300000
          184.150000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Date Required:'
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
      object qrlblDateRequiredData: TQRDBText
        Left = 744
        Top = 164
        Width = 97
        Height = 19
        Size.Values = (
          40.216666666666670000
          1574.800000000000000000
          347.133333333333300000
          205.316666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Goods_Required'
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
      object QRDBText2: TQRDBText
        Left = 19
        Top = 76
        Width = 188
        Height = 21
        Size.Values = (
          44.450000000000000000
          40.216666666666670000
          160.866666666666700000
          397.933333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Job_Bag_Non_Conform'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
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
      object qrlblDescriptionData: TQRDBText
        Left = 90
        Top = 191
        Width = 501
        Height = 19
        Size.Values = (
          39.687500000000000000
          190.500000000000000000
          404.812500000000000000
          1060.979166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = qryReport
        DataField = 'Job_bag_Descr'
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
      object qrlblTitle: TQRLabel
        Left = 10
        Top = 191
        Width = 53
        Height = 19
        Size.Values = (
          40.216666666666670000
          21.166666666666670000
          404.283333333333300000
          112.183333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Job Title:'
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
      object gtQRLabel1: TQRLabel
        Left = 10
        Top = 216
        Width = 54
        Height = 19
        Size.Values = (
          40.216666666666670000
          21.166666666666670000
          457.200000000000000000
          114.300000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Quantity:'
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
      object gtQRDBText2: TQRDBText
        Left = 90
        Top = 216
        Width = 50
        Height = 19
        Size.Values = (
          40.216666666666670000
          190.500000000000000000
          457.200000000000000000
          105.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Quantity'
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
      object gtQRLabel13: TQRLabel
        Left = 331
        Top = 138
        Width = 64
        Height = 19
        Size.Values = (
          40.216666666666670000
          700.616666666666700000
          292.100000000000000000
          135.466666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Start Date:'
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
      object gtQRDBText8: TQRDBText
        Left = 404
        Top = 138
        Width = 63
        Height = 19
        Size.Values = (
          40.216666666666670000
          855.133333333333300000
          292.100000000000000000
          133.350000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Date_Start'
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
      object QRLabel4: TQRLabel
        Left = 10
        Top = 164
        Width = 61
        Height = 19
        Size.Values = (
          40.216666666666670000
          21.166666666666670000
          347.133333333333300000
          129.116666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer:'
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
      object gtQRDBText1: TQRDBText
        Left = 90
        Top = 164
        Width = 501
        Height = 19
        Size.Values = (
          39.687500000000000000
          190.500000000000000000
          346.604166666666700000
          1060.979166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = qryReport
        DataField = 'Customer_Name'
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
      object qrlblJobBag: TQRLabel
        Left = 10
        Top = 138
        Width = 52
        Height = 19
        Size.Values = (
          40.216666666666670000
          21.166666666666670000
          292.100000000000000000
          110.066666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Job Bag:'
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
      object qrlblJobBagData: TQRDBText
        Left = 90
        Top = 138
        Width = 51
        Height = 19
        Size.Values = (
          40.216666666666670000
          190.500000000000000000
          292.100000000000000000
          107.950000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Job_Bag'
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
      object QRLabel3: TQRLabel
        Left = 10
        Top = 76
        Width = 69
        Height = 21
        Size.Values = (
          44.450000000000000000
          21.166666666666670000
          160.866666666666700000
          146.050000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'NCA No:'
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
      object QRLabel6: TQRLabel
        Left = 706
        Top = 191
        Width = 28
        Height = 19
        Size.Values = (
          40.216666666666670000
          1494.366666666667000000
          404.283333333333300000
          59.266666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Rep:'
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
        Left = 623
        Top = 216
        Width = 107
        Height = 19
        Size.Values = (
          40.216666666666670000
          1318.683333333333000000
          457.200000000000000000
          226.483333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Account Manager:'
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
      object gtQRDBText4: TQRDBText
        Left = 744
        Top = 191
        Width = 65
        Height = 19
        Size.Values = (
          40.216666666666670000
          1574.800000000000000000
          404.283333333333300000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Rep_Name'
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
      object gtQRDBText5: TQRDBText
        Left = 744
        Top = 216
        Width = 149
        Height = 19
        Size.Values = (
          39.687500000000000000
          1574.270833333333000000
          457.729166666666600000
          314.854166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Account_Manager'
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
      object gtQRLabel2: TQRLabel
        Left = 10
        Top = 106
        Width = 101
        Height = 21
        Size.Values = (
          44.450000000000000000
          21.166666666666670000
          224.366666666666700000
          213.783333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Date Raised:'
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
      object gtQRDBText11: TQRDBText
        Left = 120
        Top = 106
        Width = 87
        Height = 21
        Size.Values = (
          44.450000000000000000
          254.000000000000000000
          224.366666666666700000
          184.150000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Date_Point'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
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
      object ReportImage: TQRImage
        Left = 432
        Top = 10
        Width = 458
        Height = 88
        Size.Values = (
          186.266666666666700000
          914.400000000000000000
          21.166666666666670000
          969.433333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Stretch = True
      end
    end
    object QRSubDetail1: TQRSubDetail
      Left = 47
      Top = 304
      Width = 898
      Height = 70
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Frame.Width = 2
      AlignToBottom = False
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
        148.166666666666700000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qrpDetails
      FooterBand = qrgfNCA
      PrintBefore = False
      PrintIfEmpty = True
      object gtQRDBText9: TQRDBText
        Left = 410
        Top = 39
        Width = 137
        Height = 20
        Size.Values = (
          42.333333333333330000
          867.833333333333300000
          82.550000000000000000
          289.983333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Raised_by_Dept_Descr'
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
      object gtQRDBText10: TQRDBText
        Left = 746
        Top = 39
        Width = 179
        Height = 20
        Size.Values = (
          42.333333333333340000
          1579.562500000000000000
          82.020833333333340000
          378.354166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Non_Conform_Dept_Descr'
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
      object QRLabel8: TQRLabel
        Left = 670
        Top = 11
        Width = 63
        Height = 20
        Size.Values = (
          42.333333333333330000
          1418.166666666667000000
          23.283333333333330000
          133.350000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Raised by:'
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
      object gtQRDBText6: TQRDBText
        Left = 750
        Top = 11
        Width = 101
        Height = 20
        Size.Values = (
          42.333333333333330000
          1587.500000000000000000
          23.283333333333330000
          213.783333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Raised_by_name'
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
      object QRLabel9: TQRLabel
        Left = 10
        Top = 39
        Width = 49
        Height = 20
        Size.Values = (
          42.333333333333330000
          21.166666666666670000
          82.550000000000000000
          103.716666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Reason:'
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
      object gtQRDBText7: TQRDBText
        Left = 90
        Top = 39
        Width = 155
        Height = 20
        Size.Values = (
          42.333333333333330000
          190.500000000000000000
          82.550000000000000000
          328.083333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Non_Conform_Type_Descr'
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
      object QRLabel10: TQRLabel
        Left = 320
        Top = 39
        Width = 79
        Height = 20
        Size.Values = (
          42.333333333333330000
          677.333333333333300000
          82.550000000000000000
          167.216666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Raising Dept:'
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
        Left = 655
        Top = 39
        Width = 77
        Height = 20
        Size.Values = (
          42.333333333333330000
          1386.416666666667000000
          82.550000000000000000
          162.983333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Source Dept:'
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
      object QRLabel1: TQRLabel
        Left = 10
        Top = 9
        Width = 57
        Height = 20
        Size.Values = (
          42.333333333333330000
          21.166666666666670000
          19.050000000000000000
          120.650000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Category:'
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
      object gtQRDBText3: TQRDBText
        Left = 90
        Top = 9
        Width = 179
        Height = 20
        Size.Values = (
          42.333333333333330000
          190.500000000000000000
          19.050000000000000000
          378.883333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Non_Conform_Category_Descr'
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
    object qrgNCA: TQRGroup
      Left = 47
      Top = 301
      Width = 898
      Height = 3
      AlignToBottom = False
      BeforePrint = qrgNCABeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        6.350000000000000000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Expression = 'Job_Bag_Non_Conform'
      Master = qrpDetails
      ReprintOnNewPage = False
    end
    object qrgfNCA: TQRBand
      Left = 47
      Top = 374
      Width = 898
      Height = 70
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Frame.Width = 2
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        148.166666666666700000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object gtQRLabel12: TQRLabel
        Left = 10
        Top = 11
        Width = 186
        Height = 20
        Size.Values = (
          42.333333333333330000
          21.166666666666670000
          23.283333333333330000
          393.700000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Non Conformance Details:'
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
      object memoNotes: TQRMemo
        Left = 10
        Top = 34
        Width = 870
        Height = 21
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          71.437500000000000000
          1841.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
    end
    object ChildBand1: TQRChildBand
      Left = 47
      Top = 444
      Width = 898
      Height = 175
      Frame.DrawTop = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Frame.Width = 2
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        370.416666666666700000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = qrgfNCA
      PrintOrder = cboAfterParent
      object gtQRLabel3: TQRLabel
        Left = 10
        Top = 11
        Width = 126
        Height = 20
        Size.Values = (
          42.333333333333330000
          21.166666666666670000
          23.283333333333330000
          266.700000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Response Details'
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
      object memoResponse: TQRMemo
        Left = 10
        Top = 34
        Width = 870
        Height = 133
        Size.Values = (
          280.458333333333400000
          21.166666666666670000
          71.437500000000000000
          1841.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
    end
    object ChildBand2: TQRChildBand
      Left = 47
      Top = 619
      Width = 898
      Height = 175
      Frame.DrawTop = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Frame.Width = 2
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        370.416666666666700000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = ChildBand1
      PrintOrder = cboAfterParent
      object gtQRLabel4: TQRLabel
        Left = 10
        Top = 11
        Width = 129
        Height = 20
        Size.Values = (
          42.333333333333330000
          21.166666666666670000
          23.283333333333330000
          273.050000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Corrective Action:'
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
      object memoCorrective: TQRMemo
        Left = 10
        Top = 34
        Width = 870
        Height = 133
        Size.Values = (
          280.458333333333400000
          21.166666666666670000
          71.437500000000000000
          1841.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
    end
    object QRBand1: TQRBand
      Left = 47
      Top = 1023
      Width = 898
      Height = 32
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Frame.Width = 2
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        67.733333333333330000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageFooter
      object gtQRSysData1: TQRSysData
        Left = 758
        Top = 14
        Width = 125
        Height = 14
        Size.Values = (
          29.633333333333330000
          1604.433333333333000000
          29.633333333333330000
          264.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = 'Date Printed:  '
        Transparent = False
        ExportAs = exptText
        VerticalAlignment = tlTop
        FontSize = 6
      end
    end
    object ChildBand4: TQRChildBand
      Left = 47
      Top = 794
      Width = 898
      Height = 175
      Frame.DrawTop = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Frame.Width = 2
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        370.416666666666700000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = ChildBand2
      PrintOrder = cboAfterParent
      object gtQRLabel7: TQRLabel
        Left = 10
        Top = 11
        Width = 146
        Height = 20
        Size.Values = (
          42.333333333333330000
          21.166666666666670000
          23.283333333333330000
          309.033333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Preventative Details'
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
      object memoPreventative: TQRMemo
        Left = 10
        Top = 34
        Width = 870
        Height = 133
        Size.Values = (
          280.458333333333400000
          21.166666666666670000
          71.437500000000000000
          1841.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
    end
    object ChildBand3: TQRChildBand
      Left = 47
      Top = 969
      Width = 898
      Height = 54
      Frame.DrawTop = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      Frame.Width = 2
      AlignToBottom = True
      BeforePrint = ChildBand3BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        114.300000000000000000
        1900.766666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = ChildBand4
      PrintOrder = cboAfterParent
      object gtQRLabel5: TQRLabel
        Left = 10
        Top = 16
        Width = 106
        Height = 20
        Size.Values = (
          42.333333333333330000
          21.166666666666670000
          33.866666666666670000
          224.366666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cost to Company:'
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
      object gtQRShape2: TQRShape
        Left = 150
        Top = 12
        Width = 111
        Height = 29
        Size.Values = (
          60.854166666666680000
          317.500000000000000000
          26.458333333333330000
          235.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrlblCosttoCompany: TQRLabel
        Left = 225
        Top = 18
        Width = 26
        Height = 19
        Size.Values = (
          40.216666666666670000
          476.250000000000000000
          38.100000000000000000
          55.033333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '0.00'
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
      object gtQRLabel6: TQRLabel
        Left = 360
        Top = 16
        Width = 84
        Height = 20
        Size.Values = (
          42.333333333333330000
          762.000000000000000000
          33.866666666666670000
          177.800000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cost to Client:'
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
      object gtQRShape3: TQRShape
        Left = 470
        Top = 12
        Width = 111
        Height = 29
        Size.Values = (
          60.854166666666680000
          994.833333333333400000
          26.458333333333330000
          235.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object qrlblCosttoClient: TQRLabel
        Left = 545
        Top = 18
        Width = 26
        Height = 19
        Size.Values = (
          40.216666666666670000
          1153.583333333333000000
          38.100000000000000000
          55.033333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '0.00'
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
    ConnectionName = 'pb'
    SQL.Strings = (
      'SELECT'
      '      Job_Bag_Non_Conform.Job_Bag_Non_Conform,'
      '      Job_Bag_Non_Conform.Date_Point,'
      '      Job_Bag_Non_Conform.Job_Bag,'
      '      Job_Bag_Non_Conform.Operator,'
      '      Operator.Name AS Raised_By_Name,'
      #9'    Job_Bag_Non_Conform.Non_Conform_Category,'
      #9'    (select Non_Conform_Category.Non_Conform_Category_Descr'
      '        from Non_Conform_Category'
      
        '        where Non_Conform_Category.Non_Conform_Category = Job_Ba' +
        'g_Non_Conform.Non_Conform_Category) as Non_Conform_Category_Desc' +
        'r,'
      '      Job_Bag_Non_Conform.Raised_By_Dept,'
      
        '      Raised_By_Dept.Non_Conform_Dept_Descr AS Raised_by_dept_De' +
        'scr,'
      '      Job_Bag_Non_Conform.Non_Conform_Dept,'
      '      Non_Conform_Dept.Non_Conform_Dept_Descr,'
      '      Job_Bag_Non_Conform.Non_Conform_Type,'
      '      Non_Conform_Type.Non_Conform_Type_Descr,'
      '      Job_Bag_Non_Conform.QA_Operator,'
      '      QA_Operator.QA_Operator_Name,'
      '      Job_Bag_Non_Conform.QA_Sign_Off_Date,'
      '      Job_Bag_Non_Conform.Total_Cost,'
      '      Job_Bag_Non_Conform.Total_Cost_to_Client,'
      '      Job_Bag_Non_Conform.Non_Conform_Notes,'
      '      Job_Bag_Non_Conform.Response_Notes_id,'
      '      Job_Bag_Non_Conform.Response_Notes,'
      '      Job_Bag_Non_Conform.Corrective_Notes,'
      '      Job_Bag_Non_Conform.Corrective_Notes_id,'
      '      Job_Bag_Non_Conform.Preventative_Notes_id,'
      '      Job_Bag_Non_Conform.Response_Date,'
      '      Job_Bag_Non_Conform.Corrective_Date,'
      '      Job_Bag_Non_Conform.Preventative_Date,'
      '      Job_Bag.Job_Bag_Descr,'
      '      Job_Bag.Customer,'
      '      Job_Bag.Branch_No,'
      #9'    CASE when Job_Bag.Office_Contact <> 0 then'
      #9#9'    Job_Bag.Date_Start'
      #9'    ELSE'
      #9#9'    (select Purchase_Order.Date_Point'
      #9' '#9'     from Purchase_Order'
      
        '         where Purchase_order.Purchase_Order = Purchase_orderLin' +
        'e.Purchase_Order)'
      '      END as Date_Start,'
      #9'    CASE when Job_Bag.Office_Contact <> 0 then'
      #9#9'    Job_Bag.Quantity'
      #9'    ELSE'
      #9#9'    Purchase_orderline.Quantity'
      '      END as Quantity,'
      '      Job_Bag.Goods_Required,'
      #9'    CASE when Job_Bag.Customer <> 0 then'
      #9#9'    (select Customer.Name'
      #9' '#9'    from Customer'
      #9'      where Customer.Customer = Job_bag.Customer)'
      #9'    ELSE'
      #9#9'    (select Customer.Name'
      #9' '#9'    from Customer'
      #9'      where Customer.Customer = Purchase_OrderLine.Customer)'
      #9'    END AS Customer_Name,'
      #9'    CASE when Job_Bag.Customer <> 0 then'
      #9#9'    (select Customer_Branch.Account_code'
      #9' '#9'    from Customer_Branch'
      '        where Customer_Branch.Customer = Job_bag.Customer and'
      #9#9#9'    Customer_Branch.Branch_no = Job_bag.Branch_no)'
      #9'    ELSE'
      #9#9'    (select Customer_Branch.Account_code'
      #9' '#9'    from Customer_Branch'
      
        #9'      where Customer_Branch.Customer = Purchase_orderline.Custo' +
        'mer and'
      #9#9#9'    Customer_Branch.Branch_no = Purchase_orderline.Branch_no)'
      #9'    END AS Account_Code,'
      #9'    Job_Bag_Non_Conform.Non_Conform_Status,'
      #9'    Non_Conform_Status.Non_Conform_Status_Descr,'
      #9'    Purchase_OrderLine.Purchase_order,'
      #9'    Purchase_OrderLine.Customers_Desc,'
      #9'    CASE when Job_Bag.Rep <> 0 then'
      #9#9'    (select Rep.Name'
      #9' '#9'    from Rep'
      #9'      where Rep.Rep = Job_bag.Rep)'
      #9'    ELSE'
      #9#9'    (select Rep.Name'
      #9' '#9'    from Rep'
      #9'      where Rep.Rep = Purchase_orderLine.Rep)'
      #9'    END AS Rep_Name,'
      #9'    CASE when Job_Bag.Office_Contact <> 0 then'
      #9#9'    (select operator.Name'
      #9' '#9'    from Operator'
      #9'      where Operator.Operator = Job_bag.Office_Contact)'
      #9'    ELSE'
      #9#9'    (select operator.Name'
      #9' '#9'    from Purchase_Order, Operator'
      
        '        where Purchase_order.Purchase_Order = Purchase_orderLine' +
        '.Purchase_Order and'
      #9#9#9'    Operator.Operator = Purchase_Order.Office_Contact)'
      #9'    END AS Account_Manager,'
      '      Purchase_OrderLine.Goods_Required as PO_Goods_Required'
      'FROM Purchase_OrderLine'
      #9'RIGHT JOIN (QA_Operator'
      #9'RIGHT JOIN (Operator'
      #9'INNER JOIN (Non_Conform_Type'
      #9'INNER JOIN (Non_Conform_Status'
      #9'INNER JOIN (Non_Conform_Dept AS Raised_By_Dept'
      #9'RIGHT JOIN (Job_Bag'
      #9'RIGHT JOIN (Non_Conform_Dept'
      #9'INNER JOIN Job_Bag_Non_Conform'
      
        #9#9'ON Non_Conform_Dept.Non_Conform_Dept = Job_Bag_Non_Conform.Non' +
        '_Conform_Dept)'
      #9#9'ON Job_Bag.Job_Bag = Job_Bag_Non_Conform.Job_Bag)'
      
        #9#9'ON Raised_By_Dept.Non_Conform_Dept = Job_Bag_Non_Conform.Raise' +
        'd_By_Dept)'
      
        #9#9'ON Non_Conform_Status.Non_Conform_Status = Job_Bag_Non_Conform' +
        '.Non_Conform_Status)'
      
        #9#9'ON Non_Conform_Type.Non_Conform_Type = Job_Bag_Non_Conform.Non' +
        '_Conform_Type)'
      #9#9'ON Operator.Operator = Job_Bag_Non_Conform.Operator)'
      #9#9'ON QA_Operator.QA_Operator = Job_Bag_Non_Conform.QA_Operator)'
      
        #9#9'ON (Purchase_OrderLine.Line = Job_Bag_Non_Conform.Line) AND (P' +
        'urchase_OrderLine.Purchase_Order = Job_Bag_Non_Conform.Purchase_' +
        'Order)'
      'WHERE Job_Bag_Non_Conform = :Job_Bag_Non_Conform')
    Left = 371
    Top = 46
    ParamData = <
      item
        Name = 'Job_Bag_Non_Conform'
      end>
  end
  object dtsReport: TDataSource
    DataSet = qryReport
    Left = 290
    Top = 46
  end
  object GetNarrSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Narrative_Text'
      'From Narrative_Line'
      'Where (Narrative = :Narrative)'
      'Order By Narrative_Line')
    Left = 504
    Top = 133
    ParamData = <
      item
        Name = 'Narrative'
      end>
  end
  object qetOldReport: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select  Job_Bag_Non_Conform.*,'
      '        Job_Bag.Customer,'
      '        Job_Bag.Job_Bag_Descr,'
      '        Job_Bag.Date_Start,'
      '        Job_Bag.Goods_Required,'
      '        Job_Bag.Quantity,'
      '        Job_Bag.Cust_Order_no,'
      '        Customer.Name as Customer_Name,'
      '        Operator.Name as Office_Contact_Name,'
      '        Non_Conform_Type.Non_Conform_Type_Descr,'
      '        Non_Conform_Dept.Non_Conform_Dept_Descr,'
      
        '        Raised_By_Dept.Non_Conform_Dept_Descr as Raised_by_Dept_' +
        'Descr,'
      '        Rep.Name as Rep_Name,'
      '        OP.Name as Raised_by_Name'
      
        'from Job_Bag_Non_Conform, Job_Bag, Customer, Operator, Non_Confo' +
        'rm_type, Non_Conform_Dept, Non_Conform_Dept Raised_By_Dept, Oper' +
        'ator OP, Rep'
      
        'where Job_Bag_Non_Conform.Job_Bag_Non_Conform = :Job_Bag_Non_Con' +
        'form and'
      'Job_Bag_Non_Conform.Job_Bag = Job_Bag.Job_Bag and'
      'Job_Bag.Customer = Customer.Customer and'
      'Job_Bag_Non_Conform.Operator = OP.Operator and'
      
        'Job_Bag_Non_Conform.Non_Conform_type = Non_Conform_Type.Non_Conf' +
        'orm_Type and'
      
        'Job_Bag_Non_Conform.Non_Conform_Dept = Non_Conform_Dept.Non_Conf' +
        'orm_Dept and'
      
        'Job_Bag_Non_Conform.Raised_by_Dept = Raised_by_Dept.Non_Conform_' +
        'Dept and'
      'Job_Bag.Office_Contact = Operator.Operator and'
      'Job_bag.Rep = Rep.Rep')
    Left = 451
    Top = 46
    ParamData = <
      item
        Name = 'Job_Bag_Non_Conform'
      end>
  end
end
