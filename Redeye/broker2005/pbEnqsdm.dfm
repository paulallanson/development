object dtmdlEnqs: TdtmdlEnqs
  Height = 488
  Width = 544
  object qryEnqs: TFDQuery
    Connection = dmBroker.PBLDatabase
    SQL.Strings = (
      'SELECT  TOP 100'
      '        Enquiry.Date_Point,'
      '        EnquiryLine.Enquiry_Status,'
      '        Enquiry_Status.Description as Status_Description,'
      '        EnquiryLine.Form_Description as Description,'
      '        Enquiry.Rep,'
      '        Rep.Name as rep_Name,'
      '        Enquiry.Operator,'
      '        Operator.Name as Operator_Name,'
      '        Enquiry.Office_Contact,'
      '        Office_Contact.Name as Office_Contact_Name,'
      '        Enquiry.Customer,'
      '        Customer.Name as Customer_Name,'
      '        Enquiry.Branch_no,'
      '        Customer_Branch.Name as Branch_Name,'
      '        Customer_Branch.Account_Code,'
      '        EnquiryLine.Enquiry,'
      '        EnquiryLine.Line,'
      '        EnquiryLine.Form_Reference,'
      '        Form_Reference.Form_Reference_ID,'
      '        Form_Reference.Form_Reference_Descr,'
      '        Form_Reference.Stock_Reference,'
      '        EnquiryLine.Enq_Inactive,'
      '        Product_Type.Description as Product_Type_Description'
      'FROM Operator AS Office_Contact'
      '      INNER JOIN (Enquiry_Status'
      '      INNER JOIN (Product_Type'
      '      INNER JOIN (Form_Reference'
      '      RIGHT JOIN (Operator'
      '      INNER JOIN ((Customer'
      '      INNER JOIN (Customer_Branch'
      '      INNER JOIN (Enquiry'
      '      INNER JOIN EnquiryLine ON'
      '        Enquiry.Enquiry = EnquiryLine.Enquiry) ON'
      '        (Customer_Branch.Branch_no = Enquiry.Branch_no) AND'
      '        (Customer_Branch.Customer = Enquiry.Customer)) ON'
      '        Customer.Customer = Customer_Branch.Customer)'
      '      INNER JOIN Rep ON'
      '        Enquiry.Rep = Rep.Rep) ON'
      '        Operator.Operator = Enquiry.Operator) ON'
      
        '        Form_Reference.Form_Reference = EnquiryLine.Form_Referen' +
        'ce) ON'
      '        Product_Type.Product_Type = EnquiryLine.Product_Type) ON'
      
        '        Enquiry_Status.Enquiry_Status = EnquiryLine.Enquiry_Stat' +
        'us) ON'
      '        Office_Contact.Operator = Enquiry.Office_Contact'
      'Where ((Enquiry.Customer = :Customer) or (0 = :Customer)) and'
      '      EnquiryLine.Form_Description LIKE :Description')
    Left = 16
    Top = 16
    ParamData = <
      item
        Name = 'Customer'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'Description'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object qryEnqsDate_Point: TDateTimeField
      FieldName = 'Date_Point'
    end
    object qryEnqsEnquiry_Status: TIntegerField
      FieldName = 'Enquiry_Status'
    end
    object qryEnqsStatus_Description: TWideStringField
      FieldName = 'Status_Description'
      FixedChar = True
      Size = 80
    end
    object qryEnqsDescription: TWideStringField
      FieldName = 'Description'
      FixedChar = True
      Size = 160
    end
    object qryEnqsRep: TIntegerField
      FieldName = 'Rep'
    end
    object qryEnqsrep_Name: TWideStringField
      FieldName = 'rep_Name'
      FixedChar = True
      Size = 80
    end
    object qryEnqsOperator: TIntegerField
      FieldName = 'Operator'
    end
    object qryEnqsOperator_Name: TWideStringField
      FieldName = 'Operator_Name'
      FixedChar = True
      Size = 80
    end
    object qryEnqsOffice_Contact: TIntegerField
      FieldName = 'Office_Contact'
    end
    object qryEnqsOffice_Contact_Name: TWideStringField
      FieldName = 'Office_Contact_Name'
      FixedChar = True
      Size = 80
    end
    object qryEnqsCustomer: TIntegerField
      FieldName = 'Customer'
    end
    object qryEnqsCustomer_Name: TWideStringField
      FieldName = 'Customer_Name'
      FixedChar = True
      Size = 92
    end
    object qryEnqsBranch_no: TIntegerField
      FieldName = 'Branch_no'
    end
    object qryEnqsBranch_Name: TWideStringField
      FieldName = 'Branch_Name'
      FixedChar = True
      Size = 100
    end
    object qryEnqsAccount_Code: TWideStringField
      FieldName = 'Account_Code'
      FixedChar = True
    end
    object qryEnqsEnquiry: TIntegerField
      FieldName = 'Enquiry'
    end
    object qryEnqsLine: TIntegerField
      FieldName = 'Line'
    end
    object qryEnqsForm_Reference: TIntegerField
      FieldName = 'Form_Reference'
    end
    object qryEnqsForm_Reference_ID: TWideStringField
      FieldName = 'Form_Reference_ID'
      FixedChar = True
      Size = 100
    end
    object qryEnqsForm_Reference_Descr: TWideStringField
      FieldName = 'Form_Reference_Descr'
      FixedChar = True
      Size = 100
    end
    object qryEnqsStock_Reference: TWideStringField
      FieldName = 'Stock_Reference'
      FixedChar = True
      Size = 50
    end
    object qryEnqsEnq_Inactive: TWideStringField
      FieldName = 'Enq_Inactive'
      FixedChar = True
      Size = 2
    end
    object qryEnqsProduct_Type_Description: TWideStringField
      FieldName = 'Product_Type_Description'
      FixedChar = True
      Size = 80
    end
    object qryEnqsStatus_Text: TWideStringField
      FieldKind = fkCalculated
      FieldName = 'Status_Text'
      OnGetText = qryEnqsStatus_TextGetText
      Size = 50
      Calculated = True
    end
  end
  object dtsEnqs: TDataSource
    DataSet = qryEnqs
    Left = 80
    Top = 16
  end
  object qryDummy: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT TOP (:Records)'
      '        Enquiry.Date_Point,'
      '        EnquiryLine.Enquiry_Status,'
      '        Enquiry_Status.Description as Status_Description,'
      '        EnquiryLine.Form_Description as Description,'
      '        Enquiry.Rep,'
      '        Rep.Name as rep_Name,'
      '        Enquiry.Operator,'
      '        Operator.Name as Operator_Name,'
      '        Enquiry.Office_Contact,'
      '        Office_Contact.Name as Office_Contact_Name,'
      '        Enquiry.Customer,'
      '        Customer.Name as Customer_Name,'
      '        Enquiry.Branch_no,'
      '        Customer_Branch.Name as Branch_Name,'
      '        Customer_Branch.Account_Code,'
      '        EnquiryLine.Enquiry,'
      '        EnquiryLine.Line,'
      '        EnquiryLine.Form_Reference,'
      '        Form_Reference.Form_Reference_ID,'
      '        Form_Reference.Form_Reference_Descr,'
      '        Form_Reference.Stock_Reference,'
      '        EnquiryLine.Enq_Inactive,'
      '        Product_Type.Description as Product_Type_Description'
      'FROM Operator AS Office_Contact'
      '      INNER JOIN (Enquiry_Status'
      '      INNER JOIN (Product_Type'
      '      INNER JOIN (Form_Reference'
      '      RIGHT JOIN (Operator'
      '      INNER JOIN ((Customer'
      '      INNER JOIN (Customer_Branch'
      '      INNER JOIN (Enquiry'
      '      INNER JOIN EnquiryLine ON'
      '        Enquiry.Enquiry = EnquiryLine.Enquiry) ON'
      '        (Customer_Branch.Branch_no = Enquiry.Branch_no) AND'
      '        (Customer_Branch.Customer = Enquiry.Customer)) ON'
      '        Customer.Customer = Customer_Branch.Customer)'
      '      INNER JOIN Rep ON'
      '        Enquiry.Rep = Rep.Rep) ON'
      '        Operator.Operator = Enquiry.Operator) ON'
      
        '        Form_Reference.Form_Reference = EnquiryLine.Form_Referen' +
        'ce) ON'
      '        Product_Type.Product_Type = EnquiryLine.Product_Type) ON'
      
        '        Enquiry_Status.Enquiry_Status = EnquiryLine.Enquiry_Stat' +
        'us) ON'
      '        Office_Contact.Operator = Enquiry.Office_Contact'
      'Where ((Enquiry.Customer = :Customer) or (0 = :Customer)) and'
      '      EnquiryLine.Form_Description LIKE :Description')
    Left = 136
    Top = 16
    ParamData = <
      item
        Name = 'RECORDS'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'Customer'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'Description'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object qryEnqsJB: TFDQuery
    ConnectionName = 'pb'
    Left = 16
    Top = 104
  end
  object dtsEnqsJB: TDataSource
    DataSet = qryEnqsJB
    Left = 80
    Top = 104
  end
  object qryEnqsNotConverted: TFDQuery
    SQL.Strings = (
      'SELECT  TOP 2000'
      '        Enquiry.Date_Point,'
      '        EnquiryLine.Enquiry_Status,'
      '        Enquiry_Status.Description as Status_Description,'
      '        EnquiryLine.Form_Description as Description,'
      '        Enquiry.Rep,'
      '        Rep.Name as rep_Name,'
      '        Enquiry.Operator,'
      '        Operator.Name as Operator_Name,'
      '        Enquiry.Office_Contact,'
      '        Office_Contact.Name as Office_Contact_Name,'
      '        Enquiry.Customer,'
      '        Customer.Name as Customer_Name,'
      '        Enquiry.Branch_no,'
      '        Customer_Branch.Name as Branch_Name,'
      '        EnquiryLine.Enquiry,'
      '        EnquiryLine.Line,'
      '        EnquiryLine.Form_Reference,'
      '        Form_Reference.Form_Reference_ID,'
      '        Form_Reference.Form_Reference_Descr,'
      '        Form_Reference.Stock_Reference'
      'FROM Operator AS Office_Contact'
      '      INNER JOIN (Enquiry_Status'
      '      INNER JOIN (Form_Reference'
      '      RIGHT JOIN (Operator'
      '      INNER JOIN ((Customer'
      '      INNER JOIN (Customer_Branch'
      '      INNER JOIN (Enquiry'
      '      INNER JOIN EnquiryLine ON'
      '        Enquiry.Enquiry = EnquiryLine.Enquiry) ON'
      '        (Customer_Branch.Branch_no = Enquiry.Branch_no) AND'
      '        (Customer_Branch.Customer = Enquiry.Customer)) ON'
      '        Customer.Customer = Customer_Branch.Customer)'
      '      INNER JOIN Rep ON'
      '        Enquiry.Rep = Rep.Rep) ON'
      '        Operator.Operator = Enquiry.Operator) ON'
      
        '        Form_Reference.Form_Reference = EnquiryLine.Form_Referen' +
        'ce) ON'
      
        '        Enquiry_Status.Enquiry_Status = EnquiryLine.Enquiry_Stat' +
        'us) ON'
      '        Office_Contact.Operator = Enquiry.Office_Contact'
      'Where ((Enquiry.Customer = :Customer) or (0 = :Customer)) and'
      'EnquiryLine.Form_Description LIKE :Description  AND'
      
        '((EnquiryLine.Enquiry_Status >= 45) AND (EnquiryLine.Enquiry_Sta' +
        'tus <= 80))')
    Left = 136
    Top = 104
    ParamData = <
      item
        Name = 'Customer'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Description'
      end>
  end
  object qryPO: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Purchase_OrderLine.Purchase_Order'
      'FROM Purchase_OrderLine'
      'WHERE Purchase_OrderLine.Enquiry = :Enquiry AND'
      'Purchase_OrderLine.Line0 = :Line0')
    Left = 16
    Top = 176
    ParamData = <
      item
        Name = 'Enquiry'
      end
      item
        Name = 'Line0'
      end>
  end
  object qryReasons: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  Enq_InActive_Reason.Enq_InActive_Reason,'
      '        Enq_InActive_Reason.Description'
      'FROM Enq_InActive_Reason'
      'ORDER BY Enq_InActive_Reason.Description')
    Left = 32
    Top = 248
  end
  object dtsReasons: TDataSource
    DataSet = qryReasons
    Left = 88
    Top = 248
  end
  object qryPriceUnit: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT Price_unit, Description '
      'FROM Price_unit'
      'ORDER BY Description')
    Left = 32
    Top = 304
  end
  object dtsPriceUnit: TDataSource
    DataSet = qryPriceUnit
    Left = 88
    Top = 304
  end
  object qryGetEnquiryLine: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT  EnquiryLine.Enq_InActive,'
      '        EnquiryLine.Enq_InActive_Date,'
      '        EnquiryLine.Enq_InActive_Reason,'
      '        EnquiryLine.Firm_Order,'
      '        EnquiryLine.Enq_inactive_Winning_price,'
      '        EnquiryLine.Enq_inactive_Winning_Company,'
      '        EnquiryLine.Enq_inactive_Price_Unit,'
      '        Price_Unit.Description,'
      '        Price_Unit.Price_Unit_Factor,'
      '        EnquiryLine.Enq_inactive_Notes,'
      '        EnquiryLine.Enquiry,'
      '        EnquiryLine.Line,'
      '        EnquiryLine.Form_Description'
      'FROM Price_Unit'
      '      RIGHT JOIN EnquiryLine'
      
        '        ON Price_Unit.Price_Unit = EnquiryLine.Enq_inactive_Pric' +
        'e_Unit'
      'WHERE'
      '        EnquiryLine.Enquiry = :Enquiry AND'
      '        EnquiryLine.Line = :Line')
    Left = 32
    Top = 360
    ParamData = <
      item
        Name = 'Enquiry'
        DataType = ftInteger
      end
      item
        Name = 'Line'
        DataType = ftInteger
      end>
  end
  object qryUpdEnquiryLine: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'UPDATE EnquiryLine'
      'SET  Enq_inactive_Winning_price = :Enq_inactive_Winning_price,'
      '     Enq_inactive_Price_Unit = :Enq_inactive_Price_Unit,'
      
        '     Enq_inactive_Winning_Company = :Enq_inactive_Winning_Compan' +
        'y,'
      '     Enq_InActive_Reason = :Enq_InActive_Reason,'
      '     Enq_InActive = :Enq_InActive,'
      '     Enq_inactive_Notes = :Enq_inactive_Notes'
      'WHERE Enquiry = :Enquiry AND'
      '      Line = :Line')
    Left = 32
    Top = 408
    ParamData = <
      item
        Name = 'Enq_inactive_Winning_price'
      end
      item
        Name = 'Enq_inactive_Price_Unit'
      end
      item
        Name = 'Enq_inactive_Winning_Company'
      end
      item
        Name = 'Enq_InActive_Reason'
      end
      item
        Name = 'Enq_InActive'
      end
      item
        Name = 'Enq_inactive_Notes'
        DataType = ftInteger
      end
      item
        Name = 'Enquiry'
      end
      item
        Name = 'Line'
      end>
  end
end
