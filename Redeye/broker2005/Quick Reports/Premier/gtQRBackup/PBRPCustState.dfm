object PBRPCustStateFrm: TPBRPCustStateFrm
  Left = 19
  Top = 122
  Width = 813
  Height = 541
  HorzScrollBar.Range = 1200
  VertScrollBar.Position = 32
  VertScrollBar.Range = 2000
  AutoScroll = False
  Caption = 'Customer Statement'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = True
  Scaled = True
  PixelsPerInch = 96
  TextHeight = 14
  object QRLabel6: TQRLabel
    Left = 448
    Top = 144
    Width = 10
    Height = 10
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      26.4583333333333
      1185.33333333333
      465.666666666667
      26.4583333333333)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Caption = 'Fax:'
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Lucida Sans'
    Font.Style = []
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 10
  end
  object QRDBText6: TQRDBText
    Left = 504
    Top = 144
    Width = 10
    Height = 10
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      26.4583333333333
      1333.5
      465.666666666667
      26.4583333333333)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Color = clWhite
    DataSet = GetCompSQL
    DataField = 'Fax_number'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Lucida Sans'
    Font.Style = []
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 10
  end
  object QRLabel7: TQRLabel
    Left = 448
    Top = 181
    Width = 10
    Height = 10
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      26.4583333333333
      1185.33333333333
      563.5625
      26.4583333333333)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Caption = 'Fax:'
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Lucida Sans'
    Font.Style = []
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 10
  end
  object QRDBText7: TQRDBText
    Left = 504
    Top = 181
    Width = 10
    Height = 10
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Size.Values = (
      26.4583333333333
      1333.5
      563.5625
      26.4583333333333)
    Alignment = taLeftJustify
    AlignToBand = False
    AutoSize = True
    AutoStretch = False
    Color = clWhite
    DataSet = GetCompSQL
    DataField = 'Fax_number'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Lucida Sans'
    Font.Style = []
    ParentFont = False
    Transparent = False
    WordWrap = True
    FontSize = 10
  end
  object CustStateQuickReport: TQuickRep
    Left = 0
    Top = -32
    Width = 794
    Height = 1123
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AfterPrint = CustStateQuickReportAfterPrint
    BeforePrint = CustStateQuickReportBeforePrint
    DataSet = SalesInvSQL
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Lucida Sans'
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
    Page.PaperSize = Default
    Page.Values = (
      300
      2970
      100
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
    ReportTitle = 'Purchase Orders Due'
    SnapToGrid = True
    Units = MM
    Zoom = 100
    object CustBranchQRGroup: TQRGroup
      Left = 19
      Top = 369
      Width = 756
      Height = 4
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = CustBranchQRGroupBeforePrint
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Lucida Sans'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = True
      ParentFont = False
      Size.Values = (
        10.5833333333333
        2000.25)
      Expression = 'SalesInvSQL.Account_Code'
      FooterBand = GrpFootQRBand
      Master = InvDetailBand
      ReprintOnNewPage = False
    end
    object InvDetailBand: TQRSubDetail
      Left = 19
      Top = 373
      Width = 756
      Height = 41
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = InvDetailBandAfterPrint
      AlignToBottom = False
      BeforePrint = InvDetailBandBeforePrint
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Lucida Sans'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        108.479166666667
        2000.25)
      Master = CustStateQuickReport
      DataSet = SalesInvSQL
      PrintBefore = False
      PrintIfEmpty = True
      object CustRefQRDBText: TQRDBText
        Left = 136
        Top = 2
        Width = 233
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          359.833333333333
          5.29166666666667
          616.479166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = SalesInvSQL
        DataField = 'CustDesc'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText4: TQRDBText
        Left = 8
        Top = 2
        Width = 121
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          21.1666666666667
          5.29166666666667
          320.145833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        DataSet = SalesInvSQL
        DataField = 'CustRef'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lblVAT: TQRLabel
        Left = 462
        Top = 2
        Width = 39
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1222.375
          5.29166666666667
          103.1875)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'lblVAT'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lblGoods: TQRLabel
        Left = 381
        Top = 2
        Width = 52
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1008.0625
          5.29166666666667
          137.583333333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'lblGoods'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText2: TQRDBText
        Left = 136
        Top = 19
        Width = 225
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          359.833333333333
          50.2708333333333
          595.3125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = SalesInvSQL
        DataField = 'Form_Reference_ID'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText5: TQRDBText
        Left = 699
        Top = 2
        Width = 33
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1849.4375
          5.29166666666667
          87.3125)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = SalesInvSQL
        DataField = 'Order'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText1: TQRDBText
        Left = 547
        Top = 2
        Width = 101
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1447.27083333333
          5.29166666666667
          267.229166666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = SalesInvSQL
        DataField = 'Sales_Invoice_no'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lblTotal: TQRLabel
        Left = 532
        Top = 2
        Width = 42
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          1407.58333333333
          5.29166666666667
          111.125)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'lblTotal'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QRBand1: TQRBand
      Left = 19
      Top = 38
      Width = 756
      Height = 331
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = QRBand1BeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        875.770833333333
        2000.25)
      BandType = rbPageHeader
      object lblAccountCode: TQRLabel
        Left = 24
        Top = 295
        Width = 92
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625
          63.5
          780.520833333333
          243.416666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'lblAccountCode'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lblRundate: TQRLabel
        Left = 479
        Top = 295
        Width = 62
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625
          1267.35416666667
          780.520833333333
          164.041666666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'lblRundate'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lblInvoiceNo: TQRLabel
        Left = 632
        Top = 295
        Width = 69
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625
          1672.16666666667
          780.520833333333
          182.5625)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'lblInvoiceNo'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel2: TQRLabel
        Left = 600
        Top = 0
        Width = 39
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625
          1587.5
          0
          103.1875)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Page: '
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object CustomerAddMemo: TQRMemo
        Left = 24
        Top = 168
        Width = 345
        Height = 105
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          277.8125
          63.5
          444.5
          912.8125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = []
        Lines.Strings = (
          'Invoice To XXXXXXXXXXXXXXXXXXXXX'
          'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
          'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
          'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
          'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
          'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
          ' ')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lblPage: TQRLabel
        Left = 648
        Top = 0
        Width = 44
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625
          1714.5
          0
          116.416666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'lblPage'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object lblDateRange: TQRLabel
        Left = 176
        Top = 297
        Width = 78
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.9791666666667
          465.666666666667
          785.8125
          206.375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'lblDateRange'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object GrpFootQRBand: TQRBand
      Left = 19
      Top = 414
      Width = 756
      Height = 147
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = GrpFootQRBandAfterPrint
      AlignToBottom = False
      BeforePrint = GrpFootQRBandBeforePrint
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Lucida Sans'
      Font.Style = []
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        388.9375
        2000.25)
      BandType = rbGroupFooter
      object QRLabel16: TQRLabel
        Left = 272
        Top = 15
        Width = 74
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625
          719.666666666667
          39.6875
          195.791666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total Value'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlblGoods: TQRLabel
        Left = 376
        Top = 15
        Width = 59
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625
          994.833333333333
          39.6875
          156.104166666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'goodsTot'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlblVatTot: TQRLabel
        Left = 460
        Top = 15
        Width = 40
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625
          1217.08333333333
          39.6875
          105.833333333333)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'vatTot'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object qrlblTotal: TQRLabel
        Left = 544
        Top = 15
        Width = 29
        Height = 18
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          47.625
          1439.33333333333
          39.6875
          76.7291666666667)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'total'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Lucida Sans'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
  end
  object SalesInvDataSource: TDataSource
    DataSet = SalesInvSQL
    Left = 256
    Top = 102
  end
  object CompDataSource: TDataSource
    DataSet = GetCompSQL
    Left = 427
    Top = 20
  end
  object GetCompSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select * from Company'
      'Where Company = 1')
    Left = 432
    Top = 71
  end
  object SalesInvSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Sales_Invoice.Customer,'
      '        Sales_Invoice.Branch_no,'
      '        Customer_Branch.Account_Code,'
      '        Purchase_OrderLine.Customers_Desc,'
      '        Sales_Invoice.Sales_Invoice_No,'
      '        Sales_Invoice.Goods_Value,'
      '        Sales_Invoice.Vat_Value,'
      
        '        Sales_Invoice.Goods_Value+Sales_Invoice.Vat_Value AS Goo' +
        'ds_Total,'
      '        Sales_Invoice.Invoice_Date,'
      '        Customer.Name,'
      '        Customer_Branch.Building_No_name,'
      '        Customer_Branch.Street,'
      '        Customer_Branch.Locale,'
      '        Customer_Branch.Town,'
      '        Customer_Branch.Postcode,'
      '        Customer_Branch.Phone,'
      '        Customer_Branch.Fax_Number,'
      '        Purchase_OrderLine.Cust_Order_No,'
      '        Form_Reference.Form_Reference,'
      '        Form_Reference.Form_Reference_Descr,'
      '        Form_Reference.Form_Reference_ID,'
      '        Sales_Invoice_Line.Sales_Invoice,'
      '        Sales_Invoice_Line.Invoice_Line_No,'
      '        Sales_Invoice_Line.Qty_Invoiced,'
      '        Purchase_OrderLine.Purchase_Order,'
      '        Purchase_OrderLine.Line,'
      '        Sales_Invoice_Line.sales_Order,'
      '        Sales_Invoice_Line.Sales_Order_Line_no,'
      '        Sales_Invoice_Line.Job_Bag,'
      '        Sales_Invoice_Line.Job_Bag_Line,'
      '        Int_Sel.Int_Sel_Code,'
      '        Int_Sel.Sel1,'
      '        Int_Sel.Text100,'
      '        sales_order.Cust_Order_No as SOCustRef,'
      '        job_bag.Cust_Order_No as JBCustRef,'
      '        job_bag.Job_Bag_Descr'
      
        'from ((((((((int_sel inner join sales_invoice on (Int_Sel.Sel1 =' +
        ' Sales_Invoice.Sales_Invoice))'
      
        '  inner join customer_branch on ((Customer_Branch.Customer = Sal' +
        'es_Invoice.Inv_to_Customer) AND'
      
        '             (Customer_Branch.Branch_no = Sales_Invoice.Inv_to_B' +
        'ranch)))'
      
        '  inner join customer on (Customer.Customer = Customer_Branch.Cu' +
        'stomer))'
      
        '  inner join sales_invoice_line on (Sales_Invoice.Sales_Invoice ' +
        '= Sales_Invoice_Line.Sales_Invoice))'
      
        '  left join purchase_orderline on ((Purchase_OrderLine.Purchase_' +
        'Order = Sales_Invoice_Line.Purchase_Order) AND'
      
        '                                                      (Purchase_' +
        'OrderLine.Line = Sales_Invoice_Line.Line)))'
      
        '  left join form_reference on (Form_Reference.Form_Reference = P' +
        'urchase_OrderLine.Form_Reference))'
      
        '  left join sales_order on (Sales_Invoice_Line.sales_Order = sal' +
        'es_Order.sales_Order))'
      
        '  left join job_bag on (Sales_Invoice_Line.Job_Bag = Job_Bag.Job' +
        '_Bag))'
      'WHERE'
      '  Int_Sel.Int_Sel_Code = :Int_Sel'
      'ORDER BY Purchase_OrderLine.Cust_Order_No'
      ' '
      ' '
      ' ')
    Left = 363
    Top = 40
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Int_Sel'
        ParamType = ptInput
      end>
    object SalesInvSQLCustomer: TIntegerField
      FieldName = 'Customer'
    end
    object SalesInvSQLBranch_no: TIntegerField
      FieldName = 'Branch_no'
    end
    object SalesInvSQLAccount_Code: TStringField
      FieldName = 'Account_Code'
      FixedChar = True
    end
    object SalesInvSQLCustomers_Desc: TStringField
      FieldName = 'Customers_Desc'
      FixedChar = True
      Size = 80
    end
    object SalesInvSQLSales_Invoice_No: TStringField
      FieldName = 'Sales_Invoice_No'
      FixedChar = True
      Size = 30
    end
    object SalesInvSQLGoods_Value: TCurrencyField
      FieldName = 'Goods_Value'
    end
    object SalesInvSQLVat_Value: TCurrencyField
      FieldName = 'Vat_Value'
    end
    object SalesInvSQLGoods_Total: TCurrencyField
      FieldName = 'Goods_Total'
    end
    object SalesInvSQLInvoice_Date: TDateTimeField
      FieldName = 'Invoice_Date'
    end
    object SalesInvSQLName: TStringField
      FieldName = 'Name'
      FixedChar = True
      Size = 80
    end
    object SalesInvSQLBuilding_No_name: TStringField
      FieldName = 'Building_No_name'
      FixedChar = True
      Size = 80
    end
    object SalesInvSQLStreet: TStringField
      FieldName = 'Street'
      FixedChar = True
      Size = 80
    end
    object SalesInvSQLLocale: TStringField
      FieldName = 'Locale'
      FixedChar = True
      Size = 80
    end
    object SalesInvSQLTown: TStringField
      FieldName = 'Town'
      FixedChar = True
      Size = 80
    end
    object SalesInvSQLPostcode: TStringField
      FieldName = 'Postcode'
      FixedChar = True
    end
    object SalesInvSQLPhone: TStringField
      FieldName = 'Phone'
      FixedChar = True
      Size = 40
    end
    object SalesInvSQLFax_Number: TStringField
      FieldName = 'Fax_Number'
      FixedChar = True
      Size = 40
    end
    object SalesInvSQLCust_Order_No: TStringField
      FieldName = 'Cust_Order_No'
      FixedChar = True
      Size = 50
    end
    object SalesInvSQLForm_Reference: TIntegerField
      FieldName = 'Form_Reference'
    end
    object SalesInvSQLForm_Reference_Descr: TStringField
      FieldName = 'Form_Reference_Descr'
      FixedChar = True
      Size = 100
    end
    object SalesInvSQLForm_Reference_ID: TStringField
      FieldName = 'Form_Reference_ID'
      FixedChar = True
      Size = 100
    end
    object SalesInvSQLSales_Invoice: TIntegerField
      FieldName = 'Sales_Invoice'
    end
    object SalesInvSQLInvoice_Line_No: TIntegerField
      FieldName = 'Invoice_Line_No'
    end
    object SalesInvSQLQty_Invoiced: TFloatField
      FieldName = 'Qty_Invoiced'
    end
    object SalesInvSQLPurchase_Order: TFloatField
      FieldName = 'Purchase_Order'
    end
    object SalesInvSQLLine: TIntegerField
      FieldName = 'Line'
    end
    object SalesInvSQLInt_Sel_Code: TIntegerField
      FieldName = 'Int_Sel_Code'
    end
    object SalesInvSQLSel1: TFloatField
      FieldName = 'Sel1'
    end
    object SalesInvSQLText100: TStringField
      FieldName = 'Text100'
      FixedChar = True
      Size = 100
    end
    object SalesInvSQLOrder: TStringField
      FieldKind = fkCalculated
      FieldName = 'Order'
      OnGetText = SalesInvSQLOrderGetText
      Calculated = True
    end
    object SalesInvSQLsales_Order: TIntegerField
      FieldName = 'sales_Order'
    end
    object SalesInvSQLSales_Order_Line_no: TIntegerField
      FieldName = 'Sales_Order_Line_no'
    end
    object SalesInvSQLJob_Bag: TIntegerField
      FieldName = 'Job_Bag'
    end
    object SalesInvSQLJob_Bag_Line: TIntegerField
      FieldName = 'Job_Bag_Line'
    end
    object SalesInvSQLSOCustRef: TStringField
      FieldName = 'SOCustRef'
      FixedChar = True
      Size = 80
    end
    object SalesInvSQLJBCustRef: TStringField
      FieldName = 'JBCustRef'
      FixedChar = True
      Size = 80
    end
    object SalesInvSQLJob_Bag_Descr: TStringField
      FieldName = 'Job_Bag_Descr'
      FixedChar = True
      Size = 80
    end
    object SalesInvSQLCustRef: TStringField
      FieldKind = fkCalculated
      FieldName = 'CustRef'
      OnGetText = SalesInvSQLCustRefGetText
      Calculated = True
    end
    object SalesInvSQLCustDesc: TStringField
      FieldKind = fkCalculated
      FieldName = 'CustDesc'
      OnGetText = SalesInvSQLCustDescGetText
      Calculated = True
    end
  end
  object UpSalesInvSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update Sales_invoice'
      'set Statement_reference = :Statement_reference,'
      'Statement_Date = :Statement_Date,'
      'Statement_From = :Statement_from,'
      'Statement_to = :Statement_to'
      'where Sales_Invoice = :Sales_Invoice')
    Left = 430
    Top = 142
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Statement_reference'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Statement_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Statement_from'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Statement_to'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Sales_Invoice'
        ParamType = ptUnknown
      end>
  end
  object UpCustSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update Customer_Branch'
      'set Last_Statement_ref = :Last_statement_Ref'
      'where Customer = :Customer and'
      'Branch_no = :Branch_no')
    Left = 518
    Top = 150
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Last_statement_Ref'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_no'
        ParamType = ptUnknown
      end>
  end
end
