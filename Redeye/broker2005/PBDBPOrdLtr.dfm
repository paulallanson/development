inherited dbPOrdLtr: TdbPOrdLtr
  Height = 533
  Width = 574
  inherited qryLayout: TFDQuery
    Left = 108
  end
  inherited qryCompany: TFDQuery
    Left = 26
  end
  object GetDelivsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  *'
      'FROM Delivery_Detail'
      'Where (Purchase_Order = :Purchase_Order) AND'
      '      (Line = :Line)'
      'Order By Delivery_No')
    Left = 32
    Top = 119
    ParamData = <
      item
        Name = 'Purchase_Order'
        DataType = ftInteger
      end
      item
        Name = 'Line'
        DataType = ftInteger
      end>
  end
  object GetSuppAddrSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select   Supplier.Name, Supplier_Branch.Building_No_name,'
      '               Supplier_Branch.Street, Supplier_Branch.Locale,'
      '               Supplier_Branch.Town,'
      '               Supplier_Branch.Postcode'
      'From Supplier_Branch, Supplier'
      'Where (Supplier_Branch.Supplier = :Supplier) and'
      '      (Supplier_Branch.Branch_No = :Branch_No) and'
      '      (Supplier.Supplier = Supplier_Branch.Supplier)')
    Left = 48
    Top = 295
    ParamData = <
      item
        Name = 'Supplier'
        DataType = ftInteger
      end
      item
        Name = 'Branch_No'
        DataType = ftInteger
      end>
  end
  object GetPartsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select * From Purchase_OrderLinePart_Detail'
      'Where (Purchase_Order = :Purchase_Order) and (Line = :Line)'
      'order by Part_No')
    Left = 190
    Top = 8
    ParamData = <
      item
        Name = 'Purchase_Order'
        DataType = ftInteger
      end
      item
        Name = 'Line'
        DataType = ftInteger
      end>
  end
  object GetSpecInstrSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Narrative_Text'
      'from Narrative_Line'
      'Where'
      '(Narrative = :Narrative)'
      'Order By Narrative_Line')
    Left = 32
    Top = 175
    ParamData = <
      item
        Name = 'Narrative'
      end>
  end
  object GetExtChgsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Sum(Amount) as Total_Extra_Charges'
      'FROM Purch_Ord_Line_Add_chg'
      'Where (Purchase_Order = :Purchase_Order) AND'
      '      (Line = :Line)'
      '')
    Left = 216
    Top = 237
    ParamData = <
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end>
  end
  object SpecInstrSRC: TDataSource
    DataSet = GetSpecInstrSQL
    Left = 127
    Top = 175
  end
  object GetAddHocAddrSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select   Name, Building_No_name,'
      '               Street, Locale, Town,'
      '               Postcode'
      'From Ad_Hoc_Address'
      'Where (Ad_Hoc_Address = :Ad_Hoc_Address)'
      '')
    Left = 48
    Top = 348
    ParamData = <
      item
        Name = 'Ad_Hoc_Address'
        DataType = ftInteger
      end>
  end
  object QuestionsSRC: TDataSource
    DataSet = GetQuestionsSQL
    Left = 128
    Top = 237
  end
  object CompSRC: TDataSource
    DataSet = GetCompSQL
    Left = 272
    Top = 63
  end
  object AddDetailsSRC: TDataSource
    DataSet = GetAddDetailsSQL
    Left = 296
    Top = 119
  end
  object GetEnqSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Purchase_OrderLine.Forms_Per_Box,'
      '        Purchase_OrderLine.Depth, Purchase_OrderLine.Depth_Unit,'
      '        Purchase_OrderLine.Width, Purchase_OrderLine.Width_Unit,'
      '        Purchase_OrderLine.Suppliers_Desc,'
      
        '        Purchase_OrderLine.Product_Type, Purchase_OrderLine.Artw' +
        'ork_Instructions,'
      '        Purchase_OrderLine.No_Of_Plates,'
      
        '        Purchase_OrderLine.Customer, Purchase_OrderLine.Branch_N' +
        'o,'
      '        Purchase_OrderLine.Enquiry, Purchase_OrderLine.Line,'
      '        Purchase_OrderLine.Purchase_Order,'
      '        Operator.Name as Contact_Name,'
      '       '#9'Rep.Name as Rep_Name,'
      '       '#9'Rep.Rep_Suffix_or_Prefix,'
      '        Purchase_OrderLine.Number_Instructions'
      'FROM Purchase_Order, Purchase_OrderLine, Operator, rep'
      'Where (Purchase_OrderLine.Line = :Line) AND'
      '      (Purchase_OrderLine.Enquiry = :Enquiry) and'
      '      (Purchase_Order.Office_Contact = Operator.Operator)and'
      '      (Purchase_OrderLine.rep = rep.rep)'
      ''
      ' ')
    Left = 24
    Top = 63
    ParamData = <
      item
        Name = 'Line'
        DataType = ftInteger
      end
      item
        Name = 'Enquiry'
        DataType = ftInteger
      end>
  end
  object EnqSRC: TDataSource
    DataSet = GetEnqSQL
    Left = 80
    Top = 63
  end
  object GetRepAddrSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select   Name, Building_No_name,'
      '               Street, Locale, Town,'
      '               Postcode'
      'From Rep'
      'Where (Rep = :Rep)'
      '')
    Left = 240
    Top = 348
    ParamData = <
      item
        Name = 'Rep'
        DataType = ftInteger
      end>
  end
  object DelivAddrSRC: TDataSource
    DataSet = GetCompSQL
    Left = 40
    Top = 399
  end
  object POsSRC: TDataSource
    DataSet = GetPOsSQL
    Left = 296
    Top = 175
  end
  object GetQuestionsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'SELECT  Product_TypeQuestion.Question_Text, Enquiry_Questions.Pr' +
        'oduct_Answer'
      'FROM Enquiry_Questions, Product_TypeQuestion'
      'WHERE  (Enquiry_Questions.Enquiry = :Enquiry) and'
      '       (Enquiry_Questions.Line = :Line) and'
      '       (Product_TypeQuestion.Product_Type = :Product_Type) and'
      
        '       (Enquiry_Questions.Question = Product_TypeQuestion.Questi' +
        'on)'
      'ORDER BY Sequence_Reference')
    Left = 32
    Top = 237
    ParamData = <
      item
        Name = 'Enquiry'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Product_Type'
      end>
  end
  object PartsDataSRC: TDataSource
    DataSet = GetPartsSQL
    Left = 272
    Top = 8
  end
  object GetAddDetailsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT * FROM Purchase_OrderLineAddtl_Dtls'
      'WHERE (PURCHASE_ORDER = :PURCHASE_ORDER) AND'
      '(LINE = :LINE) AND'
      '((FAO_FLAG = :FLAG) OR (FAO_FLAG = '#39'B'#39')) ')
    Left = 208
    Top = 119
    ParamData = <
      item
        Name = 'PURCHASE_ORDER'
        DataType = ftInteger
      end
      item
        Name = 'LINE'
        DataType = ftInteger
      end
      item
        Name = 'FLAG'
        DataType = ftString
      end>
  end
  object GetQtysSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Quantity From Purchase_OrderLine'
      'Where (Supplier = :Supplier) and'
      '      (Branch_No = :Branch_No) and'
      '      (Enquiry = :Enquiry) and'
      '      (Line = :Line)'
      'Order By Quantity')
    Left = 152
    Top = 348
    ParamData = <
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_No'
      end
      item
        Name = 'Enquiry'
      end
      item
        Name = 'Line'
      end>
  end
  object GetPOsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Supplier.Name,'
      '       Supplier_Branch.Building_No_name,'
      
        '       Supplier_Branch.Street, Supplier_Branch.Locale, Supplier_' +
        'Branch.Town,'
      '       Supplier_Branch.County,'
      '       Supplier_Branch.Postcode,'
      '       Supplier_Branch.Supplier,'
      '       Supplier_Branch.Branch_No,'
      '       Purchase_Order.Purchase_Order,'
      '       Purchase_Order.Needs_Authorising,'
      '       (SELECT Alt_Purchase_Order'
      '        FROM Purchase_OrderLine'
      
        '        WHERE Purchase_OrderLine.Purchase_Order = Purchase_Order' +
        '.Purchase_Order) as Alt_Purchase_Order'
      'FROM (Purchase_order'
      '     INNER JOIN Supplier_Branch Supplier_Branch ON'
      '        Purchase_Order.Supplier = Supplier_Branch.Supplier AND'
      '    Purchase_Order.Branch_No = Supplier_Branch.Branch_no)'
      
        #9'INNER JOIN Supplier ON Supplier_Branch.Supplier = Supplier.Supp' +
        'lier'
      'WHERE'
      '      ((Purchase_Order.Purchase_Order = :Purchase_Order ) or'
      '      ((:Purchase_Order = 0)'
      '        and purchase_order.purchase_order in'
      '        (select Purchase_order'
      '         from Purchase_orderline'
      
        '         where Purchase_OrderLine.Purch_Ord_Line_Status < 15))) ' +
        'and'
      
        '      ((Purchase_Order.Supplier = :Supplier ) or (:BySupplier <>' +
        ' '#39'Y'#39')) and'
      
        '      ((Purchase_Order.Branch_No = :Branch_No ) or (:ByBranch <>' +
        ' '#39'Y'#39')) and'
      
        '      ((Purchase_Order.Operator = :Operator ) or (:Operator = 0)' +
        ')'
      ''
      ''
      ''
      ''
      ' '
      ' ')
    Left = 208
    Top = 175
    ParamData = <
      item
        Name = 'Purchase_Order'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Purchase_Order'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Supplier'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'BySupplier'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Branch_No'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'ByBranch'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Operator'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Operator'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object DelivsSRC: TDataSource
    DataSet = GetDelivsSQL
    Left = 96
    Top = 119
  end
  object GetCustAddrSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select   Customer.Name, Customer_Branch.Building_No_name,'
      '               Customer_Branch.Street, Customer_Branch.Locale,'
      '               Customer_Branch.Town,'
      '               Customer_Branch.Postcode'
      'From Customer_Branch, Customer'
      'Where (Customer_Branch.Customer = :Customer) and'
      '      (Customer_Branch.Branch_No = :Branch_No) and'
      '      (Customer.Customer = Customer_Branch.Customer)')
    Left = 136
    Top = 295
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
      end
      item
        Name = 'Branch_No'
        DataType = ftInteger
      end>
  end
  object GetAckSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Customer.Name, Customer_Branch.Building_No_name,'
      
        '       Customer_Branch.Street, Customer_Branch.Locale, Customer_' +
        'Branch.Town,'
      '       Customer_Branch.Postcode,'
      
        '       Purchase_OrderLine.Purchase_Order, Purchase_OrderLine.Lin' +
        'e,'
      
        '       Purchase_OrderLine.Supplier_Job_Ref, Purchase_OrderLine.G' +
        'oods_Required,'
      '       Purchase_OrderLine.Enquiry, Purchase_OrderLine.Line0,'
      
        '       Purchase_OrderLine.Quantity, Purchase_OrderLine.selling_P' +
        'rice as Price,'
      
        '       Purchase_Order.Date_Point, Purchase_OrderLine.Suppliers_D' +
        'esc,'
      
        '       Purchase_OrderLine.Cust_Order_no, Purchase_OrderLine.Prod' +
        'uct_Type,'
      '       Customer_Branch.Customer,'
      '       Customer_Branch.Branch_No, Customer_Branch.Narrative,'
      '       Price_Unit.Description as order_Description,'
      
        '       Purchase_OrderLine.Width, Purchase_OrderLine.Width_Unit, ' +
        'Purchase_OrderLine.Depth,'
      '       Purchase_OrderLine.Depth_Unit,'
      
        '       Purchase_OrderLine.Artwork_Instructions, Purchase_OrderLi' +
        'ne.No_Of_Plates,'
      '       Purchase_OrderLine.Forms_Per_Box,'
      '       Rep.Name as Rep_Name, Rep.Position as Rep_Position,'
      '       Rep.Rep_Suffix_or_Prefix,'
      '       Purchase_OrderLine.Narrative as POL_Narrative,'
      '       Operator.Name as OurContact,'
      '       '#39'Salutation'#39' as Salutation,'
      '       Purchase_OrderLine.Branch_No as CustBranch,'
      '       Purchase_OrderLine.Contact_No as CustContact,'
      '       Purchase_OrderLine.Form_Reference,'
      '       Purchase_OrderLine.FSC_Material_Claim,'
      '       Purchase_OrderLine.FSC_Mixed_Percentage,'
      'FROM'
      
        '    (((((Purchase_OrderLine Purchase_OrderLine INNER JOIN Price_' +
        'Unit Price_Unit ON'
      '        Purchase_OrderLine.Sell_Unit = Price_Unit.Price_Unit)'
      '     INNER JOIN Customer_Branch Customer_Branch ON'
      
        '        Purchase_OrderLine.Customer = Customer_Branch.Customer A' +
        'ND'
      '    Purchase_OrderLine.Branch_no = Customer_Branch.Branch_no)'
      '     INNER JOIN Rep Rep ON'
      '        Purchase_OrderLine.Rep = Rep.Rep)'
      '     INNER JOIN Purchase_Order Purchase_Order ON'
      
        '        Purchase_OrderLine.Purchase_Order = Purchase_Order.Purch' +
        'ase_Order)'
      '     INNER JOIN Customer Customer ON'
      '        Customer_Branch.Customer = Customer.Customer)'
      '     LEFT OUTER JOIN Operator Operator ON'
      '        Purchase_Order.Office_Contact = Operator.Operator'
      'WHERE ((Purchase_Order.Purchase_Order = :Purchase_Order )'
      '         or (:Purchase_Order = 0)) and'
      
        '      ((Purchase_Order.Operator = :Operator ) or (:Operator = 0)' +
        ') and'
      
        '      ((Purchase_OrderLine.Customer = :Customer ) or (:ByCustome' +
        'r <> '#39'Y'#39')) and'
      
        '      ((Purchase_OrderLine.Branch_No = :Branch_No ) or (:ByBranc' +
        'h <> '#39'Y'#39'))'
      ''
      ' '
      ''
      ' ')
    Left = 368
    Top = 117
    ParamData = <
      item
        Name = 'Purchase_Order'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Purchase_Order'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Operator'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Operator'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Customer'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'ByCustomer'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Branch_No'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'ByBranch'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object GetNotesSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Narrative_Text'
      'From Narrative_line'
      'Where (Narrative = :Narrative)'
      'Order By Narrative_Line')
    Left = 240
    Top = 295
    ParamData = <
      item
        Name = 'Narrative'
      end>
  end
  object GetCompSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select * from Company'
      'Where Company = 1')
    Left = 192
    Top = 63
  end
  object UpdLineStatusSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Purchase_OrderLine'
      'Set Purch_Ord_Line_Status = 20'
      'Where (Purchase_Order = :Purchase_Order) and'
      '      (Line = :Line) and'
      '      (Purch_Ord_Line_Status < 20)')
    Left = 360
    Top = 270
    ParamData = <
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end>
  end
  object UpdHeadStatusSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Purchase_Order'
      'Set Purch_Ord_Head_Status = 20'
      'Where (Purchase_Order = :Purchase_Order) and'
      '      (Purch_Ord_Head_Status < 20)')
    Left = 368
    Top = 321
    ParamData = <
      item
        Name = 'Purchase_Order'
      end>
  end
  object GetCustomerContactSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT CC.Name, CC.Salutation'
      'FROM Customer_Contact CC'
      'WHERE'
      '  CC.Customer = :Customer and'
      '  CC.Branch_No = :Branch_No and'
      '  CC.Contact_No = :Contact_No'
      ' ')
    Left = 240
    Top = 405
    ParamData = <
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
        Name = 'Contact_No'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object GetAckLineSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT '#9'Customer.Name,'
      #9'      Customer_Branch.Building_No_name,'
      '       '#9'Customer_Branch.Street,'
      #9'      Customer_Branch.Locale,'
      #9'      Customer_Branch.Town,'
      '       '#9'Customer_Branch.County,'
      '       '#9'Customer_Branch.Postcode,'
      '       '#9'Purchase_OrderLine.Purchase_Order'
      'FROM (Purchase_orderLine'
      '     INNER JOIN Customer_Branch Customer_Branch ON'
      
        '        Purchase_OrderLine.Customer = Customer_Branch.Customer A' +
        'ND'
      '    Purchase_OrderLine.Branch_No = Customer_Branch.Branch_no)'
      
        #9'INNER JOIN Customer ON Customer_Branch.Customer = Customer.Cust' +
        'omer'
      'WHERE ('
      '      (Purchase_OrderLine.Purchase_Order = :Purchase_Order) and'
      '      (Purchase_OrderLine.Line = :Line)'
      '      )')
    Left = 368
    Top = 184
    ParamData = <
      item
        Name = 'Purchase_Order'
      end
      item
        Name = 'Line'
      end>
  end
  object AddressSRC: TDataSource
    Left = 296
    Top = 240
  end
  object GetCustomerNameSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Customer.Name'
      'from Customer'
      'where Customer = :Customer')
    Left = 368
    Top = 64
    ParamData = <
      item
        Name = 'Customer'
      end>
  end
  object GetRngPOsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Supplier.Name,'
      '       Supplier_Branch.Building_No_name,'
      
        '       Supplier_Branch.Street, Supplier_Branch.Locale, Supplier_' +
        'Branch.Town,'
      '       Supplier_Branch.Postcode,'
      '       Supplier_Branch.Supplier,'
      '       Supplier_Branch.Branch_No,'
      '       Purchase_Order.Purchase_Order,'
      '       Purchase_Order.Needs_Authorising,'
      '       (SELECT Alt_Purchase_Order'
      '        FROM Purchase_OrderLine'
      
        '        WHERE Purchase_OrderLine.Purchase_Order = Purchase_Order' +
        '.Purchase_Order) as Alt_Purchase_Order'
      'FROM ( int_sel inner join (Purchase_order'
      '     INNER JOIN Supplier_Branch Supplier_Branch ON'
      '        Purchase_Order.Supplier = Supplier_Branch.Supplier AND'
      
        '    Purchase_Order.Branch_No = Supplier_Branch.Branch_no)  on in' +
        't_sel.sel1 = purchase_order.purchase_order)'
      
        'INNER JOIN Supplier ON Supplier_Branch.Supplier = Supplier.Suppl' +
        'ier'
      'WHERE'
      '      ((Purchase_Order.Purchase_Order = :Purchase_order ) or'
      '      ((int_sel.int_sel_code = :iintselcode)  or'
      '      ((:Purchase_Order = 0 )'
      '        and purchase_order.purchase_order in'
      '        (select Purchase_order'
      '         from Purchase_orderline'
      
        '         where Purchase_OrderLine.Purch_Ord_Line_Status < 15))))' +
        ' and'
      
        '      ((Purchase_Order.Supplier = :Supplier ) or (:BySupplier <>' +
        ' '#39'Y'#39')) and'
      
        '      ((Purchase_Order.Branch_No = :Branch_No ) or (:ByBranch <>' +
        ' '#39'Y'#39')) and'
      
        '      ((Purchase_Order.Operator = :Operator ) or (:Operator = 0)' +
        ')'
      ''
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
    Left = 368
    Top = 391
    ParamData = <
      item
        Name = 'Purchase_Order'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'iintselcode'
        ParamType = ptInput
      end
      item
        Name = 'Supplier'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'BySupplier'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Branch_No'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'ByBranch'
        DataType = ftString
        ParamType = ptInput
      end
      item
        Name = 'Operator'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
end
