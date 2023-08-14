object dtmdlImpSO: TdtmdlImpSO
  OnCreate = DataModuleCreate
  Height = 454
  Width = 748
  object qryAddSO: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Sales_Order'
      '  (Sales_Order,'
      '  Office_Contact,'
      '  Operator,'
      '  Date_Required,'
      '  Date_Ordered,'
      '  Cust_Order_No,'
      '  Customer,'
      '  Branch_No,'
      '  Cost_Centre,'
      '  Customer0,'
      '  Order_Type,'
      '  Sales_Order_Head_Status,'
      '  Narrative,'
      '  Contact_No,'
      '  Part_Store,'
      '  Delivery_Notes,'
      '  Delivery_Customer,'
      '  Delivery_Branch,'
      '  Replenish_Source,'
      '  Supplier,'
      '  Branch_no0,'
      '  Supp_Order_type,'
      '  Ad_Hoc_Address,'
      '  Delivery_Contact_Name)'
      'values'
      '  (:Sales_Order,'
      '  :Office_Contact,'
      '  :Operator,'
      '  :Date_Reqd,'
      '  :Date_Ordrd,'
      '  :Cust_Order_no,'
      '  :Customer,'
      '  :Branch_No,'
      '  :Cost_Centre,'
      '  :Customer0,'
      '  :Order_Type,'
      '  :Sales_Order_Head_Status,'
      '  :Narrative,'
      '  :Contact_No,'
      '  :Part_Store,'
      '  :Delivery_Notes,'
      '  :Delivery_Customer,'
      '  :Delivery_Branch,'
      '  :Replenish_Source,'
      '  :Supplier,'
      '  :Branch_no0,'
      '  :Supp_Order_type,'
      '  :Ad_Hoc_Address,'
      '  :Delivery_Contact_Name)'
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 24
    Top = 8
    ParamData = <
      item
        Name = 'Sales_Order'
        DataType = ftInteger
      end
      item
        Name = 'Office_Contact'
        DataType = ftInteger
      end
      item
        Name = 'Operator'
        DataType = ftInteger
      end
      item
        Name = 'Date_Reqd'
        DataType = ftDateTime
      end
      item
        Name = 'Date_Ordrd'
        DataType = ftDateTime
      end
      item
        Name = 'Cust_Order_no'
        DataType = ftString
      end
      item
        Name = 'Customer'
        DataType = ftInteger
      end
      item
        Name = 'Branch_No'
        DataType = ftInteger
      end
      item
        Name = 'Cost_Centre'
        DataType = ftString
      end
      item
        Name = 'Customer0'
        DataType = ftInteger
      end
      item
        Name = 'Order_Type'
        DataType = ftString
      end
      item
        Name = 'Sales_Order_Head_Status'
        DataType = ftInteger
      end
      item
        Name = 'Narrative'
        DataType = ftInteger
      end
      item
        Name = 'Contact_No'
        DataType = ftInteger
      end
      item
        Name = 'Part_Store'
        DataType = ftInteger
      end
      item
        Name = 'Delivery_Notes'
        DataType = ftString
      end
      item
        Name = 'Delivery_Customer'
        DataType = ftInteger
      end
      item
        Name = 'Delivery_Branch'
        DataType = ftInteger
      end
      item
        Name = 'Replenish_Source'
        DataType = ftInteger
      end
      item
        Name = 'Supplier'
        DataType = ftInteger
      end
      item
        Name = 'Branch_no0'
        DataType = ftInteger
      end
      item
        Name = 'Supp_Order_type'
        DataType = ftString
      end
      item
        Name = 'Ad_Hoc_Address'
        DataType = ftInteger
      end
      item
        Name = 'Delivery_Contact_Name'
      end>
  end
  object qryCompany: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select In_Use_By from Company Where Company = 1'
      ' ')
    Left = 232
    Top = 8
  end
  object GetLastSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Last_SO_Number, Last_Invoice_No'
      'From Company'
      'Where Company = 1'
      ' ')
    Left = 168
    Top = 8
  end
  object UpdLastSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Company'
      'Set Last_SO_Number = :Last_SO_Number'
      'Where Company = 1'
      ' ')
    Left = 104
    Top = 8
    ParamData = <
      item
        Name = 'Last_SO_Number'
      end>
  end
  object qryAddSORep: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Sales_OrderRep'
      '(Sales_Order, Rep, Rep_Percentage)'
      'Values'
      '(:Sales_Order, :Rep, :Rep_Percentage)'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 24
    Top = 64
    ParamData = <
      item
        Name = 'Sales_Order'
      end
      item
        Name = 'Rep'
      end
      item
        Name = 'Rep_Percentage'
      end>
  end
  object qryChkCostCentre: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * '
      'from Customer_CostCentre'
      'where Customer = :Customer and'
      'Cost_Centre = :Cost_Centre')
    Left = 312
    Top = 8
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Cost_Centre'
      end>
  end
  object qryAddCostCentre: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'insert into Customer_CostCentre'
      '(Customer,'
      'Cost_Centre,'
      'Description)'
      'values'
      '(:Customer,'
      ':Cost_Centre,'
      ':Description)')
    Left = 384
    Top = 8
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Cost_Centre'
      end
      item
        Name = 'Description'
      end>
  end
  object qryGetCustRep: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select top 1 Rep'
      'from Reps_Branches'
      'where Customer = :Customer and'
      'Branch_no = :Branch_no')
    Left = 104
    Top = 64
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end>
  end
  object qryGetCustContact: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Contact_no'
      'from Customer_Contact'
      'where Customer = :Customer and'
      'Branch_no = :Branch_no and'
      'Name = :Name')
    Left = 200
    Top = 64
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'Name'
      end>
  end
  object qryGetBranch: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Branch_no'
      'from Customer_Branch'
      'where Customer = :Customer and'
      'Short_Code = :Short_Code')
    Left = 288
    Top = 64
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Short_Code'
      end>
  end
  object qryAddSOLine: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Sales_Order_Line'
      
        '(Sales_Order, Sales_Order_Line_No, Part, Part_Cost, Purch_pack_q' +
        'uantity, Part_Sales_Price, Sell_Pack_Quantity,'
      
        '  Quantity_Ordered, Quantity_Allocated, Quantity_Delivered, Cont' +
        'ract,'
      '  Contract_Line_No, Sales_Order_Line_Status, Quantity_Invoiced,'
      '  Discount_Type, Discount_Value, Vat_Code, Original_Sell_Price,'
      '  Markup_Type, Markup_Value)'
      'Values'
      
        '(:Sales_Order, :Line, :Part, :Part_Cost, :Purch_pack_quantity, :' +
        'Part_Sales_Price, :Sell_Pack_Quantity,'
      
        '  :Quantity_Ordered, :Quantity_Allocated, :Quantity_Delivered, :' +
        'Contract,'
      
        '  :Contract_Line_No, :Sales_Order_Line_Status, :Quantity_Invoice' +
        'd,'
      '  :Discount_Type,'
      '  :Discount_Value,'
      '  :Vat_Code,'
      '  :Original_Sell_Price,'
      '  :Markup_Type, :Markup_Value)')
    Left = 24
    Top = 120
    ParamData = <
      item
        Name = 'Sales_Order'
        DataType = ftInteger
      end
      item
        Name = 'Line'
        DataType = ftInteger
      end
      item
        Name = 'Part'
        DataType = ftString
      end
      item
        Name = 'Part_Cost'
        DataType = ftFloat
      end
      item
        Name = 'Purch_pack_quantity'
        DataType = ftInteger
      end
      item
        Name = 'Part_Sales_Price'
        DataType = ftFloat
      end
      item
        Name = 'Sell_Pack_Quantity'
        DataType = ftInteger
      end
      item
        Name = 'Quantity_Ordered'
        DataType = ftInteger
      end
      item
        Name = 'Quantity_Allocated'
        DataType = ftInteger
      end
      item
        Name = 'Quantity_Delivered'
        DataType = ftInteger
      end
      item
        Name = 'Contract'
        DataType = ftInteger
      end
      item
        Name = 'Contract_Line_No'
        DataType = ftInteger
      end
      item
        Name = 'Sales_Order_Line_Status'
        DataType = ftInteger
      end
      item
        Name = 'Quantity_Invoiced'
        DataType = ftInteger
      end
      item
        Name = 'Discount_Type'
        DataType = ftString
      end
      item
        Name = 'Discount_Value'
        DataType = ftFloat
      end
      item
        Name = 'Vat_Code'
        DataType = ftInteger
      end
      item
        Name = 'Original_Sell_Price'
        DataType = ftFloat
      end
      item
        Name = 'Markup_Type'
        DataType = ftString
      end
      item
        Name = 'Markup_Value'
        DataType = ftFloat
      end>
  end
  object qryGetPart: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from Part'
      'where Part = :Part')
    Left = 104
    Top = 120
    ParamData = <
      item
        Name = 'Part'
      end>
  end
  object qryAddCustContact: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Customer_Contact'
      '        (Customer,'
      '        Branch_No,'
      '        Contact_No,'
      '        Name,'
      '        Contact_Type)'
      'Values'
      '(:Customer, '
      ':Branch_No, '
      ':Contact_No, '
      ':Name, '
      '1)')
    Left = 200
    Top = 120
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_No'
      end
      item
        Name = 'Contact_No'
      end
      item
        Name = 'Name'
      end>
  end
  object qryLastCustContact: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select max(Contact_no) as Last_Contact'
      'from Customer_Contact'
      'where customer = :customer and'
      'Branch_no = :Branch_no')
    Left = 200
    Top = 176
    ParamData = <
      item
        Name = 'customer'
      end
      item
        Name = 'Branch_no'
      end>
  end
  object qryCustomer: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Product_Code_prefix'
      'from Customer'
      'where customer = :customer')
    Left = 288
    Top = 120
    ParamData = <
      item
        Name = 'customer'
      end>
  end
  object qryAuditSession: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select max(Audit_Number) as Last_session'
      'from Transfer_Audit')
    Left = 384
    Top = 64
  end
  object qryAddError: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'insert into Transfer_Audit'
      '(Transfer_Audit,'
      'Audit_Number,'
      'Operator,'
      'Date_Started,'
      'Date_Time_Entered,'
      'Transfer_Type,'
      'Error_Code,'
      'Audit_code_1_field,'
      'Audit_code_2_field,'
      'Audit_code_3_field,'
      'Audit_code_4_field)'
      'select max(isnull(Transfer_Audit,0))+1,'
      ':Audit_Number,'
      ':Operator,'
      ':Date_Started,'
      ':Date_Time_Entered,'
      ':Transfer_Type,'
      ':Error_Code,'
      ':Audit_code_1_field,'
      ':Audit_code_2_field,'
      ':Audit_code_3_field,'
      ':Audit_code_4_field'
      'from Transfer_Audit')
    Left = 384
    Top = 112
    ParamData = <
      item
        Name = 'Audit_Number'
      end
      item
        Name = 'Operator'
      end
      item
        Name = 'Date_Started'
      end
      item
        Name = 'Date_Time_Entered'
      end
      item
        Name = 'Transfer_Type'
      end
      item
        Name = 'Error_Code'
      end
      item
        Name = 'Audit_code_1_field'
      end
      item
        Name = 'Audit_code_2_field'
      end
      item
        Name = 'Audit_code_3_field'
      end
      item
        Name = 'Audit_code_4_field'
      end>
  end
  object qryDeleteSOL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from sales_order_line'
      'where sales_order = :Sales_Order')
    Left = 24
    Top = 240
    ParamData = <
      item
        Name = 'Sales_Order'
      end>
  end
  object qryDeleteSO: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from Sales_order'
      'where Sales_order = :Sales_Order')
    Left = 24
    Top = 288
    ParamData = <
      item
        Name = 'Sales_Order'
      end>
  end
  object qryDeleteSORep: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from Sales_OrderRep'
      'where Sales_Order = :Sales_Order')
    Left = 24
    Top = 336
    ParamData = <
      item
        Name = 'Sales_Order'
      end>
  end
  object qryGetConsumer: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select top 1 Web_Users.Consumer_ID,'
      #9'Web_Users.Web_User_ID,'
      #9'customer_contact.name,'
      #9'customer_contact.contact_no,'
      #9'customer.customer,'
      #9'customer_branch.branch_no,'
      '  Customer_Contact.Name as Contact_Name'
      'from Web_Users, Customer_contact, customer_branch, customer'
      'where Web_Users.Consumer_ID = :consumer_id and'
      '  customer.consumer_code = :consumer_code and'
      '  Web_users.web_user_id = customer_contact.web_user_id and'
      '  Customer_contact.customer = customer_branch.customer and'
      '  customer_contact.branch_no = customer_branch.branch_no and'
      '  customer_contact.customer = customer.customer')
    Left = 512
    Top = 8
    ParamData = <
      item
        Name = 'Consumer_ID'
      end
      item
        Name = 'Consumer_Code'
      end>
  end
  object qryGetDelBranch: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Branch_no'
      'from Customer_Branch'
      'where Customer = :Customer and'
      'PostCode = :PostCode')
    Left = 512
    Top = 64
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'PostCode'
      end>
  end
  object qryLastBranch: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select max(Branch_no) as Last_Branch'
      'from Customer_Branch'
      'where customer = :customer')
    Left = 608
    Top = 8
    ParamData = <
      item
        Name = 'customer'
      end>
  end
  object qryAddBranch: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Customer_Branch'
      '        (Customer,'
      '        Branch_No,'
      '        Name,'
      '        Building_no_Name,'
      '        Street,'
      '        Locale,'
      '        Town,'
      '        Postcode,'
      '        Phone,'
      '        Inv_to_customer,'
      '        Inv_to_branch)'
      'Values'
      '(:Customer,'
      '        :Branch_No,'
      '        :Name,'
      '        :Building_no_Name,'
      '        :Street,'
      '        :Locale,'
      '        :Town,'
      '        :Postcode,'
      '        :Phone,'
      '        :Inv_to_customer,'
      '        :Inv_to_branch)'
      '')
    Left = 688
    Top = 8
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_No'
      end
      item
        Name = 'Name'
      end
      item
        Name = 'Building_no_Name'
      end
      item
        Name = 'Street'
      end
      item
        Name = 'Locale'
      end
      item
        Name = 'Town'
      end
      item
        Name = 'Postcode'
      end
      item
        Name = 'Phone'
      end
      item
        Name = 'Inv_to_customer'
      end
      item
        Name = 'Inv_to_branch'
      end>
  end
  object qryGetPartDisc: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Customer_Discount'
      'where (part = :Part and'
      'customer = :customer and'
      'supplier = :supplier and'
      '((:effective_date > Customer_Discount.date_effective) and'
      '(:effective_date < Customer_Discount.date_ineffective)))'
      'or'
      '(part = :Part and'
      'customer = :customer and'
      'supplier = :supplier and'
      '((:effective_date > Customer_Discount.date_effective) and'
      '(customer_discount.date_ineffective is NULL)))'
      'ORDER BY Customer_Discount.date_effective desc')
    Left = 200
    Top = 264
    ParamData = <
      item
        Name = 'Part'
      end
      item
        Name = 'customer'
      end
      item
        Name = 'supplier'
      end
      item
        Name = 'effective_date'
      end
      item
        Name = 'effective_date'
      end
      item
        Name = 'Part'
      end
      item
        Name = 'customer'
      end
      item
        Name = 'supplier'
      end
      item
        Name = 'effective_date'
      end>
  end
  object qryGetSuppCharges: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Supplier_Charge'
      'Where Supplier = :Supplier')
    Left = 384
    Top = 176
    ParamData = <
      item
        Name = 'Supplier'
      end>
  end
  object qryAddSOCharge: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'insert into Sales_Order_Add_Charge'
      
        '(Sales_Order,Additional_Charge,Details,Amount,Nominal,Vat_Code,C' +
        'ost)'
      'Values'
      
        '(:Sales_Order,:Additional_Charge,:Details,:Amount,:Nominal,:Vat_' +
        'Code,:Cost)')
    Left = 24
    Top = 184
    ParamData = <
      item
        Name = 'Sales_Order'
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
        Name = 'Nominal'
      end
      item
        Name = 'Vat_Code'
      end
      item
        Name = 'Cost'
      end>
  end
end
