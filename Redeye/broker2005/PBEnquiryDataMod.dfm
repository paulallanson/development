object PBEnqDM: TPBEnqDM
  OldCreateOrder = False
  Left = 196
  Top = 97
  Height = 635
  Width = 829
  object GetCustContSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select Contact_No, Name'
      'From Customer_Contact'
      'Where (Customer = :Customer) and'
      '      (Branch_No = :Branch_No) and'
      
        '      ((Inactive = '#39'N'#39') or (Inactive is NULL) or (Contact_no = :' +
        'Contact_no))'
      'Order by Customer_Contact.Name')
    Left = 32
    ParamData = <
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
        DataType = ftUnknown
        Name = 'Contact_no'
        ParamType = ptUnknown
      end>
  end
  object GetCustContSRC: TDataSource
    DataSet = GetCustContSQL
    Left = 120
    Top = 16
  end
  object GetOpSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select * '
      'from Operator')
    Left = 32
    Top = 40
  end
  object GetOpSRC: TDataSource
    DataSet = GetOpSQL
    Left = 120
    Top = 56
  end
  object GetPriceUnitSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select * '
      'from Price_Unit')
    Left = 32
    Top = 80
  end
  object PriceUnitSRC: TDataSource
    DataSet = GetPriceUnitSQL
    Left = 120
    Top = 96
  end
  object qryCompany: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select In_Use_By from Company Where Company = 1')
    Left = 200
  end
  object GetLastSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select Last_Enquiry_Number'
      'From Company'
      'Where Company = 1')
    Left = 272
  end
  object UpdLastSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Update Company'
      'Set Last_Enquiry_Number = :Last_Enquiry_Number'
      'Where Company = 1')
    Left = 272
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Last_Enquiry_Number'
        ParamType = ptUnknown
      end>
  end
  object AddEnqHeaderSQL: TQuery
    DatabaseName = 'pb'
    SQL.Strings = (
      'insert into Enquiry (enquiry,'
      '                       Date_Point, '
      '                       Operator, '
      '                       Cust_Est_Contact, '
      '                       Quote_Required_By,'
      '                       Customer,'
      '                       Branch_No,'
      '                       Description,'
      '                       Rep,'
      '                       Enquiry_Status,'
      '                       Enq_inactive,'
      '                       Office_Contact,'
      '                       Contact_no)'
      'values            (:Enquiry,'
      '                       :Enq_Date,'
      '                       :Operator,'
      '                       :Contact,'
      '                       :Req_Date,'
      '                       :Customer,'
      '                       :Branch_No,'
      '                       :Desc,'
      '                       :Rep,'
      '                       :Status,'
      '                       '#39'N'#39','
      '                       :Office_Contact,'
      '                       :Contact_no)'
      '                       '
      ' ')
    Left = 344
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Enquiry'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Enq_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Operator'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contact'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Req_Date'
        ParamType = ptUnknown
      end
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
        Name = 'Desc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Rep'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Office_Contact'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contact_no'
        ParamType = ptUnknown
      end>
  end
  object GetCustRepSQL: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select Reps_Branches.*, Rep.Name'
      'From Reps_Branches, Rep'
      'Where (Customer = :Customer) and'
      '      (Branch_No = :Branch_No) and'
      '      (Reps_Branches.Rep = Rep.Rep)'
      'Order By Is_Main_Rep Desc')
    Left = 32
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Branch_No'
        ParamType = ptUnknown
      end>
  end
  object CustRepSRC: TDataSource
    DataSet = GetCustRepSQL
    Left = 120
    Top = 136
  end
  object AddEnqLineSQL: TQuery
    DatabaseName = 'pb'
    SQL.Strings = (
      'insert into EnquiryLine (enquiry,'
      '                              line,'
      '                              Form_Description,'
      '                              No_of_parts,'
      '                              NCR_OTC_Mix,'
      '                              Depth,'
      '                              Depth_Unit,'
      '                              Width,'
      '                              Width_Unit,'
      '                              Artwork_Instructions,'
      '                             Forms_per_Box,'
      '                             No_of_Plates,'
      '                             Product_Type,'
      '                             Enquiry_Status,'
      '                             Req_Response_Date,'
      '                             Printed_Quotation,'
      '                             Enq_inactive,'
      '                             Enq_inactive_reason,'
      '                             Firm_Order,'
      #9#9#9#9#9#9#9#9#9#9'Narrative,'
      '                   Form_Reference)'
      'values                  (:Enquiry,'
      '                             :Line,'
      '                             :Desc,'
      '                             :Parts,'
      '                             :NCR,'
      '                             :Depth,'
      '                             :D_Unit,'
      '                             :Width,'
      '                             :W_Unit,'
      '                             :Artwork,'
      '                             :Forms,'
      '                             :Plates,'
      '                             :Product,'
      '                             :Status,'
      '                             :Response,'
      '                             '#39'N'#39','
      '                             '#39'N'#39','
      '                             null,'
      '                             :Firm_Order,'
      '                             :Narrative,'
      '                             :Form_Reference) '
      ' ')
    Left = 344
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Enquiry'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Desc'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Parts'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NCR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Depth'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'D_Unit'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Width'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'W_Unit'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Artwork'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Forms'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Plates'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Product'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Response'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Firm_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Narrative'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Form_Reference'
        ParamType = ptUnknown
        Value = Null
      end>
  end
  object AddEnqLineQtySQL: TQuery
    DatabaseName = 'pb'
    SQL.Strings = (
      'insert into Enquiry_lineQuantity (enquiry,'
      '                                           Line,'
      '                                           Quantity,'
      '                                           Quotation_Price,'
      '                                           Price_Unit,'
      '                                           Supplier_Price,'
      '                                           Supplier,'
      '                                           Branch_no)'
      'values                                (:Enquiry,'
      '                                           :Line,'
      '                                           :Quantity,'
      '                                           :Quotation_Price,'
      '                                           :Price_Unit,'
      '                                           :Supplier_Price,'
      '                                           :Supplier,'
      '                                           :Branch_no)')
    Left = 344
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Enquiry'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quotation_Price'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Price_Unit'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Supplier_Price'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_no'
        ParamType = ptUnknown
      end>
  end
  object AddEnqSupplierSQL: TQuery
    DatabaseName = 'pb'
    SQL.Strings = (
      'insert into Supplier_Enquiry (Enquiry,'
      '                                            Line,'
      '                                            Supplier,'
      '                                            Branch_No,'
      '                                            Printed_Enquiry,'
      '                                            Act_response_Date,'
      '                                            Delivery_Comment,'
      '                                            Supplier_reference,'
      '                                            Contact_no)'
      'values                                 (:Enquiry,'
      '                                            :Line,'
      '                                            :Supplier,'
      '                                            :Branch,'
      '                                            :Printed_Enquiry,'
      '                                            :Act_Response_Date,'
      '                                            :Delivery_Comment,'
      '                                            :Supplier_reference,'
      '                                            :Contact_no)'
      ' '
      ' ')
    Left = 344
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Enquiry'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Printed_Enquiry'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Act_Response_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Delivery_Comment'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Supplier_reference'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Contact_no'
        ParamType = ptUnknown
      end>
  end
  object AddEnqSuppQtySQL: TQuery
    DatabaseName = 'pb'
    SQL.Strings = (
      'insert into Supplier_EnquiryQty (Enquiry,'
      '                                                  Line,'
      '                                                  Quantity,'
      '                                                  Supplier,'
      '                                                  Branch_no,'
      
        '                                                  Response_Quant' +
        'ity,'
      
        '                                                  Price_Selected' +
        ','
      '                                                  Price_Unit,'
      
        '                                                  Supplier_Price' +
        ','
      
        '                                                  Marked_up_Pric' +
        'e)'
      'values                                       (:enquiry,'
      '                                                  :Line,'
      '                                                  :Quantity,'
      '                                                  :Supplier,'
      '                                                  :Branch,'
      
        '                                                  :Response_quan' +
        'tity,'
      
        '                                                  :Price_Selecte' +
        'd,'
      '                                                  :Price_Unit,'
      
        '                                                  :Supplier_Pric' +
        'e,'
      
        '                                                  :Marked_up_Pri' +
        'ce)'
      '')
    Left = 412
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'enquiry'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Response_quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Price_Selected'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Price_Unit'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Supplier_Price'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Marked_up_Price'
        ParamType = ptUnknown
      end>
  end
  object AddEnqLinePartSQL: TQuery
    DatabaseName = 'pb'
    SQL.Strings = (
      'insert into EnquiryLinePart_Detail (enquiry,'
      '                                               Line,'
      '                                               Part_No,'
      '                                               Heading,'
      '                                               Same_as_part,'
      '                                               Paper_Brand,'
      '                                               Paper_Material,'
      '                                               Paper_Weight,'
      '                                               Paper_Colour,'
      '                                               Face_inks,'
      '                                               Reverse_inks,'
      '                                               Left_Margin_type,'
      
        '                                               Left_Margin_Width' +
        ','
      
        '                                               Right_Margin_Type' +
        ','
      
        '                                               Right_Margin_Widt' +
        'h,'
      
        '                                               No_of_Plate_chang' +
        'es,'
      '                                               Part_Description)'
      'values                                    (:enquiry,'
      '                                               :line,'
      '                                               :Part,'
      '                                               :Heading,'
      '                                               :Same_as,'
      '                                               :Brand,'
      '                                               :Material,'
      '                                               :Weight,'
      '                                               :Colour,'
      '                                               :Face,'
      '                                               :Reverse,'
      '                                               :L_Type,'
      '                                               :L_Width,'
      '                                               :R_Type,'
      '                                               :R_Width,'
      '                                               :Plates,'
      
        '                                               :Part_Description' +
        ')'
      ' ')
    Left = 416
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'enquiry'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Heading'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Same_as'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Brand'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Material'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Weight'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Colour'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Face'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Reverse'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'L_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'L_Width'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'R_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'R_Width'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Plates'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_Description'
        ParamType = ptUnknown
      end>
  end
  object qrySelEnquiry: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select *'
      'From Enquiry'
      'Where Enquiry = :EnqNo;')
    Left = 32
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'EnqNo'
        ParamType = ptUnknown
      end>
  end
  object qryInsEnquiry: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'insert into Enquiry'
      
        '(Enquiry, Date_Point, Operator, Cust_Est_Contact, Quote_Required' +
        '_By,'
      'Customer_Quote_Date, Customer, Branch_No, Rep, Description,'
      
        'Enquiry_Status, Enq_inactive, Office_Contact, Contact_no, Enquir' +
        'y_Type)'
      'values'
      
        '(:Enquiry, :Date_Point, :Operator, :Cust_Est_Contact, :Quote_Req' +
        'uired_By,'
      ':Customer_Quote_Date, :Customer, :Branch_No, :Rep, :Description,'
      
        ':Enquiry_Status, :Enq_inactive, :Office_Contact, :Contact_no, :E' +
        'nquiry_Type);'
      ' ')
    Left = 120
    Top = 184
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Enquiry'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_Point'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Operator'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Cust_Est_Contact'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Quote_Required_By'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Customer_Quote_Date'
        ParamType = ptUnknown
      end
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
        DataType = ftInteger
        Name = 'Rep'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Enquiry_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Enq_inactive'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Office_Contact'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contact_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Enquiry_Type'
        ParamType = ptUnknown
      end>
  end
  object qryUpdEnquiry: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Update Enquiry'
      'Set Date_Point = :Date_Point,'
      '    Operator = :Operator,'
      '    Cust_Est_Contact = :Cust_Est_Contact,'
      '    Quote_Required_By = :Quote_Required_By,'
      '    Customer_Quote_Date = :Customer_Quote_Date,'
      '    Customer = :Customer,'
      '    Branch_No = :Branch_No,'
      '    Rep = :Rep,'
      '    Description = :Description,'
      '    Enquiry_Status = :Enquiry_Status,'
      '    Enq_InActive = :Enq_InActive,'
      '    Office_Contact = :Office_Contact,'
      '    Contact_No = :Contact_No,'
      '    Enquiry_Type = :Enquiry_Type'
      'Where Enquiry = :Enquiry;')
    Left = 200
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Date_Point'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Operator'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Cust_Est_Contact'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Quote_Required_By'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Customer_Quote_Date'
        ParamType = ptInput
      end
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
        DataType = ftInteger
        Name = 'Rep'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Enquiry_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Enq_InActive'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Office_Contact'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contact_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Enquiry_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Enquiry'
        ParamType = ptUnknown
      end>
  end
  object qrySelCustDetails: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT Customer.Name,'
      '       Customer.Credit_Limit,'
      '       Customer.Available_Credit'
      'FROM Customer '
      'WHERE Customer = :Customer;'
      ' ')
    Left = 32
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Customer'
        ParamType = ptUnknown
      end>
  end
  object qrySelCustBrnchDetails: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT Customer_Branch.Name,'
      '       Building_No_name,'
      '       Street,'
      '       Locale,'
      '       Town,'
      '       Postcode,'
      '       Phone,'
      '       Fax_Number'
      'FROM Customer_Branch'
      'WHERE Customer = :Customer and Branch_No = :Branch_No;'
      ' '
      ' ')
    Left = 120
    Top = 224
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
      end>
  end
  object qrySelContactDetails: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select * '
      'From Customer_Contact '
      'Where Customer = :Customer and'
      '  Branch_No = :Branch_No and '
      '  Contact_No = :Contact_No;')
    Left = 200
    Top = 208
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
      end>
  end
  object qrySelCustContactNo: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select * '
      'from customer_contact '
      'where customer = :customer and '
      '  branch_no = :branch_no and '
      '  name = :name;')
    Left = 32
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'branch_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'name'
        ParamType = ptUnknown
      end>
  end
  object qrySelCustRepNo: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select * '
      'from Rep '
      'where Name = :Name;')
    Left = 120
    Top = 264
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Name'
        ParamType = ptUnknown
      end>
  end
  object qrySelRepDtls: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select * from Rep '
      'where Rep = :rep;')
    Left = 200
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'rep'
        ParamType = ptUnknown
      end>
  end
  object qrySelOperators: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select * from operator;')
    Left = 272
    Top = 184
  end
  object qrySelOperator: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select * from operator where operator = :operator;')
    Left = 272
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'operator'
        ParamType = ptUnknown
      end>
  end
  object qrySelOperatorNo: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select * from operator where operator.name = :name;')
    Left = 272
    Top = 264
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'name'
        ParamType = ptUnknown
      end>
  end
  object qrySelEnqLine: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      
        'select * from enquiryLine where enquiry = :enquiry and line = :l' +
        'ine;')
    Left = 120
    Top = 320
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'enquiry'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'line'
        ParamType = ptUnknown
      end>
  end
  object qrySelNoOfEnqLines: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      
        'select max(line) as MaxLine from EnquiryLine where enquiry = :en' +
        'quiry;')
    Left = 32
    Top = 304
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'enquiry'
        ParamType = ptUnknown
      end>
  end
  object qryInsEnqLine: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      
        'Insert into EnquiryLine(Enquiry, Line, Form_Description, No_Of_P' +
        'arts,'
      '  NCR_OTC_Mix, Depth, Depth_Unit, Width, Width_Unit,'
      
        '  Artwork_Instructions, Forms_per_box, No_of_plates, Ordered_Qua' +
        'ntity,'
      
        '  Ordered_Price, Price_Unit, Proof_Status, Proof_Date, Product_T' +
        'ype,'
      
        '  Enquiry_Status, Req_Response_Date, SelectedSupplier, SelectedB' +
        'ranch_no,'
      
        '  Printed_Quotation, Enq_InActive, Enq_InActive_Date, Enq_InActi' +
        've_Reason,'
      
        '  Firm_Order, Narrative, Form_Reference, Number_Instructions, Ru' +
        'n_On_Quantity,'
      '  Run_On_Price, Run_On_Cost)'
      'values'
      '(:Enquiry, :Line, :Form_Description, :No_Of_Parts,'
      '  :NCR_OTC_Mix, :Depth, :Depth_Unit, :Width, :Width_Unit,'
      
        '  :Artwork_Instructions, :Forms_per_box, :No_of_plates, :Ordered' +
        '_Quantity,'
      
        '  :Ordered_Price, :Price_Unit, :Proof_Status, :Proof_Date, :Prod' +
        'uct_Type,'
      
        '  :Enquiry_Status, :Req_Response_Date, :SelectedSupplier, :Selec' +
        'tedBranch_no,'
      
        '  :Printed_Quotation, :Enq_InActive, :Enq_InActive_Date, :Enq_In' +
        'Active_Reason,'
      
        '  :Firm_Order, :Narrative, :Form_Reference, :Number_Instructions' +
        ', :Run_On_Quantity,'
      '  :Run_On_Price, :Run_On_Cost);'
      ' ')
    Left = 120
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Enquiry'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Form_Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'No_Of_Parts'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NCR_OTC_Mix'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Depth'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Depth_Unit'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Width'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Width_Unit'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Artwork_Instructions'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Forms_per_box'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'No_of_plates'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Ordered_Quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Ordered_Price'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Price_Unit'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Proof_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Proof_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Product_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Enquiry_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Req_Response_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SelectedSupplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SelectedBranch_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Printed_Quotation'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Enq_InActive'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Enq_InActive_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Enq_InActive_Reason'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Firm_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Narrative'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Form_Reference'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Number_Instructions'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Run_On_Quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Run_On_Price'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Run_On_Cost'
        ParamType = ptUnknown
      end>
  end
  object qryUpdEnqLine: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Update EnquiryLine Set'
      '  Form_Description = :Form_Description,'
      
        '  No_Of_Parts = :No_Of_Parts, NCR_OTC_Mix = :NCR_OTC_Mix, Depth ' +
        '= :Depth,'
      
        '  Depth_Unit = :Depth_Unit, Width = :Width, Width_Unit = :Width_' +
        'Unit,'
      
        '  Artwork_Instructions = :Artwork_Instructions, Forms_per_box = ' +
        ':Forms_per_box,'
      
        '  No_of_plates = :No_of_plates, Ordered_Quantity = :Ordered_Quan' +
        'tity,'
      '  Ordered_Price = :Ordered_Price, Price_Unit = :Price_Unit,'
      '  Proof_Status = :Proof_Status, Proof_Date = :Proof_Date,'
      
        '  Product_Type = :Product_Type, Enquiry_Status = :Enquiry_Status' +
        ','
      
        '  Req_Response_Date = :Req_Response_Date, SelectedSupplier = :Se' +
        'lectedSupplier,'
      '  SelectedBranch_no = :SelectedBranch_no,'
      
        '  Printed_Quotation = :Printed_Quotation, Enq_InActive = :Enq_In' +
        'Active,'
      
        '  Enq_InActive_Date = :Enq_InActive_Date, Enq_InActive_Reason = ' +
        ':Enq_InActive_Reason,'
      
        '  Firm_Order = :Firm_Order, Narrative = :Narrative, Form_Referen' +
        'ce = :Form_Reference,'
      
        '  Number_Instructions = :Number_Instructions, Run_On_Quantity = ' +
        ':Run_On_Quantity,'
      '  Run_On_Price = :Run_On_Price, Run_On_Cost = :Run_On_Cost'
      'where (Enquiry = :Enquiry ) and (Line = :Line);'
      ' '
      ' ')
    Left = 120
    Top = 400
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Form_Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'No_Of_Parts'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NCR_OTC_Mix'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Depth'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Depth_Unit'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Width'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Width_Unit'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Artwork_Instructions'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Forms_per_box'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'No_of_plates'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Ordered_Quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Ordered_Price'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Price_Unit'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Proof_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Proof_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Product_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Enquiry_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Req_Response_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SelectedSupplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SelectedBranch_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Printed_Quotation'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Enq_InActive'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Enq_InActive_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Enq_InActive_Reason'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'Firm_Order'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Narrative'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Form_Reference'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Number_Instructions'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Run_On_Quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Run_On_Price'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Run_On_Cost'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Enquiry'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end>
  end
  object qrySelProdType: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select * from Product_type where product_type = :product_type;')
    Left = 32
    Top = 344
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'product_type'
        ParamType = ptUnknown
      end>
  end
  object qrySelFormRef: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      
        'Select * from Form_Reference where Form_reference = :form_refere' +
        'nce;')
    Left = 32
    Top = 384
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'form_reference'
        ParamType = ptUnknown
      end>
  end
  object qrySelPart: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select * from EnquiryLinePart_Detail '
      
        'where Enquiry = :Enquiry and Line = :Line and Part_No = :Part_No' +
        ';')
    Left = 120
    Top = 440
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Enquiry'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Part_No'
        ParamType = ptUnknown
      end>
  end
  object qrySelNoOfEnqParts: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select Part_No from EnquiryLinePart_Detail '
      'where enquiry = :enquiry and line = :line '
      'order by part_no; ')
    Left = 32
    Top = 424
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'enquiry'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'line'
        ParamType = ptUnknown
      end>
  end
  object qryInsEnqLinePart: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'insert into EnquiryLinePart_detail'
      
        '(enquiry, line, part_no, heading, same_as_part, paper_brand, pap' +
        'er_material,'
      
        'paper_weight, paper_colour, face_inks, reverse_inks, left_margin' +
        '_type,'
      'left_margin_width, right_margin_type, right_margin_width,'
      'no_of_plate_changes, part_description)'
      'values'
      
        '(:enquiry, :line, :part_no, :heading, :same_as_part, :paper_bran' +
        'd, :paper_material,'
      
        ':paper_weight, :paper_colour, :face_inks, :reverse_inks, :left_m' +
        'argin_type,'
      ':left_margin_width, :right_margin_type, :right_margin_width,'
      ':no_of_plate_changes, :part_description);')
    Left = 32
    Top = 464
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'enquiry'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'part_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'heading'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'same_as_part'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'paper_brand'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'paper_material'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'paper_weight'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'paper_colour'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'face_inks'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'reverse_inks'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'left_margin_type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'left_margin_width'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'right_margin_type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'right_margin_width'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'no_of_plate_changes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'part_description'
        ParamType = ptUnknown
      end>
  end
  object qryUpdEnqLinePart: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'update EnquiryLinePart_details set'
      '(enquiry = :enquiry, line= :line, part_no = :part_no,'
      ' heading = :heading, same_as_part = :same_as_part,'
      ' paper_brand = :paper_brand, paper_material = :paper_material,'
      ' paper_weight = :paper_weight, paper_colour = :paper_colour,'
      ' face_inks = :face_inks, reverse_inks = :reverse_inks,'
      ' left_margin_type = :left_margin_type,'
      ' left_margin_width = :left_margin_width,'
      ' right_margin_type = :right_margin_type,'
      ' right_margin_width = :right_margin_width,'
      ' no_of_plate_changes = :no_of_plate_changes,'
      ' part_desription = :part_desription);')
    Left = 120
    Top = 480
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'enquiry'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'part_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'heading'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'same_as_part'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'paper_brand'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'paper_material'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'paper_weight'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'paper_colour'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'face_inks'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'reverse_inks'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'left_margin_type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'left_margin_width'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'right_margin_type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'right_margin_width'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'no_of_plate_changes'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'part_desription'
        ParamType = ptUnknown
      end>
  end
  object qryDelEnqLinePart: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'delete from EnquirylinePart_details '
      'where enquiry = :enquiry and line = :line and part_no = :part;')
    Left = 200
    Top = 464
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'enquiry'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'part'
        ParamType = ptUnknown
      end>
  end
  object qryDelEnqLine: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      
        'delete from enquiryline where enquiry = :enquiry and line = :lin' +
        'e;')
    Left = 200
    Top = 344
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'enquiry'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'line'
        ParamType = ptUnknown
      end>
  end
  object qryDelEnq: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'delete from enquiy where enquiry = :enquiry;')
    Left = 200
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'enquiry'
        ParamType = ptUnknown
      end>
  end
  object qryDelEnqLineParts: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'delete from enquirylinepart_detail '
      'where enquiry = :enquiry and line = :line;')
    Left = 200
    Top = 424
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'enquiry'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'line'
        ParamType = ptUnknown
      end>
  end
  object qryPaperDtls: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select * from paper;')
    Left = 200
    Top = 304
  end
  object qrySelDefCustRep: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select mainrep from customer_branch '
      'where customer = :customer and branch_no = :branch_no;')
    Left = 344
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'customer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'branch_no'
        ParamType = ptUnknown
      end>
  end
  object qrySelProdTypeQs: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Product_TypeQuestion.Product_Type,'
      '       Product_TypeQuestion.Question,'
      '       Product_TypeQuestion.Question_text,'
      '       Product_TypeQuestion.Sequence_Reference,'
      '       Product_TypeQuestion.Prompt_Type,'
      '       Product_TypeQuestion.Question_Category,'
      '       question_category.question_category_descr'
      'from Product_TypeQuestion left join question_category on '
      
        '(product_typequestion.question_category = question_category.ques' +
        'tion_category)'
      'where product_type = :product_type and question = :question;'
      ' '
      ' '
      ' ')
    Left = 344
    Top = 304
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'product_type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'question'
        ParamType = ptUnknown
      end>
  end
  object qrySelNoOfProdTypeQs: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select question_category, question '
      'from product_typequestion '
      'where product_type = :product_type'
      'order by question_category, question;')
    Left = 272
    Top = 320
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'product_type'
        ParamType = ptUnknown
      end>
  end
  object qrySelProdTypeQList: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select * from product_typeQlist'
      'where product_type = :product_type  and question = :question'
      'order by question_list_no;')
    Left = 272
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'product_type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'question'
        ParamType = ptUnknown
      end>
  end
  object qrySelEnqAnswer: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select * from enquiry_questions '
      'where enquiry = :enquiry and line = :line and '
      'product_type = :product_type and question = :question;')
    Left = 344
    Top = 344
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'enquiry'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'product_type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'question'
        ParamType = ptUnknown
      end>
  end
  object qrySelEnqLineQtys: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select quantity from enquiry_linequantity '
      'where enquiry = :enquiry and line = :line '
      'order by quantity;')
    Left = 272
    Top = 400
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'enquiry'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'line'
        ParamType = ptUnknown
      end>
  end
  object qrySelEnqLineQty: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select * from enquiry_linequantity '
      
        'where enquiry = :enquiry and line = :line and quantity = :quanti' +
        'ty;')
    Left = 344
    Top = 384
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'enquiry'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'quantity'
        ParamType = ptUnknown
      end>
  end
  object qrySelPriceUnit: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select * from Price_Unit '
      'where price_unit = :price_unit;')
    Left = 272
    Top = 440
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'price_unit'
        ParamType = ptUnknown
      end>
  end
  object qrySelSupplier: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select * from supplier where supplier = :supplier;')
    Left = 344
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'supplier'
        ParamType = ptUnknown
      end>
  end
  object qrySelSupplrBrnch: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      
        'select * from supplier_branch where supplier = :supplier and bra' +
        'nch_no = :branch_no;')
    Left = 344
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'branch_no'
        ParamType = ptUnknown
      end>
  end
  object qrySelEnqQteSupls: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select supplier, branch_no '
      'from supplier_enquiry where'
      'enquiry = :enquiry and line = :line '
      'order by supplier, branch_no;')
    Left = 272
    Top = 480
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'enquiry'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'line'
        ParamType = ptUnknown
      end>
  end
  object qrySelSuppEnqQtyPrice: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select * from '
      'supplier_enquiryqty '
      'where enquiry = :enquiry and '
      'line = :line and'
      'quantity = :quantity and '
      'supplier = :supplier and '
      'branch_no = :branch_no;')
    Left = 344
    Top = 424
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'enquiry'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'branch_no'
        ParamType = ptUnknown
      end>
  end
  object qrySelNarrative: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select * from narrative_line where narrative = :narrative '
      'order by narrative_line;')
    Left = 488
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'narrative'
        ParamType = ptUnknown
      end>
  end
  object qryDelNarrative: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'delete from narrative_line where narrative = :narrative;')
    Left = 552
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'narrative'
        ParamType = ptUnknown
      end>
  end
  object qryInsNarrative: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Insert into narrative_line '
      
        '(narrative,   narrative_line,  Narrative_Line_Updated, narrative' +
        '_text)'
      'values '
      '(:narrative, :narrative_line, '#39'N'#39', :narrative_text);')
    Left = 488
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'narrative'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'narrative_line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'narrative_text'
        ParamType = ptUnknown
      end>
  end
  object qrySelMaxNarrative: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select Max(Narrative) as MaxNarrative '
      'from Narrative_Line;')
    Left = 552
    Top = 40
  end
  object qrySelSuppRespns: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select * from Supplier_Enquiry '
      'where '
      'Supplier = :Supplier and '
      'Branch_no = :Branch_No and '
      'Enquiry = :Enquiry and '
      'Line = :Line;')
    Left = 344
    Top = 464
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Enquiry'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end>
  end
  object qryInsSuppRespns: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'insert into Supplier_Enquiry'
      '(Supplier, Branch_No, Enquiry, Line, Act_Response_Date,'
      
        'Delivery_Comment, Supplier_Reference, Printed_Enquiry, Is_Update' +
        'd, Contact_No,'
      'Run_On_Quantity, Run_On_Price)'
      'values'
      '(:Supplier, :Branch_No, :Enquiry, :Line, :Act_Response_Date,'
      
        ':Delivery_Comment, :Supplier_Reference, :Printed_Enquiry, :Is_Up' +
        'dated, :Contact_No,'
      ':Run_On_Quantity, :Run_On_Price)')
    Left = 32
    Top = 504
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Branch_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Enquiry'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Line'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Act_Response_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Delivery_Comment'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Supplier_Reference'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Printed_Enquiry'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Is_Updated'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Contact_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Run_On_Quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'Run_On_Price'
        ParamType = ptUnknown
      end>
  end
  object qryDelSuppRespns: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'delete from supplier_enquiry '
      
        'where enquiry = :enquiry and line = :line and supplier = :suppli' +
        'er and '
      'branch_no = :branch_no;')
    Left = 120
    Top = 520
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'enquiry'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'branch_no'
        ParamType = ptUnknown
      end>
  end
  object qryUpdSuppRespns: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'update Supplier_Enquiry'
      'Set'
      'Act_Response_Date = :Act_Response_Date,'
      'Delivery_Comment = :Delivery_Comment,'
      'Supplier_Reference = :Supplier_Reference,'
      'Printed_Enquiry = :Printed_Enquiry,'
      'Is_Updated = :Is_Updated,'
      'Contact_No = :Contact_No,'
      'Run_On_Quantity = :Run_On_Quantity,'
      'Run_On_Price = :Run_On_Price'
      'where'
      'Supplier = :Supplier and Branch_No = :Branch_No and'
      'Enquiry = :Enquiry and Line = :Line; ')
    Left = 200
    Top = 504
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'Act_Response_Date'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Delivery_Comment'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Supplier_Reference'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Printed_Enquiry'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Is_Updated'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Contact_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Run_On_Quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'Run_On_Price'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Branch_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Enquiry'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Line'
        ParamType = ptUnknown
      end>
  end
  object qrySelPriceUnits: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select * from Price_Unit;')
    Left = 272
    Top = 520
  end
  object qrySelPriceUnitNo: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select * from Price_Unit '
      'where description = :description;')
    Left = 344
    Top = 504
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'description'
        ParamType = ptUnknown
      end>
  end
  object qryDelLineQty: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'delete from enquiry_linequantity '
      
        'where enquiry = :enquiry and line = :line and quantity = :quanti' +
        'ty;')
    Left = 416
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'enquiry'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'quantity'
        ParamType = ptUnknown
      end>
  end
  object qryInsLineQty: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'insert into enquiry_linequantity'
      
        '(enquiry, line, quantity, supplier_price, quotation_price, suppl' +
        'ier, branch_no, '
      'price_unit)'
      'values'
      
        '(:enquiry, :line, :quantity, :supplier_price, :quotation_price, ' +
        ':supplier, :branch_no,'
      ':price_unit)'
      ' ')
    Left = 416
    Top = 144
    ParamData = <
      item
        DataType = ftInteger
        Name = 'enquiry'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'line'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'supplier_price'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'quotation_price'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'branch_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'price_unit'
        ParamType = ptUnknown
      end>
  end
  object qryUpdLineQty: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'update enquiry_linequantity'
      'set'
      
        'supplier_price = :supplier_price, quotation_price = :quotation_p' +
        'rice,'
      
        'supplier = :supplier, branch_no = :branch_no, price_unit = :pric' +
        'e_unit'
      'where'
      'enquiry = :enquiry and line = :line and quantity = :quantity'
      '')
    Left = 416
    Top = 184
    ParamData = <
      item
        DataType = ftCurrency
        Name = 'supplier_price'
        ParamType = ptUnknown
      end
      item
        DataType = ftCurrency
        Name = 'quotation_price'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'branch_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'price_unit'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'enquiry'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'quantity'
        ParamType = ptUnknown
      end>
  end
  object qryInsSuppEnqQty: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Insert into supplier_enquiryqty'
      
        '(Supplier, Branch_no, Enquiry, line, quantity, supplier_price, p' +
        'rice_unit,'
      'response_quantity, price_selected, marked_up_price)'
      'values'
      
        '(:Supplier, :Branch_no, :Enquiry, :line, :quantity, :supplier_pr' +
        'ice, :price_unit,'
      ':response_quantity, :price_selected, :marked_up_price);')
    Left = 416
    Top = 224
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Enquiry'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'supplier_price'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'price_unit'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'response_quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'price_selected'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'marked_up_price'
        ParamType = ptUnknown
      end>
  end
  object qryUpdSuppEnqQty: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Update Supplier_EnquiryQty set'
      'Supplier_Price = :Supplier_Price,'
      'Price_Unit = :Price_Unit,'
      'Response_Quantity = :Response_Quantity,'
      'Price_Selected = :Price_Selected,'
      'Marked_Up_Price = :Marked_Up_Price'
      'where'
      'Supplier = :Supplier and'
      'Branch_No = :Branch_No and'
      'Enquiry = :Enquiry and'
      'Line = :Line and '
      'Quantity = :Quantity')
    Left = 416
    Top = 264
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Supplier_Price'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Price_Unit'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Response_Quantity'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Price_Selected'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Marked_Up_Price'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Enquiry'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quantity'
        ParamType = ptUnknown
      end>
  end
  object qryDelSuppEnqQty: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'delete from Supplier_EnquiryQty'
      'where'
      'Supplier = :Supplier and'
      'Branch_No = :Branch_No and'
      'Enquiry = :Enquiry and'
      'Line = :Line and'
      'Quantity = :Quantity;')
    Left = 416
    Top = 304
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Enquiry'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Quantity'
        ParamType = ptUnknown
      end>
  end
  object qrySelNoOfCapbltys: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select Capability from Product_TypeCapability'
      'where product_type = :product_type;')
    Left = 416
    Top = 360
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'product_type'
        ParamType = ptUnknown
      end>
  end
  object qrySelCapability: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select * from product_typecapability '
      'where product_type = :product_type and capability = :capability;')
    Left = 416
    Top = 400
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'product_type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'capability'
        ParamType = ptUnknown
      end>
  end
  object qrySelEnqLineCpbltys: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select * from EnquiryLinPrdct_TypCpblty '
      'where enquiry = :enquiry and line = :line and '
      'product_type = :product_type and capability = :capability;')
    Left = 416
    Top = 448
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'enquiry'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'product_type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'capability'
        ParamType = ptUnknown
      end>
  end
  object qrydelEnqLineCpbltys: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'delete from EnquiryLinPrdct_TypCpblty '
      'where enquiry = :enquiry and line = :line;')
    Left = 416
    Top = 488
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'enquiry'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'line'
        ParamType = ptUnknown
      end>
  end
  object qryInsEnqLineCpblty: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      
        'insert into EnquiryLinPrdct_TypCpblty (enquiry, line, product_ty' +
        'pe, capability) '
      'values '
      '(:enquiry, :line, :product_type, :capability);')
    Left = 416
    Top = 520
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'enquiry'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'product_type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'capability'
        ParamType = ptUnknown
      end>
  end
  object qryInsEnqAnswer: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Insert into Enquiry_Questions'
      '(Product_Type, Question, Enquiry, Line, Product_Answer)'
      'Values'
      '(:Product_Type, :Question, :Enquiry, :Line, :Product_Answer)')
    Left = 488
    Top = 80
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Product_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Question'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Enquiry'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Product_Answer'
        ParamType = ptUnknown
      end>
  end
  object qryUpdEnqAnswer: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Update Enquiry_Questions Set'
      'Product_Answer = :Product_Answer'
      'Where'
      'Product_type = :Product_Type and'
      'Question = :Question and'
      'Enquiry = :Enquiry and'
      'Line = :Line;')
    Left = 488
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Product_Answer'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Product_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Question'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Enquiry'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end>
  end
  object qryDelEnqAnswer: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Delete from Enquiry_Questions '
      'where '
      'Product_type = :Product_Type and '
      'Question = :Question and '
      'Enquiry = :Enquiry and '
      'Line = :Line;')
    Left = 488
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Product_Type'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Question'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Enquiry'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end>
  end
  object qrySelSuppBrnchConts: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select * from Supplier_BranchContacts'
      'where Supplier = :Supplier and'
      'Branch_No = :Branch_No;')
    Left = 488
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_No'
        ParamType = ptUnknown
      end>
  end
  object qrySelEnqAddNts: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select * '
      'From EnquiryLineAdditionl_Dtls '
      'where Enquiry = :Enquiry and '
      'Line = :Line;')
    Left = 488
    Top = 248
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Enquiry'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end>
  end
  object qrySelEnqAddNote: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Select * '
      'From EnquiryLineAdditionl_Dtls '
      'Where Enquiry = :Enquiry and '
      'Line = :Line and '
      'Additional_Details = :Additional_Details;')
    Left = 488
    Top = 288
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Enquiry'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Additional_Details'
        ParamType = ptUnknown
      end>
  end
  object qryDelEnqAddNote: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Delete From EnquiryLineAdditionl_Dtls '
      'Where Enquiry = :Enquiry and Line = :Line and '
      'Additional_Details = :Additional_Details;')
    Left = 488
    Top = 328
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Enquiry'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Additional_Details'
        ParamType = ptUnknown
      end>
  end
  object qryInsEnqAddNote: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Insert into EnquiryLineAdditionl_Dtls '
      '(Enquiry, Line, Additional_Details, FAO_Flag, Details) '
      'values'
      '(:Enquiry, :Line, :Additional_Details, :FAO_Flag, :Details); ')
    Left = 488
    Top = 368
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Enquiry'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Additional_Details'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FAO_Flag'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Details'
        ParamType = ptUnknown
      end>
  end
  object qryUpdEnqAddNote: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'Update EnquiryLineAdditionl_Dtls set'
      'FAO_Flag = :FAO_Flag,'
      'Details = :Details '
      'where Enquiry = :Enquiry and '
      'Line = :Line and '
      'Additional_Details = :Additional_Details')
    Left = 488
    Top = 408
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FAO_Flag'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Details'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Enquiry'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Additional_Details'
        ParamType = ptUnknown
      end>
  end
  object qrySelSuppEnqAddChrg: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select * '
      'from Supp_Enq_Add_Charge '
      'where Supplier = :supplier and '
      'branch_no = :branch_no and '
      'enquiry = :enquiry and '
      'line = :line and '
      'additional_charge = :additional_charge;')
    Left = 488
    Top = 448
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'branch_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'enquiry'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'additional_charge'
        ParamType = ptUnknown
      end>
  end
  object qrySelSuppEnqAddChrgs: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'select * '
      'from Supp_Enq_Add_Charge '
      'where Supplier = :supplier and '
      'branch_no = :branch_no and '
      'enquiry = :enquiry and '
      'line = :line;')
    Left = 488
    Top = 488
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'branch_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'enquiry'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'line'
        ParamType = ptUnknown
      end>
  end
  object qryDelSuppEnqAddChrg: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'delete '
      'from supp_enq_add_charge '
      'where '
      'supplier = :supplier and '
      'brnach_no = :branch_no and '
      'enquiry = :enquiry and '
      'line = :line and '
      'additional_charge = : additional_charge;')
    Left = 488
    Top = 528
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'branch_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'enquiry'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        ParamType = ptUnknown
      end>
  end
  object qryInsSuppEnqAddChrg: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'insert into supp_enq_add_charge '
      
        '(supplier, branch_no, enquiry, line, additional_charge, details,' +
        ' amount, quotation_price) '
      'values '
      
        '(:supplier, :branch_no, :enquiry, :line, :additional_charge, :de' +
        'tails, :amount, :quotation_price) ')
    Left = 552
    Top = 464
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'branch_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'enquiry'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'additional_charge'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'details'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'amount'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'quotation_price'
        ParamType = ptUnknown
      end>
  end
  object qryUpdSuppEnqAddChrg: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'update supp_enq_add_charge set '
      'details = :details,'
      'amount = :amount,'
      'quotation_price = :quotation_price'
      'where '
      'supplier = :supplier and '
      'branch_no = :branch_no and '
      'enquiry = :enquiry and '
      'line = :line and '
      'additional_charge = :additional_charge;')
    Left = 552
    Top = 504
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'details'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'amount'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'quotation_price'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'branch_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'enquiry'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'line'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'additional_charge'
        ParamType = ptUnknown
      end>
  end
  object qryDelSuppEnqAddChrgs: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'delete from supp_enq_add_charge '
      'where '
      'supplier = :supplier and '
      'branch_no = :branch_no and '
      'enquiry = :enquiry and '
      'line = :line;')
    Left = 552
    Top = 424
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'branch_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'enquiry'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'line'
        ParamType = ptUnknown
      end>
  end
  object dtsrcSuppBrnchConts: TDataSource
    DataSet = qrySelSuppBrnchConts
    Left = 200
    Top = 56
  end
  object qryInsQuote: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'insert into Enquiry'
      
        '(Enquiry, Date_Point, Operator, Cust_Est_Contact, Quote_Required' +
        '_By,'
      'Customer_Quote_Date, Customer, Branch_No, Rep, Description,'
      
        'Enquiry_Status, Enq_inactive, Office_Contact, Contact_no, Enquir' +
        'y_Type)'
      'values'
      
        '(:Enquiry, :Date_Point, :Operator, :Cust_Est_Contact, :Quote_Req' +
        'uired_By,'
      ':Customer_Quote_Date, :Customer, :Branch_No, :Rep, :Description,'
      
        ':Enquiry_Status, :Enq_inactive, :Office_Contact, :Contact_no, :E' +
        'nquiry_Type);'
      ' ')
    Left = 272
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Enquiry'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Date_Point'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Operator'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Cust_Est_Contact'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Quote_Required_By'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'Customer_Quote_Date'
        ParamType = ptUnknown
      end
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
        DataType = ftInteger
        Name = 'Rep'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Description'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Enquiry_Status'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Enq_inactive'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'Office_Contact'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Contact_no'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Enquiry_Type'
        ParamType = ptUnknown
      end>
  end
  object qryReserveSlot: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'INSERT INTO Narrative_Line'
      
        '  (Narrative, Narrative_Line, Narrative_Text, Narrative_Line_Upd' +
        'ated)'
      '  SELECT MAX(Narrative)+1, 1, :GUID, '#39'N'#39' FROM Narrative_Line'
      ' '
      ' ')
    Left = 552
    Top = 136
    ParamData = <
      item
        DataType = ftString
        Name = 'GUID'
        ParamType = ptInput
      end>
  end
  object qryGetReservedSlot: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'SELECT * FROM narrative_line '
      'WHERE narrative_Text = :GUID')
    Left = 552
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'GUID'
        ParamType = ptUnknown
      end>
  end
  object qryDelSuppEnqQtys: TQuery
    DatabaseName = 'PB'
    SQL.Strings = (
      'delete from Supplier_EnquiryQty'
      'where'
      'Supplier = :Supplier and'
      'Branch_No = :Branch_No and'
      'Enquiry = :Enquiry and'
      'Line = :Line;')
    Left = 552
    Top = 184
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Supplier'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Branch_No'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Enquiry'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Line'
        ParamType = ptUnknown
      end>
  end
end
