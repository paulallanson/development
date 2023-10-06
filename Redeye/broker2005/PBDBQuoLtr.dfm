inherited dbQuoLtr: TdbQuoLtr
  Height = 498
  Width = 639
  object GetNotesSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from Narrative_Line'
      'where Narrative = :Narrative'
      'order by Narrative_Line')
    Left = 176
    Top = 21
    ParamData = <
      item
        Name = 'Narrative'
        DataType = ftInteger
      end>
  end
  object UpdEnqStatusSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Enquiry'
      'Set Enquiry_Status = 70,'
      '      Customer_Quote_Date = :NewDate'
      'Where (Enquiry = :Enquiry) and'
      '      (Enquiry_Status >= 50) and (Enquiry_Status < 70)')
    Left = 56
    Top = 186
    ParamData = <
      item
        Name = 'NewDate'
      end
      item
        Name = 'Enquiry'
      end>
  end
  object GetPricesSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select '#9'Enquiry_LineQuantity.Quantity,'
      #9#9#9'Enquiry_LineQuantity.Quotation_Price,'
      #9#9#9'Enquiry_LineQuantity.Supplier,'
      #9#9#9'Enquiry_LineQuantity.Branch_no,'
      '       '#9'Price_Unit.Description as Description,'
      '                Price_Unit.Price_Unit_Factor,'
      '                Price_Unit.Show_on_Report'
      'From Enquiry_LineQuantity, Price_Unit'
      'Where (Enquiry = :Enquiry) and'
      '      (Line = :Line) and'
      '      (Price_Unit.Price_Unit = Enquiry_LineQuantity.Price_Unit)'
      'Order By Quantity'
      ' '
      ' ')
    Left = 176
    Top = 137
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
  object QuestionsSRC: TDataSource
    DataSet = GetQuestionsSQL
    Left = 56
    Top = 73
  end
  object EnquiriesSRC: TDataSource
    DataSet = GetEnquiriesSQL
    Left = 176
    Top = 251
  end
  object UpdStatusSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update EnquiryLine'
      'Set Enquiry_Status = 70'
      'Where (Enquiry = :Enquiry) and'
      '      (Line = :Line) and'
      '      (Enquiry_Status = 50)')
    Left = 56
    Top = 240
    ParamData = <
      item
        Name = 'Enquiry'
      end
      item
        Name = 'Line'
      end>
  end
  object GetQtysSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Quantity From Supplier_EnquiryQty'
      'Where (Supplier = :Supplier) and'
      '      (Branch_No = :Branch_No) and'
      '      (Enquiry = :Enquiry) and'
      '      (Line = :Line)'
      'Order By Quantity')
    Left = 272
    Top = 16
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
  object GetAddDetailsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select EnquiryLineAdditionl_Dtls.*'
      'from EnquiryLineAdditionl_Dtls'
      'where (Enquiry = :Enquiry) AND'
      '           (Line = :Line) AND'
      '           ((FAO_Flag = '#39'C'#39') OR (FAO_Flag = '#39'B'#39'))')
    Left = 272
    Top = 81
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
  object GetRngEnqsSQL: TFDQuery
    ConnectionName = 'PB'
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
        '= enquiry.enquiry) and (EnquiryLine.Enquiry_Status >= 45)) or'
      
        '      ((:Enquiry = Enquiry.Enquiry) and (EnquiryLine.Enquiry_Sta' +
        'tus >= 45))) and'
      
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
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 176
    Top = 193
    ParamData = <
      item
        Name = 'iintselcode'
        DataType = ftInteger
      end
      item
        Name = 'Enquiry'
        DataType = ftInteger
        Value = 0
      end
      item
        Name = 'Customer'
        DataType = ftInteger
      end
      item
        Name = 'ByCustomer'
        DataType = ftBoolean
      end
      item
        Name = 'Branch_No'
        DataType = ftInteger
      end
      item
        Name = 'ByBranch'
        DataType = ftBoolean
      end
      item
        Name = 'Operator'
        DataType = ftInteger
        Value = 1
      end
      item
        Name = 'Operator'
        DataType = ftInteger
      end>
  end
  object PartsSRC: TDataSource
    DataSet = GetPartsSQL
    Left = 271
    Top = 201
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
      'ORDER BY Sequence_Reference'
      ''
      '')
    Left = 56
    Top = 129
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
  object PricesSRC: TDataSource
    DataSet = GetPricesSQL
    Left = 176
    Top = 82
  end
  object GetPartsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select * From EnquiryLinePart_Detail'
      'Where (Enquiry = :Enquiry) and (Line = :Line)'
      'order by Part_No')
    Left = 272
    Top = 249
    ParamData = <
      item
        Name = 'Enquiry'
      end
      item
        Name = 'Line'
      end>
  end
  object AddDetailsSRC: TDataSource
    DataSet = GetAddDetailsSQL
    Left = 272
    Top = 129
  end
  object GetEnquiriesSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT distinct Customer.Name, Customer_Branch.Building_No_Name,'
      
        '       Customer_Branch.Street, Customer_Branch.Locale, Customer_' +
        'Branch.Town,'
      
        '       Customer_Branch.County, Customer_Branch.PostCode, Custome' +
        'r_Branch.Phone,'
      
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
      '       Operator.Email as Contact_Email,'
      '       Operator.Phone as Contact_Phone,'
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
      ' ')
    Left = 56
    Top = 297
    ParamData = <
      item
        Name = 'Enquiry'
        DataType = ftInteger
        Value = 0
      end
      item
        Name = 'Enquiry'
        DataType = ftInteger
      end
      item
        Name = 'Customer'
        DataType = ftInteger
      end
      item
        Name = 'ByCustomer'
        DataType = ftBoolean
      end
      item
        Name = 'Branch_No'
        DataType = ftInteger
      end
      item
        Name = 'ByBranch'
        DataType = ftBoolean
      end
      item
        Name = 'Operator'
        DataType = ftInteger
        Value = 1
      end
      item
        Name = 'Operator'
        DataType = ftInteger
      end>
  end
  object GetExtrasSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'Select '#9'Enquiry_LineQuantity.Quantity, Sum(Supp_enq_Add_Charge.Q' +
        'uotation_Price) as Quote_Price'
      '    From Enquiry_LineQuantity,Supp_Enq_Add_Charge'
      
        '    Where (Supp_Enq_Add_Charge.Supplier = Enquiry_LineQuantity.S' +
        'upplier) and'
      '      (Supp_Enq_Add_Charge.Line = Enquiry_LineQuantity.Line) and'
      
        '      (Supp_Enq_Add_Charge.Enquiry = Enquiry_LineQuantity.Enquir' +
        'y) and'
      
        '      (Supp_Enq_Add_Charge.Branch_no = Enquiry_LineQuantity.Bran' +
        'ch_no) and'
      '      (Enquiry_LineQuantity.Enquiry = :Enquiry) and'
      '      (Enquiry_LineQuantity.Line = :Line) and'
      
        '      ((Supp_Enq_Add_Charge.Charge_type is null) or (Supp_Enq_Ad' +
        'd_Charge.Charge_type <> '#39'O'#39'))'
      'Group by Enquiry_lineQuantity.quantity'
      'Order By Enquiry_lineQuantity.Quantity'
      ''
      ''
      ''
      ' '
      ' ')
    Left = 176
    Top = 305
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
  object ExtrasSRC: TDataSource
    DataSet = GetExtrasSQL
    Left = 272
    Top = 298
  end
  object GetOptChgsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select *'
      'from Supp_Enq_Add_Charge'
      'where'
      'Supplier = :Supplier and'
      'Branch_no = :Branch_no and'
      'Enquiry = :Enquiry and'
      'Line = :Line and'
      'Quotation_Price > 0'
      'ORDER BY'
      'Charge_Type')
    Left = 352
    Top = 16
    ParamData = <
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'Enquiry'
      end
      item
        Name = 'Line'
      end>
  end
end
