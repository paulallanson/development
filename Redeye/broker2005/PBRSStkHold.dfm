object PBRSStkHoldFrm: TPBRSStkHoldFrm
  Left = 164
  Top = 185
  BorderStyle = bsDialog
  Caption = 'Stock Holding Report'
  ClientHeight = 156
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
    Top = 8
    Width = 121
    Height = 73
    Caption = 'By Customers'
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
    Left = 8
    Top = 120
    Width = 75
    Height = 25
    Caption = '&Cancel'
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 2
  end
  object PreviewBitBtn: TBitBtn
    Left = 256
    Top = 120
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
    Left = 336
    Top = 120
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
  object chkbxExcludezero: TCheckBox
    Left = 8
    Top = 88
    Width = 177
    Height = 17
    Caption = 'Exclude zero stock items'
    TabOrder = 5
  end
  object qryReport: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select '#9'delivery_location.description, '
      #9'delivery_location.quantity, '
      #9'delivery_location.quantity_allocated,'
      #9'delivery_detail.delivery_to_Stock,'
      #9'Purchase_orderline.Form_reference,'
      #9'Form_reference.form_reference_id,'
      #9'Form_reference.form_reference_descr,'
      '                Form_Reference.Stock_Reference,'
      #9'Purchase_orderline.Purchase_order,'
      #9'delivery_detail.stock_location_desc,'
      '                Purchase_orderline.Forms_per_Box,'
      '                Purchase_orderline.Cust_Order_no,'
      '                Form_reference.customer,'
      '                Form_reference.branch_no,'
      
        #9'(delivery_location.quantity - delivery_location.quantity_alloca' +
        'ted) as Qty_in_stock'
      
        'from delivery_location, delivery_detail, Purchase_orderline, for' +
        'm_reference'
      'where'
      '('
      
        '(Delivery_location.purchase_order = Delivery_Detail.purchase_ord' +
        'er) and'
      '(Delivery_location.Line = Delivery_Detail.Line) and'
      '(Delivery_location.delivery_no = Delivery_Detail.delivery_no)'
      ') and'
      '(Delivery_Detail.delivery_to_Stock = '#39'Y'#39') and'
      '('
      
        '(Delivery_location.purchase_order = Purchase_orderline.purchase_' +
        'order) and'
      '(Delivery_location.Line = Purchase_orderline.Line)'
      ') and'
      
        '(Purchase_orderline.form_reference = Form_reference.form_referen' +
        'ce)')
    Left = 272
    Top = 64
    object qryReportDescription: TWideStringField
      FieldName = 'description'
      FixedChar = True
      Size = 40
    end
    object qryReportquantity: TIntegerField
      FieldName = 'quantity'
    end
    object qryReportquantity_allocated: TIntegerField
      FieldName = 'quantity_allocated'
    end
    object qryReportdelivery_to_Stock: TWideStringField
      FieldName = 'delivery_to_Stock'
      FixedChar = True
      Size = 2
    end
    object qryReportForm_reference: TIntegerField
      FieldName = 'Form_reference'
    end
    object qryReportform_reference_id: TWideStringField
      FieldName = 'form_reference_id'
      FixedChar = True
      Size = 100
    end
    object qryReportform_reference_descr: TWideStringField
      FieldName = 'form_reference_descr'
      FixedChar = True
      Size = 100
    end
    object qryReportPurchase_order: TFloatField
      FieldName = 'Purchase_order'
    end
    object qryReportstock_location_desc: TWideStringField
      FieldName = 'stock_location_desc'
      FixedChar = True
      Size = 80
    end
    object qryReportForms_per_Box: TWideStringField
      FieldName = 'Forms_per_Box'
      FixedChar = True
      Size = 40
    end
    object qryReportCust_Order_no: TWideStringField
      FieldName = 'Cust_Order_no'
      FixedChar = True
      Size = 50
    end
    object qryReportcustomer: TIntegerField
      FieldName = 'customer'
    end
    object qryReportbranch_no: TIntegerField
      FieldName = 'branch_no'
    end
    object qryReportQty_in_stock: TIntegerField
      FieldName = 'Qty_in_stock'
    end
  end
  object dsReport: TDataSource
    AutoEdit = False
    DataSet = qryReport
    Left = 48
    Top = 32
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
    Left = 94
    Top = 16
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end>
  end
  object DummySQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select '#9'delivery_location.description, '
      #9'delivery_location.quantity, '
      #9'delivery_location.quantity_allocated,'
      #9'delivery_detail.delivery_to_Stock,'
      #9'Purchase_orderline.Form_reference,'
      #9'Form_reference.form_reference_id,'
      #9'Form_reference.form_reference_descr,'
      '                Form_Reference.Stock_Reference,'
      #9'Purchase_orderline.Purchase_order,'
      #9'delivery_detail.stock_location_desc,'
      '                Purchase_orderline.Forms_per_Box,'
      '                Purchase_orderline.Cust_Order_no,'
      '                Form_reference.customer,'
      '                Form_reference.branch_no,'
      
        #9'(delivery_location.quantity - delivery_location.quantity_alloca' +
        'ted) as Qty_in_stock'
      
        'from delivery_location, delivery_detail, Purchase_orderline, for' +
        'm_reference'
      'where'
      '('
      
        '(Delivery_location.purchase_order = Delivery_Detail.purchase_ord' +
        'er) and'
      '(Delivery_location.Line = Delivery_Detail.Line) and'
      '(Delivery_location.delivery_no = Delivery_Detail.delivery_no)'
      ') and'
      '(Delivery_Detail.delivery_to_Stock = '#39'Y'#39') and'
      '(Delivery_Detail.Qty_Delivered <> 0) and'
      '('
      
        '(Delivery_location.purchase_order = Purchase_orderline.purchase_' +
        'order) and'
      '(Delivery_location.Line = Purchase_orderline.Line)'
      ') and'
      
        '(Purchase_orderline.form_reference = Form_reference.form_referen' +
        'ce)')
    Left = 344
    Top = 64
  end
end
