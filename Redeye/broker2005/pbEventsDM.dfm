object dtmdlEvents: TdtmdlEvents
  Height = 375
  Width = 544
  object qryEvents: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Customer_Contact_Event.Customer_Cont_Event_No,'
      '        Customer_Contact_Event.Customer,'
      '        Customer_Contact_Event.Branch_no,'
      '        Customer_Contact_Event.Contact_no,'
      '        Customer_Contact_Event.Date_Time_Entered,'
      '        Customer_Contact_Event.Narrative,'
      '        Customer_Contact_Event.Operator,'
      '        Customer_Contact.Name as Contact_Name,'
      '        Customer_Contact.Phone as Contact_Phone,'
      '        Customer_Contact.Email,'
      '        Customer_Contact.Salutation,'
      '        Customer_Contact.Contact_Status,'
      '        Customer_Branch.Name as Branch_Name,'
      '        Customer_Branch.Phone as Branch_Phone,'
      '        Customer.Name as Customer_Name,'
      '        Operator.Name as Operator_Name'
      'FROM Operator INNER JOIN'
      '      (Customer INNER JOIN (Customer_Branch'
      '                INNER JOIN (Customer_Contact'
      '                INNER JOIN Customer_Contact_Event ON'
      
        '      (Customer_Contact.Contact_no = Customer_Contact_Event.Cont' +
        'act_no) AND'
      
        '      (Customer_Contact.Branch_no = Customer_Contact_Event.Branc' +
        'h_no) AND'
      
        '      (Customer_Contact.Customer = Customer_Contact_Event.Custom' +
        'er)) ON'
      
        '      (Customer_Branch.Branch_no = Customer_Contact.Branch_no) A' +
        'ND'
      '      (Customer_Branch.Customer = Customer_Contact.Customer)) ON'
      '      Customer.Customer = Customer_Branch.Customer) ON'
      '      Operator.Operator = Customer_Contact_Event.Operator'
      'WHERE (Customer_Contact.Customer = :Customer) AND'
      '      (Customer_Contact.Name LIKE :Description)')
    Left = 16
    Top = 40
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
      end
      item
        Name = 'Description'
        DataType = ftString
      end>
  end
  object dtsEvents: TDataSource
    DataSet = qryEvents
    Left = 80
    Top = 40
  end
  object qryDummy: TFDQuery
    SQL.Strings = (
      'SELECT  Customer_Contact_Event.Customer_Cont_Event_No,'
      '        Customer_Contact_Event.Customer,'
      '        Customer_Contact_Event.Branch_no,'
      '        Customer_Contact_Event.Contact_no,'
      '        Customer_Contact_Event.Date_Time_Entered,'
      '        Customer_Contact_Event.Narrative,'
      '        Customer_Contact_Event.Operator,'
      '        Customer_Contact.Name as Contact_Name,'
      '        Customer_Contact.Phone as Contact_Phone,'
      '        Customer_Contact.Email,'
      '        Customer_Contact.Salutation,'
      '        Customer_Contact.Contact_Status,'
      '        Customer_Branch.Name as Branch_Name,'
      '        Customer_Branch.Phone as Branch_Phone,'
      '        Customer.Name as Customer_Name,'
      '        Operator.Name as Operator_Name'
      'FROM Operator INNER JOIN'
      '      (Customer INNER JOIN (Customer_Branch'
      '                INNER JOIN (Customer_Contact'
      '                INNER JOIN Customer_Contact_Event ON'
      
        '      (Customer_Contact.Contact_no = Customer_Contact_Event.Cont' +
        'act_no) AND'
      
        '      (Customer_Contact.Branch_no = Customer_Contact_Event.Branc' +
        'h_no) AND'
      
        '      (Customer_Contact.Customer = Customer_Contact_Event.Custom' +
        'er)) ON'
      
        '      (Customer_Branch.Branch_no = Customer_Contact.Branch_no) A' +
        'ND'
      '      (Customer_Branch.Customer = Customer_Contact.Customer)) ON'
      '      Customer.Customer = Customer_Branch.Customer) ON'
      '      Operator.Operator = Customer_Contact_Event.Operator'
      'WHERE (Customer_Contact.Customer = :Customer) AND'
      '      (Customer_Contact.Name LIKE :Description)'
      ' ')
    Left = 144
    Top = 40
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Description'
      end>
  end
end
