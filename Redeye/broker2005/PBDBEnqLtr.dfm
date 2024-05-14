inherited dbEnqLtr: TdbEnqLtr
  Height = 479
  Width = 741
  inherited qryLayout: TFDQuery
    Left = 248
    Top = 224
  end
  inherited qryCompany: TFDQuery
    Left = 64
    Top = 296
  end
  object QuestionsSRC: TDataSource
    DataSet = GetQuestionsSQL
    Left = 23
    Top = 12
  end
  object EnquiriesSRC: TDataSource
    DataSet = GetEnquiriesSQL
    Left = 101
    Top = 12
  end
  object PartsSRC: TDataSource
    DataSet = GetPartsSQL
    Left = 258
    Top = 12
  end
  object AddDetailsSRC: TDataSource
    DataSet = GetAddDetailsSQL
    Left = 336
    Top = 12
  end
  object GetRngEnqsSQL: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      
        'SELECT  distinct Supplier.Name, Supplier_Branch.Building_No_Name' +
        ','
      
        '       Supplier_Branch.Street, Supplier_Branch.Locale, Supplier_' +
        'Branch.Town,'
      '       Supplier_Branch.PostCode, Supplier_Branch.Phone,'
      '       Supplier_Branch.Fax_Number, EnquiryLine.Enquiry,'
      '       EnquiryLine.Form_Description,'
      '       EnquiryLine.No_of_parts, Supplier_Enquiry.Supplier,'
      '       Supplier_Enquiry.Branch_No,'
      
        '       EnquiryLine.Width, EnquiryLine.Width_Unit, EnquiryLine.De' +
        'pth,'
      '       EnquiryLine.Depth_Unit,'
      
        '       EnquiryLine.Artwork_Instructions, EnquiryLine.No_Of_Plate' +
        's,'
      '       EnquiryLine.Forms_Per_Box,'
      '       Enquiry.Quote_Required_By, EnquiryLine.Product_Type,'
      '       EnquiryLine.Line,'
      '       Enquiry.Cust_Est_Contact,'
      '       Enquiry.Date_Point,'
      '       Rep.Name as Rep_Name, Rep.Position as Rep_Position,'
      '       Rep.Rep_Suffix_or_Prefix,'
      '       Operator.Name as Contact_Name,'
      '       EnquiryLine.Narrative, EnquiryLine.Form_Reference,'
      '       Supplier_Enquiry.Contact_no,'
      '       EnquiryLine.Run_On_Quantity,'
      '       Enquiry.Operator,'
      '       Enquiry.Office_Contact'
      'From Enquiry, EnquiryLine, Supplier_Branch, Supplier_Enquiry,'
      '         Supplier, Rep, Operator, Int_Sel'
      
        'Where (((Int_sel.Int_sel_code = :iintselcode) and (int_sel.sel1 ' +
        '= enquiry.enquiry)) or'
      
        '      ((:Enquiry = 0) and Supplier_Enquiry.Printed_Enquiry <>'#39'Y'#39 +
        ')) and'
      
        '      ((Supplier_Enquiry.Supplier = :Supplier ) or (:BySupplier ' +
        '<> '#39'Y'#39')) and'
      
        '      ((Supplier_Enquiry.Branch_No = :Branch_No ) or (:ByBranch ' +
        '<> '#39'Y'#39')) and'
      '      ((Enquiry.Operator = :Operator ) or (:Operator = 0)) and'
      #9#9' (Enquiry.Enquiry = EnquiryLine.Enquiry) and'
      '      (Supplier_Enquiry.Enquiry = EnquiryLine.Enquiry) and'
      '      (Supplier_Enquiry.Line = EnquiryLine.Line) and'
      '      (Supplier_Branch.Supplier = Supplier_Enquiry.Supplier) and'
      
        '      (Supplier_Branch.Branch_No = Supplier_Enquiry.Branch_No) a' +
        'nd'
      '      (Supplier.Supplier = Supplier_Branch.Supplier) and'
      '      (Enquiry.Rep = Rep.Rep) and'
      '      (Enquiry.Office_Contact = Operator.Operator) and'
      '      (EnquiryLine.Enq_InActive <> '#39'Y'#39')'
      
        'Order By EnquiryLine.Enquiry , EnquiryLine.Line, Supplier_Enquir' +
        'y.Supplier'
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' ')
    Left = 37
    Top = 67
    ParamData = <
      item
        Name = 'iintselcode'
        ParamType = ptInput
      end
      item
        Name = 'Enquiry'
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
      end>
  end
  object UpdStatusSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Supplier_Enquiry'
      'Set Printed_Enquiry = '#39'Y'#39
      'Where (Supplier = :Supplier) and'
      '      (Branch_No = :Branch_No) and'
      '      (Enquiry = :Enquiry) and'
      '      (Line = :Line)')
    Left = 197
    Top = 67
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
  object UpdHeadStatusSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Enquiry'
      'Set Enquiry_Status = :Enquiry_Status'
      'Where (Enquiry = :Enquiry)')
    Left = 309
    Top = 67
    ParamData = <
      item
        Name = 'Enquiry_Status'
      end
      item
        Name = 'Enquiry'
      end>
  end
  object UpdLineStatusSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update EnquiryLine'
      'Set Enquiry_Status = 30'
      'Where (Enquiry = :Enquiry) and'
      '      (Line = :Line)')
    Left = 50
    Top = 123
    ParamData = <
      item
        Name = 'Enquiry'
      end
      item
        Name = 'Line'
      end>
  end
  object GetUPSuppEnqSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Supplier'
      'From Supplier_Enquiry'
      'Where (Enquiry = :Enquiry) and'
      '      (Line = :Line) and'
      '      (Printed_Enquiry <> '#39'Y'#39')'
      '')
    Left = 170
    Top = 123
    ParamData = <
      item
        Name = 'Enquiry'
      end
      item
        Name = 'Line'
      end>
  end
  object GetUPEnqLineSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Min(Enquiry_Status) as Min_Status'
      'From EnquiryLine'
      'Where (Enquiry = :Enquiry) and'
      '      (Enquiry_Status <= 30)'
      ''
      ' ')
    Left = 282
    Top = 123
    ParamData = <
      item
        Name = 'Enquiry'
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
    Left = 63
    Top = 179
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
  object GetNotesSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from Narrative_Line'
      'where Narrative = :Narrative'
      'order by Narrative_Line')
    Left = 131
    Top = 179
    ParamData = <
      item
        Name = 'Narrative'
        DataType = ftInteger
      end>
  end
  object GetPartsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select * From EnquiryLinePart_Detail'
      'Where (Enquiry = :Enquiry) and (Line = :Line)'
      'order by Part_No')
    Left = 199
    Top = 179
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
  object GetAddDetailsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select EnquiryLineAdditionl_Dtls.*'
      'from EnquiryLineAdditionl_Dtls'
      'where (Enquiry = :Enquiry) AND'
      '           (Line = :Line) AND'
      '           (FAO_Flag = '#39'S'#39' OR FAO_FLAG='#39'B'#39')')
    Left = 64
    Top = 241
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
    Left = 164
    Top = 241
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
  object GetSuppContactSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Supplier_BranchContacts.*'
      'From Supplier_BranchContacts'
      'Where (Supplier_BranchContacts.Supplier = :Supplier) and'
      '      (Supplier_BranchContacts.Branch_No = :Branch_No) and'
      '      (Supplier_BranchContacts.Contact_no = :Contact_no)'
      ' ')
    Left = 166
    Top = 297
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
  object GetEnquiriesSQL: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      
        'SELECT  distinct Supplier.Name, Supplier_Branch.Building_No_Name' +
        ','
      
        '       Supplier_Branch.Street, Supplier_Branch.Locale, Supplier_' +
        'Branch.Town,'
      
        '       Supplier_Branch.County, Supplier_Branch.PostCode, Supplie' +
        'r_Branch.Phone,'
      '       Supplier_Branch.Fax_Number, EnquiryLine.Enquiry,'
      '       EnquiryLine.Form_Description,'
      '       EnquiryLine.No_of_parts, Supplier_Enquiry.Supplier,'
      '       Supplier_Enquiry.Branch_No,'
      
        '       EnquiryLine.Width, EnquiryLine.Width_Unit, EnquiryLine.De' +
        'pth,'
      '       EnquiryLine.Depth_Unit,'
      
        '       EnquiryLine.Artwork_Instructions, EnquiryLine.No_Of_Plate' +
        's,'
      '       EnquiryLine.Forms_Per_Box,'
      '       Enquiry.Quote_Required_By, EnquiryLine.Product_Type,'
      '       EnquiryLine.Line,'
      '       Enquiry.Cust_Est_Contact,'
      '       Enquiry.Date_Point,'
      '       Rep.Name as Rep_Name, Rep.Position as Rep_Position,'
      '       Rep.Rep_Suffix_or_Prefix,'
      '       Operator.Name as Contact_Name,'
      '       Operator.Email as Contact_Email,'
      '       Operator.Phone as Contact_Phone,'
      '       EnquiryLine.Narrative, EnquiryLine.Form_Reference,'
      '       Supplier_Enquiry.Contact_no,'
      '       EnquiryLine.Run_On_Quantity,'
      '       Enquiry.Operator,'
      '       Enquiry.Office_Contact'
      'From Enquiry, EnquiryLine, Supplier_Branch, Supplier_Enquiry,'
      '         Supplier, Rep, Operator'
      'Where ((Enquiry.Enquiry = :Enquiry ) or'
      
        '      ((:Enquiry = 0) and Supplier_Enquiry.Printed_Enquiry <>'#39'Y'#39 +
        ')) and'
      
        '      ((Supplier_Enquiry.Supplier = :Supplier ) or (:BySupplier ' +
        '<> '#39'Y'#39')) and'
      
        '      ((Supplier_Enquiry.Branch_No = :Branch_No ) or (:ByBranch ' +
        '<> '#39'Y'#39')) and'
      '      ((Enquiry.Operator = :Operator ) or (:Operator = 0)) and'
      #9#9' (Enquiry.Enquiry = EnquiryLine.Enquiry) and'
      '      (Supplier_Enquiry.Enquiry = EnquiryLine.Enquiry) and'
      '      (Supplier_Enquiry.Line = EnquiryLine.Line) and'
      '      (Supplier_Branch.Supplier = Supplier_Enquiry.Supplier) and'
      
        '      (Supplier_Branch.Branch_No = Supplier_Enquiry.Branch_No) a' +
        'nd'
      '      (Supplier.Supplier = Supplier_Branch.Supplier) and'
      '      (Enquiry.Rep = Rep.Rep) and'
      '      (Enquiry.Office_Contact = Operator.Operator) and'
      '      (EnquiryLine.Enq_InActive <> '#39'Y'#39')'
      
        'Order By EnquiryLine.Enquiry , EnquiryLine.Line, Supplier_Enquir' +
        'y.Supplier'
      '')
    Left = 133
    Top = 68
    ParamData = <
      item
        Name = 'Enquiry'
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
      end>
  end
  object GetOptionsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Product_TypeOChg.Description'
      'from EnquiryLineProduct_TypeOChg, Product_TypeOChg'
      'where'
      '('
      '(  EnquiryLineProduct_TypeOChg.Enquiry = :Enquiry) and'
      '(  EnquiryLineProduct_TypeOChg.Line = :Line) and'
      '(  EnquiryLineProduct_TypeOChg.Product_Type = :Product_Type)'
      ') and'
      '('
      
        '(  EnquiryLineProduct_TypeOChg.Product_Type = Product_TypeOChg.P' +
        'roduct_Type) and'
      
        '(  EnquiryLineProduct_TypeOChg.Optional_Charge = Product_TypeOCh' +
        'g.Optional_Charge)'
      ')'
      'Order By Product_TypeOChg.Optional_Charge'
      ''
      ''
      ' ')
    Left = 280
    Top = 176
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
  object qrySelEnqStatus: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select enquiry_status '
      'from enquiry '
      'where enquiry = :enquiry')
    Left = 396
    Top = 164
    ParamData = <
      item
        Name = 'enquiry'
      end>
  end
  object qrySelEnqLineStatus: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Enquiry_Status '
      'from enquiryline '
      'where enquiry = :enquiry '
      'and line = :line ')
    Left = 396
    Top = 208
    ParamData = <
      item
        Name = 'enquiry'
      end
      item
        Name = 'line'
      end>
  end
  object GetOperatorSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select *'
      'from Operator'
      'where Operator = :Operator')
    Left = 280
    Top = 296
    ParamData = <
      item
        Name = 'Operator'
      end>
  end
end
