object PBRSStkValFrm: TPBRSStkValFrm
  Left = 164
  Top = 185
  BorderStyle = bsDialog
  Caption = 'Stock Valuation Report'
  ClientHeight = 261
  ClientWidth = 431
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  TextHeight = 13
  object rgCustomer: TRadioGroup
    Left = 8
    Top = 88
    Width = 121
    Height = 73
    Caption = 'By Customer'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      'All Customers'
      'One Customer')
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    OnClick = rgCustomerClick
  end
  object CustomerPanel: TPanel
    Left = 139
    Top = 96
    Width = 281
    Height = 49
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
    Visible = False
    object lblCustomer: TLabel
      Left = 8
      Top = 4
      Width = 88
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
  object CancelBitBtn: TBitBtn
    Left = 16
    Top = 224
    Width = 75
    Height = 25
    Caption = '&Cancel'
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 2
  end
  object PreviewBitBtn: TBitBtn
    Left = 264
    Top = 224
    Width = 75
    Height = 25
    Caption = 'Pre&view'
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
    TabOrder = 3
    OnClick = PreviewBitBtnClick
  end
  object PrintBitBtn: TBitBtn
    Left = 344
    Top = 224
    Width = 75
    Height = 25
    Caption = '&Print'
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
    TabOrder = 4
    OnClick = PrintBitBtnClick
  end
  object RepRadioGroup: TRadioGroup
    Left = 8
    Top = 8
    Width = 121
    Height = 73
    Caption = 'By Rep'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      'All Reps'
      'One Rep')
    ParentBackground = False
    ParentFont = False
    TabOrder = 5
    OnClick = RepRadioGroupClick
  end
  object RepPanel: TPanel
    Left = 139
    Top = 16
    Width = 281
    Height = 49
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 6
    Visible = False
    object Label1: TLabel
      Left = 8
      Top = 4
      Width = 20
      Height = 13
      Caption = 'Rep'
    end
    object RepEdit: TEdit
      Left = 8
      Top = 20
      Width = 233
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object RepButton: TButton
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
      OnClick = RepButtonClick
    end
  end
  object OrdValChkBox: TCheckBox
    Left = 16
    Top = 168
    Width = 181
    Height = 17
    Caption = 'Exclude Order Value'
    TabOrder = 7
  end
  object chkbxCustomerVal: TCheckBox
    Left = 16
    Top = 192
    Width = 185
    Height = 17
    Caption = 'Customer valuation'
    TabOrder = 8
  end
  object qryReport: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'SELECT Purchase_OrderLine.Order_Price, Purchase_OrderLine.Sellin' +
        'g_Price, Purchase_OrderLine.Qty_In_Stock,'
      
        '  Purchase_OrderLine.Order_Unit, Form_Reference.Form_Reference_D' +
        'escr, Form_Reference.Reorder_Level,'
      
        '  Customer.Name AS Customer_Name, Form_Reference.Form_Reference_' +
        'ID,'
      '  Price_Unit.Price_Unit_Factor AS Order_Unit_Factor,'
      '  (select Price_Unit_Factor from Price_Unit'
      
        '      where Price_Unit = Purchase_OrderLine.Sell_unit) AS sell_u' +
        'nit_Factor'
      
        'FROM Price_Unit INNER JOIN (Purchase_Order INNER JOIN (Customer_' +
        'Branch'
      '    INNER JOIN (Purch_Ord_Line_Status INNER JOIN (Form_Reference'
      '    RIGHT JOIN (Customer INNER JOIN Purchase_OrderLine'
      '    ON Customer.Customer = Purchase_OrderLine.Customer)'
      
        '    ON Form_Reference.Form_Reference = Purchase_OrderLine.Form_R' +
        'eference)'
      
        '    ON Purch_Ord_Line_Status.Purch_Ord_Line_Status = Purchase_Or' +
        'derLine.Purch_Ord_Line_Status)'
      
        '    ON (Customer_Branch.Branch_no = Purchase_OrderLine.Branch_no' +
        ') AND (Customer_Branch.Customer = Purchase_OrderLine.Customer))'
      
        '    ON Purchase_Order.Purchase_Order = Purchase_OrderLine.Purcha' +
        'se_Order)'
      
        '    ON (Price_Unit.Price_Unit = Purchase_OrderLine.Order_Unit) A' +
        'ND (Price_Unit.Price_Unit = Purchase_OrderLine.Sell_Unit)'
      
        'WHERE (((Purchase_OrderLine.Form_Reference) Is Not Null) AND ((p' +
        'rice_unit.price_unit)=Purchase_OrderLine.Order_Unit))'
      '    and (Purchase_Orderline.Inactive <> '#39'Y'#39')'
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
    Left = 176
    Top = 104
    object qryReportOrder_price: TCurrencyField
      FieldName = 'Order_price'
    end
    object qryReportQty_In_Stock: TFloatField
      FieldName = 'Qty_In_Stock'
    end
    object qryReportOrder_Unit: TIntegerField
      FieldName = 'Order_Unit'
    end
    object qryReportForm_Reference_Descr: TStringField
      FieldName = 'Form_Reference_Descr'
      FixedChar = True
      Size = 100
    end
    object qryReportReorder_Level: TIntegerField
      FieldName = 'Reorder_Level'
    end
    object qryReportCustomer_Name: TWideStringField
      FieldName = 'Customer_Name'
      FixedChar = True
      Size = 80
    end
    object qryReportForm_Reference_ID: TStringField
      FieldName = 'Form_Reference_ID'
      FixedChar = True
      Size = 100
    end
  end
  object dsReport: TDataSource
    AutoEdit = False
    DataSet = qryReport
    Left = 104
    Top = 112
  end
  object CustomerSQL: TFDQuery
    ConnectionName = 'PB'
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
    Left = 142
    Top = 104
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end>
  end
  object oldDummySQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Purchase_OrderLine.Order_Price,'
      '        Purchase_OrderLine.Selling_Price,'
      '        Purchase_OrderLine.Qty_in_Stock,'
      '        Purchase_OrderLine.Order_Unit,'
      '        Form_Reference.Form_Reference_Descr,'
      '        Form_Reference.Reorder_Level,'
      '        Customer.Name AS Customer_Name,'
      '        Form_Reference.Form_Reference_ID,'
      '        Price_Unit.Price_Unit_Factor AS Order_Unit_Factor,'
      '        (select Price_Unit_Factor from Price_Unit'
      
        '          where Price_Unit = Purchase_OrderLine.Sell_unit) AS se' +
        'll_unit_Factor,'
      '        Delivery_Detail.Delivery_to_Stock,'
      '        Purchase_OrderLine.Purchase_Order,'
      '        Purchase_OrderLine.Cust_Order_No,'
      '        Purchase_OrderLine.Customers_Desc,'
      '        Delivery_Detail.Date_Deliv_Actual,'
      '        Rep.Rep,'
      '        Rep.Name'
      'FROM Rep'
      '      INNER JOIN (Purchase_Order'
      '      INNER JOIN ((Customer'
      '      INNER JOIN Customer_Branch ON'
      '        Customer.Customer = Customer_Branch.Customer)'
      '      INNER JOIN ((Price_Unit'
      '      INNER JOIN (Form_Reference'
      '      RIGHT JOIN Purchase_OrderLine ON'
      
        '        Form_Reference.Form_Reference = Purchase_OrderLine.Form_' +
        'Reference) ON'
      '        Price_Unit.Price_Unit = Purchase_OrderLine.Order_Unit)'
      '      INNER JOIN Delivery_Detail ON'
      '        (Purchase_OrderLine.Line = Delivery_Detail.Line) AND'
      
        '        (Purchase_OrderLine.Purchase_Order = Delivery_Detail.Pur' +
        'chase_Order)) ON'
      
        '        (Customer_Branch.Branch_no = Purchase_OrderLine.Branch_n' +
        'o) AND'
      
        '        (Customer_Branch.Customer = Purchase_OrderLine.Customer)' +
        ') ON'
      
        '        Purchase_Order.Purchase_Order = Purchase_OrderLine.Purch' +
        'ase_Order) ON'
      '        Rep.Rep = Purchase_OrderLine.Rep'
      'WHERE'
      '(Purchase_OrderLine.Qty_in_Stock <> 0) AND'
      '(Delivery_Detail.Delivery_to_Stock = '#39'Y'#39') AND'
      '(Purchase_OrderLine.Form_Reference Is Not Null) AND'
      '(Purchase_OrderLine.Inactive <> '#39'Y'#39') AND'
      '(Form_Reference.Stocked_Item = '#39'Y'#39')')
    Left = 352
    Top = 56
  end
  object DummySQL: TFDQuery
    SQL.Strings = (
      'SELECT '#9'Purchase_OrderLine.Order_Price,'
      #9'Purchase_OrderLine.Selling_Price, '
      #9'Purchase_OrderLine.Qty_in_Stock, '
      '                Purchase_OrderLine.Quantity,'
      #9'Purchase_OrderLine.Order_Unit,'
      '  Purchase_OrderLine.Purch_Ord_Line_Status,'
      '  Purchase_OrderLine.Invoice_Upfront,'
      #9'Form_Reference.Form_Reference_Descr,'
      '                Form_Reference.Stock_Reference, '
      #9'Form_Reference.Reorder_Level, '
      #9'Customer.Name AS Customer_Name, '
      #9'Form_Reference.Form_Reference_ID,'
      #9'Price_Unit.Price_Unit_Factor AS Order_Unit_Factor,'
      #9'(select Price_Unit_Factor from Price_Unit'
      
        '          where Price_Unit = Purchase_OrderLine.Sell_unit) AS se' +
        'll_unit_Factor, '
      #9'Purchase_OrderLine.Purchase_Order, '
      #9'Purchase_OrderLine.Cust_Order_No, '
      #9'Purchase_OrderLine.Customers_Desc, '
      #9'Rep.Rep, '
      #9'Rep.Name,'
      '                Purchase_Order.Date_Point'
      'FROM Rep '
      #9'INNER JOIN (Purchase_Order '
      #9'INNER JOIN ((Customer '
      #9'INNER JOIN Customer_Branch ON '
      #9#9'Customer.Customer = Customer_Branch.Customer) '
      #9'INNER JOIN (Price_Unit '
      #9'INNER JOIN (Form_Reference '
      #9'RIGHT JOIN Purchase_OrderLine ON '
      
        #9#9'Form_Reference.Form_Reference = Purchase_OrderLine.Form_Refere' +
        'nce) ON '
      #9#9'Price_Unit.Price_Unit = Purchase_OrderLine.Order_Unit) ON '
      
        #9#9'(Customer_Branch.Branch_no = Purchase_OrderLine.Branch_no) AND' +
        ' '
      #9#9'(Customer_Branch.Customer = Purchase_OrderLine.Customer)) ON '
      
        #9#9'Purchase_Order.Purchase_Order = Purchase_OrderLine.Purchase_Or' +
        'der) ON '
      #9#9'Rep.Rep = Purchase_OrderLine.Rep'
      'WHERE '
      '(Purchase_OrderLine.Qty_in_Stock<>0) AND '
      '(Purchase_OrderLine.Form_Reference Is Not Null) AND '
      '(Purchase_OrderLine.Inactive <>'#39'Y'#39')'
      ' '
      ' '
      ' ')
    Left = 216
    Top = 96
  end
end
