object PBRPDelivFrm: TPBRPDelivFrm
  Left = 269
  Top = 154
  Width = 1278
  Height = 706
  HorzScrollBar.Range = 1200
  VertScrollBar.Position = 907
  VertScrollBar.Range = 2000
  AutoScroll = False
  Caption = 'Delivery Note'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -16
  Font.Name = 'Courier New'
  Font.Style = []
  OldCreateOrder = True
  Scaled = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 18
  object PBDelivQuickReport: TQuickRep
    Left = 86
    Top = 21
    Width = 794
    Height = 1123
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    BeforePrint = PBDelivQuickReportBeforePrint
    DataSet = PODelivSQL
    Font.Charset = DEFAULT_CHARSET
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
      100.000000000000000000
      2970.000000000000000000
      100.000000000000000000
      2100.000000000000000000
      50.000000000000000000
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
    PrintIfEmpty = True
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsMaximized
    object QRBand1: TQRSubDetail
      Left = 19
      Top = 38
      Width = 756
      Height = 643
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = QRBand1BeforePrint
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold, fsItalic]
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        1701.270833333333000000
        2000.250000000000000000)
      Master = PBDelivQuickReport
      DataSet = PODelivSQL
      PrintBefore = False
      PrintIfEmpty = True
      object Accountlbl: TgtQRLabel
        Left = 568
        Top = 378
        Width = 71
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          1502.833333333333000000
          1000.125000000000000000
          187.854166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'XXXXXXXXXX'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object PONumberLbl: TgtQRLabel
        Left = 568
        Top = 411
        Width = 71
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          1502.833333333333000000
          1087.437500000000000000
          187.854166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'XXXXXXXXXX'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object DateLbl: TgtQRLabel
        Left = 568
        Top = 282
        Width = 65
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          1502.833333333333000000
          746.125000000000000000
          171.979166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'XX/XX/XXXX'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object BoxesLbl: TgtQRLabel
        Left = 648
        Top = 481
        Width = 55
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          1714.500000000000000000
          1272.645833333333000000
          145.520833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NNNNNN'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QtyOrderedLbl: TgtQRLabel
        Left = 16
        Top = 481
        Width = 64
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          42.333333333333330000
          1272.645833333333000000
          169.333333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NNNNNNN'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object OrderRefLbl: TgtQRLabel
        Left = 568
        Top = 282
        Width = 50
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          1502.833333333333000000
          746.125000000000000000
          132.291666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'XXXXXXX'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object YourRefLbl: TgtQRLabel
        Left = 568
        Top = 314
        Width = 78
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          1502.833333333333000000
          830.791666666666700000
          206.375000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'XXXXXXXXXXX'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QuantityLbl: TgtQRLabel
        Left = 513
        Top = 609
        Width = 64
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          1357.312500000000000000
          1611.312500000000000000
          169.333333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NNNNNNN'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object DescLbl: TgtQRLabel
        Left = 136
        Top = 612
        Width = 211
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          359.833333333333300000
          1619.250000000000000000
          558.270833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText2: TgtQRDBText
        Left = 567
        Top = 347
        Width = 178
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          1500.187500000000000000
          918.104166666666800000
          470.958333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = PODelivSQL
        DataField = 'Cust_Order_no'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText3: TgtQRDBText
        Left = 568
        Top = 283
        Width = 95
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          1502.833333333333000000
          748.770833333333300000
          251.354166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = PODelivSQL
        DataField = 'Purchase_Order'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText4: TgtQRDBText
        Left = 16
        Top = 481
        Width = 50
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          42.333333333333330000
          1272.645833333333000000
          132.291666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = PODelivSQL
        DataField = 'Quantity'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText5: TgtQRDBText
        Left = 513
        Top = 481
        Width = 85
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          1357.312500000000000000
          1272.645833333333000000
          224.895833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = PODelivSQL
        DataField = 'Qty_to_Deliver'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText6: TgtQRDBText
        Left = 136
        Top = 481
        Width = 345
        Height = 45
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          119.062500000000000000
          359.833333333333400000
          1272.645833333333000000
          912.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = PODelivSQL
        DataField = 'Customers_Desc'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object AddressMemo: TgtQRMemo
        Left = 32
        Top = 263
        Width = 331
        Height = 129
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          341.312500000000000000
          84.666666666666680000
          695.854166666666800000
          875.770833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Lato'
        Font.Style = []
        Lines.Strings = (
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
          ''
          '')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object Account: TgtQRDBText
        Left = 568
        Top = 378
        Width = 86
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          1502.833333333333000000
          1000.125000000000000000
          227.541666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = CustDetsSQL
        DataField = 'Account_Code'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object DelInstructMemo: TgtQRMemo
        Left = 136
        Top = 584
        Width = 561
        Height = 41
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          108.479166666666700000
          359.833333333333400000
          1545.166666666667000000
          1484.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        Lines.Strings = (
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
          '')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object FormRefLbl: TgtQRLabel
        Left = 136
        Top = 528
        Width = 63
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          359.833333333333300000
          1397.000000000000000000
          166.687500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Reference:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object FormRefDescLbl: TgtQRLabel
        Left = 136
        Top = 552
        Width = 70
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          359.833333333333300000
          1460.500000000000000000
          185.208333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Description:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object DeliveryDateLbl: TgtQRLabel
        Left = 568
        Top = 315
        Width = 105
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          1502.833333333333000000
          833.437500000000000000
          277.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'DeliveryDateLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel1: TgtQRLabel
        Left = 32
        Top = 240
        Width = 107
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          84.666666666666670000
          635.000000000000000000
          283.104166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Delivery Address'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel3: TgtQRLabel
        Left = 432
        Top = 379
        Width = 89
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          1143.000000000000000000
          1002.770833333333000000
          235.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Account Code'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel4: TgtQRLabel
        Left = 432
        Top = 347
        Width = 86
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          1143.000000000000000000
          918.104166666666700000
          227.541666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Customer Ref'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel5: TgtQRLabel
        Left = 432
        Top = 283
        Width = 78
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          1143.000000000000000000
          748.770833333333300000
          206.375000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Delivery No.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel6: TgtQRLabel
        Left = 432
        Top = 315
        Width = 86
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          1143.000000000000000000
          833.437500000000000000
          227.541666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Delivery Date'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel7: TgtQRLabel
        Left = 432
        Top = 411
        Width = 49
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          1143.000000000000000000
          1087.437500000000000000
          129.645833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Job No.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel8: TgtQRLabel
        Left = 16
        Top = 453
        Width = 62
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          42.333333333333330000
          1198.562500000000000000
          164.041666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Order Qty'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel9: TgtQRLabel
        Left = 136
        Top = 453
        Width = 72
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          359.833333333333300000
          1198.562500000000000000
          190.500000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Description'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel10: TgtQRLabel
        Left = 512
        Top = 453
        Width = 78
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          1354.666666666667000000
          1198.562500000000000000
          206.375000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Delivery Qty'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel11: TgtQRLabel
        Left = 648
        Top = 453
        Width = 81
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          1714.500000000000000000
          1198.562500000000000000
          214.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'No. of Boxes'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object imgReport: TgtQRImage
        Left = 376
        Top = 1
        Width = 363
        Height = 47
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          124.354166666666700000
          994.833333333333300000
          2.645833333333333000
          960.437500000000000000)
        Stretch = True
      end
    end
    object QRBand2: TQRSubDetail
      Left = 19
      Top = 681
      Width = 756
      Height = 28
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = QRBand2BeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        74.083333333333330000
        2000.250000000000000000)
      Master = PBDelivQuickReport
      DataSet = PBPODM.GetPickCallOffSQL
      PrintBefore = False
      PrintIfEmpty = True
      object QRShape1: TgtQRShape
        Left = 448
        Top = 0
        Width = 89
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.854166666666700000
          1185.333333333330000000
          0.000000000000000000
          235.479166666667000000)
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel13: TgtQRLabel
        Left = 136
        Top = 0
        Width = 65
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          359.833333333333300000
          0.000000000000000000
          171.979166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRLabel13'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel14: TgtQRLabel
        Left = 352
        Top = 0
        Width = 50
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          931.333333333333000000
          0.000000000000000000
          132.291666666667000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QRLabel14'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QRBand3: TQRBand
      Left = 19
      Top = 709
      Width = 756
      Height = 260
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = True
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        687.916666666666700000
        2000.250000000000000000)
      BandType = rbPageFooter
      object QRLabel12: TgtQRLabel
        Left = 16
        Top = 14
        Width = 38
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          42.333333333333330000
          37.041666666666670000
          100.541666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Name'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRShape2: TgtQRShape
        Left = 88
        Top = 16
        Width = 250
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.854166666666700000
          232.833333333333000000
          42.333333333333300000
          661.458333333333000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRShape3: TgtQRShape
        Left = 88
        Top = 56
        Width = 250
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.854166666666700000
          232.833333333333000000
          148.166666666667000000
          661.458333333333000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel15: TgtQRLabel
        Left = 16
        Top = 54
        Width = 46
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          42.333333333333330000
          142.875000000000000000
          121.708333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Signed'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel16: TgtQRLabel
        Left = 16
        Top = 102
        Width = 30
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          42.333333333333330000
          269.875000000000000000
          79.375000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Date'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRShape4: TgtQRShape
        Left = 88
        Top = 104
        Width = 150
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.854166666666700000
          232.833333333333000000
          275.166666666667000000
          396.875000000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object lbldelInst: TgtQRLabel
        Left = 369
        Top = 14
        Width = 129
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          976.312500000000000000
          37.041666666666670000
          341.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Delivery Instructions'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object DeliveryMemo: TgtQRMemo
        Left = 369
        Top = 37
        Width = 376
        Height = 106
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          280.458333333333300000
          976.312500000000000000
          97.895833333333330000
          994.833333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        Lines.Strings = (
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
          '')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QRMemoCmpnyNm: TgtQRMemo
      Left = 584
      Top = 100
      Width = 92
      Height = 150
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        396.875000000000000000
        1545.166666666667000000
        264.583333333333300000
        243.416666666666700000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = True
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Lato'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 8
    end
    object lblDelNote: TgtQRLabel
      Left = 57
      Top = 48
      Width = 187
      Height = 36
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        95.250000000000000000
        150.812500000000000000
        127.000000000000000000
        494.770833333333300000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Delivery Note'
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Lato'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 22
    end
    object qrmRegOffice: TQRMemo
      Left = 1527
      Top = 122
      Width = 232
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.395833333333330000
        4040.187500000000000000
        322.791666666666700000
        613.833333333333300000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Lato Light'
      Font.Style = []
      Lines.Strings = (
        'Registered address 1 Onslow Street London EC1N 8AS')
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object gtQRImage2: TgtQRImage
      Left = 19
      Top = 1023
      Width = 270
      Height = 33
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        87.312500000000000000
        50.270833333333330000
        2706.687500000000000000
        714.375000000000000000)
      AutoSize = True
      Picture.Data = {
        07544269746D617056670000424D566700000000000036000000280000000A01
        0000210000000100180000000000206700000000000000000000000000000000
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFB49492D9CAC9FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF692A26B49492FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF692A26B49492FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFE9E2E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF692A26B49492FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9CA
        C9D9CAC9ECE4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F2F1D9CAC9E3D7D6
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFD9CAC9D9CAC9ECE4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E2E3A78C90A78C90E9E2E3FFFF
        FFFFFFFFFFFFFFFFFFFFD3C6C7A78C90A78C90F4F1F1FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDED4D5A78C90A78C90DED4D5D3C6C7
        A78C90A78C90FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8B7B9A78C90A78C90DED4
        D5A78C90A78C90BDA9ABFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFBDA9ABA78C90B29A9DFFFFFFFFFFFFFFFFFFFFFFFFD3C6C7
        916F7464363C4F1A214F1A2164363C916F74D3C6C7FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9197BD161E7601035D00004B00
        004A293A7A2B3976586190DEDFE7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDA9AB
        A78C90BDA9ABFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFBDA9AB7A5358FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        E3D7D6D9CAC9D9CAC9E3D7D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFE3D7D6D9CAC9D9CAC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFE3D7D6D9CAC9E3D7D6FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF692A26B49492FFFFFFFFFFFFECE4E4D9CAC9D9
        CAC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFD9CAC9692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB49492723733692A
        26692A26692A268E5F5CD9CAC9692A268E5F5CFFFFFFFFFFFFFFFFFF8E5F5C8E
        5F5CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3D7D6723733692A26692A26
        85514EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F2
        F1A17977692A26692A26692A26692A267B4440C7AFADFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFB49492692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3C6C74F1A214F1A21D3C6C7FFFF
        FFFFFFFFFFFFFFFFFFFFE9E2E34F1A214F1A21A78C90FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF916F744F1A2159272EF4F1F1A78C90
        4F1A214F1A21FFFFFFFFFFFFFFFFFFFFFFFFDED4D54F1A214F1A216F444AFFFF
        FF916F744F1A2159272EF4F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFE9E2E34F1A214F1A21A78C90FFFFFFFFFFFFE9E2E37A53584F1A21
        4F1A214F1A214F1A214F1A214F1A214F1A214F1A217A5358F4F1F1FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFE2E4EC1923762A3B79404F86636F926C76926A
        748F666F8A4654814D597F555F7D777DABFFFFFFFFFFFFFFFFFFFFFFFF7A5358
        4F1A217A5358FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFBDA9AB4F1A217A5358FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECE4E4A17977723733
        692A26692A26692A26692A26723733AA8784ECE4E4FFFFFFFFFFFFFFFFFFFFFF
        FFB49492692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7
        AFAD7B4440692A26692A26692A26723733A17977F6F2F1FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFD0BCBB7B4440692A26692A26692A267B4440C7AFADD9CAC9692A
        26D9CAC9FFFFFFFFFFFFFFFFFF692A26B49492E3D7D68E5F5C692A26692A2669
        2A26723733B49492FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFD9CAC9692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAA8784692A26976C69E3D7
        D6FFFFFFE3D7D6B49492723733692A268E5F5CFFFFFFFFFFFFFFFFFF8E5F5C8E
        5F5CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA17977692A2685514EB49492
        B49492FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F2F18551
        4E692A26A17977D0BCBBD9CAC9C7AFAD7B4440692A26A17977FFFFFFFFFFFFFF
        FFFFFFFFFFB49492692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3C6C74F1A214F1A21D3C6C7FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF916F744F1A2159272EF4F1F1FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E2E34F1A214F1A21A78C90FFFFFFA78C90
        4F1A214F1A21FFFFFFFFFFFFFFFFFFF4F1F16F444A4F1A2159272EE9E2E3FFFF
        FFE9E2E34F1A214F1A21A78C90FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF916F744F1A214F1A21F4F1F1FFFFFFDED4D559272E4F1A214F1A21
        64363CB29A9DD3C6C7D3C6C7B29A9D64363C4F1A214F1A216F444AF4F1F1FFFF
        FFFFFFFFFFFFFFFFFFFFA4A8C07C8498A2A3AA7F8AAB6878A95062A14F619F4C
        5E9B48589344548D626D90636C876D6F743C4783FFFFFFFFFFFFFFFFFF7A5358
        4F1A217A5358FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFBDA9AB4F1A214F1A217A5358FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB49492692A26692A2685514E
        B49492D9CAC9D0BCBBB494927B4440692A26723733C7AFADFFFFFFFFFFFFFFFF
        FFB49492692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA1797769
        2A267B4440C7AFADD9CAC9D0BCBB976C69692A2685514EF6F2F1FFFFFFFFFFFF
        FFFFFFF6F2F1723733692A26B49492D9CAC9D9CAC9AA878472373385514E692A
        26D9CAC9FFFFFFFFFFFFFFFFFF692A2685514E692A268E5F5CD0BCBBD9CAC9C7
        AFAD85514E692A26A17977FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFD9CAC9692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECE4E4692A268E5F5CFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFE3D7D6692A268E5F5CFFFFFFFFFFFFFFFFFF8E5F5C8E
        5F5CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8E5F5C723733E3D7D6FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8E5F5C692A
        26C7AFADFFFFFFFFFFFFFFFFFFFFFFFFF6F2F185514E692A26D0BCBBFFFFFFFF
        FFFFFFFFFFB49492692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3C6C74F1A214F1A21D3C6C7FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFD3C6C74F1A214F1A21BDA9ABFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF916F744F1A214F1A21E9E2E3FFFFFFA78C90
        4F1A214F1A21FFFFFFFFFFFFFFFFFF9C7E824F1A214F1A21BDA9ABFFFFFFFFFF
        FFFFFFFF7A53584F1A2159272EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFF4F1F14F1A214F1A21916F74FFFFFFE9E2E359272E4F1A214F1A21B29A9D
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C7E824F1A214F1A217A5358FFFF
        FFFFFFFFFFFFFFE4E6EE36488A16278000007704028307058E0A079309069006
        048902017A00006D00006000005100035275767C50598EFFFFFFFFFFFF7A5358
        4F1A217A5358FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDA9
        AB4F1A214F1A214F1A217A5358FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAA8784692A26723733D9CAC9FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7AFAD723733692A26D0BCBBFFFFFFFFFF
        FFB49492692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD0BCBB692A2697
        6C69F6F2F1FFFFFFFFFFFFFFFFFFFFFFFFC7AFAD692A26976C69FFFFFFFFFFFF
        FFFFFFD0BCBB692A26B49492FFFFFFFFFFFFFFFFFFFFFFFFECE4E485514E692A
        26D9CAC9FFFFFFFFFFFFFFFFFF692A26692A26C7AFADFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF976C69692A26C7AFADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFD9CAC9692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9CAC9692A26D0BCBBFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF692A268E5F5CFFFFFFFFFFFFFFFFFF8E5F5C8E
        5F5CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8E5F5C8E5F5CFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3D7D6692A26976C
        69FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECE4E4692A2685514EFFFFFFFF
        FFFFFFFFFFB49492692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3C6C74F1A214F1A21D3C6C7FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7A53584F1A214F1A214F1A214F1A214F
        1A214F1A214F1A214F1A214F1A214F1A214F1A21916F74FFFFFFFFFFFFA78C90
        4F1A214F1A21FFFFFFFFFFFFD3C6C74F1A214F1A21916F74FFFFFFFFFFFFFFFF
        FFFFFFFFD3C6C74F1A214F1A214F1A214F1A214F1A214F1A214F1A214F1A214F
        1A214F1A214F1A214F1A21E9E2E3FFFFFF8661664F1A214F1A21BDA9ABFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C7E824F1A214F1A21BDA9
        ABFFFFFFFFFFFF20268600006F0503871F2DA3394EBA3D53C53F55C93E54C73B
        51C1364AB32F43A2273A900614700000500615634C587EC3C5D4FFFFFF7A5358
        4F1A217A5358FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDED4D55927
        2E4F1A214F1A214F1A217A5358FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFD0BCBB692A267B4440F6F2F1FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD0BCBB692A26B49492FFFFFFFFFF
        FFB49492692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7B4440723733F6
        F2F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8E5F5C692A26E3D7D6FFFFFF
        FFFFFFB49492692A26E3D7D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9CAC9692A
        26D9CAC9FFFFFFFFFFFFFFFFFF692A26AA8784FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFF6F2F1692A2685514EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFD9CAC9692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9CAC9692A26C7AFADFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF692A268E5F5CFFFFFFFFFFFFFFFFFF8E5F5C8E
        5F5CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8E5F5C8E5F5CFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB49492692A26D9CA
        C9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA17977692A26ECE4E4FF
        FFFFFFFFFFB49492692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3C6C74F1A214F1A21D3C6C7FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8B7B94F1A214F1A214F1A214F1A214F
        1A214F1A214F1A214F1A214F1A214F1A214F1A21E9E2E3FFFFFFFFFFFFA78C90
        4F1A214F1A21FFFFFFF4F1F164363C4F1A2164363CF4F1F1FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF7A53584F1A214F1A214F1A214F1A214F1A214F1A214F1A214F
        1A214F1A214F1A21916F74FFFFFFDED4D54F1A214F1A21916F74FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF64363C4F1A218661
        66FFFFFFC6C9D96979ABBBC4D9F7F7F7FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFEFEFEF9F8F8F1F0F0D9D7D7B6B3B28D8F945964852D3978FFFFFF7A5358
        4F1A217A5358FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDED4D559272E4F1A
        2159272E64363C4F1A217A5358FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF7B4440692A26D9CAC9FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9CAC9692A26B49492FFFFFFFFFF
        FFB49492692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFFECE4E4692A26A17977FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD0BCBB692A26B49492FFFFFF
        FFFFFFB49492692A26FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9CAC9692A
        26D9CAC9FFFFFFFFFFFFFFFFFF692A26B49492FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF976C69692A26F6F2F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFD9CAC9692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECE4E4692A2685514EFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFD9CAC9692A268E5F5CFFFFFFFFFFFFFFFFFF8E5F5C8E
        5F5CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8E5F5C8E5F5CFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF976C69692A26FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB49492692A26D9CAC9FF
        FFFFFFFFFFB49492692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3C6C74F1A214F1A21D3C6C7FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF64363C4F1A217A5358FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF64363C4F1A21866166FFFFFFFFFFFFFFFFFFA78C90
        4F1A214F1A21FFFFFF8661664F1A214F1A21DED4D5FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFBDA9AB4F1A214F1A21C8B7B9FFFFFFFFFFFFFFFFFFFFFFFFBD
        A9AB4F1A214F1A21D3C6C7FFFFFF9C7E824F1A214F1A21E9E2E3FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9C7E824F1A214F1A
        21FFFFFF6670B38898C96D82D65D78E34962E94B65EE4B64F04B65F14B65F14B
        64F04963EC4760E4435AD4364AB23C4F9B4757926B7490727481FFFFFF7A5358
        4F1A217A5358FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDED4D559272E4F1A215927
        2EDED4D57A53584F1A217A5358FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFD9CAC9692A26976C69FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9CAC9692A26B49492FFFFFFFFFF
        FFB49492692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFFD9CAC9692A26C7AFADFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F2F1692A26A17977FFFFFF
        FFFFFFB49492692A26FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9CAC9692A
        26D9CAC9FFFFFFFFFFFFFFFFFF692A26B49492FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFB49492692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFD9CAC9692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAA8784692A2685514ED0BC
        BBD9CAC9D0BCBBA17977723733692A268E5F5CFFFFFFFFFFFFFFFFFF8E5F5C8E
        5F5CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8E5F5C8E5F5CFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8E5F5C692A26FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7AFAD692A26D9CAC9FF
        FFFFFFFFFFB49492692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3C6C74F1A214F1A21916F74A78C
        90BDA9ABD3C6C7FFFFFFFFFFFFFFFFFFFFFFFFBDA9AB4F1A214F1A21D3C6C7FF
        FFFFFFFFFFFFFFFFBDA9AB4F1A214F1A21D3C6C7FFFFFFFFFFFFFFFFFFA78C90
        4F1A214F1A21B29A9D4F1A214F1A21B29A9DFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF64363C4F1A217A5358FFFFFFFFFFFFFFFFFFFFFFFF64
        363C4F1A217A5358FFFFFFFFFFFF7A53584F1A217A5358FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF4F1A214F1A214F1A214F1A214F1A214F1A214F1A
        21E9E2E3181695140CA01F16CA261EE32A25EB2C2BED2D2DEE2C29EE2A23EE28
        1DEE271CEC261BE72219DB1C12B90503890000680B1B6C6B72859EA2BA7A5358
        4F1A217A5358FFFFFFFFFFFFFFFFFFFFFFFFDED4D559272E4F1A2159272EDED4
        D5FFFFFF7A53584F1A217A5358FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFB49492692A26C7AFADFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9CAC9692A26B49492FFFFFFFFFF
        FFB49492692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFFD9CAC9692A26D9CAC9FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF692A268E5F5CFFFFFF
        FFFFFFB49492692A26FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9CAC9692A
        26D9CAC9FFFFFFFFFFFFFFFFFF692A26B49492FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFB49492692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFD9CAC9692A26692A26692A26692A26692A26692A26
        692A268E5F5CB49492F6F2F1FFFFFFFFFFFFFFFFFFFFFFFFBDA1A07B4440692A
        26692A26692A26A17977ECE4E4692A268E5F5CFFFFFFFFFFFFFFFFFF8E5F5C8E
        5F5CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8E5F5C8E5F5CFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA17977692A26F6F2
        F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB49492692A26D9CAC9FF
        FFFFFFFFFFB49492692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3C6C74F1A214F1A214F1A214F1A
        214F1A214F1A2159272EB29A9DFFFFFFFFFFFFFFFFFF59272E4F1A21916F74FF
        FFFFFFFFFFFFFFFF6F444A4F1A217A5358FFFFFFFFFFFFFFFFFFFFFFFFA78C90
        4F1A214F1A214F1A214F1A214F1A214F1A217A5358DED4D5FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFBDA9AB4F1A214F1A21E9E2E3FFFFFFFFFFFFD3C6C74F
        1A214F1A21C8B7B9FFFFFFFFFFFF7A53584F1A21A78C90FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF4F1A214F1A214F1A214F1A214F1A214F1A214F1A
        21D3C6C7313CAB5F76D07993EC849FF68BA6F891AAF993ACF98EA7F887A1F882
        9DF87C98F77B96F67994F3728AE36277C25365A54656903D4B808C92B57A5358
        4F1A217A5358FFFFFFFFFFFFFFFFFFDED4D559272E4F1A214F1A21D3C6C7FFFF
        FFFFFFFF7A53584F1A217A5358FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF976C69692A26ECE4E4FFFFFFFFFFFFFFFFFFFFFFFF
        C7AFAD8E5F5C8E5F5C8E5F5C8E5F5C8E5F5C85514E692A26B49492FFFFFFFFFF
        FFB49492692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFFD9CAC9692A26B49492FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECE4E4692A26AA8784FFFFFF
        FFFFFFB49492692A26FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9CAC9692A
        26D9CAC9FFFFFFFFFFFFFFFFFF692A26B49492FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFB49492692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFD9CAC9692A2685514E8E5F5C8E5F5C8E5F5C8E5F5C
        8E5F5C723733692A2685514EF6F2F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF692A268E5F5CFFFFFFFFFFFFFFFFFF8E5F5C8E
        5F5CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8E5F5C8E5F5CFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDA1A0692A26C7AF
        ADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF85514E692A26FFFFFFFF
        FFFFFFFFFFB49492692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3C6C74F1A214F1A216F444A7A53
        5864363C4F1A214F1A214F1A219C7E82FFFFFFFFFFFFA78C904F1A214F1A21E9
        E2E3FFFFFFD3C6C74F1A214F1A21BDA9ABFFFFFFFFFFFFFFFFFFFFFFFFA78C90
        4F1A214F1A217A53587A535864363C4F1A214F1A2159272EE9E2E3FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFF4F1F159272E4F1A21916F74FFFFFFFFFFFF7A53584F
        1A2164363CFFFFFFFFFFFFFFFFFF7A53584F1A21A78C90FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFD3C6C7D3C6C7D3C6C7D3C6C7D3C6C7D3C6C7D3C6
        C7F4F1F17F90D3FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFEFEFEF4F4F4DEDCDBBCB9B8908D8C858BAA7A5358
        4F1A217A5358FFFFFFFFFFFFF4F1F159272E4F1A214F1A21BDA9ABFFFFFFFFFF
        FFFFFFFF7A53584F1A217A5358FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF8E5F5C692A26FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        C7AFAD8E5F5C8E5F5C8E5F5C8E5F5C8E5F5C8E5F5C8E5F5CC7AFADFFFFFFFFFF
        FFB49492692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFFF6F2F1692A268E5F5CFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDA1A0692A26C7AFADFFFFFF
        FFFFFFB49492692A26FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9CAC9692A
        26D9CAC9FFFFFFFFFFFFFFFFFF692A26B49492FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF85514E692A26FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFD9CAC9692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFF6F2F1A17977692A268E5F5CFFFFFFFFFFFFF6F2F1E3D7D6FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFF6F2F1692A26AA8784FFFFFFFFFFFFFFFFFF8E5F5C69
        2A26E3D7D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8E5F5C8E5F5CFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F2F17237337B44
        40F6F2F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD0BCBB692A26A17977FFFFFFFF
        FFFFFFFFFFB49492692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3C6C74F1A214F1A21D3C6C7FFFF
        FFFFFFFFE9E2E36F444A4F1A214F1A21E9E2E3FFFFFFF4F1F159272E4F1A21A7
        8C90FFFFFF8661664F1A2164363CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA78C90
        4F1A214F1A21FFFFFFFFFFFFFFFFFFD3C6C759272E4F1A21866166FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFA78C904F1A214F1A21F4F1F1E9E2E34F1A214F
        1A21BDA9ABFFFFFFFFFFFFFFFFFF7A53584F1A21866166FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF2622B52424C94156EA708CF696AEF9B0C4FCB8CBFDA1B8FB7E9AF75B
        76F33543EF2A23EE271CEC2219DB1910B10503861F31809591908A90B07A5358
        4F1A217A5358FFFFFFF4F1F16F444A4F1A214F1A21BDA9ABFFFFFFFFFFFFFFFF
        FFFFFFFF7A53584F1A217A5358FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF8E5F5C692A26F6F2F1FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFB49492692A26A17977FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF976C69692A26D9
        CAC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F2F17B4440723733F6F2F1FFFFFF
        FFFFFFB49492692A26FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9CAC9692A
        26D9CAC9FFFFFFFFFFFFFFFFFF692A26976C69FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFD9CAC9692A26976C69FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFD9CAC9692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF7B4440692A26ECE4E4FFFFFF976C69723733D9CAC9FFFF
        FFFFFFFFFFFFFFFFFFFFA17977692A26C7AFADFFFFFFFFFFFFFFFFFF8E5F5C72
        3733723733BDA1A0FFFFFFFFFFFFFFFFFFFFFFFF8E5F5C8E5F5CFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB49492692A
        2685514EF6F2F1FFFFFFFFFFFFFFFFFFD9CAC9723733723733ECE4E4FFFFFFFF
        FFFFFFFFFFB49492692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3C6C74F1A214F1A21D3C6C7FFFF
        FFFFFFFFFFFFFFF4F1F14F1A214F1A21B29A9DFFFFFFFFFFFF9C7E824F1A2159
        272EDED4D54F1A214F1A21BDA9ABFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA78C90
        4F1A214F1A21FFFFFFFFFFFFFFFFFFFFFFFFBDA9AB4F1A214F1A21FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFF4F1F159272E4F1A21A78C90916F744F1A2164
        363CFFFFFFFFFFFFFFFFFFFFFFFF9C7E824F1A2159272EF4F1F1FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF5F68CE272CCB506AED8EA7F8BDCEFCD6E3FCDFE9FDC7D7FDA1B7FA71
        8DF63F52F12C29EE271CEC2319DC1A10B2050388081774203073FFFFFF7A5358
        4F1A217A5358F4F1F16F444A4F1A214F1A21BDA9ABFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF7A53584F1A217A5358FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFB49492692A26D0BCBBFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFB49492692A26692A26976C69ECE4E4FFFFFFFFFFFFFFFFFFECE4E472373372
        3733D9CAC9FFFFFFFFFFFFFFFFFFECE4E485514E692A26BDA1A0FFFFFFFFFFFF
        FFFFFFB49492692A26FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9CAC9692A
        26D9CAC9FFFFFFFFFFFFFFFFFF692A26692A26976C69ECE4E4FFFFFFFFFFFFFF
        FFFFD9CAC9723733692A26E3D7D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFD9CAC9692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFB49492692A26D9CAC9FFFFFFE3D7D685514E692A268551
        4EAA8784A179777B4440692A26976C69FFFFFFFFFFFFFFFFFFFFFFFF8E5F5C8E
        5F5CC7AFAD692A267237337237338E5F5C692A26692A26692A26692A26692A26
        D9CAC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAA87
        84692A26723733976C69AA878485514E692A26723733E3D7D6FFFFFFFFFFFFB4
        9492692A26692A26692A26692A26692A268E5F5CFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3C6C74F1A214F1A21D3C6C7FFFF
        FFFFFFFFFFFFFFFFFFFF7A53584F1A21A78C90FFFFFFFFFFFFE9E2E34F1A214F
        1A2164363C4F1A2159272EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA78C90
        4F1A214F1A21FFFFFFFFFFFFFFFFFFFFFFFFF4F1F14F1A214F1A21D3C6C7FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF916F744F1A2159272E4F1A214F1A21A7
        8C90FFFFFFFFFFFFFFFFFFFFFFFFDED4D54F1A214F1A21A78C90FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFC2C7EAE8EEF8CBD9FAD6E3FCE8EFFDF5F9FEFAFBFFEFF4FED7E4FCBA
        CCFD92ACF9819CF77A96F57690EC697ECF8494C48D96AF404C80FFFFFF7A5358
        4F1A216F444A6F444A4F1A214F1A21BDA9ABFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF7A53584F1A217A5358FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFD0BCBB692A26A17977FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFB49492692A26BDA1A0723733692A267B4440D9CAC9FFFFFFFFFFFFE3D7D672
        3733692A2685514EAA87848E5F5C692A26692A26AA8784FFFFFFFFFFFFFFFFFF
        FFFFFFB49492692A26FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD9CAC9692A
        26D9CAC9FFFFFFFFFFFFFFFFFF692A26AA878485514E692A268E5F5CAA878485
        514E692A26692A26C7AFADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFD9CAC9692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFB49492692A26D9CAC9FFFFFFFFFFFFFFFFFFC7AFAD976C
        698E5F5C8E5F5C976C69C7AFADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7AFADC7
        AFADFFFFFFD9CAC9A179778E5F5CC7AFADB494927B44407B4440B49492B49492
        ECE4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFD9CAC9A179778E5F5C8E5F5C8E5F5CBDA1A0F6F2F1FFFFFFFFFFFFFFFFFFD9
        CAC9B494928E5F5C692A26A17977B49492C7AFADFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3C6C74F1A214F1A21D3C6C7FFFF
        FFFFFFFFFFFFFFFFFFFF64363C4F1A21A78C90FFFFFFFFFFFFFFFFFF916F744F
        1A214F1A214F1A21A78C90FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA78C90
        4F1A214F1A21FFFFFFFFFFFFFFFFFFFFFFFFD3C6C74F1A214F1A21E9E2E3FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E2E34F1A214F1A214F1A2159272EF4
        F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7A53584F1A2159272EDED4D5FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF866166DED4D5FFFF
        FFFFFFFFFFFFFF5566D2A6BBF5E0EAFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFDFDFDB0BDDDAEB6CBB2AFAE8E93B5FFFFFF7A5358
        4F1A214F1A214F1A214F1A21BDA9ABFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF7A53584F1A217A5358FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF723733723733ECE4E4FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFD9CAC9B49492ECE4E4F6F2F1B494928E5F5CE3D7D6FFFFFFFFFFFFFFFFFFF6
        F2F1BDA1A08E5F5C8E5F5C8E5F5CA17977D9CAC9FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFD9CAC9B49492FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECE4E4B494
        92ECE4E4FFFFFFFFFFFFFFFFFFB49492D9CAC9FFFFFFC7AFAD8E5F5C8E5F5C8E
        5F5CAA8784ECE4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFD9CAC9692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF8E5F5C692A26E3D7D6FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8E5F5C8E5F5CFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFB49492692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3C6C74F1A214F1A21D3C6C7FFFF
        FFFFFFFFFFFFFFB29A9D4F1A214F1A21D3C6C7FFFFFFFFFFFFFFFFFFDED4D54F
        1A214F1A2159272EF4F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA78C90
        4F1A214F1A21FFFFFFFFFFFFFFFFFFF4F1F16F444A4F1A2164363CFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF916F744F1A214F1A219C7E82FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDED4D559272E4F1A2159272ED3C6C7
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F1F16F444A4F1A2159272EE9E2
        E3FFFFFFFFFFFFD9DBF2455BDB7F99F3AEC2FBC9D9FDD0DFFCBACCFD93ACF967
        84F43B4CEE2A24EA2319DD1C12BC06048C4E609E3B4589FFFFFFFFFFFF7A5358
        4F1A214F1A214F1A21916F74FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF7A53584F1A217A5358FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFBDA1A0692A268E5F5CFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F2F1D0BCBBFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFD9CAC9692A26D9CAC9FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFC7AFAD692A267B4440FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8E5F5C8E5F5CFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFD9CAC9692A26C7AFADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3C6C74F1A214F1A21916F74A78C
        90A78C906F444A4F1A214F1A216F444AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7A
        53584F1A21916F74FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA78C90
        4F1A214F1A21A78C90A78C90916F7459272E4F1A214F1A21BDA9ABFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3C6C74F1A214F1A21E9E2E3FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8B7B959272E4F1A214F1A21
        7A5358C8B7B9E9E2E3FFFFFFD3C6C79C7E8259272E4F1A214F1A21916F74FFFF
        FFFFFFFFFFFFFFFFFFFFC2C7F0C2D1F7B0C3F9AFC3FBA6BCFB8BA5F86D89F44E
        68F1303AE82D32E0445CD6384CB55568A949569BFFFFFFFFFFFFFFFFFF7A5358
        4F1A214F1A21916F74FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF7A53584F1A217A5358FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8E5F5C692A268E5F5CF6F2F1FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECE4E485514E692A26C7AFADFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFD9CAC9692A26BDA1A0D9CAC9D9CAC9D9CAC9D9CAC9
        B49492976C69692A26723733E3D7D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAA8784AA8784FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFF6F2F1692A2685514EECE4E4ECE4E4AA8784F6F2F1FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3C6C74F1A214F1A214F1A214F1A
        214F1A214F1A214F1A216F444ADED4D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3
        C6C74F1A21E9E2E3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA78C90
        4F1A214F1A214F1A214F1A214F1A214F1A214F1A219C7E82FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7A5358916F74FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDED4D564363C4F1A21
        4F1A214F1A214F1A214F1A214F1A214F1A214F1A214F1A21A78C90FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFC5CAF091A6EDE1EAFBFFFFFFFFFFFFFFFFFFFF
        FFFFFEFEFEFBFAFAF4F3F3DEDCDB5A66A0FFFFFFFFFFFFFFFFFFFFFFFF7A5358
        4F1A21916F74FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF7A53584F1A217A5358FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F2F1976C69692A26723733AA8784
        D9CAC9F6F2F1ECE4E4D0BCBBA17977692A26692A26B49492FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFD9CAC9692A26692A26692A26692A26692A26692A26
        692A26692A268E5F5CE3D7D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFC7AFAD692A26692A26692A26723733D0BCBBFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDED4D57A53587A53587A53587A53
        587A5358A78C90D3C6C7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFBDA9ABFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDA9AB
        7A53587A53587A53587A53587A5358A78C90E9E2E3FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3C6C7E9E2E3FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDA9AB
        7A53584F1A214F1A214F1A214F1A2164363C9C7E82E9E2E3FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF868EDF3B44CF4B62D2465ECF41
        57C84459BE5A6EBE5F6DB5CBCDDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7A5358
        916F74FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF9C7E827A53589C7E82FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7AFAD7B4440692A26
        692A26692A26692A26692A26692A268E5F5CD9CAC9FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFF6F2F1D9CAC9D9CAC9D9CAC9D9CAC9D9CAC9D9CAC9
        D9CAC9F6F2F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFECE4E4BDA1A0D0BCBBFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFE9E2E3DED4D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9EBF7BB
        C0E6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8B7B9
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3D7D6
        C7AFADB49492B49492C7AFADECE4E4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        0000}
      Stretch = True
    end
    object qrmRegNumber: TQRMemo
      Left = 231
      Top = 1056
      Width = 540
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.395833333333330000
        611.187500000000000000
        2794.000000000000000000
        1428.750000000000000000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Lato Light'
      Font.Style = []
      Lines.Strings = (
        
          'Service Graphics (A trading division of Paragon Group Ltd), Regi' +
          'stered in England & Wales Company Registration No: 00551336')
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
    object QRMemo1: TQRMemo
      Left = 539
      Top = 1072
      Width = 232
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.395833333333330000
        1426.104166666667000000
        2836.333333333333000000
        613.833333333333300000)
      Alignment = taRightJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Lato Light'
      Font.Style = []
      Lines.Strings = (
        'Registered address 1 Onslow Street London EC1N 8AS')
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 7
    end
  end
  object PODelivSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT Delivery_Detail.Purchase_Order,'
      #9'Delivery_Detail.Line, '
      #9'Delivery_Detail.Delivery_no, '
      #9'Delivery_Detail.Ad_hoc_Address, '
      #9'Delivery_Detail.Supplier, '
      #9'Delivery_Detail.Branch_no, '
      #9'Delivery_Detail.Rep, '
      #9'Delivery_Detail.Qty_to_Deliver, '
      #9'Delivery_Detail.Qty_Delivered, '
      #9'Delivery_Detail.Qty_Invoiced, '
      #9'Delivery_Detail.Branch_No0, '
      #9'Delivery_Detail.Customer, '
      #9'Delivery_Detail.Is_Updated, '
      #9'Delivery_Detail.No_Of_Boxes, '
      #9'Delivery_Detail.Delivery_Instructions, '
      #9'Delivery_Detail.Deliver_via_Company,'
      #9'Delivery_Detail.Date_Deliv_Actual, '
      #9'Delivery_Detail.Delivery_to_Stock,'
      #9'Delivery_Detail.Delivery_note_printed,'
      '        Delivery_Detail.contact_name,'
      '        Delivery_Detail.date_point,'
      #9'Purchase_OrderLine.Cust_Order_No,'
      #9'Purchase_OrderLine.Customers_Desc, '
      #9'Purchase_OrderLine.Quantity, '
      #9'Purchase_OrderLine.Customer as iCustomer, '
      #9'Purchase_OrderLine.Branch_no as iBranch, '
      #9'Purchase_OrderLine.Number_Instructions,'
      '  Purchase_OrderLine.Original_Order,'
      '  Purchase_OrderLine.Original_OrderLine,   '
      #9'Form_Reference.Form_Reference_ID, '
      #9'Form_Reference.Form_Reference_Descr'
      'FROM Form_Reference '
      #9'RIGHT JOIN (Purchase_OrderLine '
      #9'INNER JOIN Delivery_Detail ON '
      #9'(Purchase_OrderLine.Line = Delivery_Detail.Line) AND '
      
        #9'(Purchase_OrderLine.Purchase_Order = Delivery_Detail.Purchase_O' +
        'rder)) ON '
      
        #9'Form_Reference.Form_Reference = Purchase_OrderLine.Form_Referen' +
        'ce'
      'WHERE'
      '('
      '(Delivery_Detail.Purchase_Order = :Purchase_Order ) AND'
      '(Delivery_Detail.Line = :Line) and'
      '(Delivery_Detail.Delivery_no = :Delivery_no)'
      ')'
      'ORDER BY Delivery_Detail.Line, Delivery_Detail.Delivery_no'
      ''
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
    Left = 896
    Top = 176
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Purchase_Order'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Delivery_no'
        ParamType = ptUnknown
      end>
  end
  object PODelivSRC: TDataSource
    DataSet = PODelivSQL
    Left = 896
    Top = 232
  end
  object CustomerSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Customer.Name as Customer_Name,'
      'Building_no_name,'
      'Street,'
      'Locale,'
      'Town,'
      'Postcode,'
      'Delivery_Narrative,'
      'Account_Code,'
      'Customer_Branch.Name as Branch_Name,'
      'Customer_Branch.Use_Branch_Name'
      'from'
      '  Customer_Branch, Customer'
      'where'
      '  ((Customer_Branch.Customer = :Customer) and'
      '   (Branch_no = :Branch_no)) and'
      '  Customer_Branch.Customer = Customer.Customer'
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 888
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Customer'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Branch_no'
        ParamType = ptInput
      end>
  end
  object AdhocSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Name,'
      '  Building_no_name,'
      '  Street,'
      '  Locale,'
      '  Town,'
      '  Postcode,'
      '  Delivery_Narrative'
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
  object RepSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Name,'
      'Building_no_name,'
      'Street,'
      'Locale,'
      'Town,'
      'Postcode'
      'from Rep'
      'where Rep = :Rep'
      ' ')
    Left = 816
    Top = 24
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Rep'
        ParamType = ptInput
      end>
  end
  object AddressSRC: TDataSource
    DataSet = CustomerSQL
    Left = 888
    Top = 24
  end
  object SupplierSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Supplier.Name as Supplier_Name,'
      'Building_no_name,'
      'Street,'
      'Locale,'
      'Town,'
      'Postcode'
      'from Supplier_Branch, Supplier'
      'where'
      '((Supplier_Branch.Supplier = :Supplier) and'
      ' (Supplier_Branch.Branch_no = :Branch_no)) and'
      '(Supplier_Branch.Supplier = Supplier.Supplier)'
      ' '
      ' '
      ' ')
    Left = 560
    Top = 32
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Supplier'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'Branch_no'
        ParamType = ptInput
      end>
  end
  object GetNarrSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select Narrative_Text'
      'From Narrative_Line'
      'Where (Narrative = :Narrative)'
      'Order By Narrative_Line')
    Left = 816
    Top = 136
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Narrative'
        ParamType = ptInput
      end>
  end
  object CompSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Company.Name as Company_Name,'
      'Building_no_name,'
      'Street,'
      'Locale,'
      'Town,'
      'Postcode,'
      'Phone,'
      'Fax_Number,'
      'Email,'
      'Delivery_Narrative'
      'from Company'
      'where Company = 1'
      ' '
      ' '
      ' '
      ' ')
    Left = 816
    Top = 192
  end
  object CustDetsSQL: TQuery
    DatabaseName = 'PB'
    DataSource = PODelivSRC
    SQL.Strings = (
      'select Customer.Name as Customer_Name,'
      'Building_no_name,'
      'Street,'
      'Locale,'
      'Town,'
      'Postcode,'
      'Delivery_Narrative,'
      'Account_Code'
      'from'
      '  Customer_Branch, Customer'
      'where'
      '  ((Customer_Branch.Customer = :iCustomer) and'
      '   (Branch_no = :iBranch)) and'
      '  Customer_Branch.Customer = Customer.Customer'
      ' '
      ' '
      ' ')
    Left = 904
    Top = 296
    ParamData = <
      item
        DataType = ftInteger
        Name = 'iCustomer'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'iBranch'
        ParamType = ptInput
      end>
  end
  object GetPickDataSource: TDataSource
    DataSet = GetPickSQL
    Left = 409
    Top = 272
  end
  object GetPickSQL: TQuery
    DatabaseName = 'PB '
    SQL.Strings = (
      'select *'
      'from Picking_Detail'
      'where Purchase_Order = :Purchase_Order and'
      '  line = :LineNo'
      '')
    Left = 321
    Top = 296
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'LineNo'
        ParamType = ptUnknown
      end>
  end
  object GetPickCallOffSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      
        'SELECT Picking_Detail.*, Delivery_Detail.Stock_Location_Desc, De' +
        'livery_Location.Description'
      'FROM (Delivery_Detail RIGHT JOIN Delivery_Location ON'
      
        '  (Delivery_Detail.Delivery_no = Delivery_Location.Delivery_no) ' +
        'AND'
      '  (Delivery_Detail.Line = Delivery_Location.Line) AND'
      
        '  (Delivery_Detail.Purchase_Order = Delivery_Location.Purchase_O' +
        'rder))'
      
        '  RIGHT JOIN Picking_Detail ON (Delivery_Location.Location_no = ' +
        'Picking_Detail.Location_no) AND'
      
        '  (Delivery_Location.Delivery_no = Picking_Detail.Delivery_no) A' +
        'ND'
      '  (Delivery_Location.Line = Picking_Detail.Line) AND'
      
        '  (Delivery_Location.Purchase_Order = Picking_Detail.Purchase_Or' +
        'der)'
      'where Picking_Detail.Purchase_Order = :Purchase_order and'
      'Picking_Detail.Line = :Line and'
      'Picking_Detail.CallOff_Delivery = :Delivery_no and'
      'Calloff_order = :calloff_order and'
      'Calloff_line = :Calloff_Line'
      'order by Delivery_Location.Description'
      ''
      ' '
      ' '
      ' '
      ' ')
    Left = 360
    Top = 60
    ParamData = <
      item
        DataType = ftFloat
        Name = 'Purchase_order'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Line'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Delivery_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'calloff_order'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Calloff_Line'
        ParamType = ptUnknown
      end>
  end
  object gtQRFilters1: TgtQRFilters
    HTML.Author = 'Pragnaan'
    HTML.Keywords = 'gtQrFilters'
    HTML.ImageDir = 'Images'
    PDF.Author = 'Pragnaan'
    PDF.Keywords = 'QuickReport, Export, Filters'
    RTF.Author = 'Pragnaan'
    RTF.Keywords = 'QuickReport, Export, Filters'
    RTF.ImagePixelFormat = pf32bit
    RTF.ExportImageFormat = ifBMP
    Text.XScaleFactor = 1.000000000000000000
    VisibleFilters = [fkHTML, fkPDF, fkRTF, fkExcel, fkText, fkGIF, fkJPEG, fkBMP, fkEMF, fkWMF]
    Left = 584
    Top = 144
  end
end
