object dtmdlDeliveries: TdtmdlDeliveries
  OldCreateOrder = False
  Left = 39
  Top = 60
  Height = 505
  Width = 720
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
    Left = 25
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Ad_hoc_Address'
        ParamType = ptUnknown
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
    Left = 98
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Rep'
        ParamType = ptUnknown
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
    Left = 171
    Top = 32
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
  object CompSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Company.Name as Company_Name,'
      #9#9#9'Building_no_name,'
      '        Street,'
      '        Locale,'
      '        Town,'
      '        Postcode'
      'from Company'
      'where Company = 1')
    Left = 245
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
    Left = 318
    Top = 32
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
  object qryPODetails: TFDQuery
    OnCalcFields = qryPODetailsCalcFields
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT TOP 500'
      '  Delivery_Detail.Purchase_Order,'
      '  Delivery_Detail.Line,'
      '  Delivery_Detail.Delivery_no,'
      '  Delivery_Detail.Ad_hoc_Address,'
      '  Delivery_Detail.Supplier,'
      '  Delivery_Detail.Branch_no,'
      '  Delivery_Detail.Rep,'
      '  Delivery_Detail.Qty_to_Deliver,'
      '  Delivery_Detail.Qty_Delivered,'
      '  Delivery_Detail.Qty_Invoiced,'
      '  Delivery_Detail.Date_Point,'
      '  Delivery_Detail.Goods_reqd_by_Customer,'
      '  Delivery_Detail.Branch_No0,'
      '  Delivery_Detail.Customer,'
      '  Delivery_Detail.No_Of_Boxes,'
      '  Delivery_Detail.Delivery_Instructions,'
      '  Delivery_Detail.Deliver_via_Company,'
      '  Delivery_Detail.Date_Deliv_Actual,'
      '  Delivery_Detail.Delivery_to_Stock,'
      '  Delivery_Detail.Delivery_note_printed,'
      '  Delivery_Detail.contact_name,'
      '  Delivery_Detail.Company_Branch,'
      '  Delivery_Detail.Courier,'
      '  Delivery_Detail.Service_no,'
      '  Delivery_Detail.Package_Type,'
      '  Delivery_Detail.Delivery_Weight_Kilos,'
      '  Purchase_OrderLine.Suppliers_Desc,'
      '  Purchase_OrderLine.Customer AS Order_Customer,'
      '  Purchase_OrderLine.Branch_no AS Customer_Branch,'
      '  Purchase_OrderLine.Forms_Per_Box,'
      '  Purchase_OrderLine.No_of_sets,'
      '  Purchase_OrderLine.Cust_Order_No,'
      '  Purchase_OrderLine.Purch_Ord_Line_Status,'
      '  Purchase_OrderLine.Quantity AS Orig_Ord_Qty,'
      '  Purchase_Order.Supplier,'
      '  Purchase_Order.Branch_No AS Supplier_Branch,'
      '  Supplier.Name AS Supplier_Name,'
      '  Supplier.Courier AS Supplier_Courier,'
      '  Customer.Name AS Customer_Name,'
      '  Purch_Ord_Line_Status.Description AS Order_Status,'
      '  Purchase_OrderLine.Form_Reference,'
      '  Purchase_OrderLine.Original_Order,'
      '  Purchase_OrderLine.Original_Orderline,'
      '  Purchase_OrderLine.Number_Instructions,'
      '  Purchase_OrderLine.Order_Price,'
      '  Purchase_OrderLine.Order_Unit,'
      '  Price_Unit.Description as Price_unit_description,'
      '  Price_Unit.Price_Unit_Factor,'
      '  Purchase_orderLine.Invoice_upfront,'
      '  Purchase_orderLine.Ready_to_Invoice,'
      '  customer_contact.name as order_contact_name'
      'FROM (Price_Unit'
      '  INNER JOIN (Customer_Branch'
      '  INNER JOIN (Supplier'
      '  INNER JOIN ((Purch_Ord_Line_Status'
      '  INNER JOIN (Customer'
      '  INNER JOIN Purchase_OrderLine ON'
      '    Customer.Customer = Purchase_OrderLine.Customer) ON'
      
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
      '    (Price_Unit.Price_Unit = Purchase_OrderLine.Order_Unit))'
      
        '  left join customer_contact on ((Purchase_OrderLine.Branch_no =' +
        ' customer_contact.Branch_no) AND'
      
        '    (Purchase_OrderLine.Customer = customer_contact.Customer) AN' +
        'D'
      
        '    (Purchase_OrderLine.contact_no = customer_contact.contact_no' +
        '))'
      
        'WHERE (Delivery_Detail.Purchase_order = :Purchase_order) or (:Pu' +
        'rchase_Order = 0)'
      'ORDER BY Delivery_Detail.Date_Point desc'
      ' ')
    Left = 24
    Top = 96
    ParamData = <
      item
        DataType = ftFloat
        Name = 'Purchase_order'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end>
    object qryPODetailsPurchase_Order: TFloatField
      FieldName = 'Purchase_Order'
    end
    object qryPODetailsLine: TIntegerField
      FieldName = 'Line'
    end
    object qryPODetailsDelivery_no: TIntegerField
      FieldName = 'Delivery_no'
    end
    object qryPODetailsAd_hoc_Address: TIntegerField
      FieldName = 'Ad_hoc_Address'
    end
    object qryPODetailsSupplier: TIntegerField
      FieldName = 'Supplier'
    end
    object qryPODetailsBranch_no: TIntegerField
      FieldName = 'Branch_no'
    end
    object qryPODetailsRep: TIntegerField
      FieldName = 'Rep'
    end
    object qryPODetailsQty_to_Deliver: TFloatField
      FieldName = 'Qty_to_Deliver'
    end
    object qryPODetailsQty_Delivered: TFloatField
      FieldName = 'Qty_Delivered'
    end
    object qryPODetailsQty_Invoiced: TFloatField
      FieldName = 'Qty_Invoiced'
    end
    object qryPODetailsDate_Point: TDateTimeField
      FieldName = 'Date_Point'
    end
    object qryPODetailsBranch_No0: TIntegerField
      FieldName = 'Branch_No0'
    end
    object qryPODetailsCustomer: TIntegerField
      FieldName = 'Customer'
    end
    object qryPODetailsNo_Of_Boxes: TIntegerField
      FieldName = 'No_Of_Boxes'
    end
    object qryPODetailsDelivery_Instructions: TStringField
      FieldName = 'Delivery_Instructions'
      FixedChar = True
      Size = 255
    end
    object qryPODetailsDeliver_via_Company: TStringField
      FieldName = 'Deliver_via_Company'
      FixedChar = True
      Size = 1
    end
    object qryPODetailsDate_Deliv_Actual: TDateTimeField
      FieldName = 'Date_Deliv_Actual'
    end
    object qryPODetailsDelivery_to_Stock: TStringField
      FieldName = 'Delivery_to_Stock'
      FixedChar = True
      Size = 2
    end
    object qryPODetailsDelivery_note_printed: TStringField
      FieldName = 'Delivery_note_printed'
      FixedChar = True
      Size = 2
    end
    object qryPODetailsSuppliers_Desc: TStringField
      FieldName = 'Suppliers_Desc'
      FixedChar = True
      Size = 80
    end
    object qryPODetailsOrder_Customer: TIntegerField
      FieldName = 'Order_Customer'
    end
    object qryPODetailsCustomer_Branch: TIntegerField
      FieldName = 'Customer_Branch'
    end
    object qryPODetailsForms_Per_Box: TStringField
      FieldName = 'Forms_Per_Box'
      FixedChar = True
      Size = 40
    end
    object qryPODetailsNo_of_Sets: TStringField
      FieldName = 'No_of_Sets'
      FixedChar = True
    end
    object qryPODetailsCust_order_no: TStringField
      FieldName = 'Cust_order_no'
      FixedChar = True
      Size = 50
    end
    object qryPODetailsPurch_Ord_Line_Status: TIntegerField
      FieldName = 'Purch_Ord_Line_Status'
    end
    object qryPODetailsOrig_Ord_Qty: TFloatField
      FieldName = 'Orig_Ord_Qty'
    end
    object qryPODetailsSupplier_1: TIntegerField
      FieldName = 'Supplier_1'
    end
    object qryPODetailsSupplier_Branch: TIntegerField
      FieldName = 'Supplier_Branch'
    end
    object qryPODetailsSupplier_Name: TStringField
      FieldName = 'Supplier_Name'
      FixedChar = True
      Size = 80
    end
    object qryPODetailsCustomer_Name: TStringField
      FieldName = 'Customer_Name'
      FixedChar = True
      Size = 80
    end
    object qryPODetailsOrder_Status: TStringField
      FieldName = 'Order_Status'
      FixedChar = True
      Size = 80
    end
    object qryPODetailsForm_Reference: TIntegerField
      FieldName = 'Form_Reference'
    end
    object qryPODetailsOriginal_Order: TFloatField
      FieldName = 'Original_Order'
    end
    object qryPODetailsOriginal_OrderLine: TFloatField
      FieldName = 'Original_OrderLine'
    end
    object qryPODetailsNumber_Instructions: TStringField
      FieldName = 'Number_Instructions'
      FixedChar = True
      Size = 80
    end
    object qryPODetailsDeliveryName: TStringField
      FieldKind = fkCalculated
      FieldName = 'DeliveryName'
      Size = 50
      Calculated = True
    end
    object qryPODetailsGoods_reqd_by_customer: TDateTimeField
      FieldName = 'Goods_reqd_by_customer'
    end
    object qryPODetailsInvoice_upfront: TStringField
      FieldName = 'Invoice_upfront'
      FixedChar = True
      Size = 2
    end
    object qryPODetailsOrder_Price: TCurrencyField
      FieldName = 'Order_Price'
    end
    object qryPODetailsOrder_Unit: TIntegerField
      FieldName = 'Order_Unit'
    end
    object qryPODetailsPrice_unit_description: TStringField
      FieldName = 'Price_unit_description'
      FixedChar = True
      Size = 80
    end
    object qryPODetailsPrice_Unit_Factor: TFloatField
      FieldName = 'Price_Unit_Factor'
    end
    object qryPODetailsContact_Name: TStringField
      FieldName = 'Contact_Name'
      FixedChar = True
      Size = 60
    end
    object qryPODetailsorder_contact_name: TStringField
      FieldName = 'order_contact_name'
      FixedChar = True
      Size = 80
    end
    object qryPODetailsReady_to_Invoice: TStringField
      FieldName = 'Ready_to_Invoice'
      Size = 1
    end
    object qryPODetailsCompany_Branch: TIntegerField
      FieldName = 'Company_Branch'
    end
    object qryPODetailsCourier: TIntegerField
      FieldName = 'Courier'
    end
    object qryPODetailsService_no: TIntegerField
      FieldName = 'Service_no'
    end
    object qryPODetailsPackage_Type: TIntegerField
      FieldName = 'Package_Type'
    end
    object qryPODetailsSupplier_Courier: TIntegerField
      FieldName = 'Supplier_Courier'
    end
    object qryPODetailsDelivery_Weight_Kilos: TIntegerField
      FieldName = 'Delivery_Weight_Kilos'
    end
  end
  object dtsDetails: TDataSource
    DataSet = qryPODetails
    Left = 95
    Top = 96
  end
  object qrySODetails: TFDQuery
    OnCalcFields = qrySODetailsCalcFields
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Sales_Order_Delivery.*,'
      '        Sales_Order.Cust_Order_No,'
      '        Sales_Order.Delivery_Customer,'
      '        Sales_Order.Delivery_Branch,'
      '        Sales_Order.Ad_hoc_Address,'
      '        Replenish_Source.Replenish_ID,'
      '        Replenish_Source.Replenish_Source_Descr,'
      '        Sales_Order.Supplier,'
      '        Sales_Order.Branch_no0,'
      '        Sales_Order.Date_Required,'
      '        Customer.Name as Customer_Name,'
      '        Customer_Branch.Name as Branch_Name,'
      '        Sales_Order.Sales_Order_Head_Status,'
      '        Sales_order.Replenish_Source,'
      '        Sales_Order.Date_Ordered'
      'FROM Customer'
      '      INNER JOIN (Customer_Branch'
      '      INNER JOIN ((Replenish_Source'
      '      RIGHT JOIN Sales_Order ON'
      
        '        Replenish_Source.Replenish_Source = Sales_Order.Replenis' +
        'h_Source)'
      '      INNER JOIN Sales_Order_Delivery ON'
      
        '        Sales_Order.Sales_Order = Sales_Order_Delivery.Sales_Ord' +
        'er) ON'
      '        (Customer_Branch.Branch_no = Sales_Order.Branch_no) AND'
      '        (Customer_Branch.Customer = Sales_Order.Customer)) ON'
      '        Customer.Customer = Customer_Branch.Customer'
      'WHERE Sales_Order_Delivery.Sales_order = :Sales_order'
      'ORDER BY Sales_Order_Delivery.sales_order_delivery_no'
      ' '
      ' '
      ' ')
    Left = 24
    Top = 152
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Sales_order'
        ParamType = ptUnknown
      end>
    object qrySODetailsSales_Order: TIntegerField
      FieldName = 'Sales_Order'

    end
    object qrySODetailsSales_order_delivery_no: TIntegerField
      FieldName = 'Sales_order_delivery_no'

    end
    object qrySODetailsDelivery_Date: TDateTimeField
      FieldName = 'Delivery_Date'

    end
    object qrySODetailsDespatch_note_No: TStringField
      FieldName = 'Despatch_note_No'

      FixedChar = True
      Size = 40
    end
    object qrySODetailsCust_Order_No: TStringField
      FieldName = 'Cust_Order_No'

      FixedChar = True
      Size = 80
    end
    object qrySODetailsDelivery_Customer: TIntegerField
      FieldName = 'Delivery_Customer'

    end
    object qrySODetailsDelivery_Branch: TIntegerField
      FieldName = 'Delivery_Branch'

    end
    object qrySODetailsAd_hoc_Address: TIntegerField
      FieldName = 'Ad_hoc_Address'

    end
    object qrySODetailsReplenish_ID: TStringField
      FieldName = 'Replenish_ID'

      FixedChar = True
      Size = 2
    end
    object qrySODetailsReplenish_Source_Descr: TStringField
      FieldName = 'Replenish_Source_Descr'

      FixedChar = True
      Size = 40
    end
    object qrySODetailsSupplier: TIntegerField
      FieldName = 'Supplier'

    end
    object qrySODetailsBranch_no0: TIntegerField
      FieldName = 'Branch_no0'

    end
    object qrySODetailsDeliveryName: TStringField
      FieldKind = fkCalculated
      FieldName = 'DeliveryName'
      Size = 50
      Calculated = True
    end
    object qrySODetailsDate_Required: TDateTimeField
      FieldName = 'Date_Required'
    end
    object qrySODetailsCustomer_Name: TStringField
      FieldName = 'Customer_Name'
      FixedChar = True
      Size = 80
    end
    object qrySODetailsSales_Order_Head_Status: TIntegerField
      FieldName = 'Sales_Order_Head_Status'
    end
    object qrySODetailsReplenish_Source: TIntegerField
      FieldName = 'Replenish_Source'
    end
    object qrySODetailsDate_Ordered: TDateTimeField
      FieldName = 'Date_Ordered'
    end
    object qrySODetailsDelivery_Type: TStringField
      FieldName = 'Delivery_Type'
      FixedChar = True
    end
    object qrySODetailsDate_Picked: TDateTimeField
      FieldName = 'Date_Picked'
    end
    object qrySODetailsDelivery_Weight_kilos: TIntegerField
      FieldName = 'Delivery_Weight_kilos'
    end
    object qrySODetailsNo_Of_Boxes: TIntegerField
      FieldName = 'No_Of_Boxes'
    end
    object qrySODetailsDelivery_Instructions: TStringField
      FieldName = 'Delivery_Instructions'
      FixedChar = True
      Size = 255
    end
    object qrySODetailsConsignment_number: TStringField
      FieldName = 'Consignment_number'
      FixedChar = True
      Size = 40
    end
    object qrySODetailsCourier: TIntegerField
      FieldName = 'Courier'
    end
    object qrySODetailsService_no: TIntegerField
      FieldName = 'Service_no'
    end
    object qrySODetailsConfirm_Filename: TStringField
      FieldName = 'Confirm_Filename'
      FixedChar = True
      Size = 40
    end
    object qrySODetailsConfirm_Filename_no: TIntegerField
      FieldName = 'Confirm_Filename_no'
    end
    object qrySODetailsBranch_Name: TStringField
      FieldName = 'Branch_Name'
      FixedChar = True
      Size = 100
    end
  end
  object qryUpDelivDate: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Delivery_Detail'
      'Set'
      '  Date_Deliv_Actual = :Date_Deliv_Actual,'
      '  Qty_Delivered = :Qty_Delivered'
      'Where'
      '  (Purchase_Order = :Purchase_Order) and'
      '  (Line = :Line) and'
      '  (Delivery_No = :Delivery_No)')
    Left = 320
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Date_Deliv_Actual'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Qty_Delivered'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Delivery_No'
        ParamType = ptUnknown
      end>
  end
  object qryUpDelivPrinted: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Delivery_Detail'
      'Set'
      '  Delivery_Note_Printed = '#39'Y'#39
      'Where'
      '  (Purchase_Order = :Purchase_Order) and'
      '  (Line = :Line) and'
      '  (Delivery_No = :Delivery_No)')
    Left = 320
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Delivery_No'
        ParamType = ptUnknown
      end>
  end
  object qryCheckDeliv: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from Delivery_Detail'
      'where Purchase_Order = :Purchase_Order and'
      'Line = :Line')
    Left = 408
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end>
  end
  object qryGetPOLine: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'select Purch_Ord_Line_Status, Original_Order, Original_Orderline' +
        ', Ready_to_Invoice, Invoice_Upfront'
      'from Purchase_orderLine'
      'where Purchase_order = :Purchase_order and'
      'Line = :Line')
    Left = 408
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Purchase_order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end>
  end
  object qryUpPOLine: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Purchase_OrderLine'
      
        'set Purch_Ord_Line_Status = :Purch_Ord_Line_Status, Ready_To_Inv' +
        'oice = :Ready_to_Invoice'
      'where Purchase_Order = :Purchase_Order and'
      'Line = :Line')
    Left = 408
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Purch_Ord_Line_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Ready_to_Invoice'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end>
  end
  object qryGetPOLines: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Purchase_Order, Line, Purch_Ord_line_Status'
      'from Purchase_OrderLine'
      'where Purchase_Order = :Purchase_order')
    Left = 408
    Top = 216
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Purchase_order'
        ParamType = ptUnknown
      end>
  end
  object qryUpPOHead: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Purchase_Order'
      'set Purch_Ord_Head_Status = :Purch_Ord_Head_Status'
      'where Purchase_Order = :Purchase_Order')
    Left = 408
    Top = 280
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Purch_Ord_Head_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end>
  end
  object qryUpDelivery: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Delivery_Detail'
      'Set'
      '  Ad_Hoc_Address = :Ad_Hoc_Address,'
      '  Supplier = :Supplier,'
      '  Branch_No = :Branch_No,'
      '  Rep = :Rep,'
      '  Qty_To_Deliver = :Qty_To_Deliver,'
      '  Qty_Delivered = :Qty_Delivered,'
      '  Qty_Invoiced = :Qty_Invoiced,'
      '  Date_Point = :Date_Point,'
      '  Customer = :Customer,'
      '  Branch_No0 = :Branch_No0,'
      '  Is_Updated = '#39'Y'#39','
      '  No_Of_boxes = :No_Of_boxes,'
      '  Delivery_Instructions = :Instructions,'
      '  Deliver_via_Company = :Deliver_Via_Company,'
      '  Date_Deliv_Actual = :Date_Deliv_Actual,'
      '  Delivery_To_Stock = :Delivery_To_Stock,'
      '  Stock_Location_Desc = :Stock_Location_Desc,'
      '  Goods_reqd_by_customer = :Goods_reqd_by_Customer,'
      '  Contact_Name = :FAO,'
      '  Company_Branch = :Company_Branch,'
      '  Delivery_Weight_Kilos = :Delivery_Weight_Kilos,'
      '  Courier = :Courier,'
      '  Service_no = :Service_no,'
      '  Package_Type = :Package_Type'
      'Where'
      '  (Purchase_Order = :Purchase_Order) and'
      '  (Line = :Line) and'
      '  (Delivery_No = :Delivery_No)'
      ' ')
    Left = 320
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Ad_Hoc_Address'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Branch_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Rep'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Qty_To_Deliver'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Qty_Delivered'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Qty_Invoiced'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_Point'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Branch_No0'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'No_Of_boxes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Instructions'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Deliver_Via_Company'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Date_Deliv_Actual'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Delivery_To_Stock'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Stock_Location_Desc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Goods_reqd_by_Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Company_Branch'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Delivery_Weight_Kilos'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Courier'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Service_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Package_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Delivery_No'
        ParamType = ptUnknown
      end>
  end
  object qryAddDelivLocs: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'insert into Delivery_Location'
      '  (Purchase_Order,'
      '   Line,'
      '   Delivery_no,'
      '   Location_no,'
      '   Description,'
      '   Quantity,'
      '   Quantity_allocated)'
      'values'
      '  (:Purchase_Order,'
      '   :Line,'
      '   :Delivery_no,'
      '   :Location_no,'
      '   :Description,'
      '   :Quantity,'
      '   0)')
    Left = 320
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Delivery_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Location_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quantity'
        ParamType = ptUnknown
      end>
  end
  object qryUpDelivLocs: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update Delivery_Location'
      'set Quantity = :Quantity,'
      'Description = :Description'
      'where Purchase_Order = :Purchase_order and'
      'Line = :Line and'
      'Delivery_no = :Delivery_no and'
      'Location_no = :Location_no')
    Left = 320
    Top = 304
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Delivery_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Location_no'
        ParamType = ptUnknown
      end>
  end
  object qryDelPickLocs: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from Picking_Detail'
      'where'
      'Calloff_Order = :Calloff_Order and'
      'Calloff_Line = :Calloff_Line and'
      'Calloff_Delivery = :Calloff_Delivery')
    Left = 320
    Top = 352
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Calloff_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Calloff_Line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Calloff_Delivery'
        ParamType = ptUnknown
      end>
  end
  object qryUpDelivLocsAlloc: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update Delivery_Location'
      'set Quantity_Allocated = :Quantity_Allocated'
      'where Purchase_Order = :Purchase_order and'
      'Line = :Line and'
      'Delivery_no = :Delivery_no and'
      'Location_no = :Location_no')
    Left = 248
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Quantity_Allocated'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Delivery_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Location_no'
        ParamType = ptUnknown
      end>
  end
  object qryAddPickDtls: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert into Picking_Detail'
      '(Purchase_order,'
      ' Line,'
      ' Delivery_no,'
      ' Location_no,'
      ' Picking_no,'
      ' Calloff_Order,'
      ' Calloff_Line,'
      ' Calloff_Delivery,'
      ' Quantity_Picked)'
      'values'
      '(:Purchase_order,'
      ' :Line,'
      ' :Delivery_no,'
      ' :Location_no,'
      ' :Picking_no,'
      ' :Calloff_Order,'
      ' :Calloff_Line,'
      ' :Calloff_Delivery,'
      ' :Quantity_Picked)')
    Left = 248
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Purchase_order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Delivery_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Location_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Picking_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Calloff_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Calloff_Line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Calloff_Delivery'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quantity_Picked'
        ParamType = ptUnknown
      end>
  end
  object qryGetNextPickNo: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select max(picking_no) as Last_Pick_Number'
      'from Picking_Detail'
      'where'
      'Purchase_Order = :Purchase_Order and'
      'Line = :Line and'
      'Delivery_no = :Delivery_no and'
      'Location_no = :Location_no')
    Left = 248
    Top = 200
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Delivery_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Location_no'
        ParamType = ptUnknown
      end>
  end
  object qryUpPOLineFormRef: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Purchase_OrderLine'
      'set Form_Reference = :Form_Reference'
      'where Purchase_Order = :Purchase_Order and'
      'Line = :Line')
    Left = 408
    Top = 336
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Form_Reference'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end>
  end
  object qryGetStock: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select sum(Qty_Delivered) as Qty_in_Stock'
      'from Delivery_Detail'
      'where '
      '('
      '(Delivery_Detail.Purchase_order = :Purchase_Order) and'
      '(Delivery_Detail.Line = :Line)'
      ') and'
      '(Delivery_Detail.Delivery_to_Stock = '#39'Y'#39') and'
      '('
      '(Delivery_Detail.Date_Deliv_Actual is not null)'
      ')')
    Left = 24
    Top = 200
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end>
  end
  object qryGetCallOff: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select sum(Qty_Delivered) as Qty_Called_off'
      'from Delivery_Detail, Purchase_OrderLine'
      'where'
      '('
      '(Purchase_OrderLine.Original_Order = :Original_Order) and'
      '(Purchase_OrderLine.Original_OrderLine = :Original_Line)'
      ') and'
      '(Purchase_Orderline.inactive <> '#39'Y'#39') and'
      '('
      
        '(Purchase_OrderLine.Purchase_Order = Delivery_Detail.Purchase_Or' +
        'der) and'
      '(Purchase_OrderLine.Line = Delivery_Detail.Line)'
      ') and'
      
        '(round(Purchase_Orderline.Purchase_Order, 0) = :Original_Order) ' +
        'and'
      '('
      '(Delivery_Detail.Date_Deliv_Actual is not null)'
      ')'
      ''
      ' '
      ' ')
    Left = 24
    Top = 256
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Original_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Original_Line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Original_Order'
        ParamType = ptUnknown
      end>
  end
  object qryUpPOStock: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Purchase_OrderLine'
      'set Qty_in_Stock = :Qty_in_Stock'
      'where Purchase_Order = :Purchase_Order and'
      'Line = :Line')
    Left = 24
    Top = 320
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Qty_in_Stock'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end>
  end
  object dtsSODetails: TDataSource
    DataSet = qrySODetails
    Left = 96
    Top = 152
  end
  object qryUpPOLineInvUpfront: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Purchase_OrderLine'
      'set Invoice_upfront = :Invoice_upfront'
      'where Purchase_Order = :Purchase_Order and'
      'Line = :Line')
    Left = 408
    Top = 384
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Invoice_upfront'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Purchase_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end>
  end
end
