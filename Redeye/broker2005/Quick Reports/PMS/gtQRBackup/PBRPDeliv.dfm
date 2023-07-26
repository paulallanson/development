object PBRPDelivFrm: TPBRPDelivFrm
  Left = -8
  Top = 45
  Width = 812
  Height = 496
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
  PixelsPerInch = 96
  TextHeight = 18
  object PBDelivQuickReport: TQuickRep
    Left = 2
    Top = 4
    Width = 1123
    Height = 794
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
    object PsQRShape1: TQRShape
      Left = 40
      Top = 683
      Width = 1025
      Height = 57
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        150.812500000000000000
        105.833333333333000000
        1807.104166666670000000
        2711.979166666670000000)
      Shape = qrsRectangle
      VertAdjust = 0
    end
    object QRBand1: TQRSubDetail
      Left = 19
      Top = 38
      Width = 1085
      Height = 591
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
      Font.Height = -15
      Font.Name = 'Gill Sans MT'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        1563.687500000000000000
        2870.729166666667000000)
      Master = PBDelivQuickReport
      DataSet = PODelivSQL
      PrintBefore = False
      PrintIfEmpty = True
      object DateLbl: TQRLabel
        Left = 552
        Top = 298
        Width = 81
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          1460.500000000000000000
          788.458333333333300000
          214.312500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'XX/XX/XXXX'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object BoxesLbl: TQRLabel
        Left = 968
        Top = 364
        Width = 99
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          2561.166666666670000000
          963.083333333333000000
          261.937500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'NNNNNN'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QtyOrderedLbl: TQRLabel
        Left = 16
        Top = 364
        Width = 78
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          42.333333333333300000
          963.083333333333000000
          206.375000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'NNNNNNN'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object OrderRefLbl: TQRLabel
        Left = 324
        Top = 298
        Width = 150
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          857.250000000000000000
          788.458333333333000000
          396.875000000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'XXXXXXX'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object YourRefLbl: TQRLabel
        Left = 147
        Top = 298
        Width = 100
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          388.937500000000000000
          788.458333333333300000
          264.583333333333300000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'XXXXXXXXXXX'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRDBText2: TQRDBText
        Left = 16
        Top = 299
        Width = 257
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          42.333333333333300000
          791.104166666667000000
          679.979166666667000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = PODelivSQL
        DataField = 'Cust_Order_no'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRDBText3: TQRDBText
        Left = 324
        Top = 299
        Width = 150
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          857.250000000000000000
          791.104166666667000000
          396.875000000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = PODelivSQL
        DataField = 'Purchase_Order'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRDBText4: TQRDBText
        Left = 16
        Top = 364
        Width = 78
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          42.333333333333300000
          963.083333333333000000
          206.375000000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = PODelivSQL
        DataField = 'Qty_to_Deliver'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        Mask = '###,###,##0.##'
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRDBText5: TQRDBText
        Left = 817
        Top = 364
        Width = 104
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          2161.645833333330000000
          963.083333333333000000
          275.166666666667000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = PODelivSQL
        DataField = 'Qty_to_Deliver'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        Mask = '###,###,##0.##'
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRDBText6: TQRDBText
        Left = 104
        Top = 364
        Width = 345
        Height = 45
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          119.062500000000000000
          275.166666666667000000
          963.083333333333000000
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
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object AddressMemo: TQRMemo
        Left = 16
        Top = 135
        Width = 331
        Height = 102
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          269.875000000000000000
          42.333333333333300000
          357.187500000000000000
          875.770833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
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
        FontSize = 11
      end
      object DeliveryMemo: TQRMemo
        Left = 434
        Top = 135
        Width = 335
        Height = 109
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          288.395833333333000000
          1148.291666666670000000
          357.187500000000000000
          886.354166666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
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
        FontSize = 11
      end
      object DelInstructMemo: TQRMemo
        Left = 104
        Top = 472
        Width = 561
        Height = 41
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          108.479166666667000000
          275.166666666667000000
          1248.833333333330000000
          1484.312500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
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
        FontSize = 11
      end
      object FormRefLbl: TQRLabel
        Left = 464
        Top = 364
        Width = 343
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          1227.666666666670000000
          963.083333333333000000
          907.520833333333000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Reference:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object DeliveryDateLbl: TQRLabel
        Left = 540
        Top = 299
        Width = 105
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          1428.750000000000000000
          791.104166666667000000
          277.812500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'DeliveryDateLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRLabel1: TQRLabel
        Left = 16
        Top = 112
        Width = 122
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          42.333333333333330000
          296.333333333333300000
          322.791666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Delivery Address'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object lblDelInst: TQRLabel
        Left = 433
        Top = 112
        Width = 148
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          1145.645833333333000000
          296.333333333333300000
          391.583333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Delivery Instructions'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRLabel4: TQRLabel
        Left = 16
        Top = 275
        Width = 257
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          42.333333333333300000
          727.604166666667000000
          679.979166666667000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Customer Ref'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRLabel5: TQRLabel
        Left = 324
        Top = 275
        Width = 150
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          857.250000000000000000
          727.604166666667000000
          396.875000000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Delivery No.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRLabel6: TQRLabel
        Left = 540
        Top = 275
        Width = 105
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          1428.750000000000000000
          727.604166666667000000
          277.812500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Delivery Date'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRLabel8: TQRLabel
        Left = 16
        Top = 341
        Width = 78
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          42.333333333333300000
          902.229166666667000000
          206.375000000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Order Qty'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRLabel9: TQRLabel
        Left = 104
        Top = 341
        Width = 89
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          275.166666666666700000
          902.229166666666700000
          235.479166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Description'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
      object QRLabel10: TQRLabel
        Left = 816
        Top = 341
        Width = 104
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          2159.000000000000000000
          902.229166666667000000
          275.166666666667000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Delivery Qty'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRLabel11: TQRLabel
        Left = 968
        Top = 341
        Width = 99
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          2561.166666666670000000
          902.229166666667000000
          261.937500000000000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'No. of Boxes'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRLabel2: TQRLabel
        Left = 136
        Top = 546
        Width = 137
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          359.833333333333000000
          1444.625000000000000000
          362.479166666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Picking Information'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QuantityLbl: TQRLabel
        Left = 481
        Top = 513
        Width = 71
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          1272.645833333330000000
          1357.312500000000000000
          187.854166666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'NNNNNNN'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRLabel12: TQRLabel
        Left = 464
        Top = 341
        Width = 343
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          1227.666666666670000000
          902.229166666667000000
          907.520833333333000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Document Reference'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object ContactQRLabel: TQRLabel
        Left = 16
        Top = 235
        Width = 337
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          42.333333333333300000
          621.770833333333000000
          891.645833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'DeliveryDateLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRLabel3: TQRLabel
        Left = 16
        Top = 35
        Width = 187
        Height = 38
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          100.541666666666700000
          42.333333333333330000
          92.604166666666670000
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
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 22
      end
      object PsQRImage1: TQRImage
        Left = 604
        Top = -5
        Width = 480
        Height = 118
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          312.208333333333000000
          1598.083333333330000000
          -13.229166666666700000
          1270.000000000000000000)
        Picture.Data = {
          0A544A504547496D6167659F7F0000FFD8FFE000104A46494600010201012C01
          2C0000FFFE010238880E06000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000FFC0000B08016E05D001011100FFDB00840005030304030305
          04040405050506070D0807070707100B0C090D131014131210121215171E1915
          161C1612121A231A1C1F20212221141925272420271E21212001050505070607
          0F08080F20151215152020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020FFC400D20000
          010501010101010100000000000000000102030405060708090A0B1000020103
          03020403050504040000017D0102030004110512213141061351610722711432
          8191A1082342B1C11552D1F02433627282090A161718191A25262728292A3435
          363738393A434445464748494A535455565758595A636465666768696A737475
          767778797A838485868788898A92939495969798999AA2A3A4A5A6A7A8A9AAB2
          B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE1E2E3E4E5E6
          E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFDA0008010100003F00FB2E8A28A28A28A2
          8A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28
          A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A
          28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A2
          8A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28
          A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A
          28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A2
          8A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28
          A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A
          28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A8AE6
          716F1173D0570FF127E3368DF0C7C3BFDBFA9DA5DDCD9A4CB1CFF66019A3041C
          3609191918FC6BA7F0A789AC7C61E1EB1D734E6636B7B089A2DE30C01EC47AD6
          B514514514514514514514514514514514514514514514514514514514514514
          5145145145145145145145145145145145145145145145145145145145145145
          1451451451451451451451451451451451451451451451451451451451451451
          4514514514514514514514514514514514514514514514514514514514514514
          514514514514514514555D510BE9F285EBB6BE63F8DE973ABF85359D2482C248
          8E14F7C1CD74FF00B1AF8C9F59F863A6584CDF3DA06B7FC8E47F3FD2BDFE8A28
          A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A
          28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A2
          8A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28
          A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A
          28A28A28A28A29932078597D462BE7DF89DA587BBB98186164054FE35E7BFB1C
          EACDA46BDAF68124C336F785D13A707B81E9C8AFB150865047714EA28A28A28A
          28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A2
          8A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28
          A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A
          28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A2909
          0A39350CB7B0403E7703F1AA52F886D6304A9DC077EDF9D606AFF17BC2BA2165
          BFD774CB62BF783DCAE47E0335CE4DFB4F78062CF97AC35C63FE785AC8E3F90A
          897F6A6F03E7FD6EA647A8D3E4AB16FF00B4EFC3E98ED9752BAB71EB2D948A3F
          91AE27C6FF00103C25E23B833E95AF58DC06EC24DA7F23835E3BF0B6FA1F0CFE
          D1175044DFB9D4E0F32320F04E7F965457DC3A5CC27B089C1CE56AD023B51451
          4514514514514514514514514514514514514514514514514514514514514514
          5145145145145145145145145145145145145145145145145145145145145145
          1451451451451451451451451451451451451451451451451451451451451451
          4514514514514514514514514514514514514514514514514514514514514514
          84851CD50D435AB7B142CCE062B89F14FC51B1D16D1EEAF2F22B4B65FF009692
          1EBF41D4D78EF887F684D57562C9E18D3B10F4FB7DF9C2FD553BD79CF887C61A
          8EAAC5FC43E28D42FB92DE4C7298625FA2835C9DCF8D743D2F3F67B1B55607EF
          940CDF5C9E6B26F3E31AC64AC72051D829C5521F176FE53FB95B971FEC2B1A91
          3E2D6A89CBDB5E63DE26FF000A9A3F8C104876DEDB46DED2C40FF315EC9F0775
          AF0B78D3E1978C8C3A5D8C5AB69110BFB5BA81163B88C63E6D8E3E603E5E80E3
          9A3C21FB42789F44458F4EF14FDB201D20D4A3128FA6F18615EB1E1AFDAB2093
          6A7897C3F2DBA719BAD3E4FB4463DCAF0E3F235EAFE16F1FF86FC696FE7E85AD
          5A5E81F7911F0EBF553823F115BE0D2D14514514514514514514514514514714
          71471471471471471451451451451C51C51451451451451451451451C51C51C5
          1C51451C51C51C51C51451451451451451451451451451451451451451451451
          4514514514514514514514514514514514514514514514514514514514514514
          514514514514514514514514514514514514514514514514514514535E458972
          C700572DE25F18C1A644C038CFA0AF13F88DF183FB1DC5B42A6F75498E21B553
          C2FBB5790EB5A94D7572DAA7896F3EDD799DCB096CC50FA003B9F7AE17C55F12
          BCADCA92E00E0015CB58C5E26F1ADFC369A75ACEEF70710A2A33BC9FEEA0E4FD
          7A7BD7B4781BF617F186BD0ADEF89AE60D12DC8DFF00E9B2798E47BC68405FC5
          FF000AF41B1FD9C3E07782D5575AF135F6A9729FEB22B52A884FA6235DC3FEFA
          ABCBA57C04D33E5B6F035D5F81D0CF23907FEFA7A735CFC132368F8556C07A8D
          A0FF003AA92E83F01B53626E3C0BA8599231982E1863F27AE97E11FC2DF84369
          AFEA09E17BDD51EE353B07B696CAF5414D870490760391FEF1EA6BC7B5BFD883
          C4D68AF2F833C55A66B451883124FE4B291DB6B1619FF810AF38D7BC37F133E1
          64C06BFA2DF5B461B6ABC89856FA30254FE06A7D0FE2ADBBDE235D2CB697B19E
          26898C32A9FF007860D7BC7C3CFDA67C43A4AC70DDDC47E23B1181B66611DD28
          F67FBAFF00881F5AF7DF02FC5BF0C7C418FCBD32FBCBBD41996CAE17CB9A3FAA
          9EA3DC645762083D28A28A28A28A28A28A28A28A28A2BE38FDB6FE22FC46F84D
          E3CD36E3C37E33D4AC74CD5ED0BADAC6C36C524642B638E84329FAE6BE7EFF00
          86ACF8C5FF0043EEADFF007D2FF851FF000D59F18BFE87DD5BFEFA5FF0A3FE1A
          B3E317FD0FBAB7FDF4BFE147FC3567C62FFA1F756FFBE97FC28FF86ACF8C5FF4
          3EEADFF7D2FF0085755F0FBF6DFF0089FE11D4E29357D4D3C45A796FDF5BDE20
          DE4719DAE3041E38CE47B57DF9F0F3C77A4FC4BF0869DE28D0E52D657D16F40C
          30C841C32B0F504115D15145145784FEDADE3CF117C3BF8536FAAF86355B8D2E
          F5B528E2334240254AB647E82BE2DFF86ABF8C5FF43EEABFF7D2FF00851FF0D5
          9F18B18FF84FB56FFBE97FC2BF49BE1CEA175AAF803C3D7F7B334F7373A6C12C
          D23757668C124FD49AE8A8A28A28A28AC3BAF1DF85EC6E24B6BAF1169304D131
          492392ED15908EA082783552F7E2AF81B4D8C4977E30D0A1463B417BF8C027F3
          A9340F891E10F15DE9B1D0BC4BA46A57210B986D6ED2470A3A9C03D3915D18E9
          41E95F1BFEDB5F123E207C27F1F69B2F867C65A9D8D86AD6664FB2C6E36C4E84
          2B6DE380720F7E735F3FFF00C3567C62FF00A1F756FF00BE97FC28FF0086ACF8
          C5FF0043EEADFF007D2FF85741F0EFF6B8F897A778E345B9D7FC5FA8DF694979
          18BCB790A957889C3678F424FE15FA4704D1DC4292C4C191D432B0E8411C1A90
          E315F9F5FB447ED59E3E8FE2EEB961E11F14DDE9BA469F37D8E18EDC80AC5386
          6E4752D9FC8579EFFC3567C62FFA1F756FFBE97FC28FF86ACF8C5FF43EEADFF7
          D2FF00857B6FEC69F15BE25FC55F8B46CF5FF18EA579A5E9F6325DCD03B0DB29
          CAA2A9C0F57CFE15F6D8E9451451451451451451451451451451451451451451
          451451451451451451451451451451451451451451451451454173750D95BC97
          1712AC50C4A5DDDD80555032493D85637FC2C6F087FD0D1A2FFE0747FE3552F7
          E2F78074E904777E33D020723215EFE3071F9D6AF873C55A278B2D1EEF42D5EC
          B53B747F2DA5B59964556C67048EF822B5A8A28A28A28A28A28A28A28A28A28A
          28A28A28A28A28A28A28A28A28A28A28A291982AE4D721E30F15C5A65BBFCE06
          057CFDF113E25CB6118922CCD7B70DB2D611D79E86BCCAE271A04335E5E4DE7E
          A770333CA79C7FB2BE82BCBBC5BE309EF6E7ECF6DBA49646DA88A3249AF40F80
          5FB2EEB9F162ED754BD6169A4C6F89EFE450CA083CA42A78761DD8FCA3DCD7D2
          E9AEF80BE04D94BA2F8174A82EB54236DCDE4877B3B0EF249D58FB0E07B579F7
          897C75E20F16485B54D4A69232722153B635FA28AC3C76A3028C0A302BA6F859
          A9FF006478FF00469CB6D56B81137D1815FEB537C4DB49FC39F117565B5964B7
          633F9D1B46C5480C03751F5AB1A2FC66F1469717D9AEEE22D5AD186D782F93CC
          0C3D33D7F3CD676B9E00F833F15622975A749E0CD5187CB2DA006D8B1EE57181
          F5C29F7AF2BF1D7ECD1F10BE1746FABE86CBAEE8CBF3ADCD9319004EC4AFDE5F
          D47BD739E1DF89A1EE2187545920BA84E629558A4919F5461FD2BE8EF867FB4C
          6A3A5471DAF8859F5BD34600BC897FD2611FEDAF4907B8E7EB5F42F86BC53A47
          8B34B8B52D1AFE1BCB5907CB246D903D8FA1F63CD6B645145145145145145145
          1451457C73FF00052A55FB0F829B033E65D0CE3DA3AF8B6940E40AFBD7C1FF00
          B05FC2ED73C27A3EA97573E2313DE58C33CA12F50286640C703CBE9935CCFC7B
          FD893C09E01F855ADF89FC3777AE9D434D896754B89D25475DC03020203D0939
          CF6AF8BE8AFBEFFE09EBAD3BFC17D5A3BB9512DAC357902331C04531A39C93DB
          24D7BDFF00C2CBF06FFD0D5A27FE06C7FE34BFF0B2FC1BFF00435E8BFF0081B1
          FF008D6868FE20D2B5F89E5D2752B4BF8E36DAED6F32C814E3A120D41A978CFC
          3BA3C8B16A3AEE9968ED9C2CD74884E3AF04D564F891E0F91D513C53A2B331C2
          817B1E49F4EB5E7FFB4CF823C3DF163C271784352F19E99E1FB88EE52EF370E8
          5B680401B4B0EB9EBED5F38FFC310783BFE8B5E87FF7EE3FFE3B47FC310783C7
          FCD6BD0FFEFDC7FF00C76BECFF000CC163E0FF0003E996B36A56ED67A7D84511
          BC66091B2AA01BF39C00719EB4DFF8597E0DFF00A1AB45FF00C0D8FF00C697FE
          165F837FE86BD17FF0363FF1ABBA7789F43D56CE5BCB0D5AC6E6DA0E259629D5
          923E33C907038AA3FF000B2FC1BFF435E8BFF81B1FF8D1FF000B2FC1BFF43568
          9FF81B1FF8D68697E25D1F5C4DFA66AB6378B923304EAFD3AF435A3902B9E93E
          237842191A293C4FA323A3156537B182A47041E6BF317E3FDDDBDFFC6AF185D5
          A4F1CF04BABCED1C91B065605CE0823A8AE0EBE84FD8335AD3742F8CB7375A9D
          FDB5941FD932AF993CA1173B938C9AFBCBFE165F833FE86BD17FF0363FF1AB9A
          478B341D7E578749D66C2FA48D72CB6F70B2151EA4035F247FC14A2D61CF83AE
          7CB1E77FA447BFBEDF90E3F3AF8EA3B79648A478E366489773903214640C9F4E
          481F8D4340E3A57E9F7EC99E3FFF008585F03F41BB966125E58C5F60B9E79DD1
          00A09FAAED3F8D747F1BFC7D0FC32F85BAF789A47DB25ADA95B71DCCAFF2201F
          F0261F957E554105E6B9A9A411249737977305551CB48EC781F524D579617825
          68A45DAE8C548F422A3AFABFFE09B9FF0023EF89FF00EC189FFA3057DC37D7F6
          BA6DA4977797115BDBC4BBA492560AA83D493D2B147C4BF06FFD0D7A27FE06C7
          FE34BFF0B2FC1BFF00435E8BFF0081B1FF008D1FF0B2FC1BFF00435E8BFF0081
          B1FF008D1FF0B2FC1BFF00435E8BFF0081B1FF008D58D3FC6BE1BD59DA3B0D7F
          4BBA7500958AE9188CF4E86B60306008208ACED5FC4BA3F879636D5B54B3B012
          122337132C7BB1D7193CD67FFC2CBF06FF00D0D5A2FF00E06C7FE34BFF000B2F
          C1BFF435E8BFF81B1FF8D5DBCF1468961A7C3A8DDEAF61059CF8F2A79275547C
          F4C12706A8FF00C2CBF06FFD0D5A27FE06C7FE347FC2CBF06FFD0D5A27FE06C7
          FE35B5677F697F1096D2E619E32010D13861FA558ACFD5F5FD2FC3F0A4FAB6A3
          696113B6D57B895630C7D0126B3BFE165F837FE86BD17FF0363FF1A3FE165F83
          7FE86BD17FF0363FF1A3FE165F837FE86BD17FF0363FF1A4FF008597E0DFFA1A
          B45FFC0D8FFC6B434CF1368BAD206D3756B1BC52768305C2BF3E9C1AD2147005
          52D435AD3B4989A5D42FAD6D5154B169A554000EFC9ACAFF008597E0DFFA1AB4
          4FFC0D8FFC68FF008597E0DFFA1AB45FFC0D8FFC6B461F10E933E9EDA941A9D9
          C96489BDA74994A2AFA96CE00ACEFF008597E0DFFA1AB45FFC0D8FFC697FE165
          F837FE86BD17FF000363FF001AD3D235CD335EB6371A5DFDADE401B6178250EA
          0FA6477A9AEEFAD2C23DF75730C09EB23851FAD62FFC2CBF06FF00D0D3A27FE0
          747FE34BFF000B2FC1BFF435E8BFF81B1FF8D1FF000B2FC1BFF435E8BFF81B1F
          F8D1FF000B2FC1BFF435E8BFF81B1FF8D6969BAE697ACC425D3750B4BC8C8C86
          8265707B763566E2E61B481E79E448A28D4B3BB1C0503A927D2B0C7C4CF06638
          F15E89FF0081D1FF008D1FF0B2FC1BFF00435E8BFF0081B1FF008D5E4F156872
          6967554D62C0E9E0906E45C2F9791D46ECE2A8FF00C2CBF06FFD0D5A2FFE06C7
          FE347FC2CBF06FFD0D5A2FFE06C7FE357F4AF14689AEE4697ABD85EED3822DEE
          15F1F91A8F54F19787B449C5B6A7AE69B653633E5CF7288D8FA13557FE165F83
          7FE86BD17FF0363FF1AB3A6F8CFC3BABBB45A76BBA65D3AE32B0DD23119E9C03
          5AE08A5C8ACCD4FC53A1E88B9D4B58B0B31BB6FEFAE1539F4E4D51FF008597E0
          DFFA1AF45FFC0D8FFC68FF008597E0DFFA1AF45FFC0D8FFC68FF008597E0DFFA
          1AF45FFC0D8FFC688BE237842691228BC51A33BB90AAAB7B19249E80735B705C
          417318920963950F4646047E62AA6AFAF697E1F8127D5751B4B089DB62BDC4AB
          1A938CE013DF02B387C4BF06FF00D0D7A27FE06C7FE347FC2CBF06FF00D0D5A2
          FF00E06C7FE35766F14E896FA5C7AACDAC58476127DCB96B8511B738E1B383CD
          52FF008597E0CFFA1AF45FFC0D8FFC68FF008597E0DFFA1AB44FFC0D8FFC6B5E
          C355B1D4E113595DDBDCC64021A1903820F4E94FBCBDB7D3AD64BABA9E3B7822
          52D24923055403B927A0AF37F8C9F10BC2779F093C5F6D6DE25D2269A5D12ED2
          38D2F10B3130B000007935F9719F7A4AFB9FF601F17681A07C29D56DF54D6B4F
          B191B577654B8B858D88F2D39C13D2BE8FFF008597E0DFFA1AB44FFC0D8FFC6B
          4F48D774CD7AD8DCE977D6D7B02B14325BCA1D430C7191DF9157E8A28A28A28A
          28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A2B23C47AAA69F68C
          C580C0AF9EBE21F8CBED37522B49FB9886E7E7A8EC3F1AF20B3BC7D4AEAE3C49
          7873BB31DA2F60BDD87D7A0F615E73E3FF001530DE03D769FB2F7ECFD71F157C
          466F3545922D2EDB0FA84C320853CAC087B330E58F653EA6BE92F8A5F12ADF48
          B51E0AF082C565A7DA462DE57B71B400063CB4C7403A135E4A07145145145496
          B70F677515C4670F13875FA83915E8DFB405AA4BAFE99ACC40797A8582B647A8
          FF00EB115E6B8E28C0ADCF0AF8EB5CF064E1F49BD68E3CE5A07F9A37FAAFF856
          8789FC0FF0DBE3E46C2FADE3F0A789E4FBB750A8F22E1FB6E1EBF91F735E11E3
          9F871E3CF805ABAC3AADB3CFA7BB7EE2EE1CBC720F66FA76383EDDEBA8F867F1
          72EF4BBE5D5340D456C6F5F1E746DCC373ED227F51C8AFAC7E16FC6DD27C7EAB
          A75D20D3B5B44CC966ED90E3BB46DFC4BFA8EF5E8CA430C8E94B451451451451
          4514514515F1D7FC14AFFE3C3C15FF005D6EBF9475F1652AF515FAEFF0D7FE49
          DF86BFEC136DFF00A296B99FDA4E78ADFE0478C1E5758D3FB31D72C70327000F
          CC815F95B457DE5FF04EBB78AE7E10F88ADE68D5E2935975746190C0C118208A
          F8F7E33785ADFC13F14FC49E1FB40AB6D65A84890AAE4854CE5473E80815C7D7
          A47823E396BBF0FBE196B9E13F0FDD4F6573AC5E4724B75136D68E254219548E
          8589193E82BCF269A4B895A59A46791CEE6663924FA93573C33FF231E99FF5F9
          17FE862BEC2FF828EF83EC574AF0C78B238D52F8CEF612B0EB226DDEB9FA10DF
          F7D57C59457EB27C3FD26CF5DF839A06997F024F6975A1C10CD1B0C86530A823
          15F95FE2AD213C3FE26D53498E4322595E4B6EAE460B0572B9FD2B2EBA2D2FC5
          BE245F09DCF8374DB8B83A6DEDD2DD4F6D0024CAEAA54671D463B7B0ACDFF846
          B5AFFA046A1FF80CFF00E154E489E1768E446475386561820FA62A7D3754BCD1
          EED2EEC2EE7B4B8439496190A32FD08AFBBFF62BFDA3357F89F637DE10F15DC9
          B9D5B4DB7135B5DB001EE21FBA437AB29C73DF3CF35F17F8E7C3DABBF8D35C74
          D2AFD95B519C822DDF04798DED5CD4D0C96D2B45346C9221C32B0C107D08A8AA
          C5A595CDFC862B5B69A7603256242C71EB81567FE11AD6BFE80FA87FE033FF00
          857D4DFF0004E9D2AFB4FF001E7899EEECAE6DD5B4C40A6589941FDE0F515B3F
          F0528FF8F6F06FFBF71FC92BC4FF00657F0347F11FC47E27F0BB85DD7DE1BB94
          8588FBB2864287F0602BC8EF2D25B0BB9ACE74292C12347229EA181C11F98AAF
          5F5CFF00C139FC7FF62F106BBE08B89711DEC42FAD549FE34F95C0FAA907FE03
          5B7FF0518F886D059683E05B69003393A85D81D768CAC63F3DC7F015E37FB167
          C3D6F1CFC6BB0BA962DF65A221BF9F3D370E231FF7D907F035E35ABFFC852EBF
          EBBBFF00E846AA57D5FF00F04DCFF91F7C4FFF0060C4FF00D182BDE3F6DED69B
          46FD9F3578E32035ECF0DAF39E85C138C7B2D7E7447E1ED5E44578F4ABE65619
          056DD8823F2A3FE11AD6BFE811A87FE033FF00851FF08D6B5FF408D43FF019FF
          00C2ABDDD8DD584823BAB69ADD88C85910A923D706A24768D8323156539041C1
          15F4D7EC6FFB497883C3DE37D37C0BAF6A535FE87A949F67B7FB43966B594FDD
          2AC79DA4F1B7A739AFA37F6D3F09D87893E00EB777751AF9FA5797776D26D195
          60E14807D08622BF3568AE9F5AF10F8ABC7F6BA74378D797F6FA4DA2595AA471
          B32428A38181C027D7BD63CBA0EAB6F1B4936977B1C6832CCD030007B9C550AE
          93C0FF0011FC4FF0DF578B53F0C6B377A7CD1B6EDB1B9D8FECCBD187D457E98F
          ECFDF1662F8CDF0CF4EF1318920BB3982F624FBA932E0363D8F047B1AF9F3FE0
          A43AB49245E0ED0614DECEF3DC955525B80AAB8FCDBF2AF8FBFE11AD6BFE80FA
          87FE033FF8527FC235AD7FD02350FF00C067FF000A5FF846B5AFFA03EA1FF80C
          FF00E154A489E091A391191D4E19586083E8453ECEEEE2C275B8B5B892DE64E5
          5E372AC3E8457DCFFB0F7ED0FADFC41FB67823C5578F7B7B636E27B2BB7FBF24
          40856463DC8C820F5C57A47ED5FF001B27F829F0D8DE697E59D6B5190DAD8EF1
          9119C65A4C77DA3A7B915F9BDE23F14EB5E30D4A4D4F5DD52EF52BC939696E25
          2EDF867A0F615955A11F87F569235923D2AF9D1865596DD8823D41C56AE8FE25
          F127816CB54D3A0373676DACDA1B5BA8658D95644241C8071C820735CD515FA5
          BF08E3B1F815FB2C596B0D6F9369A3B6A970B8DA6495D77E0FE6ABF857E7D7C4
          3F897E25F8A1E209F5AF11EA93DDCF339658CB9F2E11D9517A2803D2B97AB969
          A4DFDFA17B4B1B9B85538262899803F80A924D03558226925D2EF638D06599AD
          D8003DCE2B3EB4B40F126ADE16D462D4745D4AEAC2EE260C92DBCA51811D3A57
          E98FECDBF12A6F8D5F066C755D6228A4BC21EC6FC63E5959460B11FED02091EE
          6BF397E2BF8661F06FC4AF11E816E479163A8CD0C58EC818ED1F962B96AE96E3
          C4FE20F13786B49F0BC71CD369FA4AC8F0DBC08C72CEFB99D80EA79033D8563D
          C68BA959C465B9D3AEE08C705A485940FC48AA55AFE13F146A7E0AF1058EBDA3
          DCBDB5ED8CCB342EA71C839C1F5071822ACEBF3788FC71AD5E7886F6D6FAF6E3
          5099A796710B30624F3838E83A7E158F77657561208AEADA6B7623216542A71E
          B8351C32C9048B244EC8EA72ACA7041F635F6EFEC1FF001EF58F15BDDF807C49
          7D25F4D6907DA34EB899F748631C34649E4E3823DB35D77EDBDF1B754F85DE08
          B2D1BC3D76D6BAAEB523279F19C3C30A81B8AFA124800FD6BF3DEEEEE7BE9DEE
          2EA792799CE5E4918B331F726A0AD05F0E6B0CA19749BF2A464116EF83FA5437
          9A6DE69FB45DD9DC5BEFFBBE6C6533F4CD55AF4DF803F1C3C41F077C69617365
          7F3B6932CE91DFD8B393149196C31DBD030C920D7DDDFB56785ACBC73FB3FF00
          885DA38E436967FDA36B213F74C637E41F75C8FC6BF3128AE9751F11789BC69A
          4E95A54A6E6F2CB45B6FB35A410C44AC4A599B240EE4B1E7FC2B29FC3DAB4519
          924D2EF51146599ADD8003F2ACFADFF05F8F7C47F0F7578F55F0DEAF77A6DCC6
          C0E6190856F665E8C3D8D7DDD6BF188FC77FD92FC55AD7D9562D562D367B4BCB
          684160250BC151D70C0838F7C76AF80A4F0FEAD146D249A5DF2228CB335BB000
          7A938ACFA2AE5AE91A85F47E65A585CDC460E0B450B3007D320549FF0008D6B5
          FF00408D43FF00019FFC2BEFAFF827DD95CD87C13BD8AEADA681CEB931DB2A15
          38F2A2E706BE8EA28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A2
          8A28A28A29B2388D0B1ED5E4DF157C4E2D6DE550F8C0AF997C63AA4FA888ECA1
          6225BD942E436080781FA063597E33BF8B4DB25B480058E2408807A0AF28D174
          DB9F17F8B61B4B787ED0E25558A1FF009EB2B30544FC588FC01AFBDF51B7B6F8
          07F07F4FF0B699283AA5CA159275186791B99653F89C0F4E3D2BC4FAF27AD145
          1451451DABD43C6C3FB77E0C7867561F3496727D9643ED82BFCD457978E94518
          1410318C5769E16F898F67A6BF87BC4F649AEE813AEC92DA7019917FD927D3D3
          DB8C579E7C5BFD987EC766FE38F85574FA96927324F660969ADBB90475603FEF
          A1DF3D6BCF7C1FF104CAF0D96A26582E6060F1488DB5E261D19187F4EB5F577C
          1FFDA0FED525B683E2D9D04F290969A90C2C771E8B27F764FD0D7BB4722C8B95
          34EA28A28A28A28A28A28A2BE3AFF8295FFC78782BFEBADD7F28EBE2CA071D2B
          DEF47FDBA7E2AE87A4D9E9969268A2DECE04822DD6393B55428C9CF5C0AC8F88
          9FB5FF00C4AF897E14BBF0C6B175A7269F79B44E2DAD42338041DB9C9E3207E5
          5E37457E8BFEC21E0CB9F0A7C108AF2F2168A4D66F1EF515BAECC04538ED9099
          AF8CBF69DFF92F9E31FF00B08B7FE822BCD6BB6F829F0BAEBE31FC43D3BC276B
          722D45CEE79AE0A6EF2A3519638EE70303DC8AFB2B48FF008278FC34B3C1BFD4
          F5FBF3B30419D2319F5F957F4ACBD6FF00E09E3E1BB7920BEF0B789751B5BAB7
          B859963BE0B244C0303B72A011C0EBCD3FFE0A3E31F0CBC363D3573FFA29ABE1
          0A2BF5C7E137FC931F0BFF00D822DBFF00452D7E587C4BFF009287E24FFB0ADC
          7FE8D6AE76BEA3FF00827369F05C7C4FD7AEA440D2C1A4E2327F87748A0FF2AF
          BD368C74AFCC7FDB0E08ADFF00688F14C70C691A996262146064C4849AF20AF7
          2FD86EF26B6FDA2F438E27DA93C1731C83D57C976C7E6A2BF49768F415F94FFB
          457FC974F1AFFD866E3FF4335C057D1FFF0004F500FC6FBA1FF5079BFF00434A
          FD08D8BE940503A57C71FF000528FF008F6F06FF00BF71FC92BCFBFE09EBFF00
          25BAE7FEC1137FE8495C9FED85E00FF8403E396B290C5B2CF542350B7C0E3E7F
          BE3F070DFA578E5761F067C772FC35F89DA0F89A26DA96776BE773C189BE571F
          F7C935A7FB447C441F143E2EEBDAFC33F9D646E0C164D9C8F253E5423D8819FC
          6BEB9FF827FF00C3A7F0D7C2DBDF145DC3B6E75DB82613DFC84185FCDB7FE95F
          076AFF00F214BAFF00AEEFFF00A11AA95F57FF00C1373FE47DF13FFD8313FF00
          460AFAD7E2CF893C17E0DF0C0F11F8E52D5AC34E984D009A212319B0428453D5
          FAE3FA57CF579FF051EF0D5B5C343A6781F517B54E23692E123247FBA3207E75
          0FFC3C9F49FF00A112F7FF000317FC293FE1E4FA47FD0897BFF818BFE15E05FB
          497ED00BF1FB5FD3B504D062D222D3E06853F7BE649202D9CB1C0E9D87B9AF24
          AD9F055FCFA578BF46BEB6204D05F43221238C8718AFD2BFDACC7FC63BF8C7FE
          BC97FF0046A57E5DD15FA2FF00B0469D6D6BF002D2E62882CB757F70F337F788
          7DA3F402BDA7C5F6D0DCF84F56827892489EC66564750430D87822BF212E0059
          E45030031007E35157DC7FF04DCBC9A4F07F8AAD19B30C57D13A2E3A16420FFE
          822BD7BE387C5BF875F05E7B5D7FC516715DEB72C261B38A1895EE5A3072719F
          BAB93D78E6BC65BFE0A49A287611F812FCA67E526F101C76CF14DFF8793E93FF
          004225EFFE062FF8535FFE0A4DA56D3B3C0779BB1C66F5719FFBE6BE55F8B7E3
          F3F14BE206ABE2C6D320D34DFC8AFF006684E5530A17AF7271927D4D7255EDDF
          B116A13587ED0FA2242401710CF0C991FC26327F9815EB1FF052AB8945E7826D
          C487CA31DDB94ED9CC4335F1CD5CD1D164D5ACE3650CAD3A020F71B857EC0697
          6F0DAE9B6B0431A471470AAA228C050000001E95F30FFC146ED203F0E3C3D706
          28FCD4D54A2BED1B8031B6467D381F957C23457E8AFC71B896DFF62D99E191A3
          66D12CD091DD498C11F882457E75515FA25FB126A9E1DD1BF67DD1D66BFD3AD6
          EA7B8B9927124E88EC7CE6504827FBA00FA0AF51F887E24F0DDE780BC416CDAC
          69530934CB84F2CDCC6DBB31B718CF35F93AD8DC71D33495F7D7FC139BFE491E
          B3FF0061A7FF00D151D7C8DFB477FC973F197FD85A5FE75E7D5F6E7FC136AC6D
          BFE11DF17DE7911FDA3ED7045E66DF9B6EC63B73E99AF69FDABA18DFF67AF18E
          E456DB619191D0EF5E6BF2EA8AFD68F831676D63F09FC2905B451C510D22DC85
          45C0C98D49FD4D7C9BFF0005258A35F15784245450ED65382C0724075C7F335F
          24D7B7FEC3D34917ED19A0AA3150F0DCAB01DC790E71FA57A77FC149FF00E43D
          E10FFAF59FFF00425AF90AB43C3DB3FB7B4F1205D9F6A8F76EE98DC3AD7EB741
          E2BF0E470C68BAE694A028000BA8C638FAD7CE1FF0506BBD0758F84FA55CDADF
          58DD5DDBEAE8A9E4CEAECAAD1BEEE01E9C2D7C2152DA7FC7D43FEF8FE75FA93F
          15BFE4DBBC43FF0062C4BFFA4F5F963457DF9FF04EDB3B78BE106A9729022CB2
          EB0EAEE17E660234C027D064FE75F49DDDA43776935BCF12490C8851D1864302
          3041AFC7BD5E348355BB8A31B5239DD547A00C71552BECBFF826C6A329FF0084
          C34DC0F297ECF38E4F53BD7A7E15F4DFC6F503E0DF8CF03FE60379FF00A25ABF
          2668AFBEFF00E09D001F841AB823FE634FFF00A2A3AFA7362FA0A00C74A5A28A
          28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A2A19AED20FBD5CE78CB
          E25681E04D19B57D6AE5A0B3591636755DC413DF1E80024FD2AB681F19BC07E2
          431A69DE29D3646900D8AD2842DF4CE2BABB5BCB6BC8FCCB69E2993A6E8DC30F
          D2A7E28AA1AE5D0B5B076CE38AF99FE306BCCED246AFCB1C0AF24D308BEF14BC
          EC9F25A40CCA7D493B47F235C6FC46D4C82E335DFF00EC2DE054F107C448756B
          98B7C3A74326A073D0499F2A1FE729FC057AB7C6AF10B6BDE3CBC457DD05962D
          A21DB8FBDFAE7F2AE27028A28A28A28AF52F0501AF7C13F126978DCF652FDA23
          1E8301BFA1AF2D1D28A28A2B6BC1FE32D53C15A90BDD327201E2585B94947A11
          FD6A5F8ADF02F40F8DBA3CDE30F87B0A58788E0FDE5EE96A42F9ADD4B20E818F
          E4DEC79AF03F0D78B2EF45BB9341D7EDD95958C72472A919C1C1E0F20823EA0D
          7D3DF057E3BBE89F66D0BC4B7CD3E992911D8EA529C984F68A53E9E8DF81AFA4
          20992640CA41A928A28A28A28A28A28A2BE3AFF8295FFC78782BFEBADD7F28EB
          E2CA00ED5F5A7877FE09DF7DAFF87F4DD5D3C716F12DEDA457210D893B37A06C
          67776CD5EFF876B6A1FF0043EDB7FE0037FF0015525AFF00C135EE3ED09F6AF1
          F4421FE2F2F4F3BBF0CBD773E00FF827EF81BC2FA9C77FE20D52F3C46626CA5B
          C9188213D31B80249FA671ED5F49DBDB456B024104691C51A85444180A074007
          A57E5BFED3BFF25F3C63FF006116FF00D04579AD7D0DFB007FC97A4FFB064FFF
          00B2D7E89515F2BFFC1483FE49A7873FEC2E7FF45357C1F457EB8FC26FF9263E
          17FF00B045B7FE8A5AFCB0F897FF00250FC49FF615B8FF00D1AD5CED7D57FF00
          04DEFF009289E24FFB052FFE8D5AFBB7B57E647ED97FF2717E27FF007E1FFD12
          95E3D5ED9FB11FFC9C87873FEB9DCFFE93C95FA595F94DFB457FC974F1AFFD86
          6E3FF4335C057D21FF0004F5FF0092DF75FF006079BFF434AFD08A2BE37FF829
          47FC7B7837FDFB8FE495E7DFF04F5FF92DF73FF6089BFF00424AF5EFF8288FC3
          D6D5FC13A478C6D60DD2E9339B7B9651CF9526304FB0603FEFAAF84A8AD1F0E6
          8575E26D76C345B18CBDD5F5C25BC4BFED33003F9D7EB5F833C2D6BE0AF06697
          E1DB35020D3ACD2DD703AED5C13F89C9FC6BF23B57FF0090A5D7FD777FFD08D5
          4AFABFFE09B9FF0023EF89FF00EC189FFA3055DFF8290F892E5FC41E16F0E2BB
          ADAC76B25E3267E56766DA0FE014FE75F21D5FD0747B8F106B563A459EDFB45E
          DC25BC5B8E06E660A33ED935F58C1FF04DAD50C2866F1DDA248546F55B16201C
          7201DDD2BC6BF68CFD9DA7FD9FEFB47B49F5D8F553A9452480A4063F2F61031D
          4E7AD792568786FF00E460D37FEBEE2FFD0C57E9A7ED67FF0026EFE30FFAF25F
          FD1A95F977457E8FFEC21FF26EDA57FD7E5CFF00E8D35ECFE29FF916754FFAF3
          97FF004035F8FD71FF001F32FF00BE7F9D455F6EFF00C135FF00E45BF187FD7D
          C1FF00A0357837ED93E21B8D7FF681F112CF23B4762C9670AB7F02AA8E07B649
          3F8D78DD76DF063E146A1F197C7769E14D3AEE0B47991A49279412B1A28C9381
          D4F6C7BD7D19FF000ED6D43FE87DB6FF00C006FF00E2ABE70F8CDF0D24F845F1
          1351F084BA826A0F6223CDC2C7B036E8D5FA64E31BB1F857195ECBFB177FC9C4
          F86BEB37FE8A6AF5DFF82967FC853C0FFF005C2F3F9C35F1ED5DD0FF00E43563
          FF005F11FF00E842BF612C7FE3CE0FFAE6BFCABE61FF00828EFF00C930F0FF00
          FD85FF00F69357C19457E897C78FF932993FEC0F63FF00A1C55F9DB456BD8784
          FC41A9DB2DCD8689A95D5BBE42CB0DB3BA9C1C1C1031D6A6FF00840FC57FF42D
          EB5FF80527F8527FC203E2AFFA16759FFC0193FC28FF008407C55FF42CEB3FF8
          0327F857DD1FF04FAD1F51D1BE156B106A56175652B6B0CCA93C4D1923CA8F90
          081C57C79FB477FC973F197FD85A5FE75E7D5F717FC135FF00E451F177FD7FC1
          FF00A2DABD9BF6ADFF00937AF19FFD83FF00F675AFCB7A2BF5BFE10FFC92BF0A
          FF00D81EDBFF00452D7C93FF000528FF00919FC21FF5E771FF00A1A57C8D5EDB
          FB107FC9C6F87BFEB95CFF00E887AF50FF0082947FC87FC21FF5EB3FFE84B5F2
          153D119D822292C4E0003926B67FE104F1663FE45BD6BFF00A4FF0A53E03F159
          E0F86B5AFF00C0193FC293FE101F157FD0B3ACFF00E00C9FE1525B780BC54B73
          113E19D6400E3FE5C64F5FA57E977C59431FECE1E2342A5597C3128208C11FB8
          35F963457E817FC13B7FE48BEA1FF61A97FF0045C75F4A49FEADBE95F8EDAE7F
          C866FBFEBE1FFF0042354ABEC1FF00826AFF00C857C65FF5C2DBFF00427AFA9B
          E387FC91BF19FF00D806F3FF0044B57E4C515F7E7FC13A3FE490EAFF00F61A7F
          FD151D7D3945145145145145145145145145145145145145145145145145141E
          05739E20BA6891B06BC7FE26E97A6F8C74B3A5EB514935A0937EC490A73823B7
          B135E1DA97ECF3E182CC74AD46FF004F941CA10F903F2C5416DF0E7E21F85661
          71E18F1CCF9C60ABCA41FA73D7F3ADBB0F8C5FB43782D7C895575789795668C4
          991E99C1AE8F48FDBBB5FD2E548FC51E0795157E595A15652BEFDFF2E2BAB6FD
          B4BE1FF8A6D4DB492DCE9B391C09C000FB64E39AF2DF1B78AACBC4B7427D32E5
          6EA1DFC98FE6C7E55CFF0085CC820D5669815915921208C15C2E70476E5ABCC7
          E235C9CC98AFAD3F612D1D348F0278875B65C10F15B0FF007638439FFC7A46AE
          3AF6E5EF6F67B990E5E5919D8FB939A868A28A28A28AF4EFD9F2E12E356D6344
          97FD5DF58371EA41C7F2635E6B736CF67712DB4830F139461EE0E2A3A28A28C0
          ABFE1FF106A1E18D521D4B4CB830DC447A8E8C3B823B8AE83E2C7C26D13F68AF
          0CCDE2BF0BC0965E30B3406EED1081F6920751FED7A377C60F4047CE3E12F14D
          D68B792E87ADC24302639229548C8E8720F239E31D4115F50FC0CF8D2FA24B6B
          E1AD7AF7CDD3A6C47A65ECADCC67B43237FE82C7E95F474132CD18653F87A54B
          451451451451451457C75FF052A23EC1E0A1919F32EB8FC23AF8B2957A8AFD77
          F86B8FF8577E1AC7FD026DBFF452D74145141E95F963FB4EFF00C97CF18FFD84
          5BFF004115E6B5F43FEC01FF0025E53FEC193FF4AFD11A2BE57FF82907FC934F
          0E7FD85CFF00E8A6AF83E8AFD6FF00848EB27C2EF0B3230653A45B608391FEA9
          6BF2CBE25FFC943F127FD856E3FF0046B573B5F53FFC138668D3E24F88A26701
          DF490557B90255CFF3AFBC07DDAFCC9FDB2FFE4E2FC4FF00EFC3FF00A252BC7A
          BDB3F623FF009390F0E7FD73B9FF00D2792BF4B2BF2ABF690824B7F8EDE34496
          328C757998023B16C83F91AF3CAF75FD89FC75E1EF87FF0017DF50F12EAB6FA6
          59CDA74B024D39C26F2CA4027B7435F780F8E3F0DBA7FC277E1CFF00C18C7FE3
          58B17ED35F0C6FBC43A6F87B4BF14DA6A9A8EA57296D6F1590328DCC71F311C0
          1F8D7CFF00FF000527B98BFE28EB6F317CDFF487D9DF6FC833F9D707FF0004F5
          FF0092DF73FF006089BFF424AFB8FE2878360F883F0FB5DF0CCEA08D42CA4890
          91F75F1F237E0C01FC2BF25B50B19F4BBEB8B1B9431CF6F2B45229EAACA7047E
          62AB57D0FF00B077C393E2EF8C4BAF5C43BECBC3F01B9248E0CAC0AC63EA325B
          FE035FA193C890C0EF23054552589380057E3B6A6CADA8DD329041998823EA6A
          AD7D5FFF0004DCFF0091F3C4FF00F60C4FFD182A3FF828F5ACA9F10FC357053F
          74FA5322B7A9121C8FD457CA95BBE03D5ADB40F1AE85AADDB30B7B3D4209E52A
          3242AC809C0FA0AFD3ED3FF680F861AA5A25CDAF8F3C3FE5B74DF7A8847B1048
          22BE3AFDBCBE27F85FE21F8B740B6F0C6AD6FA9A69B6B2ADC4F6EDBA30CCC3E5
          07A1236F6F5AF9A6B43C37FF0023069BFF005F717FE862BF4D3F6B3FF9377F18
          7FD792FF00E8D4AFCBBA2BF46FF60CB8866FD9F2C228A456786FAE5645079525
          C900FE041FC6BDAFC53FF22C6A9FF5E52FFE806BF1FAE7FE3E25FF007CFF003A
          8ABEDDFF00826BFF00C8B7E30FFAFB83FF00406AF9D7F6AFB792DFF682F17AC9
          1942D7BBC03DC15041FCABCB2BD93F63EF1DE83F0F3E34D8EABE23BF4B0B07B6
          96037120F9119978DC7B0E3AD7DF7FF0BEFE197D93ED3FF09E7877CAD9BF3F6F
          4CE319E99CD7E777ED3FE33D27E207C6EF116BDA1CE2E34F9A48E38665FBB204
          8D50B0F6254E2BCC6BD97F62FF00F938AF0D7FDB6FFD14D5ECFF00F0528D3276
          1E0BD4957F709F6A818E0F0C7CB23F4535F19D5AD3664B4D42DA77FBB1CCAED8
          F4041AFD4DD13E3E7C32D4348B5B98BC73A022490A90B25EA232F1D0827208AF
          9CFF006F7F8ABE0EF16F83742D1340F10D86AB7B1DF9B8916D261288D0211962
          38192781EC6BE34A2BF46BE33E9F26A5FB17DC45115063D06D6639F44F2D8FE8
          2BF3968AFBA7F62BF8F1E06D17E12DA784B5FD7EC348D474FB89B6A5DCA2312A
          3B99030278FE22319EDEF5EF63E37FC35FFA1EBC37FF008308FF00C68FF85DFF
          000D3FE87AF0DFFE0C23FF001ACCD6BF691F84DA1C6CD75E3CD0C954DFB61B81
          2B11EC1739FA56F7C39F88BA27C51F0EAF883C3AF3C9A73CAF0C724B16CF3369
          C1603AE33EB8FA57E68FED1DFF0025CFC65FF61697F9D79F57DC5FF04D7FF914
          7C5DFF005FF07FE8B6AF66FDAB7FE4DEBC67FF0060FF00FD9D6BF2DE8AFD6EF8
          41FF0024AFC29FF607B6FF00D14B5F257FC14A3FE467F087FD79DC7FE8695F23
          57B67EC492247FB46F870BBAA82972A327193E43E057A97FC149A37FEDCF0849
          B1B61B69C6EC719DCBC66BE41AB9A45DA69FAA5A5D48A4A413A48C07520303C7
          E55FA8DE1DFDA27E16F8874982FADBC6DA244AE8098EE2E922910E01C32B1041
          15A5FF000BBBE1A7FD0F5E1BFF00C1847FE347FC2EFF008683FE67AF0DFF00E0
          C23FF1AE7356FDAB3E13698F6F041E2AB6D56EAE665821B6D394CF23B9200181
          C0C93DC8ADCF8F6C1BE08F8CC8046743B9383FF5C9ABF28A8AFD02FF008276FF
          00C917D43FEC332FFE8B8EBE9493FD5B7D2BF1DB5CFF0090CDEFFD7C3FFE846A
          957D83FF0004D5FF0090AF8CBFEB85B7FE84F5F577C59D366D63E1778AB4FB70
          3CDB9D1EEA24CF4C98980AFC92652AC548C11C536BED1FD83BE2DF82FC1FE01D
          5741F10788F4FD2AFE4D4CCF1C777288C4886351904F1FC27F4AFA3E7F8F1F0C
          AD207964F1E78715106588BF8CE07D01A87C15F1E7C0BF113C5571E1CF0B6AFF
          00DAB736D6E6E269608C985143018DFD0924F007A1AEFA8A28A28A28A28A28A2
          8A28A28A28A28A28A28A28A28A28A291865702B1359D31EE51B68CD79E788FC2
          37326E2233F80AE22F7C27731C84989B8F6ACE9745B88BB30FC2A2F26EA1E99E
          2A29FF007E852EADA29D48C112461B8FC6B8BF187853C357313799A25B291CE5
          176E2BC8B59D0F46D3EF7FD1A09ADC8CF30CC50D7D0BF0ABE23F83B4FF0087B6
          BA1788BC130DFA69FF00B87BC8CAF9B3F19DEDC039C37AD72BE3ED3BF673F164
          6E62D435CF0D5D9EAB2EE29FAEE1FA8AFA47E07781F44F0DFC33D434AF0BF88E
          DF5CB5BC96574BA5000466455DAD82791815E73AA7C0BF196980B258457883BD
          BCA1B3F81C1AE5B51F0DEB1A4315BED26FADB1DE48180FCF18ACFC8E94514514
          515D67C21D53FB2BE21693216DAB2CA616FA3023F9E2A3F8ABA5FF0063F8FF00
          57B70B8469BCD4FA380DFD6B97A28A28A2B4FC33E24D43C25AC43A9E9B2EC962
          3CA9FBAEBDD48F4357BF686F83BA7FC5FF000BFF00C2CCF0541E56A76EB9D4AC
          E35CB12072E00EAC06323F8979EA067C1FC07E2D5B847D275450548D8E84FE44
          1FD41AFACFE01FC5D9AE0C7E12D7AE4CB7B147BACAE9CFFC7E443B1FF6D4707D
          40CD7BBC522CA8190E41A751451451451451457C5FFB79F863C61F103C73A1D8
          787FC25ACEA56BA5D9317B8B6B37742F230254301838083F3AF9B7FE143FC4CF
          FA10BC47FF0082F93FC28FF8511F133FE841F11FFE0BE4FF000AFD22FD9EEEB5
          2B8F839E198F58D32EF4DBFB5B14B49EDEE6168DD5A31B3383CE085047D6BD02
          8A2AB5FDDAD8D94D72D1C922C31B3948D77336067000EA7DABF31FE237C37F8A
          1E3EF1D6B5E2593E1FF89233A95E3CE10D84876A93F28FBBD860573DFF000A23
          E267FD083E23FF00C17C9FE15E8FFB367827E21FC33F8CBE1ED7EFFC09E224B2
          59CDBDCB9D3E4C24720285BA76DD9FC2BF4697A52D7C93FB7BE9FE2CF1C49E1F
          F0BF86BC2FAD6A705A17BCBA9ADAC9DE30EC36A286031903767EA2BE53FF0085
          0FF133FE842F11FF00E0BE4FF0A3FE1447C4CFFA107C47FF0082F93FC2BF40BE
          00F8A355D33F67EB19B5BF0DEAD67A968566D6D2D8BDABACB318C7CBB148C9DC
          0AF4EF9AF82B5BF83BF14B5DD62F754B8F00F88BCEBCB879E4C69D201B99893D
          BDEA97FC288F899FF420F88FFF0005F27F857B37EC7BE17F1DFC2FF8C96777AC
          F82BC416DA6EA30358CF33E9EE162DC4156271C00CA327DEBEF99241144CE41C
          28C9C0C9FCABF34BE35F80FE257C4AF8A5AFF89A2F007894417B76C60074F933
          E5AFCA9DBFBA0571BFF0A23E267FD083E23FFC17C9FE15DA7C10F017C47F86FF
          00157C3DE27B8F00F89BECD6578A67DB61203E5B02AFDBD09E2BF4AE360E8AC0
          1008CF2315F2A7ED6DFB22EADF1275E7F1BF827C893519210B7B6123EC339518
          0E84F1BB18041C7415F28DE7ECFBF146CAE1A097C01E210E9D76D93B0FCC0C54
          3FF0A23E267FD083E23FFC17C9FE149FF0A23E26FF00D085E23FFC17C9FE15EA
          BFB28FC15F1A699F1CFC3FA8EBBE11D674FB1B3692779EE6C99114843B725860
          738AEDBF6EAF0DF8C3E22FC44D32C3C3FE0ED72FED347B328D750593BA48F210
          C42903070001F5CD731FB207847C73F0CBE33D85F6B5E06F1041A7DF42F6334E
          F61205877E36B138E0640C9F435F7F75E95F9E7FB54FECF7E2D83E346B57DE19
          F0B6ABA8E9BA9917CB25A5ABC88AEFF7D72075DC09C7B8AF29FF008511F137FE
          842F11FF00E0BE4FF0AFBA3F625F84F7BF0D7E153DC6B1632D9EADABDCB5C4D0
          CC85248917E54520F23A13FF0002AF57F893A9DD68DE01D72F6C34F9F50BB8AC
          64F22D6142EF2B95C2A80393C915F984FF0002BE26BB96FF008407C47C9CFF00
          C83E4FF0A4FF008511F133FE841F11FF00E0BE4FF0AF76FD893C25E37F873F17
          D9B5DF06EBD6561A9D84968D71359C891C4D95752C48C7F011CFAD7BEFED63FB
          3D5C7C74F0A59BE8F3430EBBA53B3DAF9A70B32301BA327B74041F51EF5F0DEB
          5FB36FC56D06F0DADD78135A760480D6F6E66438F465C8AA1FF0A23E267FD083
          E23FFC17C9FE140F80FF001349C0F00F88FF00F05F27F8576137EC91F11F4FF8
          7D73E24BDF0EDFA5E8BB8E0B7D36388C93BA10DBE42AB9C0076E3F1AE3FF00E1
          447C4CFF00A107C47FF82F93FC2A6B2F827F142C6EE0B98FC05E23DF0C8B22FF
          00C4BE4EA0E476AFB73F697F127887C57FB3A4767A1785F59BAD53C4290C535A
          2593992D80C3C9BD71F2E0AE3F1AF877FE1447C4CFFA107C47FF0082F93FC28F
          F8511F133FE841F11FFE0BE4FF000AFB1FF60DB6F137857C27AC784FC49E1AD5
          B4978AEBED96D2DDDA346922B00ACA091D4100FE35EC7F1BF5CD4B42F859AFDC
          689A65EEA3A9CB66F6D6905A4464732483606C0EC339CFB57E6B37C09F89CC4B
          1F00F89092727FE25F27F8527FC287F899FF00421788FF00F05F27F857D2BFB0
          768DE32F879E2FD6B46F10F84F5CD3ECB57B7478EE2E2D1D234922DDC1246064
          31FC856EFED81FB27EBBF11FC42BE37F05450DC5F340B15ED8B3046936F0AE84
          F04E3820E3A0AF94AEFF0067FF008A36570D04BE00F10874E0EDB1761F9818A8
          BFE1447C4CFF00A107C47FF82F93FC2A5B4FD9FF00E285E4E9045E00F10EF738
          1BAC5D47E6460574FE37FD947E21F8374AD0A51E1CD4B51BDD42DDE6BA82CE03
          30B421B0A8C541192BCFFF00AAB92FF8511F137FE842F11FFE0BE4FF000AEFFF
          0067CF027C43F86DF17FC3BE23BFF00F88FEC705D08EE1BFB3A4F92371B19BA7
          60D9FC2BEE5F8E1F0774AF8DBE049FC37A8CA6DA50DE759DC85C982500E0E3B8
          E7047A57C01E34FD933E2BF82AFE4B797C2779A9C0AD84B9D3D7CF471D88C723
          E845735FF0A23E26FF00D085E23FFC17C9FE147FC288F89BFF00421788FF00F0
          5F27F854FE2BF81FE31F02F81E0F14F89B4B9749B7BABC16B6D6F72BB6590EC2
          C5B6F500600E7AE7DAB83A2BF58BC1DA05978A3E0C691A26A3179B677DA1C56F
          3A7AAB4401FE75F067C4FF00D8DFE25F81758B95D3342B8D7B4A562D05D58AEF
          629DB720F981F6C7D2B86FF8511F133FE841F11FFE0BE4FF000A3FE1447C4CFF
          00A107C47FF82F93FC28FF008511F133FE841F11FF00E0BE4FF0A3FE1447C4CF
          FA107C47FF0082F93FC28FF8511F133FE841F11FFE0BE4FF000AFD14F803E1C9
          FE1BFC03F0FD95ED8DC457569A69B9B8B611E65DED990AED1CEEE718EBDABE06
          F1DFC30F8A1E35F19EB1E2293E1FF8950EA57B2DC84361212A19890338EC303F
          0AC4FF008511F133FE841F11FF00E0BE4FF0AFA57F60FD23C69F0F7C5DAC689E
          22F09EB9A769FAA5B0923B8B8B3748D258CF4248C0CA93CFB0AF61FDB1AF75E7
          F83F77E1EF0DE81A96B17BACC8B6CCB676ED2795183B999B00E3A003EB5F047F
          C288F89BFF00421788FF00F05F27F852FF00C288F899FF00420F88FF00F05F27
          F857E887ECBB7FAC5C7C18D0EC7C41A35F693A869917D86486EA068D98270AC0
          1EC571F8E6BE6CFDB7BC3FE37F899F13EDADB41F07EBF7BA6E8F682049E2B076
          492463B9CA9C723EE8CFB57817FC288F899FF420F88FFF0005F27F8575FF0006
          FE1FFC47F871F13BC3DE299FE1EF8924834FBB592551A7C99D84156C71D7049A
          FB4BF69BF8103E3E7812DED2C2E23B4D5EC5FED36124CA42B6461A36EE0118E7
          B102BE11F10FECCBF163C35766D6EFC0FABCA41203DAC3E7A37D0A66B33FE144
          7C4CFF00A107C47FF82F93FC28FF008511F133FE841F11FF00E0BE4FF0A3FE14
          47C4CFFA107C47FF0082F93FC28FF8511F133FE841F11FFE0BE4FF000AECBE0A
          7C04F1DCDF16BC2CDABF8375CB3B18B54866B89A7B175454460C7248000F971F
          8D7DADFB56DFEB907C17D5F4BF0E68DA8EA7A8EACA2C522B281A4288DF7D8E07
          036823F1AFCF6FF8511F137FE842F11FFE0BE4FF000A5FF8511F133FE841F11F
          FE0BE4FF000AFAE7F608B3F15F83B4DD7BC27E25F0C6B1A546F2ADF5ACD756AF
          1A312023AE48C678538FAD7D03F1475CBDF0D78035AD4B4CD32EB53BE8AD1C5B
          5ADB445DE49186D5000E719209F606BF319FE05FC4E918B9F01788F24E4FFC4B
          E4FF000A4FF8511F133FE841F11FFE0BE4FF000AFA0FF61CD13C6FF0D3E23DE5
          86BDE0DD7ACB4DD66D7CA3712D93AA452A1DC85891C02370FC457DB8E8AE8519
          415230411C115F057ED01FB12F8BB47F145F6B3E03D37FB6346BC99A64B58180
          9AD8B1C94DA4FCCA09E08EDD6BC58FC06F89CA4A9F00F88F238FF907C9FE149F
          F0A23E267FD083E23FFC17C9FE149FF0A23E26FF00D085E23FFC17C9FE15F557
          EC01F0BBC47E0CBEF156ABE23D0AFF004B79A382DE01770B445C65998804723E
          EF35F5CD145145145145145145145145145145145145145145145145149818C6
          2A392D219461E353F85529FC396370398547E159777E01B1B8CED4407E95897B
          F0B21704C607E15837DF0B264CEC5FD2BCDBE217816E2CA272633C0F4AF9D3C6
          5A73DBDF6D2A47245753E09945C6817C9DC3A1FCE35FF0AF32F88D090D271D2B
          ECCFD8D6EFFB4BE0C6BB6B1B7EF16EE4C60F3F3DBC6C0FEB5C969BE3EF1468AD
          B6D35DBE40BC6D694B8FC8E6BA8D3BF681F155A284BD4B1D413A112C3B49FC47
          F85687FC2DEF086B436F883C096D93D64B7DA4FF00207F5A4FB0FC1EF107FA8B
          DBED1A56ECFBB68FCF23F5A47F819A6EA8BBFC3BE34D3AEC1E5637C67F356FE9
          58DA9FC09F1969D968EC61BC41D1ADE6073F81C1AE5F51F0B6B7A4122FB48BEB
          7C7778180FCF18ACDE8707AD1C558D36F1B4ED42D6F233868264907E041FE95E
          8DFB43D8A8F1269DAAC43F777B640E71D4A9FF00022BCC68A28A28A2BABF865E
          3D9BC07AEACEC59F4F9F097517AAFF00780F515C0FED61F0453C0DAC41E3AF09
          44A744D49B76D847CB139058A0C7F0B72CBEF91E95CBF81BC4C75AB2B710DD1B
          7BDB77135A5C29F9A290743F4F515F61FC14F8A49E38D080BB558351B66F22FA
          0CFF00AB93B30FF658722BD30104714B451451451451451814607A5181E94605
          1451451803A0A303D28C0F4A00C514607A5181E94607A51814607A5181E94605
          181400074A303D28C0A00C514607A5181E94607A518146051814018A303D28C0
          F4A00C51814605181E94607A51814600E828C0F4A303D28C0A303D28C0A303D2
          8C0F4A303D28C0A3028C0F4A303D28C0A3028C0A303D28C0F4A303D28C0F4A30
          3D2B8AF8CDE3FB9F859F0EB52F165AE9F1DFB69C1247B7797CB0E85C06C1C1C1
          C138AF23F0EFFC1413E186A56DBB57B6D63489C28CC6D6DE7027B80CBE9EE056
          AFFC379FC1AFFA0A6A9FF82D928FF86F3F835FF415D53FF05B257CF9FB627ED3
          5E18F8CFA4691E1FF09C57525AD9DC1B99EE6E2131EE6DBB55541E7B9CE7DABE
          66AB1656735FDDC3676C85E69E458E351DD89C01F9D7EBDF84B49FEC0F0BE95A
          51CFFA1D9C501C9C9CAA01FD2B5703D28C0F4A303D28C0F4A303D28C0F4A3028
          C0A303D28C0A3028C0F4A303D28C0A303D28C0F4A303D28C0A303D28C0F4A303
          D28C0F4A303D28C0A3028C0F4A303D28C0A3028C0F4A303D28C0F4A31C628C0A
          303D28C0F4A303D2803145145145145145145145145145145145145145145145
          14514514514514521031D2BCFBE28594725AC84C6BD3D2BE3CF8A7651C37C5C2
          602BFF005AA9E009D59EEED40C16B6538F52AC47F2C5719F11EC8E5F8AFA27FE
          09F5E224961D674591FE696CE1B8543DCC6CD1BFE863A83C59A61D17C4FA9E9E
          C31E45D3A8FA6723F422B2E8A3029519A360C8C5587420E0D6C699E39F12E8F8
          165AEEA1128FE1F3CB2FE4722BA8D37E3EF8B6CC04BA7B3BF4EE268403F98C56
          97FC2E0F0AEB3F2F887C0967213D6583693FA807F5A3ECFF000735F1F25C6A1A
          2CADD8EEDA3F3045237C12D1B5852FE1DF1A69F739E91CA067F307FA574DF133
          E1EEB9AE781341B6B6B74BDD4B4FC472889C61976E0904E33C85AF1AD4BC27AE
          E8C717FA3DF5B81DDE138FCFA56672382307D28A28A28A2BD5BE14EA5A778F7C
          337FF0DFC483CEB6B8858DA963CA8F453D994FCC3FFAD5F24F8BBC2FA9FC1BF8
          8D7BA15F8DAB14FB4328C2B6790C3D99486F6C91DABD47C0DE389BC2FAA5A78A
          6CD99E25021D4E153FEB60CFDEFAAF515F63F84BC436DAF69B0CD6F3ACD1BA07
          8DC74752320D6ED1451451451451451451451451451451451451451451451451
          4514514514514514514514514514514514514514514514514514514515CA7C5A
          F09CDE39F86BE22F0E5AAA9B8D434E9608431006F2A76F27A738E6BE0FFF0086
          09F8C7FF0040FD23FF00062947FC304FC63FFA07E91FF8314A3FE1827E31FF00
          D03F48FF00C18A51FF000C13F18FFE81FA47FE0C52947EC13F18B201D3F4803F
          EC2095EE3FB3DFEC391FC3FF0011DB789FC6DA8DAEA57B66FE659D95BC64C31B
          8E8ECCDF788EA06060F3CD7D523A51D2B98D53E29781F44BE92C352F17E85677
          517124335FC68E9F504E4541FF000BA3E1D7FD0F5E1BFF00C1945FFC551FF0BA
          3E1D7FD0F5E1BFFC1945FF00C551FF000BA3E1D7FD0F5E1BFF00C1945FFC5574
          9617D6BA959C37B653C5716D3A092296260C8EA46430238208EF56A8A28A28A2
          8A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28
          A28A28A28A28A28A28A28A28A28A28A28AE43E215B79B62E40ED5F207C60B022
          498E2B87F02EA060D5ED89202348626F501D78FD57F5A97E22698487F96AEFEC
          77E311E0EF8BDA7412B858AE27365264F01260003FF7F123FCEBE88FDA13C3E7
          4BF19AEA48988750843E40FE35F94FE98AF36A28A28A28A30285CA9041C11D08
          AF68F879AE6A777F06B5A5B2BEB88EFB4D76922915F2C0603E39EDD6B96D33E3
          E78C2C804B89ED2F93B89E0193F88C569FFC2E5F0EEB436F88BC0D63313D6484
          2E7F519FD68D9F0735F1FEB751D1656E9C36D1FA30A3FE14B683AC2EFF000EF8
          DEC6E33D239B19FD0E7F4ACAD4FE02F8C6C416B7B5B7BE41D0C13AE4FE0D8AE5
          B53F086BDA3122FF0046BE800EED0923F31C5659F94ED2304763455AD2354B9D
          1352B6D46CDCA5C5BC82443EE3B5757FB59780ECFE28FC30D3FE2268F10FB55A
          C4A2E0A8E4444F53FEE3FF00E3A5ABE72F865E242A7EC973EF1C88DF9106BE8F
          FD9EBC6F26837B3784EE66252DFF00D234E663F7E1272C9FF0135F4C59DCA5DD
          BA4B190430CD4D45145145145145145145145145145145145145145145145145
          1451451451451451451451451451451451451451451451451451451451451451
          4515E25FB66FC49BFF00871F062EA6D22E8DB6A1A9DCA58432236D78D5831765
          3D8ED5233DB35F9B32CD25C4AD2CB233C8E72CCC7249F526BB6F85FF0002FC6F
          F1852F64F08692B7B1D895170EF3A4614B6703E6233D0FE55DA7FC30F7C69FFA
          16ADBFF0610FFF001551DC7EC4BF1A6DE0794785A29760CEC8EFE12C7E83757D
          C3FB3345AC58FC14F0EE99AF69F7361A8E9D01B29A09D0AB2F96C557AF51B40E
          471E95E99C519146451C519145191471471464572FF153C5D73E03F877AEF896
          CE08A7B8D36CDEE238E5CED623B1C738AF8DFF00E1E41E36FF00A14B40FF00BE
          A5FF00E2ABD3FF0066AFDAFF00C4BF1B3E230F0C6A9A0E95636E2CE4B8F32D99
          CB657181C9C639AFA878A4068C8A5E28E28C8A3228E28C8A38A3228C8A38A322
          8A3228E28E28C8A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A2
          8A28A28A28AC4F15DB79F60E31DABE54F8C9A47331DB5E05672BD9EA4D0A8F9F
          3FBB24E30C0EE5FD463F1AF41F12C71EB7A3C37F10CACF1871F95790C72CBE1E
          F14C1709218448DE5971FC0720AB7E0C14FE15F7CEBD769F187E05E9BE28B788
          7DB20844F222F5474CA4C9F810DF90AF111D28A28A28A28A2BD5BF677B84B9BC
          D6F4393052EECF7E0F7C1DA7F46AF2EBCB56B1BC9AD5C61A191A33F81C7F4A8B
          8A28030411D477AD5D33C5DAF68C47D8359BFB703A2A4CD8FCBA5751A67C79F1
          8E9E02CD736B7A9D08B88464FE2315AA3E34E87AC0DBE23F0469F724F59210B9
          FC3233FAD1BFE0F7883EFA6A5A2487D376D1FF00A10A3FE14CF87759F9BC3BE3
          8B3989E893EDCFE841FD2BBDF86FF0FF0053D0BC3FA9F863C442D2FB4BBA0C13
          CB7DC195C61D4823A1EBF9D7C49F103E1378A7E17F8FAEE17D1B5296C3CF648A
          ED2D99A39429E1C1031CAEDCFBE6BA8D2F5AB8B7B6B2D76C8917DA4C8260BC82
          D1FF001A91E9815F5F7C2EF16DBEB9A6C0F0C9BA1B8896588FB11D3F0E9F8577
          7471451451451451451451451451451451451451451451451451451451451451
          451451451451451451451451451451451451451451451451451451457CB9FF00
          051BFF00925BA0FF00D8607FE8A7AF82ABD33E0C7ED17E2DF81506A5078661D3
          A48F51646985DC25F0541031823D4D7A27FC3C2BE2A7FCF9F877FF00011BFF00
          8BADBF0C7FC1463C6169770A7883C33A3DF5A86FDE1B5DF0C98F6C9238FA57D3
          5E22F17DAFC58FD9F752F12F84F59BFD2C5D696F756F736D218E7B79231B8A12
          0F0415DA71DB35F9EBFF000D03F153FE8A278A3FF0672FF8D7A67ECBDF18FE20
          F893E3AF85F4BD5FC6DAFDFD8CF70E25B7B8BF91E371E5B1C152707915F6B7C7
          74BB3F087C4B2E9FA95EE99796D60F7105D59CCD1491BA0DC3041071C608F435
          F9BBFF000D03F153FE8A278A3FF0672FF8D7B47EC65F16BC75E2EF8E561A5EBD
          E2FD6F53B17B3B866B7BABD79232426412A4E38AF70FDAF7F698BFF8256961A2
          786E185B5CD4636944F32EE4B68C1C676F7627A678E2BE30D47F692F8B1A9DC7
          9F37C40D7D1B18C4176D12FF00DF2B815D3586B3FB4B6A5650DED95FFC469EDA
          7412452C72DC15752320839E8454BF6BFDA7FF00E7E3E24FFDFCB8AF43FD95FE
          237C51B1F8E961A078FF0055F133DB5F413C020D5A494AF9810BAE039C672B8F
          C6BCBBE2978C7E30CFAC7892C6F756F19BE846EEE11E395E730793E61C039F97
          6E31ED5E3D5BFE08D5BC57A3EB3F69F06DCEAD6DA9F94CBBF4D2E25D9DC7C9CE
          3A5771FF000B03F680FF00A0EFC42FFBF9735F5DFC4FF8E1AD7C1DFD99BC35AE
          E649FC4BA959DB5B46F7819996568B73C8E0F248C1E0F735F1A6ABFB4BFC5AD5
          EE3CF9FC7DAE46DCE16DEE4C2BC9CF44C0A934AF8BFF001AF5C576D2FC5FE36B
          D58C80E6DEEE790293D33827146A9F17BE35E84B1B6A9E2FF1B592C848437177
          3C61B1D7192334DD17F69AF8B7A1DD0B883C7BADCC72095BAB833A9C1CE30F91
          5F6A7C3EF89DAB7ED07FB356ADA9C579368DE2182096092E2C2630949E350EAE
          A472A1B8C8F722BE1DFF008681F8A9FF004513C51FF83397FC6BA1F0D7ED1FF1
          75F48D4342D33C49E21D46FAFD9184DE7C93CD0A206DC231CEDCE4648E78ACED
          4FE2DFC6CD0E349353F16F8DEC51CED46B8BA9E30C7D012466AADAFED13F156D
          2749E3F887E2466439024BF775FC54920FE35D67883F687F8E1F1264B6D474ED
          4BC416D05BC0B6E7FB19258E37750373B6CEAC4F27D33C572B7FF1BFE2FE9772
          F697DE3AF175ACE98DF1CD7F3232E464641391C57B07ECD3FB6078D2DBC7DA5F
          86FC65AB49AC695A9CE96825B9C196DDD885460FDC6719CFAE6BE98FDA8BE3A4
          9F033C011EA5616F15C6AD7F37D9EC96504C687192ED8EA00EDDF35F096BDFB5
          07C5CF10DD9B99FC75AC5B7CC488ECE636E8B9ED84C71C77AD3F0FF8BBF688F1
          569CBA8E87ACFC40D42C9D8AACF6D713BA123A8041C7157FED9FB4FF00FCFC7C
          49FF00BF9715B1F0D3E22FC6BF077C56F0C9F1AEA7E334D324D4228EE62D4A59
          842E8EDB3E6DDC639CFE15FA1E3EED2D14514514514514514514514514514514
          514514514514514514514514554D4E1135AB2E3B57CF7F18742DF1CC76D7C9FE
          2FB5934DD57CD4F9486E0FA1CF15DAF826F9356D1E7B139F9479F08231F23750
          3E8D915C0FC41D0883210B5F457EC2BF15A3B8175E08D4E4056F434D6E1CF026
          550244C7FB4803FD43D5FF00897E0F7F05F8B2EAC02916B21F36D9BD50F6FC0F
          1F857334514514514576BF04B54FECBF889A7E4E16E035B9FF00810E3F502A9F
          C57D2FFB23E20EAF005C234DE6AF1D9C06FE64D72D451451451460673819AEAB
          E1C78CB50F0EF8AF4C76BFB9FB199D639A2329D855B83C74E339AE9FF6B5F885
          E37F85FF00D8FAF786EF21FECF915D65B79E10E8654F987A11B937F7FE1AE1FC
          0FFB5559F8D2111F8ABC07A1DD9946D692D936923DC367F9D72DE24F891E27F0
          E78D6E63F8649FD9FA35BC68D1E9B74C098588F9BCB209CA1383CF42715D1E9B
          FB687C44F0EA4717897C0D1DC85E1A584152E3D460E3F435DA681FB7A7816F25
          48759D3353D28B0E59D03283E9DABD23C33FB46FC34F14A66CBC516A8F8E526C
          A11FD3F2AEE74ED6B4ED5A2592C2FEDAE9186418A50D91F855DC8A28A28A28A2
          8A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28
          A28A28A28A28A28A28A28A28A28A28A28A28AF9DBF6FDF0ADD6BFF000523BFB3
          86595B4AD463B998274588AB2B31FA12B5F9E1451457DDDFB27C8F27EC7BE225
          762C10EA0AA09E83CA0703F3AF846BD67F641FF9389F097FD7CBFF00E8A7AFD0
          CF8E1FF247FC5BFF00608B8FFD00D7E4D57BD7EC1DFF00270BA77FD78DCFFE81
          5D17FC145148F8B7A412A403A42E0E3AFEF1EBE63AF53D0FF6A9F8B5E1CD22DB
          48D37C6175159DA4422810C51B144030064AE78156FF00E1B13E33FF00D0E971
          FF0080F17FF135EB7FB347ED79E27F127C42D2BC29E3F92D758B6BF9FCBB4BC7
          B75596DA6E769C800104F1D322BE9DFDA3FF00E485F8C71FF40A97F957E54D7D
          0FFF0004FF00FF0092F03FEC173FFECB5FA235F2BFFC147FFE499F873FEC31FF
          00B45EBE0FAFA6FF00644FDA63C17F03BC27ABE97E2587537B8BCBD59A33696E
          AE3684C724B0EF563F6B6FDA83C13F1B7C07A768BE1B83554BAB6D416E18DD5B
          AA2EC08CA70431E72457CB95F747EC2DFF0026F5E2DFFAFAB8FF00D102BE17AF
          A67FE09DB1A3FC61D4D9914B2E90FB491C8F9D3A57B07FC145D47FC2A6D18903
          23575C1FFB66F5F0357E87FF00C13F3FE4841C7FD0567FE4B5F2E7EDBDFF0027
          21E21FFAE56BFF00A4F1D792786E796DBC43A6CD136D923BB8994FA10C315F67
          FF00C14618BF803C20EDD4DEB93FF7EC57C3F5E89E07FDA23E24FC3BD063D07C
          37E279EC74E89D9E380448C14B1C9C6549EBCD6D7FC3627C67FF00A1D2E3FF00
          01E2FF00E26BAFF85DFB6C78F2D7C4B6563E33B9B4F10E87737289731DCDB2EF
          8D4B0F990A81C8EB820F4AFD094219411D0F34EA28A28A28A28A28A28A28A28A
          28A28A28A28A28A28A28A28A28A28A28A6C8A1908F6AF2FF0089DA18B8B69085
          CE457C83F15BC3CD14B290B8C571DE04D7DF49D415989CC4C58A81F790F0EBFC
          9BF035DBF8D7468EF2DBCF84078E45DCA47718AF32F0DEBB7DF0FBC696BA959C
          FF006768E7492390F48E4539463ED9E0FB135F7BEAA6C3E3E7C2AB3F12691181
          A8C085BC9C8DD1C8BC4909FC471F81EF5E1641425581520E0823A52514514514
          55DD07503A4EB9617CA706DEE524FC981AF45FDA374E58FC47A76A718F92F2D3
          1B8772A7FC08AF2DA28A28A28A2804A9041C11C822BD9BE3FD843E39FD9C0EAA
          E9E63D9C306A23FE03F2BFFE3ACE2BE25F01DCBE99A8BD9BB61A194C67F038AF
          4AD71FC8BFD335343B566536F2903BF55FD09AEDBC2FA85C983C9249C718356A
          FF0040D1753575BFD12CA6DFF78988027F115CBEA5F04BC0FA9FCC9612D94B9C
          87864C63F035967E096A3A6156F0DF8D2FECF1C8491D8053EDD6BADF08EA7F1F
          BC23AD594E9AD1F1169B0CAA6685640C658C755C1E41C7B57D85A5EA316A3671
          5C468E82440E15D76B2E46704763ED5728A28A28A28A28A28A28A28A28A28A28
          A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A
          28A28A28A28A2B9CF1D78D3C31E06D223BAF165FDB58E9D7738B3F32E1731966
          56215B8C00429EBC5793DF7C32FD987599FED9341E0B0D2FCD98B5158C1CF39C
          2B81DEA0FF008539FB2DE3FD57847FF06FFF00DB2BE71FDB27C1DF0A3C2971E1
          DFF856B269A259966FB6C56375E72050576313938392C3AF6AF9DEBEF6FD8F34
          D9750FD93B5BB300A1B996FD518AF5CC60647AF35F05B29462A41041C107B57A
          AFEC97710DAFED09E1192799224FB532EE760064C6C00FCF02BF42BE385CC03E
          0FF8B499A303FB22E3F887F70D7E4F57BD7EC1DFF270BA77FD78DCFF00E815F4
          FF00ED3DF01B49FDA124B6B4D1FC41A7D8F8AB445DA6299F3BA270182BA8E473
          820E3B9AF9D7FE1DE9F14FFE823E17FF00C0C93FF8DD07FE09E9F14C0246A1E1
          838EC2F24FFE375E07E23F0FDEF8575FBFD0F52454BCB0B87B69D558300EA483
          83DC645753FB3EFF00C96CF077FD85A1FF00D0ABF46BF68F1FF162BC6381FF00
          30A97F957E54D7D09FB035CC36FF001E2312CB1C664D36754DCC06E3C1C0F7C0
          35FA1C6EA050499A30075F9857CA7FF050BD56C758F855E1CBAD3AF2DEEE1FED
          A64F320903AE444E08C8EE0D7C335F477ECA1FB37F81FE3A681ABDC78835AD4A
          D2FEC6E55160B3B88D3F765721886427AE466BDAFF00E1DE1F0BBFE862F12FFE
          0541FF00C6E90FFC13C7E172A927C47E25000C93F6A838FF00C875E87F0B7E18
          7847E15FC2DF11695E0CD6E7D5AC9FED0F2CD2CF1CA5251160AE5001C0038F7A
          FCC4AFA6FF00E09D9FF257F55FFB043FFE8695EBFF00F0518FF924BA37FD85D7
          FF0045BD7C0B5FA1FF00F04FCFF92107FEC2B3FF0025AF977F6DFF00F938FF00
          117FD72B5FFD278EBC8342FF0090D587FD7CC7FF00A10AFD2AFDA07E15683F1B
          3C1B65E10BAD6ED34CD71545DE986461B890B86F97392A41C1C74AF9664FF827
          9FC51591826A7E1865070A7ED720C8F5C7974CFF00877A7C53FF00A08F85FF00
          F0324FFE375E31F12FE1CEB3F0A7C5775E17D7C5B7DBAD82B31B7977A3061904
          1FA7A806B0B47FF90ADA7FD774FF00D0857EC4C1FEA53FDD1525145145145145
          1451451451451451451451451451451451451451451451815CFF008AF4D17568
          E0AF6AF983E2FF00857FD6B08FF4AF99B5AB79744D55668C60ABE464719FF3C5
          7A6F82355875CD1BFB358E4A47E65B67A94CF2BF553C571BE3DF0D7FAC212BD1
          7F641F8ECDF0F7C48DA16B53EDD2EF5962B92C7FD537DD49FE83856F6DA7B1AF
          78F8E9F0DC69575FF0936951036572D9B954E91B9FE21EC7F9FD6BCAA8A28A28
          A28232315EC3F14C7FC241F08FC33AE81B9E1D88EDF552A7FF001E515E3C3A51
          451451451476AFA17C23683C45FB3EDC69D2A798B3699756DB71D78702BF3E2D
          1DAD7C4EE49E6548A53F56404FEB9AF55BCCDEF8365753F3DB95994FA60F3FA6
          6BD5FE1D68906AD1DA5C2329171023FCBD338E7F5AF46BBF85B318C3C6990464
          715857BF0EEEE127F727F0159173E11BA833989C7E156F428AEAC6650770C57A
          DF84354728AAE6BB252194114B45145145145145145145145145145145145145
          1451451451451451451451451451451451451451451451451451451451451451
          451457937ED61E01D4FE23FC15D5745D16C1EFB5112453DB408406665719C67F
          D92D5F0AFF00C325FC64FF00A10F51FF00BE93FF008AA3FE192BE32FFD087A8F
          FDF49FFC551FF0C95F197FE843D47FEFA4FF00E2AB7BC29FB117C5CF11DE451D
          DE870E8D6CCFB649AF6E146C1DCED5C93EDC57DF1F0AFE1BE9DF0ABC03A6784B
          4F769A0B28B6BC8E003339E5D88F724F15F237C76FD853C543C577BAD7C3F4B4
          BFD2EF2669FEC465114B6C58925467865F4E73DB15E46BFB26FC6552197C0BA9
          023A61938FFC7AAD7FC32AFC5A874CD4752D6342974AB0B0B57B9B89AEE7006D
          552D800124938C7E35E3F5EF5FB077FC9C2E9DFF005E373FFA057ABFED97F02F
          C7FE32F8A5A77897C0FA1DEDE86D3D23966B5976B472231C672460E08E95E39F
          F0A13F68CFFA0378A3FF0003BFFB3A5FF8509FB467FD01BC51FF0081DFFD9D64
          C9FB287C68BA9DA49BC0FA9B4923659D9D09249E493BABDEBF65FF00D8C75FF0
          878CED7C63E3D16D6EDA6BEFB2B08A41233498C0772380067200CE4D7D6DADE8
          B6BE20D1AF748BE8F7DA5EC0F6F32F4CA329523F235F9F5F113F616F89BE17D5
          AE97C3F61178834B0E4DB4B6F32ACA509E0323630DEB8C8F7AE453F64DF8CF1B
          064F02EA6A47421907FECD527FC32BFC6DC60F82F56FFBFABFFC557D3F67FB2E
          6A1E2EFD93345F035FC434AF11DA48F7F1ADC1C88E72EFF23119C02AC0719C57
          CD1AB7EC71F19349B9F27FE10F96EC7387B59E375EBEB9AA91FECA1F1A61E63F
          036A899FEEBA0FFD9A9FFF000CAFF1B7FE84BD5FFEFEAFFF001541FD95FE36F4
          3E0BD5BFEFEAFF00F155F5EFC29F05F8A7E177ECA13E916DE1FB97F13CB6F707
          EC0A17CCF3A462A09E71C2ED27D857C7BFF0C97F193FE843D47FEFA4FF00E2AB
          D6BF64EF839F147E147C60B0D5F5AF046A50E99710C9697336E4C441870E46EE
          8180CFB57A9FEDC3E0CF1BFC49D1343F0DF847C317DAA4714ED79753C41362F0
          555324839E49FA62BE52FF00864BF8C9FF00421EA3FF007D27FF00155F61FEC4
          FE12F17F803E1E6A3E1AF16F872EB48921BE33DBBCA57132BA8CE304F20AFEB5
          F3FF00ED1DF033E2C7C4EF8C9E20F11E9BE04D44D8CD32C56CD94F9D234540DF
          7BBEDCFE35C0DAFECA9F19ED2EA1B84F016A05A270EA0B26320E7FBD5F48FED7
          7F09FC69F163C23E04D67C3FE1ABD6D6AD6165BDB54DA24B7DE8870C77766523
          8CF5AF021F013F68CEDA378A3FF03BFF00B3A3FE1427ED19FF00406F147FE077
          FF00675997BFB2CFC6ED46E1EE6F3C17ABDC4EFCB492CAACCDF525ABD3FE06FE
          C2BE2EBBF15586ADE3EB7B7D3348B57599ED44C1E6B82304261721467A9273ED
          5F762A85000E8053A8A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A
          28A28A28A28A82F201342411DABC83E27F85D6E609084EDE95F247C50F099865
          93098C7B570DE10D767D1752487CCD8EB26E889E81FD0FB30E0FBE2BD5F53B7B
          6F13E8E97F6EBC3AE1D4F5461D41FC6BC93C47A44FA36A0B7B6ABB6488E471C1
          1DC1F6238AFAEFF64BF8F163E3AF0FA7807C4B2AC9279261B169CE4C898E6063
          FDE51F77D547A83517C50F86F75E02D573186974BB8626DA5C7DDFF61BDC7EB5
          C751451451457B1F8557FE123F803AAE9F8DD269E64751E9B4F983F99AF1C1D2
          8A28A28A28A3B57D2FF05A3FF8B5564AC38659BF2DED5F9CBA8E22F1447B7A79
          2A3F2247F4AF5AF0AA8BCD16E2DDB91240CBFA577BF0375955D0F4C0ADCC2ED1
          30F4EF8AFABBC39742F34C898F381579ED217FBD1A9FC2AA4FE1FB0B81F340A3
          E959B3F8134F91B72A007E94FB4F0BAD8B0319E95B56EAC89B5BB54B45145145
          1451451451451451451451451451451451451451451451451451451451451451
          45145145145145145145145145145145145145181E945181E948C3E52071C57C
          11E25FDB3FE2D7C37F18EBFE189AE34CD4574ED4A7B78A4BCB3C38559182FDD2
          B918C727B62A87FC3C33E297FCF87877FF00015FFF008BACBF167EDCDF12BC61
          E1AD4340BBB6D0E0B7BFB76B795E1B560E15860E32C474F6AF02AFA7FF00E09F
          9F0FF57D4BE284DE2EFB3C91693A6D9C91199D08596471B4229E8481927D31EF
          5F7C803B5181E94607A51F8514514607A5181E94605181451814607A5181E946
          07A5181E94607A5181E94607A5181E94607A5181E94607A5181E94607A518145
          1451451451451451451451451451451451451451451451451451451451450402
          315CE78A3485BCB771B73C57CDBF167C13B848C23FD2BE5DF19E81269D76CEA8
          460F35D27C37F1C085CC576FB91B0B72A7B8E8241F4E87F3AE9FC63E198EEA23
          2C403A32E548E845796892FBC17ACAEA164D226D70CDE5B6D6041C8653D981E4
          1AFB97E04FC69D0FE3DF84BFE118F12985F5610724E145E28FF9689E922F1B94
          743C8E0D719F113E1CEA1E01D4CC72AB4D612B1FB35C85E187F74FA3572D4514
          51457AF7ECE9729789AFE8529CA5C40B2053D3BAB7F315E4F7D6AD617B716AE3
          0D0CAD19FC0E2A1A28A28A28A0F4AFA8FC2B0FFC22BF09ADDA55DA6D74C69DC7
          4C1DA5CFF3AFCD5BE6DFE2283D45AC44FD4AEEFEB5EBDE03FF0050ABD88C56BF
          C239CDA417480E025EE47FDF4C3FA57D75F0EEFBCFD32304FF0008AEB68A28C0
          A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A
          28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A2B0AF3C05E
          15D42EA4B9BBF0D68F713CADBA4965B28D99CFA92464D47FF0AD3C1BFF00429E
          85FF0082F8BFF89A3FE15A7837FE853D0BFF0005F17FF1347FC2B4F06FFD0A7A
          17FE0BE2FF00E26B5F4FD3ACF4AB54B5B0B482D604FBB14318451F4038AB5451
          4514514514514514514514514514514514514514514514514514514514514514
          5145145145145145145145145145145145150DD42258C822BCDBC7FE165BC81C
          88C1E3D2BE58F8A7E0531BCAC22FD2BC26FADEE7C3FA909E1250A36471C7D0FB
          1AF53F87FE32B3D4EC574EB86C42C76C45CF30B1FE027D0F63478C7C201D5888
          C7E55E7DA56A9AAFC3CD723D474E9A787CA94480C4DB591874753D88FC88E0F0
          6BEE2F827F1EBC3BF1DFC389E1AF137D9BFB5A48B6ED3F2A5E6072C9FDD90752
          9D4751915CD7C49F849A8F82277BBB547BAD218E56603262FF0065FF00C7A1AE
          1E8A28A2BBCF80DA97F677C43B58CB616EA2784FD7191FCAB33E2CE97FD93F10
          B57842ED5926F3978ECC01FE64D72D4514514515B3E08F0F49E28F14E9FA5A29
          2B2CC0CBEC83963F957B97ED1DE205F0AFC16D7BC893CA9EEED869D6A077797F
          7600FC093F857E764663BCF145DC917FAA597CB8FF00DD5F947E82BD93C0F179
          7129EC0549F0EAE36C574477BA27FF0022357D5DF0AEEB759C433D857A38E945
          1451451451451451451451451451451451451451451451451451451451451451
          4514514514514514514514514514514514514514514514514514514514514514
          5145145145145145145145145145145145145145145145145145145145145145
          14514514514514514514514514514514514514514605666AFA725CC4C0A839AF
          16F893E085B98A4222FD2BE5BF88DE076B79652223F957975BDD5D786F502506
          636F95D1BA32FA7D7D0F6AF62F0678C6D35FB18EC6F260C186D82673CE7FB8FE
          8C3F5AA7E2EF0707DE447FA579E42DA9782F53179A7BC8815C395562BC8390CA
          472AC3B115F617C00FDADF4AF17E9D1787BC757112CAC04297F300164C8C6C9C
          7456EDBFEEB7FB278AEB7E21FC045757D57C2386461BDACB7707DE33FD3F2AF1
          DB9B69ACE67B7B886486543874752ACA7D08351D1456AF84351FEC8F14E957C0
          E041771B9FA6E19FD335DFFED21A6083C4BA7EA48BF2DDDB6D27D4A9FF00022B
          CAE8A28A28A322BDEFF67FF01B691A73F88AF622B73769B2DD5860A459EBF891
          F9015E45FB70FC4C43A85A785AD26062D223FB75D007FE5E5D4AC09F50A5DFF2
          AF97BC1962CCEACC3249C9AF67D100B0D22E2E1B811C2CD9FC2B3FE1D878B4E0
          D27DE9A5523F1F9BFA9AFAAFE144845AC5F415EAA9F747D2968A28A28A28A28A
          28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A2
          8A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28
          A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A
          28A28A28A28A28A28A28A28A28A2919430C62B9DF11E889790B0DA0FE15E0BF1
          33E1FACCB2B08BF4AF99FC7DE077B6964223FD2B81B1BFBAF0DDD91B4BC4C70F
          19380C3FA11D8D7B07833C7569AD5945697F28646C2453B7553FDC7F43E87BD4
          9E28F072CA19950107A102BCCB53F0FDDE8D79F6AB2768655F41C11DC11DC7B5
          7B47C07FDAE75AF0118743D691AFF4C18516B2CB86887FD3176E00FF00A66DC7
          A11D2BEA9863F87FF1F345FB769D7514D3A0C19231E5DCDB9FEEBA9E7F0231E9
          5E5FE33F82BE21F0917B88223A958AF226817E651FED2F51F864570BD3823A51
          472391D474AF6AF8C2A3C41F0B3C3DAF2805A3F2F711DB7A60FEA0578AD14514
          51C015E9DF087E104DE239E2D6B5B81A2D2D0EE8A26183707E9FDDFE75EA5F16
          7E2669BF08FC1B36B1728B2CE4791A7D9A70D73311F2228F4F53D80AFCE2F1F7
          88EFBC5BE239DAF6E7ED5752DC35CDF4E0E44B3B7503FD951851EC2BA2F06E93
          829F2D76FE2C9C69BE127814ED92E99615FC7A9A4F06C4A8B650A12C092F93E9
          DABEA4F85B1ECB68B8EC2BD523FF00563E94EA28A28A28A28A28A28A28A28A28
          A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A
          28A28A28A28A28A28A28A28A28A28A4C7A52D145200718229714514605145145
          1451451451451451451451451451451451451451451451451451451451451451
          45145145145145145145145145145145326884884115C8F8A7C371DE42FF0020
          E47A5781FC49F8761C48CB08E9E95F3978DFC0CF6D23E22C7E15C0C13DE7876E
          CBC7F74F0CAC32AE3D08AF53F03FC49826B65B5BA2D35B28C32B1CC907FF0014
          BFCABA7D5BC376BAA5A8B9B464962719565E95E71E24F04905B117E954BC35E3
          3F12FC3BD4E2BCD3EF6EE36878496194A4A83D03775FF65811ED5F54FC23FDB8
          2D3548E2B0F18DAF98C061AF6D23C3AFBC90F53F54CFD057B34BE16F879F17B4
          D1AAE97359DCF983FE3EEC1C2B83E8C3D7D9866BCFFC45FB39EB9624C9A2DDC1
          7F10E91B9F2E4FD783FA5701ABF8535AD01CA6A7A5DD5AE38CBC676FE7D2BD63
          C3C3FE127FD9E6F6D061A5B149368FF71B78FD2BC50628A28CE2B6FC39E04F10
          78A9D574AD2E69509C19586C8C7FC08F15EC9E03F805A7688E97DE2078F50BA5
          E56003F7287DF3F78FE9ED5D2FC4AF8A9E1CF84FA10BFD66E4891FF77696702E
          E9AE5F1C2A28FE7D077AF82BE377C6AD6BE21F8926BCBD980BD2A62B7B689F74
          5A6C47AA29EF21FE27FC0715C6F86743259495C93DEBD63C29A3EC09F2D66F8C
          F511AA6BD1D940C4C3663671DDDBAFE433FA574DE05B7FB56A8A547CA9841F87
          FF005EBEA4F8756BE55B47C76AF46886100F6A75145145145145145145145145
          1451451451451451451451451451451451451451451451451451451451451451
          4514514514514514514514514514514514514514514514514514514514514514
          5145145145145145145145145145145145145145145145145145145145145145
          14514514514514514514543716EB2A904571FE29F0B477913FEEC1C8F4AF07F8
          89F0DC3891961F5ED5F3E78D7C02F03B911631ED5E6F736577A2DD2CD033C6C8
          72ACBC15AEC3C15F13A6D32458E49122663F3A30C4327FF127DFA57A8595EE93
          E2C8B6C244374065A07E08FA7A8AE7F5FF0004060C0463F2AE0F57F0649049BE
          3568DD790CBC1152F87BC7BE2BF036A0B7B677B749321FF5F0CA629B1E8587DE
          1ECC08AF7DF879FB78EB36212D7C4505AEAA8BC6661F659FFEFB198DBF25AF74
          F0CFED57F0DBC4B02ADFDECDA3B30E46A10622FA798B943F9D7A0E8173E18D73
          4D98E833E977567740F9A6CDD195F23073B7DAB9BBBF801E0BB9394B5BBB7F68
          AE0E3F5CD533FB3878509E2EB5503D3CE5FF00E26A7B6FD9E7C1D010645D427C
          767B8E3F402B7F4AF85FE11D0C87B4D0AD37AF47957791F8B6699E2CF8A1E0AF
          87F07FC4FBC45A769D85CAC2D282EC3FD941927F015E13F13FF6D58AD2DA4B7F
          0869EB66A4606A5ABA15FC63807CEC7D0B6057CA7E2EF897AD78C3549EF4DEDE
          DDDE5C0DB36A176D99997FBA80711A7FB2B54742F0EB3382CA493D49AF46F0DF
          8742ECF93F4AE975CD562F0AE91FBB1BAF271B208C7524F7AE12C418D8B97F32
          424FCC47DE73D4FD3FA015EBFF000AF4621A2257D2BE99F05DA7956D1F1DABB2
          418502968A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A
          28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A2
          8A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28
          A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A867B75957
          04035C97897C2D1DE46DFBB078F4AF14F1EFC3712072B0FE95E0BE33F878D134
          98888C7B5794EB7E169ACE462AA462A3D23C517DA232452869228CFCA376193F
          DD6EDF4E95EABE15F8A71DFC421BD3F6D8D40C90B8993EABFC5F515D47F67E97
          E22B6F3F4F9E3994F653C8FA8AE6F57F04039C47FA5721AA781C827F75FA5630
          D0F51D2643258DCCF6CC3FE79B915EBBFB24F8D35AF0FF00C65B182E23B7B81A
          8DBCB6C58C415D8EDDC3E61EEB5A9F1CBE33F8E7E1E7C5DD734DB2D5FC43656A
          655B88A287513B155D4370ACA401927815836DFB62FC42B740A3C49AD63FE9A4
          16D21FCCC6292E7F6C3F1FDCC7B1BC51AE0FFAE505B467F3119AE635CF8FFE30
          F1046D0DE6B1E23BD8DBAC773AA3843F558F6D72A7C43AD4AECD691DB69E64FB
          CD6F161CFD58E4FEB50C1E1FB9BD97CDB979257279673935D2E93E15FBB88EBB
          5D13C32176FC95D0DFDEE9FE12D3FED374C37E3F7718EAC7B579C6B1ABDCEB17
          D25CDDB813302BB3B429DC7D48EBE9D3D6B53C29A736A3788DB4F96BC283FCEB
          E8DF869A0794B11D9D857BAF87ED3C98138ED5B8060628A28A28A28A28A28A28
          A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A
          28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A2
          8A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28
          A28A28A28A28A28A28A28A28A28A28A8E681655C115CE6BBE1A8EEE361B0735E
          4DE35F872932B9117E95E1FE32F86C632FFBAFD2BC93C47E067859BF767F2AE3
          6EB49BAD3A50C9B8153C107047D0D6B68DE3CBDD3E70F70643202312C476483E
          BD9BF1AF49F0E7C5A17CA22BA58AF8700ED1B251FF00013D7F0AEA2D750D075F
          F960B948E5EF14BF2B0FC2A3BEF06A38CAA020F4C53FC07A3BF863C7BA0EB11A
          63ECBA844E7FDDDC011F9135E81FB68F8096EFC67A4EBB1C436DDD8985980FE2
          8DB8FD1C7E55F3F49E0A39FF0057FA5463C147FE79FE953C3E0BF58FF4AD0B4F
          07723E4FD2B6AC7C241703CBFD2BA0B2F0EC56C9BE4DA8A3A93C0ACED67C7361
          A4EEB5D2E31797407241C227B93D87D6BCF754D76E2FEEDA79A7F3EE7BCBD122
          F65FF1EBE98A348B0935195511488F39E9CB57B37C3DF0AE1A3253D3B57D0BE0
          9D0C411A1DBDABD22C2111C6063B55BA28A28A28A28A28A28A28A28A28A28A28
          A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A
          28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A2
          8A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28
          A28A28A28A28A28A28A6BC61C608AC9D4F448EE908280D79FF008A3C031DC2B9
          110FCABC7BC5DF0CB96221FD2BC9BC4BF0E9A32D88BF4AF3CD6BC10F1B1C47FA
          573375A25CDA3654138E9535A788F52B0558A56F3A35E024C3763E87A8AE9F45
          F8A973A7ED0B3DDDB285E8AC254CFD0F3FAD763A4FC63F3BCBF33EC374DB801B
          5FCB7CF6183819FC6BE8CF8C1F13BC19E2EF855A36B0359B292F2D9E213D9A4C
          A67859D70CAC99C821860D78BAF8ABC2D2FDEBC1193D9D3152AEB7E186191A9D
          BFE74D7F11F85A0196D4A138F4A85BC79E1D8B3F6659EE48ED1C79ACDD43E28C
          9127FA269F15B03C07B99029FF00BE7AFE95C86B1E37B8D5188B9BE9AEF071E5
          43F247F9F53FA561C9A8CD758841023CE44310C28FA9FEBD6B5347D067BE910B
          AE141E140E057AA782FC187721F2FF004AF75F04785442A9F263A76AF5AD0B4D
          1044A36F6AE82350AB814EA28A28A28A28A28A28A28A28A28A28A28A28A28A28
          A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A
          28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A2
          8A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28
          A28A28A28A28C71CD56B9B18E7520A8AE675BF084574AC7CB15E6FE26F86EB26
          E2211F95797F893E19105B10FE95E75AEFC39642C3C9FD2B8BD57C06F193FBAF
          D2B98D47C212420911915873E953C27A1E3DABAAB3B895350D32F9189B9B9D3E
          48837759555941FAF02B122D7F580C5DAF2E8927272723F2AB4BE28D50759B3F
          5B753FD29DFF000936A8C3027DBFEEC0A3FA5346A9A94A0A9B9BB607A8DF8144
          56773330C45F8B64D6A597872E6E080FB88F41C0AEB342F053315FDD7E95E93E
          15F029253F75FA57AF7847C18220998BF4AF53D03435B745F9718AEA6DA011A8
          18C54F4514514514514514514514514514514514514514514514514514514514
          5145145145145145145145145145145145145145145145145145145145145145
          1451451451451451451451451451451451451451451451451451451451451451
          4514514514514514514514514514514514514514514514514514514514514514
          D68D5C608AA579A44370082A2B97D67C1315C292221F9570BAEFC3747DD887F4
          AE0F5BF86432D884FE55C37883E1A98E262213C7B579AEB7E0B3048C3CB231ED
          5CEEAB6DFD8F6DA75C052AF677C18F1C157C7F553F9D5E83C22659A4023E8E47
          038EB56FFE1056FF009E47F2A7C7E056CFFAA3F955DB5F01B138F28FE55B561E
          013C7EE8FE55D4691F0F8E47EE4FE55DD681F0FC02B98BF4AF44F0F7829620BF
          BBFD2BBED1F4148157E5C63DABA2B6B558946055903031451451451451451451
          4514514514514514514514514514514514514514514514514514514514514514
          5145145145145145145145145145145145145145145145145145145145145145
          1451451451451451451451451451451451451451451451451451451451451451
          4514514514514514514514514514514514514514514521456EA2AADC6970CE30
          50562DFF0084619C1C20FCAB95D7BE1FA496CF88BB7A5788F8CFC1020B89008F
          F4AF1BF8A7E1E36BE1EB929167E5DF903A1520FF00226B7FE12E9B1F883488A5
          077B0085BDB2A3FA835EA70FC391244AC23EDE952A7C3700FF00AAFD2AEDAFC3
          9008FDD7E95B361F0F42E3F75FA5749A67811108FDDFE95D4699E134871F20E3
          DABA1B2D1D20030A2B4A2B758C00054A060628A28A28A28A28A28A28A28A28A2
          8A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28
          A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A
          28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A2
          8A28A28A28A28A28A28A28A28A28A28A28A28A28A8AE225922652A0E45790FC4
          2D262F3998201D7B5786FC4ED07ED5E1DBB585416E8411D98153FF00A17E95CB
          FEC9B76B3C973A54A9F3203CFF00BADD3FF1F3F957D8DA178622B8B25214741D
          AB40784221FC03F2A963F0AC4BFC03F2AB70E811478F907E556E2D3638FA28FC
          AAC24089D00A90003A0A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28
          A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A
          28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A2
          8A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28
          A28A28A28A28A28A28A28A28A290F4C579CFC43B4E1980E95E2DE2EB26BAD32F
          6DD4E19E170A7DF1C7EA05789FC09BF7F0EFC5AB9B2122885EE73F557042FEAC
          95F7BF822E84D66AB9FE115D2D1C014514514514514514514514514514514514
          5145145145145145145145145145145145145145145145145145145145145145
          1451451451451451451451451451451451451451451451451451451451451451
          4514514514514514514514514514514514514514514514514514514514514514
          514514514514514514514514514514514514514514515C6F8F6D37DBB9C76AF1
          6D6E1025391C66BE65D4513C2DF172078A468E31C647AC6C703FF1D15F7AFC37
          D492E2DE2911814750CA477046457A0514514514514514514514514514514514
          5145145145145145145145145145145145145145145145145145145145145145
          1451451451451451451451451451451451451451451451451451451451451451
          4514514514514514514514514514514514514514514514514514514514514514
          514514514514514514514514514514514514514514514515CFF8BEDFCCB3638E
          D5E21E238364AE31D0D7CD1F1D6D469BE2CB0D4562C224EACE7B306038FCD5AB
          EB2F807AE2EA1E16D2E443C240B0FF00DF1F27FECB5EE5136F8D4FA8A7514514
          5145145145145145145145145145145145145145145145145145145145145145
          1451451451451451451451451451451451451451451451451451451451451451
          4514514514514514514514514514514514514514514514514514514514514514
          5145145145145145145145145145145145145145145145145145145145145145
          14514514566EBF1092C5B8E82BC47C5B6DB2E6418EF5F3DFED15A54971A2ADCA
          01B634DC7EAAC31FA39AF52FD947C44D7FE1748E423F74EA579EAAC83FF660D5
          F54E992F9B6887DAACD145145145145145145145145145145145145145145145
          1451451451451451451451451451451451451451451451451451451451451451
          4514514514514514514514514514514514514514514514514514514514514514
          5145145145145145145145145145145145145145145145145145145145145145
          14514514514514514514514514514514557D423F32D5C7B578D78DED765CBF15
          E29F177481A9786665270109CFB8652A07E657F2AC2FD8FB5DF267B8B0925F9B
          61544FF71B3FFB39AFB7BC3171E758A8CF6AD7A28A28A28A28A28A28A28A28A2
          8A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28
          A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A
          28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A2
          8A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A64CA1A261EA
          2BCB7C79607CC6602BC87C67A2C9A8E91776B1C61E464CC6A4E373039519EDC8
          15E63F077C17AEF80FC796D73268FA98B7B89CAB318559215657049656231CAF
          A74AFB5FC0D75E65BA29F4AEAA8A28A28A28A28A28A28A28A28A28A28A28A28A
          28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A2
          8A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28
          A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A
          28A28A28A28A28A28A28A28A28A28A28A28A28A283D315C5F8C74FF3558815E6
          7AB692779217F4A874EB231C838AF4CF0448630833D2BBA1C8CD145145145145
          1451451451451451451451451451451451451451451451451451451451451451
          4514514514514514514514514514514514514514514514514514514514514514
          5145145145145145145145145145145145145145145145145145145145145145
          1451451451451451451451451451451451451451451451451451451451451451
          451591AEDA09A36E3B570DA9E8F96385ACF8B492927DDAEA3C370F912018AEDA
          2398C1F6A7514514514514514514514514514514514514514514514514514514
          5145145145145145145145145145145145145145145145145145145145145145
          1451451451451451451451451451451451451451451451451451451451451451
          4514514514514514514514514514514514514514514514514514514514514514
          5145145145145145145145145417510917158779A60727E5AA07490ADC2FE957
          6C2CFCA70718AE86DF88C0F4A928A28A28A28A28A28A28A28A28A28A28A28A28
          A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A
          28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A2
          8A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28
          A28A28A28A28A28A28A28A28A28A28A28A28A28A2908C8C544F6C1BD2A16B11E
          8285B4DBD055989768C53E8A28A28A28A28A28A28A28A28A28A28A28A28A28A2
          8A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28
          A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A
          28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A2
          8A28A28A28A28A28A28A28A28A28A28A28A28A28A3028A28A28A28A28A28A28A
          28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A2
          8A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28
          A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A28A
          28A28A28A28A28A28A28A28AFFD9}
        Stretch = True
      end
      object PsQRMemo1: TQRMemo
        Left = 901
        Top = 60
        Width = 160
        Height = 41
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          108.479166666667000000
          2383.895833333330000000
          158.750000000000000000
          423.333333333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Verdana'
        Font.Style = []
        Lines.Strings = (
          'Unit 3, Epsom Downs Metro Centre,'
          'Waterfield, Tadworth, Surrey KT20 5LR'
          'Tel: 01737 851851')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 6
      end
    end
    object QRBand2: TQRSubDetail
      Left = 19
      Top = 629
      Width = 1085
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
        2870.729166666667000000)
      Master = PBDelivQuickReport
      DataSet = PBPODM.GetPickCallOffSQL
      PrintBefore = False
      PrintIfEmpty = True
      object QRShape1: TQRShape
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
      object QRLabel13: TQRLabel
        Left = 136
        Top = 0
        Width = 75
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          359.833333333333000000
          0.000000000000000000
          198.437500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRLabel13'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
      object QRLabel14: TQRLabel
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 11
      end
    end
    object QRLabel15: TQRLabel
      Left = 844
      Top = 707
      Width = 188
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333300000
        2233.083333333330000000
        1870.604166666670000000
        497.416666666667000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Date ___________________'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRLabel16: TQRLabel
      Left = 467
      Top = 707
      Width = 326
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333300000
        1235.604166666670000000
        1870.604166666670000000
        862.541666666667000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Print Name _______________________________'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRLabel17: TQRLabel
      Left = 48
      Top = 707
      Width = 363
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333300000
        127.000000000000000000
        1870.604166666670000000
        960.437500000000000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'Signature _____________________________________'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRLabel18: TQRLabel
      Left = 40
      Top = 659
      Width = 349
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        50.270833333333300000
        105.833333333333000000
        1743.604166666670000000
        923.395833333333000000)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = 'GOODS CHECKED AND RECEIVED IN GOOD CONDITION'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
  object PODelivSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Delivery_Detail.Purchase_Order,'
      #9'Delivery_Detail.Line,'
      #9'Delivery_Detail.Delivery_no, '
      #9'Delivery_Detail.Ad_hoc_Address, '
      #9'Delivery_Detail.Supplier, '
      #9'Delivery_Detail.Branch_no, '
      #9'Delivery_Detail.Rep,'
      #9'Delivery_Detail.Qty_to_Deliver,'
      #9'Delivery_Detail.Qty_Delivered,'
      #9'Delivery_Detail.Qty_Invoiced,'
      #9'Delivery_Detail.Branch_No0,'
      #9'Delivery_Detail.Customer,'
      #9'Delivery_Detail.Is_Updated,'
      #9'Delivery_Detail.No_Of_Boxes,'
      #9'Delivery_Detail.Delivery_Instructions,'
      #9'Delivery_Detail.Deliver_via_Company,'
      #9'Delivery_Detail.Date_Deliv_Actual,'
      #9'Delivery_Detail.Delivery_to_Stock,'
      #9'Delivery_Detail.Delivery_note_printed,'
      '        Delivery_Detail.contact_name,'
      '        Delivery_Detail.date_point, '
      #9'Purchase_OrderLine.Cust_Order_No, '
      #9'Purchase_OrderLine.Customers_Desc, '
      #9'Purchase_OrderLine.Quantity, '
      #9'Purchase_OrderLine.Customer as iCustomer, '
      #9'Purchase_OrderLine.Branch_no as iBranch, '
      #9'Purchase_OrderLine.Number_Instructions,'
      '        Purchase_OrderLine.Original_Order,'
      '        Purchase_OrderLine.Original_OrderLine,'
      '        Purchase_OrderLine.Customer as Cust_Code,'
      '        Purchase_OrderLine.Branch_No as Cust_Branch_Code,'
      '        Purchase_OrderLine.Contact_No,'
      #9'Form_Reference.Form_Reference_ID,'
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
      ' '
      ' '
      ' '
      ' ')
    Left = 461
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
    Left = 445
    Top = 228
  end
  object CustomerSQL: TFDQuery
    ConnectionName = 'PB'
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
      ''
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
  object AdhocSQL: TFDQuery
    ConnectionName = 'PB'
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
  object RepSQL: TFDQuery
    ConnectionName = 'PB'
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
  object SupplierSQL: TFDQuery
    ConnectionName = 'PB'
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
    Left = 896
    Top = 406
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
  object GetNarrSQL: TFDQuery
    ConnectionName = 'PB'
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
  object CompSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Company.Name as Company_Name,'
      'Building_no_name,'
      'Street,'
      'Locale,'
      'Town,'
      'Postcode,'
      'Delivery_Narrative'
      'from Company'
      'where Company = 1'
      ' ')
    Left = 816
    Top = 192
  end
  object CustDetsSQL: TFDQuery
    ConnectionName = 'PB'
    MasterSource = PODelivSRC
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
    Left = 625
    Top = 544
  end
  object GetPickSQL: TFDQuery
    ConnectionName = 'PB '
    SQL.Strings = (
      'select *'
      'from Picking_Detail'
      'where Purchase_Order = :Purchase_Order and'
      '  line = :LineNo'
      '')
    Left = 641
    Top = 480
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
  object GetContactSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Name'
      'from Customer_Contact'
      'where (Customer = :Customer) and'
      '  (Branch_No = :Branch_No) and'
      '  (Contact_No = :Contact_No)')
    Left = 541
    Top = 262
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contact_No'
        ParamType = ptUnknown
      end>
  end
  object GetPickCallOffSQL: TFDQuery
    ConnectionName = 'PB'
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
end
