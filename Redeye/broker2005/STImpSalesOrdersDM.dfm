object dtmdlImpSO: TdtmdlImpSO
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 61
  Top = 102
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
        DataType = ftInteger
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Office_Contact'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Operator'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Date_Reqd'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Date_Ordrd'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Cust_Order_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Branch_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Cost_Centre'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Customer0'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Order_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Sales_Order_Head_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Narrative'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Contact_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Part_Store'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Delivery_Notes'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Delivery_Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Delivery_Branch'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Replenish_Source'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Branch_no0'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Supp_Order_type'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Ad_Hoc_Address'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Delivery_Contact_Name'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Last_SO_Number'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Rep'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Rep_Percentage'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Cost_Centre'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Cost_Centre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Description'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Name'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Short_Code'
        ParamType = ptUnknown
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
        DataType = ftInteger
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Line'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Part'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Part_Cost'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Purch_pack_quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Part_Sales_Price'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Sell_Pack_Quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Quantity_Ordered'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Quantity_Allocated'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Quantity_Delivered'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Contract'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Contract_Line_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Sales_Order_Line_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Quantity_Invoiced'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Discount_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Discount_Value'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Vat_Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Original_Sell_Price'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Markup_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Markup_Value'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Part'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contact_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Name'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_no'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'customer'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Audit_Number'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Operator'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_Started'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_Time_Entered'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Transfer_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Error_Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Audit_code_1_field'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Audit_code_2_field'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Audit_code_3_field'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Audit_code_4_field'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Consumer_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Consumer_Code'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PostCode'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'customer'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Building_no_Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Street'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Locale'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Town'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Postcode'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Phone'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Inv_to_customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Inv_to_branch'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Part'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'effective_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'effective_date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'effective_date'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
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
        DataType = ftUnknown
        Name = 'Sales_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Additional_Charge'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Details'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Amount'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Nominal'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Vat_Code'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Cost'
        ParamType = ptUnknown
      end>
  end
end
