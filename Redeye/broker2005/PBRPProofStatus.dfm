object PBRPProofStatusfrm: TPBRPProofStatusfrm
  Left = 16
  Top = 112
  Caption = 'Proof Status'
  ClientHeight = 504
  ClientWidth = 796
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Arial'
  Font.Style = []
  Scaled = True
  TextHeight = 15
  object qrpProofStatus: TQuickRep
    Left = -152
    Top = 16
    Width = 1123
    Height = 794
    ShowingPreview = False
    BeforePrint = qrpProofStatusBeforePrint
    DataSet = qryReport
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE'
      'QRLOOPBAND1'
      'QRLOOPBAND2')
    Functions.DATA = (
      '0'
      '0'
      #39#39
      '0'
      '0')
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
    object qrbndHeading: TQRBand
      Left = 38
      Top = 38
      Width = 1047
      Height = 91
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
        Left = 379
        Top = 2
        Width = 194
        Height = 23
        Size.Values = (
          60.854166666666670000
          1002.770833333333000000
          5.291666666666667000
          513.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taCenter
        AlignToBand = False
        Caption = 'Proof Status Report -'
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
      object qrlblPONum: TQRLabel
        Left = 8
        Top = 56
        Width = 32
        Height = 17
        Size.Values = (
          44.979166666666700000
          21.166666666666700000
          148.166666666667000000
          84.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Order'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qrlblStatus: TQRLabel
        Left = 48
        Top = 56
        Width = 36
        Height = 17
        Size.Values = (
          44.979166666666700000
          127.000000000000000000
          148.166666666667000000
          95.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Status'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qrlblDate: TQRLabel
        Left = 192
        Top = 56
        Width = 27
        Height = 17
        Size.Values = (
          44.979166666666670000
          508.000000000000000000
          148.166666666666700000
          71.437500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qrlblDelBy: TQRLabel
        Left = 936
        Top = 56
        Width = 55
        Height = 17
        Size.Values = (
          44.979166666666700000
          2476.500000000000000000
          148.166666666667000000
          145.520833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Deliver By'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qrlblCustOrderNo: TQRLabel
        Left = 504
        Top = 56
        Width = 80
        Height = 17
        Size.Values = (
          44.979166666666670000
          1333.500000000000000000
          148.166666666666700000
          211.666666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cust Order No'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qrlblRunDate: TQRLabel
        Left = 578
        Top = 2
        Width = 85
        Height = 23
        Size.Values = (
          60.854166666666670000
          1529.291666666667000000
          5.291666666666667000
          224.895833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Run Date'
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
      object qrlblCustomerName: TQRLabel
        Left = 288
        Top = 40
        Width = 67
        Height = 17
        Size.Values = (
          44.979166666666670000
          762.000000000000000000
          105.833333333333300000
          177.270833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer &'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object qrsysdtPageNumber: TQRSysData
        Left = 991
        Top = 0
        Width = 46
        Height = 17
        Size.Values = (
          44.979166666666700000
          2622.020833333330000000
          0.000000000000000000
          121.708333333333000000)
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
      object qrlblPageNumber: TQRLabel
        Left = 943
        Top = 0
        Width = 39
        Height = 17
        Size.Values = (
          44.979166666666700000
          2495.020833333330000000
          0.000000000000000000
          103.187500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Page: '
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel1: TQRLabel
        Left = 673
        Top = 56
        Width = 47
        Height = 17
        Size.Values = (
          44.979166666666670000
          1780.645833333333000000
          148.166666666666700000
          124.354166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Supplier'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel2: TQRLabel
        Left = 288
        Top = 56
        Width = 104
        Height = 17
        Size.Values = (
          44.979166666666670000
          762.000000000000000000
          148.166666666666700000
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
      object QRShape1: TQRShape
        Left = 8
        Top = 72
        Width = 1017
        Height = 17
        Size.Values = (
          44.979166666666700000
          21.166666666666700000
          190.500000000000000000
          2690.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsHorLine
        VertAdjust = 0
      end
    end
    object qrbndDetail: TQRBand
      Left = 38
      Top = 129
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
      BandType = rbDetail
      object qrdbtxtDesc: TQRDBText
        Left = 48
        Top = 0
        Width = 121
        Height = 17
        Size.Values = (
          44.979166666666700000
          127.000000000000000000
          0.000000000000000000
          320.145833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Description'
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
      object qrdbtxtDate: TQRDBText
        Left = 176
        Top = 0
        Width = 55
        Height = 17
        Size.Values = (
          44.979166666666670000
          465.666666666666700000
          0.000000000000000000
          145.520833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Proof_Date'
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
      object qrdbtxtCustsDesc: TQRDBText
        Left = 288
        Top = 18
        Width = 209
        Height = 17
        Size.Values = (
          44.979166666666700000
          762.000000000000000000
          47.625000000000000000
          552.979166666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Customers_Desc'
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
      object qrdbtxtRequired: TQRDBText
        Left = 936
        Top = 0
        Width = 82
        Height = 17
        Size.Values = (
          44.979166666666700000
          2476.500000000000000000
          0.000000000000000000
          216.958333333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Goods_Required'
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
      object qrdbtxtCustOrderNo: TQRDBText
        Left = 504
        Top = 0
        Width = 153
        Height = 17
        Size.Values = (
          44.979166666666700000
          1333.500000000000000000
          0.000000000000000000
          404.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Cust_Order_No'
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
      object qrdbtxtName: TQRDBText
        Left = 288
        Top = 0
        Width = 177
        Height = 17
        Size.Values = (
          44.979166666666700000
          762.000000000000000000
          0.000000000000000000
          468.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Customer_Name'
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
      object qrdbtxtPOLine: TQRDBText
        Left = 8
        Top = 0
        Width = 35
        Height = 17
        Size.Values = (
          44.979166666666700000
          21.166666666666700000
          0.000000000000000000
          92.604166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'POLine'
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
      object QRDBText1: TQRDBText
        Left = 673
        Top = 0
        Width = 248
        Height = 17
        Size.Values = (
          44.979166666666700000
          1780.645833333330000000
          0.000000000000000000
          656.166666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Supplier_Name'
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
      object QRDBText2: TQRDBText
        Left = 673
        Top = 16
        Width = 248
        Height = 17
        Size.Values = (
          44.979166666666700000
          1780.645833333330000000
          42.333333333333300000
          656.166666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = qryReport
        DataField = 'Supplier_job_ref'
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
    end
  end
  object qryReport: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      ' SELECT'
      '  PHist.Purchase_Order, '
      '  PHist.Line, '
      '  PHist.Proof_Date, '
      '  PHist.Proof_Status,  '
      '  Customers_Desc, '
      '  Purchase_OrderLine.Customer, '
      '  Purchase_OrderLine.Branch_no, '
      '  Customer.Name as Customer_Name,'
      '  Goods_Required,'
      '  Purchase_Order.Supplier,'
      '  Purchase_Order.Branch_No,'
      '  Supplier.Name as Supplier_Name, '
      '  Cust_Order_No, '
      '  Purch_Ord_Line_Status,'
      '  Description,'
      '  Supplier_job_ref'
      '  FROM (((((Proof_History PHist '
      
        '  INNER JOIN Proof_Status ON (PHist.Proof_Status = Proof_Status.' +
        'Proof_Status)) '
      
        '  INNER JOIN Purchase_OrderLine ON (PHist.Purchase_Order=Purchas' +
        'e_OrderLine.Purchase_Order AND PHist.Line = Purchase_OrderLine.L' +
        'ine)) '
      
        '  INNER JOIN Customer ON (Purchase_OrderLine.Customer=Customer.C' +
        'ustomer))'
      
        '  INNER JOIN Purchase_Order ON (PHist.Purchase_Order = Purchase_' +
        'Order.Purchase_Order))'
      
        '  INNER JOIN Supplier ON (Purchase_Order.Supplier = Supplier.Sup' +
        'plier)) '
      
        '  WHERE ((Purchase_OrderLine.Inactive <> '#39'Y'#39') or (Purchase_Order' +
        'Line.Inactive is null)) AND'
      '    (PHist.Proof_Date = (SELECT MAX(Proof_Date)'
      '    FROM Proof_History '
      
        '    WHERE (Purchase_Order = PHist.Purchase_Order AND Line = PHis' +
        't.Line) '
      '  GROUP BY Purchase_Order, Line) '
      '  AND Purch_Ord_Line_Status = 20)'
      ' '
      ' '
      ' ')
    Left = 48
    Top = 32
    object qryReportPurchase_Order: TFloatField
      FieldName = 'Purchase_Order'
    end
    object qryReportLine: TIntegerField
      FieldName = 'Line'
    end
    object qryReportProof_Date: TDateTimeField
      FieldName = 'Proof_Date'
    end
    object qryReportProof_Status: TStringField
      FieldName = 'Proof_Status'
      FixedChar = True
      Size = 2
    end
    object qryReportDescription: TStringField
      FieldName = 'Description'
      FixedChar = True
      Size = 80
    end
    object qryReportCustomers_Desc: TStringField
      FieldName = 'Customers_Desc'
      FixedChar = True
      Size = 80
    end
    object qryReportCustomer: TIntegerField
      FieldName = 'Customer'
    end
    object qryReportBranch_no: TIntegerField
      FieldName = 'Branch_no'
    end
    object qryReportCustomer_Name: TStringField
      FieldName = 'Customer_Name'
      FixedChar = True
      Size = 80
    end
    object qryReportGoods_Required: TDateTimeField
      FieldName = 'Goods_Required'
    end
    object qryReportCust_Order_No: TStringField
      FieldName = 'Cust_Order_No'
      FixedChar = True
      Size = 50
    end
    object qryReportPOLine: TStringField
      FieldKind = fkCalculated
      FieldName = 'POLine'
      OnGetText = qryReportPOLineGetText
      Calculated = True
    end
    object qryReportSupplier_Name: TStringField
      FieldName = 'Supplier_Name'
      FixedChar = True
      Size = 80
    end
    object qryReportSupplier_job_ref: TStringField
      FieldName = 'Supplier_job_ref'
      FixedChar = True
      Size = 40
    end
  end
end
