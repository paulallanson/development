object PBRDPORepDataMod: TPBRDPORepDataMod
  Height = 563
  Width = 741
  object GetPOsSeq00SQL: TFDQuery
    AfterCancel = GetPOsSeq00SQLAfterCancel
    ConnectionName = 'PB'
    SQL.Strings = (
      'select distinct  Supplier.Name, Purchase_Order.Date_Point,'
      
        '       Purchase_OrderLine.Purchase_Order, Purchase_OrderLine.Lin' +
        'e,'
      
        '       Purchase_OrderLine.Order_Price, Purchase_OrderLine.Sellin' +
        'g_Price,'
      
        '       Purchase_OrderLine.Goods_Required, Purchase_OrderLine.Lis' +
        't_Price,'
      '       Purch_Ord_Line_Status.Description as Purch_Stat_Desc,'
      
        '       Purchase_OrderLine.Quantity, Product_Type.Description as ' +
        'Prod_Type_Desc,'
      '       Purchase_OrderLine.Cust_Order_no,'
      
        '       Customer.Name as Cust_Name, Purchase_OrderLine.Customers_' +
        'Desc,'
      '       Customer_Contact.Name as Contact_Name,'
      '       Supplier.Name as Supplier_Name,'
      '       Price_Unit.Price_Unit_Factor as Order_Unit_Factor,'
      '       (select Price_Unit_Factor from Price_Unit'
      
        '               where Price_Unit = Purchase_OrderLine.Sell_Unit) ' +
        'as Sell_Unit_Factor,'
      '       Rep.Name as Rep_Name,'
      '       (select top 1 Job_Bag'
      '       from Job_Bag_Line_Dets'
      
        '       where Job_Bag_Line_Dets.Purchase_Order = Purchase_OrderLi' +
        'ne.Purchase_Order and'
      
        '            Job_Bag_Line_Dets.Line = Purchase_OrderLine.Line) as' +
        ' Job_Bag,'
      '       Operator.Name as Operator_Name,'
      '       Account_Manager.Name as Account_Manager_Name'
      
        'FROM Supplier_Branch, Purchase_OrderLine, Purchase_Order, Purch_' +
        'Ord_Line_Status,'
      
        '     Product_Type, Customer_Branch, Customer, Supplier, Price_Un' +
        'it, Rep, Customer_Contact, Operator, Operator as Account_Manager'
      'WHERE (Purchase_Order.Date_Point >= :Date_From ) and'
      '      (Purchase_Order.Date_Point <= :Date_To ) and'
      '      (Operator.Operator = Purchase_Order.Operator) AND'
      
        '      (Purchase_Order.Office_Contact = Account_Manager.Operator)' +
        ' and'
      '      (Supplier_Branch.Branch_no = Purchase_Order.Branch_no) AND'
      '      (Supplier_Branch.Supplier = Purchase_Order.Supplier) AND'
      
        '      ((Customer_Branch.Customer = Purchase_OrderLine.Customer) ' +
        'AND'
      
        '      (Customer_Branch.Branch_No = Purchase_OrderLine.Branch_No)' +
        ') AND'
      
        '      ((Customer_Contact.Customer = Purchase_OrderLine.Customer)' +
        ' AND'
      
        '      (Customer_Contact.Branch_No = Purchase_OrderLine.Branch_No' +
        ') AND'
      
        '      (Customer_Contact.Contact_No = Purchase_OrderLine.Contact_' +
        'No)) AND'
      
        '      (Purchase_Order.Purchase_Order = Purchase_OrderLine.Purcha' +
        'se_Order) AND'
      
        '      (Purch_Ord_Line_Status.Purch_Ord_Line_Status = Purchase_Or' +
        'derLine.Purch_Ord_Line_Status) AND'
      
        '      (Product_Type.Product_Type = Purchase_OrderLine.Product_Ty' +
        'pe) AND'
      '     (((Supplier_Branch.Supplier = :Supplier) AND'
      '               (Supplier_Branch.Branch_no = :Branch_No )) OR'
      '       (:Supplier = 0)) and'
      '     (((Customer_Branch.Customer = :Customer) AND'
      
        '               ((Customer_Branch.Branch_no = :Cust_Branch_No ) o' +
        'r (:Cust_Branch_No = 0 ))) OR'
      '       (:Customer = 0)) and'
      '       (Supplier.Supplier = Supplier_Branch.Supplier) and'
      '       (Customer.Customer = Customer_Branch.Customer) and'
      
        '       (Price_Unit.Price_Unit = Purchase_OrderLine.Order_Unit) a' +
        'nd'
      '       (Rep.Rep = Purchase_OrderLine.Rep)'
      '')
    Left = 40
    Top = 19
    ParamData = <
      item
        Name = 'Date_From'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'Date_To'
        DataType = ftDateTime
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
        Name = 'Supplier'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Cust_Branch_No'
      end
      item
        Name = 'Cust_Branch_No'
      end
      item
        Name = 'Customer'
      end>
  end
  object GetPOsSeq30SQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'select distinct  Rep.Name, Rep.Name as Rep_Name, Purchase_Order.' +
        'Date_Point,'
      
        '       Purchase_OrderLine.Purchase_Order, Purchase_OrderLine.Lin' +
        'e,'
      
        '       Purchase_OrderLine.Order_Price, Purchase_OrderLine.Sellin' +
        'g_Price,'
      
        '       Purchase_OrderLine.Goods_Required, Purchase_OrderLine.Lis' +
        't_Price,'
      '       Purch_Ord_Line_Status.Description as Purch_Stat_Desc,'
      
        '       Purchase_OrderLine.Quantity, Product_Type.Description as ' +
        'Prod_Type_Desc,'
      '       Purchase_OrderLine.Cust_Order_no,'
      
        '       Customer.Name as Cust_Name, Purchase_OrderLine.Customers_' +
        'Desc,'
      '       Customer_Contact.Name as Contact_Name,'
      '       Supplier.Name as Supplier_Name,'
      '       Price_Unit.Price_Unit_Factor as Order_Unit_Factor,'
      '       (select Price_Unit_Factor from Price_Unit'
      
        '               where Price_Unit = Purchase_OrderLine.Sell_Unit) ' +
        'as Sell_Unit_Factor,'
      '       (select top 1 Job_Bag'
      '       from Job_Bag_Line_Dets'
      
        '       where Job_Bag_Line_Dets.Purchase_Order = Purchase_OrderLi' +
        'ne.Purchase_Order and'
      
        '            Job_Bag_Line_Dets.Line = Purchase_OrderLine.Line) as' +
        ' Job_Bag,'
      '       Operator.Name as Operator_Name,'
      '       Account_Manager.Name as Account_Manager_Name'
      'FROM Purchase_OrderLine, Purchase_Order, Purch_Ord_Line_Status,'
      
        '     Product_Type, Rep, Supplier_Branch, Customer_Branch, Custom' +
        'er, Customer_Contact,'
      '     Price_Unit, Supplier, Operator, Operator as Account_Manager'
      'WHERE (Purchase_Order.Date_Point >= :Date_From ) and'
      '      (Purchase_Order.Date_Point <= :Date_To ) and'
      '      (Purchase_Order.Operator = Operator.Operator) and'
      
        '      (Purchase_Order.Office_Contact = Account_Manager.Operator)' +
        ' and'
      '      (Rep.Rep = Purchase_OrderLine.Rep) AND'
      '      (Supplier_Branch.Branch_no = Purchase_Order.Branch_no) and'
      '      (Supplier_Branch.Supplier = Purchase_Order.Supplier) and'
      '      (Supplier.Supplier = Purchase_Order.Supplier) and'
      
        '      ((Customer_Branch.Customer = Purchase_OrderLine.Customer) ' +
        'AND'
      
        '      (Customer_Branch.Branch_No = Purchase_OrderLine.Branch_No)' +
        ') AND'
      
        '      ((Customer_Contact.Customer = Purchase_OrderLine.Customer)' +
        ' AND'
      
        '      (Customer_Contact.Branch_No = Purchase_OrderLine.Branch_No' +
        ') AND'
      
        '      (Customer_Contact.Contact_No = Purchase_OrderLine.Contact_' +
        'No)) AND'
      
        '      (Purchase_Order.Purchase_Order = Purchase_OrderLine.Purcha' +
        'se_Order) AND'
      
        '      (Purch_Ord_Line_Status.Purch_Ord_Line_Status = Purchase_Or' +
        'derLine.Purch_Ord_Line_Status) AND'
      
        '      (Product_Type.Product_Type = Purchase_OrderLine.Product_Ty' +
        'pe) AND'
      '     (((Supplier_Branch.Supplier = :Supplier) AND'
      '               (Supplier_Branch.Branch_no = :Branch_No )) OR'
      '       (:Supplier = 0)) and'
      '     (((Customer_Branch.Customer = :Customer) AND'
      
        '                ((Customer_Branch.Branch_no = :Cust_Branch_No ) ' +
        'or (:Cust_Branch_No = 0 ))) OR'
      '       (:Customer = 0)) and'
      '       (Customer.Customer = Customer_Branch.Customer) and'
      '       (Price_Unit.Price_Unit = Purchase_OrderLine.Order_Unit)'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 48
    Top = 211
    ParamData = <
      item
        Name = 'Date_From'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'Date_To'
        DataType = ftDateTime
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
        Name = 'Supplier'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Cust_Branch_No'
      end
      item
        Name = 'Cust_Branch_No'
      end
      item
        Name = 'Customer'
      end>
  end
  object GetPosSeq20SQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'select distinct  Customer.Name as Cust_Name, Purchase_Order.Date' +
        '_Point,'
      
        '       Purchase_OrderLine.Purchase_Order, Purchase_OrderLine.Lin' +
        'e,'
      
        '       Purchase_OrderLine.Order_Price, Purchase_OrderLine.Sellin' +
        'g_Price,'
      
        '       Purchase_OrderLine.Goods_Required, Purchase_OrderLine.Lis' +
        't_Price,'
      '       Purch_Ord_Line_Status.Description as Purch_Stat_Desc,'
      
        '       Purchase_OrderLine.Quantity, Product_Type.Description as ' +
        'Prod_Type_Desc,'
      '       Purchase_OrderLine.Cust_Order_no,'
      '       Purchase_OrderLine.Customers_Desc, Customer.Name,'
      '       Customer_Branch.Name as Branch_Name,'
      '       Customer_Contact.Name as Contact_Name,'
      '       Supplier.Name as Supplier_Name,'
      '       Price_Unit.Price_Unit_Factor as Order_Unit_Factor,'
      '       (select Price_Unit_Factor from Price_Unit'
      
        '               where Price_Unit = Purchase_OrderLine.Sell_Unit) ' +
        'as Sell_Unit_Factor,'
      '       Rep.Name as Rep_Name,'
      '       (select top 1 Job_Bag'
      '       from Job_Bag_Line_Dets'
      
        '       where Job_Bag_Line_Dets.Purchase_Order = Purchase_OrderLi' +
        'ne.Purchase_Order and'
      
        '            Job_Bag_Line_Dets.Line = Purchase_OrderLine.Line) as' +
        ' Job_Bag,'
      '       Operator.Name as Operator_Name,'
      '       Account_Manager.Name as Account_Manager_Name'
      
        'FROM Supplier_Branch, Purchase_OrderLine, Purchase_Order, Purch_' +
        'Ord_Line_Status,'
      
        '     Product_Type, Customer_Branch, Customer, Price_Unit, Suppli' +
        'er, Rep, Customer_Contact, Operator, Operator as Account_Manager'
      'WHERE (Purchase_Order.Date_Point >= :Date_From ) and'
      '      (Purchase_Order.Date_Point <= :Date_To ) and'
      '      (Purchase_Order.Operator = Operator.Operator) and'
      
        '      (Purchase_Order.Office_Contact = Account_Manager.Operator)' +
        ' and'
      '      (Supplier_Branch.Branch_no = Purchase_Order.Branch_no) AND'
      '      (Supplier_Branch.Supplier = Purchase_Order.Supplier) AND'
      '      (Supplier.Supplier = Purchase_Order.Supplier) AND'
      
        '      ((Customer_Branch.Customer = Purchase_OrderLine.Customer) ' +
        'AND'
      
        '      (Customer_Branch.Branch_No = Purchase_OrderLine.Branch_No)' +
        ') AND'
      
        '      ((Customer_Contact.Customer = Purchase_OrderLine.Customer)' +
        ' AND'
      
        '      (Customer_Contact.Branch_No = Purchase_OrderLine.Branch_No' +
        ') AND'
      
        '      (Customer_Contact.Contact_No = Purchase_OrderLine.Contact_' +
        'No)) AND'
      
        '      (Purchase_Order.Purchase_Order = Purchase_OrderLine.Purcha' +
        'se_Order) AND'
      
        '      (Purch_Ord_Line_Status.Purch_Ord_Line_Status = Purchase_Or' +
        'derLine.Purch_Ord_Line_Status) AND'
      
        '      (Product_Type.Product_Type = Purchase_OrderLine.Product_Ty' +
        'pe) AND'
      '     (((Supplier_Branch.Supplier = :Supplier) AND'
      '               (Supplier_Branch.Branch_no = :Branch_No )) OR'
      '       (:Supplier = 0)) and'
      '     (((Customer_Branch.Customer = :Customer) AND'
      
        '               ((Customer_Branch.Branch_no = :Cust_Branch_No ) o' +
        'r (:Cust_Branch_No = 0))) OR'
      '       (:Customer = 0)) and'
      '       (Customer.Customer = Customer_Branch.Customer) and'
      
        '       (Price_Unit.Price_Unit = Purchase_OrderLine.Order_Unit) a' +
        'nd'
      '       (Rep.Rep = Purchase_OrderLine.Rep)'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 48
    Top = 147
    ParamData = <
      item
        Name = 'Date_From'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'Date_To'
        DataType = ftDateTime
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
        Name = 'Supplier'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Cust_Branch_No'
      end
      item
        Name = 'Cust_Branch_No'
      end
      item
        Name = 'Customer'
      end>
  end
  object GetPOsSeq50SQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select distinct  Supplier.Name, Purchase_Order.Date_Point,'
      
        '       Purchase_OrderLine.Purchase_Order, Purchase_OrderLine.Lin' +
        'e,'
      
        '       Purchase_OrderLine.Order_Price, Purchase_OrderLine.Sellin' +
        'g_Price,'
      
        '       Purchase_OrderLine.Goods_Required, Purchase_OrderLine.Lis' +
        't_Price,'
      '       Purch_Ord_Line_Status.Description as Purch_Stat_Desc,'
      
        '       Purchase_OrderLine.Quantity, Customer_Type.Description as' +
        ' Cust_Type_Desc,'
      '       Purchase_OrderLine.Cust_Order_no,'
      '       Product_Type.Description as Prod_Type_Desc,'
      
        '       Customer.Name as Cust_Name, Purchase_OrderLine.Customers_' +
        'Desc,'
      '       Customer_Contact.Name as Contact_Name,'
      '       Supplier.Name as Supplier_Name,'
      '       Price_Unit.Price_Unit_Factor as Order_Unit_Factor,'
      '       (select Price_Unit_Factor from Price_Unit'
      
        '               where Price_Unit = Purchase_OrderLine.Sell_Unit) ' +
        'as Sell_Unit_Factor,'
      '       Rep.Name as Rep_Name,'
      '       (select top 1 Job_Bag'
      '       from Job_Bag_Line_Dets'
      
        '       where Job_Bag_Line_Dets.Purchase_Order = Purchase_OrderLi' +
        'ne.Purchase_Order and'
      
        '            Job_Bag_Line_Dets.Line = Purchase_OrderLine.Line) as' +
        ' Job_Bag,'
      '       Operator.Name as Operator_Name,'
      '       Account_Manager.Name as Account_Manager_Name'
      
        'FROM Supplier_Branch, Purchase_OrderLine, Purchase_Order, Purch_' +
        'Ord_Line_Status,'
      
        '     Customer_Type, Customer, Customer_Branch, Supplier, Price_U' +
        'nit, Rep, Customer_Contact, Product_Type, Operator, Operator as ' +
        'Account_Manager'
      'WHERE (Purchase_Order.Date_Point >= :Date_From ) and'
      '      (Purchase_Order.Date_Point <= :Date_To ) and'
      '      (Purchase_Order.Operator = Operator.Operator) and'
      
        '      (Purchase_Order.Office_Contact = Account_Manager.Operator)' +
        ' and'
      '      (Supplier_Branch.Branch_no = Purchase_Order.Branch_no) AND'
      '      (Supplier_Branch.Supplier = Purchase_Order.Supplier) AND'
      '      (Customer.Customer = Purchase_OrderLine.Customer) AND'
      
        '      ((Customer_Branch.Customer = Purchase_OrderLine.Customer) ' +
        'AND'
      
        '      (Customer_Branch.Branch_No = Purchase_OrderLine.Branch_No)' +
        ') AND'
      
        '      ((Customer_Contact.Customer = Purchase_OrderLine.Customer)' +
        ' AND'
      
        '      (Customer_Contact.Branch_No = Purchase_OrderLine.Branch_No' +
        ') AND'
      
        '      (Customer_Contact.Contact_No = Purchase_OrderLine.Contact_' +
        'No)) AND'
      
        '      (Purchase_Order.Purchase_Order = Purchase_OrderLine.Purcha' +
        'se_Order) AND'
      
        '      (Purch_Ord_Line_Status.Purch_Ord_Line_Status = Purchase_Or' +
        'derLine.Purch_Ord_Line_Status) AND'
      
        '      (Product_Type.Product_Type = Purchase_OrderLine.Product_Ty' +
        'pe) AND'
      '      (Customer_Type.Customer_Type = Customer.Customer_Type) AND'
      '     (((Supplier_Branch.Supplier = :Supplier) AND'
      '               (Supplier_Branch.Branch_no = :Branch_No )) OR'
      '       (:Supplier = 0)) and'
      '     (((Customer_Branch.Customer = :Customer) AND'
      
        '               ((Customer_Branch.Branch_no = :Cust_Branch_No ) o' +
        'r (:Cust_Branch_No = 0 ))) OR'
      '       (:Customer = 0)) and'
      '       (Supplier.Supplier = Supplier_Branch.Supplier ) and'
      
        '       (Price_Unit.Price_Unit = Purchase_OrderLine.Order_Unit) a' +
        'nd'
      '       (Rep.Rep = Purchase_OrderLine.Rep)'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 48
    Top = 339
    ParamData = <
      item
        Name = 'Date_From'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'Date_To'
        DataType = ftDateTime
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
        Name = 'Supplier'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Cust_Branch_No'
      end
      item
        Name = 'Cust_Branch_No'
      end
      item
        Name = 'Customer'
      end>
  end
  object GetPosSeq40SQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'select distinct  Operator.Name, Operator.Name as Operator_Name, ' +
        'Purchase_Order.Date_Point,'
      
        '       Purchase_OrderLine.Purchase_Order, Purchase_OrderLine.Lin' +
        'e,'
      
        '       Purchase_OrderLine.Order_Price, Purchase_OrderLine.Sellin' +
        'g_Price,'
      
        '       Purchase_OrderLine.Goods_Required, Purchase_OrderLine.Lis' +
        't_Price,'
      '       Purch_Ord_Line_Status.Description as Purch_Stat_Desc,'
      
        '       Purchase_OrderLine.Quantity, Product_Type.Description as ' +
        'Prod_Type_Desc,'
      '       Purchase_OrderLine.Cust_Order_no,'
      
        '       Customer.Name as Cust_Name, Purchase_OrderLine.Customers_' +
        'Desc,'
      '       Customer_Contact.Name as Contact_Name,'
      '       Supplier.Name as Supplier_Name,'
      '       Price_Unit.Price_Unit_Factor as Order_Unit_Factor,'
      '       (select Price_Unit_Factor from Price_Unit'
      
        '               where Price_Unit = Purchase_OrderLine.Sell_Unit) ' +
        'as Sell_Unit_Factor,'
      '       Rep.Name as Rep_Name,'
      '       (select top 1 Job_Bag'
      '       from Job_Bag_Line_Dets'
      
        '       where Job_Bag_Line_Dets.Purchase_Order = Purchase_OrderLi' +
        'ne.Purchase_Order and'
      
        '            Job_Bag_Line_Dets.Line = Purchase_OrderLine.Line) as' +
        ' Job_Bag,'
      '       Account_Manager.Name as Account_Manager_Name'
      
        'FROM Purchase_OrderLine, Purchase_Order, Purch_Ord_Line_Status, ' +
        'Supplier,'
      
        '     Product_Type, Supplier_Branch, Operator, Customer_Branch, P' +
        'rice_Unit, Customer, Rep, Customer_Contact, Operator as Account_' +
        'Manager'
      'WHERE (Purchase_Order.Date_Point >= :Date_From ) and'
      '      (Purchase_Order.Date_Point <= :Date_To ) and'
      '      (Purchase_Order.Operator = Operator.Operator) AND'
      
        '      (Purchase_Order.Office_Contact = Account_Manager.Operator)' +
        ' and'
      
        '      ((Customer_Branch.Customer = Purchase_OrderLine.Customer) ' +
        'AND'
      
        '      (Customer_Branch.Branch_No = Purchase_OrderLine.Branch_No)' +
        ') AND'
      
        '      ((Customer_Contact.Customer = Purchase_OrderLine.Customer)' +
        ' AND'
      
        '      (Customer_Contact.Branch_No = Purchase_OrderLine.Branch_No' +
        ') AND'
      
        '      (Customer_Contact.Contact_No = Purchase_OrderLine.Contact_' +
        'No)) AND'
      '      (Supplier_Branch.Branch_no = Purchase_Order.Branch_no) and'
      '      (Supplier_Branch.Supplier = Purchase_Order.Supplier) and'
      '      (Supplier.Supplier = Purchase_Order.Supplier) and'
      
        '      (Purchase_Order.Purchase_Order = Purchase_OrderLine.Purcha' +
        'se_Order) AND'
      
        '      (Purch_Ord_Line_Status.Purch_Ord_Line_Status = Purchase_Or' +
        'derLine.Purch_Ord_Line_Status) AND'
      
        '      (Product_Type.Product_Type = Purchase_OrderLine.Product_Ty' +
        'pe) AND'
      '     (((Supplier_Branch.Supplier = :Supplier) AND'
      '               (Supplier_Branch.Branch_no = :Branch_No )) OR'
      '       (:Supplier = 0)) and'
      '     (((Customer_Branch.Customer = :Customer) AND'
      
        '                ((Customer_Branch.Branch_no = :Cust_Branch_No ) ' +
        'or (:Cust_Branch_No = 0 ))) OR'
      '       (:Customer = 0)) and'
      '       (Customer.Customer = Customer_Branch.Customer)and'
      
        '       (Price_Unit.Price_Unit = Purchase_OrderLine.Order_Unit) a' +
        'nd'
      '       (Rep.Rep = Purchase_OrderLine.Rep)'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 48
    Top = 283
    ParamData = <
      item
        Name = 'Date_From'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'Date_To'
        DataType = ftDateTime
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
        Name = 'Supplier'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Cust_Branch_No'
      end
      item
        Name = 'Cust_Branch_No'
      end
      item
        Name = 'Customer'
      end>
  end
  object GetPOsSeq41SQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'select distinct  Operator.Name, Operator.Name as Operator_Name, ' +
        'Purchase_Order.Date_Point,'
      
        '       Purchase_OrderLine.Purchase_Order, Purchase_OrderLine.Lin' +
        'e,'
      
        '       Purchase_OrderLine.Order_Price, Purchase_OrderLine.Sellin' +
        'g_Price,'
      
        '       Purchase_OrderLine.Goods_Required, Purchase_OrderLine.Lis' +
        't_Price,'
      '       Purch_Ord_Line_Status.Description as Purch_Stat_Desc,'
      
        '       Purchase_OrderLine.Quantity, Product_Type.Description as ' +
        'Prod_Type_Desc,'
      '       Purchase_OrderLine.Cust_Order_no,'
      
        '       Customer.Name as Cust_Name, Purchase_OrderLine.Customers_' +
        'Desc,'
      '       Customer_Contact.Name as Contact_Name,'
      '       Supplier.Name as Supplier_Name,'
      '       Price_Unit.Price_Unit_Factor as Order_Unit_Factor,'
      '       (select Price_Unit_Factor from Price_Unit'
      
        '               where Price_Unit = Purchase_OrderLine.Sell_Unit) ' +
        'as Sell_Unit_Factor,'
      '       Rep.Name as Rep_Name,'
      '       (select top 1 Job_Bag'
      '       from Job_Bag_Line_Dets'
      
        '       where Job_Bag_Line_Dets.Purchase_Order = Purchase_OrderLi' +
        'ne.Purchase_Order and'
      
        '            Job_Bag_Line_Dets.Line = Purchase_OrderLine.Line) as' +
        ' Job_Bag,'
      '       Account_Manager.Name as Account_Manager_Name'
      'FROM Purchase_OrderLine, Purchase_Order, Purch_Ord_Line_Status,'
      
        '     Product_Type, Supplier_Branch, Operator, Customer_Branch, C' +
        'ustomer, Customer_Contact,'
      '     Price_Unit, Supplier, Rep, Operator as Account_Manager'
      'WHERE (Purchase_Order.Date_Point >= :Date_From ) and'
      '      (Purchase_Order.Date_Point <= :Date_To ) and'
      '      (Purchase_Order.Operator = Operator.Operator) AND'
      
        '      (Purchase_Order.Office_Contact = Account_Manager.Operator)' +
        ' and'
      
        '      ((Customer_Branch.Customer = Purchase_OrderLine.Customer) ' +
        'AND'
      
        '      (Customer_Branch.Branch_No = Purchase_OrderLine.Branch_No)' +
        ') AND'
      
        '      ((Customer_Contact.Customer = Purchase_OrderLine.Customer)' +
        ' AND'
      
        '      (Customer_Contact.Branch_No = Purchase_OrderLine.Branch_No' +
        ') AND'
      
        '      (Customer_Contact.Contact_No = Purchase_OrderLine.Contact_' +
        'No)) AND'
      '      (Supplier_Branch.Branch_no = Purchase_Order.Branch_no) and'
      '      (Supplier_Branch.Supplier = Purchase_Order.Supplier) and'
      '      (Supplier.Supplier = Purchase_Order.Supplier) and'
      
        '      (Purchase_Order.Purchase_Order = Purchase_OrderLine.Purcha' +
        'se_Order) AND'
      
        '      (Purch_Ord_Line_Status.Purch_Ord_Line_Status = Purchase_Or' +
        'derLine.Purch_Ord_Line_Status) AND'
      
        '      (Product_Type.Product_Type = Purchase_OrderLine.Product_Ty' +
        'pe) AND'
      '     (((Supplier_Branch.Supplier = :Supplier) AND'
      '               (Supplier_Branch.Branch_no = :Branch_No )) OR'
      '       (:Supplier = 0)) and'
      '     (((Customer_Branch.Customer = :Customer) AND'
      
        '                ((Customer_Branch.Branch_no = :Cust_Branch_No ) ' +
        'or (:Cust_Branch_No = 0 ))) OR'
      '       (:Customer = 0)) and'
      '       (Customer.Customer = Customer_Branch.Customer) and'
      
        '       (Price_Unit.Price_Unit = Purchase_OrderLine.Order_Unit) a' +
        'nd'
      '       (Rep.Rep = Purchase_OrderLine.Rep)'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 152
    Top = 283
    ParamData = <
      item
        Name = 'Date_From'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'Date_To'
        DataType = ftDateTime
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
        Name = 'Supplier'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Cust_Branch_No'
      end
      item
        Name = 'Cust_Branch_No'
      end
      item
        Name = 'Customer'
      end>
  end
  object GetPosSeq11SQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select distinct  Supplier.Name, Purchase_Order.Date_Point,'
      
        '       Purchase_OrderLine.Purchase_Order, Purchase_OrderLine.Lin' +
        'e,'
      
        '       Purchase_OrderLine.Order_Price, Purchase_OrderLine.Sellin' +
        'g_Price,'
      
        '       Purchase_OrderLine.Goods_Required, Purchase_OrderLine.Lis' +
        't_Price,'
      '       Purch_Ord_Line_Status.Description as Purch_Stat_Desc,'
      
        '       Purchase_OrderLine.Quantity, Product_Type.Description as ' +
        'Prod_Type_Desc,'
      '       Purchase_OrderLine.Cust_Order_no,'
      
        '       Customer.Name as Cust_Name, Purchase_OrderLine.Customers_' +
        'Desc,'
      '       Customer_Contact.Name as Contact_Name,'
      '       Supplier_Branch.Name,'
      '       Supplier.Name as Supplier_Name,'
      '       Price_Unit.Price_Unit_Factor as Order_Unit_Factor,'
      '       (select Price_Unit_Factor from Price_Unit'
      
        '               where Price_Unit = Purchase_OrderLine.Sell_Unit) ' +
        'as Sell_Unit_Factor,'
      '       Rep.Name as Rep_Name,'
      '       (select top 1 Job_Bag'
      '       from Job_Bag_Line_Dets'
      
        '       where Job_Bag_Line_Dets.Purchase_Order = Purchase_OrderLi' +
        'ne.Purchase_Order and'
      
        '            Job_Bag_Line_Dets.Line = Purchase_OrderLine.Line) as' +
        ' Job_Bag,'
      '       Operator.Name as Operator_Name,'
      '       Account_Manager.Name as Account_Manager_Name'
      
        'FROM Supplier_Branch, Purchase_OrderLine, Purchase_Order, Purch_' +
        'Ord_Line_Status,'
      
        '     Product_Type, Customer_Branch, Customer, Supplier, Price_Un' +
        'it, Rep, Customer_Contact, Operator, Operator as Account_Manager'
      'WHERE (Purchase_Order.Date_Point >= :Date_From ) and'
      '      (Purchase_Order.Date_Point <= :Date_To ) and'
      '      (Purchase_Order.Operator = Operator.Operator) and'
      
        '      (Purchase_Order.Office_Contact = Account_Manager.Operator)' +
        ' and'
      '      (Supplier_Branch.Branch_no = Purchase_Order.Branch_no) AND'
      '      (Supplier_Branch.Supplier = Purchase_Order.Supplier) AND'
      
        '      ((Customer_Branch.Customer = Purchase_OrderLine.Customer) ' +
        'AND'
      
        '      (Customer_Branch.Branch_No = Purchase_OrderLine.Branch_No)' +
        ') AND'
      
        '      ((Customer_Contact.Customer = Purchase_OrderLine.Customer)' +
        ' AND'
      
        '      (Customer_Contact.Branch_No = Purchase_OrderLine.Branch_No' +
        ') AND'
      
        '      (Customer_Contact.Contact_No = Purchase_OrderLine.Contact_' +
        'No)) AND'
      
        '      (Purchase_Order.Purchase_Order = Purchase_OrderLine.Purcha' +
        'se_Order) AND'
      
        '      (Purch_Ord_Line_Status.Purch_Ord_Line_Status = Purchase_Or' +
        'derLine.Purch_Ord_Line_Status) AND'
      
        '      (Product_Type.Product_Type = Purchase_OrderLine.Product_Ty' +
        'pe) AND'
      '     (((Supplier_Branch.Supplier = :Supplier) AND'
      '               (Supplier_Branch.Branch_no = :Branch_No )) OR'
      '       (:Supplier = 0)) and'
      '     (((Customer_Branch.Customer = :Customer) AND'
      
        '               ((Customer_Branch.Branch_no = :Cust_Branch_No ) o' +
        'r (:Cust_Branch_No = 0 ))) OR'
      '       (:Customer = 0)) and'
      '       (Supplier.Supplier = Supplier_Branch.Supplier) and'
      '       (Customer.Customer = Customer_Branch.Customer) and'
      
        '       (Price_Unit.Price_Unit = Purchase_OrderLine.Order_Unit) a' +
        'nd'
      '       (Rep.Rep = Purchase_OrderLine.Rep)'
      ' ')
    Left = 152
    Top = 75
    ParamData = <
      item
        Name = 'Date_From'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'Date_To'
        DataType = ftDateTime
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
        Name = 'Supplier'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Cust_Branch_No'
      end
      item
        Name = 'Cust_Branch_No'
      end
      item
        Name = 'Customer'
      end>
  end
  object GetPOsSeq10SQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select distinct  Supplier.Name, Purchase_Order.Date_Point,'
      
        '       Purchase_OrderLine.Purchase_Order, Purchase_OrderLine.Lin' +
        'e,'
      
        '       Purchase_OrderLine.Order_Price, Purchase_OrderLine.Sellin' +
        'g_Price,'
      
        '       Purchase_OrderLine.Goods_Required, Purchase_OrderLine.Lis' +
        't_Price,'
      '       Purch_Ord_Line_Status.Description as Purch_Stat_Desc,'
      
        '       Purchase_OrderLine.Quantity, Product_Type.Description as ' +
        'Prod_Type_Desc,'
      '       Purchase_OrderLine.Cust_Order_no,'
      
        '       Customer.Name as Cust_Name, Purchase_OrderLine.Customers_' +
        'Desc,'
      '       Customer_Contact.Name as Contact_Name,'
      '       Supplier.Name as Supplier_Name,'
      '       Supplier_Branch.name,'
      '       Price_Unit.Price_Unit_Factor as Order_Unit_Factor,'
      '       (select Price_Unit_Factor from Price_Unit'
      
        '               where Price_Unit = Purchase_OrderLine.Sell_Unit) ' +
        'as Sell_Unit_Factor,'
      '       Rep.Name as Rep_Name,'
      '       (select top 1 Job_Bag'
      '       from Job_Bag_Line_Dets'
      
        '       where Job_Bag_Line_Dets.Purchase_Order = Purchase_OrderLi' +
        'ne.Purchase_Order and'
      
        '            Job_Bag_Line_Dets.Line = Purchase_OrderLine.Line) as' +
        ' Job_Bag,'
      '       Operator.Name as Operator_Name,'
      '       Account_Manager.Name as Account_Manager_Name'
      
        'FROM Supplier_Branch, Purchase_OrderLine, Purchase_Order, Purch_' +
        'Ord_Line_Status,'
      
        '     Product_Type, Customer_Branch, Customer, Supplier, Price_Un' +
        'it, Rep, Customer_Contact, Operator, Operator as Account_Manager'
      'WHERE (Purchase_Order.Date_Point >= :Date_From ) and'
      '      (Purchase_Order.Date_Point <= :Date_To ) and'
      '      (Purchase_Order.Operator = Operator.Operator) and'
      
        '      (Purchase_Order.Office_Contact = Account_Manager.Operator)' +
        ' and'
      '      (Supplier_Branch.Branch_no = Purchase_Order.Branch_no) AND'
      '      (Supplier_Branch.Supplier = Purchase_Order.Supplier) AND'
      
        '      ((Customer_Branch.Customer = Purchase_OrderLine.Customer) ' +
        'AND'
      
        '      (Customer_Branch.Branch_No = Purchase_OrderLine.Branch_No)' +
        ') AND'
      
        '      ((Customer_Contact.Customer = Purchase_OrderLine.Customer)' +
        ' AND'
      
        '      (Customer_Contact.Branch_No = Purchase_OrderLine.Branch_No' +
        ') AND'
      
        '      (Customer_Contact.Contact_No = Purchase_OrderLine.Contact_' +
        'No)) AND'
      
        '      (Purchase_Order.Purchase_Order = Purchase_OrderLine.Purcha' +
        'se_Order) AND'
      
        '      (Purch_Ord_Line_Status.Purch_Ord_Line_Status = Purchase_Or' +
        'derLine.Purch_Ord_Line_Status) AND'
      
        '      (Product_Type.Product_Type = Purchase_OrderLine.Product_Ty' +
        'pe) AND'
      '     (((Supplier_Branch.Supplier = :Supplier) AND'
      '               (Supplier_Branch.Branch_no = :Branch_No )) OR'
      '       (:Supplier = 0)) and'
      '     (((Customer_Branch.Customer = :Customer) AND'
      
        '               ((Customer_Branch.Branch_no = :Cust_Branch_No ) o' +
        'r (:Cust_Branch_No = 0 ))) OR'
      '       (:Customer = 0)) and'
      '       (Supplier.Supplier = Supplier_Branch.Supplier) and'
      '       (Customer.Customer = Customer_Branch.Customer) and'
      
        '       (Price_Unit.Price_Unit = Purchase_OrderLine.Order_Unit) a' +
        'nd'
      '       (Rep.Rep = Purchase_OrderLine.Rep)'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 40
    Top = 75
    ParamData = <
      item
        Name = 'Date_From'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'Date_To'
        DataType = ftDateTime
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
        Name = 'Supplier'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Cust_Branch_No'
      end
      item
        Name = 'Cust_Branch_No'
      end
      item
        Name = 'Customer'
      end>
  end
  object GetPOsSeq02SQL: TFDQuery
    AfterCancel = GetPOsSeq00SQLAfterCancel
    ConnectionName = 'PB'
    SQL.Strings = (
      'select distinct  Supplier.Name, Purchase_Order.Date_Point,'
      
        '       Purchase_OrderLine.Purchase_Order, Purchase_OrderLine.Lin' +
        'e,'
      
        '       Purchase_OrderLine.Order_Price, Purchase_OrderLine.Sellin' +
        'g_Price,'
      
        '       Purchase_OrderLine.Goods_Required, Purchase_OrderLine.Lis' +
        't_Price,'
      '       Purch_Ord_Line_Status.Description as Purch_Stat_Desc,'
      
        '       Purchase_OrderLine.Quantity, Product_Type.Description as ' +
        'Prod_Type_Desc,'
      '       Purchase_OrderLine.Cust_Order_no,'
      
        '       Customer.Name as Cust_Name, Purchase_OrderLine.Customers_' +
        'Desc,'
      '       Customer_Contact.Name as Contact_Name,'
      '       Supplier.Name as Supplier_Name,'
      '       Purchase_OrderLine.Form_Reference,'
      '       Price_Unit.Price_Unit_Factor as Order_Unit_Factor,'
      '       (select Price_Unit_Factor from Price_Unit'
      
        '               where Price_Unit = Purchase_OrderLine.Sell_Unit) ' +
        'as Sell_Unit_Factor,'
      '       Rep.Name as Rep_Name,'
      '       (select top 1 Job_Bag'
      '       from Job_Bag_Line_Dets'
      
        '       where Job_Bag_Line_Dets.Purchase_Order = Purchase_OrderLi' +
        'ne.Purchase_Order and'
      
        '            Job_Bag_Line_Dets.Line = Purchase_OrderLine.Line) as' +
        ' Job_Bag,'
      '       Operator.Name as Operator_Name,'
      '       Account_Manager.Name as Account_Manager_Name'
      
        'FROM Supplier_Branch, Purchase_OrderLine, Purchase_Order, Purch_' +
        'Ord_Line_Status,'
      
        '     Product_Type, Customer_Branch, Customer, Supplier, Price_Un' +
        'it, Rep, Customer_Contact, Operator, Operator as Account_Manager'
      'WHERE (Purchase_Order.Date_Point >= :Date_From ) and'
      '      (Purchase_Order.Date_Point <= :Date_To ) and'
      '      (Operator.Operator = Purchase_Order.Operator) AND'
      
        '      (Purchase_Order.Office_Contact = Account_Manager.Operator)' +
        ' and'
      '      (Supplier_Branch.Branch_no = Purchase_Order.Branch_no) AND'
      '      (Supplier_Branch.Supplier = Purchase_Order.Supplier) AND'
      
        '      ((Customer_Branch.Customer = Purchase_OrderLine.Customer) ' +
        'AND'
      
        '      (Customer_Branch.Branch_No = Purchase_OrderLine.Branch_No)' +
        ') AND'
      
        '      ((Customer_Contact.Customer = Purchase_OrderLine.Customer)' +
        ' AND'
      
        '      (Customer_Contact.Branch_No = Purchase_OrderLine.Branch_No' +
        ') AND'
      
        '      (Customer_Contact.Contact_No = Purchase_OrderLine.Contact_' +
        'No)) AND'
      
        '      (Purchase_Order.Purchase_Order = Purchase_OrderLine.Purcha' +
        'se_Order) AND'
      
        '      (Purch_Ord_Line_Status.Purch_Ord_Line_Status = Purchase_Or' +
        'derLine.Purch_Ord_Line_Status) AND'
      
        '      (Product_Type.Product_Type = Purchase_OrderLine.Product_Ty' +
        'pe) AND'
      '     (((Supplier_Branch.Supplier = :Supplier) AND'
      '               (Supplier_Branch.Branch_no = :Branch_No )) OR'
      '       (:Supplier = 0)) and'
      '     (((Customer_Branch.Customer = :Customer) AND'
      
        '                ((Customer_Branch.Branch_no = :Cust_Branch_No ) ' +
        'or (:Cust_Branch_No = 0 ))) OR'
      '       (:Customer = 0)) and'
      '       (Supplier.Supplier = Supplier_Branch.Supplier) and'
      '       (Customer.Customer = Customer_Branch.Customer) and'
      
        '       (Price_Unit.Price_Unit = Purchase_OrderLine.Order_Unit) a' +
        'nd'
      '       (Rep.Rep = Purchase_OrderLine.Rep)'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 280
    Top = 19
    ParamData = <
      item
        Name = 'Date_From'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'Date_To'
        DataType = ftDateTime
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
        Name = 'Supplier'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Cust_Branch_No'
      end
      item
        Name = 'Cust_Branch_No'
      end
      item
        Name = 'Customer'
      end>
  end
  object GetPOsSeq01SQL: TFDQuery
    AfterCancel = GetPOsSeq00SQLAfterCancel
    ConnectionName = 'PB'
    SQL.Strings = (
      'select distinct  Supplier.Name, Purchase_Order.Date_Point,'
      
        '       Purchase_OrderLine.Purchase_Order, Purchase_OrderLine.Lin' +
        'e,'
      
        '       Purchase_OrderLine.Order_Price, Purchase_OrderLine.Sellin' +
        'g_Price,'
      
        '       Purchase_OrderLine.Goods_Required, Purchase_OrderLine.Lis' +
        't_Price,'
      '       Purch_Ord_Line_Status.Description as Purch_Stat_Desc,'
      
        '       Purchase_OrderLine.Quantity, Product_Type.Description as ' +
        'Prod_Type_Desc,'
      '       Purchase_OrderLine.Cust_Order_no,'
      
        '       Customer.Name as Cust_Name, Purchase_OrderLine.Customers_' +
        'Desc,'
      '       Customer_Contact.Name as Contact_Name,'
      '       Supplier.Name as Supplier_Name,'
      '       Price_Unit.Price_Unit_Factor as Order_Unit_Factor,'
      '       (select Price_Unit_Factor from Price_Unit'
      
        '               where Price_Unit = Purchase_OrderLine.Sell_Unit) ' +
        'as Sell_Unit_Factor,'
      '       Rep.Name as Rep_Name,'
      '       (select top 1 Job_Bag'
      '       from Job_Bag_Line_Dets'
      
        '       where Job_Bag_Line_Dets.Purchase_Order = Purchase_OrderLi' +
        'ne.Purchase_Order and'
      
        '            Job_Bag_Line_Dets.Line = Purchase_OrderLine.Line) as' +
        ' Job_Bag,'
      '       Operator.Name as Operator_Name,'
      '       Account_Manager.Name as Account_Manager_Name'
      
        'FROM Supplier_Branch, Purchase_OrderLine, Purchase_Order, Purch_' +
        'Ord_Line_Status,'
      
        '     Product_Type, Customer_Branch, Customer, Supplier, Price_Un' +
        'it, Rep, Customer_Contact, Operator, Operator as Account_Manager'
      'WHERE (Purchase_Order.Date_Point >= :Date_From ) and'
      '      (Purchase_Order.Date_Point <= :Date_To ) and'
      '      (Operator.Operator = Purchase_Order.Operator) AND'
      
        '      (Purchase_Order.Office_Contact = Account_Manager.Operator)' +
        ' and'
      '      (Supplier_Branch.Branch_no = Purchase_Order.Branch_no) AND'
      '      (Supplier_Branch.Supplier = Purchase_Order.Supplier) AND'
      
        '      ((Customer_Branch.Customer = Purchase_OrderLine.Customer) ' +
        'AND'
      
        '      (Customer_Branch.Branch_No = Purchase_OrderLine.Branch_No)' +
        ') AND'
      
        '      ((Customer_Contact.Customer = Purchase_OrderLine.Customer)' +
        ' AND'
      
        '      (Customer_Contact.Branch_No = Purchase_OrderLine.Branch_No' +
        ') AND'
      
        '      (Customer_Contact.Contact_No = Purchase_OrderLine.Contact_' +
        'No)) AND'
      
        '      (Purchase_Order.Purchase_Order = Purchase_OrderLine.Purcha' +
        'se_Order) AND'
      
        '      (Purch_Ord_Line_Status.Purch_Ord_Line_Status = Purchase_Or' +
        'derLine.Purch_Ord_Line_Status) AND'
      
        '      (Product_Type.Product_Type = Purchase_OrderLine.Product_Ty' +
        'pe) AND'
      '     (((Supplier_Branch.Supplier = :Supplier) AND'
      '               (Supplier_Branch.Branch_no = :Branch_No )) OR'
      '       (:Supplier = 0)) and'
      '     (((Customer_Branch.Customer = :Customer) AND'
      
        '               ((Customer_Branch.Branch_no = :Cust_Branch_No ) o' +
        'r (:Cust_Branch_No = 0 ))) OR'
      '       (:Customer = 0)) and'
      '       (Supplier.Supplier = Supplier_Branch.Supplier) and'
      '       (Customer.Customer = Customer_Branch.Customer) and'
      
        '       (Price_Unit.Price_Unit = Purchase_OrderLine.Order_Unit) a' +
        'nd'
      '       (Rep.Rep = Purchase_OrderLine.Rep)'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 152
    Top = 19
    ParamData = <
      item
        Name = 'Date_From'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'Date_To'
        DataType = ftDateTime
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
        Name = 'Supplier'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Cust_Branch_No'
      end
      item
        Name = 'Cust_Branch_No'
      end
      item
        Name = 'Customer'
      end>
  end
  object GetPosSeq21SQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'select distinct  Customer.Name as Cust_Name, Purchase_Order.Date' +
        '_Point,'
      
        '       Purchase_OrderLine.Purchase_Order, Purchase_OrderLine.Lin' +
        'e,'
      
        '       Purchase_OrderLine.Order_Price, Purchase_OrderLine.Sellin' +
        'g_Price,'
      
        '       Purchase_OrderLine.Goods_Required, Purchase_OrderLine.Lis' +
        't_Price,'
      '       Purch_Ord_Line_Status.Description as Purch_Stat_Desc,'
      
        '       Purchase_OrderLine.Quantity, Product_Type.Description as ' +
        'Prod_Type_Desc,'
      '       Purchase_OrderLine.Cust_Order_no,'
      '       Purchase_OrderLine.Customers_Desc, Customer.Name,'
      '       Customer_Branch.Name,'
      '       Customer_Contact.Name as Contact_Name,'
      '       Supplier.Name as Supplier_Name,'
      '       Price_Unit.Price_Unit_Factor as Order_Unit_Factor,'
      '       (select Price_Unit_Factor from Price_Unit'
      
        '               where Price_Unit = Purchase_OrderLine.Sell_Unit) ' +
        'as Sell_Unit_Factor,'
      '       Rep.Name as Rep_Name,'
      '       (select top 1 Job_Bag'
      '       from Job_Bag_Line_Dets'
      
        '       where Job_Bag_Line_Dets.Purchase_Order = Purchase_OrderLi' +
        'ne.Purchase_Order and'
      
        '            Job_Bag_Line_Dets.Line = Purchase_OrderLine.Line) as' +
        ' Job_Bag,'
      '       Operator.Name as Operator_Name,'
      '       Account_Manager.Name as Account_Manager_Name'
      
        'FROM Supplier_Branch, Purchase_OrderLine, Purchase_Order, Purch_' +
        'Ord_Line_Status,'
      
        '     Product_Type, Customer_Branch, Customer, Price_Unit, Suppli' +
        'er, Rep, Customer_Contact, Operator, Operator as Account_Manager'
      'WHERE (Purchase_Order.Date_Point >= :Date_From ) and'
      '      (Purchase_Order.Date_Point <= :Date_To ) and'
      '      (Purchase_Order.Operator = Operator.Operator) and'
      
        '      (Purchase_Order.Office_Contact = Account_Manager.Operator)' +
        ' and'
      '      (Supplier_Branch.Branch_no = Purchase_Order.Branch_no) AND'
      '      (Supplier_Branch.Supplier = Purchase_Order.Supplier) AND'
      '      (Supplier.Supplier = Purchase_Order.Supplier) AND'
      
        '      ((Customer_Branch.Customer = Purchase_OrderLine.Customer) ' +
        'AND'
      
        '      (Customer_Branch.Branch_No = Purchase_OrderLine.Branch_No)' +
        ') AND'
      
        '      ((Customer_Contact.Customer = Purchase_OrderLine.Customer)' +
        ' AND'
      
        '      (Customer_Contact.Branch_No = Purchase_OrderLine.Branch_No' +
        ') AND'
      
        '      (Customer_Contact.Contact_No = Purchase_OrderLine.Contact_' +
        'No)) AND'
      
        '      (Purchase_Order.Purchase_Order = Purchase_OrderLine.Purcha' +
        'se_Order) AND'
      
        '      (Purch_Ord_Line_Status.Purch_Ord_Line_Status = Purchase_Or' +
        'derLine.Purch_Ord_Line_Status) AND'
      
        '      (Product_Type.Product_Type = Purchase_OrderLine.Product_Ty' +
        'pe) AND'
      '     (((Supplier_Branch.Supplier = :Supplier) AND'
      '               (Supplier_Branch.Branch_no = :Branch_No )) OR'
      '       (:Supplier = 0)) and'
      '     (((Customer_Branch.Customer = :Customer) AND'
      
        '               ((Customer_Branch.Branch_no = :Cust_Branch_No ) o' +
        'r (:Cust_Branch_No = 0))) OR'
      '       (:Customer = 0)) and'
      '       (Customer.Customer = Customer_Branch.Customer)and'
      
        '       (Price_Unit.Price_Unit = Purchase_OrderLine.Order_Unit) a' +
        'nd'
      '       (Rep.Rep = Purchase_OrderLine.Rep)'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 152
    Top = 147
    ParamData = <
      item
        Name = 'Date_From'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'Date_To'
        DataType = ftDateTime
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
        Name = 'Supplier'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Cust_Branch_No'
      end
      item
        Name = 'Cust_Branch_No'
      end
      item
        Name = 'Customer'
      end>
  end
  object GetPosSeq12SQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select distinct  Supplier.Name, Purchase_Order.Date_Point,'
      
        '       Purchase_OrderLine.Purchase_Order, Purchase_OrderLine.Lin' +
        'e,'
      
        '       Purchase_OrderLine.Order_Price, Purchase_OrderLine.Sellin' +
        'g_Price,'
      
        '       Purchase_OrderLine.Goods_Required, Purchase_OrderLine.Lis' +
        't_Price,'
      '       Purch_Ord_Line_Status.Description as Purch_Stat_Desc,'
      
        '       Purchase_OrderLine.Quantity, Product_Type.Description as ' +
        'Prod_Type_Desc,'
      '       Purchase_OrderLine.Cust_Order_no,'
      
        '       Customer.Name as Cust_Name, Purchase_OrderLine.Customers_' +
        'Desc,'
      '       Customer_Contact.Name as Contact_Name,'
      '       Purchase_OrderLine.Form_Reference,'
      '       Supplier.Name as Supplier_Name,'
      '       Supplier_Branch.Name,'
      '       Price_Unit.Price_Unit_Factor as Order_Unit_Factor,'
      '       (select Price_Unit_Factor from Price_Unit'
      
        '               where Price_Unit = Purchase_OrderLine.Sell_Unit) ' +
        'as Sell_Unit_Factor,'
      '       Rep.Name as Rep_Name,'
      '       (select top 1 Job_Bag'
      '       from Job_Bag_Line_Dets'
      
        '       where Job_Bag_Line_Dets.Purchase_Order = Purchase_OrderLi' +
        'ne.Purchase_Order and'
      
        '            Job_Bag_Line_Dets.Line = Purchase_OrderLine.Line) as' +
        ' Job_Bag,'
      '       Operator.Name as Operator_Name,'
      '       Account_Manager.Name as Account_Manager_Name'
      
        'FROM Supplier_Branch, Purchase_OrderLine, Purchase_Order, Purch_' +
        'Ord_Line_Status,'
      
        '     Product_Type, Customer_Branch, Customer, Supplier, Price_Un' +
        'it, Rep, Customer_Contact, Operator, Operator as Account_Manager'
      'WHERE (Purchase_Order.Date_Point >= :Date_From ) and'
      '      (Purchase_Order.Date_Point <= :Date_To ) and'
      '      (Purchase_Order.Operator = Operator.Operator) and'
      
        '      (Purchase_Order.Office_Contact = Account_Manager.Operator)' +
        ' and'
      '      (Supplier_Branch.Branch_no = Purchase_Order.Branch_no) AND'
      '      (Supplier_Branch.Supplier = Purchase_Order.Supplier) AND'
      
        '      ((Customer_Branch.Customer = Purchase_OrderLine.Customer) ' +
        'AND'
      
        '      (Customer_Branch.Branch_No = Purchase_OrderLine.Branch_No)' +
        ') AND'
      
        '      ((Customer_Contact.Customer = Purchase_OrderLine.Customer)' +
        ' AND'
      
        '      (Customer_Contact.Branch_No = Purchase_OrderLine.Branch_No' +
        ') AND'
      
        '      (Customer_Contact.Contact_No = Purchase_OrderLine.Contact_' +
        'No)) AND'
      
        '      (Purchase_Order.Purchase_Order = Purchase_OrderLine.Purcha' +
        'se_Order) AND'
      
        '      (Purch_Ord_Line_Status.Purch_Ord_Line_Status = Purchase_Or' +
        'derLine.Purch_Ord_Line_Status) AND'
      
        '      (Product_Type.Product_Type = Purchase_OrderLine.Product_Ty' +
        'pe) AND'
      '     (((Supplier_Branch.Supplier = :Supplier) AND'
      '               (Supplier_Branch.Branch_no = :Branch_No )) OR'
      '       (:Supplier = 0)) and'
      '     (((Customer_Branch.Customer = :Customer) AND'
      
        '               ((Customer_Branch.Branch_no = :Cust_Branch_No ) o' +
        'r (:Cust_Branch_No = 0 ))) OR'
      '       (:Customer = 0)) and'
      '       (Supplier.Supplier = Supplier_Branch.Supplier) and'
      '       (Customer.Customer = Customer_Branch.Customer) and'
      
        '       (Price_Unit.Price_Unit = Purchase_OrderLine.Order_Unit) a' +
        'nd'
      '       (Rep.Rep = Purchase_OrderLine.Rep)'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 280
    Top = 75
    ParamData = <
      item
        Name = 'Date_From'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'Date_To'
        DataType = ftDateTime
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
        Name = 'Supplier'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Cust_Branch_No'
      end
      item
        Name = 'Cust_Branch_No'
      end
      item
        Name = 'Customer'
      end>
  end
  object GetPosSeq22SQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'select distinct  Customer.Name as Cust_Name, Purchase_Order.Date' +
        '_Point,'
      
        '       Purchase_OrderLine.Purchase_Order, Purchase_OrderLine.Lin' +
        'e,'
      
        '       Purchase_OrderLine.Order_Price, Purchase_OrderLine.Sellin' +
        'g_Price,'
      
        '       Purchase_OrderLine.Goods_Required, Purchase_OrderLine.Lis' +
        't_Price,'
      '       Purch_Ord_Line_Status.Description as Purch_Stat_Desc,'
      
        '       Purchase_OrderLine.Quantity, Product_Type.Description as ' +
        'Prod_Type_Desc,'
      '       Purchase_OrderLine.Cust_Order_no,'
      '       Purchase_OrderLine.Customers_Desc, Customer.Name,'
      '       Purchase_OrderLine.Form_Reference,'
      '       Customer_Branch.Name,'
      '       Customer_Contact.Name as Contact_Name,'
      '       Supplier.Name as Supplier_Name,'
      '       Price_Unit.Price_Unit_Factor as Order_Unit_Factor,'
      '       (select Price_Unit_Factor from Price_Unit'
      
        '               where Price_Unit = Purchase_OrderLine.Sell_Unit) ' +
        'as Sell_Unit_Factor,'
      '       Rep.Name as Rep_Name,'
      '       (select top 1 Job_Bag'
      '       from Job_Bag_Line_Dets'
      
        '       where Job_Bag_Line_Dets.Purchase_Order = Purchase_OrderLi' +
        'ne.Purchase_Order and'
      
        '            Job_Bag_Line_Dets.Line = Purchase_OrderLine.Line) as' +
        ' Job_Bag,'
      '       Operator.Name as Operator_Name,'
      '       Account_Manager.Name as Account_Manager_Name'
      
        'FROM Supplier_Branch, Purchase_OrderLine, Purchase_Order, Purch_' +
        'Ord_Line_Status,'
      
        '     Product_Type, Customer_Branch, Customer, Price_Unit, Suppli' +
        'er, Rep, Customer_Contact, Operator, Operator as Account_Manager'
      'WHERE (Purchase_Order.Date_Point >= :Date_From ) and'
      '      (Purchase_Order.Date_Point <= :Date_To ) and'
      '      (Purchase_Order.Operator = Operator.Operator) and'
      
        '      (Purchase_Order.Office_Contact = Account_Manager.Operator)' +
        ' and'
      '      (Supplier_Branch.Branch_no = Purchase_Order.Branch_no) AND'
      '      (Supplier_Branch.Supplier = Purchase_Order.Supplier) AND'
      '      (Supplier.Supplier = Purchase_Order.Supplier) AND'
      
        '      ((Customer_Branch.Customer = Purchase_OrderLine.Customer) ' +
        'AND'
      
        '      (Customer_Branch.Branch_No = Purchase_OrderLine.Branch_No)' +
        ') AND'
      
        '      ((Customer_Contact.Customer = Purchase_OrderLine.Customer)' +
        ' AND'
      
        '      (Customer_Contact.Branch_No = Purchase_OrderLine.Branch_No' +
        ') AND'
      
        '      (Customer_Contact.Contact_No = Purchase_OrderLine.Contact_' +
        'No)) AND'
      
        '      (Purchase_Order.Purchase_Order = Purchase_OrderLine.Purcha' +
        'se_Order) AND'
      
        '      (Purch_Ord_Line_Status.Purch_Ord_Line_Status = Purchase_Or' +
        'derLine.Purch_Ord_Line_Status) AND'
      
        '      (Product_Type.Product_Type = Purchase_OrderLine.Product_Ty' +
        'pe) AND'
      '     (((Supplier_Branch.Supplier = :Supplier) AND'
      '               (Supplier_Branch.Branch_no = :Branch_No )) OR'
      '       (:Supplier = 0)) and'
      '     (((Customer_Branch.Customer = :Customer) AND'
      
        '               ((Customer_Branch.Branch_no = :Cust_Branch_No ) o' +
        'r (:Cust_Branch_No = 0))) OR'
      '       (:Customer = 0)) and'
      '       (Customer.Customer = Customer_Branch.Customer)and'
      
        '       (Price_Unit.Price_Unit = Purchase_OrderLine.Order_Unit) a' +
        'nd'
      '       (Rep.Rep = Purchase_OrderLine.Rep)'
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 280
    Top = 147
    ParamData = <
      item
        Name = 'Date_From'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'Date_To'
        DataType = ftDateTime
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
        Name = 'Supplier'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Cust_Branch_No'
      end
      item
        Name = 'Cust_Branch_No'
      end
      item
        Name = 'Customer'
      end>
  end
  object GetPOsSeq31SQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'select distinct  Rep.Name, Rep.Name as Rep_Name, Purchase_Order.' +
        'Date_Point,'
      
        '       Purchase_OrderLine.Purchase_Order, Purchase_OrderLine.Lin' +
        'e,'
      
        '       Purchase_OrderLine.Order_Price, Purchase_OrderLine.Sellin' +
        'g_Price,'
      
        '       Purchase_OrderLine.Goods_Required, Purchase_OrderLine.Lis' +
        't_Price,'
      '       Purch_Ord_Line_Status.Description as Purch_Stat_Desc,'
      
        '       Purchase_OrderLine.Quantity, Product_Type.Description as ' +
        'Prod_Type_Desc,'
      '       Purchase_OrderLine.Cust_Order_no,'
      
        '       Customer.Name as Cust_Name, Purchase_OrderLine.Customers_' +
        'Desc,'
      '       Customer_Contact.Name as Contact_Name,'
      '       Supplier.Name as Supplier_Name,'
      '       Price_Unit.Price_Unit_Factor as Order_Unit_Factor,'
      '       (select Price_Unit_Factor from Price_Unit'
      
        '               where Price_Unit = Purchase_OrderLine.Sell_Unit) ' +
        'as Sell_Unit_Factor,'
      '       (select top 1 Job_Bag'
      '       from Job_Bag_Line_Dets'
      
        '       where Job_Bag_Line_Dets.Purchase_Order = Purchase_OrderLi' +
        'ne.Purchase_Order and'
      
        '            Job_Bag_Line_Dets.Line = Purchase_OrderLine.Line) as' +
        ' Job_Bag,'
      '       Operator.Name as Operator_Name,'
      '       Account_Manager.Name as Account_Manager_Name'
      'FROM Purchase_OrderLine, Purchase_Order, Purch_Ord_Line_Status,'
      
        '     Product_Type, Rep, Supplier_Branch, Customer_Branch, Custom' +
        'er, Customer_Contact,'
      '     Price_Unit, Supplier, Operator, Operator as Account_Manager'
      'WHERE (Purchase_Order.Date_Point >= :Date_From ) and'
      '      (Purchase_Order.Date_Point <= :Date_To ) and'
      '      (Purchase_Order.Operator = Operator.Operator) and'
      
        '      (Purchase_Order.Office_Contact = Account_Manager.Operator)' +
        ' and'
      '      (Rep.Rep = Purchase_OrderLine.Rep) AND'
      '      (Supplier_Branch.Branch_no = Purchase_Order.Branch_no) and'
      '      (Supplier_Branch.Supplier = Purchase_Order.Supplier) and'
      '      (Supplier.Supplier = Purchase_Order.Supplier) and'
      
        '      ((Customer_Branch.Customer = Purchase_OrderLine.Customer) ' +
        'AND'
      
        '      (Customer_Branch.Branch_No = Purchase_OrderLine.Branch_No)' +
        ') AND'
      
        '      ((Customer_Contact.Customer = Purchase_OrderLine.Customer)' +
        ' AND'
      
        '      (Customer_Contact.Branch_No = Purchase_OrderLine.Branch_No' +
        ') AND'
      
        '      (Customer_Contact.Contact_No = Purchase_OrderLine.Contact_' +
        'No)) AND'
      
        '      (Purchase_Order.Purchase_Order = Purchase_OrderLine.Purcha' +
        'se_Order) AND'
      
        '      (Purch_Ord_Line_Status.Purch_Ord_Line_Status = Purchase_Or' +
        'derLine.Purch_Ord_Line_Status) AND'
      
        '      (Product_Type.Product_Type = Purchase_OrderLine.Product_Ty' +
        'pe) AND'
      '     (((Supplier_Branch.Supplier = :Supplier) AND'
      '               (Supplier_Branch.Branch_no = :Branch_No )) OR'
      '       (:Supplier = 0)) and'
      '     (((Customer_Branch.Customer = :Customer) AND'
      
        '               ((Customer_Branch.Branch_no = :Cust_Branch_No ) o' +
        'r (:Cust_Branch_No = 0 ))) OR'
      '       (:Customer = 0)) and'
      '       (Customer.Customer = Customer_Branch.Customer) and'
      '       (Price_Unit.Price_Unit = Purchase_OrderLine.Order_Unit)'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 152
    Top = 211
    ParamData = <
      item
        Name = 'Date_From'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'Date_To'
        DataType = ftDateTime
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
        Name = 'Supplier'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Cust_Branch_No'
      end
      item
        Name = 'Cust_Branch_No'
      end
      item
        Name = 'Customer'
      end>
  end
  object GetPOsSeq32SQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'select distinct  Rep.Name, Rep.Name as Rep_Name, Purchase_Order.' +
        'Date_Point,'
      
        '       Purchase_OrderLine.Purchase_Order, Purchase_OrderLine.Lin' +
        'e,'
      
        '       Purchase_OrderLine.Order_Price, Purchase_OrderLine.Sellin' +
        'g_Price,'
      
        '       Purchase_OrderLine.Goods_Required, Purchase_OrderLine.Lis' +
        't_Price,'
      '       Purch_Ord_Line_Status.Description as Purch_Stat_Desc,'
      
        '       Purchase_OrderLine.Quantity, Product_Type.Description as ' +
        'Prod_Type_Desc,'
      '       Purchase_OrderLine.Cust_Order_no,'
      
        '       Customer.Name as Cust_Name, Purchase_OrderLine.Customers_' +
        'Desc,'
      '       Customer_Contact.Name as Contact_Name,'
      '       Supplier.Name as Supplier_Name,'
      '       Purchase_OrderLine.Form_Reference,'
      '       Price_Unit.Price_Unit_Factor as Order_Unit_Factor,'
      '       (select Price_Unit_Factor from Price_Unit'
      
        '               where Price_Unit = Purchase_OrderLine.Sell_Unit) ' +
        'as Sell_Unit_Factor,'
      '       (select top 1 Job_Bag'
      '       from Job_Bag_Line_Dets'
      
        '       where Job_Bag_Line_Dets.Purchase_Order = Purchase_OrderLi' +
        'ne.Purchase_Order and'
      
        '            Job_Bag_Line_Dets.Line = Purchase_OrderLine.Line) as' +
        ' Job_Bag,'
      '       Operator.Name as Operator_Name,'
      '       Account_Manager.Name as Account_Manager_Name'
      'FROM Purchase_OrderLine, Purchase_Order, Purch_Ord_Line_Status,'
      
        '     Product_Type, Rep, Supplier_Branch, Customer_Branch, Custom' +
        'er, Customer_Contact,'
      '     Price_Unit, Supplier, Operator, Operator as Account_Manager'
      'WHERE (Purchase_Order.Date_Point >= :Date_From ) and'
      '      (Purchase_Order.Date_Point <= :Date_To ) and'
      '      (Purchase_Order.Operator = Operator.Operator) and'
      
        '      (Purchase_Order.Office_Contact = Account_Manager.Operator)' +
        ' and'
      '      (Rep.Rep = Purchase_OrderLine.Rep) AND'
      '      (Supplier_Branch.Branch_no = Purchase_Order.Branch_no) and'
      '      (Supplier_Branch.Supplier = Purchase_Order.Supplier) and'
      '      (Supplier.Supplier = Purchase_Order.Supplier) and'
      
        '      ((Customer_Branch.Customer = Purchase_OrderLine.Customer) ' +
        'AND'
      
        '      (Customer_Branch.Branch_No = Purchase_OrderLine.Branch_No)' +
        ') AND'
      
        '      ((Customer_Contact.Customer = Purchase_OrderLine.Customer)' +
        ' AND'
      
        '      (Customer_Contact.Branch_No = Purchase_OrderLine.Branch_No' +
        ') AND'
      
        '      (Customer_Contact.Contact_No = Purchase_OrderLine.Contact_' +
        'No)) AND'
      
        '      (Purchase_Order.Purchase_Order = Purchase_OrderLine.Purcha' +
        'se_Order) AND'
      
        '      (Purch_Ord_Line_Status.Purch_Ord_Line_Status = Purchase_Or' +
        'derLine.Purch_Ord_Line_Status) AND'
      
        '      (Product_Type.Product_Type = Purchase_OrderLine.Product_Ty' +
        'pe) AND'
      '     (((Supplier_Branch.Supplier = :Supplier) AND'
      '               (Supplier_Branch.Branch_no = :Branch_No )) OR'
      '       (:Supplier = 0)) and'
      '     (((Customer_Branch.Customer = :Customer) AND'
      
        '                ((Customer_Branch.Branch_no = :Cust_Branch_No ) ' +
        'or (:Cust_Branch_No = 0 ))) OR'
      '       (:Customer = 0)) and'
      '       (Customer.Customer = Customer_Branch.Customer) and'
      '       (Price_Unit.Price_Unit = Purchase_OrderLine.Order_Unit)'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 280
    Top = 211
    ParamData = <
      item
        Name = 'Date_From'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'Date_To'
        DataType = ftDateTime
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
        Name = 'Supplier'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Cust_Branch_No'
      end
      item
        Name = 'Cust_Branch_No'
      end
      item
        Name = 'Customer'
      end>
  end
  object GetPOsSeq42SQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'select distinct  Operator.Name, Operator.Name as Operator_Name, ' +
        'Purchase_Order.Date_Point,'
      
        '       Purchase_OrderLine.Purchase_Order, Purchase_OrderLine.Lin' +
        'e,'
      
        '       Purchase_OrderLine.Order_Price, Purchase_OrderLine.Sellin' +
        'g_Price,'
      
        '       Purchase_OrderLine.Goods_Required, Purchase_OrderLine.Lis' +
        't_Price,'
      '       Purch_Ord_Line_Status.Description as Purch_Stat_Desc,'
      
        '       Purchase_OrderLine.Quantity, Product_Type.Description as ' +
        'Prod_Type_Desc,'
      '       Purchase_OrderLine.Cust_Order_no,'
      '       Purchase_OrderLine.Form_Reference,'
      
        '       Customer.Name as Cust_Name, Purchase_OrderLine.Customers_' +
        'Desc,'
      '       Customer_Contact.Name as Contact_Name,'
      '       Supplier.NAme as Supplier_Name,'
      '       Price_Unit.Price_Unit_Factor as Order_Unit_Factor,'
      '       (select Price_Unit_Factor from Price_Unit'
      
        '               where Price_Unit = Purchase_OrderLine.Sell_Unit) ' +
        'as Sell_Unit_Factor,'
      '       Rep.Name as Rep_Name,'
      '       (select top 1 Job_Bag'
      '       from Job_Bag_Line_Dets'
      
        '       where Job_Bag_Line_Dets.Purchase_Order = Purchase_OrderLi' +
        'ne.Purchase_Order and'
      
        '            Job_Bag_Line_Dets.Line = Purchase_OrderLine.Line) as' +
        ' Job_Bag,'
      '       Account_Manager.Name as Account_Manager_Name'
      'FROM Purchase_OrderLine, Purchase_Order, Purch_Ord_Line_Status,'
      
        '     Product_Type, Supplier_Branch, Operator, Customer_Branch, C' +
        'ustomer, Customer_Contact,'
      '     Price_Unit, Supplier, Rep, Operator as Account_Manager'
      'WHERE (Purchase_Order.Date_Point >= :Date_From ) and'
      '      (Purchase_Order.Date_Point <= :Date_To ) and'
      '      (Purchase_Order.Operator = Operator.Operator) AND'
      
        '      (Purchase_Order.Office_Contact = Account_Manager.Operator)' +
        ' and'
      
        '      ((Customer_Branch.Customer = Purchase_OrderLine.Customer) ' +
        'AND'
      
        '      (Customer_Branch.Branch_No = Purchase_OrderLine.Branch_No)' +
        ') AND'
      
        '      ((Customer_Contact.Customer = Purchase_OrderLine.Customer)' +
        ' AND'
      
        '      (Customer_Contact.Branch_No = Purchase_OrderLine.Branch_No' +
        ') AND'
      
        '      (Customer_Contact.Contact_No = Purchase_OrderLine.Contact_' +
        'No)) AND'
      '      (Supplier_Branch.Branch_no = Purchase_Order.Branch_no) and'
      '      (Supplier_Branch.Supplier = Purchase_Order.Supplier) and'
      '      (Supplier.Supplier = Purchase_Order.Supplier) and'
      
        '      (Purchase_Order.Purchase_Order = Purchase_OrderLine.Purcha' +
        'se_Order) AND'
      
        '      (Purch_Ord_Line_Status.Purch_Ord_Line_Status = Purchase_Or' +
        'derLine.Purch_Ord_Line_Status) AND'
      
        '      (Product_Type.Product_Type = Purchase_OrderLine.Product_Ty' +
        'pe) AND'
      '     (((Supplier_Branch.Supplier = :Supplier) AND'
      '               (Supplier_Branch.Branch_no = :Branch_No )) OR'
      '       (:Supplier = 0)) and'
      '     (((Customer_Branch.Customer = :Customer) AND'
      
        '                ((Customer_Branch.Branch_no = :Cust_Branch_No ) ' +
        'or (:Cust_Branch_No = 0 ))) OR'
      '       (:Customer = 0)) and'
      '       (Customer.Customer = Customer_Branch.Customer) and'
      
        '       (Price_Unit.Price_Unit = Purchase_OrderLine.Order_Unit) a' +
        'nd'
      '       (Rep.Rep = Purchase_OrderLine.Rep)'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 280
    Top = 283
    ParamData = <
      item
        Name = 'Date_From'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'Date_To'
        DataType = ftDateTime
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
        Name = 'Supplier'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Cust_Branch_No'
      end
      item
        Name = 'Cust_Branch_No'
      end
      item
        Name = 'Customer'
      end>
  end
  object GetPOsSeq51SQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select distinct  Supplier.Name, Purchase_Order.Date_Point,'
      
        '       Purchase_OrderLine.Purchase_Order, Purchase_OrderLine.Lin' +
        'e,'
      
        '       Purchase_OrderLine.Order_Price, Purchase_OrderLine.Sellin' +
        'g_Price,'
      
        '       Purchase_OrderLine.Goods_Required, Purchase_OrderLine.Lis' +
        't_Price,'
      '       Purch_Ord_Line_Status.Description as Purch_Stat_Desc,'
      
        '       Purchase_OrderLine.Quantity, Customer_Type.Description as' +
        ' Cust_Type_Desc,'
      '       Purchase_OrderLine.Cust_Order_no,'
      '       Product_Type.Description as Prod_Type_Desc,'
      
        '       Customer.Name as Cust_Name, Purchase_OrderLine.Customers_' +
        'Desc,'
      '       Customer_Contact.Name as Contact_Name,'
      '       Supplier.Name as Supplier_Name,'
      '       Price_Unit.Price_Unit_Factor as Order_Unit_Factor,'
      '       (select Price_Unit_Factor from Price_Unit'
      
        '               where Price_Unit = Purchase_OrderLine.Sell_Unit) ' +
        'as Sell_Unit_Factor,'
      '       Rep.Name as Rep_Name,'
      '       (select top 1 Job_Bag'
      '       from Job_Bag_Line_Dets'
      
        '       where Job_Bag_Line_Dets.Purchase_Order = Purchase_OrderLi' +
        'ne.Purchase_Order and'
      
        '            Job_Bag_Line_Dets.Line = Purchase_OrderLine.Line) as' +
        ' Job_Bag,'
      '       Operator.Name as Operator_Name,'
      '       Account_Manager.Name as Account_Manager_Name'
      
        'FROM Supplier_Branch, Purchase_OrderLine, Purchase_Order, Purch_' +
        'Ord_Line_Status,'
      
        '     Customer_Type, Customer, Customer_Branch, Supplier, Price_U' +
        'nit, Rep, Customer_Contact, Product_Type, Operator, Operator as ' +
        'Account_Manager'
      'WHERE (Purchase_Order.Date_Point >= :Date_From ) and'
      '      (Purchase_Order.Date_Point <= :Date_To ) and'
      '      (Purchase_Order.Operator = Operator.Operator) and'
      
        '      (Purchase_Order.Office_Contact = Account_Manager.Operator)' +
        ' and'
      '      (Supplier_Branch.Branch_no = Purchase_Order.Branch_no) AND'
      '      (Supplier_Branch.Supplier = Purchase_Order.Supplier) AND'
      '      (Customer.Customer = Purchase_OrderLine.Customer) AND'
      
        '      ((Customer_Branch.Customer = Purchase_OrderLine.Customer) ' +
        'AND'
      
        '      (Customer_Branch.Branch_No = Purchase_OrderLine.Branch_No)' +
        ') AND'
      
        '      ((Customer_Contact.Customer = Purchase_OrderLine.Customer)' +
        ' AND'
      
        '      (Customer_Contact.Branch_No = Purchase_OrderLine.Branch_No' +
        ') AND'
      
        '      (Customer_Contact.Contact_No = Purchase_OrderLine.Contact_' +
        'No)) AND'
      
        '      (Purchase_Order.Purchase_Order = Purchase_OrderLine.Purcha' +
        'se_Order) AND'
      
        '      (Purch_Ord_Line_Status.Purch_Ord_Line_Status = Purchase_Or' +
        'derLine.Purch_Ord_Line_Status) AND'
      
        '      (Product_Type.Product_Type = Purchase_OrderLine.Product_Ty' +
        'pe) AND'
      '      (Customer_Type.Customer_Type = Customer.Customer_Type) AND'
      '     (((Supplier_Branch.Supplier = :Supplier) AND'
      '               (Supplier_Branch.Branch_no = :Branch_No )) OR'
      '       (:Supplier = 0)) and'
      '     (((Customer_Branch.Customer = :Customer) AND'
      
        '                ((Customer_Branch.Branch_no = :Cust_Branch_No ) ' +
        'or (:Cust_Branch_No = 0 ))) OR'
      '       (:Customer = 0)) and'
      '       (Supplier.Supplier = Supplier_Branch.Supplier ) and'
      
        '       (Price_Unit.Price_Unit = Purchase_OrderLine.Order_Unit) a' +
        'nd'
      '       (Rep.Rep = Purchase_OrderLine.Rep)'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 160
    Top = 339
    ParamData = <
      item
        Name = 'Date_From'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'Date_To'
        DataType = ftDateTime
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
        Name = 'Supplier'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Cust_Branch_No'
      end
      item
        Name = 'Cust_Branch_No'
      end
      item
        Name = 'Customer'
      end>
  end
  object GetPOsSeq52SQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select distinct  Supplier.Name, Purchase_Order.Date_Point,'
      
        '       Purchase_OrderLine.Purchase_Order, Purchase_OrderLine.Lin' +
        'e,'
      
        '       Purchase_OrderLine.Order_Price, Purchase_OrderLine.Sellin' +
        'g_Price,'
      
        '       Purchase_OrderLine.Goods_Required, Purchase_OrderLine.Lis' +
        't_Price,'
      '       Purch_Ord_Line_Status.Description as Purch_Stat_Desc,'
      
        '       Purchase_OrderLine.Quantity, Customer_Type.Description as' +
        ' Cust_Type_Desc,'
      '       Purchase_OrderLine.Cust_Order_no,'
      '       Product_Type.Description as Prod_Type_Desc,'
      
        '       Customer.Name as Cust_Name, Purchase_OrderLine.Customers_' +
        'Desc,'
      '       Customer_Contact.Name as Contact_Name,'
      '       Purchase_OrderLine.Form_Reference,'
      '       Supplier.Name as Supplier_Name,'
      '       Price_Unit.Price_Unit_Factor as Order_Unit_Factor,'
      '       (select Price_Unit_Factor from Price_Unit'
      
        '               where Price_Unit = Purchase_OrderLine.Sell_Unit) ' +
        'as Sell_Unit_Factor,'
      '       Rep.Name as Rep_Name,'
      '       (select top 1 Job_Bag'
      '       from Job_Bag_Line_Dets'
      
        '       where Job_Bag_Line_Dets.Purchase_Order = Purchase_OrderLi' +
        'ne.Purchase_Order and'
      
        '            Job_Bag_Line_Dets.Line = Purchase_OrderLine.Line) as' +
        ' Job_Bag,'
      '       Operator.Name as Operator_Name,'
      '       Account_Manager.Name as Account_Manager_Name'
      
        'FROM Supplier_Branch, Purchase_OrderLine, Purchase_Order, Purch_' +
        'Ord_Line_Status,'
      
        '     Customer_Type, Customer, Customer_Branch, Supplier, Price_U' +
        'nit, Rep, Customer_Contact, Product_Type, Operator, Operator as ' +
        'Account_Manager'
      'WHERE (Purchase_Order.Date_Point >= :Date_From ) and'
      '      (Purchase_Order.Date_Point <= :Date_To ) and'
      '      (Purchase_Order.Operator = Operator.Operator) and'
      
        '      (Purchase_Order.Office_Contact = Account_Manager.Operator)' +
        ' and'
      '      (Supplier_Branch.Branch_no = Purchase_Order.Branch_no) AND'
      '      (Supplier_Branch.Supplier = Purchase_Order.Supplier) AND'
      '      (Customer.Customer = Purchase_OrderLine.Customer) AND'
      
        '      ((Customer_Branch.Customer = Purchase_OrderLine.Customer) ' +
        'AND'
      
        '      (Customer_Branch.Branch_No = Purchase_OrderLine.Branch_No)' +
        ') AND'
      
        '      ((Customer_Contact.Customer = Purchase_OrderLine.Customer)' +
        ' AND'
      
        '      (Customer_Contact.Branch_No = Purchase_OrderLine.Branch_No' +
        ') AND'
      
        '      (Customer_Contact.Contact_No = Purchase_OrderLine.Contact_' +
        'No)) AND'
      
        '      (Purchase_Order.Purchase_Order = Purchase_OrderLine.Purcha' +
        'se_Order) AND'
      
        '      (Purch_Ord_Line_Status.Purch_Ord_Line_Status = Purchase_Or' +
        'derLine.Purch_Ord_Line_Status) AND'
      '      (Customer_Type.Customer_Type = Customer.Customer_Type) AND'
      '     (((Supplier_Branch.Supplier = :Supplier) AND'
      '               (Supplier_Branch.Branch_no = :Branch_No )) OR'
      '       (:Supplier = 0)) and'
      '     (((Customer_Branch.Customer = :Customer) AND'
      
        '                ((Customer_Branch.Branch_no = :Cust_Branch_No ) ' +
        'or (:Cust_Branch_No = 0 ))) OR'
      '       (:Customer = 0)) and'
      '       (Supplier.Supplier = Supplier_Branch.Supplier ) and'
      
        '       (Price_Unit.Price_Unit = Purchase_OrderLine.Order_Unit) a' +
        'nd'
      '       (Rep.Rep = Purchase_OrderLine.Rep)'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 280
    Top = 339
    ParamData = <
      item
        Name = 'Date_From'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'Date_To'
        DataType = ftDateTime
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
        Name = 'Supplier'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Cust_Branch_No'
      end
      item
        Name = 'Cust_Branch_No'
      end
      item
        Name = 'Customer'
      end>
  end
  object FormRefSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Form_Reference, Form_Reference_ID, Form_Reference_Descr'
      'from Form_Reference'
      'where Form_Reference = :Form_Reference')
    Left = 368
    Top = 16
    ParamData = <
      item
        Name = 'Form_Reference'
      end>
  end
  object GetPOsSeq60SQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'select distinct  Customer.Name + '#39'/'#39'+ Customer_Branch.Name as Cu' +
        'st_Name, Purchase_Order.Date_Point,'
      
        '       Purchase_OrderLine.Purchase_Order, Purchase_OrderLine.Lin' +
        'e,'
      
        '       Purchase_OrderLine.Order_Price, Purchase_OrderLine.Sellin' +
        'g_Price,'
      
        '       Purchase_OrderLine.Goods_Required, Purchase_OrderLine.Lis' +
        't_Price,'
      '       Purch_Ord_Line_Status.Description as Purch_Stat_Desc,'
      
        '       Purchase_OrderLine.Quantity, Product_Type.Description as ' +
        'Prod_Type_Desc,'
      '       Purchase_OrderLine.Cust_Order_no,'
      '       Purchase_OrderLine.Customers_Desc, Customer.Name,'
      '       Customer_Branch.Name as Branch_Name,'
      '       Customer_Contact.Name as Contact_Name,'
      '       Supplier.Name as Supplier_Name,'
      '       Price_Unit.Price_Unit_Factor as Order_Unit_Factor,'
      '       (select Price_Unit_Factor from Price_Unit'
      
        '               where Price_Unit = Purchase_OrderLine.Sell_Unit) ' +
        'as Sell_Unit_Factor,'
      '       Rep.Name as Rep_Name,'
      '       (select top 1 Job_Bag'
      '       from Job_Bag_Line_Dets'
      
        '       where Job_Bag_Line_Dets.Purchase_Order = Purchase_OrderLi' +
        'ne.Purchase_Order and'
      
        '            Job_Bag_Line_Dets.Line = Purchase_OrderLine.Line) as' +
        ' Job_Bag,'
      '       Operator.Name as Operator_Name,'
      '       Account_Manager.Name as Account_Manager_Name'
      
        'FROM Supplier_Branch, Purchase_OrderLine, Purchase_Order, Purch_' +
        'Ord_Line_Status,'
      
        '     Product_Type, Customer_Branch, Customer, Price_Unit, Suppli' +
        'er, Rep, Customer_Contact, Operator, Operator as Account_Manager'
      'WHERE (Purchase_Order.Date_Point >= :Date_From ) and'
      '      (Purchase_Order.Date_Point <= :Date_To ) and'
      '      (Purchase_Order.Operator = Operator.Operator) and'
      
        '      (Purchase_Order.Office_Contact = Account_Manager.Operator)' +
        ' and'
      '      (Supplier_Branch.Branch_no = Purchase_Order.Branch_no) AND'
      '      (Supplier_Branch.Supplier = Purchase_Order.Supplier) AND'
      '      (Supplier.Supplier = Purchase_Order.Supplier) AND'
      
        '      ((Customer_Branch.Customer = Purchase_OrderLine.Customer) ' +
        'AND'
      
        '      (Customer_Branch.Branch_No = Purchase_OrderLine.Branch_No)' +
        ') AND'
      
        '      ((Customer_Contact.Customer = Purchase_OrderLine.Customer)' +
        ' AND'
      
        '      (Customer_Contact.Branch_No = Purchase_OrderLine.Branch_No' +
        ') AND'
      
        '      (Customer_Contact.Contact_No = Purchase_OrderLine.Contact_' +
        'No)) AND'
      
        '      (Purchase_Order.Purchase_Order = Purchase_OrderLine.Purcha' +
        'se_Order) AND'
      
        '      (Purch_Ord_Line_Status.Purch_Ord_Line_Status = Purchase_Or' +
        'derLine.Purch_Ord_Line_Status) AND'
      
        '      (Product_Type.Product_Type = Purchase_OrderLine.Product_Ty' +
        'pe) AND'
      '     (((Supplier_Branch.Supplier = :Supplier) AND'
      '               (Supplier_Branch.Branch_no = :Branch_No )) OR'
      '       (:Supplier = 0)) and'
      '     (((Customer_Branch.Customer = :Customer) AND'
      
        '               ((Customer_Branch.Branch_no = :Cust_Branch_No ) o' +
        'r (:Cust_Branch_No = 0))) OR'
      '       (:Customer = 0)) and'
      '       (Customer.Customer = Customer_Branch.Customer)and'
      
        '       (Price_Unit.Price_Unit = Purchase_OrderLine.Order_Unit) a' +
        'nd'
      '       (Rep.Rep = Purchase_OrderLine.Rep)'
      ''
      ' '
      ' ')
    Left = 48
    Top = 392
    ParamData = <
      item
        Name = 'Date_From'
      end
      item
        Name = 'Date_To'
      end
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_No'
      end
      item
        Name = 'Supplier'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Cust_Branch_No'
      end
      item
        Name = 'Cust_Branch_No'
      end
      item
        Name = 'Customer'
      end>
  end
  object GetPOsSeq61SQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'select distinct  Customer.Name + '#39'/'#39' + Customer_Branch.Name as C' +
        'ust_Name, Purchase_Order.Date_Point,'
      
        '       Purchase_OrderLine.Purchase_Order, Purchase_OrderLine.Lin' +
        'e,'
      
        '       Purchase_OrderLine.Order_Price, Purchase_OrderLine.Sellin' +
        'g_Price,'
      
        '       Purchase_OrderLine.Goods_Required, Purchase_OrderLine.Lis' +
        't_Price,'
      '       Purch_Ord_Line_Status.Description as Purch_Stat_Desc,'
      
        '       Purchase_OrderLine.Quantity, Product_Type.Description as ' +
        'Prod_Type_Desc,'
      '       Purchase_OrderLine.Cust_Order_no,'
      '       Purchase_OrderLine.Customers_Desc, Customer.Name,'
      '       Customer_Branch.Name,'
      '       Customer_Contact.Name as Contact_Name,'
      '       Supplier.Name as Supplier_Name,'
      '       Price_Unit.Price_Unit_Factor as Order_Unit_Factor,'
      '       (select Price_Unit_Factor from Price_Unit'
      
        '               where Price_Unit = Purchase_OrderLine.Sell_Unit) ' +
        'as Sell_Unit_Factor,'
      '       Rep.Name as Rep_Name,'
      '       (select top 1 Job_Bag'
      '       from Job_Bag_Line_Dets'
      
        '       where Job_Bag_Line_Dets.Purchase_Order = Purchase_OrderLi' +
        'ne.Purchase_Order and'
      
        '            Job_Bag_Line_Dets.Line = Purchase_OrderLine.Line) as' +
        ' Job_Bag,'
      '       Operator.Name as Operator_Name,'
      '       Account_Manager.Name as Account_Manager_Name'
      
        'FROM Supplier_Branch, Purchase_OrderLine, Purchase_Order, Purch_' +
        'Ord_Line_Status,'
      
        '     Product_Type, Customer_Branch, Customer, Price_Unit, Suppli' +
        'er, Rep, Customer_Contact, Operator, Operator as Account_Manager'
      'WHERE (Purchase_Order.Date_Point >= :Date_From ) and'
      '      (Purchase_Order.Date_Point <= :Date_To ) and'
      '      (Purchase_Order.Operator = Operator.Operator) and'
      
        '      (Purchase_Order.Office_Contact = Account_Manager.Operator)' +
        ' and'
      '      (Supplier_Branch.Branch_no = Purchase_Order.Branch_no) AND'
      '      (Supplier_Branch.Supplier = Purchase_Order.Supplier) AND'
      '      (Supplier.Supplier = Purchase_Order.Supplier) AND'
      
        '      ((Customer_Branch.Customer = Purchase_OrderLine.Customer) ' +
        'AND'
      
        '      (Customer_Branch.Branch_No = Purchase_OrderLine.Branch_No)' +
        ') AND'
      
        '      ((Customer_Contact.Customer = Purchase_OrderLine.Customer)' +
        ' AND'
      
        '      (Customer_Contact.Branch_No = Purchase_OrderLine.Branch_No' +
        ') AND'
      
        '      (Customer_Contact.Contact_No = Purchase_OrderLine.Contact_' +
        'No)) AND'
      
        '      (Purchase_Order.Purchase_Order = Purchase_OrderLine.Purcha' +
        'se_Order) AND'
      
        '      (Purch_Ord_Line_Status.Purch_Ord_Line_Status = Purchase_Or' +
        'derLine.Purch_Ord_Line_Status) AND'
      
        '      (Product_Type.Product_Type = Purchase_OrderLine.Product_Ty' +
        'pe) AND'
      '     (((Supplier_Branch.Supplier = :Supplier) AND'
      '               (Supplier_Branch.Branch_no = :Branch_No )) OR'
      '       (:Supplier = 0)) and'
      '     (((Customer_Branch.Customer = :Customer) AND'
      
        '               ((Customer_Branch.Branch_no = :Cust_Branch_No ) o' +
        'r (:Cust_Branch_No = 0 ))) OR'
      '       (:Customer = 0)) and'
      '       (Customer.Customer = Customer_Branch.Customer)and'
      
        '       (Price_Unit.Price_Unit = Purchase_OrderLine.Order_Unit) a' +
        'nd'
      '       (Rep.Rep = Purchase_OrderLine.Rep)'
      ' ')
    Left = 160
    Top = 392
    ParamData = <
      item
        Name = 'Date_From'
      end
      item
        Name = 'Date_To'
      end
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_No'
      end
      item
        Name = 'Supplier'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Cust_Branch_No'
      end
      item
        Name = 'Cust_Branch_No'
      end
      item
        Name = 'Customer'
      end>
  end
  object GetPOsSeq62SQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'select distinct  Customer.Name + '#39'/'#39' + Customer_Branch.Name as C' +
        'ust_Name, Purchase_Order.Date_Point,'
      
        '       Purchase_OrderLine.Purchase_Order, Purchase_OrderLine.Lin' +
        'e,'
      
        '       Purchase_OrderLine.Order_Price, Purchase_OrderLine.Sellin' +
        'g_Price,'
      
        '       Purchase_OrderLine.Goods_Required, Purchase_OrderLine.Lis' +
        't_Price,'
      '       Purch_Ord_Line_Status.Description as Purch_Stat_Desc,'
      
        '       Purchase_OrderLine.Quantity, Product_Type.Description as ' +
        'Prod_Type_Desc,'
      '       Purchase_OrderLine.Cust_Order_no,'
      '       Purchase_OrderLine.Customers_Desc, Customer.Name,'
      '       Purchase_OrderLine.Form_Reference,'
      '       Customer_Branch.Name,'
      '       Customer_Contact.Name as Contact_Name,'
      '       Supplier.Name as Supplier_Name,'
      '       Price_Unit.Price_Unit_Factor as Order_Unit_Factor,'
      '       (select Price_Unit_Factor from Price_Unit'
      
        '               where Price_Unit = Purchase_OrderLine.Sell_Unit) ' +
        'as Sell_Unit_Factor,'
      '       Rep.Name as Rep_Name,'
      '       (select top 1 Job_Bag'
      '       from Job_Bag_Line_Dets'
      
        '       where Job_Bag_Line_Dets.Purchase_Order = Purchase_OrderLi' +
        'ne.Purchase_Order and'
      
        '            Job_Bag_Line_Dets.Line = Purchase_OrderLine.Line) as' +
        ' Job_Bag,'
      '       Operator.Name as Operator_Name,'
      '       Account_Manager.Name as Account_Manager_Name'
      
        'FROM Supplier_Branch, Purchase_OrderLine, Purchase_Order, Purch_' +
        'Ord_Line_Status,'
      
        '     Product_Type, Customer_Branch, Customer, Price_Unit, Suppli' +
        'er, Rep, Customer_Contact, Operator, Operator as Account_Manager'
      'WHERE (Purchase_Order.Date_Point >= :Date_From ) and'
      '      (Purchase_Order.Date_Point <= :Date_To ) and'
      '      (Purchase_Order.Operator = Operator.Operator) and'
      
        '      (Purchase_Order.Office_Contact = Account_Manager.Operator)' +
        ' and'
      '      (Supplier_Branch.Branch_no = Purchase_Order.Branch_no) AND'
      '      (Supplier_Branch.Supplier = Purchase_Order.Supplier) AND'
      '      (Supplier.Supplier = Purchase_Order.Supplier) AND'
      
        '      ((Customer_Branch.Customer = Purchase_OrderLine.Customer) ' +
        'AND'
      
        '      (Customer_Branch.Branch_No = Purchase_OrderLine.Branch_No)' +
        ') AND'
      
        '      ((Customer_Contact.Customer = Purchase_OrderLine.Customer)' +
        ' AND'
      
        '      (Customer_Contact.Branch_No = Purchase_OrderLine.Branch_No' +
        ') AND'
      
        '      (Customer_Contact.Contact_No = Purchase_OrderLine.Contact_' +
        'No)) AND'
      
        '      (Purchase_Order.Purchase_Order = Purchase_OrderLine.Purcha' +
        'se_Order) AND'
      
        '      (Purch_Ord_Line_Status.Purch_Ord_Line_Status = Purchase_Or' +
        'derLine.Purch_Ord_Line_Status) AND'
      
        '      (Product_Type.Product_Type = Purchase_OrderLine.Product_Ty' +
        'pe) AND'
      '     (((Supplier_Branch.Supplier = :Supplier) AND'
      '               (Supplier_Branch.Branch_no = :Branch_No )) OR'
      '       (:Supplier = 0)) and'
      '     (((Customer_Branch.Customer = :Customer) AND'
      
        '               ((Customer_Branch.Branch_no = :Cust_Branch_No ) o' +
        'r (:Cust_Branch_No = 0))) OR'
      '       (:Customer = 0)) and'
      '       (Customer.Customer = Customer_Branch.Customer) and'
      
        '       (Price_Unit.Price_Unit = Purchase_OrderLine.Order_Unit) a' +
        'nd'
      '       (Rep.Rep = Purchase_OrderLine.Rep)'
      ''
      ''
      ' ')
    Left = 280
    Top = 392
    ParamData = <
      item
        Name = 'Date_From'
      end
      item
        Name = 'Date_To'
      end
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_No'
      end
      item
        Name = 'Supplier'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Cust_Branch_No'
      end
      item
        Name = 'Cust_Branch_No'
      end
      item
        Name = 'Customer'
      end>
  end
  object GetPOsSeq70SQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'select distinct  Account_Manager.Name, Customer.Name + '#39'/'#39'+ Cust' +
        'omer_Branch.Name as Cust_Name, Purchase_Order.Date_Point,'
      
        '       Purchase_OrderLine.Purchase_Order, Purchase_OrderLine.Lin' +
        'e,'
      
        '       Purchase_OrderLine.Order_Price, Purchase_OrderLine.Sellin' +
        'g_Price,'
      
        '       Purchase_OrderLine.Goods_Required, Purchase_OrderLine.Lis' +
        't_Price,'
      '       Purch_Ord_Line_Status.Description as Purch_Stat_Desc,'
      
        '       Purchase_OrderLine.Quantity, Product_Type.Description as ' +
        'Prod_Type_Desc,'
      '       Purchase_OrderLine.Cust_Order_no,'
      '       Purchase_OrderLine.Customers_Desc,'
      '       Customer_Branch.Name as Branch_Name,'
      '       Customer_Contact.Name as Contact_Name,'
      '       Supplier.Name as Supplier_Name,'
      '       Price_Unit.Price_Unit_Factor as Order_Unit_Factor,'
      '       (select Price_Unit_Factor from Price_Unit'
      
        '               where Price_Unit = Purchase_OrderLine.Sell_Unit) ' +
        'as Sell_Unit_Factor,'
      '       Rep.Name as Rep_Name,'
      '       (select top 1 Job_Bag'
      '       from Job_Bag_Line_Dets'
      
        '       where Job_Bag_Line_Dets.Purchase_Order = Purchase_OrderLi' +
        'ne.Purchase_Order and'
      
        '            Job_Bag_Line_Dets.Line = Purchase_OrderLine.Line) as' +
        ' Job_Bag,'
      '       Operator.Name as Operator_Name,'
      '       Account_Manager.Name as Account_Manager_Name'
      
        'FROM Supplier_Branch, Purchase_OrderLine, Purchase_Order, Purch_' +
        'Ord_Line_Status,'
      
        '     Product_Type, Customer_Branch, Customer, Price_Unit, Suppli' +
        'er, Rep, Customer_Contact, Operator, Operator AS Account_Manager'
      'WHERE (Purchase_Order.Date_Point >= :Date_From ) and'
      '      (Purchase_Order.Date_Point <= :Date_To ) and'
      '      (Purchase_Order.Operator = Operator.Operator) and'
      
        '      (Purchase_Order.Office_Contact = Account_Manager.Operator)' +
        ' and'
      '      (Supplier_Branch.Branch_no = Purchase_Order.Branch_no) AND'
      '      (Supplier_Branch.Supplier = Purchase_Order.Supplier) AND'
      '      (Supplier.Supplier = Purchase_Order.Supplier) AND'
      
        '      ((Customer_Branch.Customer = Purchase_OrderLine.Customer) ' +
        'AND'
      
        '      (Customer_Branch.Branch_No = Purchase_OrderLine.Branch_No)' +
        ') AND'
      
        '      ((Customer_Contact.Customer = Purchase_OrderLine.Customer)' +
        ' AND'
      
        '      (Customer_Contact.Branch_No = Purchase_OrderLine.Branch_No' +
        ') AND'
      
        '      (Customer_Contact.Contact_No = Purchase_OrderLine.Contact_' +
        'No)) AND'
      
        '      (Purchase_Order.Purchase_Order = Purchase_OrderLine.Purcha' +
        'se_Order) AND'
      
        '      (Purch_Ord_Line_Status.Purch_Ord_Line_Status = Purchase_Or' +
        'derLine.Purch_Ord_Line_Status) AND'
      
        '      (Product_Type.Product_Type = Purchase_OrderLine.Product_Ty' +
        'pe) AND'
      '     (((Supplier_Branch.Supplier = :Supplier) AND'
      '               (Supplier_Branch.Branch_no = :Branch_No )) OR'
      '       (:Supplier = 0)) and'
      '     (((Customer_Branch.Customer = :Customer) AND'
      
        '               ((Customer_Branch.Branch_no = :Cust_Branch_No ) o' +
        'r (:Cust_Branch_No = 0))) OR'
      '       (:Customer = 0)) and'
      '       (Customer.Customer = Customer_Branch.Customer)and'
      
        '       (Price_Unit.Price_Unit = Purchase_OrderLine.Order_Unit) a' +
        'nd'
      '       (Rep.Rep = Purchase_OrderLine.Rep)'
      ''
      ' '
      ' ')
    Left = 48
    Top = 456
    ParamData = <
      item
        Name = 'Date_From'
      end
      item
        Name = 'Date_To'
      end
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_No'
      end
      item
        Name = 'Supplier'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Cust_Branch_No'
      end
      item
        Name = 'Cust_Branch_No'
      end
      item
        Name = 'Customer'
      end>
  end
  object GetPOsSeq71SQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'select distinct  Account_Manager.Name, Customer.Name + '#39'/'#39' + Cus' +
        'tomer_Branch.Name as Cust_Name, Purchase_Order.Date_Point,'
      
        '       Purchase_OrderLine.Purchase_Order, Purchase_OrderLine.Lin' +
        'e,'
      
        '       Purchase_OrderLine.Order_Price, Purchase_OrderLine.Sellin' +
        'g_Price,'
      
        '       Purchase_OrderLine.Goods_Required, Purchase_OrderLine.Lis' +
        't_Price,'
      '       Purch_Ord_Line_Status.Description as Purch_Stat_Desc,'
      
        '       Purchase_OrderLine.Quantity, Product_Type.Description as ' +
        'Prod_Type_Desc,'
      '       Purchase_OrderLine.Cust_Order_no,'
      '       Purchase_OrderLine.Customers_Desc, Customer.Name,'
      '       Customer_Branch.Name,'
      '       Customer_Contact.Name as Contact_Name,'
      '       Supplier.Name as Supplier_Name,'
      '       Price_Unit.Price_Unit_Factor as Order_Unit_Factor,'
      '       (select Price_Unit_Factor from Price_Unit'
      
        '               where Price_Unit = Purchase_OrderLine.Sell_Unit) ' +
        'as Sell_Unit_Factor,'
      '       Rep.Name as Rep_Name,'
      '       (select top 1 Job_Bag'
      '       from Job_Bag_Line_Dets'
      
        '       where Job_Bag_Line_Dets.Purchase_Order = Purchase_OrderLi' +
        'ne.Purchase_Order and'
      
        '            Job_Bag_Line_Dets.Line = Purchase_OrderLine.Line) as' +
        ' Job_Bag,'
      '       Operator.Name as Operator_Name,'
      '       Account_Manager.Name as Account_Manager_Name'
      
        'FROM Supplier_Branch, Purchase_OrderLine, Purchase_Order, Purch_' +
        'Ord_Line_Status,'
      
        '     Product_Type, Customer_Branch, Customer, Price_Unit, Suppli' +
        'er, Rep, Customer_Contact, Operator, Operator as Account_Manager'
      'WHERE (Purchase_Order.Date_Point >= :Date_From ) and'
      '      (Purchase_Order.Date_Point <= :Date_To ) and'
      '      (Purchase_Order.Operator = Operator.Operator) and'
      
        '      (Purchase_Order.Office_Contact = Account_Manager.Operator)' +
        ' and'
      '      (Supplier_Branch.Branch_no = Purchase_Order.Branch_no) AND'
      '      (Supplier_Branch.Supplier = Purchase_Order.Supplier) AND'
      '      (Supplier.Supplier = Purchase_Order.Supplier) AND'
      
        '      ((Customer_Branch.Customer = Purchase_OrderLine.Customer) ' +
        'AND'
      
        '      (Customer_Branch.Branch_No = Purchase_OrderLine.Branch_No)' +
        ') AND'
      
        '      ((Customer_Contact.Customer = Purchase_OrderLine.Customer)' +
        ' AND'
      
        '      (Customer_Contact.Branch_No = Purchase_OrderLine.Branch_No' +
        ') AND'
      
        '      (Customer_Contact.Contact_No = Purchase_OrderLine.Contact_' +
        'No)) AND'
      
        '      (Purchase_Order.Purchase_Order = Purchase_OrderLine.Purcha' +
        'se_Order) AND'
      
        '      (Purch_Ord_Line_Status.Purch_Ord_Line_Status = Purchase_Or' +
        'derLine.Purch_Ord_Line_Status) AND'
      
        '      (Product_Type.Product_Type = Purchase_OrderLine.Product_Ty' +
        'pe) AND'
      '     (((Supplier_Branch.Supplier = :Supplier) AND'
      '               (Supplier_Branch.Branch_no = :Branch_No )) OR'
      '       (:Supplier = 0)) and'
      '     (((Customer_Branch.Customer = :Customer) AND'
      
        '               ((Customer_Branch.Branch_no = :Cust_Branch_No ) o' +
        'r (:Cust_Branch_No = 0 ))) OR'
      '       (:Customer = 0)) and'
      '       (Customer.Customer = Customer_Branch.Customer)and'
      
        '       (Price_Unit.Price_Unit = Purchase_OrderLine.Order_Unit) a' +
        'nd'
      '       (Rep.Rep = Purchase_OrderLine.Rep)'
      ' ')
    Left = 160
    Top = 456
    ParamData = <
      item
        Name = 'Date_From'
      end
      item
        Name = 'Date_To'
      end
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_No'
      end
      item
        Name = 'Supplier'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Cust_Branch_No'
      end
      item
        Name = 'Cust_Branch_No'
      end
      item
        Name = 'Customer'
      end>
  end
  object GetPOsSeq72SQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'select distinct  Account_Manager.Name, Customer.Name + '#39'/'#39' + Cus' +
        'tomer_Branch.Name as Cust_Name, Purchase_Order.Date_Point,'
      
        '       Purchase_OrderLine.Purchase_Order, Purchase_OrderLine.Lin' +
        'e,'
      
        '       Purchase_OrderLine.Order_Price, Purchase_OrderLine.Sellin' +
        'g_Price,'
      
        '       Purchase_OrderLine.Goods_Required, Purchase_OrderLine.Lis' +
        't_Price,'
      '       Purch_Ord_Line_Status.Description as Purch_Stat_Desc,'
      
        '       Purchase_OrderLine.Quantity, Product_Type.Description as ' +
        'Prod_Type_Desc,'
      '       Purchase_OrderLine.Cust_Order_no,'
      '       Purchase_OrderLine.Customers_Desc, Customer.Name,'
      '       Purchase_OrderLine.Form_Reference,'
      '       Customer_Branch.Name,'
      '       Customer_Contact.Name as Contact_Name,'
      '       Supplier.Name as Supplier_Name,'
      '       Price_Unit.Price_Unit_Factor as Order_Unit_Factor,'
      '       (select Price_Unit_Factor from Price_Unit'
      
        '               where Price_Unit = Purchase_OrderLine.Sell_Unit) ' +
        'as Sell_Unit_Factor,'
      '       Rep.Name as Rep_Name,'
      '       (select top 1 Job_Bag'
      '       from Job_Bag_Line_Dets'
      
        '       where Job_Bag_Line_Dets.Purchase_Order = Purchase_OrderLi' +
        'ne.Purchase_Order and'
      
        '            Job_Bag_Line_Dets.Line = Purchase_OrderLine.Line) as' +
        ' Job_Bag,'
      '       Operator.Name as Operator_Name,'
      '       Account_Manager.Name as Account_Manager_Name'
      
        'FROM Supplier_Branch, Purchase_OrderLine, Purchase_Order, Purch_' +
        'Ord_Line_Status,'
      
        '     Product_Type, Customer_Branch, Customer, Price_Unit, Suppli' +
        'er, Rep, Customer_Contact, Operator, Operator as Account_Manager'
      'WHERE (Purchase_Order.Date_Point >= :Date_From ) and'
      '      (Purchase_Order.Date_Point <= :Date_To ) and'
      '      (Purchase_Order.Operator = Operator.Operator) and'
      
        '      (Purchase_Order.Office_Contact = Account_Manager.Operator)' +
        ' and'
      '      (Supplier_Branch.Branch_no = Purchase_Order.Branch_no) AND'
      '      (Supplier_Branch.Supplier = Purchase_Order.Supplier) AND'
      '      (Supplier.Supplier = Purchase_Order.Supplier) AND'
      
        '      ((Customer_Branch.Customer = Purchase_OrderLine.Customer) ' +
        'AND'
      
        '      (Customer_Branch.Branch_No = Purchase_OrderLine.Branch_No)' +
        ') AND'
      
        '      ((Customer_Contact.Customer = Purchase_OrderLine.Customer)' +
        ' AND'
      
        '      (Customer_Contact.Branch_No = Purchase_OrderLine.Branch_No' +
        ') AND'
      
        '      (Customer_Contact.Contact_No = Purchase_OrderLine.Contact_' +
        'No)) AND'
      
        '      (Purchase_Order.Purchase_Order = Purchase_OrderLine.Purcha' +
        'se_Order) AND'
      
        '      (Purch_Ord_Line_Status.Purch_Ord_Line_Status = Purchase_Or' +
        'derLine.Purch_Ord_Line_Status) AND'
      
        '      (Product_Type.Product_Type = Purchase_OrderLine.Product_Ty' +
        'pe) AND'
      '     (((Supplier_Branch.Supplier = :Supplier) AND'
      '               (Supplier_Branch.Branch_no = :Branch_No )) OR'
      '       (:Supplier = 0)) and'
      '     (((Customer_Branch.Customer = :Customer) AND'
      
        '               ((Customer_Branch.Branch_no = :Cust_Branch_No ) o' +
        'r (:Cust_Branch_No = 0))) OR'
      '       (:Customer = 0)) and'
      '       (Customer.Customer = Customer_Branch.Customer) and'
      
        '       (Price_Unit.Price_Unit = Purchase_OrderLine.Order_Unit) a' +
        'nd'
      '       (Rep.Rep = Purchase_OrderLine.Rep)'
      ''
      ''
      ' ')
    Left = 280
    Top = 448
    ParamData = <
      item
        Name = 'Date_From'
      end
      item
        Name = 'Date_To'
      end
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_No'
      end
      item
        Name = 'Supplier'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Cust_Branch_No'
      end
      item
        Name = 'Cust_Branch_No'
      end
      item
        Name = 'Customer'
      end>
  end
end
