object PBRPLabelsReelsFrm: TPBRPLabelsReelsFrm
  Left = 92
  Top = 86
  Width = 697
  Height = 544
  HorzScrollBar.Range = 1200
  VertScrollBar.Range = 2000
  Caption = 'PBRPLabelsReelsFrm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  
  TextHeight = 14
  object PBLabelsQuickReport: TQuickRep
    Left = 8
    Top = 0
    Width = 578
    Height = 578
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
    Page.Columns = 1
    Page.Orientation = poLandscape
    Page.PaperSize = Custom
    Page.Continuous = False
    Page.Values = (
      450.000000000000000000
      1530.000000000000000000
      50.000000000000000000
      1530.000000000000000000
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
    object QRBand1: TQRSubDetail
      Left = 19
      Top = 19
      Width = 540
      Height = 374
      AlignToBottom = False
      BeforePrint = QRBand1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        989.541666666666700000
        1428.750000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = PBLabelsQuickReport
      DataSet = PODelivSQL
      PrintBefore = False
      PrintIfEmpty = True
      object NumberedLbl: TQRLabel
        Left = 16
        Top = 320
        Width = 97
        Height = 17
        Size.Values = (
          44.979166666666670000
          42.333333333333330000
          846.666666666666800000
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
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object FromLbl: TQRLabel
        Left = 125
        Top = 320
        Width = 212
        Height = 17
        Size.Values = (
          44.979166666666670000
          330.729166666666700000
          846.666666666666800000
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
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object Memodescription: TQRMemo
        Left = 125
        Top = 226
        Width = 321
        Height = 37
        Size.Values = (
          97.895833333333320000
          330.729166666666700000
          597.958333333333200000
          849.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
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
        Left = 392
        Top = 274
        Width = 146
        Height = 17
        Size.Values = (
          44.979166666666670000
          1037.166666666667000000
          724.958333333333200000
          386.291666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'XXXXXXX'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object BoxQuantityLbl: TQRLabel
        Left = 125
        Top = 274
        Width = 58
        Height = 17
        Size.Values = (
          44.979166666666670000
          330.729166666666700000
          724.958333333333200000
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
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object FormRefLbl: TQRLabel
        Left = 125
        Top = 201
        Width = 81
        Height = 19
        Enabled = False
        Size.Values = (
          50.270833333333330000
          330.729166666666700000
          531.812500000000000000
          214.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'XXXXXXXXXX'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel1: TQRLabel
        Left = 16
        Top = 201
        Width = 63
        Height = 20
        Enabled = False
        Size.Values = (
          52.916666666666670000
          42.333333333333340000
          531.812500000000000000
          166.687500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = 'Form Ref:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRDBCustOrderRef: TQRDBText
        Left = 125
        Top = 295
        Width = 148
        Height = 17
        Size.Values = (
          44.979166666666670000
          330.729166666666700000
          780.520833333333200000
          391.583333333333300000)
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
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
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
        Left = 125
        Top = 174
        Width = 69
        Height = 19
        Size.Values = (
          50.270833333333330000
          330.729166666666700000
          460.375000000000000000
          182.562500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'lblCustomer'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel2: TQRLabel
        Left = 16
        Top = 174
        Width = 68
        Height = 20
        Size.Values = (
          52.916666666666670000
          42.333333333333340000
          460.375000000000000000
          179.916666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Customer:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel3: TQRLabel
        Left = 16
        Top = 274
        Width = 56
        Height = 17
        Size.Values = (
          44.979166666666670000
          42.333333333333340000
          724.958333333333200000
          148.166666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Box Qty:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel4: TQRLabel
        Left = 16
        Top = 295
        Width = 64
        Height = 17
        Size.Values = (
          44.979166666666670000
          42.333333333333340000
          780.520833333333400000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cust O/N:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel5: TQRLabel
        Left = 280
        Top = 274
        Width = 105
        Height = 17
        Size.Values = (
          44.979166666666670000
          740.833333333333200000
          724.958333333333200000
          277.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Nine 8 Nine O/N:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel6: TQRLabel
        Left = 280
        Top = 295
        Width = 71
        Height = 17
        Size.Values = (
          44.979166666666670000
          740.833333333333200000
          780.520833333333400000
          187.854166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Prod Date:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object QRLabel7: TQRLabel
        Left = 16
        Top = 226
        Width = 79
        Height = 20
        Size.Values = (
          52.916666666666670000
          42.333333333333340000
          597.958333333333400000
          209.020833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Description:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
      object qrmCompany: TQRMemo
        Left = 344
        Top = 8
        Width = 193
        Height = 89
        Size.Values = (
          235.479166666667000000
          910.166666666667000000
          21.166666666666700000
          510.645833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 9
      end
      object gtlblFSCClaim: TQRLabel
        Left = 16
        Top = 352
        Width = 58
        Height = 16
        Size.Values = (
          42.333333333333340000
          42.333333333333340000
          931.333333333333500000
          153.458333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'FSC Claim:'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object ReportImage: TQRImage
        Left = 232
        Top = 0
        Width = 97
        Height = 152
        Enabled = False
        Size.Values = (
          402.166666666666600000
          613.833333333333400000
          0.000000000000000000
          256.645833333333400000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Stretch = True
      end
      object DeliveryDateLbl: TQRLabel
        Left = 392
        Top = 295
        Width = 144
        Height = 17
        Size.Values = (
          44.979166666666670000
          1037.166666666667000000
          780.520833333333200000
          381.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'DeliveryDateLbl'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
  end
  object PODelivSQL: TFDQuery
    ConnectionName = 'PB'
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
      'Purchase_OrderLine.Branch_no as ordBranch,'
      'Purchase_Orderline.FSC_Material_Claim,'
      'Purchase_Orderline.FSC_Mixed_Percentage'
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
        Name = 'Int_sel_code'
        DataType = ftInteger
      end>
  end
  object PODelivSRC: TDataSource
    DataSet = PODelivSQL
    Left = 527
    Top = 360
  end
  object CustomerSQL: TFDQuery
    ConnectionName = 'PB'
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
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end>
  end
  object AdhocSQL: TFDQuery
    ConnectionName = 'PB'
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
        Name = 'Ad_hoc_Address'
      end>
  end
  object RepSQL: TFDQuery
    ConnectionName = 'PB'
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
        Name = 'Rep'
      end>
  end
  object SupplierSQL: TFDQuery
    ConnectionName = 'PB'
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
    Top = 360
    ParamData = <
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_no'
      end>
  end
  object AddressSRC: TDataSource
    DataSet = CustomerSQL
    Left = 88
    Top = 360
  end
  object CompSQL: TFDQuery
    ConnectionName = 'PB'
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
  object qryGetFSCClaim: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from FSC_Material_Claim'
      'where FSC_Material_Claim = :FSC_Material_Claim')
    Left = 526
    Top = 310
    ParamData = <
      item
        Name = 'FSC_Material_Claim'
      end>
  end
end
