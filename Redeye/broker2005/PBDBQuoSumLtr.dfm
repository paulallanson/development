inherited dbQuoSumLtr: TdbQuoSumLtr
  PixelsPerInch = 120
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
  end
end
