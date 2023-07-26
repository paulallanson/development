object PBRPStkRecfrm: TPBRPStkRecfrm
  Left = 24
  Top = 99
  Width = 772
  Height = 467
  Caption = 'Stock Reconciliation Report'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object QuickReport: TQuickRep
    Left = 16
    Top = 8
    Width = 1123
    Height = 794
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    BeforePrint = QuickReportBeforePrint
    DataSet = qryReport
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
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
      100.000000000000000000
      100.000000000000000000
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
    ReportTitle = 'Customer Stock Movement Report'
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsMaximized
    object PageTitle: TQRBand
      Left = 38
      Top = 38
      Width = 1047
      Height = 99
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        261.937500000000000000
        2770.187500000000000000)
      BandType = rbPageHeader
      object QRSysData1: TQRSysData
        Left = 989
        Top = 8
        Width = 46
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          2616.729166666670000000
          21.166666666666700000
          121.708333333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsPageNumber
        Transparent = False
        FontSize = 10
      end
      object QRLabel13: TQRLabel
        Left = 925
        Top = 8
        Width = 59
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          2447.395833333330000000
          21.166666666666700000
          156.104166666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Page No.:'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlblTitle: TQRLabel
        Left = 284
        Top = 8
        Width = 479
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.854166666666680000
          751.416666666666800000
          21.166666666666670000
          1267.354166666667000000)
        Alignment = taCenter
        AlignToBand = True
        AutoSize = True
        AutoStretch = False
        Caption = 'Warehouse Stock Reconciliation Report - Run Date: '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 14
      end
      object DescQRLabel: TQRLabel
        Left = 124
        Top = 72
        Width = 97
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          328.083333333333400000
          190.500000000000000000
          256.645833333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Stock Reference'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object StkQRLabel: TQRLabel
        Left = 572
        Top = 72
        Width = 78
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1513.416666666667000000
          190.500000000000000000
          206.375000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Qty Delivered'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRShape1: TQRShape
        Left = 16
        Top = 85
        Width = 1025
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          42.333333333333300000
          224.895833333333000000
          2711.979166666670000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object QRLabel3: TQRLabel
        Left = 272
        Top = 72
        Width = 66
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          719.666666666666800000
          190.500000000000000000
          174.625000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Description'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel4: TQRLabel
        Left = 27
        Top = 72
        Width = 82
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          71.437500000000000000
          190.500000000000000000
          216.958333333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Order Number'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel1: TQRLabel
        Left = 680
        Top = 72
        Width = 28
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1799.166666666667000000
          190.500000000000000000
          74.083333333333340000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Date'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel2: TQRLabel
        Left = 754
        Top = 72
        Width = 50
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          1994.958333333330000000
          190.500000000000000000
          132.291666666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Location'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object OrderDetail: TQRSubDetail
      Left = 38
      Top = 153
      Width = 1047
      Height = 22
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        58.208333333333340000
        2770.187500000000000000)
      Master = QuickReport
      DataSet = qryReport
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText1: TQRDBText
        Left = 572
        Top = 0
        Width = 77
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          1513.416666666667000000
          0.000000000000000000
          203.729166666666700000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Qty_Delivered'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText3: TQRDBText
        Left = 125
        Top = 0
        Width = 140
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          330.729166666667000000
          0.000000000000000000
          370.416666666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Stock_Reference'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText4: TQRDBText
        Left = 274
        Top = 0
        Width = 282
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          724.958333333333000000
          0.000000000000000000
          746.125000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'form_reference_descr'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText5: TQRDBText
        Left = 10
        Top = 0
        Width = 90
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          26.458333333333330000
          0.000000000000000000
          238.125000000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Purchase_order'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText2: TQRDBText
        Left = 664
        Top = 0
        Width = 62
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333340000
          1756.833333333333000000
          0.000000000000000000
          164.041666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Date_Point'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
      object QRDBText6: TQRDBText
        Left = 754
        Top = 0
        Width = 121
        Height = 16
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.333333333333300000
          1994.958333333330000000
          0.000000000000000000
          320.145833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Stock_Location_Desc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 9
      end
    end
    object FormTotQRBand: TQRBand
      Left = 38
      Top = 216
      Width = 1047
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        42.333333333333340000
        2770.187500000000000000)
      BandType = rbGroupFooter
    end
    object FooterQRBand: TQRBand
      Left = 38
      Top = 175
      Width = 1047
      Height = 41
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = FooterQRBandBeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        108.479166666666700000
        2770.187500000000000000)
      BandType = rbPageFooter
      object PageNoQRLabel: TQRLabel
        Left = 496
        Top = 12
        Width = 55
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1312.333333333333000000
          31.750000000000000000
          145.520833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Page No.'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object RepTotsQRGroup: TQRGroup
      Left = 38
      Top = 137
      Width = 1047
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      Enabled = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        42.333333333333340000
        2770.187500000000000000)
      Master = QuickReport
      ReprintOnNewPage = False
    end
  end
  object qryReport: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT '#9'Delivery_Detail.Purchase_Order,'
      #9'Delivery_Detail.Line,'
      #9'Delivery_Detail.Delivery_no, '
      #9'Delivery_Detail.Date_Point, '
      #9'Delivery_Detail.Stock_Location_Desc, '
      #9'Purchase_OrderLine.Form_Reference, '
      #9'Form_Reference.Form_Reference_ID, '
      #9'Form_Reference.Form_Reference_Descr,'
      '                Form_Reference.Stock_Reference,'
      #9'Delivery_Detail.Delivery_to_Stock, '
      #9'Delivery_Detail.Date_Deliv_Actual, '
      #9'Delivery_Detail.Qty_Delivered,'
      #9'(select count(Location_no)'
      '         from Delivery_Location'
      #9'where '
      #9'('
      
        #9'(Delivery_Location.Purchase_Order = Delivery_Detail.Purchase_Or' +
        'der) and'
      #9'(Delivery_Location.Line = Delivery_Detail.Line) and'
      #9'(Delivery_Location.Delivery_no = Delivery_Detail.Delivery_no)'
      #9')) as Bin_Count'
      'FROM (Form_Reference '
      #9'INNER JOIN Purchase_OrderLine ON '
      
        #9'Form_Reference.Form_Reference = Purchase_OrderLine.Form_Referen' +
        'ce) '
      #9'INNER JOIN Delivery_Detail ON '
      #9'(Purchase_OrderLine.Line = Delivery_Detail.Line) AND '
      
        #9'(Purchase_OrderLine.Purchase_Order = Delivery_Detail.Purchase_O' +
        'rder)'
      'WHERE '#9'(Delivery_Detail.Delivery_to_Stock ='#39'Y'#39') AND '
      #9'(Delivery_Detail.Qty_Delivered =0) and'
      #9'(select count(Location_no)'
      '         from Delivery_Location'
      #9'where '
      #9'('
      
        #9'(Delivery_Location.Purchase_Order = Delivery_Detail.Purchase_Or' +
        'der) and'
      #9'(Delivery_Location.Line = Delivery_Detail.Line) and'
      #9'(Delivery_Location.Delivery_no = Delivery_Detail.Delivery_no)'
      #9')) > 0')
    Left = 32
    Top = 64
    object qryReportPurchase_Order: TFloatField
      FieldName = 'Purchase_Order'
    end
    object qryReportLine: TIntegerField
      FieldName = 'Line'
    end
    object qryReportDelivery_no: TIntegerField
      FieldName = 'Delivery_no'
    end
    object qryReportDate_Point: TDateTimeField
      FieldName = 'Date_Point'
    end
    object qryReportStock_Location_Desc: TStringField
      FieldName = 'Stock_Location_Desc'
      FixedChar = True
      Size = 80
    end
    object qryReportForm_Reference: TIntegerField
      FieldName = 'Form_Reference'
    end
    object qryReportForm_Reference_ID: TStringField
      FieldName = 'Form_Reference_ID'
      FixedChar = True
      Size = 100
    end
    object qryReportForm_Reference_Descr: TStringField
      FieldName = 'Form_Reference_Descr'
      FixedChar = True
      Size = 100
    end
    object qryReportDelivery_to_Stock: TStringField
      FieldName = 'Delivery_to_Stock'
      FixedChar = True
      Size = 2
    end
    object qryReportDate_Deliv_Actual: TDateTimeField
      FieldName = 'Date_Deliv_Actual'
    end
    object qryReportQty_Delivered: TFloatField
      FieldName = 'Qty_Delivered'
    end
    object qryReportBin_Count: TIntegerField
      FieldName = 'Bin_Count'
    end
    object qryReportStock_Reference: TStringField
      FieldName = 'Stock_Reference'
      FixedChar = True
      Size = 30
    end
  end
  object qryReport1: TFDQuery
    SQL.Strings = (
      'SELECT '#9'Delivery_Detail.Purchase_Order,'
      #9'Delivery_Detail.Line,'
      #9'Delivery_Detail.Delivery_no, '
      #9'Delivery_Detail.Date_Point, '
      #9'Delivery_Detail.Stock_Location_Desc, '
      #9'Purchase_OrderLine.Form_Reference, '
      #9'Form_Reference.Form_Reference_ID, '
      #9'Form_Reference.Form_Reference_Descr, '
      '                Form_Reference.Stock_Reference,'
      #9'Delivery_Detail.Delivery_to_Stock, '
      #9'Delivery_Detail.Date_Deliv_Actual, '
      #9'Delivery_Detail.Qty_Delivered,'
      #9'(select count(Picking_no)'
      '         from Picking_Detail'
      #9'where '
      #9'('
      
        #9'(Picking_Detail.Calloff_Order = Delivery_Detail.Purchase_Order)' +
        ' and'
      #9'(Picking_Detail.Calloff_Line = Delivery_Detail.Line) and'
      #9'(Picking_Detail.Calloff_Delivery = Delivery_Detail.Delivery_no)'
      #9')) as Bin_Count'
      'FROM (Form_Reference '
      #9'INNER JOIN Purchase_OrderLine ON '
      
        #9'Form_Reference.Form_Reference = Purchase_OrderLine.Form_Referen' +
        'ce) '
      #9'INNER JOIN Delivery_Detail ON '
      #9'(Purchase_OrderLine.Line = Delivery_Detail.Line) AND '
      
        #9'(Purchase_OrderLine.Purchase_Order = Delivery_Detail.Purchase_O' +
        'rder)'
      
        'WHERE '#9'(round(Delivery_Detail.Purchase_Order,0) = Purchase_Order' +
        'Line.Original_Order) AND '
      #9'(Delivery_Detail.Qty_Delivered =0) and'
      #9'(select count(Picking_no)'
      '         from Picking_Detail'
      #9'where '
      #9'('
      
        #9'(Picking_Detail.Calloff_Order = Delivery_Detail.Purchase_Order)' +
        ' and'
      #9'(Picking_Detail.Calloff_Line = Delivery_Detail.Line) and'
      #9'(Picking_Detail.Calloff_Delivery = Delivery_Detail.Delivery_no)'
      #9')) > 0')
    Left = 310
    Top = 62
  end
  object qryReport2: TFDQuery
    SQL.Strings = (
      'SELECT '#9'Delivery_Detail.Purchase_Order,'
      #9'Delivery_Detail.Line,'
      #9'Delivery_Detail.Delivery_no, '
      #9'Delivery_Detail.Date_Point, '
      #9'Delivery_Detail.Stock_Location_Desc, '
      #9'Purchase_OrderLine.Form_Reference, '
      #9'Form_Reference.Form_Reference_ID, '
      #9'Form_Reference.Form_Reference_Descr, '
      '                Form_Reference.Stock_Reference,'
      #9'Delivery_Detail.Delivery_to_Stock, '
      #9'Delivery_Detail.Date_Deliv_Actual, '
      #9'Delivery_Detail.Qty_Delivered,'
      #9'(select count(Location_no)'
      '         from Delivery_Location'
      #9'where '
      #9'('
      
        #9'(Delivery_Location.Purchase_Order = Delivery_Detail.Purchase_Or' +
        'der) and'
      #9'(Delivery_Location.Line = Delivery_Detail.Line) and'
      #9'(Delivery_Location.Delivery_no = Delivery_Detail.Delivery_no)'
      #9')) as Bin_Count'
      'FROM (Form_Reference '
      #9'INNER JOIN Purchase_OrderLine ON '
      
        #9'Form_Reference.Form_Reference = Purchase_OrderLine.Form_Referen' +
        'ce) '
      #9'INNER JOIN Delivery_Detail ON '
      #9'(Purchase_OrderLine.Line = Delivery_Detail.Line) AND '
      
        #9'(Purchase_OrderLine.Purchase_Order = Delivery_Detail.Purchase_O' +
        'rder)'
      'WHERE '#9'(Delivery_Detail.Delivery_to_Stock ='#39'Y'#39') AND '
      #9'(Delivery_Detail.Qty_Delivered >0) and'
      #9'(select count(Location_no)'
      '         from Delivery_Location'
      #9'where '
      #9'('
      
        #9'(Delivery_Location.Purchase_Order = Delivery_Detail.Purchase_Or' +
        'der) and'
      #9'(Delivery_Location.Line = Delivery_Detail.Line) and'
      #9'(Delivery_Location.Delivery_no = Delivery_Detail.Delivery_no)'
      #9')) = 0')
    Left = 366
    Top = 62
  end
  object qryReport3: TFDQuery
    SQL.Strings = (
      'SELECT '#9'Delivery_Detail.Purchase_Order,'
      #9'Delivery_Detail.Line,'
      #9'Delivery_Detail.Delivery_no, '
      #9'Delivery_Detail.Date_Point, '
      #9'Delivery_Detail.Stock_Location_Desc, '
      #9'Purchase_OrderLine.Form_Reference, '
      #9'Form_Reference.Form_Reference_ID, '
      #9'Form_Reference.Form_Reference_Descr, '
      '                Form_Reference.Stock_Reference,'
      #9'Delivery_Detail.Delivery_to_Stock, '
      #9'Delivery_Detail.Date_Deliv_Actual, '
      #9'Delivery_Detail.Qty_Delivered,'
      #9'(select count(Picking_no)'
      '         from Picking_Detail'
      #9'where '
      #9'('
      
        #9'(Picking_Detail.Calloff_Order = Delivery_Detail.Purchase_Order)' +
        ' and'
      #9'(Picking_Detail.Calloff_Line = Delivery_Detail.Line) and'
      #9'(Picking_Detail.Calloff_Delivery = Delivery_Detail.Delivery_no)'
      #9')) as Bin_Count'
      'FROM (Form_Reference '
      #9'INNER JOIN Purchase_OrderLine ON '
      
        #9'Form_Reference.Form_Reference = Purchase_OrderLine.Form_Referen' +
        'ce) '
      #9'INNER JOIN Delivery_Detail ON '
      #9'(Purchase_OrderLine.Line = Delivery_Detail.Line) AND '
      
        #9'(Purchase_OrderLine.Purchase_Order = Delivery_Detail.Purchase_O' +
        'rder)'
      
        'WHERE '#9'(round(Delivery_Detail.Purchase_Order,0) = Purchase_Order' +
        'Line.Original_Order) AND '
      #9'(Delivery_Detail.Qty_Delivered >0) and'
      #9'(select count(Picking_no)'
      '         from Picking_Detail'
      #9'where '
      #9'('
      
        #9'(Picking_Detail.Calloff_Order = Delivery_Detail.Purchase_Order)' +
        ' and'
      #9'(Picking_Detail.Calloff_Line = Delivery_Detail.Line) and'
      #9'(Picking_Detail.Calloff_Delivery = Delivery_Detail.Delivery_no)'
      #9')) = 0')
    Left = 422
    Top = 62
  end
  object qryReport0: TFDQuery
    SQL.Strings = (
      'SELECT '#9'Delivery_Detail.Purchase_Order,'
      #9'Delivery_Detail.Line,'
      #9'Delivery_Detail.Delivery_no, '
      #9'Delivery_Detail.Date_Point, '
      #9'Delivery_Detail.Stock_Location_Desc, '
      #9'Purchase_OrderLine.Form_Reference, '
      #9'Form_Reference.Form_Reference_ID, '
      #9'Form_Reference.Form_Reference_Descr, '
      '                Form_Reference.Stock_Reference,'
      #9'Delivery_Detail.Delivery_to_Stock, '
      #9'Delivery_Detail.Date_Deliv_Actual, '
      #9'Delivery_Detail.Qty_Delivered,'
      #9'(select count(Location_no)'
      '         from Delivery_Location'
      #9'where '
      #9'('
      
        #9'(Delivery_Location.Purchase_Order = Delivery_Detail.Purchase_Or' +
        'der) and'
      #9'(Delivery_Location.Line = Delivery_Detail.Line) and'
      #9'(Delivery_Location.Delivery_no = Delivery_Detail.Delivery_no)'
      #9')) as Bin_Count'
      'FROM (Form_Reference '
      #9'INNER JOIN Purchase_OrderLine ON '
      
        #9'Form_Reference.Form_Reference = Purchase_OrderLine.Form_Referen' +
        'ce) '
      #9'INNER JOIN Delivery_Detail ON '
      #9'(Purchase_OrderLine.Line = Delivery_Detail.Line) AND '
      
        #9'(Purchase_OrderLine.Purchase_Order = Delivery_Detail.Purchase_O' +
        'rder)'
      'WHERE '#9'(Delivery_Detail.Delivery_to_Stock ='#39'Y'#39') AND '
      #9'(Delivery_Detail.Qty_Delivered =0) and'
      #9'(select count(Location_no)'
      '         from Delivery_Location'
      #9'where '
      #9'('
      
        #9'(Delivery_Location.Purchase_Order = Delivery_Detail.Purchase_Or' +
        'der) and'
      #9'(Delivery_Location.Line = Delivery_Detail.Line) and'
      #9'(Delivery_Location.Delivery_no = Delivery_Detail.Delivery_no)'
      #9')) > 0')
    Left = 238
    Top = 62
  end
end
