object PBRPPOnotonJBfrm: TPBRPPOnotonJBfrm
  Left = 24
  Top = 106
  Width = 766
  Height = 455
  Caption = 'PBRPPOnotonJBfrm'
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
  object qckrptPOnotonJB: TQuickRep
    Left = 0
    Top = 8
    Width = 1123
    Height = 794
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    BeforePrint = qckrptPOnotonJBBeforePrint
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
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsMaximized
    object QRBand1: TQRBand
      Left = 38
      Top = 38
      Width = 1047
      Height = 107
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
        283.104166666666700000
        2770.187500000000000000)
      BandType = rbPageHeader
      object qrlblTitle: TQRLabel
        Left = 318
        Top = 24
        Width = 410
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          60.854166666666670000
          841.375000000000000000
          63.500000000000000000
          1084.791666666667000000)
        Alignment = taCenter
        AlignToBand = True
        AutoSize = True
        AutoStretch = False
        Caption = 'Purchase Orders not in Job Bags - Run Date'
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
      object QRLabel13: TQRLabel
        Left = 928
        Top = 8
        Width = 55
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          2455.333333333330000000
          21.166666666666700000
          145.520833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Page No.:'
        Color = clWhite
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
      object QRSysData1: TQRSysData
        Left = 992
        Top = 8
        Width = 45
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          2624.666666666670000000
          21.166666666666700000
          119.062500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsPageNumber
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FontSize = 9
      end
      object QRLabel1: TQRLabel
        Left = 16
        Top = 77
        Width = 32
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          203.729166666666700000
          84.666666666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Order'
        Color = clWhite
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
      object QRLabel3: TQRLabel
        Left = 80
        Top = 77
        Width = 28
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          211.666666666666700000
          203.729166666666700000
          74.083333333333330000)
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
      object QRLabel4: TQRLabel
        Left = 152
        Top = 77
        Width = 66
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          402.166666666666700000
          203.729166666666700000
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
      object QRLabel5: TQRLabel
        Left = 584
        Top = 77
        Width = 50
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1545.166666666667000000
          203.729166666666700000
          132.291666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Quantity'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel6: TQRLabel
        Left = 448
        Top = 77
        Width = 113
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1185.333333333333000000
          203.729166666666700000
          298.979166666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Customer Order No'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel7: TQRLabel
        Left = 661
        Top = 77
        Width = 60
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1748.895833333333000000
          203.729166666666700000
          158.750000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total Cost'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel8: TQRLabel
        Left = 745
        Top = 77
        Width = 55
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          1971.145833333330000000
          203.729166666667000000
          145.520833333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Total Sell'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel9: TQRLabel
        Left = 824
        Top = 77
        Width = 48
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          2180.166666666670000000
          203.729166666667000000
          127.000000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Supplier'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRShape1: TQRShape
        Left = 0
        Top = 96
        Width = 1044
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.812500000000000000
          0.000000000000000000
          254.000000000000000000
          2762.250000000000000000)
        Shape = qrsHorLine
        VertAdjust = 0
      end
      object qrlblIncCallOffs: TQRLabel
        Left = 447
        Top = 45
        Width = 152
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1182.687500000000000000
          119.062500000000000000
          402.166666666666700000)
        Alignment = taCenter
        AlignToBand = True
        AutoSize = True
        AutoStretch = False
        Caption = '(Call Off Orders Excluded)'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QRSubDetail1: TQRSubDetail
      Left = 38
      Top = 177
      Width = 1047
      Height = 21
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
        55.562500000000000000
        2770.187500000000000000)
      Master = qckrptPOnotonJB
      DataSet = qryReport
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText1: TQRDBText
        Left = 16
        Top = 0
        Width = 92
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          0.000000000000000000
          243.416666666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Purchase_Order'
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
        Left = 80
        Top = 0
        Width = 62
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          211.666666666666700000
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
      object QRDBText4: TQRDBText
        Left = 448
        Top = 0
        Width = 113
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          1185.333333333330000000
          0.000000000000000000
          298.979166666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Cust_Order_No'
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
        Left = 589
        Top = 0
        Width = 45
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1558.395833333333000000
          0.000000000000000000
          119.062500000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Quantity'
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
        Left = 660
        Top = 0
        Width = 61
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1746.250000000000000000
          0.000000000000000000
          161.395833333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Total_Cost'
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
      object QRDBText7: TQRDBText
        Left = 745
        Top = 0
        Width = 56
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          1971.145833333330000000
          0.000000000000000000
          148.166666666667000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Total_Sell'
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
      object QRDBText8: TQRDBText
        Left = 824
        Top = 0
        Width = 86
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          2180.166666666670000000
          0.000000000000000000
          227.541666666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Supplier_name'
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
      object QRDBText9: TQRDBText
        Left = 152
        Top = 0
        Width = 281
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          402.166666666667000000
          0.000000000000000000
          743.479166666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Customers_Desc'
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
    object QRGroup1: TQRGroup
      Left = 38
      Top = 145
      Width = 1047
      Height = 32
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
        84.666666666666670000
        2770.187500000000000000)
      Expression = 'qryReport.Customer_Name'
      Master = QRSubDetail1
      ReprintOnNewPage = False
      object QRDBText3: TQRDBText
        Left = 8
        Top = 8
        Width = 105
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          21.166666666666670000
          277.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Customer_Name'
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
  end
  object qryReport: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT  Purchase_OrderLine.Purchase_Order,'
      '        Purchase_OrderLine.Line,'
      '        Purchase_OrderLine.Customer,'
      '        Purchase_OrderLine.Branch_no,'
      '        Customer_Branch.Name as Branch_Name,'
      '        Customer.Name as Customer_Name,'
      '        Purchase_OrderLine.Cust_Order_No,'
      '        Purchase_OrderLine.Customers_Desc,'
      '        Purchase_OrderLine.Quantity,'
      '        Purchase_OrderLine.Order_Price,'
      '        Purchase_OrderLine.Selling_Price,'
      '        Purchase_OrderLine.Sell_Unit,'
      '        Purchase_OrderLine.Order_Unit,'
      '        Rep.Name as Rep_Name,'
      '        Price_Unit.Description as Cost_Unit_Description,'
      '        Price_Unit.Price_Unit_Factor as Cost_Factor,'
      '        Price_Unit_sell.Description as Sell_Unit_Description,'
      '        Price_Unit_sell.Price_Unit_Factor as Sell_Factor,'
      '        Purchase_Order.Date_Point,'
      '        Supplier_Branch.Name as Supplier_branch_Name,'
      '        Supplier.Name as Supplier_name,'
      '        Job_Bag_Line_Dets.Job_Bag'
      'FROM (Supplier'
      '      INNER JOIN Supplier_Branch ON'
      '        Supplier.Supplier = Supplier_Branch.Supplier)'
      '      INNER JOIN (Rep'
      '      INNER JOIN(Purchase_Order'
      '      INNER JOIN ((Customer'
      '      INNER JOIN Customer_Branch ON'
      '        Customer.Customer = Customer_Branch.Customer)'
      '      INNER JOIN ((Price_Unit AS Price_Unit_sell'
      '      INNER JOIN (Price_Unit'
      '      INNER JOIN Purchase_OrderLine ON'
      
        '        Price_Unit.Price_Unit = Purchase_OrderLine.Order_Unit) O' +
        'N'
      
        '        Price_Unit_sell.Price_Unit = Purchase_OrderLine.Sell_Uni' +
        't)'
      '      LEFT JOIN Job_Bag_Line_Dets ON'
      '        (Purchase_OrderLine.Line = Job_Bag_Line_Dets.Line) AND'
      
        '        (Purchase_OrderLine.Purchase_Order = Job_Bag_Line_Dets.P' +
        'urchase_Order)) ON'
      
        '        (Customer_Branch.Branch_no = Purchase_OrderLine.Branch_n' +
        'o) AND'
      
        '        (Customer_Branch.Customer = Purchase_OrderLine.Customer)' +
        ') ON'
      
        '        Purchase_Order.Purchase_Order = Purchase_OrderLine.Purch' +
        'ase_Order) ON'
      '        Rep.Rep = Purchase_OrderLine.Rep) ON'
      
        '        (Supplier_Branch.Branch_no = Purchase_Order.Branch_No) A' +
        'ND'
      '        (Supplier_Branch.Supplier = Purchase_Order.Supplier)'
      'WHERE Job_bag is null'
      'ORDER BY Purchase_OrderLine.Purchase_Order ')
    Left = 184
    Top = 24
    object qryReportPurchase_Order: TFloatField
      FieldName = 'Purchase_Order'
    end
    object qryReportLine: TIntegerField
      FieldName = 'Line'
    end
    object qryReportCustomer: TIntegerField
      FieldName = 'Customer'
    end
    object qryReportBranch_no: TIntegerField
      FieldName = 'Branch_no'
    end
    object qryReportBranch_Name: TStringField
      FieldName = 'Branch_Name'
      FixedChar = True
      Size = 80
    end
    object qryReportCustomer_Name: TStringField
      FieldName = 'Customer_Name'
      FixedChar = True
      Size = 80
    end
    object qryReportCust_Order_No: TStringField
      FieldName = 'Cust_Order_No'
      FixedChar = True
      Size = 50
    end
    object qryReportCustomers_Desc: TStringField
      FieldName = 'Customers_Desc'
      FixedChar = True
      Size = 80
    end
    object qryReportQuantity: TFloatField
      FieldName = 'Quantity'
    end
    object qryReportOrder_Price: TCurrencyField
      FieldName = 'Order_Price'
    end
    object qryReportSelling_Price: TCurrencyField
      FieldName = 'Selling_Price'
    end
    object qryReportSell_Unit: TIntegerField
      FieldName = 'Sell_Unit'
    end
    object qryReportOrder_Unit: TIntegerField
      FieldName = 'Order_Unit'
    end
    object qryReportRep_Name: TStringField
      FieldName = 'Rep_Name'
      FixedChar = True
      Size = 80
    end
    object qryReportCost_Unit_Description: TStringField
      FieldName = 'Cost_Unit_Description'
      FixedChar = True
      Size = 80
    end
    object qryReportCost_Factor: TFloatField
      FieldName = 'Cost_Factor'
    end
    object qryReportSell_Unit_Description: TStringField
      FieldName = 'Sell_Unit_Description'
      FixedChar = True
      Size = 80
    end
    object qryReportSell_Factor: TFloatField
      FieldName = 'Sell_Factor'
    end
    object qryReportDate_Point: TDateTimeField
      FieldName = 'Date_Point'
    end
    object qryReportSupplier_branch_Name: TStringField
      FieldName = 'Supplier_branch_Name'
      FixedChar = True
      Size = 80
    end
    object qryReportSupplier_name: TStringField
      FieldName = 'Supplier_name'
      FixedChar = True
      Size = 80
    end
    object qryReportJob_Bag: TIntegerField
      FieldName = 'Job_Bag'
    end
    object qryReportTotal_Cost: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'Total_Cost'
      OnGetText = qryReportTotal_CostGetText
      Calculated = True
    end
    object qryReportTotal_Sell: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'Total_Sell'
      OnGetText = qryReportTotal_SellGetText
      Calculated = True
    end
  end
end
