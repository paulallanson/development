object PBRPDelivFrm: TPBRPDelivFrm
  Left = 6
  Top = 126
  Width = 812
  Height = 612
  HorzScrollBar.Position = 342
  HorzScrollBar.Range = 1200
  VertScrollBar.Range = 2000
  AutoScroll = False
  Caption = 'PBRPDelivFrm'
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
    Left = 8
    Top = 16
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
      100
      2970
      500
      2100
      50
      50
      0)
    PrinterSettings.Copies = 1
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.OutputBin = Auto
    PrintIfEmpty = True
    SnapToGrid = True
    Units = MM
    Zoom = 100
    object QRBand1: TQRSubDetail
      Left = 19
      Top = 189
      Width = 756
      Height = 482
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
        1275.29166666667
        2000.25)
      Master = PBDelivQuickReport
      DataSet = PODelivSQL
      PrintBefore = False
      PrintIfEmpty = True
      object Accountlbl: TPsQRLabel
        Left = 568
        Top = 154
        Width = 101
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.5
          1502.83333333333
          407.458333333333
          267.229166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'XXXXXXXXXX'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object PONumberLbl: TPsQRLabel
        Left = 568
        Top = 187
        Width = 101
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.5
          1502.83333333333
          494.770833333333
          267.229166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'XXXXXXXXXX'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object DateLbl: TPsQRLabel
        Left = 568
        Top = 90
        Width = 97
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.5
          1502.83333333333
          238.125
          256.645833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'XX/XX/XXXX'
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
      object BoxesLbl: TPsQRLabel
        Left = 648
        Top = 305
        Width = 67
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.5
          1714.5
          806.979166666667
          177.270833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NNNNNN'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QtyOrderedLbl: TPsQRLabel
        Left = 16
        Top = 305
        Width = 78
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.5
          42.3333333333333
          806.979166666667
          206.375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NNNNNNN'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object OrderRefLbl: TPsQRLabel
        Left = 568
        Top = 58
        Width = 78
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.5
          1502.83333333333
          153.458333333333
          206.375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'XXXXXXX'
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
      object YourRefLbl: TPsQRLabel
        Left = 568
        Top = 122
        Width = 122
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.5
          1502.83333333333
          322.791666666667
          322.791666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'XXXXXXXXXXX'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QuantityLbl: TPsQRLabel
        Left = 513
        Top = 433
        Width = 78
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.5
          1357.3125
          1145.64583333333
          206.375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NNNNNNN'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object DescLbl: TPsQRLabel
        Left = 136
        Top = 436
        Width = 301
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.5
          359.833333333333
          1153.58333333333
          796.395833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRDBText2: TPsQRDBText
        Left = 567
        Top = 123
        Width = 178
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.5
          1500.1875
          325.4375
          470.958333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = PODelivSQL
        DataField = 'Cust_Order_no'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRDBText3: TPsQRDBText
        Left = 568
        Top = 59
        Width = 107
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.5
          1502.83333333333
          156.104166666667
          283.104166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = PODelivSQL
        DataField = 'Purchase_Order'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRDBText4: TPsQRDBText
        Left = 16
        Top = 305
        Width = 57
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.5
          42.3333333333333
          806.979166666667
          150.8125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = PODelivSQL
        DataField = 'Quantity'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRDBText5: TPsQRDBText
        Left = 513
        Top = 305
        Width = 100
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.5
          1357.3125
          806.979166666667
          264.583333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = PODelivSQL
        DataField = 'Qty_to_Deliver'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRDBText6: TPsQRDBText
        Left = 136
        Top = 305
        Width = 345
        Height = 45
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          119.0625
          359.833333333333
          806.979166666667
          912.8125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = PODelivSQL
        DataField = 'Customers_Desc'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object AddressMemo: TPsQRMemo
        Left = 32
        Top = 23
        Width = 331
        Height = 129
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          341.3125
          84.6666666666667
          60.8541666666667
          875.770833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
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
      object Account: TPsQRDBText
        Left = 568
        Top = 154
        Width = 96
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.5
          1502.83333333333
          407.458333333333
          254)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = CustDetsSQL
        DataField = 'Account_Code'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object DelInstructMemo: TPsQRMemo
        Left = 136
        Top = 408
        Width = 561
        Height = 41
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          108.479166666667
          359.833333333333
          1079.5
          1484.3125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
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
        FontSize = 12
      end
      object FormRefLbl: TPsQRLabel
        Left = 136
        Top = 352
        Width = 69
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.5
          359.833333333333
          931.333333333334
          182.5625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Reference:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object FormRefDescLbl: TPsQRLabel
        Left = 136
        Top = 376
        Width = 80
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.5
          359.833333333333
          994.833333333333
          211.666666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Description:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object DeliveryDateLbl: TPsQRLabel
        Left = 568
        Top = 91
        Width = 105
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.5
          1502.83333333333
          240.770833333333
          277.8125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'DeliveryDateLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRLabel1: TPsQRLabel
        Left = 32
        Top = 0
        Width = 113
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.5
          84.6666666666667
          0
          298.979166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Delivery Address'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object lblDelNote: TPsQRLabel
        Left = 569
        Top = 0
        Width = 93
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.5
          1505.47916666667
          0
          246.0625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Delivery Note'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRLabel3: TPsQRLabel
        Left = 432
        Top = 155
        Width = 95
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.5
          1143
          410.104166666667
          251.354166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Account Code'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRLabel4: TPsQRLabel
        Left = 432
        Top = 123
        Width = 92
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.5
          1143
          325.4375
          243.416666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Customer Ref'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRLabel5: TPsQRLabel
        Left = 432
        Top = 59
        Width = 85
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.5
          1143
          156.104166666667
          224.895833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Delivery No.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRLabel6: TPsQRLabel
        Left = 432
        Top = 91
        Width = 93
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.5
          1143
          240.770833333333
          246.0625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Delivery Date'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRLabel7: TPsQRLabel
        Left = 432
        Top = 187
        Width = 53
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.5
          1143
          494.770833333333
          140.229166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Job No.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRLabel8: TPsQRLabel
        Left = 16
        Top = 277
        Width = 65
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.5
          42.3333333333333
          732.895833333333
          171.979166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Order Qty'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRLabel9: TPsQRLabel
        Left = 136
        Top = 277
        Width = 73
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.5
          359.833333333333
          732.895833333333
          193.145833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Description'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRLabel10: TPsQRLabel
        Left = 512
        Top = 277
        Width = 80
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.5
          1354.66666666667
          732.895833333333
          211.666666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Delivery Qty'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRLabel11: TPsQRLabel
        Left = 648
        Top = 277
        Width = 81
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.5
          1714.5
          732.895833333333
          214.3125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'No. of Boxes'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRLabel2: TPsQRLabel
        Left = 136
        Top = 458
        Width = 128
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.5
          359.833333333333
          1211.79166666667
          338.666666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Picking Information'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
    end
    object QRBand2: TQRSubDetail
      Left = 19
      Top = 671
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
        74.0833333333333
        2000.25)
      Master = PBDelivQuickReport
      DataSet = PBPODM.GetPickCallOffSQL
      PrintBefore = False
      PrintIfEmpty = True
      object QRShape1: TPsQRShape
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
          60.8541666666667
          1185.33333333333
          0
          235.479166666667)
        Shape = qrsRectangle
      end
      object QRLabel13: TPsQRLabel
        Left = 136
        Top = 0
        Width = 73
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.5
          359.833333333333
          0
          193.145833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRLabel13'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRLabel14: TPsQRLabel
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
          63.5
          931.333333333333
          0
          132.291666666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'QRLabel14'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
    end
    object QRBand3: TQRBand
      Left = 19
      Top = 699
      Width = 756
      Height = 219
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
        579.4375
        2000.25)
      BandType = rbPageFooter
      object QRLabel12: TPsQRLabel
        Left = 16
        Top = 14
        Width = 39
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.5
          42.3333333333333
          37.0416666666667
          103.1875)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Name'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRShape2: TPsQRShape
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
          60.8541666666667
          232.833333333333
          42.3333333333333
          661.458333333333)
        Shape = qrsHorLine
      end
      object QRShape3: TPsQRShape
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
          60.8541666666667
          232.833333333333
          148.166666666667
          661.458333333333)
        Shape = qrsHorLine
      end
      object QRLabel15: TPsQRLabel
        Left = 16
        Top = 54
        Width = 44
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.5
          42.3333333333333
          142.875
          116.416666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Signed'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRLabel16: TPsQRLabel
        Left = 16
        Top = 102
        Width = 31
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.5
          42.3333333333333
          269.875
          82.0208333333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Date'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRShape4: TPsQRShape
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
          60.8541666666667
          232.833333333333
          275.166666666667
          396.875)
        Shape = qrsHorLine
      end
      object lbldelInst: TPsQRLabel
        Left = 369
        Top = 14
        Width = 132
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.5
          976.3125
          37.0416666666667
          349.25)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Delivery Instructions'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object DeliveryMemo: TPsQRMemo
        Left = 369
        Top = 37
        Width = 385
        Height = 168
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          444.5
          976.3125
          97.8958333333333
          1018.64583333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsItalic]
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
        FontSize = 11
      end
    end
    object QRMemoCmpnyNm: TPsQRMemo
      Left = 496
      Top = 12
      Width = 99
      Height = 150
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        396.875
        1312.33333333333
        31.75
        261.9375)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = True
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Garamond'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
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
  object PsQRFilters1: TPsQRFilters
    HTML.Author = 'Pragnaan'
    HTML.Keywords = 'PsQrFilters'
    HTML.ImageDir = 'Images'
    PDF.Author = 'Pragnaan'
    PDF.Keywords = 'QuickReport, Export, Filters'
    RTF.Author = 'Pragnaan'
    RTF.Keywords = 'QuickReport, Export, Filters'
    RTF.ExportImageFormat = ifBMP
    Text.XScaleFactor = 1
    VisibleFilters = [fkHTML, fkPDF, fkRTF, fkGIF, fkJPEG, fkBMP, fkEMF, fkWMF]
    Left = 250
    Top = 2
  end
end
