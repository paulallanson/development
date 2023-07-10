object PBRSStkMoveFrm: TPBRSStkMoveFrm
  Left = 12
  Top = 21
  Width = 780
  Height = 511
  Caption = 'Customer Stock Movement'
  Color = clBtnFace
  Constraints.MinHeight = 511
  Constraints.MinWidth = 780
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    772
    483)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 772
    Height = 169
    Align = alTop
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    DesignSize = (
      772
      169)
    object Label1: TLabel
      Left = 607
      Top = 19
      Width = 87
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Delivery Date from'
    end
    object DateFromButton: TSpeedButton
      Left = 720
      Top = 30
      Width = 25
      Height = 25
      Anchors = [akTop, akRight]
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
      OnClick = DateFromButtonClick
    end
    object DateToButton: TSpeedButton
      Left = 720
      Top = 75
      Width = 25
      Height = 25
      Anchors = [akTop, akRight]
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
      OnClick = DateToButtonClick
    end
    object Label2: TLabel
      Left = 607
      Top = 64
      Width = 76
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Delivery Date to'
    end
    object Label3: TLabel
      Left = 8
      Top = 128
      Width = 52
      Height = 13
      Caption = 'Sort first by'
    end
    object Label4: TLabel
      Left = 160
      Top = 128
      Width = 55
      Height = 13
      Caption = 'then sort by'
    end
    object Label5: TLabel
      Left = 312
      Top = 128
      Width = 55
      Height = 13
      Caption = 'then sort by'
    end
    object rgCustomer: TRadioGroup
      Left = 8
      Top = 8
      Width = 145
      Height = 57
      Caption = 'By Customers'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'All Customers'
        'One Customer')
      ParentFont = False
      TabOrder = 0
      OnClick = rgCustomerClick
    end
    object rgStockRef: TRadioGroup
      Left = 8
      Top = 67
      Width = 145
      Height = 57
      Caption = 'By Stock Reference'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'All Stock items'
        'One Stock item')
      ParentFont = False
      TabOrder = 1
      Visible = False
      OnClick = rgStockRefClick
    end
    object FormRefPanel: TPanel
      Left = 161
      Top = 75
      Width = 281
      Height = 49
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Visible = False
      object lblSupplier: TLabel
        Left = 8
        Top = 4
        Width = 81
        Height = 13
        Caption = 'Stock Reference'
      end
      object edtStockRef: TEdit
        Left = 8
        Top = 20
        Width = 233
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
      object btnFormRef: TButton
        Left = 248
        Top = 19
        Width = 25
        Height = 25
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnFormRefClick
      end
    end
    object CustomerPanel: TPanel
      Left = 163
      Top = 16
      Width = 281
      Height = 49
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Visible = False
      object lblCustomer: TLabel
        Left = 8
        Top = 4
        Width = 83
        Height = 13
        Caption = 'Customer/Branch'
      end
      object edtCustomer: TEdit
        Left = 8
        Top = 20
        Width = 233
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
      object btnCustomer: TButton
        Left = 248
        Top = 19
        Width = 25
        Height = 25
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnCustomerClick
      end
    end
    object DateFromEdit: TEdit
      Left = 607
      Top = 32
      Width = 98
      Height = 21
      Anchors = [akTop, akRight]
      MaxLength = 10
      TabOrder = 4
      OnExit = DateFromEditExit
    end
    object DateToEdit: TEdit
      Left = 607
      Top = 77
      Width = 98
      Height = 21
      Anchors = [akTop, akRight]
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 5
      OnExit = DateToEditExit
    end
    object cbSort1: TComboBox
      Left = 8
      Top = 144
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 6
      OnChange = cbSort1Change
      Items.Strings = (
        'Customer'
        'Supplier'
        'Order Number'
        'Order Date'
        'Delivery Date'
        'Stock Reference')
    end
    object cbSort2: TComboBox
      Left = 160
      Top = 144
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 7
      OnChange = cbSort2Change
      Items.Strings = (
        'Customer'
        'Supplier'
        'Order Number'
        'Order Date'
        'Delivery Date'
        'Stock Reference')
    end
    object cbSort3: TComboBox
      Left = 312
      Top = 144
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 8
      OnChange = cbSort2Change
      Items.Strings = (
        'Customer'
        'Supplier'
        'Order Number'
        'Order Date'
        'Delivery Date'
        'Stock Reference')
    end
    object chkbxExcSell: TCheckBox
      Left = 607
      Top = 112
      Width = 136
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'Exclude Sales Values'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 9
      OnClick = chkbxExcSellClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 169
    Width = 772
    Height = 273
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 770
      Height = 271
      Align = alClient
      DataSource = dsReport
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'Stock_Reference'
          Title.Caption = 'Stock Reference'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 161
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'POrder'
          Title.Caption = 'Order No'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Date_Point'
          Title.Caption = 'Schd Date'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 86
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Customer_Name'
          Title.Caption = 'Customer'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 206
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Cust_order_no'
          Title.Caption = 'Customer Ref'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 142
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Qty_to_Deliver'
          Title.Caption = 'Quantity'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Qty_In'
          Title.Caption = 'Quantity In'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Qty_Out'
          Title.Caption = 'Quantity Out'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DeliveryName'
          Title.Caption = 'Delivery To'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Supplier_Name'
          Title.Caption = 'Supplier'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Date_Deliv_Actual'
          Title.Caption = 'Delivery Date'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 82
          Visible = True
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 442
    Width = 772
    Height = 41
    Align = alBottom
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object CancelBitBtn: TBitBtn
      Left = 432
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Cancel'
      TabOrder = 0
      Kind = bkCancel
    end
    object PreviewBitBtn: TBitBtn
      Left = 592
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Pre&view'
      TabOrder = 1
      OnClick = PreviewBitBtnClick
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
      Left = 672
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Print'
      TabOrder = 2
      OnClick = PrintBitBtnClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
    end
  end
  object chkbxExcCsts: TCheckBox
    Left = 607
    Top = 136
    Width = 136
    Height = 17
    Anchors = [akTop, akRight]
    Caption = 'Exclude Cost Values'
    Checked = True
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    State = cbChecked
    TabOrder = 3
  end
  object qryReport: TQuery
    OnCalcFields = qryReportCalcFields
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT  Delivery_Detail.Purchase_Order,'
      '        Delivery_Detail.Line,'
      '        Delivery_Detail.Delivery_no,'
      '        Delivery_Detail.Ad_hoc_Address,'
      '        Delivery_Detail.Supplier,'
      '        Delivery_Detail.Branch_no,'
      '        Delivery_Detail.Rep,'
      '        Delivery_Detail.Qty_to_Deliver,'
      '        Delivery_Detail.Qty_Delivered,'
      '        Delivery_Detail.Qty_Invoiced,'
      '        Delivery_Detail.Date_Point,'
      '        Delivery_Detail.Branch_No0,'
      '        Delivery_Detail.Customer,'
      '        Delivery_Detail.Deliver_via_Company,'
      '        Delivery_Detail.Date_Deliv_Actual,'
      '        Delivery_Detail.Delivery_to_Stock,'
      '        Delivery_Detail.Delivery_note_printed,'
      '        Purchase_OrderLine.Customer AS Order_Customer,'
      '        Purchase_OrderLine.Branch_no AS Customer_Branch,'
      '        Purchase_OrderLine.Cust_Order_No,'
      '        Purchase_OrderLine.Purch_Ord_Line_Status,'
      '        Purchase_Order.Supplier,'
      '        Purchase_Order.Branch_No AS Supplier_Branch,'
      '        Supplier.Name AS Supplier_Name,'
      '        Customer.Name AS Customer_Name,'
      '        Purch_Ord_Line_Status.Description AS Order_Status,'
      '        Purchase_OrderLine.Customers_Desc,'
      '        Form_Reference.Form_Reference_ID,'
      '        Form_Reference.Stock_Reference,'
      '        Purchase_OrderLine.Selling_Price,'
      '        Purchase_OrderLine.Sell_Unit,'
      '        Price_Unit.Description as Sell_Unit_Descr,'
      '        Price_Unit.Price_Unit_Factor'
      'FROM Price_Unit'
      '  INNER JOIN (Customer_Branch'
      '  INNER JOIN (Supplier'
      '  INNER JOIN ((Purch_Ord_Line_Status'
      '  INNER JOIN (Form_Reference'
      '  RIGHT JOIN (Customer'
      '  INNER JOIN Purchase_OrderLine ON'
      '    Customer.Customer = Purchase_OrderLine.Customer) ON'
      
        '    Form_Reference.Form_Reference = Purchase_OrderLine.Form_Refe' +
        'rence) ON'
      
        '    Purch_Ord_Line_Status.Purch_Ord_Line_Status = Purchase_Order' +
        'Line.Purch_Ord_Line_Status)'
      '  INNER JOIN (Supplier_Branch'
      '  INNER JOIN (Purchase_Order'
      '  INNER JOIN Delivery_Detail ON'
      
        '    Purchase_Order.Purchase_Order = Delivery_Detail.Purchase_Ord' +
        'er) ON'
      '    (Supplier_Branch.Supplier = Purchase_Order.Supplier) AND'
      '    (Supplier_Branch.Branch_no = Purchase_Order.Branch_No)) ON'
      
        '    (Purchase_Order.Purchase_Order = Purchase_OrderLine.Purchase' +
        '_Order) AND'
      '    (Purchase_OrderLine.Line = Delivery_Detail.Line) AND'
      
        '    (Purchase_OrderLine.Purchase_Order = Delivery_Detail.Purchas' +
        'e_Order)) ON'
      '    Supplier.Supplier = Purchase_Order.Supplier) ON'
      
        '    (Customer_Branch.Branch_no = Purchase_OrderLine.Branch_no) A' +
        'ND'
      '    (Customer_Branch.Customer = Purchase_OrderLine.Customer)) ON'
      '    Price_Unit.Price_Unit = Purchase_OrderLine.Sell_Unit'
      'WHERE'
      '('
      '((Delivery_Detail.Delivery_to_Stock)='#39'Y'#39')) OR'
      
        '(((round([Purchase_OrderLine].[Purchase_Order],0))=[Purchase_Ord' +
        'erLine].[Original_Order])'
      ')'
      'order by Customer.Name')
    Left = 360
    Top = 248
    object qryReportPurchase_Order: TFloatField
      FieldName = 'Purchase_Order'
    end
    object qryReportLine: TIntegerField
      FieldName = 'Line'
    end
    object qryReportDelivery_no: TIntegerField
      FieldName = 'Delivery_no'
    end
    object qryReportAd_hoc_Address: TIntegerField
      FieldName = 'Ad_hoc_Address'
    end
    object qryReportSupplier: TIntegerField
      FieldName = 'Supplier'
    end
    object qryReportBranch_no: TIntegerField
      FieldName = 'Branch_no'
    end
    object qryReportRep: TIntegerField
      FieldName = 'Rep'
    end
    object qryReportQty_to_Deliver: TFloatField
      FieldName = 'Qty_to_Deliver'
    end
    object qryReportQty_Delivered: TFloatField
      FieldName = 'Qty_Delivered'
    end
    object qryReportQty_Invoiced: TFloatField
      FieldName = 'Qty_Invoiced'
    end
    object qryReportDate_Point: TDateTimeField
      FieldName = 'Date_Point'
    end
    object qryReportBranch_No0: TIntegerField
      FieldName = 'Branch_No0'
    end
    object qryReportCustomer: TIntegerField
      FieldName = 'Customer'
    end
    object qryReportDeliver_via_Company: TStringField
      FieldName = 'Deliver_via_Company'
      Size = 1
    end
    object qryReportDate_Deliv_Actual: TDateTimeField
      FieldName = 'Date_Deliv_Actual'
    end
    object qryReportDelivery_to_Stock: TStringField
      FieldName = 'Delivery_to_Stock'
      Size = 1
    end
    object qryReportDelivery_note_printed: TStringField
      FieldName = 'Delivery_note_printed'
      Size = 1
    end
    object qryReportOrder_Customer: TIntegerField
      FieldName = 'Order_Customer'
    end
    object qryReportCustomer_Branch: TIntegerField
      FieldName = 'Customer_Branch'
    end
    object qryReportCust_order_no: TStringField
      FieldName = 'Cust_order_no'
      Size = 40
    end
    object qryReportPurch_Ord_Line_Status: TIntegerField
      FieldName = 'Purch_Ord_Line_Status'
    end
    object qryReportSupplier_1: TIntegerField
      FieldName = 'Supplier_1'
    end
    object qryReportSupplier_Branch: TIntegerField
      FieldName = 'Supplier_Branch'
    end
    object qryReportSupplier_Name: TStringField
      FieldName = 'Supplier_Name'
      Size = 40
    end
    object qryReportCustomer_Name: TStringField
      FieldName = 'Customer_Name'
      Size = 40
    end
    object qryReportOrder_Status: TStringField
      FieldName = 'Order_Status'
      Size = 40
    end
    object qryReportQty_In: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Qty_In'
      OnGetText = qryReportQty_InGetText
      Calculated = True
    end
    object qryReportQty_Out: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Qty_Out'
      OnGetText = qryReportQty_OutGetText
      Calculated = True
    end
    object qryReportDeliveryName: TStringField
      FieldKind = fkCalculated
      FieldName = 'DeliveryName'
      Size = 50
      Calculated = True
    end
    object qryReportCustomers_Desc: TStringField
      FieldName = 'Customers_Desc'
      Size = 80
    end
    object qryReportForm_Reference_ID: TStringField
      FieldName = 'Form_Reference_ID'
      Size = 50
    end
    object qryReportPOrder: TStringField
      FieldKind = fkCalculated
      FieldName = 'POrder'
      OnGetText = qryReportPOrderGetText
      Calculated = True
    end
    object qryReportSelling_Price: TCurrencyField
      FieldName = 'Selling_Price'
    end
    object qryReportSell_Unit: TIntegerField
      FieldName = 'Sell_Unit'
    end
    object qryReportSell_Unit_Descr: TStringField
      FieldName = 'Sell_Unit_Descr'
      FixedChar = True
      Size = 80
    end
    object qryReportPrice_Unit_Factor: TFloatField
      FieldName = 'Price_Unit_Factor'
    end
    object qryReportStock_Reference: TStringField
      FieldName = 'Stock_Reference'
      FixedChar = True
      Size = 30
    end
  end
  object dsReport: TDataSource
    AutoEdit = False
    DataSet = qryReport
    Left = 264
    Top = 248
  end
  object DummySQL: TQuery
    SQL.Strings = (
      'SELECT  Delivery_Detail.Purchase_Order,'
      '        Delivery_Detail.Line,'
      '        Delivery_Detail.Delivery_no,'
      '        Delivery_Detail.Ad_hoc_Address,'
      '        Delivery_Detail.Supplier,'
      '        Delivery_Detail.Branch_no,'
      '        Delivery_Detail.Rep,'
      '        Delivery_Detail.Qty_to_Deliver,'
      '        Delivery_Detail.Qty_Delivered,'
      '        Delivery_Detail.Qty_Invoiced,'
      '        Delivery_Detail.Date_Point,'
      '        Delivery_Detail.Branch_No0,'
      '        Delivery_Detail.Customer,'
      '        Delivery_Detail.Deliver_via_Company,'
      '        Delivery_Detail.Date_Deliv_Actual,'
      '        Delivery_Detail.Delivery_to_Stock,'
      '        Delivery_Detail.Delivery_note_printed,'
      '        Purchase_OrderLine.Customer AS Order_Customer,'
      '        Purchase_OrderLine.Branch_no AS Customer_Branch,'
      '        Purchase_OrderLine.Cust_Order_No,'
      '        Purchase_OrderLine.Purch_Ord_Line_Status,'
      '        Purchase_Order.Supplier,'
      '        Purchase_Order.Branch_No AS Supplier_Branch,'
      '        Supplier.Name AS Supplier_Name,'
      '        Customer.Name AS Customer_Name,'
      '        Purch_Ord_Line_Status.Description AS Order_Status,'
      '        Purchase_OrderLine.Customers_Desc,'
      '        Form_Reference.Form_Reference_ID,'
      '        Form_Reference.Stock_Reference,'
      '        Form_Reference.Form_Reference_Descr,'
      '        Purchase_OrderLine.Selling_Price,'
      '        Purchase_OrderLine.Sell_Unit,'
      '        Price_Unit.Description as Sell_Unit_Descr,'
      '        Price_Unit.Price_Unit_Factor,'
      '        Purchase_ORderLine.Order_Price'
      'FROM Price_Unit'
      '  INNER JOIN (Customer_Branch'
      '  INNER JOIN (Supplier'
      '  INNER JOIN ((Purch_Ord_Line_Status'
      '  INNER JOIN (Form_Reference'
      '  RIGHT JOIN (Customer'
      '  INNER JOIN Purchase_OrderLine ON'
      '    Customer.Customer = Purchase_OrderLine.Customer) ON'
      
        '    Form_Reference.Form_Reference = Purchase_OrderLine.Form_Refe' +
        'rence) ON'
      
        '    Purch_Ord_Line_Status.Purch_Ord_Line_Status = Purchase_Order' +
        'Line.Purch_Ord_Line_Status)'
      '  INNER JOIN (Supplier_Branch'
      '  INNER JOIN (Purchase_Order'
      '  INNER JOIN Delivery_Detail ON'
      
        '    Purchase_Order.Purchase_Order = Delivery_Detail.Purchase_Ord' +
        'er) ON'
      '    (Supplier_Branch.Supplier = Purchase_Order.Supplier) AND'
      '    (Supplier_Branch.Branch_no = Purchase_Order.Branch_No)) ON'
      
        '    (Purchase_Order.Purchase_Order = Purchase_OrderLine.Purchase' +
        '_Order) AND'
      '    (Purchase_OrderLine.Line = Delivery_Detail.Line) AND'
      
        '    (Purchase_OrderLine.Purchase_Order = Delivery_Detail.Purchas' +
        'e_Order)) ON'
      '    Supplier.Supplier = Purchase_Order.Supplier) ON'
      
        '    (Customer_Branch.Branch_no = Purchase_OrderLine.Branch_no) A' +
        'ND'
      '    (Customer_Branch.Customer = Purchase_OrderLine.Customer)) ON'
      '    Price_Unit.Price_Unit = Purchase_OrderLine.Sell_Unit'
      'WHERE'
      '('
      '(Delivery_Detail.Delivery_to_Stock = '#39'Y'#39') OR'
      
        '(round(Purchase_OrderLine.Purchase_Order,0)= Purchase_OrderLine.' +
        'Original_Order)'
      ')')
    Left = 448
    Top = 249
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
    Left = 41
    Top = 336
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
    Left = 114
    Top = 336
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
    Left = 187
    Top = 336
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
  object CompSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Company.Name as Company_Name,'
      #9#9#9'Building_no_name,'
      '        Street,'
      '        Locale,'
      '        Town,'
      '        Postcode'
      'from Company'
      'where Company = 1')
    Left = 261
    Top = 336
  end
  object CustomerSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Customer.Name as Customer_Name,'
      #9#9#9'Building_no_name,'
      '        Street,'
      '        Locale,'
      '        Town,'
      '        Postcode'
      'from Customer_Branch, Customer'
      'where ((Customer_Branch.Customer = :Customer) and'
      #9#9#9'(Branch_no = :Branch_no)) and'
      '        Customer_Branch.Customer = Customer.Customer')
    Left = 334
    Top = 336
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
end
