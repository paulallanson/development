object PBRPLabelsFrm: TPBRPLabelsFrm
  Left = 92
  Top = 86
  Width = 1282
  Height = 708
  HorzScrollBar.Range = 1200
  VertScrollBar.Range = 2000
  Caption = 'PBRPLabelsFrm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  Scaled = False
  TextHeight = 14
  object PBLabelsQuickReport: TQuickRep
    Left = 8
    Top = 0
    Width = 1403
    Height = 992
    ShowingPreview = False
    BeforePrint = PBLabelsQuickReportBeforePrint
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
    Options = []
    Page.Columns = 2
    Page.Orientation = poLandscape
    Page.PaperSize = A4
    Page.Continuous = False
    Page.Values = (
      50.000000000000000000
      2100.000000000000000000
      50.000000000000000000
      2970.000000000000000000
      50.000000000000000000
      50.000000000000000000
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
    PrinterSettings.PrintQuality = 0
    PrinterSettings.Collate = 0
    PrinterSettings.ColorOption = 0
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
    object QRBand1: TQRSubDetail
      Left = 24
      Top = 24
      Width = 678
      Height = 470
      AlignToBottom = False
      BeforePrint = QRBand1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        994.833333333333300000
        1435.100000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = PBLabelsQuickReport
      DataSet = PODelivSQL
      PrintBefore = False
      PrintIfEmpty = True
      object NumberedLbl: TQRLabel
        Left = 20
        Top = 420
        Width = 121
        Height = 25
        Size.Values = (
          52.916666666666670000
          42.333333333333330000
          889.000000000000000000
          256.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'Numbering:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object FromLbl: TQRLabel
        Left = 156
        Top = 420
        Width = 265
        Height = 24
        Size.Values = (
          50.270833333333330000
          330.729166666666700000
          889.000000000000000000
          560.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'FromLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object Memodescription: TQRMemo
        Left = 156
        Top = 253
        Width = 505
        Height = 46
        Size.Values = (
          97.895833333333340000
          330.729166666666700000
          534.458333333333400000
          1068.916666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = []
        Lines.Strings = (
          'Line 1'
          'Line2')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 10
      end
      object PONumberLbl: TQRLabel
        Left = 489
        Top = 333
        Width = 173
        Height = 24
        Size.Values = (
          50.270833333333330000
          1034.520833333333000000
          703.791666666666800000
          365.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'XXXXXXX'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object BoxQuantityLbl: TQRLabel
        Left = 156
        Top = 333
        Width = 72
        Height = 24
        Size.Values = (
          50.270833333333330000
          330.729166666666700000
          703.791666666666800000
          153.458333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'BoxQuantityLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object FormRefLbl: TQRLabel
        Left = 156
        Top = 206
        Width = 505
        Height = 24
        Enabled = False
        Size.Values = (
          50.270833333333330000
          330.729166666666700000
          436.562499999999900000
          1068.916666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'XXXXXXXXXX'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel1: TQRLabel
        Left = 20
        Top = 206
        Width = 79
        Height = 25
        Enabled = False
        Size.Values = (
          52.916666666666670000
          42.333333333333330000
          436.033333333333300000
          167.216666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Form Ref:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRDBCustOrderRef: TQRDBText
        Left = 156
        Top = 379
        Width = 185
        Height = 24
        Size.Values = (
          50.270833333333330000
          330.729166666666700000
          801.687500000000100000
          391.583333333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = PODelivSQL
        DataField = 'Cust_Order_no'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object lblCustomer: TQRLabel
        Left = 156
        Top = 158
        Width = 505
        Height = 24
        Size.Values = (
          50.270833333333330000
          330.729166666666700000
          333.375000000000000000
          1068.916666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'lblCustomer'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel2: TQRLabel
        Left = 20
        Top = 158
        Width = 84
        Height = 25
        Size.Values = (
          52.916666666666670000
          42.333333333333330000
          334.433333333333300000
          177.800000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel3: TQRLabel
        Left = 20
        Top = 333
        Width = 71
        Height = 25
        Size.Values = (
          52.916666666666670000
          42.333333333333330000
          704.850000000000000000
          150.283333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Box Qty:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel4: TQRLabel
        Left = 20
        Top = 379
        Width = 79
        Height = 25
        Size.Values = (
          52.916666666666670000
          42.333333333333330000
          802.216666666666700000
          167.216666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cust O/N:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel5: TQRLabel
        Left = 350
        Top = 333
        Width = 121
        Height = 25
        Size.Values = (
          52.916666666666670000
          740.833333333333300000
          704.850000000000000000
          256.116666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Our Reference:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel6: TQRLabel
        Left = 350
        Top = 379
        Width = 86
        Height = 25
        Size.Values = (
          52.916666666666670000
          740.833333333333300000
          802.216666666666700000
          182.033333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Prod Date:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel7: TQRLabel
        Left = 20
        Top = 252
        Width = 97
        Height = 25
        Size.Values = (
          52.916666666666670000
          42.333333333333330000
          533.400000000000000000
          205.316666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Description:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrmCompany: TQRMemo
        Left = 420
        Top = 9
        Width = 241
        Height = 131
        Size.Values = (
          277.812500000000000000
          889.000000000000000000
          18.520833333333340000
          510.645833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object DeliveryDatelbl: TQRLabel
        Left = 489
        Top = 380
        Width = 109
        Height = 24
        Size.Values = (
          50.800000000000000000
          1035.050000000000000000
          804.333333333333300000
          230.716666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'DeliveryDatelbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object ReportImage: TQRImage
        Left = 23
        Top = 8
        Width = 251
        Height = 81
        Size.Values = (
          171.979166666666700000
          47.625000000000000000
          15.875000000000000000
          531.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Center = True
        Stretch = True
      end
    end
  end
  object PODelivSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT Int_Sel.*,'
      'Delivery_Detail.*,'
      'Delivery_Detail.Branch_No0 as iBranch,'
      'Purchase_OrderLine.Cust_Order_no,'
      'Purchase_OrderLine.Customers_Desc,'
      'Purchase_OrderLine.Quantity,'
      'Purchase_OrderLine.Form_Reference,'
      'Form_Reference.Form_Reference_id,'
      'Form_Reference.Form_Reference_Descr,'
      'Purchase_OrderLine.Depth,'
      'Purchase_OrderLine.Depth_unit,'
      'Purchase_OrderLine.Width,'
      'Purchase_OrderLine.Width_unit,'
      'Purchase_OrderLine.Customer as iCustomer,'
      'Purchase_OrderLine.Branch_no as ordBranch'
      'FROM Int_Sel INNER JOIN'
      '((Purchase_OrderLine LEFT JOIN Form_Reference '
      
        'ON Purchase_OrderLine.Form_Reference = Form_Reference.Form_Refer' +
        'ence)'
      'INNER JOIN Delivery_Detail'
      'ON (Purchase_OrderLine.Line = Delivery_Detail.Line) '
      
        'AND (Purchase_OrderLine.Purchase_Order = Delivery_Detail.Purchas' +
        'e_Order))'
      'ON (Int_Sel.Sel4 = Delivery_Detail.Delivery_no)'
      'AND (Int_Sel.Sel3 = Delivery_Detail.Line)'
      'AND (Int_Sel.Sel2 = Delivery_Detail.Purchase_Order)'
      'WHERE'#9'Int_Sel.Int_Sel_Code = :Int_sel_code'
      'ORDER BY Int_Sel.sel1 ASC'
      ' '
      ' '
      ' ')
    Left = 600
    Top = 360
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Int_sel_code'
        ParamType = ptUnknown
      end>
  end
  object PODelivSRC: TDataSource
    DataSet = PODelivSQL
    Left = 527
    Top = 360
  end
  object CustomerSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Customer.Name as Customer_Name,'
      #9#9#9'Building_no_name,'
      '        Street,'
      '        Locale,'
      '        Town,'
      '        Postcode,'
      'Customer_Branch.Name as Branch_Name,'
      'Customer_Branch.Use_Branch_Name'
      'from Customer_Branch, Customer'
      'where ((Customer_Branch.Customer = :Customer) and'
      #9#9#9'(Branch_no = :Branch_no)) and'
      '        Customer_Branch.Customer = Customer.Customer'
      ' ')
    Left = 454
    Top = 360
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
      end>
  end
  object AdhocSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Name,'
      #9#9#9'Building_no_name,'
      '        Street,'
      '        Locale,'
      '        Town,'
      '        Postcode'
      'from Ad_hoc_Address'
      'where Ad_hoc_Address = :Ad_hoc_Address')
    Left = 161
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Ad_hoc_Address'
        ParamType = ptUnknown
      end>
  end
  object RepSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Name,'
      #9#9#9'Building_no_name,'
      '        Street,'
      '        Locale,'
      '        Town,'
      '        Postcode'
      'from Rep'
      'where Rep = :Rep')
    Left = 234
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Rep'
        ParamType = ptUnknown
      end>
  end
  object SupplierSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select '#9'Supplier.Name as Supplier_Name,'
      #9#9#9'Building_no_name,'
      '        Street,'
      '        Locale,'
      '        Town,'
      '        Postcode'
      'from Supplier_Branch, Supplier'
      'where Supplier_Branch.Supplier = :Supplier and'
      #9#9#9'Supplier_Branch.Branch_no = :Branch_no and'
      '        Supplier_Branch.Supplier = Supplier.Supplier'
      ' ')
    Left = 307
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_no'
        ParamType = ptUnknown
      end>
  end
  object AddressSRC: TDataSource
    DataSet = CustomerSQL
    Left = 88
    Top = 360
  end
  object CompSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Company.Name as Company_Name,'
      #9#9#9'Building_no_name,'
      '        Street,'
      '        Locale,'
      '        Town,'
      '        Postcode, phone'
      'from Company'
      'where Company = 1')
    Left = 381
    Top = 360
  end
end
