object STRPLabelsDelivFrm: TSTRPLabelsDelivFrm
  Left = 126
  Top = 101
  Width = 663
  Height = 591
  HorzScrollBar.Range = 1200
  VertScrollBar.Range = 2000
  Caption = 'STRPLabelsDelivFrm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  Scaled = True
  TextHeight = 14
  object STLabelsQuickReport: TQuickRep
    Left = 40
    Top = 0
    Width = 578
    Height = 578
    ShowingPreview = False
    BeforePrint = STLabelsQuickReportBeforePrint
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
      Left = 19
      Top = 19
      Width = 540
      Height = 334
      AlignToBottom = False
      BeforePrint = QRBand1BeforePrint
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        883.708333333333300000
        1428.750000000000000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = STLabelsQuickReport
      DataSet = SODelivSQL
      PrintBefore = False
      PrintIfEmpty = True
      object AddressMemo: TQRMemo
        Left = 141
        Top = 112
        Width = 380
        Height = 137
        Enabled = False
        Size.Values = (
          362.479166666667000000
          373.062500000000000000
          296.333333333333000000
          1005.416666666670000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
          'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx')
        ParentFont = False
        Transparent = False
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 11
      end
      object QRDBCustOrderRef: TQRDBText
        Left = 141
        Top = 256
        Width = 133
        Height = 19
        Size.Values = (
          50.270833333333300000
          373.062500000000000000
          677.333333333333000000
          351.895833333333000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        DataSet = SODelivSQL
        DataField = 'Cust_Order_no'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object lblCustomer: TQRLabel
        Left = 141
        Top = 110
        Width = 84
        Height = 19
        Size.Values = (
          50.270833333333330000
          373.062500000000000000
          291.041666666666700000
          222.250000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'lblCustomer'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRLabel2: TQRLabel
        Left = 16
        Top = 110
        Width = 88
        Height = 20
        Size.Values = (
          52.916666666666670000
          42.333333333333330000
          291.041666666666700000
          232.833333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Delivery to:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object BoxQRLbl: TQRLabel
        Left = 141
        Top = 288
        Width = 153
        Height = 19
        Size.Values = (
          50.270833333333300000
          373.062500000000000000
          762.000000000000000000
          404.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'BoxQRLbl'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object lblCustOrderRef: TQRLabel
        Left = 16
        Top = 255
        Width = 73
        Height = 20
        Size.Values = (
          52.916666666666670000
          42.333333333333330000
          674.687500000000000000
          193.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Your Ref:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object lblDate: TQRLabel
        Left = 303
        Top = 287
        Width = 42
        Height = 20
        Size.Values = (
          52.916666666666670000
          801.687500000000000000
          759.354166666666700000
          111.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Date:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object lblDeliveryNo: TQRLabel
        Left = 413
        Top = 255
        Width = 122
        Height = 20
        Size.Values = (
          52.916666666666700000
          1092.729166666670000000
          674.687500000000000000
          322.791666666667000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'DELIVERY No: '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object lblBoxNo: TQRLabel
        Left = 15
        Top = 288
        Width = 64
        Height = 20
        Size.Values = (
          52.916666666666670000
          39.687500000000000000
          762.000000000000000000
          169.333333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Box No:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRLabel5: TQRLabel
        Left = 303
        Top = 255
        Width = 103
        Height = 20
        Size.Values = (
          52.916666666666670000
          801.687500000000000000
          674.687500000000000000
          272.520833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Latcham Ref:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object qrlblDelivery: TQRLabel
        Left = 16
        Top = 198
        Width = 74
        Height = 20
        Size.Values = (
          52.916666666666670000
          42.333333333333330000
          523.875000000000000000
          195.791666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Location:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object lblDeliveryTo: TQRLabel
        Left = 141
        Top = 198
        Width = 90
        Height = 19
        Size.Values = (
          50.270833333333330000
          373.062500000000000000
          523.875000000000000000
          238.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'lblDeliveryTo'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRLabel3: TQRLabel
        Left = 16
        Top = 158
        Width = 113
        Height = 20
        Size.Values = (
          52.916666666666670000
          42.333333333333330000
          418.041666666666700000
          298.979166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Contact name:'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object QRDBText1: TQRDBText
        Left = 141
        Top = 159
        Width = 106
        Height = 19
        Size.Values = (
          50.270833333333330000
          373.062500000000000000
          420.687500000000000000
          280.458333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = SODelivSQL
        DataField = 'Contact_Name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 12
      end
      object DeliveryDateLbl: TQRLabel
        Left = 363
        Top = 288
        Width = 150
        Height = 19
        Size.Values = (
          50.270833333333300000
          960.437500000000000000
          762.000000000000000000
          396.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Caption = 'DeliveryDateLbl'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 12
      end
    end
  end
  object oldSODelivSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'SELECT Int_Sel.*, Sales_Order.*, Part.Part_Description, Sales_Or' +
        'der_Line.Sell_Pack_Quantity, Part.Part'
      'FROM Part INNER JOIN ((Int_Sel INNER JOIN Sales_Order ON'
      
        '  Int_Sel.Sel2 = Sales_Order.Sales_Order) INNER JOIN Sales_Order' +
        '_line ON'
      
        '  (Int_Sel.Sel3 = Sales_Order_line.Sales_Order_line_no) AND (Sal' +
        'es_Order.Sales_Order = Sales_Order_line.Sales_Order)) ON Part.Pa' +
        'rt = Sales_Order_line.Part'
      'WHERE (((Int_Sel.Int_Sel_Code)=:Int_sel_code))'
      'ORDER BY Int_Sel.Sel1,Int_Sel.Sel2, Int_sel.Sel3, Int_sel.Sel4'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 240
    Top = 48
    ParamData = <
      item
        Name = 'Int_sel_code'
        DataType = ftInteger
      end>
  end
  object SODelivSRC: TDataSource
    DataSet = SODelivSQL
    Left = 335
    Top = 96
  end
  object AddressSRC: TDataSource
    DataSet = CustomerSQL
    Left = 88
    Top = 360
  end
  object AdhocSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Name,'
      #9#9#9'Building_no_name,'
      '        Street,'
      '        Locale,'
      '        Town,'
      '        Postcode,'
      '        Name as branch_Name'
      'from Ad_hoc_Address'
      'where Ad_hoc_Address = :Ad_hoc_Address')
    Left = 161
    Top = 336
    ParamData = <
      item
        Name = 'Ad_hoc_Address'
      end>
  end
  object CustomerSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Customer.Name as Name,'
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
      ' '
      ' ')
    Left = 406
    Top = 360
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end>
  end
  object SODelivSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Int_Sel.*,'
      '        Sales_Order.*,'
      '        Customer_Contact.Name as Contact_Name'
      'FROM Customer_Contact'
      '      INNER JOIN (Sales_Order'
      '      INNER JOIN Int_Sel ON'
      '        Sales_Order.Sales_Order = Int_Sel.Sel2) ON'
      
        '        (Customer_Contact.Contact_no = Sales_Order.Contact_no) A' +
        'ND'
      '        (Customer_Contact.Branch_no = Sales_Order.Branch_no) AND'
      '        (Customer_Contact.Customer = Sales_Order.Customer)'
      'WHERE Int_Sel.Int_sel_Code = :Int_Sel_Code'
      'ORDER BY Int_Sel.Sel1,Int_Sel.Sel2, Int_sel.Sel3, Int_sel.Sel4 ')
    Left = 331
    Top = 51
    ParamData = <
      item
        Name = 'Int_Sel_Code'
      end>
  end
end
