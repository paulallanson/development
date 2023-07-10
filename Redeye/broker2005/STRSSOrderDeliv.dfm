object STRSSOrderDelivFrm: TSTRSSOrderDelivFrm
  Left = 36
  Top = 63
  Width = 749
  Height = 494
  Caption = 'Sales Order Delivery Report'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 400
    Width = 741
    Height = 41
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      741
      41)
    object PreviewBitBtn: TBitBtn
      Left = 486
      Top = 8
      Width = 76
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Pre&view'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Visible = False
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33033333333333333F7F3333333333333000333333333333F777333333333333
        000333333333333F777333333333333000333333333333F77733333333333300
        033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
        33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
        3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
        33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
        333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
        333333773FF77333333333370007333333333333777333333333}
      NumGlyphs = 2
    end
    object PrintBitBtn: TBitBtn
      Left = 577
      Top = 8
      Width = 72
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Print'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Visible = False
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        0003377777777777777308888888888888807F33333333333337088888888888
        88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
        8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
        8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
    end
    object CancelBitBtn: TBitBtn
      Left = 661
      Top = 8
      Width = 72
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Cancel'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Kind = bkCancel
    end
    object btnEmail: TBitBtn
      Left = 15
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Email'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = btnEmailClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333FFFFFFFFFFFFFFF000000000000
        000077777777777777770FFFFFFFFFFFFFF07F3333FFF33333370FFFF777FFFF
        FFF07F333777333333370FFFFFFFFFFFFFF07F3333FFFFFF33370FFFF777777F
        FFF07F33377777733FF70FFFFFFFFFFF99907F3FFF33333377770F777FFFFFFF
        9CA07F77733333337F370FFFFFFFFFFF9A907FFFFFFFFFFF7FF7000000000000
        0000777777777777777733333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
    end
    object btnDetails: TBitBtn
      Left = 111
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Maintain'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = btnDetailsClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
        000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
        00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
        F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
        0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
        FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
        FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
        0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
        00333377737FFFFF773333303300000003333337337777777333}
      NumGlyphs = 2
    end
  end
  object dbgDetails: TDBGrid
    Left = 0
    Top = 81
    Width = 741
    Height = 319
    Align = alClient
    DataSource = dtsReport
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dbgDetailsDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Name'
        Width = 221
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Delivery_Date'
        Title.Caption = 'Delivery Date'
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sales_Order'
        Title.Caption = 'Sales Order'
        Width = 96
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cust_Order_No'
        Title.Caption = 'Customer Order Ref'
        Width = 122
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Consignment_number'
        Title.Caption = 'Consignment Number'
        Width = 131
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 741
    Height = 81
    Align = alTop
    TabOrder = 2
    DesignSize = (
      741
      81)
    object Label2: TLabel
      Left = 538
      Top = 18
      Width = 52
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Date From:'
    end
    object Label1: TLabel
      Left = 538
      Top = 50
      Width = 42
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Date To:'
    end
    object grpbxCustomer: TGroupBox
      Left = 128
      Top = 4
      Width = 313
      Height = 69
      TabOrder = 0
      Visible = False
      object Label3: TLabel
        Left = 16
        Top = 16
        Width = 44
        Height = 13
        Caption = 'Customer'
      end
      object edtCustomer: TEdit
        Left = 14
        Top = 36
        Width = 257
        Height = 21
        TabStop = False
        MaxLength = 30
        ReadOnly = True
        TabOrder = 0
        OnChange = ntomerChange
      end
      object btnCustomer: TBitBtn
        Left = 280
        Top = 34
        Width = 25
        Height = 25
        Caption = '...'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnCustomerClick
      end
    end
    object edtDateFrom: TEdit
      Left = 604
      Top = 14
      Width = 84
      Height = 21
      Anchors = [akTop, akRight]
      MaxLength = 30
      TabOrder = 1
      OnChange = edtDateFromChange
      OnExit = edtDateFromExit
    end
    object edtDateTo: TEdit
      Left = 604
      Top = 46
      Width = 84
      Height = 21
      Anchors = [akTop, akRight]
      MaxLength = 30
      TabOrder = 2
      OnChange = edtDateToChange
      OnExit = edtDateToExit
    end
    object btnDateFrom: TBitBtn
      Left = 700
      Top = 12
      Width = 25
      Height = 25
      Anchors = [akTop, akRight]
      TabOrder = 3
      OnClick = btnDateFromClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        003337777777777777F330FFFFFFFFFFF03337F3333FFF3337F330FFFF000FFF
        F03337F33377733337F330FFFFF0FFFFF03337F33337F33337F330FFFF00FFFF
        F03337F33377F33337F330FFFFF0FFFFF03337F33337333337F330FFFFFFFFFF
        F03337FFF3F3F3F3F7F33000F0F0F0F0F0333777F7F7F7F7F7F330F0F000F070
        F03337F7F777F777F7F330F0F0F0F070F03337F7F7373777F7F330F0FF0FF0F0
        F03337F733733737F7F330FFFFFFFF00003337F33333337777F330FFFFFFFF0F
        F03337FFFFFFFF7F373330999999990F033337777777777F733330FFFFFFFF00
        333337FFFFFFFF77333330000000000333333777777777733333}
      NumGlyphs = 2
    end
    object btnDateTo: TBitBtn
      Left = 700
      Top = 44
      Width = 25
      Height = 25
      Anchors = [akTop, akRight]
      TabOrder = 4
      OnClick = btnDateToClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        003337777777777777F330FFFFFFFFFFF03337F3333FFF3337F330FFFF000FFF
        F03337F33377733337F330FFFFF0FFFFF03337F33337F33337F330FFFF00FFFF
        F03337F33377F33337F330FFFFF0FFFFF03337F33337333337F330FFFFFFFFFF
        F03337FFF3F3F3F3F7F33000F0F0F0F0F0333777F7F7F7F7F7F330F0F000F070
        F03337F7F777F777F7F330F0F0F0F070F03337F7F7373777F7F330F0FF0FF0F0
        F03337F733733737F7F330FFFFFFFF00003337F33333337777F330FFFFFFFF0F
        F03337FFFFFFFF7F373330999999990F033337777777777F733330FFFFFFFF00
        333337FFFFFFFF77333330000000000333333777777777733333}
      NumGlyphs = 2
    end
    object rgCustomer: TRadioGroup
      Left = 8
      Top = 4
      Width = 113
      Height = 69
      ItemIndex = 0
      Items.Strings = (
        'All Customers'
        'One Customer')
      TabOrder = 5
      OnClick = rgCustomerClick
    end
  end
  object stbDetails: TStatusBar
    Left = 0
    Top = 441
    Width = 741
    Height = 19
    Panels = <
      item
        Width = 300
      end
      item
        Width = 50
      end>
  end
  object qryReport: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT  Sales_Order_Delivery.Sales_Order,'
      '        Sales_Order_Delivery.Sales_order_delivery_no,'
      '        Sales_Order_Delivery.Delivery_Date,'
      '        Sales_Order_Delivery.Consignment_number,'
      '        Sales_Order.Cust_Order_No,'
      '        Sales_Order.Customer,'
      '        Customer.Name'
      'FROM Customer'
      '      INNER JOIN (Customer_Branch'
      '      INNER JOIN (Sales_Order'
      '      INNER JOIN Sales_Order_Delivery ON'
      
        '        Sales_Order.Sales_Order = Sales_Order_Delivery.Sales_Ord' +
        'er) ON'
      '        (Customer_Branch.Branch_no = Sales_Order.Branch_no) AND'
      '        (Customer_Branch.Customer = Sales_Order.Customer)) ON'
      '        Customer.Customer = Customer_Branch.Customer'
      'WHERE 1=1 and Sales_order.Sales_order_Head_status > 100')
    Left = 224
    Top = 160
    object qryReportSales_Order: TIntegerField
      FieldName = 'Sales_Order'
      Origin = 'PB.Sales_Order_Delivery.Sales_Order'
    end
    object qryReportSales_order_delivery_no: TIntegerField
      FieldName = 'Sales_order_delivery_no'
      Origin = 'PB.Sales_Order_Delivery.Sales_order_delivery_no'
    end
    object qryReportDelivery_Date: TDateTimeField
      FieldName = 'Delivery_Date'
      Origin = 'PB.Sales_Order_Delivery.Delivery_Date'
    end
    object qryReportConsignment_number: TStringField
      FieldName = 'Consignment_number'
      Origin = 'PB.Sales_Order_Delivery.Consignment_number'
      FixedChar = True
      Size = 40
    end
    object qryReportCust_Order_No: TStringField
      FieldName = 'Cust_Order_No'
      Origin = 'PB.Sales_Order.Cust_Order_No'
      FixedChar = True
      Size = 80
    end
    object qryReportCustomer: TIntegerField
      FieldName = 'Customer'
      Origin = 'PB.Sales_Order.Customer'
    end
    object qryReportName: TStringField
      FieldName = 'Name'
      Origin = 'PB.Customer.Name'
      FixedChar = True
      Size = 80
    end
  end
  object dtsReport: TDataSource
    DataSet = qryReport
    OnDataChange = dtsReportDataChange
    Left = 272
    Top = 160
  end
  object qryExport: TQuery
    DatabaseName = 'PB'
    Left = 384
    Top = 160
  end
  object qryCompany: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Data_Transfer_Directory'
      'from company'
      'where company = 1')
    Left = 464
    Top = 168
  end
  object qryCustomer: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Customer, Email_address_order_confirm'
      'from Customer'
      'where Customer = :Customer')
    Left = 472
    Top = 232
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end>
  end
end
