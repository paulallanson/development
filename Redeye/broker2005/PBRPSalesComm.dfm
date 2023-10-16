object PBRPSalesCommFrm: TPBRPSalesCommFrm
  Left = 27
  Top = 74
  Caption = 'Reps Commission report'
  ClientHeight = 573
  ClientWidth = 1113
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Scaled = True
  OnCreate = FormCreate
  TextHeight = 13
  object qckrpSalesByInv: TQuickRep
    Left = 0
    Top = 8
    Width = 1123
    Height = 794
    ShowingPreview = False
    BeforePrint = qckrpSalesByInvBeforePrint
    DataSet = qrySalesComm
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
    object qrbndPageHeader: TQRBand
      Left = 38
      Top = 38
      Width = 1047
      Height = 91
      Frame.DrawBottom = True
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        240.770833333333300000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object qrlblTitle: TQRLabel
        Left = 398
        Top = 8
        Width = 250
        Height = 23
        Size.Values = (
          60.854166666666670000
          1053.041666666667000000
          21.166666666666670000
          661.458333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Sales Invoice Commission '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 14
      end
      object QRLabel2: TQRLabel
        Left = 8
        Top = 56
        Width = 70
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          148.166666666666700000
          185.208333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer &'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel3: TQRLabel
        Left = 272
        Top = 56
        Width = 40
        Height = 17
        Size.Values = (
          44.979166666666670000
          719.666666666666700000
          148.166666666666700000
          105.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Invoice'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel5: TQRLabel
        Left = 8
        Top = 72
        Width = 104
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          190.500000000000000000
          275.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Description of Job'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel8: TQRLabel
        Left = 408
        Top = 56
        Width = 71
        Height = 17
        Size.Values = (
          44.979166666666670000
          1079.500000000000000000
          148.166666666666700000
          187.854166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Goods Total'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel9: TQRLabel
        Left = 656
        Top = 56
        Width = 20
        Height = 17
        Size.Values = (
          44.979166666666670000
          1735.666666666667000000
          148.166666666666700000
          52.916666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Inv.'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel10: TQRLabel
        Left = 502
        Top = 56
        Width = 62
        Height = 17
        Size.Values = (
          44.979166666666670000
          1328.208333333333000000
          148.166666666666700000
          164.041666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cost Price'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblDateRange: TQRLabel
        Left = 444
        Top = 32
        Width = 158
        Height = 17
        Size.Values = (
          44.979166666666670000
          1174.750000000000000000
          84.666666666666670000
          418.041666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'For Payments Dated from: '
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel13: TQRLabel
        Left = 925
        Top = 8
        Width = 59
        Height = 17
        Size.Values = (
          44.979166666666670000
          2447.395833333333000000
          21.166666666666670000
          156.104166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Page No.:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRSysData1: TQRSysData
        Left = 989
        Top = 8
        Width = 46
        Height = 17
        Size.Values = (
          44.979166666666670000
          2616.729166666667000000
          21.166666666666670000
          121.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsPageNumber
        Text = ''
        Transparent = False
        ExportAs = exptText
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel14: TQRLabel
        Left = 656
        Top = 72
        Width = 28
        Height = 17
        Size.Values = (
          44.979166666666670000
          1735.666666666667000000
          190.500000000000000000
          74.083333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel15: TQRLabel
        Left = 272
        Top = 72
        Width = 46
        Height = 17
        Size.Values = (
          44.979166666666670000
          719.666666666666700000
          190.500000000000000000
          121.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Number'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel16: TQRLabel
        Left = 340
        Top = 56
        Width = 49
        Height = 17
        Size.Values = (
          44.979166666666670000
          899.583333333333300000
          148.166666666666700000
          129.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Account'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel17: TQRLabel
        Left = 340
        Top = 72
        Width = 31
        Height = 17
        Size.Values = (
          44.979166666666670000
          899.583333333333300000
          190.500000000000000000
          82.020833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Code'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object MarginQRLabel: TQRLabel
        Left = 597
        Top = 56
        Width = 31
        Height = 17
        Size.Values = (
          44.979166666666670000
          1579.562500000000000000
          148.166666666666700000
          82.020833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Profit'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object lblPayment: TQRLabel
        Left = 736
        Top = 56
        Width = 58
        Height = 33
        Size.Values = (
          87.312500000000000000
          1947.333333333330000000
          148.166666666667000000
          153.458333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Payment Date'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel6: TQRLabel
        Left = 827
        Top = 72
        Width = 73
        Height = 17
        Size.Values = (
          44.979166666666670000
          2188.104166666667000000
          190.500000000000000000
          193.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Commission'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel1: TQRLabel
        Left = 658
        Top = 56
        Width = 137
        Height = 33
        Size.Values = (
          87.312500000000000000
          1740.958333333333000000
          148.166666666666700000
          362.479166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Invoice  Credit       Job Count   Count    Count'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel7: TQRLabel
        Left = 931
        Top = 56
        Width = 87
        Height = 33
        Size.Values = (
          87.312500000000000000
          2463.270833333330000000
          148.166666666667000000
          230.187500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        Caption = 'Commission Rate'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object QRSubDetail1: TQRSubDetail
      Left = 38
      Top = 161
      Width = 1047
      Height = 35
      AfterPrint = QRSubDetail1AfterPrint
      AlignToBottom = False
      BeforePrint = QRSubDetail1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        92.604166666666670000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qckrpSalesByInv
      DataSet = qrySalesComm
      PrintBefore = False
      PrintIfEmpty = True
      object qrdbtxtCustomer: TQRDBText
        Left = 32
        Top = 0
        Width = 35
        Height = 17
        Size.Values = (
          44.979166666666670000
          84.666666666666670000
          0.000000000000000000
          92.604166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySalesComm
        DataField = 'Name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
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
      object qrdbtxtCustsDesc: TQRDBText
        Left = 32
        Top = 16
        Width = 95
        Height = 17
        Size.Values = (
          44.979166666666670000
          84.666666666666670000
          42.333333333333330000
          251.354166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySalesComm
        DataField = 'Invoice_Description'
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
      object qrdbtxtAccCode: TQRDBText
        Left = 340
        Top = 0
        Width = 73
        Height = 17
        Size.Values = (
          44.979166666666670000
          899.583333333333300000
          0.000000000000000000
          193.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySalesComm
        DataField = 'Account_Code'
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
      object qrdbtxtInvDate: TQRDBText
        Left = 656
        Top = 0
        Width = 63
        Height = 17
        Size.Values = (
          44.979166666666670000
          1735.666666666667000000
          0.000000000000000000
          166.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySalesComm
        DataField = 'Invoice_Date'
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
      object TotCstQRLbl: TQRLabel
        Left = 508
        Top = 0
        Width = 58
        Height = 17
        Size.Values = (
          44.979166666666700000
          1344.083333333330000000
          0.000000000000000000
          153.458333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'TotCstQRLbl'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object MargQRLbl: TQRLabel
        Left = 565
        Top = 0
        Width = 65
        Height = 17
        Size.Values = (
          44.979166666666700000
          1494.895833333330000000
          0.000000000000000000
          171.979166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'MargQRLbl'
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
      object QRDBText2: TQRDBText
        Left = 258
        Top = 0
        Width = 52
        Height = 17
        Size.Values = (
          44.979166666666670000
          682.625000000000000000
          0.000000000000000000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySalesComm
        DataField = 'InvoiceRef'
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
      object lblPaidDate: TQRDBText
        Left = 736
        Top = 0
        Width = 49
        Height = 17
        Size.Values = (
          44.979166666666670000
          1947.333333333333000000
          0.000000000000000000
          129.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qrySalesComm
        DataField = 'Paid_Date'
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
      object Commissionlbl: TQRLabel
        Left = 819
        Top = 0
        Width = 85
        Height = 17
        Size.Values = (
          44.979166666666670000
          2166.937500000000000000
          0.000000000000000000
          224.895833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Commissionlbl'
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
      object TotGoodsQRLbl: TQRLabel
        Left = 391
        Top = 0
        Width = 87
        Height = 17
        Size.Values = (
          44.979166666666670000
          1034.520833333333000000
          0.000000000000000000
          230.187500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotGoodsQRLbl'
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
      object qrlblCommSplit: TQRLabel
        Left = 938
        Top = 16
        Width = 70
        Height = 17
        Enabled = False
        Size.Values = (
          44.979166666666670000
          2481.791666666667000000
          42.333333333333330000
          185.208333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblCommSplit'
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
      object qrlblInvoiceNo: TQRLabel
        Left = 256
        Top = 16
        Width = 80
        Height = 17
        Enabled = False
        Size.Values = (
          44.979166666666670000
          677.333333333333300000
          42.333333333333330000
          211.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblInvoiceNo'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrlblJobNumber: TQRLabel
        Left = 950
        Top = 0
        Width = 58
        Height = 17
        Size.Values = (
          44.979166666666670000
          2513.541666666667000000
          0.000000000000000000
          153.458333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Job Number'
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
    object QRBand1: TQRBand
      Left = 38
      Top = 196
      Width = 1047
      Height = 5
      AfterPrint = QRBand1AfterPrint
      AlignToBottom = False
      BeforePrint = QRBand1BeforePrint
      Enabled = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        13.229166666666670000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
    end
    object RepQRGroup: TQRGroup
      Left = 38
      Top = 129
      Width = 1047
      Height = 32
      AlignToBottom = False
      BeforePrint = RepQRGroupBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        84.666666666666670000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      FooterBand = QRBand1
      Master = QRSubDetail1
      ReprintOnNewPage = False
      object GrpByQRDBText: TQRDBText
        Left = 8
        Top = 8
        Width = 153
        Height = 17
        Size.Values = (
          44.979166666666700000
          21.166666666666700000
          21.166666666666700000
          404.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = qrySalesComm
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object lblCommission: TQRLabel
        Left = 192
        Top = 8
        Width = 103
        Height = 17
        Size.Values = (
          44.979166666666670000
          508.000000000000000000
          21.166666666666670000
          272.520833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Commission rate:'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object QRBand2: TQRBand
      Left = 38
      Top = 241
      Width = 1047
      Height = 40
      AfterPrint = QRBand2AfterPrint
      AlignToBottom = False
      BeforePrint = QRBand2BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRShape2: TQRShape
        Left = 336
        Top = 2
        Width = 297
        Height = 9
        Size.Values = (
          23.812500000000000000
          889.000000000000000000
          5.291666666666670000
          785.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object RepTotQRLabel: TQRLabel
        Left = 344
        Top = 16
        Width = 35
        Height = 20
        Size.Values = (
          52.916666666666670000
          910.166666666666700000
          42.333333333333330000
          92.604166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Totals'
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
      object RepTotGoodsQRLbl: TQRLabel
        Left = 397
        Top = 16
        Width = 81
        Height = 20
        Size.Values = (
          52.916666666666670000
          1050.395833333333000000
          42.333333333333330000
          214.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalGoodsLbl'
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
      object RepTotCostQRLbl: TQRLabel
        Left = 485
        Top = 16
        Width = 81
        Height = 20
        Size.Values = (
          52.916666666666670000
          1283.229166666667000000
          42.333333333333330000
          214.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalGoodsLbl'
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
      object RepMargQRLbl: TQRLabel
        Left = 565
        Top = 16
        Width = 65
        Height = 17
        Size.Values = (
          44.979166666666700000
          1494.895833333330000000
          42.333333333333300000
          171.979166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'RepMargQRLbl'
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
      object RepTotCommLbl: TQRLabel
        Left = 809
        Top = 16
        Width = 94
        Height = 17
        Size.Values = (
          44.979166666666670000
          2140.479166666667000000
          42.333333333333330000
          248.708333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'RepTotCommLbl'
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
      object QRShape4: TQRShape
        Left = 803
        Top = 2
        Width = 105
        Height = 9
        Size.Values = (
          23.812500000000000000
          2124.604166666670000000
          5.291666666666670000
          277.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLblTotInv: TQRLabel
        Left = 656
        Top = 16
        Width = 25
        Height = 17
        Size.Values = (
          44.979166666666700000
          1735.666666666670000000
          42.333333333333300000
          66.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'QRlblNoOfInv'
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
      object QRLblTotCred: TQRLabel
        Left = 712
        Top = 16
        Width = 25
        Height = 17
        Size.Values = (
          44.979166666666700000
          1883.833333333330000000
          42.333333333333300000
          66.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'QRLblNoOfCreds'
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
      object QRLblTotJobs: TQRLabel
        Left = 760
        Top = 16
        Width = 25
        Height = 17
        Size.Values = (
          44.979166666666700000
          2010.833333333330000000
          42.333333333333300000
          66.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'QRLblNoOfJobs'
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
      object QRShape5: TQRShape
        Left = 652
        Top = 2
        Width = 137
        Height = 9
        Size.Values = (
          23.812500000000000000
          1725.083333333330000000
          5.291666666666670000
          362.479166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
    object ChildBand1: TQRChildBand
      Left = 38
      Top = 201
      Width = 1047
      Height = 40
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = QRBand1
      PrintOrder = cboAfterParent
      object QRLabel18: TQRLabel
        Left = 344
        Top = 16
        Width = 35
        Height = 20
        Size.Values = (
          52.916666666666670000
          910.166666666666700000
          42.333333333333330000
          92.604166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Totals'
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
      object TotalGoodsLbl: TQRLabel
        Left = 397
        Top = 16
        Width = 81
        Height = 20
        Size.Values = (
          52.916666666666670000
          1050.395833333333000000
          42.333333333333330000
          214.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalGoodsLbl'
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
      object TotalCostLbl: TQRLabel
        Left = 485
        Top = 16
        Width = 81
        Height = 20
        Size.Values = (
          52.916666666666670000
          1283.229166666667000000
          42.333333333333330000
          214.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalGoodsLbl'
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
      object GrpMargQRLbl: TQRLabel
        Left = 565
        Top = 16
        Width = 65
        Height = 17
        Size.Values = (
          44.979166666666700000
          1494.895833333330000000
          42.333333333333300000
          171.979166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'GrpMargQRLbl'
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
      object TotalCommLbl: TQRLabel
        Left = 820
        Top = 16
        Width = 82
        Height = 17
        Size.Values = (
          44.979166666666670000
          2169.583333333333000000
          42.333333333333330000
          216.958333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalCommLbl'
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
        Left = 336
        Top = 0
        Width = 297
        Height = 9
        Size.Values = (
          23.812500000000000000
          889.000000000000000000
          0.000000000000000000
          785.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape3: TQRShape
        Left = 803
        Top = 0
        Width = 106
        Height = 9
        Size.Values = (
          23.812500000000000000
          2124.604166666670000000
          0.000000000000000000
          280.458333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
    object QRChldBndSumm: TQRChildBand
      Left = 38
      Top = 281
      Width = 1047
      Height = 40
      AfterPrint = QRChldBndSummAfterPrint
      AlignToBottom = False
      BeforePrint = QRChldBndSummBeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        2770.187500000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = QRBand1
      PrintOrder = cboAfterParent
      object QRLblRep: TQRLabel
        Left = 8
        Top = 16
        Width = 153
        Height = 17
        Size.Values = (
          44.979166666666700000
          21.166666666666700000
          42.333333333333300000
          404.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'QRLblRep'
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
      object QRlblNoOfInv: TQRLabel
        Left = 656
        Top = 16
        Width = 25
        Height = 17
        Size.Values = (
          44.979166666666700000
          1735.666666666670000000
          42.333333333333300000
          66.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'QRlblNoOfInv'
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
      object QRLblNoOfCreds: TQRLabel
        Left = 712
        Top = 16
        Width = 25
        Height = 17
        Size.Values = (
          44.979166666666700000
          1883.833333333330000000
          42.333333333333300000
          66.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'QRLblNoOfCreds'
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
      object TotalCommLblSumm: TQRLabel
        Left = 820
        Top = 16
        Width = 82
        Height = 17
        Size.Values = (
          44.979166666666670000
          2169.583333333333000000
          42.333333333333330000
          216.958333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalCommLbl'
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
      object GrpMargQRLblSumm: TQRLabel
        Left = 565
        Top = 16
        Width = 65
        Height = 17
        Size.Values = (
          44.979166666666700000
          1494.895833333330000000
          42.333333333333300000
          171.979166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'GrpMargQRLbl'
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
      object TotalCostLblSumm: TQRLabel
        Left = 485
        Top = 16
        Width = 81
        Height = 17
        Size.Values = (
          44.979166666666670000
          1283.229166666667000000
          42.333333333333330000
          214.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalGoodsLbl'
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
      object TotalGoodsLblSumm: TQRLabel
        Left = 397
        Top = 16
        Width = 81
        Height = 17
        Size.Values = (
          44.979166666666670000
          1050.395833333333000000
          42.333333333333330000
          214.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalGoodsLbl'
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
      object QRLblNoOfJobs: TQRLabel
        Left = 760
        Top = 16
        Width = 25
        Height = 17
        Size.Values = (
          44.979166666666700000
          2010.833333333330000000
          42.333333333333300000
          66.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'QRLblNoOfJobs'
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
      object QRLabelComm: TQRLabel
        Left = 937
        Top = 16
        Width = 73
        Height = 17
        Size.Values = (
          44.979166666666700000
          2479.145833333330000000
          42.333333333333300000
          193.145833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'QRLblCat'
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
  object qrySalesComm: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT distinct'
      #9'Sales_Invoice.Customer, '
      #9'Sales_Invoice.Branch_no, '
      #9'Sales_Invoice.Sales_Invoice, '
      #9'Customer_Branch.Account_Code, '
      #9'Customer.Name, '
      #9'Rep.Name AS Rep_Name,'
      '  Rep.Rep,'
      #9'Sales_Invoice.Sales_Invoice_No, '
      #9'Sales_Invoice.Goods_Value, '
      #9'Sales_Invoice.Vat_Value, '
      
        #9'Sales_Invoice.Goods_Value+Sales_Invoice.Vat_Value AS Goods_Tota' +
        'l, '
      #9'Sales_Invoice.Invoice_Date, '
      #9'Sales_Invoice.Invoice_or_Credit, '
      #9'Sales_Invoice.Paid_Date, '
      #9'Sales_Invoice.Paid_Amount,'
      #9'Sales_Invoice.Paid_Status,'
      #9'Rep.Commission_Rate,'
      #9'Sales_Invoice.Reference, '
      #9'Sales_Invoice.Invoice_Description,'
      '                Sales_Invoice.Sales_Invoice_type,'
      '  (select Reps_Branches.Percentage'
      '   from Reps_branches'
      '   where Reps_branches.customer = sales_invoice.customer and'
      '         Reps_branches.branch_no = sales_invoice.branch_no and'
      
        '         Reps_branches.rep = sales_invoice.rep) as Rep_Responsib' +
        'ility'
      'FROM Rep'
      #9'INNER JOIN (Customer '
      #9'INNER JOIN (Customer_Branch '
      #9'INNER JOIN (Sales_Invoice '
      #9'INNER JOIN Sales_Invoice_Line ON '
      
        #9#9'Sales_Invoice.Sales_Invoice = Sales_Invoice_Line.Sales_Invoice' +
        ') ON '
      #9#9'(Customer_Branch.Branch_no = Sales_Invoice.Inv_to_Branch) AND '
      
        #9#9'(Customer_Branch.Customer = Sales_Invoice.Inv_to_Customer)) ON' +
        ' '
      #9#9'Customer.Customer = Customer_Branch.Customer) ON '
      #9#9'Rep.Rep = Sales_Invoice.Rep'
      ''
      ' '
      ' '
      ' '
      ' ')
    Left = 27
    Top = 8
    object qrySalesCommCustomer: TIntegerField
      FieldName = 'Customer'
    end
    object qrySalesCommBranch_no: TIntegerField
      FieldName = 'Branch_no'
    end
    object qrySalesCommSales_Invoice: TIntegerField
      FieldName = 'Sales_Invoice'
    end
    object qrySalesCommAccount_Code: TStringField
      FieldName = 'Account_Code'
      FixedChar = True
    end
    object qrySalesCommName: TStringField
      FieldName = 'Name'
      FixedChar = True
      Size = 80
    end
    object qrySalesCommRep_Name: TStringField
      FieldName = 'Rep_Name'
      FixedChar = True
      Size = 80
    end
    object qrySalesCommSales_Invoice_No: TStringField
      FieldName = 'Sales_Invoice_No'
      FixedChar = True
      Size = 30
    end
    object qrySalesCommGoods_Value: TCurrencyField
      FieldName = 'Goods_Value'
    end
    object qrySalesCommVat_Value: TCurrencyField
      FieldName = 'Vat_Value'
    end
    object qrySalesCommGoods_Total: TCurrencyField
      FieldName = 'Goods_Total'
    end
    object qrySalesCommInvoice_Date: TDateTimeField
      FieldName = 'Invoice_Date'
    end
    object qrySalesCommInvoice_or_Credit: TStringField
      FieldName = 'Invoice_or_Credit'
      FixedChar = True
      Size = 2
    end
    object qrySalesCommPaid_Date: TDateTimeField
      FieldName = 'Paid_Date'
    end
    object qrySalesCommPaid_Amount: TCurrencyField
      FieldName = 'Paid_Amount'
    end
    object qrySalesCommPaid_Status: TStringField
      FieldName = 'Paid_Status'
      FixedChar = True
      Size = 2
    end
    object qrySalesCommCommission_Rate: TFloatField
      FieldName = 'Commission_Rate'
    end
    object qrySalesCommReference: TStringField
      FieldName = 'Reference'
      FixedChar = True
      Size = 120
    end
    object qrySalesCommInvoice_Description: TStringField
      FieldName = 'Invoice_Description'
      FixedChar = True
      Size = 160
    end
    object qrySalesCommInvoiceRef: TStringField
      FieldKind = fkCalculated
      FieldName = 'InvoiceRef'
      OnGetText = qrySalesCommInvoiceRefGetText
      Calculated = True
    end
    object qrySalesCommSales_Invoice_type: TStringField
      FieldName = 'Sales_Invoice_type'
      FixedChar = True
      Size = 2
    end
    object qrySalesCommRep: TIntegerField
      FieldName = 'Rep'
    end
    object qrySalesCommRep_Responsibility: TFloatField
      FieldName = 'Rep_Responsibility'
    end
  end
  object AddCostsQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select sum(Amount) as Add_Cost'
      'from Purch_Ord_line_add_chg'
      '  where (Purch_Ord_Line_Add_Chg.Purchase_Order = :PurchOrder) '
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 88
    Top = 14
    ParamData = <
      item
        Name = 'PurchOrder'
        DataType = ftFloat
      end>
  end
  object GetCostsQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'SELECT Sales_Invoice_Line.Qty_Invoiced, Purchase_OrderLine.Order' +
        '_Price,'
      
        '      Purchase_OrderLine.Quantity, Price_Unit.Price_Unit_Factor ' +
        'as Order_Unit_Factor'
      
        'FROM Price_Unit INNER JOIN (Purchase_OrderLine INNER JOIN (Sales' +
        '_Invoice'
      '  INNER JOIN Sales_Invoice_Line'
      
        '    ON Sales_Invoice.Sales_Invoice = Sales_Invoice_Line.Sales_In' +
        'voice)'
      
        '    ON (Purchase_OrderLine.Line = Sales_Invoice_Line.Line) AND (' +
        'Purchase_OrderLine.Purchase_Order = Sales_Invoice_Line.Purchase_' +
        'Order))'
      '    ON (Price_Unit.Price_Unit = Purchase_OrderLine.Order_Unit)'
      '  WHERE (((Sales_Invoice.Sales_Invoice)=:Invoice_No));'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 184
    Top = 40
    ParamData = <
      item
        Name = 'invoice_no'
      end>
  end
  object qryGetPOCosts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select'
      'Purch_Ord.Purch_Ord, '
      
        'sum((Sales_Invoice_Line.Qty_Invoiced/Purch_ord_Line.Purch_Pack_Q' +
        'uantity)*Purchase_Price) as Total_Cost'
      'from Sales_invoice_line, Sales_order, Purch_Ord, Purch_Ord_Line'
      'where'
      '(Sales_Invoice_Line.Sales_invoice = :Sales_Invoice) and '
      '(Sales_Invoice_Line.Sales_order = Sales_Order.Sales_order) and'
      '(Sales_Order.Sales_Order = Purch_Ord.Sales_order) and'
      '('
      '(Purch_ord_Line.Purch_ord = Purch_Ord.Purch_ord) and'
      
        '(Purch_ord_Line.Purch_ord_Line_no = Sales_Invoice_Line.Sales_ord' +
        'er_Line_no)'
      ')'
      'Group By'
      'Purch_Ord.Purch_Ord')
    Left = 352
    Top = 120
    ParamData = <
      item
        Name = 'Sales_Invoice'
      end>
  end
  object qryGetSOCosts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'select sum(Part_Cost*((Sales_invoice_line.Qty_Invoiced*1.0000)/(' +
        'Purch_Pack_Quantity*1.0000))) as Total_Cost'
      'from Sales_Order_Line, Sales_invoice_line'
      'where Sales_invoice_line.Sales_Order = :Sales_Order and'
      'Sales_invoice_line.Sales_invoice = :Sales_invoice and'
      '('
      
        '(Sales_invoice_line.Sales_order = Sales_order_line.sales_order) ' +
        'and'
      
        '(Sales_invoice_line.Sales_order_line_no = Sales_order_line.Sales' +
        '_order_line_no)'
      ')'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 320
    Top = 200
    ParamData = <
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Sales_invoice'
      end>
  end
  object qryAddPOCosts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select sum(Amount) as Total_Cost'
      'from Purch_Ord_add_charge'
      '  where (Purch_Ord_Add_Charge.Purch_Ord = :Purch_Ord) '
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 320
    Top = 54
    ParamData = <
      item
        Name = 'Purch_Ord'
      end>
  end
  object oldqryGetJBCosts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Job_Bag_Line_Dets.Job_Bag,'
      #9'sum(Job_Bag_Line_Dets.Job_Bag_Line_Cost) as Total_Cost'
      'from Job_Bag_Line_Dets, Sales_invoice_Line'
      'where'
      '(Sales_Invoice_Line.Sales_invoice = :Sales_Invoice) and'
      '('
      '(Sales_invoice_Line.Job_Bag = Job_Bag_Line_Dets.Job_Bag) and'
      
        '(Sales_invoice_Line.Job_Bag_Line = Job_Bag_Line_Dets.Job_Bag_Lin' +
        'e)'
      ')'
      'group by'
      #9'Job_Bag_Line_Dets.Job_Bag'
      ' ')
    Left = 318
    Top = 268
    ParamData = <
      item
        Name = 'Sales_Invoice'
      end>
  end
  object qryGetJBCosts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Sales_Invoice_Line.Sales_Invoice,'
      '        Sales_Invoice_Line.Invoice_Line_No,'
      '        Sales_Invoice_Line.Purchase_Order,'
      '        Sales_Invoice_Line.Line,'
      '        Sales_invoice_Line.Qty_Invoiced,'
      '        Sales_invoice_Line.Goods_Value,'
      '        Sales_Invoice_Line.Job_Bag,'
      '        Sales_Invoice_Line.Job_Bag_Line,'
      '        Job_Bag_Line_Dets.Job_Bag_Line_Cost,'
      '        Purchase_OrderLine.Order_Price,'
      '        Purchase_OrderLine.Order_Unit,'
      '        Purchase_OrderLine.Quantity,'
      '        Price_Unit.Price_Unit_Factor,'
      '        (select Sum(Amount)'
      '         from Purch_ord_line_Add_Chg'
      
        '         where Purch_Ord_Line_Add_Chg.Purchase_order = Sales_Inv' +
        'oice_Line.Purchase_Order and'
      
        '               Purch_Ord_Line_Add_Chg.Line = Sales_Invoice_Line.' +
        'Line AND'
      
        '               Purch_Ord_Line_Add_Chg.quotation_price <= 0) as E' +
        'xtra_Cost'
      'FROM Price_Unit'
      '     RIGHT JOIN (Purchase_OrderLine'
      '     RIGHT JOIN (Job_Bag_Line_Dets'
      '     INNER JOIN Sales_Invoice_Line ON'
      
        '        (Job_Bag_Line_Dets.Job_Bag_Line = Sales_Invoice_Line.Job' +
        '_Bag_Line) AND'
      
        '        (Job_Bag_Line_Dets.Job_Bag = Sales_Invoice_Line.Job_Bag)' +
        ') ON'
      '        (Purchase_OrderLine.Line = Job_Bag_Line_Dets.Line) AND'
      
        '        (Purchase_OrderLine.Purchase_Order = Job_Bag_Line_Dets.P' +
        'urchase_Order)) ON'
      '        Price_Unit.Price_Unit = Purchase_OrderLine.Order_Unit'
      'WHERE Sales_Invoice = :Sales_Invoice'
      ' '
      ' ')
    Left = 320
    Top = 312
    ParamData = <
      item
        Name = 'Sales_Invoice'
      end>
  end
  object qryGetProdCosts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select  Order_Price,'
      '        Price_unit_Factor as Order_unit_Factor,'
      '        Quantity'
      'from Purchase_OrderLine, Price_Unit'
      'where Purchase_Order = :Purchase_Order AND'
      'Line = :Line AND'
      '(Purchase_OrderLine.Order_unit = Price_unit.Price_Unit)'
      ' ')
    Left = 555
    Top = 46
    ParamData = <
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end>
  end
  object qryCreditLines: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Sales_Invoice_Line.Sales_Invoice,'
      '        Sales_Invoice_Line.Invoice_Line_No,'
      '        Sales_Invoice_Line.Qty_Invoiced,'
      '        Sales_Invoice_Line.Price_Unit,'
      '        Price_Unit.Price_Unit_Factor as Invoice_Unit_Factor,'
      '        Sales_Invoice_Line.Cost_Price,'
      '        Sales_Invoice_Line.Purchase_order,'
      '        Sales_Invoice_Line.Line,'
      '        Sales_Invoice_Line.Sales_Order,'
      '        Sales_Invoice_Line.Sales_Order_line_no,'
      '        Sales_Invoice_Line.Job_Bag,'
      '        Sales_Invoice_Line.Job_bag_Line,'
      '        Sales_Invoice_Line.Credit_Type'
      'FROM Price_Unit'
      '      INNER JOIN Sales_Invoice_Line ON'
      '        Price_Unit.Price_Unit = Sales_Invoice_Line.Price_Unit'
      'WHERE Sales_invoice_Line.Sales_invoice = :Sales_invoice'
      ' '
      ' ')
    Left = 46
    Top = 54
    ParamData = <
      item
        Name = 'Sales_invoice'
      end>
  end
  object qryGetJBCrCosts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Job_Bag_Line_Dets.Job_Bag_Line_Cost'
      'FROM Job_Bag_Line_Dets'
      'WHERE Job_Bag_Line_Dets.Job_Bag = :Job_Bag and'
      'Job_Bag_Line_Dets.Job_Bag_line = :Job_Bag_Line'
      ' ')
    Left = 556
    Top = 264
    ParamData = <
      item
        Name = 'Job_Bag'
      end
      item
        Name = 'Job_Bag_Line'
      end>
  end
  object qryGetSOCrCosts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Sales_Order_line.Sales_Order,'
      '        Sales_Order_line.Sales_Order_line_no,'
      '        Sales_Order_line.Part_Cost,'
      '        Sales_Order_line.Purch_Pack_Quantity'
      'FROM Sales_Order_line'
      'where'
      '('
      '(Sales_Order_Line.Sales_order = :Sales_Order) and'
      '(Sales_Order_line.Sales_order_Line_no = :Sales_Order_line_no)'
      ')'
      ' '
      ' '
      ' '
      ' ')
    Left = 552
    Top = 208
    ParamData = <
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Sales_Order_line_no'
      end>
  end
  object qryGetPOCrCosts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select'
      '  Purch_Ord.Purch_Ord,'
      '  Purch_Ord.Purch_ord_no,'
      '  Purch_ord_Line.Purch_Pack_Quantity,'
      '  Purch_ord_Line.Purchase_Price'
      'from Sales_order_Line, Purch_Ord, Purch_Ord_Line'
      'where'
      '('
      '(Sales_Order_Line.Sales_order = :Sales_Order) and'
      '(Sales_Order_line.Sales_order_Line_no = :Sales_Order_line_no)'
      ') and'
      '(Sales_Order_Line.Sales_Order = Purch_Ord.Sales_order) and'
      '('
      '(Purch_ord_Line.Purch_ord = Purch_Ord.Purch_ord) and'
      
        '(Purch_ord_Line.Purch_ord_Line_no = Sales_order_line.Sales_order' +
        '_Line_no)'
      ')'
      ''
      ' '
      ' '
      ' '
      ' ')
    Left = 552
    Top = 152
    ParamData = <
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Sales_Order_line_no'
      end>
  end
  object qryGetNoOfJobs: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT count(Job_Bag.Job_Bag) as no_jobs'
      'FROM Job_Bag'
      'where (Job_Bag.date_point >= :Date_from) and'
      '(Job_Bag.date_point <= :Date_To) and'
      '(Job_Bag.Rep = :Rep)'
      ' '
      ' '
      ' ')
    Left = 466
    Top = 38
    ParamData = <
      item
        Name = 'Date_from'
      end
      item
        Name = 'Date_To'
      end
      item
        Name = 'Rep'
      end>
  end
  object qryRepFinance: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * '
      'from Rep_Financial'
      'where Rep = :Rep and'
      'Financial_Year = :Financial_Year')
    Left = 190
    Top = 97
    ParamData = <
      item
        Name = 'Rep'
      end
      item
        Name = 'Financial_Year'
      end>
  end
  object qryGetPOSICharges: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT sum(Purch_Ord_Line_Add_Chg.Amount) as Total_Cost'
      'FROM (Sales_Invoice_Line '
      #9'INNER JOIN Sales_Invoice_Add_charge '
      
        #9#9'ON (Sales_Invoice_Line.Invoice_Line_No = Sales_Invoice_Add_cha' +
        'rge.Invoice_line_no) AND (Sales_Invoice_Line.Sales_Invoice = Sal' +
        'es_Invoice_Add_charge.Sales_Invoice)) '
      #9'INNER JOIN Purch_Ord_Line_Add_Chg'
      
        '    ON (Sales_Invoice_Add_charge.poAddChrg = Purch_Ord_Line_Add_' +
        'Chg.Additional_Charge) AND (Sales_Invoice_Line.Line = Purch_Ord_' +
        'Line_Add_Chg.Line)'
      
        '      AND (Sales_Invoice_Line.Purchase_Order = Purch_Ord_Line_Ad' +
        'd_Chg.Purchase_Order)'
      
        'where Sales_Invoice_Add_charge.Invoice_line_no = :Invoice_line_n' +
        'o and'
      'Sales_Invoice_Add_charge.Sales_invoice = :Sales_invoice and'
      '('
      '(Sales_Invoice_Line.Purchase_order = :Purchase_order) and'
      '(Sales_invoice_Line.Line = 1)'
      ') and'
      '(Purch_Ord_Line_Add_Chg.quotation_price > 0)')
    Left = 773
    Top = 32
    ParamData = <
      item
        Name = 'Invoice_line_no'
      end
      item
        Name = 'Sales_invoice'
      end
      item
        Name = 'Purchase_order'
      end>
  end
  object qryGetMainPO: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT'
      '      Purchase_OrderLine.Purchase_order,'
      '      Purchase_OrderLine.Original_order,'
      '      Purchase_orderline.Order_price as Call_Off_Cost,'
      '      Purchase_orderline.Quantity as Call_Off_Quantity,'
      '      Purchase_orderline.Order_Unit as Call_Off_Order_Unit,'
      '      Price_Unit.Price_Unit_Factor as Call_Off_Unit_Factor,'
      '      POL.No_of_Calloffs,'
      '      POL.Selling_Price,'
      '      POL.Order_Price as Stock_Order_Cost,'
      '      POL.Quantity,'
      '      POL.Sell_Unit,'
      '      POL.Order_Unit,'
      '      PU.Price_Unit_Factor as Stock_Order_Unit_Factor,'
      '      (SELECT SUM(Qty_Invoiced)'
      '       FROM Purchase_Orderline POL_CallOff'
      
        '       WHERE POL_CallOff.Purchase_order > POL.Purchase_order AND' +
        ' POL_CallOff.Purchase_order <= Purchase_OrderLine.Purchase_order' +
        ') as Total_Call_off_Quantity,'
      '      (SELECT sum(Amount)'
      '       FROM Purch_Ord_line_add_chg'
      
        '       WHERE Purch_Ord_Line_Add_Chg.Purchase_Order = POL.Purchas' +
        'e_order) as Total_Stock_Order_Charges,'
      '      (SELECT sum(Amount)'
      '       FROM Purch_Ord_line_add_chg'
      
        '       WHERE Purch_Ord_Line_Add_Chg.Purchase_order > POL.Purchas' +
        'e_order AND Purch_Ord_Line_Add_Chg.Purchase_order <= Purchase_Or' +
        'derLine.Purchase_order) as Total_Call_off_Charges'
      
        'FROM Purchase_orderLine, Purchase_Orderline POL, Price_Unit, Pri' +
        'ce_Unit PU'
      'WHERE Purchase_Orderline.Purchase_order = :Purchase_Order AND'
      '      Purchase_Orderline.Original_Order = POL.Purchase_Order AND'
      '      Purchase_Orderline.Order_Unit = Price_Unit.Price_Unit AND'
      '      POL.Order_Unit = PU.Price_Unit')
    Left = 317
    Top = 368
    ParamData = <
      item
        Name = 'Purchase_Order'
      end>
  end
  object qryGetCallOffInvoices: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT SUM(CASE WHEN Price_Unit_Factor = 0 THEN Goods_Value'
      #9#9#9'ELSE ((Qty_Invoiced/Price_Unit_factor) * Goods_Value)'
      #9#9#9'END) as Total_Goods,'
      #9#9'SUM(Amount) as Total_Charges'
      'FROM Price_Unit '
      #9'INNER JOIN (Sales_Invoice_Line '
      #9'LEFT JOIN Sales_Invoice_Add_charge '
      
        #9#9'ON (Sales_Invoice_Line.Invoice_Line_No = Sales_Invoice_Add_cha' +
        'rge.Invoice_line_no) AND (Sales_Invoice_Line.Sales_Invoice = Sal' +
        'es_Invoice_Add_charge.Sales_Invoice)) '
      #9#9'ON Price_Unit.Price_Unit = Sales_Invoice_Line.Price_Unit'
      
        'WHERE Sales_invoice_line.Purchase_order > :Original_Order and Sa' +
        'les_invoice_line.Purchase_order <= :Purchase_Order')
    Left = 325
    Top = 424
    ParamData = <
      item
        Name = 'Original_Order'
      end
      item
        Name = 'Purchase_order'
      end>
  end
end
