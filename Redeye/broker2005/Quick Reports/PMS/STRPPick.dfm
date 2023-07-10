object STRPPickfrm: TSTRPPickfrm
  Left = 5
  Top = 29
  Width = 812
  Height = 612
  HorzScrollBar.Position = 22
  Caption = 'Sales Order Pick Note '
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PickSOListQuickReport: TQuickRep
    Left = 10
    Top = 16
    Width = 794
    Height = 1123
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    BeforePrint = PickSOListQuickReportBeforePrint
    DataSet = GetAllocMasterQuery
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Gill Sans MT'
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
    Page.Values = (
      350.000000000000000000
      2970.000000000000000000
      30.000000000000000000
      2100.000000000000000000
      65.000000000000000000
      50.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.OutputBin = Auto
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrintIfEmpty = False
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsMaximized
    object PageHeadQRBand: TQRBand
      Left = 25
      Top = 11
      Width = 751
      Height = 414
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = PageHeadQRBandAfterPrint
      AlignToBottom = False
      BeforePrint = PageHeadQRBandBeforePrint
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Gill Sans MT'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        1095.375000000000000000
        1987.020833333333000000)
      BandType = rbPageHeader
      object PreviewQRLabel: TgtQRLabel
        Left = 680
        Top = 8
        Width = 80
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          1799.166666666670000000
          21.166666666666700000
          211.666666666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'PREVIEW'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object NotesQRMemo: TgtQRMemo
        Left = 16
        Top = 143
        Width = 272
        Height = 162
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          428.625000000000000000
          42.333333333333300000
          378.354166666667000000
          719.666666666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        Lines.Strings = (
          'XXXXXXXXXXXXXXXXXXXXXXXX'
          'XXXXXXXXXXXXXXXXXXXXXXXX'
          'XXXXXXXXXXXXXXXXXXXXXXXX'
          'XXXXXXXXXXXXXXXXXXXXXXXX'
          'XXXXXXXXXXXXXXXXXXXXXXXX')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object DelInstructMemo: TgtQRMemo
        Left = 449
        Top = 143
        Width = 272
        Height = 122
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          322.791666666667000000
          1187.979166666670000000
          378.354166666667000000
          719.666666666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRLblAccnt: TgtQRLabel
        Left = 16
        Top = 344
        Width = 108
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          42.333333333333330000
          910.166666666666700000
          285.750000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Account number'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object CustRefQRDBText: TgtQRDBText
        Left = 168
        Top = 344
        Width = 104
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          444.500000000000000000
          910.166666666666700000
          275.166666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = GetAllocDetQuery
        DataField = 'Cust_Order_No'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object DelNoQRLabel: TgtQRLabel
        Left = 584
        Top = 344
        Width = 105
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          1545.166666666670000000
          910.166666666667000000
          277.812500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'DelNoQRLabel'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object DespDtQRLbl: TgtQRLabel
        Left = 488
        Top = 344
        Width = 80
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          1291.166666666670000000
          910.166666666667000000
          211.666666666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'DespDtQRLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = False
        FontSize = 11
      end
      object SoNumQRDBText: TgtQRDBText
        Left = 368
        Top = 344
        Width = 84
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          973.666666666666700000
          910.166666666666700000
          222.250000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = GetAllocDetQuery
        DataField = 'Sales_Order'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRLabel6: TgtQRLabel
        Left = 636
        Top = 394
        Width = 32
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1682.750000000000000000
          1042.458333333333000000
          84.666666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'BOXES'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel7: TgtQRLabel
        Left = 528
        Top = 394
        Width = 49
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          1397.000000000000000000
          1042.458333333333000000
          129.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'PACK SIZE'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel5: TgtQRLabel
        Left = 208
        Top = 394
        Width = 63
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          550.333333333333300000
          1042.458333333333000000
          166.687500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DESCRIPTION'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel10: TgtQRLabel
        Left = 112
        Top = 394
        Width = 47
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          296.333333333333300000
          1042.458333333333000000
          124.354166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'PRODUCT'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel1: TgtQRLabel
        Left = 2
        Top = 394
        Width = 96
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          5.291666666666667000
          1042.458333333333000000
          254.000000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QUANTITY ORDERED'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel4: TgtQRLabel
        Left = 688
        Top = 394
        Width = 16
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          1820.333333333333000000
          1042.458333333333000000
          42.333333333333330000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'BIN'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel2: TgtQRLabel
        Left = 17
        Top = 317
        Width = 110
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          44.979166666666670000
          838.729166666666700000
          291.041666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Account Number'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRLabel3: TgtQRLabel
        Left = 169
        Top = 317
        Width = 97
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          447.145833333333300000
          838.729166666666700000
          256.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Customer Ref.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRLabel8: TgtQRLabel
        Left = 369
        Top = 317
        Width = 65
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          976.312500000000000000
          838.729166666666700000
          171.979166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Order No.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRLabel9: TgtQRLabel
        Left = 465
        Top = 317
        Width = 99
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          1230.312500000000000000
          838.729166666666700000
          261.937500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Despatch Date'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRLabel11: TgtQRLabel
        Left = 585
        Top = 317
        Width = 113
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          1547.812500000000000000
          838.729166666666700000
          298.979166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Delivery Note No.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRLabel12: TgtQRLabel
        Left = 449
        Top = 117
        Width = 132
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          1187.979166666667000000
          309.562500000000000000
          349.250000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Delivery Instructions'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRLabel13: TgtQRLabel
        Left = 17
        Top = 117
        Width = 71
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          44.979166666666670000
          309.562500000000000000
          187.854166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Deliver To:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRLabel14: TgtQRLabel
        Left = 301
        Top = 32
        Width = 148
        Height = 31
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          82.020833333333330000
          796.395833333333300000
          84.666666666666670000
          391.583333333333300000)
        Alignment = taCenter
        AlignToBand = True
        AutoSize = True
        AutoStretch = False
        Caption = 'PICKING NOTE'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 16
      end
      object qrLblShortCode: TgtQRLabel
        Left = 298
        Top = 144
        Width = 112
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          788.458333333333300000
          381.000000000000000000
          296.333333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrLblShortCode'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object qrlblWarehouse: TgtQRLabel
        Left = 320
        Top = 64
        Width = 110
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          846.666666666666700000
          169.333333333333300000
          291.041666666666700000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'qrlblWarehouse'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
    end
    object GroupHeadQRGroup: TQRGroup
      Left = 25
      Top = 425
      Width = 751
      Height = 3
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = GroupHeadQRGroupBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        7.937500000000000000
        1987.020833333333000000)
      Expression = 'GetAllocMasterQuery.Sales_Order'
      Master = PickSOListQuickReport
      ReprintOnNewPage = True
    end
    object QRSubDetail1: TQRSubDetail
      Left = 25
      Top = 428
      Width = 751
      Height = 24
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = QRSubDetail1BeforePrint
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        63.500000000000000000
        1987.020833333333000000)
      Master = PickSOListQuickReport
      DataSet = GetAllocDetQuery
      PrintBefore = False
      PrintIfEmpty = True
      object PartQRDBText: TgtQRDBText
        Left = 112
        Top = 2
        Width = 89
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333300000
          296.333333333333000000
          5.291666666666670000
          235.479166666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = GetAllocDetQuery
        DataField = 'Part'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object DescQRDBText: TgtQRDBText
        Left = 208
        Top = 2
        Width = 297
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333300000
          550.333333333333000000
          5.291666666666670000
          785.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = GetAllocDetQuery
        DataField = 'Part_Description'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object BinQRDBText: TgtQRDBText
        Left = 688
        Top = 2
        Width = 73
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333300000
          1820.333333333330000000
          5.291666666666670000
          193.145833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = GetAllocDetQuery
        DataField = 'Part_Bin'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        Mask = '######'
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText4: TgtQRDBText
        Left = 513
        Top = 2
        Width = 64
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333300000
          1357.312500000000000000
          5.291666666666670000
          169.333333333333000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = GetAllocDetQuery
        DataField = 'Sell_Pack_Quantity'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabelDlvrd: TgtQRLabel
        Left = 619
        Top = 2
        Width = 50
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333300000
          1637.770833333330000000
          5.291666666666670000
          132.291666666667000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QRLabelDlvrd'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabelQty: TgtQRLabel
        Left = 3
        Top = 2
        Width = 66
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333300000
          7.937500000000000000
          5.291666666666670000
          174.625000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QRLabelQty'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object qrdetailSerialNos: TQRSubDetail
      Left = 25
      Top = 452
      Width = 751
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = qrdetailSerialNosAfterPrint
      AlignToBottom = False
      BeforePrint = qrdetailSerialNosBeforePrint
      Color = clWhite
      Enabled = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        55.562500000000000000
        1987.020833333333000000)
      Master = QRSubDetail1
      DataSet = GetAllocSerialNoSQL
      PrintBefore = False
      PrintIfEmpty = True
      object lblSerialCaption: TgtQRLabel
        Left = 208
        Top = 0
        Width = 94
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          550.333333333333300000
          0.000000000000000000
          248.708333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Serial Numbers:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lblSerialRange: TgtQRLabel
        Left = 312
        Top = 0
        Width = 84
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          50.270833333333330000
          825.500000000000000000
          0.000000000000000000
          222.250000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'lblSerialRange'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
  end
  object AllocDataSource: TDataSource
    DataSet = GetAllocMasterQuery
    Left = 17
    Top = 70
  end
  object GetAllocDetQuery: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT'
      '  Part_Store_Allocation.Store_stock,'
      '  Part_Store_Allocation.Picking_List_Ref,'
      '  Part_Store_Allocation.Sales_order_Line_No,'
      
        '  Store_Stock.Part_Bin,Part_Store.Part_Store_Name, Part_Store.St' +
        'ock_Bins_In_Use,'
      '  Part_Store.Stock_Lots_In_Use,'
      '  Store_Stock.Part_Store_Lot,'
      '  Part.Part, Part.Part_Description,Sales_Order.Sales_Order,'
      
        '  Sales_Order.Delivery_Customer, Sales_Order.Delivery_Branch, Sa' +
        'les_Order.Customer, Sales_Order.Branch_No, Sales_Order.Date_Requ' +
        'ired,'
      
        '  Sales_Order.Date_Ordered, Sales_Order.Cust_Order_No, Sales_Ord' +
        'er.Ad_Hoc_Address,'
      '  SUM(Part_Store_Allocation.Quantity_Allocated) as qty_alloc,'
      '  Sales_order_Line.Quantity_Ordered,'
      '  Part.Sell_Pack_Quantity,'
      '  Part.Part_Purchase_Price,'
      '  Part.Part_Cost_List,'
      '  Sales_Order.Cost_Centre,'
      '  Sales_order.Narrative,'
      '  Sales_order.Delivery_Notes'
      'FROM'
      
        '  Part_Store_Allocation, Store_Stock, Part_Store, Part, Sales_Or' +
        'der, Sales_Order_Line'
      'WHERE'
      
        '  Part_Store_Allocation.Store_Stock = Store_Stock.Store_Stock an' +
        'd'
      
        '  ((Part_Store_Allocation.Sales_Order = Sales_Order_Line.Sales_O' +
        'rder) and'
      
        '  (Part_Store_Allocation.Sales_Order_line_no = Sales_Order_Line.' +
        'Sales_Order_Line_no)) and'
      '  Sales_Order.Sales_Order = Sales_Order_Line.Sales_Order and'
      '  Store_Stock.Part_Store = Part_Store.Part_Store and'
      '  Store_Stock.Part = Sales_Order_Line.Part and'
      '  Store_Stock.Part = Part.Part  and'
      '  Sales_Order.Sales_Order = :Sel1'
      'GROUP BY'
      '  Part_Store_Allocation.Store_stock,'
      '  Part_Store_Allocation.Picking_List_Ref,'
      '  Part_Store_Allocation.Sales_order_Line_No,'
      
        '  Store_Stock.Part_Bin,Part_Store.Part_Store_Name,Part_Store.Sto' +
        'ck_Bins_In_Use,'
      '  Part_Store.Stock_Lots_In_Use,'
      '  Store_Stock.Part_Store_Lot,'
      '  Part.Part, Part.Part_Description,Sales_Order.Sales_Order,'
      
        '  Sales_Order.Delivery_Customer, Sales_Order.Delivery_Branch, Sa' +
        'les_Order.Customer, Sales_Order.Branch_No, Sales_Order.Date_Requ' +
        'ired,'
      
        '  Sales_Order.Date_Ordered, Sales_Order.Cust_Order_No, Sales_Ord' +
        'er.Ad_Hoc_Address,'
      '  Sales_order_Line.Quantity_Ordered,'
      '  Part.Sell_Pack_Quantity,'
      '  Part.Part_Purchase_Price,'
      '  Part.Part_Cost_List,'
      '  Sales_Order.Cost_Centre,'
      '  Sales_order.Narrative,'
      '  Sales_order.Delivery_Notes'
      'ORDER BY'
      '  Sales_Order.Sales_Order,'
      '  Part.Part,'
      '  Store_Stock.Part_Bin'
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
    Left = 3
    Top = 104
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Sel1'
        ParamType = ptUnknown
      end>
  end
  object oldGetAllocMasterQuery: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Sel1, Sel2'
      'from'
      '  Int_Sel'
      'where'
      '  Int_Sel.Int_Sel_Code = :Int_Sel_Code and'
      '  (Int_Sel.Sel1 <> 0)'
      'order by'
      '  Sel2, Sel1'
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
    Left = 48
    Top = 32
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Int_Sel_Code'
        ParamType = ptUnknown
      end>
  end
  object UpdAllocDetQuery: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Update Part_Store_Allocation'
      '  Set Picking_List_Ref = :Picking_List_Ref'
      'WHERE'
      '  Part_Store_Allocation.Part_Store_Allocation = :Store_Record'
      '  '
      ' '
      ' '
      ' '
      ' ')
    Left = 8
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Picking_List_Ref'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Store_Record'
        ParamType = ptUnknown
      end>
  end
  object GetAllAllocDetQuery: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT Part_Store_Allocation.Part_Store_Allocation'
      'FROM'
      '  Part_Store_Allocation, Sales_Order'
      'WHERE'
      
        '  Part_Store_Allocation.Sales_Order = Sales_Order.Sales_Order an' +
        'd'
      '  Sales_Order.Sales_Order = :Sel1'
      ''
      ''
      ''
      ''
      ''
      ' '
      ''
      ' '
      ' '
      ' ')
    Left = 16
    Top = 188
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sel1'
        ParamType = ptUnknown
      end>
  end
  object UpdRefQuery: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'update Company'
      'set Picking_List_Ref =:Picking_Ref_No '
      ' ')
    Left = 590
    Top = 118
    ParamData = <
      item
        DataType = ftString
        Name = 'Picking_Ref_No'
        ParamType = ptUnknown
      end>
  end
  object GetCustSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Customer.Name as Cust_Name,'
      'Customer_Branch.Name as Branch_Name,'
      'Building_no_name,'
      'Street,'
      'Locale,'
      'Town,'
      'Postcode,'
      'Delivery_Narrative,'
      'Account_Code,'
      'Inv_To_Customer,'
      'Inv_To_Branch,'
      'Short_Code,'
      'HO_Department'
      'from'
      '  Customer_Branch, Customer'
      'where'
      '  ((Customer_Branch.Customer = :Customer) and'
      '   (Branch_no = :Branch_no)) and'
      '  Customer_Branch.Customer = Customer.Customer'
      ' ')
    Left = 366
    Top = 107
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Branch_No'
        ParamType = ptUnknown
      end>
  end
  object UpdSOHeadSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Update Sales_Order'
      'Set sales_Order.Sales_order_Head_Status = :status'
      'where'
      'Sales_Order.Sales_Order = :Sales_Order'
      ' '
      ' ')
    Left = 374
    Top = 134
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end>
  end
  object GetDelivNarrSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select Narrative_Text'
      'from Narrative_Line'
      'where Narrative = :Narrative'
      ' ')
    Left = 230
    Top = 222
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Narrative'
        ParamType = ptUnknown
      end>
  end
  object GetDelivCountSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select sales_order'
      'from sales_order_delivery'
      'where (sales_order = :sales_order) '
      ' '
      ' ')
    Left = 166
    Top = 180
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'sales_order'
        ParamType = ptUnknown
      end>
  end
  object GetNextSODelivSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select Max(Sales_Order_Delivery) as Last_Code'
      'From Sales_order_Delivery')
    Left = 536
    Top = 140
  end
  object GetAllocMasterQuery: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      
        'select Int_sel.*, Sales_Order.Sales_Order, Sales_Order.Sales_ord' +
        'er_Head_Status'
      'from'
      '  Int_Sel, Sales_Order'
      'where'
      '  (Int_Sel.Int_Sel_Code = :Int_Sel_Code) and'
      
        '  ((Sales_order.Sales_Order = Int_Sel.Sel1) or (:Sales_Order = 0' +
        ')) and'
      '  ((Sales_order.Sales_order_Head_Status >= :Status_from) and'
      '  (Sales_order.Sales_order_Head_Status <= :Status_to)) and'
      '  (Sales_Order.Replenish_Source = 2)'
      ''
      ''
      '  '
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
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 192
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Int_Sel_Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Status_from'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Status_to'
        ParamType = ptUnknown
      end>
  end
  object DummySQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      
        'select Int_sel.*, Sales_Order.Sales_Order, Sales_Order.Sales_ord' +
        'er_Head_Status'
      'from'
      '  Int_Sel, Sales_Order'
      'where'
      '  (Int_Sel.Int_Sel_Code = :Int_Sel_Code) and'
      
        '  ((Sales_order.Sales_Order = Int_Sel.Sel1) or (:Sales_Order = 0' +
        ')) and'
      '  ((Sales_order.Sales_order_Head_Status >= :Status_from) and'
      '  (Sales_order.Sales_order_Head_Status <= :Status_to))and'
      '  (Sales_order.Replenish_Source = 2)'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 246
    Top = 34
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Int_Sel_Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Status_from'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Status_to'
        ParamType = ptUnknown
      end>
  end
  object AdhocSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Name,'
      '  '#39#39' as Branch_Name,'
      '  Building_no_name,'
      '  Street,'
      '  Locale,'
      '  Town,'
      '  Postcode,'
      '  Delivery_Narrative,'
      '  0 as HO_Department'
      'from Ad_hoc_Address'
      'where Ad_hoc_Address = :Ad_hoc_Address'
      ' ')
    Left = 896
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Ad_hoc_Address'
        ParamType = ptInput
      end>
  end
  object AddressSRC: TDataSource
    Left = 176
    Top = 8
  end
  object GetAccountSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Account_Code'
      'from'
      '  Customer_Branch, Customer'
      'where'
      '  ((Customer_Branch.Customer = :Customer) and'
      '   (Branch_no = :Branch_no)) and'
      '  Customer_Branch.Customer = Customer.Customer'
      ' '
      ' '
      ' ')
    Left = 518
    Top = 67
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Branch_No'
        ParamType = ptUnknown
      end>
  end
  object AddDelivLineDetSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Insert Into Sales_order_Delivery_Line'
      
        '(Sales_Order, Sales_Order_Delivery_No, Sales_Order_line_No, Quan' +
        'tity_Delivered,'
      '  Quantity_Picked)'
      'values'
      '(:Sales_Order, :Sales_Order_Deliv, :Sales_order_Line_No, 0, 0)'
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 254
    Top = 156
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Order_Deliv'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_order_Line_No'
        ParamType = ptUnknown
      end>
  end
  object CheckDelivSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Quantity_Delivered'
      'from Sales_order_Delivery_Line'
      
        'where (sales_order = :Sales_Order) and (Sales_Order_Line_No = :S' +
        'ales_Order_Line_No) and'
      '  (Sales_Order_Delivery_No = :Sales_Order_Deliv)'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 302
    Top = 212
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Order_Line_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Order_Deliv'
        ParamType = ptUnknown
      end>
  end
  object AddDelivDetSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Insert Into Sales_order_Delivery'
      
        '(Sales_Order, Sales_Order_Delivery_No, Delivery_Date, Despatch_N' +
        'ote_No, Delivery_Type,'
      
        '  Date_Picked, Delivery_Weight_Kilos, No_of_Boxes, Delivery_Inst' +
        'ructions,'
      '  Consignment_Number, Courier, Service_No)'
      'values'
      
        '(:Sales_Order,:Sales_Order_Deliv, :Del_Dt, :Desp_Note_No, :Del_T' +
        'ype,'
      '  :Del_Dt, 0, 1, :Delivery_Instructions,'
      '  '#39#39', :Courier, 0)'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 230
    Top = 196
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Order_Deliv'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Del_Dt'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Desp_Note_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Del_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Del_Dt'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Delivery_Instructions'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Courier'
        ParamType = ptUnknown
      end>
  end
  object GetAllocSerialNoSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select * '
      'from Store_stock_serial_item'
      'where store_stock = :Store_stock and'
      'Sales_order = :Sales_order')
    Left = 729
    Top = 123
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Store_stock'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_order'
        ParamType = ptUnknown
      end>
  end
  object GetCustHOSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Customer.Name as Cust_Name,'
      'Customer_Branch.Name as Branch_Name,'
      'CB.Building_no_name,'
      'CB.Street,'
      'CB.Locale,'
      'CB.Town,'
      'CB.Postcode,'
      'CB.Delivery_Narrative,'
      'CB.Account_Code,'
      'CB.Inv_To_Customer,'
      'CB.Inv_To_Branch,'
      'CB.Short_Code,'
      'Customer_Branch.HO_Department'
      'from'
      '  Customer_Branch, Customer, Customer_Branch CB'
      'where'
      '  ((Customer_Branch.Customer = :Customer) and'
      '   (Customer_Branch.Branch_no = :Branch_no)) and'
      '  ((CB.Customer = :Customer) and'
      '   (CB.Branch_no = 0)) and'
      '  Customer_Branch.Customer = Customer.Customer'
      ' '
      '')
    Left = 389
    Top = 243
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end>
  end
  object qryCompany: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select In_Use_By from Company Where Company = 1'
      ' '
      ' ')
    Left = 32
    Top = 240
  end
end
