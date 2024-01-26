object PBMaintSalesInvoiceDetailFrm: TPBMaintSalesInvoiceDetailFrm
  Left = 192
  Top = 114
  Caption = 'Sales Invoice Details'
  ClientHeight = 524
  ClientWidth = 1326
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnActivate = FormActivate
  TextHeight = 13
  object pnlBottom: TPanel
    Left = 0
    Top = 483
    Width = 1326
    Height = 41
    Align = alBottom
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      1326
      41)
    object btnExcel: TBitBtn
      Left = 1056
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Excel'
      Enabled = False
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        0800000000000001000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00A407070700FF
        FFFFFFFFFFFF07FFFFFFA407070700FFFFFFFFFFFFFF07FFFFFFA407070700FF
        FFFFFFFFFFFF07FFFFFF00000000000707070707070707070707A407070700FF
        FFFFFFFFFFFF07FFFFFFA407000700FFFFFFFFFFFFFF07FFFFFFA407000700FF
        FFFFFFFFFFFF07FFFFFFA407000700FFFFFFFFFFFFFF07FFFFFFA400000700FF
        FFFFFFFFFFFF07FFFFFFA407070700FFFFFFFFFFFFFF07FFFFFF000000000000
        00000000000000000000A4070707000707070707070700070707A40707070007
        07000700070700070707A4070707000707000000070700070707A40707070007
        07000700070700070707A4A4A4A400A4A4A400A4A4A400A4A4A4}
      TabOrder = 0
      OnClick = btnExcelClick
    end
    object pnlButton: TPanel
      Left = 1221
      Top = 1
      Width = 104
      Height = 39
      Align = alRight
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 1
      object btbtnClose: TBitBtn
        Left = 16
        Top = 8
        Width = 75
        Height = 25
        Kind = bkClose
        NumGlyphs = 2
        TabOrder = 0
        OnClick = btbtnCloseClick
      end
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 1326
    Height = 483
    Align = alClient
    DataSource = dtsSIAllDetails
    DrawingStyle = gdsGradient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'Sales_Order'
        Title.Caption = 'Sales Order'
        Width = 69
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'date_ordered'
        Title.Caption = 'Order Date'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cust_order_no'
        Title.Caption = 'Order Reference'
        Width = 105
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'part_description'
        Title.Caption = 'Description'
        Width = 216
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'part'
        Title.Caption = 'Product'
        Width = 148
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'quantity_delivered'
        Title.Caption = 'Delivered'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Branch_Name'
        Title.Caption = 'Branch'
        Width = 141
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Short_Code'
        Title.Caption = 'Short Code'
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sell_pack_quantity'
        Title.Caption = 'Pack Size'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Delivery_Date'
        Title.Caption = 'Date Delivered'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Part_Cost_Cat'
        Title.Caption = 'List Price'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'part_sales_price'
        Title.Caption = 'Unit Price'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DeliveryLocation'
        Title.Caption = 'Delivery Location'
        Width = 138
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cost_centre'
        Title.Caption = 'Cost Centre'
        Width = 100
        Visible = True
      end>
  end
  object qrySIAllDetails: TFDQuery
    OnCalcFields = qrySIAllDetailsCalcFields
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Sales_order.Sales_Order,'
      '  sales_order_line.sales_order_line_no,'
      '  sales_order_line.part,'
      '  sales_order_line.part_cost,'
      '  sales_order_line.Purch_Pack_Quantity,'
      '  sales_order_line.part_sales_price,'
      '  sales_order_line.sell_pack_quantity,'
      '  sales_order_line.quantity_ordered,'
      '  sales_order_line.quantity_delivered,'
      '  sales_order.date_ordered,'
      '  sales_order.cust_order_no,'
      '  sales_order.delivery_customer,'
      '  sales_order.delivery_branch,'
      '  sales_order.ad_hoc_address,'
      '  sales_order.customer,'
      '  sales_order.delivery_customer,'
      '  part.part_description,'
      '  part.Part_Cost_Cat,'
      '  Customer.Name as Customer_Name,'
      '  Customer_Branch.Name as Branch_Name,'
      '  Customer_Branch.Short_Code,'
      '  Customer.name + '#39'/'#39' + Customer_branch.Name as OrderedBy,'
      '  (select Customer.Name'
      '  from Customer'
      
        '  where Customer.Customer = Sales_order.delivery_customer) as De' +
        'liveryCustName,'
      '  (select Customer_Branch.Name'
      '  from Customer_Branch'
      
        '  where Customer_Branch.Customer = Sales_order.delivery_customer' +
        ' and'
      
        '           Customer_Branch.Branch_no = Sales_order.delivery_bran' +
        'ch) as DeliveryBranchName,'
      '  sales_order.date_required,'
      '  sales_order_delivery.Delivery_Date,'
      '  sales_order.cost_centre,'
      '  Vat_Code.Vat_Rate'
      'FROM Vat_Code'
      '      INNER JOIN ((((Customer'
      '      INNER JOIN Customer_Branch'
      '        ON Customer.Customer = Customer_Branch.Customer)'
      '      INNER JOIN Sales_Order'
      
        '        ON (Customer_Branch.Branch_no = Sales_Order.Branch_no) A' +
        'ND (Customer_Branch.Customer = Sales_Order.Customer))'
      '      LEFT JOIN Sales_Order_Delivery'
      
        '        ON Sales_Order.Sales_Order = Sales_Order_Delivery.Sales_' +
        'Order)'
      '      INNER JOIN ((Part'
      '      INNER JOIN Sales_Order_line'
      '        ON Part.Part = Sales_Order_line.Part)'
      '      INNER JOIN Sales_Invoice_Detail'
      
        '        ON (Sales_Order_line.Sales_Order_line_no = Sales_Invoice' +
        '_Detail.Sales_Order_Line_no) AND (Sales_Order_line.Sales_Order =' +
        ' Sales_Invoice_Detail.Sales_Order))'
      
        '        ON Sales_Order.Sales_Order = Sales_Order_line.Sales_Orde' +
        'r)'
      '        ON Vat_Code.Vat_Code = Sales_Order_line.vat_code'
      'WHERE Sales_invoice = :Sales_Invoice'
      
        'ORDER BY Sales_Invoice_Detail.Sales_Order, SAles_Invoice_Detail.' +
        'Sales_Order_line_no')
    Left = 152
    Top = 80
    ParamData = <
      item
        Name = 'Sales_Invoice'
        DataType = ftInteger
      end>
    object qrySIAllDetailsSales_Order: TIntegerField
      FieldName = 'Sales_Order'
    end
    object qrySIAllDetailssales_order_line_no: TIntegerField
      FieldName = 'sales_order_line_no'
    end
    object qrySIAllDetailspart: TStringField
      FieldName = 'part'
      FixedChar = True
      Size = 50
    end
    object qrySIAllDetailspart_cost: TCurrencyField
      FieldName = 'part_cost'
    end
    object qrySIAllDetailsPurch_Pack_Quantity: TIntegerField
      FieldName = 'Purch_Pack_Quantity'
    end
    object qrySIAllDetailspart_sales_price: TCurrencyField
      FieldName = 'part_sales_price'
    end
    object qrySIAllDetailssell_pack_quantity: TIntegerField
      FieldName = 'sell_pack_quantity'
    end
    object qrySIAllDetailsquantity_ordered: TIntegerField
      FieldName = 'quantity_ordered'
    end
    object qrySIAllDetailsquantity_delivered: TIntegerField
      FieldName = 'quantity_delivered'
    end
    object qrySIAllDetailsdate_ordered: TDateTimeField
      FieldName = 'date_ordered'
    end
    object qrySIAllDetailscust_order_no: TStringField
      FieldName = 'cust_order_no'
      FixedChar = True
      Size = 80
    end
    object qrySIAllDetailsdelivery_customer: TIntegerField
      FieldName = 'delivery_customer'
    end
    object qrySIAllDetailsdelivery_branch: TIntegerField
      FieldName = 'delivery_branch'
    end
    object qrySIAllDetailsad_hoc_address: TIntegerField
      FieldName = 'ad_hoc_address'
    end
    object qrySIAllDetailscustomer: TIntegerField
      FieldName = 'customer'
    end
    object qrySIAllDetailsdelivery_customer_1: TIntegerField
      FieldName = 'delivery_customer_1'
    end
    object qrySIAllDetailspart_description: TStringField
      FieldName = 'part_description'
      FixedChar = True
      Size = 120
    end
    object qrySIAllDetailsPart_Cost_Cat: TCurrencyField
      FieldName = 'Part_Cost_Cat'
    end
    object qrySIAllDetailsCustomer_Name: TStringField
      FieldName = 'Customer_Name'
      FixedChar = True
      Size = 92
    end
    object qrySIAllDetailsBranch_Name: TStringField
      FieldName = 'Branch_Name'
      FixedChar = True
      Size = 100
    end
    object qrySIAllDetailsShort_Code: TStringField
      FieldName = 'Short_Code'
      FixedChar = True
    end
    object qrySIAllDetailsOrderedBy: TStringField
      FieldName = 'OrderedBy'
      FixedChar = True
      Size = 194
    end
    object qrySIAllDetailsDeliveryCustName: TStringField
      FieldName = 'DeliveryCustName'
      FixedChar = True
      Size = 92
    end
    object qrySIAllDetailsDeliveryBranchName: TStringField
      FieldName = 'DeliveryBranchName'
      FixedChar = True
      Size = 100
    end
    object qrySIAllDetailsdate_required: TDateTimeField
      FieldName = 'date_required'
    end
    object qrySIAllDetailsDelivery_Date: TDateTimeField
      FieldName = 'Delivery_Date'
    end
    object qrySIAllDetailscost_centre: TStringField
      FieldName = 'cost_centre'
      FixedChar = True
    end
    object qrySIAllDetailsVat_Rate: TFloatField
      FieldName = 'Vat_Rate'
    end
    object qrySIAllDetailsDeliveryLocation: TStringField
      FieldKind = fkCalculated
      FieldName = 'DeliveryLocation'
      Size = 50
      Calculated = True
    end
    object qrySIAllDetailsSalesValue: TFloatField
      FieldKind = fkCalculated
      FieldName = 'SalesValue'
      Calculated = True
    end
  end
  object dtsSIAllDetails: TDataSource
    DataSet = qrySIAllDetails
    Left = 232
    Top = 80
  end
  object qryAdhoc: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Name'
      'from Ad_hoc_address'
      'where ad_hoc_address = :ad_hoc_address')
    Left = 352
    Top = 89
    ParamData = <
      item
        Name = 'ad_hoc_address'
      end>
  end
end
