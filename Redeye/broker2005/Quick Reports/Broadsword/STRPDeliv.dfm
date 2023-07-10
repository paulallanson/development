object STRPDelivfrm: TSTRPDelivfrm
  Left = 82
  Top = 24
  Width = 1093
  Height = 670
  Caption = 'Sales Order Despatch Note '
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
    Left = 88
    Top = 24
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
      100.000000000000000000
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
      Top = 38
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
      object PreviewQRLabel: TQRLabel
        Left = 648
        Top = 64
        Width = 80
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          1714.500000000000000000
          169.333333333333300000
          211.666666666666700000)
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
      object NotesQRMemo: TQRMemo
        Left = 16
        Top = 167
        Width = 272
        Height = 138
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          365.125000000000000000
          42.333333333333330000
          441.854166666666700000
          719.666666666666700000)
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
      object DelInstructMemo: TQRMemo
        Left = 345
        Top = 167
        Width = 384
        Height = 138
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          365.125000000000000000
          912.812500000000000000
          441.854166666666700000
          1016.000000000000000000)
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
      object QRLblAccnt: TQRLabel
        Left = 16
        Top = 337
        Width = 110
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          42.333333333333330000
          891.645833333333300000
          291.041666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Account number'
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
      object CustRefQRDBText: TQRDBText
        Left = 168
        Top = 337
        Width = 112
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          444.500000000000000000
          891.645833333333300000
          296.333333333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = GetAllocDetQuery
        DataField = 'Cust_Order_No'
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
      object DelNoQRLabel: TQRLabel
        Left = 632
        Top = 337
        Width = 105
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          1672.166666666667000000
          891.645833333333300000
          277.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DelNoQRLabel'
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
      object DespDtQRLbl: TQRLabel
        Left = 512
        Top = 337
        Width = 95
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          1354.666666666667000000
          891.645833333333300000
          251.354166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'DespDtQRLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Gill Sans MT'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = False
        FontSize = 12
      end
      object SoNumQRDBText: TQRDBText
        Left = 408
        Top = 337
        Width = 83
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          63.500000000000000000
          1079.500000000000000000
          891.645833333333300000
          219.604166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = GetAllocDetQuery
        DataField = 'Sales_Order'
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
      object QRLabel6: TQRLabel
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
      object QRLabel7: TQRLabel
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
      object QRLabel5: TQRLabel
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
      object QRLabel10: TQRLabel
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
      object QRLabel1: TQRLabel
        Left = 2
        Top = 394
        Width = 101
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
          267.229166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QUANTITY DELIVERED'
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
      object ReportImage: TQRImage
        Left = 18
        Top = 9
        Width = 713
        Height = 48
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          127.000000000000000000
          47.625000000000000000
          23.812500000000000000
          1886.479166666667000000)
        Stretch = True
      end
    end
    object GroupHeadQRGroup: TQRGroup
      Left = 25
      Top = 452
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
      Top = 455
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
      object PartQRDBText: TQRDBText
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
      object DescQRDBText: TQRDBText
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
      object QRDBText4: TQRDBText
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
      object QRLabelDlvrd: TQRLabel
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
      object QRLabelQty: TQRLabel
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
      Top = 479
      Width = 751
      Height = 21
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
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
      object lblSerialCaption: TQRLabel
        Left = 208
        Top = 0
        Width = 87
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
          230.187500000000000000)
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
      object lblSerialRange: TQRLabel
        Left = 312
        Top = 0
        Width = 76
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
          201.083333333333300000)
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
      'SELECT Part.Part, Part.Part_Description,Sales_Order.Sales_Order,'
      
        '  Sales_Order.Delivery_Customer, Sales_Order.Delivery_Branch, Sa' +
        'les_Order.Customer, Sales_Order.Branch_No, Sales_Order.Date_Requ' +
        'ired,'
      
        '  Sales_Order.Date_Ordered, Sales_Order.Cust_Order_No, Sales_Ord' +
        'er.Ad_Hoc_Address,'
      '  Sales_order_Line.Quantity_Ordered,'
      '  Sales_Order_Line.Quantity_Delivered,'
      '  Part.Sell_Pack_Quantity,'
      '  Part.Part_Purchase_Price,'
      '  Part.Part_Cost_List,'
      '  Sales_Order.Cost_Centre,'
      '  Sales_order.Narrative,'
      '  Sales_order_line.sales_order_line_no'
      'FROM'
      ' Part, Sales_Order, Sales_Order_Line'
      'WHERE'
      '  Sales_Order.Sales_Order = Sales_Order_Line.Sales_Order and'
      '  Sales_order_Line.Part = Part.Part and'
      '  Sales_Order.Sales_Order = :Sel1'
      'ORDER BY'
      '  Sales_Order.Sales_Order,'
      '  Part.Part'
      ''
      ''
      ''
      ''
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
      ' '
      ' '
      ' ')
    Left = 27
    Top = 128
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Sel1'
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
      ' '
      ' ')
    Left = 32
    Top = 188
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sel1'
        ParamType = ptUnknown
      end>
  end
  object GetCustSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Customer.Name as Cust_Name,'
      'Building_no_name,'
      'Street,'
      'Locale,'
      'Town,'
      'Postcode,'
      'Delivery_Narrative,'
      'Account_Code,'
      'Inv_To_Customer,'
      'Inv_To_Branch,'
      'Customer_Branch.Name as Branch_Name,'
      'Customer_Branch.Use_Branch_Name'
      'from'
      '  Customer_Branch, Customer'
      'where'
      '  ((Customer_Branch.Customer = :Customer) and'
      '   (Branch_no = :Branch_no)) and'
      '  Customer_Branch.Customer = Customer.Customer'
      ' '
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
  object GetAllocMasterQuery: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Int_sel.*,'
      '  Sales_Order.Sales_Order,'
      '  Sales_Order.Sales_order_Head_Status'
      'from'
      '  Int_Sel, Sales_Order'
      'where'
      '  (Int_Sel.Int_Sel_Code = :Int_Sel_Code) and'
      
        '  ((Sales_order.Sales_Order = Int_Sel.Sel1) or (:Sales_Order = 0' +
        ')) and'
      '  (Sales_order.Sales_order_Head_Status >= :Status_from) and'
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
      '  (Sales_order.Sales_order_Head_Status >= :Status_from) and'
      '  (Sales_order.Replenish_Source = 2)'
      ''
      ' '
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
  object AddressSRC: TDataSource
    Left = 64
    Top = 24
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
    Left = 398
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
  object GetAllocSerialNoSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select * '
      'from sales_order_line_serial_no'
      'where Sales_order = :Sales_order and '
      '  Sales_order_line_no = :Sales_order_line_no')
    Left = 313
    Top = 139
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Sales_order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_order_line_no'
        ParamType = ptUnknown
      end>
  end
end
