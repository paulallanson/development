object PBRPPurchInvFrm: TPBRPPurchInvFrm
  Left = 89
  Top = 94
  Caption = 'Sales By Invoice Report Print Preview'
  ClientHeight = 440
  ClientWidth = 1129
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Scaled = False
  OnCreate = FormCreate
  TextHeight = 13
  object qckrpPurchInv: TQuickRep
    Left = 0
    Top = 8
    Width = 1403
    Height = 992
    ShowingPreview = False
    BeforePrint = qckrpPurchInvBeforePrint
    DataSet = qryPurchInv
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
      Left = 47
      Top = 47
      Width = 1309
      Height = 114
      Frame.DrawBottom = True
      AfterPrint = qrbndPageHeaderAfterPrint
      AlignToBottom = False
      TransparentBand = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        241.300000000000000000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object qrlblTitle: TQRLabel
        Left = 596
        Top = 10
        Width = 117
        Height = 29
        Size.Values = (
          61.383333333333330000
          1261.533333333333000000
          21.166666666666670000
          247.650000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'Daybook - '
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
      object QRLabel1: TQRLabel
        Left = 16
        Top = 90
        Width = 33
        Height = 21
        Size.Values = (
          44.450000000000000000
          33.866666666666670000
          190.500000000000000000
          69.850000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Order'
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
        Left = 140
        Top = 70
        Width = 70
        Height = 23
        Size.Values = (
          48.683333333333330000
          296.333333333333300000
          148.166666666666700000
          148.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer &'
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
        Left = 574
        Top = 90
        Width = 64
        Height = 23
        Size.Values = (
          48.683333333333330000
          1214.966666666667000000
          190.500000000000000000
          135.466666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Invoice No.'
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
        Left = 524
        Top = 90
        Width = 31
        Height = 23
        Size.Values = (
          48.683333333333330000
          1109.133333333333000000
          190.500000000000000000
          65.616666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Price'
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
        Left = 140
        Top = 90
        Width = 104
        Height = 23
        Size.Values = (
          48.683333333333330000
          296.333333333333300000
          190.500000000000000000
          220.133333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Description of Job'
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
        Left = 734
        Top = 90
        Width = 48
        Height = 23
        Size.Values = (
          48.683333333333330000
          1553.633333333333000000
          190.500000000000000000
          101.600000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Supplier'
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
      object qrlblDateRange: TQRLabel
        Left = 559
        Top = 40
        Width = 191
        Height = 23
        Size.Values = (
          48.683333333333330000
          1183.216666666667000000
          84.666666666666670000
          404.283333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = True
        Caption = 'For Orders Dated from: '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -18
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 11
      end
      object QRLabel13: TQRLabel
        Left = 1156
        Top = 10
        Width = 81
        Height = 23
        Size.Values = (
          48.683333333333330000
          2446.866666666667000000
          21.166666666666670000
          171.450000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Page No.:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -18
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 11
      end
      object QRSysData1: TQRSysData
        Left = 1236
        Top = 10
        Width = 65
        Height = 23
        Size.Values = (
          48.683333333333330000
          2616.200000000000000000
          21.166666666666670000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -18
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Text = ''
        Transparent = False
        ExportAs = exptText
        VerticalAlignment = tlTop
        FontSize = 11
      end
      object QRLabel16: TQRLabel
        Left = 343
        Top = 90
        Width = 45
        Height = 23
        Size.Values = (
          48.683333333333330000
          726.016666666666700000
          190.500000000000000000
          95.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'PO Qty'
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
        Left = 668
        Top = 90
        Width = 51
        Height = 23
        Size.Values = (
          48.683333333333330000
          1413.933333333333000000
          190.500000000000000000
          107.950000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Inv. Date'
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
      object QRLabel6: TQRLabel
        Left = 896
        Top = 90
        Width = 64
        Height = 23
        Size.Values = (
          48.683333333333330000
          1896.533333333333000000
          190.500000000000000000
          135.466666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Invoice No.'
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
        Left = 1025
        Top = 90
        Width = 51
        Height = 23
        Size.Values = (
          48.683333333333330000
          2169.583333333333000000
          190.500000000000000000
          107.950000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Inv. Date'
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
        Left = 1206
        Top = 90
        Width = 28
        Height = 23
        Size.Values = (
          48.683333333333330000
          2552.700000000000000000
          190.500000000000000000
          59.266666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cost'
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
        Left = 1261
        Top = 90
        Width = 39
        Height = 23
        Size.Values = (
          48.683333333333330000
          2669.116666666667000000
          190.500000000000000000
          82.550000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Extras'
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
        Left = 70
        Top = 90
        Width = 28
        Height = 23
        Size.Values = (
          48.683333333333330000
          148.166666666666700000
          190.500000000000000000
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
      object QRLabel14: TQRLabel
        Left = 550
        Top = 69
        Width = 34
        Height = 23
        Size.Values = (
          48.683333333333330000
          1164.166666666667000000
          146.050000000000000000
          71.966666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Sales'
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
      object QRShape5: TQRShape
        Left = 410
        Top = 65
        Width = 131
        Height = 21
        Size.Values = (
          44.979166666666670000
          867.833333333333500000
          137.583333333333300000
          277.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape6: TQRShape
        Left = 604
        Top = 65
        Width = 124
        Height = 21
        Size.Values = (
          44.979166666666670000
          1277.937500000000000000
          137.583333333333300000
          261.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel15: TQRLabel
        Left = 1064
        Top = 69
        Width = 63
        Height = 23
        Size.Values = (
          48.683333333333330000
          2252.133333333333000000
          146.050000000000000000
          133.350000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Purchases'
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
      object QRShape7: TQRShape
        Left = 891
        Top = 65
        Width = 156
        Height = 21
        Size.Values = (
          44.979166666666670000
          1886.479166666667000000
          137.583333333333300000
          330.729166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape8: TQRShape
        Left = 1145
        Top = 65
        Width = 156
        Height = 21
        Size.Values = (
          44.979166666666670000
          2423.583333333333000000
          137.583333333333300000
          330.729166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Pen.Width = 2
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel17: TQRLabel
        Left = 432
        Top = 90
        Width = 41
        Height = 23
        Size.Values = (
          48.683333333333330000
          914.400000000000000000
          190.500000000000000000
          86.783333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Inv Qty'
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
      object QRLabel19: TQRLabel
        Left = 1094
        Top = 90
        Width = 41
        Height = 23
        Size.Values = (
          48.683333333333330000
          2315.633333333333000000
          190.500000000000000000
          86.783333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Inv Qty'
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
    object QRSubDetail1: TQRSubDetail
      Left = 47
      Top = 193
      Width = 1309
      Height = 49
      AfterPrint = QRSubDetail1AfterPrint
      AlignToBottom = False
      BeforePrint = QRSubDetail1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        103.716666666666700000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = qckrpPurchInv
      DataSet = qryPurchInv
      PrintBefore = False
      PrintIfEmpty = True
      object qrlblExtras: TQRLabel
        Left = 1240
        Top = 3
        Width = 63
        Height = 21
        Size.Values = (
          44.450000000000000000
          2624.666666666667000000
          6.350000000000000000
          133.350000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblExtras'
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
      object qrdbtxtPOLine: TQRDBText
        Left = 10
        Top = 3
        Width = 44
        Height = 21
        Size.Values = (
          44.450000000000000000
          21.166666666666670000
          6.350000000000000000
          93.133333333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryPurchInv
        DataField = 'POLine'
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
      object qrdbtxtCustomer: TQRDBText
        Left = 140
        Top = 3
        Width = 191
        Height = 21
        Size.Values = (
          44.979166666666670000
          296.333333333333400000
          5.291666666666667000
          404.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryPurchInv
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
      object qrdbtxtCustsDesc: TQRDBText
        Left = 140
        Top = 23
        Width = 241
        Height = 21
        Size.Values = (
          44.979166666666670000
          296.333333333333400000
          47.625000000000000000
          510.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryPurchInv
        DataField = 'Customers_Desc'
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
        Left = 323
        Top = 3
        Width = 62
        Height = 21
        Size.Values = (
          44.450000000000000000
          683.683333333333300000
          6.350000000000000000
          131.233333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryPurchInv
        DataField = 'Sales_Qty'
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
        Left = 70
        Top = 1
        Width = 65
        Height = 21
        Size.Values = (
          44.450000000000000000
          148.166666666666700000
          2.116666666666667000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryPurchInv
        DataField = 'Date_Point'
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
      object qrlblSell: TQRLabel
        Left = 501
        Top = 3
        Width = 55
        Height = 19
        Size.Values = (
          40.216666666666670000
          1060.450000000000000000
          6.350000000000000000
          116.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblSell'
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
      object qrlblOrderCost: TQRLabel
        Left = 1130
        Top = 23
        Width = 93
        Height = 19
        Enabled = False
        Size.Values = (
          40.216666666666670000
          2391.833333333333000000
          48.683333333333330000
          196.850000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblOrderCost'
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
      object qrlblInvoiceCost: TQRLabel
        Left = 960
        Top = 23
        Width = 103
        Height = 19
        Enabled = False
        Size.Values = (
          40.216666666666670000
          2032.000000000000000000
          48.683333333333330000
          218.016666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblInvoiceCost'
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
      object qrlblSuppInvNo: TQRLabel
        Left = 897
        Top = 3
        Width = 124
        Height = 21
        Size.Values = (
          44.979166666666670000
          1899.708333333333000000
          5.291666666666667000
          261.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlblSuppInvNo'
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
      object qrlblSuppInvDate: TQRLabel
        Left = 1026
        Top = 3
        Width = 102
        Height = 21
        Size.Values = (
          44.979166666666670000
          2172.229166666667000000
          5.291666666666667000
          216.958333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlblSuppInvDate'
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
      object qrlblSuppInvQty: TQRLabel
        Left = 1098
        Top = 3
        Width = 91
        Height = 21
        Size.Values = (
          44.450000000000000000
          2324.100000000000000000
          6.350000000000000000
          192.616666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrlblSuppInvQty'
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
      object qrlblPurchase: TQRLabel
        Left = 1149
        Top = 3
        Width = 89
        Height = 19
        Size.Values = (
          40.216666666666670000
          2432.050000000000000000
          6.350000000000000000
          188.383333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'qrlblPurchase'
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
      object qrlblSuppName: TQRLabel
        Left = 738
        Top = 3
        Width = 154
        Height = 21
        Size.Values = (
          44.979166666666670000
          1561.041666666667000000
          5.291666666666667000
          325.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlblSuppName'
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
      object qrlblSalesInvNo: TQRLabel
        Left = 575
        Top = 3
        Width = 86
        Height = 21
        Size.Values = (
          44.979166666666670000
          1217.083333333333000000
          5.291666666666667000
          182.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlblSalesInvNo'
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
      object qrlblSalesInvDate: TQRLabel
        Left = 668
        Top = 3
        Width = 65
        Height = 21
        Size.Values = (
          44.979166666666670000
          1412.875000000000000000
          5.291666666666667000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlblSalesInvDate'
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
      object qrlblSalesInvQty: TQRLabel
        Left = 390
        Top = 3
        Width = 84
        Height = 21
        Size.Values = (
          44.979166666666670000
          825.500000000000100000
          5.291666666666667000
          177.270833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'qrlblSalesInvQty'
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
    object QRBand1: TQRBand
      Left = 47
      Top = 242
      Width = 1309
      Height = 50
      AfterPrint = QRBand1AfterPrint
      AlignToBottom = False
      BeforePrint = QRBand1BeforePrint
      Enabled = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbGroupFooter
      object QRLabel18: TQRLabel
        Left = 320
        Top = 20
        Width = 39
        Height = 25
        Size.Values = (
          52.916666666666670000
          677.333333333333300000
          42.333333333333330000
          82.550000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Totals'
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
      object TotalSellLbl: TQRLabel
        Left = 478
        Top = 20
        Width = 78
        Height = 25
        Size.Values = (
          52.916666666666670000
          1011.766666666667000000
          42.333333333333330000
          165.100000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalSellLbl'
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
      object QRShape1: TQRShape
        Left = 432
        Top = 0
        Width = 124
        Height = 11
        Size.Values = (
          23.812500000000000000
          915.458333333333200000
          0.000000000000000000
          261.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object TotalCostLbl: TQRLabel
        Left = 1144
        Top = 20
        Width = 93
        Height = 25
        Size.Values = (
          52.916666666666670000
          2421.466666666667000000
          42.333333333333330000
          196.850000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalGoodsLbl'
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
      object QRShape3: TQRShape
        Left = 1090
        Top = 0
        Width = 147
        Height = 11
        Size.Values = (
          23.812500000000000000
          2307.166666666667000000
          0.000000000000000000
          312.208333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
    object RepQRGroup: TQRGroup
      Left = 47
      Top = 161
      Width = 1309
      Height = 32
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        67.733333333333330000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      FooterBand = QRBand1
      Master = QRSubDetail1
      ReprintOnNewPage = False
      object GrpByQRDBText: TQRDBText
        Left = 9
        Top = 10
        Width = 312
        Height = 21
        Size.Values = (
          44.979166666666700000
          18.520833333333300000
          21.166666666666700000
          661.458333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = qryPurchInv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object QRBand2: TQRBand
      Left = 47
      Top = 292
      Width = 1309
      Height = 50
      AlignToBottom = False
      BeforePrint = QRBand2BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        105.833333333333300000
        2770.716666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbSummary
      object QRShape2: TQRShape
        Left = 432
        Top = 3
        Width = 124
        Height = 11
        Size.Values = (
          23.812500000000000000
          915.458333333333200000
          5.291666666666667000
          261.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object RepTotQRLabel: TQRLabel
        Left = 320
        Top = 20
        Width = 39
        Height = 25
        Size.Values = (
          52.916666666666670000
          677.333333333333300000
          42.333333333333330000
          82.550000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Totals'
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
      object RepTotSellQRLbl: TQRLabel
        Left = 479
        Top = 20
        Width = 78
        Height = 25
        Size.Values = (
          52.916666666666670000
          1013.883333333333000000
          42.333333333333330000
          165.100000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalSellLbl'
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
      object RepTotCostQRLbl: TQRLabel
        Left = 1144
        Top = 20
        Width = 93
        Height = 25
        Size.Values = (
          52.916666666666670000
          2421.466666666667000000
          42.333333333333330000
          196.850000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'TotalGoodsLbl'
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
      object QRShape4: TQRShape
        Left = 1090
        Top = 3
        Width = 147
        Height = 11
        Size.Values = (
          23.812500000000000000
          2307.166666666667000000
          5.291666666666667000
          312.208333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
  end
  object qryPurchInv: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Purchase_OrderLine.Purchase_Order,'
      '        Purchase_OrderLine.Line,'
      '        Purchase_Order.Date_Point,'
      '        Customer.Name AS Customer_Name,'
      '        Purchase_OrderLine.Customers_Desc,'
      '        Purchase_OrderLine.Quantity AS Sales_Qty,'
      '        Purchase_OrderLine.Selling_Price AS Sell_Price,'
      '        Purchase_OrderLine.Order_Price AS Purchase_Price,'
      '        Supplier_Invoice_Line.Qty_Invoiced AS Purchase_qty,'
      '        Supplier_Invoice_Line.Supplier_Invoice,'
      '        Supplier_Invoice_Line.Invoice_Line_No,'
      '        Supplier_Invoice_Line.Goods_Value as SP_Goods_Val,'
      '        Supplier_Invoice_Line.Qty_Invoiced as SP_Qty_Invoiced,'
      '        Sales_Invoice_Line.Goods_Value as SI_Goods_Val,'
      '        Sales_Invoice_Line.Qty_Invoiced as SI_Qty_Invoiced,'
      '        Supplier.Name AS Supplier_Name,'
      '        (select Sales_invoice_no'
      '          from Sales_invoice'
      
        '          where Sales_Invoice = Sales_invoice_Line.Sales_Invoice' +
        ') AS Sales_invoice_no,'
      '        (select Invoice_Date'
      '          from Sales_invoice'
      
        '          where Sales_Invoice = Sales_invoice_Line.Sales_Invoice' +
        ') AS Sales_invoice_date,'
      '        (select Supplier_invoice_no'
      '          from Supplier_invoice'
      
        '          where Supplier_Invoice = Supplier_invoice_Line.Supplie' +
        'r_Invoice) AS Supplier_invoice_no,'
      '        (select Invoice_Date'
      '          from Supplier_invoice'
      
        '          where Supplier_Invoice = Supplier_invoice_Line.Supplie' +
        'r_Invoice) AS Supplier_invoice_date,'
      '        (select Price_unit_factor'
      '          from Price_unit'
      
        '          where Price_Unit = Purchase_OrderLine.Sell_Unit) AS Pr' +
        'ice_Unit_Factor,'
      '        (select Price_unit_factor'
      '          from Price_unit'
      
        '          where Price_Unit = Purchase_OrderLine.Order_Unit) AS C' +
        'ost_Unit_Factor,'
      '        (select Price_unit_factor'
      '           from Price_unit'
      
        '           where Price_Unit = Supplier_Invoice_Line.Price_Unit) ' +
        'AS SP_Cost_Unit_Factor,'
      '        (select Price_unit_factor'
      '           from Price_unit'
      
        '           where Price_Unit = Sales_Invoice_Line.Price_Unit) AS ' +
        'SI_Cost_Unit_Factor,'
      '        Rep.Name as Rep_Name'
      'FROM Rep'
      '    INNER JOIN ((Supplier'
      '    INNER JOIN Purchase_Order ON'
      '      Supplier.Supplier = Purchase_Order.Supplier)'
      '    INNER JOIN (((Purchase_OrderLine'
      '    INNER JOIN Customer ON'
      '      Purchase_OrderLine.Customer = Customer.Customer)'
      '      LEFT JOIN Sales_Invoice_Line ON'
      '      (Purchase_OrderLine.Line = Sales_Invoice_Line.Line) AND'
      
        '      (Purchase_OrderLine.Purchase_Order = Sales_Invoice_Line.Pu' +
        'rchase_Order))'
      '      LEFT JOIN Supplier_Invoice_Line ON'
      '      (Purchase_OrderLine.Line = Supplier_Invoice_Line.Line) AND'
      
        '      (Purchase_OrderLine.Purchase_Order = Supplier_Invoice_Line' +
        '.Purchase_Order)) ON Purchase_Order.Purchase_Order = Purchase_Or' +
        'derLine.Purchase_Order) ON'
      '      Rep.Rep = Purchase_OrderLine.Rep'
      ' '
      ' ')
    Left = 212
    Top = 16
    object qryPurchInvSupplier_Invoice: TIntegerField
      FieldName = 'Supplier_Invoice'
    end
    object qryPurchInvInvoice_Line_No: TIntegerField
      FieldName = 'Invoice_Line_No'
    end
    object qryPurchInvPurchase_Order: TFloatField
      FieldName = 'Purchase_Order'
    end
    object qryPurchInvLine: TIntegerField
      FieldName = 'Line'
    end
    object qryPurchInvCustomer_Name: TWideStringField
      FieldName = 'Customer_Name'
      FixedChar = True
      Size = 80
    end
    object qryPurchInvCustomers_Desc: TWideStringField
      FieldName = 'Customers_Desc'
      FixedChar = True
      Size = 80
    end
    object qryPurchInvSales_Qty: TFloatField
      FieldName = 'Sales_Qty'
    end
    object qryPurchInvSell_Price: TCurrencyField
      FieldName = 'Sell_Price'
    end
    object qryPurchInvSales_Invoice_No: TWideStringField
      FieldName = 'Sales_Invoice_No'
      FixedChar = True
      Size = 30
    end
    object qryPurchInvSales_Invoice_Date: TDateTimeField
      FieldName = 'Sales_Invoice_Date'
    end
    object qryPurchInvSupplier_Name: TWideStringField
      FieldName = 'Supplier_Name'
      FixedChar = True
      Size = 80
    end
    object qryPurchInvSupplier_Invoice_no: TWideStringField
      FieldName = 'Supplier_Invoice_no'
      FixedChar = True
      Size = 40
    end
    object qryPurchInvSupplier_Invoice_Date: TDateTimeField
      FieldName = 'Supplier_Invoice_Date'
    end
    object qryPurchInvPurchase_Qty: TFloatField
      FieldName = 'Purchase_Qty'
    end
    object qryPurchInvPurchase_Price: TCurrencyField
      FieldName = 'Purchase_Price'
    end
    object qryPurchInvRep_Name: TWideStringField
      FieldName = 'Rep_Name'
      FixedChar = True
      Size = 80
    end
    object qryPurchInvPOLine: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'POLine'
      OnGetText = qryPurchInvPOLineGetText
      Size = 15
      Calculated = True
    end
    object qryPurchInvCost_Unit_Factor: TFloatField
      FieldName = 'Cost_Unit_Factor'
    end
    object qryPurchInvPrice_Unit_Factor: TFloatField
      FieldName = 'Price_Unit_Factor'
    end
    object qryPurchInvTotal_sell: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Total_sell'
      OnGetText = qryPurchInvTotal_sellGetText
      Calculated = True
    end
    object qryPurchInvTotal_Purch: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Total_Purch'
      OnGetText = qryPurchInvTotal_PurchGetText
      Calculated = True
    end
    object qryPurchInvDate_Point: TDateTimeField
      FieldName = 'Date_Point'
    end
    object qryPurchInvSP_Goods_Val: TCurrencyField
      FieldName = 'SP_Goods_Val'
    end
    object qryPurchInvSP_Qty_Invoiced: TFloatField
      FieldName = 'SP_Qty_Invoiced'
    end
    object qryPurchInvSI_Goods_Val: TFloatField
      FieldName = 'SI_Goods_Val'
    end
    object qryPurchInvSI_Qty_Invoiced: TFloatField
      FieldName = 'SI_Qty_Invoiced'
    end
    object qryPurchInvSP_Cost_Unit_Factor: TFloatField
      FieldName = 'SP_Cost_Unit_Factor'
    end
    object qryPurchInvSI_Cost_Unit_Factor: TFloatField
      FieldName = 'SI_Cost_Unit_Factor'
    end
  end
  object AddCostsQuery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select sum(Amount) as Add_Cost'
      'from Supplier_Invoice_Charge'
      
        '  where (Supplier_Invoice_Charge.Supplier_Invoice = :Supplier_in' +
        'voice)'
      ''
      ' '
      ' '
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
        Name = 'Supplier_invoice'
      end>
  end
end
