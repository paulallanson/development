inherited dbQuoSumLtr: TdbQuoSumLtr
  Height = 398
  Width = 511
  inherited qryLayout: TFDQuery
    Left = 70
    Top = 6
  end
  inherited qryCompany: TFDQuery
    Left = 13
    Top = 6
  end
  inherited qryFormRef: TFDQuery
    Left = 122
    Top = 6
  end
  inherited qryFSCClaim: TFDQuery
    Left = 173
    Top = 6
  end
  inherited GetNotesSQL: TFDQuery
    Left = 141
    Top = 17
  end
  inherited UpdEnqStatusSQL: TFDQuery
    Left = 45
    Top = 149
  end
  inherited GetPricesSQL: TFDQuery
    Left = 141
    Top = 110
  end
  inherited QuestionsSRC: TDataSource
    Left = 45
    Top = 58
  end
  inherited EnquiriesSRC: TDataSource
    Left = 141
    Top = 201
  end
  inherited UpdStatusSQL: TFDQuery
    Left = 45
    Top = 192
  end
  inherited GetQtysSQL: TFDQuery
    Left = 218
    Top = 13
  end
  inherited GetAddDetailsSQL: TFDQuery
    Left = 218
    Top = 65
  end
  inherited GetRngEnqsSQL: TFDQuery
    SQL.Strings = (
      'SELECT distinct Customer.Name, Customer_Branch.Building_No_Name,'
      
        '       Customer_Branch.Street, Customer_Branch.Locale, Customer_' +
        'Branch.Town,'
      '       Customer_Branch.PostCode, Customer_Branch.Phone,'
      
        '       Customer_Branch.Fax_Number, EnquiryLine.Enquiry,EnquiryLi' +
        'ne.Line,'
      '       EnquiryLine.Form_Description,'
      '       EnquiryLine.No_of_parts, Enquiry.Customer,'
      '       Enquiry.Branch_No,'
      
        '       EnquiryLine.Width, EnquiryLine.Width_Unit, EnquiryLine.De' +
        'pth,'
      '       EnquiryLine.Depth_Unit,'
      
        '       EnquiryLine.Artwork_Instructions, EnquiryLine.No_Of_Plate' +
        's,'
      '       EnquiryLine.Forms_Per_Box,'
      '       Enquiry.Cust_est_Contact,'
      '       Enquiry.Quote_Required_By, EnquiryLine.Product_Type,'
      
        '       EnquiryLine.SelectedSupplier, EnquiryLine.Selectedbranch_' +
        'no,'
      '       Operator.Name as Contact_Name,'
      '       Rep.Name as Rep_Name,'
      '       Rep.Position as Rep_Position,'
      '       EnquiryLine.Narrative,'
      '       Customer_Contact.Salutation,'
      '       Rep.Rep_Suffix_or_Prefix, EnquiryLine.Form_Reference,'
      '       EnquiryLine.Run_on_Price,'
      '       EnquiryLine.Run_on_Quantity'
      
        'From Enquiry, EnquiryLine, Customer_Branch, Operator, Supplier_E' +
        'nquiryQty, Customer,'
      '     Rep, Customer_Contact, int_sel'
      'Where (Enquiry.Enquiry = EnquiryLine.Enquiry) and'
      '      (Customer_Branch.Customer = Enquiry.Customer) and'
      '      (Customer_Branch.Branch_No = Enquiry.Branch_No) and'
      '      (Customer.Customer = Customer_Branch.Customer) and'
      
        '      (((Int_sel.Int_sel_code = :iintselcode) and (int_sel.sel1 ' +
        '= enquiry.enquiry)) or'
      '      ((:Enquiry = 0) and (EnquiryLine.Enquiry_Status >= 45) and'
      
        '                              (EnquiryLine.Enquiry_Status <= 50)' +
        ')) and'
      
        '      ((Enquiry.Customer = :Customer ) or (:ByCustomer <> '#39'Y'#39')) ' +
        'and'
      
        '      ((Enquiry.Branch_No = :Branch_No ) or (:ByBranch <> '#39'Y'#39')) ' +
        'and'
      '       ((Enquiry.Operator = :Operator ) or (:Operator = 0)) and'
      '       (Operator.Operator = Enquiry.Office_Contact) and'
      '       (Supplier_EnquiryQty.Enquiry = EnquiryLine.Enquiry) and'
      '      (Supplier_EnquiryQty.Line = EnquiryLine.Line) and'
      '      (Supplier_EnquiryQty.Price_Selected = '#39'Y'#39')  and'
      '      (EnquiryLine.Enq_InActive <> '#39'Y'#39') and'
      '      (Enquiry.Rep = Rep.Rep) and'
      '      ('
      '      (Enquiry.Customer = Customer_Contact.Customer) and'
      '      (Enquiry.Branch_no = Customer_Contact.Branch_no) and'
      '      (Enquiry.Contact_no = Customer_Contact.Contact_no)'
      '      )'
      'Order By EnquiryLine.Enquiry , EnquiryLine.Line'
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
    Left = 141
    Top = 154
  end
  inherited PartsSRC: TDataSource
    Left = 217
    Top = 161
  end
  inherited GetQuestionsSQL: TFDQuery
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
    Left = 45
    Top = 103
  end
  inherited PricesSRC: TDataSource
    Left = 141
    Top = 66
  end
  inherited GetPartsSQL: TFDQuery
    Left = 218
    Top = 199
  end
  inherited AddDetailsSRC: TDataSource
    Left = 218
    Top = 103
  end
  inherited GetEnquiriesSQL: TFDQuery
    SQL.Strings = (
      'SELECT distinct Customer.Name, Customer_Branch.Building_No_Name,'
      
        '       Customer_Branch.Street, Customer_Branch.Locale, Customer_' +
        'Branch.Town,'
      '       Customer_Branch.PostCode, Customer_Branch.Phone,'
      
        '       Customer_Branch.Fax_Number, EnquiryLine.Enquiry,EnquiryLi' +
        'ne.Line,'
      '       EnquiryLine.Form_Description,'
      '       EnquiryLine.No_of_parts, Enquiry.Customer,'
      '       Enquiry.Branch_No,'
      
        '       EnquiryLine.Width, EnquiryLine.Width_Unit, EnquiryLine.De' +
        'pth,'
      '       EnquiryLine.Depth_Unit,'
      
        '       EnquiryLine.Artwork_Instructions, EnquiryLine.No_Of_Plate' +
        's,'
      '       EnquiryLine.Forms_Per_Box,'
      '       Enquiry.Cust_est_Contact,'
      '       Enquiry.Quote_Required_By, EnquiryLine.Product_Type,'
      
        '       EnquiryLine.SelectedSupplier, EnquiryLine.Selectedbranch_' +
        'no,'
      '       Operator.Name as Contact_Name,'
      '       Rep.Name as Rep_Name,'
      '       Rep.Position as Rep_Position,'
      '       EnquiryLine.Narrative,'
      '       Customer_Contact.Salutation,'
      '       Rep.Rep_Suffix_or_Prefix, EnquiryLine.Form_Reference,'
      '       EnquiryLine.Run_on_Price,'
      '       EnquiryLine.Run_on_Quantity'
      
        'From Enquiry, EnquiryLine, Customer_Branch, Operator, Supplier_E' +
        'nquiryQty, Customer,'
      '     Rep, Customer_Contact'
      'Where (Enquiry.Enquiry = EnquiryLine.Enquiry) and'
      '      (Customer_Branch.Customer = Enquiry.Customer) and'
      '      (Customer_Branch.Branch_No = Enquiry.Branch_No) and'
      '      (Customer.Customer = Customer_Branch.Customer) and'
      '      ((Enquiry.Enquiry = :Enquiry ) or'
      '      ((:Enquiry = 0) and (EnquiryLine.Enquiry_Status >= 45) and'
      
        '                              (EnquiryLine.Enquiry_Status <= 50)' +
        ')) and'
      
        '      ((Enquiry.Customer = :Customer ) or (:ByCustomer <> '#39'Y'#39')) ' +
        'and'
      
        '      ((Enquiry.Branch_No = :Branch_No ) or (:ByBranch <> '#39'Y'#39')) ' +
        'and'
      '       ((Enquiry.Operator = :Operator ) or (:Operator = 0)) and'
      '       (Operator.Operator = Enquiry.Office_Contact) and'
      '       (Supplier_EnquiryQty.Enquiry = EnquiryLine.Enquiry) and'
      '      (Supplier_EnquiryQty.Line = EnquiryLine.Line) and'
      '      (Supplier_EnquiryQty.Price_Selected = '#39'Y'#39')  and'
      '      (EnquiryLine.Enq_InActive <> '#39'Y'#39') and'
      '      (Enquiry.Rep = Rep.Rep) and'
      '      ('
      '      (Enquiry.Customer = Customer_Contact.Customer) and'
      '      (Enquiry.Branch_no = Customer_Contact.Branch_no) and'
      '      (Enquiry.Contact_no = Customer_Contact.Contact_no)'
      '      )'
      'Order By EnquiryLine.Enquiry , EnquiryLine.Line'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 45
    Top = 238
  end
  inherited GetExtrasSQL: TFDQuery
    Left = 141
    Top = 244
  end
  inherited ExtrasSRC: TDataSource
    Left = 218
    Top = 238
  end
  inherited GetOptChgsSQL: TFDQuery
    Left = 282
    Top = 13
  end
end
