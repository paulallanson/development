object PBPODM: TPBPODM
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 780
  Width = 1066
  object CurrSRC: TDataSource
    DataSet = GetCurrSQL
    Left = 256
    Top = 108
  end
  object GetCurrSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Currency_Code_Descr, Currency_Code'
      'From Currency_Code'
      'Order by Currency_Code_Descr')
    Left = 256
    Top = 156
  end
  object InvMethSRC: TDataSource
    DataSet = GetInvMethSQL
    Left = 248
    Top = 15
  end
  object GetInvMethSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select *'
      'From Purch_Ord_Inv_Method'
      'Order By Description')
    Left = 248
    Top = 60
  end
  object GetSuppAddrSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'Select   Supplier.Name as Name, Supplier_Branch.Name as Branch_N' +
        'ame ,'
      '         Supplier_Branch.Building_No_Name,'
      '         Supplier_Branch.Street,'
      '         Supplier_Branch.Locale,'
      '         Supplier_Branch.PostCode,'
      '         Supplier_Branch.Town,'
      '         Supplier_Branch.County,'
      '         Supplier_Branch.Phone,'
      '         Supplier.Supplier, Supplier_Branch.Branch_No'
      'From Supplier_Branch, Supplier'
      'Where (Supplier_Branch.Supplier = :Supplier) and'
      '      (Supplier_Branch.Branch_No = :Branch_No) and'
      '      (Supplier.Supplier = Supplier_Branch.Supplier)')
    Left = 176
    Top = 47
    ParamData = <
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_No'
      end>
  end
  object GetCompAddrSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select   Name,'
      '         Company.Building_No_Name,'
      '         Company.Street,'
      '         Company.Locale,'
      '         Company.PostCode,'
      '         Company.Town,'
      '         '#39#39' as County,'
      '         Company.Phone,'
      '         '#39#39' as Branch_Name,'
      '         Delivery_Narrative'
      'From Company'
      'Where (Company = 1)'
      '')
    Left = 176
    Top = 142
  end
  object GetCustAddrSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'Select   Customer.Name as Name, Customer_Branch.Name as Branch_N' +
        'ame,'
      '         Customer_Branch.Building_No_Name,'
      '         Customer_Branch.Street,'
      '         Customer_Branch.Locale,'
      '         Customer_Branch.PostCode,'
      '         Customer_Branch.Town,'
      '         Customer_Branch.County,'
      '         Customer_Branch.Phone,'
      '         Customer.Customer,'
      '         Customer_Branch.Branch_No,'
      '         Customer_Branch.Delivery_Narrative,'
      '         Customer_Branch.Use_Branch_Name'
      'From Customer_Branch, Customer'
      'Where (Customer_Branch.Customer = :Customer) and'
      '      (Customer_Branch.Branch_No = :Branch_No) and'
      '      (Customer.Customer = Customer_Branch.Customer)'
      ' ')
    Left = 176
    Top = 94
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_No'
      end>
  end
  object GetRepAddrSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select   Name, Building_No_name,'
      '               Street, Locale, Town,'
      '               '#39#39' as County,'
      '               Postcode'
      'From Rep'
      'Where (Rep = :Rep)'
      '')
    Left = 176
    Top = 198
    ParamData = <
      item
        Name = 'Rep'
      end>
  end
  object AddrSRC: TDataSource
    Left = 176
    Top = 248
  end
  object GetAddHocAddrSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select   Name, Building_No_name,'
      '               Street, Locale, Town,'
      '               '#39#39' as County,'
      '               Postcode,'
      '               Delivery_Narrative'
      'From Ad_Hoc_Address'
      'Where (Ad_Hoc_Address = :Ad_Hoc_Address)'
      '')
    Left = 176
    Top = 2
    ParamData = <
      item
        Name = 'Ad_Hoc_Address'
      end>
  end
  object UpdSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Purchase_Order'
      'Set'
      'Supplier = :Supplier,'
      'Branch_No = :Branch_No,'
      'Date_Point = :Date_Point,'
      'Contact_No = :Contact_No,'
      'Purch_Ord_Inv_Method = :Purch_Ord_Inv_Method,'
      'Purch_Ord_Head_Status = :Purch_Ord_Head_Status,'
      'Currency_Code = :Currency_Code,'
      'Office_Contact = :Office_Contact,'
      'Account_Team = :Account_Team,'
      'Authorised_By = :Authorised_By,'
      'Needs_Authorising = :Needs_Authorising,'
      'Authorised_Reason = :Authorised_Reason'
      'Where'
      'Purchase_Order = :Purchase_Order'
      '')
    Left = 104
    Top = 208
    ParamData = <
      item
        Name = 'Supplier'
        DataType = ftInteger
      end
      item
        Name = 'Branch_No'
        DataType = ftInteger
      end
      item
        Name = 'Date_Point'
        DataType = ftDateTime
      end
      item
        Name = 'Contact_No'
        DataType = ftInteger
      end
      item
        Name = 'Purch_Ord_Inv_Method'
        DataType = ftString
      end
      item
        Name = 'Purch_Ord_Head_Status'
        DataType = ftInteger
      end
      item
        Name = 'Currency_Code'
        DataType = ftInteger
      end
      item
        Name = 'Office_Contact'
        DataType = ftInteger
      end
      item
        Name = 'Account_Team'
      end
      item
        Name = 'Authorised_By'
        DataType = ftInteger
      end
      item
        Name = 'Needs_Authorising'
      end
      item
        Name = 'Authorised_Reason'
        DataType = ftInteger
      end
      item
        Name = 'Purchase_Order'
        DataType = ftInteger
      end>
  end
  object DelSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Purchase_Order'
      'Where'
      '(Purchase_Order = :Purchase_Order)')
    Left = 104
    Top = 160
    ParamData = <
      item
        Name = 'Purchase_Order'
      end>
  end
  object UpdPOLinesSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Purchase_OrderLine'
      'Set Is_Updated = '#39'N'#39
      'Where (Purchase_Order = :Purchase_Order)')
    Left = 712
    Top = 112
    ParamData = <
      item
        Name = 'Purchase_Order'
      end>
  end
  object DelPOLineSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Purchase_OrderLine'
      'Where (Purchase_Order = :Purchase_Order) and'
      '       (Line = :Line)'
      '')
    Left = 712
    Top = 64
    ParamData = <
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end>
  end
  object UpdPOLineSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Purchase_OrderLine'
      'Set'
      ' Cust_Order_No = :Cust_Order_No,'
      ' Customer = :Customer,'
      ' Contact_No = :Contact_No,'
      ' Branch_No = :Branch_No,'
      ' Enquiry = :Enquiry,'
      ' Line0 = :Line0,'
      ' Supplier_Reference = :Supplier_Reference,'
      ' Supplier_Job_Ref = :Supplier_Job_Ref,'
      ' Goods_Required = :Goods_Required,'
      ' Purch_Ord_Line_Status = :Purch_Ord_Line_Status,'
      ' Proof_Required = :Proof_Required,'
      ' Proof_Date = :Proof_Date,'
      ' Expected_Life = :Expected_Life,'
      ' Vat_Code = :Vat_Code,'
      ' Suppliers_Desc = :Suppliers_Desc,'
      ' Customers_Desc = :Customers_Desc,'
      ' Quantity = :Quantity,'
      ' Order_Price = :Order_Price,'
      ' Selling_Price = :Selling_Price,'
      ' List_Price = :List_Price,'
      ' Product_Type = :Product_Type,'
      ' Printed_PO = :Printed_PO,'
      ' Is_Updated = '#39'Y'#39'  ,'
      ' Order_Unit = :Order_Unit,'
      ' Sell_Unit = :Sell_Unit,'
      ' Supp_Inv_Recd = :Supp_Inv_Recd,'
      ' Rep = :Rep,'
      ' Narrative = :Narrative,'
      ' Form_Reference = :Form_Reference,'
      ' Forms_per_Box = :Forms_per_box,'
      ' NCR_OTC_Mix = :NCR_OTC_Mix,'
      ' Depth = :Depth, Depth_Unit = :Depth_Unit,'
      ' Width = :Width, Width_Unit = :Width_Unit,'
      ' Artwork_Instructions = :Artwork_Instructions,'
      ' No_Of_Plates = :No_Of_Plates,'
      ' Number_Instructions = :Number_Instructions,'
      ' Original_Order = :Original_Order,'
      ' Original_OrderLine = :Original_Orderline,'
      ' On_Hold = :On_Hold,'
      ' No_of_Sets = :No_of_Sets,'
      ' No_of_Calloffs = :No_of_Calloffs,'
      ' Inactive = :Inactive,'
      ' Inactive_Reason = :Inactive_reason,'
      ' Inactive_Date = :Inactive_date,'
      ' Invoice_Upfront = :Invoice_Upfront,'
      ' Calloff_Invoiced_upfront = :Calloff_Invoiced_upfront,'
      ' Qty_in_Stock = :Qty_in_Stock,'
      ' Goods_Reqd_by_Customer = :Goods_Reqd_by_Customer,'
      ' Job_Type = :Job_Type,'
      ' Description_Reference = :Description_Reference,'
      ' Ready_to_Invoice = :Ready_to_invoice,'
      ' Cash_Sale = :Cash_Sale,'
      ' Cost_Centre = :Cost_Centre,'
      ' FSC_Material_Claim = :FSC_Material_Claim,'
      ' FSC_Mixed_Percentage = :FSC_Mixed_Percentage,'
      ' File_Copies_Received_Date = :File_Copies_Received_Date,'
      ' File_Copies_Received_by = :File_Copies_Received_by,'
      ' Alt_Purchase_Order = :Alt_Purchase_Order'
      'Where (Purchase_Order = :Purchase_Order) and'
      '      (Line = :Line)'
      ' '
      ' ')
    Left = 712
    Top = 160
    ParamData = <
      item
        Name = 'Cust_Order_No'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Customer'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Contact_No'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Branch_No'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Enquiry'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Line0'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Supplier_Reference'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Supplier_Job_Ref'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Goods_Required'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'Purch_Ord_Line_Status'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Proof_Required'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Proof_Date'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'Expected_Life'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Vat_Code'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Suppliers_Desc'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Customers_Desc'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Quantity'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'Order_Price'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'Selling_Price'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'List_Price'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'Product_Type'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Printed_PO'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Order_Unit'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Sell_Unit'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Supp_Inv_Recd'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Rep'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Narrative'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Form_Reference'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Forms_per_box'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'NCR_OTC_Mix'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Depth'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'Depth_Unit'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Width'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'Width_Unit'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Artwork_Instructions'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'No_Of_Plates'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Number_Instructions'
      end
      item
        Name = 'Original_Order'
        DataType = ftFloat
      end
      item
        Name = 'Original_Orderline'
        DataType = ftInteger
      end
      item
        Name = 'On_Hold'
        DataType = ftString
      end
      item
        Name = 'No_of_Sets'
        DataType = ftString
      end
      item
        Name = 'No_of_Calloffs'
        DataType = ftString
      end
      item
        Name = 'Inactive'
        DataType = ftString
      end
      item
        Name = 'Inactive_reason'
        DataType = ftInteger
      end
      item
        Name = 'Inactive_date'
        DataType = ftDateTime
      end
      item
        Name = 'Invoice_Upfront'
        DataType = ftString
      end
      item
        Name = 'Calloff_Invoiced_upfront'
        DataType = ftString
      end
      item
        Name = 'Qty_in_Stock'
      end
      item
        Name = 'Goods_Reqd_by_Customer'
      end
      item
        Name = 'Job_Type'
        DataType = ftInteger
      end
      item
        Name = 'Description_Reference'
      end
      item
        Name = 'Ready_to_invoice'
      end
      item
        Name = 'Cash_Sale'
      end
      item
        Name = 'Cost_Centre'
      end
      item
        Name = 'FSC_Material_Claim'
        DataType = ftInteger
      end
      item
        Name = 'FSC_Mixed_Percentage'
      end
      item
        Name = 'File_Copies_Received_Date'
        DataType = ftDateTime
      end
      item
        Name = 'File_Copies_Received_by'
        DataType = ftInteger
      end
      item
        Name = 'Alt_Purchase_Order'
        DataType = ftString
      end
      item
        Name = 'Purchase_Order'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'Line'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object AddPOLineSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Purchase_OrderLine'
      
        '(Purchase_Order, Line,Cust_Order_No,Customer,Branch_No,Enquiry,L' +
        'ine0,'
      '  Supplier_Reference,Supplier_Job_Ref,Goods_Required,'
      '  Purch_Ord_Line_Status,Proof_Required,Proof_Date,Expected_Life,'
      '  Vat_Code,Suppliers_Desc,Customers_Desc,Quantity,Order_Price,'
      '  Selling_Price,List_Price,Product_Type,Printed_PO, Is_Updated,'
      '  Order_Unit, Sell_Unit, Supp_Inv_Recd, Rep, Stock_Location,'
      '  Narrative, Form_Reference, Forms_per_Box,'
      '  NCR_OTC_Mix, Depth, Depth_Unit, Width, Width_Unit,'
      
        '  Artwork_Instructions, Contact_No, No_Of_Plates, Number_Instruc' +
        'tions,'
      
        '  Original_Order, Original_orderline, On_Hold, No_of_Sets, No_of' +
        '_CallOffs,'
      '  Inactive, Inactive_Reason, Inactive_Date, Invoice_Upfront, '
      
        '  Calloff_Invoiced_upfront, Qty_in_Stock, Goods_reqd_by_Customer' +
        ', Job_Type,'
      
        '  Description_Reference, Ready_to_Invoice, Cash_Sale, Cost_Centr' +
        'e, FSC_Material_Claim, FSC_Mixed_Percentage,'
      
        '  File_Copies_Received_Date, File_Copies_Received_by, Alt_Purcha' +
        'se_Order'
      ')'
      'Values'
      
        '(:Purchase_Order, :Line, :Cust_Order_No, :Customer, :Branch_No, ' +
        ':Enquiry, :Line0,'
      '  :Supplier_Reference, :Supplier_Job_Ref, :Goods_Required,'
      
        '  :Purch_Ord_Line_Status, :Proof_Required, :Proof_Date, :Expecte' +
        'd_Life,'
      
        '  :Vat_Code, :Suppliers_Desc, :Customers_Desc, :Quantity, :Order' +
        '_Price,'
      '  :Selling_Price, :List_Price, :Product_Type, :Printed_PO, '#39'Y'#39','
      '  :Order_Unit, :Sell_Unit, '#39'N'#39', :Rep, Null, :Narrative,'
      '  :Form_Reference, :Forms_per_box,'
      '  :NCR_OTC_Mix, :Depth, :Depth_Unit, :Width, :Width_Unit,'
      
        '  :Artwork_Instructions, :Contact_No, :No_Of_Plates, :Number_Ins' +
        'tructions,'
      
        '  :Original_Order, :Original_orderline, :On_Hold, :No_of_Sets, :' +
        'No_of_CallOffs,'
      
        '  :Inactive, :Inactive_Reason, :Inactive_Date, :Invoice_Upfront,' +
        ' '
      
        '  :Calloff_Invoiced_upfront, :Qty_in_Stock, :Goods_Reqd_by_Custo' +
        'mer, :Job_Type,'
      
        '  :Description_Reference, :Ready_to_Invoice, :Cash_Sale, :Cost_C' +
        'entre, :FSC_Material_Claim, :FSC_Mixed_Percentage,'
      
        '  :File_Copies_Received_Date, :File_Copies_Received_by, :Alt_Pur' +
        'chase_Order)'
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    Left = 712
    Top = 208
    ParamData = <
      item
        Name = 'Purchase_Order'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'Line'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Cust_Order_No'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Customer'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Branch_No'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Enquiry'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Line0'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Supplier_Reference'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Supplier_Job_Ref'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Goods_Required'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'Purch_Ord_Line_Status'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Proof_Required'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Proof_Date'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'Expected_Life'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Vat_Code'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Suppliers_Desc'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Customers_Desc'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Quantity'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'Order_Price'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'Selling_Price'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'List_Price'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'Product_Type'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Printed_PO'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Order_Unit'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Sell_Unit'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Rep'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Narrative'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Form_Reference'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Forms_per_box'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'NCR_OTC_Mix'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Depth'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'Depth_Unit'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Width'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'Width_Unit'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Artwork_Instructions'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Contact_No'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'No_Of_Plates'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Number_Instructions'
      end
      item
        Name = 'Original_Order'
        DataType = ftFloat
      end
      item
        Name = 'Original_orderline'
        DataType = ftInteger
      end
      item
        Name = 'On_Hold'
        DataType = ftString
      end
      item
        Name = 'No_of_Sets'
        DataType = ftString
      end
      item
        Name = 'No_of_CallOffs'
        DataType = ftString
      end
      item
        Name = 'Inactive'
        DataType = ftString
      end
      item
        Name = 'Inactive_Reason'
        DataType = ftInteger
      end
      item
        Name = 'Inactive_Date'
        DataType = ftDateTime
      end
      item
        Name = 'Invoice_Upfront'
        DataType = ftString
      end
      item
        Name = 'Calloff_Invoiced_upfront'
        DataType = ftString
      end
      item
        Name = 'Qty_in_Stock'
      end
      item
        Name = 'Goods_Reqd_by_Customer'
      end
      item
        Name = 'Job_Type'
        DataType = ftInteger
      end
      item
        Name = 'Description_Reference'
      end
      item
        Name = 'Ready_to_Invoice'
      end
      item
        Name = 'Cash_Sale'
      end
      item
        Name = 'Cost_Centre'
      end
      item
        Name = 'FSC_Material_Claim'
        DataType = ftInteger
      end
      item
        Name = 'FSC_Mixed_Percentage'
      end
      item
        Name = 'File_Copies_Received_Date'
        DataType = ftDateTime
      end
      item
        Name = 'File_Copies_Received_by'
        DataType = ftInteger
      end
      item
        Name = 'Alt_Purchase_Order'
        DataType = ftString
      end>
  end
  object GetPOLineSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select *'
      'From Purchase_OrderLine'
      'Where (Purchase_Order = :Purchase_Order) and'
      '      (Line = :Line)'
      '')
    Left = 712
    Top = 16
    ParamData = <
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end>
  end
  object DelPODelivsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Delivery_Detail'
      'Where (Purchase_Order = :Purchase_Order) and'
      '       (Is_Updated = '#39'N'#39')'
      '')
    Left = 37
    Top = 42
    ParamData = <
      item
        Name = 'Purchase_Order'
      end>
  end
  object GetPODelivSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select *'
      'From Delivery_Detail'
      'Where (Purchase_Order = :Purchase_Order) and'
      '      (Line = :Line) and'
      '      (Delivery_No = :Delivery_No)'
      '')
    Left = 37
    Top = 2
    ParamData = <
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Delivery_No'
      end>
  end
  object UpdPODelivsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Delivery_Detail'
      'Set Is_Updated = '#39'N'#39
      'Where (Purchase_Order = :Purchase_Order)')
    Left = 37
    Top = 90
    ParamData = <
      item
        Name = 'Purchase_Order'
      end>
  end
  object UpdPODelivSQL: TFDQuery
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
      '  Delivery_To_Stock = :Delivery_to_Stock,'
      '  Goods_Reqd_by_Customer = :Goods_Reqd_by_Customer,'
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
    Left = 37
    Top = 186
    ParamData = <
      item
        Name = 'Ad_Hoc_Address'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Supplier'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Branch_No'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Rep'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Qty_To_Deliver'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'Qty_Delivered'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'Qty_Invoiced'
        DataType = ftFloat
        ParamType = ptInput
      end
      item
        Name = 'Date_Point'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'Customer'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Branch_No0'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'No_Of_boxes'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Instructions'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Deliver_Via_Company'
        DataType = ftString
      end
      item
        Name = 'Date_Deliv_Actual'
        DataType = ftDateTime
      end
      item
        Name = 'Delivery_to_Stock'
        DataType = ftString
      end
      item
        Name = 'Goods_Reqd_by_Customer'
      end
      item
        Name = 'FAO'
      end
      item
        Name = 'Company_Branch'
      end
      item
        Name = 'Delivery_Weight_Kilos'
        DataType = ftInteger
      end
      item
        Name = 'Courier'
        DataType = ftInteger
      end
      item
        Name = 'Service_no'
        DataType = ftInteger
      end
      item
        Name = 'Package_Type'
        DataType = ftInteger
      end
      item
        Name = 'Purchase_Order'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Line'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Delivery_No'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object AddPODelivSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Delivery_Detail'
      
        '  (Purchase_Order, Line,Delivery_No,Ad_Hoc_Address,Supplier,Bran' +
        'ch_No,'
      '  Rep,Qty_To_Deliver,'
      '  Qty_Delivered,Qty_Invoiced,Date_Point,Customer,Branch_No0,'
      
        '  Is_Updated, No_Of_boxes, Delivery_Instructions, Deliver_via_Co' +
        'mpany,'
      
        '  Date_Deliv_Actual, Delivery_To_Stock, Goods_Reqd_by_Customer, ' +
        'Contact_Name, Company_Branch,'
      '  Delivery_Weight_Kilos, Courier, Service_no, Package_Type)'
      'Values'
      
        '  (:Purchase_Order,:Line,:Delivery_No,:Ad_Hoc_Address,:Supplier,' +
        ':Branch_No,'
      '  :Rep,:Qty_To_Deliver,'
      
        '  :Qty_Delivered,:Qty_Invoiced,:Date_Point,:Customer,:Branch_No0' +
        ','
      '  '#39'Y'#39', :No_Of_boxes, :Instructions, :Deliver_via_Company,'
      
        '  :Date_Deliv_Actual, :Delivery_To_stock, :Goods_Reqd_by_Custome' +
        'r, :FAO, :Company_Branch,'
      '  :Delivery_Weight_Kilos, :Courier, :Service_no, :Package_Type)'
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 37
    Top = 138
    ParamData = <
      item
        Name = 'Purchase_Order'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Line'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Delivery_No'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Ad_Hoc_Address'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Supplier'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Branch_No'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Rep'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Qty_To_Deliver'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Qty_Delivered'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Qty_Invoiced'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Date_Point'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'Customer'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Branch_No0'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'No_Of_boxes'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Instructions'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Deliver_via_Company'
        DataType = ftString
      end
      item
        Name = 'Date_Deliv_Actual'
        DataType = ftDateTime
      end
      item
        Name = 'Delivery_To_stock'
        DataType = ftString
      end
      item
        Name = 'Goods_Reqd_by_Customer'
      end
      item
        Name = 'FAO'
      end
      item
        Name = 'Company_Branch'
      end
      item
        Name = 'Delivery_Weight_Kilos'
        DataType = ftInteger
      end
      item
        Name = 'Courier'
        DataType = ftInteger
      end
      item
        Name = 'Service_no'
        DataType = ftInteger
      end
      item
        Name = 'Package_Type'
        DataType = ftInteger
      end>
  end
  object GetLineDetsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select *'
      'From Purchase_OrderLine'
      'Where Purchase_Order = :Purchase_Order'
      'Order By Line')
    Left = 632
    Top = 72
    ParamData = <
      item
        Name = 'Purchase_Order'
      end>
  end
  object GetDelDetsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select *'
      'From Delivery_Detail'
      'Where Purchase_Order = :Purchase_Order'
      'Order By Line, Delivery_No')
    Left = 632
    Top = 16
    ParamData = <
      item
        Name = 'Purchase_Order'
      end>
  end
  object AddProofSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'UPDATE Proof_History'
      'SET Proof_Status=:Proof_Status,'
      '    Proof_Date=:Proof_Date,'
      '    Purchase_Order=:Purchase_Order,'
      '    Line=:Line,'
      '    Operator=:Operator'
      'WHERE Proof_History = :Proof_History'
      ''
      ' ')
    Left = 320
    Top = 128
    ParamData = <
      item
        Name = 'Proof_Status'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Proof_Date'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'Purchase_Order'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Line'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Operator'
      end
      item
        Name = 'Proof_History'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object DelProofHistorySQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Proof_History'
      'Where (Purchase_Order = :Purchase_Order) and'
      '       (Line = :Line)'
      '')
    Left = 320
    Top = 224
    ParamData = <
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end>
  end
  object GetSuppContSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Contact_No, Name'
      'From Supplier_BranchContacts'
      'Where (Supplier = :Supplier) and'
      '      (Branch_No = :Branch_No)')
    Left = 408
    Top = 156
    ParamData = <
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_No'
      end>
  end
  object GetDelPOLinesSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Line, Enquiry'
      'From Purchase_OrderLine'
      'Where (Purchase_Order = :Purchase_Order) and'
      '      (Is_Updated = '#39'N'#39')'
      '')
    Left = 408
    Top = 56
    ParamData = <
      item
        Name = 'Purchase_Order'
      end>
  end
  object GetLineMemoSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Int_Sel'
      '(Int_Sel_Code, Sel1, Sel2, Sel3, Sel4, Text100)'
      
        'Select ( :Int_Sel_Code ) as ISL, Purchase_OrderLine.Line, Narrat' +
        'ive_Line.Narrative_Line,'
      '            ( 0 ) as Sel3, ( 0 ) as Sel4,'
      '            Narrative_Line.Narrative_Text'
      'From  Purchase_OrderLine,Narrative_Line'
      'Where (Purchase_OrderLine.Purchase_Order = :Purchase_Order) and'
      '      (Narrative_Line.Narrative = Purchase_OrderLine.Narrative)')
    Left = 408
    Top = 104
    ParamData = <
      item
        Name = 'Int_Sel_Code'
      end
      item
        Name = 'Purchase_Order'
      end>
  end
  object GetExtChgSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select *'
      'From Purch_Ord_Line_Add_Chg'
      'Where (Purchase_Order = :Purchase_Order) and'
      '      (Line = :Line) and'
      '      (Additional_Charge = :Additional_Charge)'
      '')
    Left = 488
    Top = 8
    ParamData = <
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Additional_Charge'
      end>
  end
  object UpdExtChgsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Purch_Ord_Line_Add_Chg'
      'Set Is_Updated = '#39'N'#39
      'Where (Purchase_Order = :Purchase_Order)')
    Left = 488
    Top = 216
    ParamData = <
      item
        Name = 'Purchase_Order'
      end>
  end
  object GetExtChgsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select *'
      'From Purch_Ord_Line_Add_Chg'
      'Where Purchase_Order = :Purchase_Order'
      'Order By Line, Details')
    Left = 488
    Top = 168
    ParamData = <
      item
        Name = 'Purchase_Order'
      end>
  end
  object AddExtChgSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Purch_Ord_Line_Add_Chg'
      
        '            (Purchase_Order, Line, Additional_Charge, Details, A' +
        'mount,'
      '             Quotation_Price, Is_Updated, Vat_Code)'
      'Values'
      
        '            (:Purchase_Order, :Line, :Additional_Charge, :Detail' +
        's, :Amount,'
      '             :Quotation_Price, '#39'Y'#39', :Vat_Code)'
      ''
      '')
    Left = 488
    Top = 72
    ParamData = <
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
        DataType = ftInteger
      end
      item
        Name = 'Additional_Charge'
      end
      item
        Name = 'Details'
      end
      item
        Name = 'Amount'
      end
      item
        Name = 'Quotation_Price'
      end
      item
        Name = 'Vat_Code'
      end>
  end
  object UpdExtChgSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Purch_Ord_Line_Add_Chg'
      'Set'
      'Details = :Details,'
      'Amount = :Amount,'
      'Quotation_Price = :Quotation_Price,'
      'Is_Updated = '#39'Y'#39','
      'Vat_Code = :Vat_Code'
      'Where'
      '(Purchase_Order = :Purchase_Order) and'
      '(Line = :Line) and'
      '(Additional_Charge = :Additional_Charge)'
      ''
      ''
      ''
      ' ')
    Left = 488
    Top = 120
    ParamData = <
      item
        Name = 'Details'
      end
      item
        Name = 'Amount'
      end
      item
        Name = 'Quotation_Price'
      end
      item
        Name = 'Vat_Code'
      end
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
        DataType = ftInteger
      end
      item
        Name = 'Additional_Charge'
      end>
  end
  object DelExtChgsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Purch_Ord_Line_Add_Chg'
      'Where (Purchase_Order = :Purchase_Order) and'
      '       (Is_Updated = '#39'N'#39')'
      '')
    Left = 488
    Top = 272
    ParamData = <
      item
        Name = 'Purchase_Order'
      end>
  end
  object UpEnqHeadSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update Enquiry'
      'set Enquiry_Status = :Status'
      'where enquiry = :Enquiry')
    Left = 632
    Top = 192
    ParamData = <
      item
        Name = 'Status'
      end
      item
        Name = 'Enquiry'
      end>
  end
  object GetStatusSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Purch_Ord_Line_Status.Description'
      'From Purch_Ord_Line_Status'
      'Where Purch_Ord_Line_Status = :Purch_Ord_Line_Status')
    Left = 560
    Top = 40
    ParamData = <
      item
        Name = 'Purch_Ord_Line_Status'
      end>
  end
  object UpEnqLineSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update EnquiryLine'
      'set Enquiry_Status = :status'
      'where Enquiry = :Enquiry AND'
      '           Line = :Line')
    Left = 712
    Top = 256
    ParamData = <
      item
        Name = 'status'
      end
      item
        Name = 'Enquiry'
      end
      item
        Name = 'Line'
      end>
  end
  object DelJobBagDetsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Job_Bag_Line_Dets'
      'Where (Purchase_Order = :Purchase_Order) and'
      '      ((Line = :Line) or (:Line = 0)) ')
    Left = 560
    Top = 96
    ParamData = <
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Line'
      end>
  end
  object UpdJobBagSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Job_Bag_Line_Dets'
      'Set    Supplier = :Supplier,'
      '       Branch_No = :Branch_No,'
      '       Job_Bag_Line_Descr = :Job_Bag_Line_Descr,'
      '       Job_Bag_Line_Cost = :Job_Bag_Line_Cost,'
      '       Job_Bag_Line_Sell = :Job_Bag_Line_Sell,'
      '       Job_Bag_Line_Invoiced = :Job_Bag_Line_Invoiced,'
      '       Job_Bag_Quantity = :Job_Bag_Quantity,'
      '       VAT_Code = :VAT_Code, '
      '       Purchase_order = :Purchase_Order,'
      '       Line = :Line,'
      '       Job_Bag_Line_Type = :Job_Bag_Line_Type,'
      '       Currency_Code = :Currency_Code,'
      '       Job_Bag_Line_status = :Job_Bag_line_Status'
      'where Job_Bag = :Job_Bag and'
      '       Job_Bag_line = :Job_Bag_Line '
      ' ')
    Left = 560
    Top = 144
    ParamData = <
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_No'
      end
      item
        Name = 'Job_Bag_Line_Descr'
      end
      item
        Name = 'Job_Bag_Line_Cost'
      end
      item
        Name = 'Job_Bag_Line_Sell'
      end
      item
        Name = 'Job_Bag_Line_Invoiced'
      end
      item
        Name = 'Job_Bag_Quantity'
      end
      item
        Name = 'VAT_Code'
      end
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Job_Bag_Line_Type'
      end
      item
        Name = 'Currency_Code'
        DataType = ftInteger
      end
      item
        Name = 'Job_Bag_line_Status'
      end
      item
        Name = 'Job_Bag'
      end
      item
        Name = 'Job_Bag_Line'
      end>
  end
  object CopyEnqPartDetSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'INSERT INTO Purchase_OrderLinePart_Detail'
      '(Purchase_Order,Line,Part_No,Heading,Same_as_part,'
      'Paper_Brand,Paper_Material,Paper_Weight,Paper_Colour,'
      'Face_Inks,Reverse_Inks,Left_Margin_type,'
      'Left_Margin_Width,Right_Margin_Type,'
      'Right_Margin_Width)'
      ''
      'SELECT :PONumber,:POLine,Part_No,Heading,Same_as_part,'
      'Paper_Brand,Paper_Material,Paper_Weight,Paper_Colour,'
      'Face_Inks,Reverse_Inks,Left_Margin_type,'
      'Left_Margin_Width,Right_Margin_Type,'
      'Right_Margin_Width FROM EnquiryLinePart_Detail'
      'WHERE Enquiry=:Enquiry AND Line=:EnqLine'
      ''
      ' ')
    Left = 51
    Top = 248
    ParamData = <
      item
        Name = 'PONumber'
        DataType = ftInteger
      end
      item
        Name = 'POLine'
        DataType = ftInteger
      end
      item
        Name = 'Enquiry'
        DataType = ftInteger
      end
      item
        Name = 'EnqLine'
        DataType = ftInteger
      end>
  end
  object CopyEnqAdditionalsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'INSERT INTO Purchase_OrderLineAddtl_Dtls'
      
        '(Purchase_Order,Line,Additional_Details,FAO_Flag,Details,Narrati' +
        've)'
      
        'SELECT :PONumber,:POLine,E.Additional_Details,E.FAO_Flag,E.Detai' +
        'ls,null'
      ' FROM EnquiryLineAdditionl_Dtls E, EnquiryLine L'
      ' WHERE E.Enquiry=:Enquiry AND E.Line=:EnqLine'
      ' AND L.Enquiry=:Enquiry AND L.Line=:EnqLine'
      '')
    Left = 51
    Top = 296
    ParamData = <
      item
        Name = 'PONumber'
        DataType = ftInteger
      end
      item
        Name = 'POLine'
        DataType = ftInteger
      end
      item
        Name = 'Enquiry'
        DataType = ftInteger
      end
      item
        Name = 'EnqLine'
        DataType = ftInteger
      end
      item
        Name = 'Enquiry'
        DataType = ftInteger
      end
      item
        Name = 'EnqLine'
        DataType = ftInteger
      end>
  end
  object DelPOLinePartsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'DELETE FROM Purchase_OrderLinePart_Detail'
      ' WHERE (Purchase_Order = :PONumber) AND'
      '   ((Line = :POLine) OR (:AllLines = '#39'Y'#39'))'
      '')
    Left = 51
    Top = 400
    ParamData = <
      item
        Name = 'PONumber'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'POLine'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'AllLines'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object DelPOAdditionalsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'DELETE FROM Purchase_OrderLineAddtl_Dtls'
      ' WHERE (Purchase_Order = :PONumber) AND'
      '   ((Line = :POLine) OR (:AllLines = '#39'Y'#39'))'
      '')
    Left = 51
    Top = 344
    ParamData = <
      item
        Name = 'PONumber'
        DataType = ftInteger
      end
      item
        Name = 'POLine'
        DataType = ftInteger
      end
      item
        Name = 'AllLines'
        DataType = ftString
      end>
  end
  object GetSupplierSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select  Vat_Code_Def,'
      '        Currency_Code_Def,'
      '        Acc_Active'
      'From Supplier'
      'Where Supplier = :Supplier'
      '')
    Left = 624
    Top = 244
    ParamData = <
      item
        Name = 'Supplier'
        DataType = ftInteger
      end>
  end
  object VATSRC: TDataSource
    DataSet = GetSupplierSQL
    Left = 624
    Top = 292
  end
  object GetPriceUnitSQL1: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Price_unit, Description, Price_unit_Factor'
      'From Price_Unit'
      'Order By Description')
    Left = 712
    Top = 316
  end
  object PriceUnitSRC1: TDataSource
    DataSet = GetPriceUnitSQL1
    Left = 712
    Top = 364
  end
  object GetProofStatSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Proof_Status, Description'
      'From Proof_Status'
      'WHERE ((inactive = '#39'N'#39') or (inactive is NULL)) OR'
      '(Proof_Status = :Proof_Status)'
      'Order By Proof_Status')
    Left = 400
    Top = 268
    ParamData = <
      item
        Name = 'Proof_Status'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object ProofStatSRC: TDataSource
    DataSet = GetProofStatSQL
    Left = 400
    Top = 316
  end
  object GetJobBagDetsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Job_Bag, Job_Bag_Line'
      'From Job_Bag_Line_Dets'
      'Where (Purchase_Order = :Purchase_Order) and'
      '      (Line = :Line)')
    Left = 240
    Top = 276
    ParamData = <
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end>
  end
  object GetFormRefSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Form_Reference_ID, Form_Reference_Descr, Stock_Reference'
      'From Form_Reference'
      'Where Form_Reference = :Form_Reference')
    Left = 240
    Top = 324
    ParamData = <
      item
        Name = 'Form_Reference'
      end>
  end
  object GetCustSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select * From Customer'
      'Where Customer = :Customer')
    Left = 240
    Top = 420
    ParamData = <
      item
        Name = 'Customer'
      end>
  end
  object GetCustBranchSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Name From Customer_Branch'
      'Where (Customer = :Customer) and'
      '      (Branch_No = :Branch_No)')
    Left = 240
    Top = 372
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_No'
      end>
  end
  object GetRepSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Name, Position, Rep_Suffix_or_Prefix, Product_Nominal_Def'
      'From Rep'
      'Where Rep = :Rep')
    Left = 320
    Top = 292
    ParamData = <
      item
        Name = 'Rep'
      end>
  end
  object GetProdTypesSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Product_Type.Description,'
      
        '      Category.Description as Category_Description, Category.Inv' +
        'oice_immediately, Category.Cleared_Funds_Required '
      'From Product_Type, Category'
      'Where Product_Type = :Product_Type and'
      'Product_Type.Category = Category.Category')
    Left = 320
    Top = 344
    ParamData = <
      item
        Name = 'Product_Type'
      end>
  end
  object GetCustRepsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Rep, Is_Main_Rep'
      'From Reps_Branches'
      'Where (Customer = :Customer) and'
      '      (Branch_No = :Branch_No)'
      'Order By Is_Main_Rep Desc')
    Left = 436
    Top = 262
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_No'
      end>
  end
  object GetPartDetsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select *'
      'From Purchase_OrderLinePart_Detail'
      'Where Purchase_Order = :Purchase_Order'
      'Order By Line, Part_No')
    Left = 464
    Top = 333
    ParamData = <
      item
        Name = 'Purchase_Order'
        DataType = ftInteger
      end>
  end
  object GetAddDetsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select *'
      'From Purchase_OrderLineAddtl_Dtls'
      'Where Purchase_Order = :Purchase_Order'
      'Order By Line, Additional_Details')
    Left = 472
    Top = 381
    ParamData = <
      item
        Name = 'Purchase_Order'
        DataType = ftInteger
      end>
  end
  object AddPartDetSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'INSERT INTO Purchase_OrderLinePart_Detail'
      '(Purchase_Order,Line,Part_No,Heading,Same_as_part,'
      'Paper_Brand,Paper_Material,Paper_Weight,Paper_Colour,'
      'Face_Inks,Reverse_Inks,Left_Margin_type,'
      'Left_Margin_Width,Right_Margin_Type,'
      'Right_Margin_Width,No_of_plate_changes,Part_Description)'
      'VALUES'
      '(:Purchase_Order,:Line,:Part_No,:Heading,:Same_as_part,'
      ':Paper_Brand,:Paper_Material,:Paper_Weight,:Paper_Colour,'
      ':Face_Inks,:Reverse_Inks,:Left_Margin_type,'
      ':Left_Margin_Width,:Right_Margin_Type,'
      ':Right_Margin_Width,:No_of_plate_changes,:Part_Description)'
      '')
    Left = 128
    Top = 264
    ParamData = <
      item
        Name = 'Purchase_Order'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Line'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Part_No'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Heading'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Same_as_part'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Paper_Brand'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Paper_Material'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Paper_Weight'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Paper_Colour'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Face_Inks'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Reverse_Inks'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Left_Margin_type'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Left_Margin_Width'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Right_Margin_Type'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Right_Margin_Width'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'No_of_plate_changes'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Part_Description'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object AddAddDetsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'INSERT INTO Purchase_OrderLineAddtl_Dtls'
      
        '(Purchase_Order,Line,Additional_Details,FAO_Flag,Details,Narrati' +
        've)'
      'VALUES'
      
        '(:Purchase_Order,:Line,:Additional_Details,:FAO_Flag,:Details,:N' +
        'arrative)'
      '')
    Left = 128
    Top = 328
    ParamData = <
      item
        Name = 'Purchase_Order'
        DataType = ftInteger
      end
      item
        Name = 'Line'
        DataType = ftInteger
      end
      item
        Name = 'Additional_Details'
        DataType = ftInteger
      end
      item
        Name = 'FAO_Flag'
        DataType = ftString
      end
      item
        Name = 'Details'
        DataType = ftString
      end
      item
        Name = 'Narrative'
        DataType = ftInteger
      end>
  end
  object NCRSQL: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select * from NCR_OTC_Mix')
    Left = 624
    Top = 352
  end
  object ProductSQL: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select * from Product_Type')
    Left = 144
    Top = 400
  end
  object StdSizeSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from  Paper_size'
      'order by Description')
    Left = 400
    Top = 376
  end
  object NCRSRC: TDataSource
    AutoEdit = False
    DataSet = NCRSQL
    Left = 624
    Top = 400
  end
  object OperatorSQL: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select * from operator'
      'order by Name')
    Left = 560
    Top = 208
  end
  object OperatorSRC: TDataSource
    AutoEdit = False
    DataSet = OperatorSQL
    Left = 560
    Top = 256
  end
  object GetPOSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT PO.*, S.Name as SupplierName, SB.Name as BranchName,'
      '       SBC.Name as TheirContact,'
      '       SBC.Salutation as Salutation,'
      '       O.Name as OurContact,'
      '       S.Courier'
      'FROM  Purchase_Order PO, Supplier S, Supplier_Branch SB,'
      '      Supplier_BranchContacts SBC,'
      '      Operator O'
      'WHERE PO.Purchase_Order=:Purchase_Order and'
      '  PO.Supplier = SB.Supplier and'
      '  PO.Branch_No = SB.Branch_No and'
      '  SB.Supplier = S.Supplier and'
      '  ('
      '  (PO.Supplier = SBC.Supplier) and'
      '  (PO.Branch_No = SBC.Branch_No) and'
      '  (PO.Contact_No = SBC.Contact_No)'
      '  ) and'
      '  (PO.Office_Contact = O.Operator)'
      ''
      ' '
      ' '
      ' '
      ' ')
    Left = 352
    Top = 238
    ParamData = <
      item
        Name = 'Purchase_Order'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object PriceUnitLUSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'Select Price_unit, Description, show_on_report, Price_unit_Facto' +
        'r'
      'From Price_Unit'
      'where Price_Unit = :Price_Unit')
    Left = 712
    Top = 420
    ParamData = <
      item
        Name = 'Price_Unit'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object CustContactSQL: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select * from customer_contact'
      'where Customer = :Customer and '
      '           Branch_No = :Branch')
    Left = 240
    Top = 472
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
      end
      item
        Name = 'Branch'
        DataType = ftInteger
      end>
  end
  object GetLastSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Last_PO_Number'
      'From Company'
      'Where Company = 1')
    Left = 104
    Top = 20
  end
  object UpdLastSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Company'
      'Set Last_PO_Number = :Last_PO_Number'
      'Where Company = 1')
    Left = 104
    Top = 64
    ParamData = <
      item
        Name = 'Last_PO_Number'
      end>
  end
  object AddSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Purchase_Order'
      '        (Purchase_Order,'
      '         Supplier,'
      '         Branch_No,'
      '         Date_Point,'
      '         Contact_No,'
      '         Operator,'
      '         Purch_Ord_Inv_Method,'
      '         Purch_Ord_Head_Status,'
      '         Currency_Code,'
      '         Office_Contact,'
      '         Account_Team,'
      '         Authorised_by,'
      '         Needs_Authorising,'
      '         Authorised_Reason)'
      'Values'
      '        (:Purchase_Order,'
      '         :Supplier,'
      '         :Branch_No,'
      '         :Date_Point,'
      '         :Contact_No,'
      '         :Operator,'
      '         :Purch_Ord_Inv_Method,'
      '         :Purch_Ord_Head_Status,'
      '         :Currency_Code,'
      '         :Office_Contact,'
      '         :Account_Team,'
      '         :Authorised_By,'
      '         :Needs_Authorising,'
      '         :Authorised_Reason)'
      '')
    Left = 104
    Top = 113
    ParamData = <
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_No'
      end
      item
        Name = 'Date_Point'
      end
      item
        Name = 'Contact_No'
      end
      item
        Name = 'Operator'
      end
      item
        Name = 'Purch_Ord_Inv_Method'
      end
      item
        Name = 'Purch_Ord_Head_Status'
      end
      item
        Name = 'Currency_Code'
        DataType = ftInteger
      end
      item
        Name = 'Office_Contact'
      end
      item
        Name = 'Account_Team'
      end
      item
        Name = 'Authorised_By'
        DataType = ftInteger
      end
      item
        Name = 'Needs_Authorising'
      end
      item
        Name = 'Authorised_Reason'
        DataType = ftInteger
      end>
  end
  object qryCompany: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select In_Use_By from Company Where Company = 1')
    Left = 368
    Top = 8
  end
  object GetSuppBranchSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'Select Supplier.Name as Name, Supplier_Branch.Name as Branch_Nam' +
        'e'
      'From Supplier_Branch, Supplier'
      'Where (Supplier_Branch.Supplier = :Supplier) and'
      '      (Supplier_Branch.Branch_No = :Branch_No) and'
      '      (Supplier.Supplier = Supplier_Branch.Supplier)'
      ' ')
    Left = 536
    Top = 439
    ParamData = <
      item
        Name = 'Supplier'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Branch_No'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object GetQuestionsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select P.*, Q.Question_Text'
      
        'From Purchase_OrderLineQuestions P LEFT JOIN Product_TypeQuestio' +
        'n Q '
      'on P.Question = Q.Question and P.Product_Type = Q.Product_Type'
      'Where'
      'P.Purchase_Order = :Purchase_Order')
    Left = 296
    Top = 64
    ParamData = <
      item
        Name = 'Purchase_Order'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object DelPOQuestionsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'DELETE FROM Purchase_OrderLineQuestions'
      ' WHERE (Purchase_Order = :PONumber) AND'
      '   ((Line = :POLine) OR (:AllLines = '#39'Y'#39'))'
      '')
    Left = 51
    Top = 456
    ParamData = <
      item
        Name = 'PONumber'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'POLine'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'AllLines'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object AddPOQuestionSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'INSERT INTO Purchase_OrderLineQuestions'
      
        'VALUES(:Product_Type, :Question, :PONumber, :POLine, :Product_An' +
        'swer)')
    Left = 155
    Top = 456
    ParamData = <
      item
        Name = 'Product_Type'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Question'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'PONumber'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'POLine'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Product_Answer'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object GetNCRDescSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select NCR_OTC_Descr'
      'from NCR_OTC_Mix'
      'where NCR_OTC_Mix = :NCR_OTC_Mix')
    Left = 256
    Top = 200
    ParamData = <
      item
        Name = 'NCR_OTC_Mix'
      end>
  end
  object AnyQuestions: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select * '
      'From Product_TypeQuestion '
      'Where Product_Type = :Product_Type'
      'Order by Sequence_Reference')
    Left = 336
    Top = 176
    ParamData = <
      item
        Name = 'Product_Type'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object PaperDetailSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from')
    Left = 408
    Top = 208
  end
  object qryGeneral: TFDQuery
    ConnectionName = 'PB'
    Left = 424
    Top = 8
  end
  object GetLineProdTypeSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select '#9'Purchase_order,'
      #9'Line,'
      #9'Product_TypeQuestion.Product_Type,'
      #9'Question,'
      #9'Question_Text,'
      '                Prompt_Type'
      'from Purchase_orderline, Product_TypeQuestion'
      
        'where Purchase_orderLine.Product_Type = Product_TypeQuestion.Pro' +
        'duct_Type and'
      'Purchase_order = :Purchase_Order'
      'order by Line, Sequence_Reference'
      ' ')
    Left = 304
    Top = 16
    ParamData = <
      item
        Name = 'Purchase_order'
      end>
  end
  object GetPOQuestionSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Purchase_OrderLineQuestions'
      'where Purchase_order = :Purchase_Order and'
      '      Line = :Line and'
      '      Product_Type = :Product_Type and'
      '      Question = :Question'
      ' ')
    Left = 352
    Top = 80
    ParamData = <
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Product_Type'
      end
      item
        Name = 'Question'
      end>
  end
  object GetOffContactSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Name, Email, Phone'
      'From Operator'
      'Where Operator = :Operator')
    Left = 360
    Top = 268
    ParamData = <
      item
        Name = 'Operator'
      end>
  end
  object GetSuppContactSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Supplier_BranchContacts.Name,'
      '        Supplier_BranchContacts.Inactive'
      'From Supplier_BranchContacts'
      'Where (Supplier_BranchContacts.Supplier = :Supplier) and'
      '      (Supplier_BranchContacts.Branch_No = :Branch_No) and'
      '      (Supplier_BranchContacts.Contact_no = :Contact_no)'
      ' ')
    Left = 302
    Top = 241
    ParamData = <
      item
        Name = 'Supplier'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Branch_No'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Contact_no'
      end>
  end
  object GetLineCallOffsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select '#9'Delivery_Detail.Purchase_order,'
      #9'  Delivery_Detail.Line,'
      #9'  Delivery_Detail.Delivery_no,'
      #9'  Delivery_Detail.Ad_hoc_Address,'
      #9'  Delivery_Detail.Supplier as Delivery_Supplier,'
      #9'  Delivery_Detail.Branch_no as Delivery_SBranch,'
      #9'  Delivery_Detail.Rep as Delivery_Rep,'
      #9'  Delivery_Detail.Qty_to_Deliver,'
      #9'  Delivery_Detail.Qty_Delivered,'
      #9'  Delivery_Detail.Date_Point as Schedule_Date,'
      #9'  Delivery_Detail.Customer as Delivery_Customer,'
      #9'  Delivery_Detail.Branch_no0 as Delivery_CBranch,'
      #9'  Delivery_Detail.Delivery_Instructions,'
      #9'  Delivery_Detail.No_Of_Boxes,'
      #9'  Delivery_Detail.Date_Deliv_Actual,'
      '          Delivery_detail.contact_name,'
      #9'  Purchase_orderline.Customer,'
      #9'  Purchase_orderline.Branch_no as Customer_branch,'
      #9'  Purchase_orderline.Contact_no as Customer_Contact,'
      #9'  Purchase_orderline.Forms_per_Box,'
      #9'  Purchase_orderline.Selling_Price,'
      #9'  Purchase_orderline.Order_Price,'
      #9'  Purchase_orderline.Sell_Unit,'
      #9'  Purchase_orderline.Order_Unit,'
      #9'  Purchase_orderline.Customers_Desc,'
      #9'  Purchase_orderline.Cust_Order_no,'
      #9'  Purchase_orderline.Form_Reference,'
      #9'  Purchase_orderline.Number_Instructions,'
      #9'  Purchase_Order.Supplier,'
      #9'  Purchase_Order.Branch_no as Supplier_Branch,'
      #9'  Purchase_Order.Contact_no as Supplier_Contact,'
      #9'  Original_order,'
      #9'  Original_orderline,'
      '    Purchase_order.Date_point,'
      '    Purchase_orderline.Purch_ord_line_status,'
      '    Purchase_orderline.Rep,'
      '    Purchase_orderline.Inactive,'
      '    Purchase_orderline.Inactive_Reason,'
      '    Purchase_orderline.Inactive_Date,'
      '    Purchase_orderline.Invoice_upfront,'
      '    Purchase_orderline.Calloff_Invoiced_upfront'
      'From Delivery_Detail, Purchase_orderline, Purchase_order'
      'Where Original_order = :Purchase_order and'
      #9'('
      
        #9'(Delivery_Detail.Purchase_Order = Purchase_orderline.Purchase_O' +
        'rder) and'
      #9'(Delivery_Detail.Line = Purchase_orderline.Line)'
      #9') and'
      
        #9'(Purchase_orderline.Purchase_order = purchase_order.purchase_or' +
        'der)'
      'Order By Delivery_Detail.Purchase_Order '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 176
    Top = 328
    ParamData = <
      item
        Name = 'Purchase_Order'
      end>
  end
  object GetCompanySQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from Company'
      'where company = 1')
    Left = 16
    Top = 232
  end
  object CustContactSRC: TDataSource
    DataSet = CustContactSQL
    Left = 320
    Top = 312
  end
  object GetLastJBSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Last_Job_Bag_Number'
      'From Company'
      'Where Company = 1')
    Left = 208
    Top = 4
  end
  object UpdLastJBSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Company'
      'Set Last_Job_Bag_Number = :Last_Job_Bag_Number'
      'Where Company = 1')
    Left = 336
    ParamData = <
      item
        Name = 'Last_Job_Bag_Number'
      end>
  end
  object AddJobBagHeadSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'insert into Job_Bag'
      '  (Job_Bag,'
      '   Job_Bag_Descr,'
      '   Customer,'
      '   Branch_no,'
      '   Date_Point,'
      '   Contact_no,'
      '   Goods_required,'
      '   Cust_Order_no,'
      '   Quantity,'
      '   Rep,'
      '   Sub_Rep,'
      '   Operator,'
      '   Office_Contact,'
      '   Job_Bag_Status,'
      '   Invoice_upfront,'
      '   Account_Team)'
      'values (:Job_Bag,'
      '        :Job_Bag_Descr,'
      '        :Customer,'
      '        :Branch_no,'
      '        :Date_Point,'
      '        :Contact_no,'
      '        :Goods_Required,'
      '        :Cust_Order_no,'
      '        :Quantity,'
      '        :Rep,'
      '        :Sub_Rep,'
      '        :Operator,'
      '        :Office_Contact,'
      '        :Job_Bag_Status,'
      '        :Invoice_upfront,'
      '        :Account_Team)'
      ' ')
    Left = 304
    Top = 176
    ParamData = <
      item
        Name = 'Job_Bag'
      end
      item
        Name = 'Job_Bag_Descr'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'Date_Point'
      end
      item
        Name = 'Contact_no'
      end
      item
        Name = 'Goods_Required'
      end
      item
        Name = 'Cust_Order_no'
      end
      item
        Name = 'Quantity'
      end
      item
        Name = 'Rep'
        DataType = ftInteger
      end
      item
        Name = 'Sub_Rep'
        DataType = ftInteger
      end
      item
        Name = 'Operator'
      end
      item
        Name = 'Office_Contact'
      end
      item
        Name = 'Job_Bag_Status'
      end
      item
        Name = 'Invoice_upfront'
      end
      item
        Name = 'Account_Team'
      end>
  end
  object AddJobBagSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'insert into Job_Bag_Line_Dets'
      '    (Job_Bag,'
      '    Job_Bag_Line,'
      '    Job_Bag_Line_Type,'
      '    Purchase_order, Line,'
      '    Supplier,'
      '    Branch_No,'
      '    Job_Bag_Line_Descr,'
      '    Job_Bag_Line_Cost,'
      '    Job_Bag_Line_Sell,'
      '    Job_Bag_Line_Invoiced,'
      '    Job_Bag_Quantity,'
      '    VAT_Code,'
      '    Currency_Code,'
      '    Job_Bag_Line_status)'
      'values'
      '    (:Job_Bag,'
      '    :Job_Bag_Line,'
      '    :Job_Bag_Line_Type,'
      '    :Purchase_order,'
      '    :Line,'
      '    :Supplier,'
      '    :Branch_No,'
      '    :Job_Bag_Line_Descr,'
      '    :Job_Bag_Line_Cost,'
      '    :Job_Bag_Line_Sell,'
      '    :Job_Bag_Line_Invoiced,'
      '    :Job_Bag_Quantity,'
      '    :VAT_Code,'
      '    :Currency_Code,'
      '    :Job_Bag_Line_status)'
      '')
    Left = 439
    Top = 152
    ParamData = <
      item
        Name = 'Job_Bag'
      end
      item
        Name = 'Job_Bag_Line'
      end
      item
        Name = 'Job_Bag_Line_Type'
      end
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_No'
      end
      item
        Name = 'Job_Bag_Line_Descr'
      end
      item
        Name = 'Job_Bag_Line_Cost'
      end
      item
        Name = 'Job_Bag_Line_Sell'
      end
      item
        Name = 'Job_Bag_Line_Invoiced'
      end
      item
        Name = 'Job_Bag_Quantity'
      end
      item
        Name = 'VAT_Code'
      end
      item
        Name = 'Currency_Code'
        DataType = ftInteger
      end
      item
        Name = 'Job_Bag_Line_status'
      end>
  end
  object PriceUnitSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Price_unit'
      'where Price_unit = :Price_Unit')
    Left = 240
    Top = 232
    ParamData = <
      item
        Name = 'Price_Unit'
      end>
  end
  object GetDelivLocsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from Delivery_Location'
      'where Purchase_Order = :Purchase_Order and'
      'Line = :Line and'
      'Delivery_No = :Delivery_no')
    Left = 304
    Top = 317
    ParamData = <
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Delivery_no'
      end>
  end
  object GetPickLocsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Delivery_Location.Purchase_order,'
      '        Delivery_Location.Line,'
      '        Delivery_Location.Delivery_no,'
      '        Delivery_Location.Location_no,'
      '        Delivery_Location.Description,'
      '        Delivery_Location.Quantity,'
      '        Delivery_Location.Quantity_Allocated,'
      '        Delivery_Detail.Stock_Location_Desc'
      'FROM Delivery_Detail'
      '      RIGHT JOIN Delivery_Location ON'
      
        '      (Delivery_Detail.Delivery_no = Delivery_Location.Delivery_' +
        'no) AND'
      '      (Delivery_Detail.Line = Delivery_Location.Line) AND'
      
        '      (Delivery_Detail.Purchase_Order = Delivery_Location.Purcha' +
        'se_order)'
      'where Delivery_location.Purchase_Order = :Purchase_Order and'
      '      Delivery_location.Line = :Line'
      ' '
      ' ')
    Left = 464
    Top = 304
    ParamData = <
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end>
  end
  object GetPickSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Quantity_Picked'
      'from Picking_Detail'
      'where Purchase_Order = :Purchase_order and'
      'Line = :Line and'
      'Delivery_no = :Delivery_no and'
      'Location_no = :Location_no and'
      'Calloff_order = :calloff_order and'
      'Calloff_line = :Calloff_Line and'
      'Calloff_Delivery = :Calloff_Delivery')
    Left = 360
    Top = 304
    ParamData = <
      item
        Name = 'Purchase_order'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Delivery_no'
      end
      item
        Name = 'Location_no'
      end
      item
        Name = 'calloff_order'
      end
      item
        Name = 'Calloff_Line'
      end
      item
        Name = 'Calloff_Delivery'
      end>
  end
  object GetPickQtySQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select SUM(Quantity_Picked) as Total_Picked'
      'from Picking_Detail'
      'where Purchase_Order = :Purchase_order and'
      'Line = :Line and'
      'Delivery_no = :Delivery_no and'
      'Location_no = :Location_no')
    Left = 264
    Top = 301
    ParamData = <
      item
        Name = 'Purchase_order'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Delivery_no'
      end
      item
        Name = 'Location_no'
      end>
  end
  object GetPickCallOffSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'SELECT Picking_Detail.*, Delivery_Detail.Stock_Location_Desc, De' +
        'livery_Location.Description'
      'FROM (Delivery_Detail RIGHT JOIN Delivery_Location ON'
      
        '  (Delivery_Detail.Delivery_no = Delivery_Location.Delivery_no) ' +
        'AND'
      '  (Delivery_Detail.Line = Delivery_Location.Line) AND'
      
        '  (Delivery_Detail.Purchase_Order = Delivery_Location.Purchase_O' +
        'rder))'
      
        '  RIGHT JOIN Picking_Detail ON (Delivery_Location.Location_no = ' +
        'Picking_Detail.Location_no) AND'
      
        '  (Delivery_Location.Delivery_no = Picking_Detail.Delivery_no) A' +
        'ND'
      '  (Delivery_Location.Line = Picking_Detail.Line) AND'
      
        '  (Delivery_Location.Purchase_Order = Picking_Detail.Purchase_Or' +
        'der)'
      'where Picking_Detail.Purchase_Order = :Purchase_order and'
      'Picking_Detail.Line = :Line and'
      'Picking_Detail.CallOff_Delivery = :Delivery_no and'
      'Calloff_order = :calloff_order and'
      'Calloff_line = :Calloff_Line'
      'order by Delivery_Location.Description'
      ''
      ' '
      ' '
      ' '
      ' ')
    Left = 200
    Top = 304
    ParamData = <
      item
        Name = 'Purchase_order'
        DataType = ftFloat
      end
      item
        Name = 'Line'
        DataType = ftInteger
      end
      item
        Name = 'Delivery_no'
        DataType = ftInteger
      end
      item
        Name = 'calloff_order'
        DataType = ftFloat
      end
      item
        Name = 'Calloff_Line'
        DataType = ftInteger
      end>
  end
  object GetTotPickSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select SUM(Quantity_Picked) as Total_Picked'
      'from Picking_Detail'
      'where CallOff_Order = :Calloff_order and'
      'CallOff_Line = :Calloff_Line and'
      'Calloff_Delivery = :Calloff_Delivery')
    Left = 104
    Top = 389
    ParamData = <
      item
        Name = 'Calloff_order'
      end
      item
        Name = 'Calloff_Line'
      end
      item
        Name = 'Calloff_Delivery'
      end>
  end
  object QuestListSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Product_TypeQList'
      'where Product_Type = :Product_Type and '
      'Question = :Question')
    Left = 440
    Top = 264
    ParamData = <
      item
        Name = 'Product_Type'
      end
      item
        Name = 'Question'
      end>
  end
  object QryStock: TFDQuery
    ConnectionName = 'PB'
    Left = 112
    Top = 312
  end
  object GetLastJBLineSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select max(Job_Bag_Line) as Last_JB_Line_Number'
      'from Job_Bag_Line_Dets'
      'where Job_Bag = :Job_Bag')
    Left = 536
    Top = 376
    ParamData = <
      item
        Name = 'Job_Bag'
      end>
  end
  object qryCheckJobBag: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Job_Bag'
      'from Job_Bag'
      'where Job_Bag = :Job_Bag')
    Left = 552
    Top = 320
    ParamData = <
      item
        Name = 'Job_Bag'
      end>
  end
  object qryGetPOLineIntNotes: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Purchase_OrderLineInt_Notes.*,'
      '  operator.name  '
      'from Purchase_OrderLineInt_Notes inner join operator on '
      '  Purchase_OrderLineInt_Notes.operator = operator.operator '
      'where purchase_order = :purchase_order and '
      ' line = :line '
      'order by Purchase_OrderLineInt_Notes.Date_Time_Entered;')
    Left = 320
    Top = 336
    ParamData = <
      item
        Name = 'purchase_order'
      end
      item
        Name = 'line'
      end>
  end
  object qryInsIntNote: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'insert into Purchase_OrderLineInt_Notes'
      '(Purchase_Order, Line, Internal_Notes, Date_Time_Entered,'
      ' Narrative, Operator)'
      'values'
      '(:Purchase_Order, :Line, :Internal_Notes, :Date_Time_Entered,'
      ' :Narrative, :Operator);')
    Left = 288
    Top = 328
    ParamData = <
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Internal_Notes'
      end
      item
        Name = 'Date_Time_Entered'
      end
      item
        Name = 'Narrative'
      end
      item
        Name = 'Operator'
      end>
  end
  object qryDelPOLineIntNotes: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from Purchase_OrderLineInt_Notes where '
      'purchase_order = :purchase_order and '
      'line = :line;')
    Left = 296
    Top = 112
    ParamData = <
      item
        Name = 'purchase_order'
      end
      item
        Name = 'line'
      end>
  end
  object UpdJobBagHeadSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Job_Bag'
      'set Job_Bag_Descr = :Job_Bag_Descr,'
      '   Goods_required = :Goods_required,'
      '   Cust_Order_no = :Cust_Order_No,'
      '   Quantity = :Quantity,'
      '   Invoice_upfront = :Invoice_upfront'
      'where job_Bag = :Job_Bag'
      ' ')
    Left = 320
    Top = 336
    ParamData = <
      item
        Name = 'Job_Bag_Descr'
      end
      item
        Name = 'Goods_required'
      end
      item
        Name = 'Cust_Order_No'
      end
      item
        Name = 'Quantity'
      end
      item
        Name = 'Invoice_upfront'
      end
      item
        Name = 'Job_Bag'
      end>
  end
  object ChkJobBagLnSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Top 1 Purchase_order from Job_Bag_Line_Dets'
      'where job_Bag = :Job_Bag and Purchase_Order = :Purchase_Order '
      ' ')
    Left = 304
    Top = 320
    ParamData = <
      item
        Name = 'Job_Bag'
      end
      item
        Name = 'Purchase_Order'
      end>
  end
  object ActionList1: TActionList
    Left = 272
    Top = 176
  end
  object qryDelExpLife: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update purchase_orderline '
      'set expected_life = :expLife '
      'where purchase_order = :purchase_order '
      ' and line = :line')
    Left = 144
    Top = 8
    ParamData = <
      item
        Name = 'expLife'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'purchase_order'
      end
      item
        Name = 'line'
      end>
  end
  object updSILineSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update sales_invoice_line'
      'set Product_type = :Product_type'
      'where purchase_order = :Purchase_order and '
      'Line = :Line')
    Left = 464
    Top = 432
    ParamData = <
      item
        Name = 'Product_type'
      end
      item
        Name = 'Purchase_order'
      end
      item
        Name = 'Line'
      end>
  end
  object GetJBPOStatii: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select max(purchase_order.Purch_Ord_Head_Status) as maxStat,'
      '  min(purchase_order.Purch_Ord_Head_Status) as minStat'
      'from Job_Bag_Line_Dets inner join purchase_order on'
      
        '  (Job_Bag_Line_Dets.purchase_order = purchase_order.purchase_or' +
        'der)'
      'where Job_Bag_Line_Dets.job_bag = :job_bag;'
      ' '
      ' '
      ' '
      ' ')
    Left = 144
    Top = 192
    ParamData = <
      item
        Name = 'job_bag'
      end>
  end
  object UpdJobBagHeadStat: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update job_bag '
      'set Job_Bag_Status = :status '
      'where job_bag = :job_bag;')
    Left = 372
    Top = 156
    ParamData = <
      item
        Name = 'Status'
      end
      item
        Name = 'job_bag'
      end>
  end
  object qryVatCode: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from Vat_Code'
      'order by Vat_rate')
    Left = 456
    Top = 56
    object qryVatCodeVat_Code: TIntegerField
      FieldName = 'Vat_Code'
    end
    object qryVatCodeVat_Rate: TFloatField
      FieldName = 'Vat_Rate'
      DisplayFormat = '0.00%'
    end
    object qryVatCodeDescription: TWideStringField
      FieldName = 'Description'
      FixedChar = True
      Size = 80
    end
    object qryVatCodeVAT_Ref: TWideStringField
      FieldName = 'VAT_Ref'
      FixedChar = True
      Size = 2
    end
  end
  object dtsVatCode: TDataSource
    DataSet = qryVatCode
    Left = 512
    Top = 56
  end
  object qryGetPOLineDocs: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from Purchase_orderlineDocs '
      'where purchase_order = :purchase_order '
      'order by Document_no;'
      ' ')
    Left = 216
    Top = 148
    ParamData = <
      item
        Name = 'purchase_order'
      end>
  end
  object qryDelPOLineDocs: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from Purchase_orderlineDocs'
      'where purchase_order = :purchase_order and line = :line; ')
    Left = 228
    Top = 200
    ParamData = <
      item
        Name = 'purchase_order'
      end
      item
        Name = 'line'
      end>
  end
  object qryInsPOLineDocs: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'insert into Purchase_orderlineDocs'
      '(Purchase_Order, Line, Document_no, Document_Title, Document)'
      'values'
      
        '(:Purchase_Order, :Line, :Document_no, :Document_Title, :Documen' +
        't)'
      ' ')
    Left = 232
    Top = 108
    ParamData = <
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Document_no'
      end
      item
        Name = 'Document_Title'
      end
      item
        Name = 'Document'
      end>
  end
  object UpJobBagSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update Job_Bag'
      'set Inactive = '#39'Y'#39
      'where Job_Bag = :Job_Bag')
    Left = 312
    Top = 242
    ParamData = <
      item
        Name = 'Job_Bag'
      end>
  end
  object CountJBLinesSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select count(Job_Bag_Line) as Line_Count'
      'from Job_Bag_Line_Dets'
      'where Job_Bag = :Job_Bag')
    Left = 184
    Top = 376
    ParamData = <
      item
        Name = 'Job_Bag'
      end>
  end
  object VatRateSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Vat_Rate from Vat_Code'
      'where Vat_code = :Vat_code'
      '')
    Left = 152
    Top = 248
    ParamData = <
      item
        Name = 'Vat_code'
      end>
  end
  object qryPOSInvs: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select'
      '  sales_invoice.sales_invoice,'
      '  sales_invoice.Sales_Invoice_No,'
      '  sales_invoice.Invoice_Date,'
      '  sales_invoice_line.Qty_Invoiced,'
      '  sales_invoice_line.Goods_Value,'
      '  sales_invoice_line.credit_type,'
      '  price_unit.price_unit,'
      '  price_unit.Price_Unit_Factor,'
      '  vat_code.Vat_Rate,'
      '  (select sum(Amount)'
      '  from sales_invoice_add_charge'
      
        '  where sales_invoice_add_charge.sales_invoice = sales_invoice.s' +
        'ales_invoice) as Additional_Charges,'
      '  (select sum(Amount*(VC.vat_rate/100.000))'
      '  from sales_invoice_add_charge, Vat_Code VC'
      
        '  where sales_invoice_add_charge.sales_invoice = sales_invoice.s' +
        'ales_invoice and'
      
        '         sales_invoice_add_charge.vat_code = VC.vat_code) as Add' +
        'itional_Charges_Vat'
      'from ((sales_invoice_line'
      
        'inner join sales_invoice on (sales_invoice_line.sales_invoice = ' +
        'sales_invoice.sales_invoice))'
      
        'inner join price_unit on (sales_invoice_line.price_unit = price_' +
        'unit.price_unit))'
      
        'inner join vat_code on (sales_invoice_line.vat_code = vat_code.v' +
        'at_code)'
      'where purchase_order = :purchase_order'
      'and line = :line and'
      
        '((sales_invoice.inactive = '#39'N'#39') or (sales_invoice.inactive is NU' +
        'LL))'
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 328
    Top = 305
    ParamData = <
      item
        Name = 'purchase_order'
      end
      item
        Name = 'line'
      end>
  end
  object qryPOPInvs: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select'
      '  supplier_invoice.supplier_invoice,'
      '  supplier_invoice.Supplier_Invoice_no,'
      '  supplier_invoice.Invoice_Date,'
      '  supplier_invoice_line.Qty_Invoiced,'
      '  supplier_invoice_line.Goods_Value,'
      '  supplier_invoice_line.credit_type,'
      '  price_unit.price_unit,'
      '  price_unit.Price_Unit_Factor,'
      '  vat_code.Vat_Rate,'
      '  (select sum(Amount)'
      '   from Supplier_Invoice_Charge'
      
        '   where Supplier_Invoice_Charge.Supplier_invoice = supplier_inv' +
        'oice.supplier_invoice) as Additional_Charges,'
      '  (select sum(Amount*(VC.vat_rate/100.000))'
      '   from Supplier_Invoice_Charge, vat_code VC'
      
        '   where Supplier_Invoice_Charge.Supplier_invoice = supplier_inv' +
        'oice.supplier_invoice and'
      
        '         Supplier_Invoice_Charge.vat_code = VC.vat_code) as Addi' +
        'tional_Charges_Vat'
      'from ((supplier_invoice_line'
      
        'inner join supplier_invoice on (supplier_invoice_line.supplier_i' +
        'nvoice = supplier_invoice.supplier_invoice))'
      
        'inner join price_unit on (supplier_invoice_line.price_unit = pri' +
        'ce_unit.price_unit))'
      
        'inner join vat_code on (supplier_invoice_line.vat_code = vat_cod' +
        'e.vat_code)'
      'where purchase_order = :purchase_order'
      'and line = :line'
      ' '
      ' '
      ' '
      ' ')
    Left = 372
    Top = 305
    ParamData = <
      item
        Name = 'purchase_order'
      end
      item
        Name = 'line'
      end>
  end
  object qryJobType: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Job_Type'
      'order by Job_Type_Description')
    Left = 320
    Top = 400
  end
  object dtsJobType: TDataSource
    DataSet = qryJobType
    Left = 360
    Top = 400
  end
  object qryGetJobType: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Job_Type'
      'where Job_Type = :Job_Type')
    Left = 416
    Top = 424
    ParamData = <
      item
        Name = 'Job_Type'
      end>
  end
  object qryGetBranchRep: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select rep'
      'from reps_branches'
      'where customer = :customer and branch_no = :branch_no')
    Left = 632
    Top = 136
    ParamData = <
      item
        Name = 'customer'
      end
      item
        Name = 'branch_no'
      end>
  end
  object qrySelActiveCCont: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select * from customer_contact'
      'where '
      'Customer = :Customer '
      'and Branch_No = :Branch '
      'and ((Inactive = '#39'N'#39') or (Inactive is NULL))'
      '')
    Left = 328
    Top = 452
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
      end
      item
        Name = 'Branch'
        DataType = ftInteger
      end>
  end
  object qryGetAccountMgr: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select Account_Team.Account_Team, Account_Team_Name'
      'from Account_Team_Member, Account_Team'
      'where Operator = :Operator and'
      '(Account_Team_Member.Account_Team = Account_Team.Account_Team)')
    Left = 800
    Top = 16
    ParamData = <
      item
        Name = 'Operator'
      end>
  end
  object qryGetProdType: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select *'
      'from Product_Type'
      'where Product_type = :Product_Type and '
      '((inactive is NULL) or (inactive = '#39'N'#39'))')
    Left = 800
    Top = 120
    ParamData = <
      item
        Name = 'Product_Type'
      end>
  end
  object qryGetAccountTeam: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select *'
      'from account_team'
      'where account_team = :account_team')
    Left = 800
    Top = 72
    ParamData = <
      item
        Name = 'account_team'
      end>
  end
  object qryGetOperator: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Operator'
      'where Operator = :Operator')
    Left = 800
    Top = 168
    ParamData = <
      item
        Name = 'Operator'
      end>
  end
  object GetOrigPriceUnitSQL1: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Price_unit, Description, Price_unit_Factor'
      'From Price_Unit'
      'Order By Description')
    Left = 816
    Top = 316
  end
  object qryCheckPI: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select sum(Qty_Invoiced) as Qty_Invoiced'
      'from Supplier_Invoice_Line'
      'Where Purchase_Order = :Purchase_Order and'
      'Line = :Line and'
      'Supp_invoice_status >= 20')
    Left = 800
    Top = 224
    ParamData = <
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end>
  end
  object qryGetProdTypePriceUnit1: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'select Product_TypePrice_Unit.*, Price_Unit.Description, Price_U' +
        'nit_Factor'
      'from Product_TypePrice_Unit, Price_Unit'
      'where Product_Type = :Product_Type and'
      'Product_TypePrice_Unit.Price_Unit = Price_Unit.Price_Unit'
      'order by Price_Unit.Description')
    Left = 816
    Top = 376
    ParamData = <
      item
        Name = 'Product_Type'
      end>
  end
  object qryPartMvmnts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select   part_movement.Date_received,'
      '         part_store.Part_Store_Name,'
      '         part_movement.Part_Movement_Bin,'
      '         part_movement.Part_Store_Lot,'
      '         part_movement_type.Part_Move_Type_Descr,'
      '         part_movement.Part_Movement_Reference,'
      '         part_movement.Stock_Pack_Quantity,'
      '         (part_movement.Store_Quantity) as Store_Quantity,'
      '         part_movement.Store_cost,'
      '         part_movement.Part_Store_Total_Quantity,'
      '         part_movement.Audit_User'
      'from     part_movement,'
      '         part_movement_type,'
      '         part_store'
      
        'where    ((part_movement.part_movement_type = part_movement_type' +
        '.part_movement_type) and '
      
        '          (part_movement.part_movement_store = part_store.part_s' +
        'tore) and '
      '          (purchase_order = :purchase_order)) and'
      '          ('
      '          (Part_movement.Part_movement_type = '#39'J'#39') or'
      '          (Part_movement.Part_movement_type = '#39'A'#39') or'
      '          (Part_movement.Part_movement_type = '#39'B'#39') or'
      '          (Part_movement.Part_movement_type = '#39'D'#39') or'
      '          (Part_movement.Part_Movement_type = '#39'P'#39')'
      '          )'
      'order by date_received asc, Part_Movement'
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 816
    Top = 432
    ParamData = <
      item
        Name = 'purchase_order'
      end>
    object qryPartMvmntsDate_received: TDateTimeField
      FieldName = 'Date_received'
    end
    object qryPartMvmntsPart_Store_Name: TWideStringField
      FieldName = 'Part_Store_Name'
      FixedChar = True
      Size = 60
    end
    object qryPartMvmntsPart_Movement_Bin: TWideStringField
      FieldName = 'Part_Movement_Bin'
      FixedChar = True
    end
    object qryPartMvmntsPart_Store_Lot: TWideStringField
      FieldName = 'Part_Store_Lot'
      FixedChar = True
      Size = 40
    end
    object qryPartMvmntsPart_Move_Type_Descr: TWideStringField
      FieldName = 'Part_Move_Type_Descr'
      FixedChar = True
      Size = 40
    end
    object qryPartMvmntsPart_Movement_Reference: TWideStringField
      FieldName = 'Part_Movement_Reference'
      FixedChar = True
      Size = 60
    end
    object qryPartMvmntsStock_Pack_Quantity: TIntegerField
      FieldName = 'Stock_Pack_Quantity'
    end
    object qryPartMvmntsStore_Quantity: TIntegerField
      FieldName = 'Store_Quantity'
    end
    object qryPartMvmntsStore_cost: TCurrencyField
      FieldName = 'Store_cost'
    end
    object qryPartMvmntsPart_Store_Total_Quantity: TFloatField
      FieldName = 'Part_Store_Total_Quantity'
    end
    object qryPartMvmntsAudit_User: TWideStringField
      FieldName = 'Audit_User'
    end
  end
  object dtsrcPartMvmnts: TDataSource
    DataSet = qryPartMvmnts
    Left = 880
    Top = 432
  end
  object qryPartStoreBins: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select    Store_Stock.Part,'
      #9'         Part.Part_Description,'
      '          Part_Store.Part_Store_Name,'
      '          Store_Stock.Part_Bin,'
      '          Store_Stock.Part_Store_Lot,'
      '          Store_Stock.Store_Stock_Description,'
      #9'         sum(Store_Quantity) as Qty_in_Stock,'
      #9'         sum(Quantity_Allocated) as Qty_Allocated,'
      #9'         sum(Store_Quantity-Quantity_Allocated) as Free_Stock,'
      '         (select sum(purch_ord_line.quantity_ordered)'
      '                    from purch_ord_line'
      
        '                    where purch_ord_line.part = Store_Stock.Part' +
        ') AS Purchase_Order_Qty,'
      ' '#9'        (select sum(Delivery_detail.Qty_to_Deliver)'
      
        #9#9'             from Purchase_Orderline POLine, Delivery_Detail, ' +
        'Form_Reference'
      
        #9#9'             where Form_Reference.Form_Reference_ID = Store_St' +
        'ock.Part and'
      
        '                 POLine.form_reference = Form_reference.form_ref' +
        'erence and'
      #9#9'               POLine.purch_ord_line_Status = 20 and'
      
        '                 ((Delivery_detail.purchase_order = POLine.purch' +
        'ase_order) and'
      #9#9'               (Delivery_detail.Line = POLine.Line)) and'
      #9#9'               (Delivery_detail.delivery_to_Stock = '#39'Y'#39') and'
      
        #9'                (Delivery_Detail.Qty_Delivered = 0)) AS Product' +
        'ion_Order_Qty,'
      '         store_Stock.invoice_upfront,'
      '         store_stock.date_received,'
      '         store_stock.store_cost'
      'from     Part,'
      '         Store_Stock,'
      '         part_Store'
      'where    ((Store_Stock.part = part.part) and'
      '          (Store_Stock.Part_Store = Part_store.Part_Store) and'
      '          (Store_Stock.purchase_order = :Purchase_order))'
      'group by Store_Stock.part,'
      '         Part.Part_Description,'
      '         Part_Store.Part_Store_Name,'
      '         Store_Stock.Part_Bin,'
      '         Store_Stock.Part_Store_Lot,'
      '         Store_Stock.Store_Stock_Description,'
      '         store_Stock.invoice_upfront,'
      '         store_stock.date_received,'
      '         store_stock.store_cost'
      ''
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
    Left = 704
    Top = 488
    ParamData = <
      item
        Name = 'Purchase_order'
      end>
  end
  object dtsrcPartStoreBins: TDataSource
    DataSet = qryPartStoreBins
    Left = 792
    Top = 488
  end
  object qryGetTotalUsage: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select   sum(part_movement.Store_Quantity*-1) as Store_Quantity'
      'from     part_movement'
      'where    (purchase_order = :purchase_order) and'
      '          ('
      '          (Part_movement.Part_movement_type = '#39'J'#39') or'
      '          (Part_movement.Part_movement_type = '#39'A'#39') or'
      '          (Part_movement.Part_movement_type = '#39'B'#39') or'
      '          (Part_movement.Part_movement_type = '#39'D'#39') or'
      '          (Part_movement.Part_Movement_type = '#39'P'#39')'
      '          )')
    Left = 944
    Top = 432
    ParamData = <
      item
        Name = 'purchase_order'
      end>
  end
  object qryGetTotalStock: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select    sum(Store_Quantity-Quantity_Allocated) as Free_Stock'
      'from     Store_Stock'
      'where    (Store_Stock.purchase_order = :Purchase_order)'
      '')
    Left = 944
    Top = 488
    ParamData = <
      item
        Name = 'Purchase_order'
      end>
  end
  object qryUpdPOHist: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'insert into Purchase_OrderLineHistory'
      '('
      'Purchase_Order,'
      'Line,'
      'History_no,'
      'Operator,'
      'Date_Point,'
      'Supplier,'
      'Branch_No,'
      'Customer,'
      'Cust_Branch_no,'
      'Rep,'
      'Order_Price,'
      'Selling_Price,'
      'Quantity,'
      'Order_Unit,'
      'Sell_Unit,'
      'On_Hold,'
      'Invoice_Upfront,'
      'Goods_Required,'
      'Goods_Reqd_By_Customer,'
      'Product_Type'
      ')'
      'values'
      '('
      ':Purchase_Order,'
      ':Line,'
      ':History_no,'
      ':Operator,'
      ':Date_Point,'
      ':Supplier,'
      ':Branch_No,'
      ':Customer,'
      ':Cust_Branch_no,'
      ':Rep,'
      ':Order_Price,'
      ':Selling_Price,'
      ':Quantity,'
      ':Order_Unit,'
      ':Sell_Unit,'
      ':On_Hold,'
      ':Invoice_Upfront,'
      ':Goods_Required,'
      ':Goods_Reqd_By_Customer,'
      ':Product_Type'
      ')')
    Left = 928
    Top = 224
    ParamData = <
      item
        Name = 'Purchase_Order'
        DataType = ftFloat
      end
      item
        Name = 'Line'
        DataType = ftInteger
      end
      item
        Name = 'History_no'
        DataType = ftInteger
      end
      item
        Name = 'Operator'
        DataType = ftInteger
      end
      item
        Name = 'Date_Point'
        DataType = ftDateTime
      end
      item
        Name = 'Supplier'
        DataType = ftInteger
      end
      item
        Name = 'Branch_No'
        DataType = ftInteger
      end
      item
        Name = 'Customer'
        DataType = ftInteger
      end
      item
        Name = 'Cust_Branch_no'
        DataType = ftInteger
      end
      item
        Name = 'Rep'
        DataType = ftInteger
      end
      item
        Name = 'Order_Price'
        DataType = ftFloat
      end
      item
        Name = 'Selling_Price'
        DataType = ftFloat
      end
      item
        Name = 'Quantity'
        DataType = ftFloat
      end
      item
        Name = 'Order_Unit'
        DataType = ftInteger
      end
      item
        Name = 'Sell_Unit'
        DataType = ftInteger
      end
      item
        Name = 'On_Hold'
        DataType = ftString
      end
      item
        Name = 'Invoice_Upfront'
        DataType = ftString
      end
      item
        Name = 'Goods_Required'
        DataType = ftDateTime
      end
      item
        Name = 'Goods_Reqd_By_Customer'
        DataType = ftDateTime
      end
      item
        Name = 'Product_Type'
        DataType = ftInteger
      end>
  end
  object GetFldChgTypSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Audit_Type.Audit_Type,'
      '        AT2.Audit_Code_1_Field,'
      '        AT2.Audit_Code_2_Field,'
      '        AT2.Audit_Code_3_Field,'
      '        AT2.Audit_Code_4_Field,'
      '        AT2.Audit_Type_Descr'
      'From Audit_Type, Audit_Type AT2'
      
        'Where (Audit_Type.Audit_Type >= 10000) and (Audit_Type.Audit_Typ' +
        'e < 99999) and'
      '      (Audit_Type.Audit_Table_Name = :Audit_Table_Name) and'
      '      (Audit_Type.Audit_Code_1_Field = :Audit_Code_1_Field) and'
      '      (Audit_Type.Audit_Table_Name = AT2.Audit_Table_Name) and'
      '      (AT2.Audit_Type >= 2000) and (AT2.Audit_Type < 3000)'
      ''
      ' ')
    Left = 904
    Top = 16
    ParamData = <
      item
        Name = 'Audit_Table_Name'
      end
      item
        Name = 'Audit_Code_1_Field'
      end>
  end
  object qryGetLastPOHistory: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select max(History_No) as Last_POL_History'
      'from Purchase_OrderLineHistory'
      'where Purchase_Order = :Purchase_Order and '
      'Line = :Line')
    Left = 928
    Top = 304
    ParamData = <
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end>
  end
  object qryGetPOPriceHist: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select purchase_orderlinehistory.Date_point,'
      #9'purchase_orderlinehistory.Operator,'
      #9'Operator.Name as Operator_Name,'
      #9'purchase_orderlinehistory.Order_Price,'
      #9'purchase_orderlinehistory.Selling_Price,'
      #9'purchase_orderlinehistory.Quantity,'
      #9'purchase_orderlinehistory.Order_Unit,'
      #9'Order_Unit.Description as Order_Unit_Description,'
      #9'purchase_orderlinehistory.Sell_Unit,'
      #9'Sell_Unit.Description as Sell_Unit_Description,'
      '  purchase_orderlineHistory.Goods_Reqd_by_Customer,'
      '  purchase_orderlineHistory.Goods_Required,'
      '  purchase_orderlineHistory.On_Hold,'
      '  purchase_orderlineHistory.Invoice_upfront'
      
        'from purchase_orderlinehistory, Operator, Price_Unit Order_Unit,' +
        ' Price_Unit Sell_Unit'
      'where Purchase_Order = :Purchase_Order and'
      'Line = :Line and'
      'purchase_orderlinehistory.Operator = Operator.Operator and'
      'purchase_orderlinehistory.Order_Unit = Order_Unit.Price_Unit and'
      'purchase_orderlinehistory.Sell_Unit = Sell_Unit.Price_Unit'
      'ORDER BY History_no desc')
    Left = 904
    Top = 72
    ParamData = <
      item
        Name = 'Purchase_Order'
        DataType = ftFloat
      end
      item
        Name = 'Line'
        DataType = ftInteger
      end>
    object qryGetPOPriceHistDate_point: TDateTimeField
      FieldName = 'Date_point'
    end
    object qryGetPOPriceHistOperator: TIntegerField
      FieldName = 'Operator'
    end
    object qryGetPOPriceHistOperator_Name: TWideStringField
      FieldName = 'Operator_Name'
      FixedChar = True
      Size = 80
    end
    object qryGetPOPriceHistOrder_Price: TCurrencyField
      FieldName = 'Order_Price'
      DisplayFormat = '##0.000'
    end
    object qryGetPOPriceHistSelling_Price: TCurrencyField
      FieldName = 'Selling_Price'
      DisplayFormat = '##0.000'
    end
    object qryGetPOPriceHistQuantity: TFloatField
      FieldName = 'Quantity'
    end
    object qryGetPOPriceHistOrder_Unit: TIntegerField
      FieldName = 'Order_Unit'
    end
    object qryGetPOPriceHistOrder_Unit_Description: TWideStringField
      FieldName = 'Order_Unit_Description'
      FixedChar = True
      Size = 80
    end
    object qryGetPOPriceHistSell_Unit: TIntegerField
      FieldName = 'Sell_Unit'
    end
    object qryGetPOPriceHistSell_Unit_Description: TWideStringField
      FieldName = 'Sell_Unit_Description'
      FixedChar = True
      Size = 80
    end
    object qryGetPOPriceHistGoods_Reqd_by_Customer: TDateTimeField
      FieldName = 'Goods_Reqd_by_Customer'
    end
    object qryGetPOPriceHistGoods_Required: TDateTimeField
      FieldName = 'Goods_Required'
    end
    object qryGetPOPriceHistOn_Hold: TWideStringField
      FieldName = 'On_Hold'
      FixedChar = True
      Size = 2
    end
    object qryGetPOPriceHistInvoice_Upfront: TWideStringField
      FieldName = 'Invoice_Upfront'
      Size = 1
    end
  end
  object dtsGetPOPriceHist: TDataSource
    DataSet = qryGetPOPriceHist
    Left = 968
    Top = 72
  end
  object GetCompBrAddrSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select   Company.Name,'
      '         Company_Branch.Name as Branch_Name,'
      '         Company_Branch.Building_No_Name,'
      '         Company_Branch.Street,'
      '         Company_Branch.Locale,'
      '         Company_Branch.PostCode,'
      '         Company_Branch.Town,'
      '         Company_Branch.County,'
      '         Company_Branch.Delivery_Narrative'
      'From Company, Company_Branch'
      
        'Where (Company_Branch.Company = 1) and (Company_Branch.Company =' +
        ' 1 and Company_Branch.Branch_no = :Branch_no)')
    Left = 912
    Top = 136
    ParamData = <
      item
        Name = 'Branch_no'
      end>
  end
  object qryCompBranch: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Company_Branch'
      'where company = 1')
    Left = 808
    Top = 272
  end
  object UpdStoreStockSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'update Store_Stock'
      
        'set Invoice_upfront = :Invoice_upfront, Store_Cost = (Store_Quan' +
        'tity*:Unit_Cost)'
      'where Purchase_Order = :Purchase_Order')
    Left = 616
    Top = 520
    ParamData = <
      item
        Name = 'Invoice_upfront'
      end
      item
        Name = 'Unit_Cost'
      end
      item
        Name = 'Purchase_Order'
      end>
  end
  object qryGetPOProof: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select top 1 Proof_Status, Proof_Date'
      'from Proof_History'
      'where Purchase_order = :Purchase_Order and Line = :Line'
      'Order by Proof_History DESC')
    Left = 616
    Top = 464
    ParamData = <
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end>
  end
  object DelPOPriceHistorySQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From Purchase_OrderLineHistory'
      'Where (Purchase_Order = :Purchase_Order) and'
      '      ((Line = :Line) or (:Line = 0)) ')
    Left = 912
    Top = 184
    ParamData = <
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Line'
      end>
  end
  object qryFSCClaim: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from FSC_Material_Claim'
      'Order By Claim_Description')
    Left = 880
    Top = 368
  end
  object dtsFSCClaim: TDataSource
    DataSet = qryFSCClaim
    Left = 952
    Top = 368
  end
  object qryGetCustCC: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Customer_CostCentre'
      'where Customer = :Customer and '
      'Cost_centre = :Cost_Centre')
    Left = 864
    Top = 248
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Cost_Centre'
      end>
  end
  object qryGetBranchCC: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Customer_Branch_CostCentre'
      'where Customer = :Customer and'
      'Branch_no = :Branch_no and '
      'Cost_centre = :Cost_Centre')
    Left = 944
    Top = 272
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'Cost_Centre'
      end>
  end
  object qryGetFSCClaim: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from FSC_Material_Claim'
      'where FSC_Material_Claim = :FSC_Material_Claim')
    Left = 56
    Top = 504
    ParamData = <
      item
        Name = 'FSC_Material_Claim'
      end>
  end
  object qryCourierService: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'select Courier_Service.service_no, Courier_Service.courier, Cour' +
        'ier_Service.Service_Description, Courier.Courier_Name'
      'from Courier_Service, Courier'
      'where Courier_Service.Courier = :Courier and '
      'Courier_service.Courier = Courier.courier'
      'Order By Service_Description')
    Left = 272
    Top = 512
    ParamData = <
      item
        Name = 'Courier'
      end>
  end
  object qryPackageType: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Package_Type'
      'ORDER BY Package_Type_Descr')
    Left = 416
    Top = 512
  end
  object dtsCourierService: TDataSource
    DataSet = qryCourierService
    Left = 328
    Top = 520
  end
  object dtsPackageType: TDataSource
    DataSet = qryPackageType
    Left = 496
    Top = 512
  end
  object qryGetCustomerContact: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Customer_Contact.Name,'
      'Contact_info.Account_Number'
      'from Customer_Contact, Contact_Info'
      'where Customer_Contact.Customer = :Customer and'
      'Customer_Contact.Branch_no = :Branch_no and'
      'Contact_No = :Contact_No and'
      '(Customer_Contact.Contact_Info = Contact_Info.Contact_info)')
    Left = 944
    Top = 544
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'Contact_No'
      end>
  end
  object GetNCADetsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT '#9'Job_Bag_Non_Conform.Job_Bag_Non_Conform,'
      #9'Job_Bag_Non_Conform.Date_Point, '
      #9'Job_Bag_Non_Conform.Line, '
      #9'Job_Bag_Non_Conform.Job_Bag,'
      #9'Job_Bag_Non_Conform.Operator, '
      #9'Operator.Name as Operator_Name, '
      #9'Job_Bag_Non_Conform.Non_Conform_Category,'
      #9'(select Non_Conform_Category.Non_Conform_Category_Descr'
      '   from Non_Conform_Category'
      
        '   where Non_Conform_Category.Non_Conform_Category = Job_Bag_Non' +
        '_Conform.Non_Conform_Category) as Non_Conform_Category_Descr,'
      #9'Job_Bag_Non_Conform.Raised_By_Dept,'
      #9'Raised_By_Dept.Non_Conform_Dept_Descr as Raised_by_dept_Descr,'
      #9'Job_Bag_Non_Conform.Non_Conform_Dept,'
      #9'Non_Conform_Dept.Non_Conform_Dept_Descr,'
      #9'Job_Bag_Non_Conform.Non_Conform_Type,'
      #9'Non_Conform_Type.Non_Conform_Type_Descr,'
      #9'Job_Bag_Non_Conform.QA_Operator,'
      #9'QA_Operator.QA_Operator_Name,'
      #9'Job_Bag_Non_Conform.QA_Sign_Off_Date,'
      #9'Job_Bag_Non_Conform.Total_Cost,'
      '  Job_Bag_Non_Conform.Total_Cost_to_Client,'
      '  Job_Bag_Non_Conform.Inactive,'
      '  Job_Bag_Non_Conform.Inactive_Date,'
      #9'Job_Bag_Non_Conform.Non_Conform_Notes,'
      #9'Job_Bag_Non_Conform.Response_Notes_id,'
      #9'Job_Bag_Non_Conform.Corrective_Notes_id,'
      #9'Job_Bag_Non_Conform.Corrective_Notes,'
      #9'Job_Bag_Non_Conform.Preventative_Notes_id,'
      #9'Job_Bag_Non_Conform.Response_Date,'
      #9'Job_Bag_Non_Conform.Corrective_Date,'
      #9'Job_Bag_Non_Conform.Preventative_Date,'
      '  Job_Bag_Non_Conform.Non_Conform_Status,'
      
        '  Non_Conform_Status.Non_Conform_Status_Descr as Status_Descript' +
        'ion,'
      #9'Job_Bag_Non_Conform.Job_Reprinted,'
      '  Job_Bag_Non_Conform.Samples_Available'
      'FROM Non_Conform_Status'
      '  INNER JOIN (QA_Operator'
      '  RIGHT JOIN (Operator'
      '  INNER JOIN (Non_Conform_Type'
      '  INNER JOIN (Non_Conform_Dept AS Raised_By_Dept'
      '  RIGHT JOIN (Non_Conform_Dept'
      '  INNER JOIN Job_Bag_Non_Conform'
      
        '    ON Non_Conform_Dept.Non_Conform_Dept = Job_Bag_Non_Conform.N' +
        'on_Conform_Dept)'
      
        '    ON Raised_By_Dept.Non_Conform_Dept = Job_Bag_Non_Conform.Rai' +
        'sed_By_Dept)'
      
        '    ON Non_Conform_Type.Non_Conform_Type = Job_Bag_Non_Conform.N' +
        'on_Conform_Type)'
      '    ON Operator.Operator = Job_Bag_Non_Conform.Operator)'
      
        '    ON QA_Operator.QA_Operator = Job_Bag_Non_Conform.QA_Operator' +
        ')'
      
        '    ON Non_Conform_Status.Non_Conform_Status = Job_Bag_Non_Confo' +
        'rm.Non_Conform_Status'
      'WHERE Purchase_Order = :Purchase_Order'
      'ORDER BY Job_bag_Non_Conform')
    Left = 224
    Top = 568
    ParamData = <
      item
        Name = 'Purchase_Order'
      end>
  end
  object qryGetLastNC: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Last_Non_Conform_Number'
      'From Company'
      'Where Company = 1')
    Left = 128
    Top = 512
  end
  object qryUpdateLastNC: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Company'
      'Set Last_Non_Conform_Number = :Last_Non_Conform_Number'
      'Where Company = 1')
    Left = 208
    Top = 512
    ParamData = <
      item
        Name = 'Last_Non_Conform_Number'
      end>
  end
  object qryDeleteNCA: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from Job_Bag_Non_Conform'
      'where Purchase_Order = :Purchase_Order')
    Left = 56
    Top = 568
    ParamData = <
      item
        Name = 'Purchase_Order'
      end>
  end
  object qryAddNonConform: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert into Job_bag_Non_Conform'
      '(Job_Bag_Non_Conform,'
      'Date_Point,'
      'Job_Bag,'
      'Purchase_Order,'
      'Line,'
      'Operator,'
      'Raised_by_Dept,'
      'Non_Conform_Dept,'
      'Non_Conform_Type,'
      'QA_Operator,'
      'QA_Sign_Off_Date,'
      'Non_Conform_Notes,'
      'Response_Notes_id,'
      'Corrective_Notes_id,'
      'Preventative_notes_id,'
      'Response_Date,'
      'Corrective_Date,'
      'Preventative_Date,'
      'Total_Cost,'
      'Total_Cost_to_Client,'
      'Non_Conform_Status,'
      'Job_Reprinted,'
      'Samples_Available,'
      'Non_Conform_Category'
      ')'
      'Values'
      '('
      ':Job_Bag_Non_Conform,'
      ':Date_Point,'
      ':Job_Bag,'
      ':Purchase_Order,'
      ':Line,'
      ':Operator,'
      ':Raised_by_Dept,'
      ':Non_Conform_Dept,'
      ':Non_Conform_Type,'
      ':QA_Operator,'
      ':QA_Sign_Off_Date,'
      ':Non_Conform_Notes,'
      ':Response_Notes_id,'
      ':Corrective_Notes_id,'
      ':Preventative_notes_id,'
      ':Response_Date,'
      ':Corrective_Date,'
      ':Preventative_Date,'
      ':Total_Cost,'
      ':Total_Cost_to_Client,'
      ':Non_Conform_Status,'
      ':Job_Reprinted,'
      ':Samples_Available,'
      ':Non_Conform_Category'
      ')')
    Left = 136
    Top = 568
    ParamData = <
      item
        Name = 'Job_Bag_Non_Conform'
      end
      item
        Name = 'Date_Point'
      end
      item
        Name = 'Job_Bag'
        DataType = ftInteger
      end
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Operator'
      end
      item
        Name = 'Raised_by_Dept'
      end
      item
        Name = 'Non_Conform_Dept'
      end
      item
        Name = 'Non_Conform_Type'
      end
      item
        Name = 'QA_Operator'
        DataType = ftInteger
      end
      item
        Name = 'QA_Sign_Off_Date'
      end
      item
        Name = 'Non_Conform_Notes'
        DataType = ftInteger
      end
      item
        Name = 'Response_Notes_id'
        DataType = ftInteger
      end
      item
        Name = 'Corrective_Notes_id'
        DataType = ftInteger
      end
      item
        Name = 'Preventative_notes_id'
        DataType = ftInteger
      end
      item
        Name = 'Response_Date'
        DataType = ftDateTime
      end
      item
        Name = 'Corrective_Date'
        DataType = ftDateTime
      end
      item
        Name = 'Preventative_Date'
        DataType = ftDateTime
      end
      item
        Name = 'Total_Cost'
      end
      item
        Name = 'Total_Cost_to_Client'
      end
      item
        Name = 'Non_Conform_Status'
      end
      item
        Name = 'Job_Reprinted'
      end
      item
        Name = 'Samples_Available'
      end
      item
        Name = 'Non_Conform_Category'
        DataType = ftInteger
      end>
  end
  object qryGetProduct: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Part'
      'where part = :Part')
    Left = 56
    Top = 632
    ParamData = <
      item
        Name = 'Part'
      end>
  end
  object GetStockCodesSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Purchase_Order,'
      '       Line,'
      '       Stock_Code_No,'
      '       Purchase_OrderLineStockCode.Form_Reference,'
      '       Quantity_Ordered,'
      '       Quantity_Delivered,'
      '       Form_Reference.Form_Reference_ID,'
      '       Form_Reference.Form_Reference_Descr,'
      '       Form_Reference.Stock_Reference'
      'From Purchase_OrderLineStockCode, Form_Reference'
      'Where Purchase_Order = :Purchase_Order and'
      
        '      Purchase_OrderLineStockCode.Form_Reference = Form_Referenc' +
        'e.Form_Reference'
      'Order By Line, Stock_Code_No')
    Left = 504
    Top = 584
    ParamData = <
      item
        Name = 'Purchase_Order'
      end>
  end
  object DelPOStockCodesSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from Purchase_OrderLineStockCode'
      'where Purchase_Order = :Purchase_Order')
    Left = 616
    Top = 584
    ParamData = <
      item
        Name = 'Purchase_Order'
      end>
  end
  object qryAddStockCode: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'insert into Purchase_OrderLineStockCode'
      '('
      'Purchase_Order,'
      'Line,'
      'Stock_Code_No,'
      'Form_Reference,'
      'Quantity_Ordered,'
      'Quantity_Delivered'
      ')'
      'values '
      '('
      ':Purchase_Order,'
      ':Line,'
      ':Stock_Code_No,'
      ':Form_Reference,'
      ':Quantity_Ordered,'
      ':Quantity_Delivered'
      ')')
    Left = 712
    Top = 584
    ParamData = <
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Stock_Code_No'
      end
      item
        Name = 'Form_Reference'
      end
      item
        Name = 'Quantity_Ordered'
      end
      item
        Name = 'Quantity_Delivered'
      end>
  end
  object qryGetActiveSupplierContact: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'SELECT Supplier_BranchContacts.Supplier,'
      '        Supplier_BranchContacts.Branch_no,'
      '        Supplier_BranchContacts.Contact_no'
      'FROM Supplier_BranchContacts'
      'WHERE Supplier_BranchContacts.Supplier = :Supplier AND'
      '      Supplier_BranchContacts.Branch_no = :Branch_no AND'
      '      Supplier_BranchContacts.Contact_no = :Contact_no AND'
      '      ((inactive IS NULL) OR (inactive = '#39'N'#39'))')
    Left = 944
    Top = 600
    ParamData = <
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'Contact_no'
      end>
  end
  object UpdateContactStatusSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'UPDATE Customer_Contact'
      'SET Contact_Status = 100'
      'WHERE Customer = :Customer AND'
      '      Branch_No = :Branch_no AND'
      '      Contact_No = :Contact_No')
    Left = 224
    Top = 624
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'Contact_No'
      end>
  end
  object qryProofStatus: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT *'
      'FROM Proof_Status'
      'WHERE Proof_Status = :Proof_Status')
    Left = 800
    Top = 552
    ParamData = <
      item
        Name = 'Proof_Status'
      end>
  end
  object qryGetCustomerSubRep: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT TOP 1 reps_branches.Rep'
      'FROM Rep '
      #9'INNER JOIN reps_branches ON Rep.Rep = reps_branches.Rep'
      'WHERE ((Customer = :Customer) and (Branch_no = :Branch_no)) AND'
      '      (Rep.Rep_Is_Sub_Rep = '#39'Y'#39')')
    Left = 504
    Top = 632
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end>
  end
  object qryJBAddLine: TFDQuery
    FilterOptions = [foCaseInsensitive]
    ConnectionName = 'PB'
    SQL.Strings = (
      'INSERT INTO Job_Bag_Line_Dets'
      #9'(Job_Bag,Job_Bag_Line,Job_Bag_Line_Type,Purchase_Order,Line,'
      #9'Supplier,Branch_No,Job_Bag_Line_Descr,Job_Bag_Line_Cost,'
      #9'Job_Bag_Line_Sell,Job_Bag_Line_Invoiced,Job_Bag_Quantity,'
      
        #9'VAT_Code,Currency_Code, Product_Type, Sales_Order, Sales_Order_' +
        'line_no,'
      
        '  Works_order, Price_Unit, Process, Reseller_Price, Selling_Pric' +
        'e, Job_Bag_Line_Status, Sequence_no,'
      
        '  Qty_Invoiced, Ready_To_Invoice, Unit_Cost, Unit_SSP, Unit_Cost' +
        '_Plus_OHD, Unit_SSP_Original, Inactive, Quote, Quote_Line_no,'
      
        '  Job_Cost_Markup_Perc, Line_Is_Internal_Cost, Job_Bag_Line_Rese' +
        'ller)'
      'VALUES'
      
        #9'(:Job_Bag,:Job_Bag_Line,:Job_Bag_Line_Type,:Purchase_Order,:Lin' +
        'e,'
      #9':Supplier,:Branch_No,:Job_Bag_Line_Descr,:Job_Bag_Line_Cost,'
      #9':Job_Bag_Line_Sell,:Job_Bag_Line_Invoiced,:Job_Bag_Quantity,'
      
        #9':VAT_Code,:Currency_Code,:Product_Type, :Sales_Order, :Sales_Or' +
        'der_line_no,'
      
        '  :works_order, :Price_Unit, :Process, :Reseller_Price, :Selling' +
        '_Price, :Job_Bag_Line_Status, :Sequence_no,'
      
        '  :Qty_Invoiced, :Ready_To_Invoice, :Unit_Cost, :Unit_SSP, :Unit' +
        '_Cost_Plus_OHD, :Unit_SSP_Original, :Inactive, :Quote, :Quote_Li' +
        'ne_no,'
      
        '  :Job_Cost_Markup_Perc, :Line_Is_Internal_Cost, :Job_Bag_Line_R' +
        'eseller)'
      ''
      ' '
      ' '
      ' ')
    Left = 952
    Top = 664
    ParamData = <
      item
        Name = 'Job_Bag'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Job_Bag_Line'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Job_Bag_Line_Type'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Purchase_Order'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Line'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Supplier'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Branch_No'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Job_Bag_Line_Descr'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Job_Bag_Line_Cost'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Job_Bag_Line_Sell'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Job_Bag_Line_Invoiced'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Job_Bag_Quantity'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'VAT_Code'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Currency_Code'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Product_Type'
        DataType = ftInteger
      end
      item
        Name = 'Sales_Order'
        DataType = ftInteger
      end
      item
        Name = 'Sales_Order_line_no'
        DataType = ftInteger
      end
      item
        Name = 'works_order'
        DataType = ftInteger
      end
      item
        Name = 'Price_Unit'
        DataType = ftInteger
      end
      item
        Name = 'Process'
        DataType = ftInteger
      end
      item
        Name = 'Reseller_Price'
      end
      item
        Name = 'Selling_Price'
      end
      item
        Name = 'Job_Bag_Line_Status'
      end
      item
        Name = 'Sequence_no'
        DataType = ftInteger
      end
      item
        Name = 'Qty_Invoiced'
      end
      item
        Name = 'Ready_To_Invoice'
      end
      item
        Name = 'Unit_Cost'
      end
      item
        Name = 'Unit_SSP'
      end
      item
        Name = 'Unit_Cost_Plus_OHD'
      end
      item
        Name = 'Unit_SSP_Original'
      end
      item
        Name = 'Inactive'
      end
      item
        Name = 'Quote'
        DataType = ftFloat
      end
      item
        Name = 'Quote_Line_no'
        DataType = ftInteger
      end
      item
        Name = 'Job_Cost_Markup_Perc'
      end
      item
        Name = 'Line_Is_Internal_Cost'
      end
      item
        Name = 'Job_Bag_Line_Reseller'
      end>
  end
  object PriceUnitSRC2: TDataSource
    DataSet = GetPriceUnitSQL2
    Left = 744
    Top = 364
  end
  object GetPriceUnitSQL2: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Price_unit, Description, Price_unit_Factor'
      'From Price_Unit'
      'Order By Description')
    Left = 744
    Top = 316
  end
  object GetOrigPriceUnitSQL2: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Price_unit, Description, Price_unit_Factor'
      'From Price_Unit'
      'Order By Description')
    Left = 856
    Top = 316
  end
  object qryGetProdTypePriceUnit2: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'select Product_TypePrice_Unit.*, Price_Unit.Description, Price_U' +
        'nit_Factor'
      'from Product_TypePrice_Unit, Price_Unit'
      'where Product_Type = :Product_Type and'
      'Product_TypePrice_Unit.Price_Unit = Price_Unit.Price_Unit'
      'order by Price_Unit.Description')
    Left = 848
    Top = 376
    ParamData = <
      item
        Name = 'Product_Type'
      end>
  end
end
