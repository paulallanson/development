object PBEnqDM: TPBEnqDM
  Height = 635
  Width = 829
  object GetCustContSQL: TFDQuery
    ConnectionName = 'PB'
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
        Name = 'Customer'
        DataType = ftInteger
      end
      item
        Name = 'Branch_No'
        DataType = ftInteger
      end
      item
        Name = 'Contact_no'
      end>
  end
  object GetCustContSRC: TDataSource
    DataSet = GetCustContSQL
    Left = 120
    Top = 16
  end
  object GetOpSQL: TFDQuery
    ConnectionName = 'PB'
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
  object GetPriceUnitSQL: TFDQuery
    ConnectionName = 'PB'
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
  object qryCompany: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select In_Use_By from Company Where Company = 1')
    Left = 200
  end
  object GetLastSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Last_Enquiry_Number'
      'From Company'
      'Where Company = 1')
    Left = 272
  end
  object UpdLastSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Company'
      'Set Last_Enquiry_Number = :Last_Enquiry_Number'
      'Where Company = 1')
    Left = 272
    Top = 40
    ParamData = <
      item
        Name = 'Last_Enquiry_Number'
      end>
  end
  object AddEnqHeaderSQL: TFDQuery
    ConnectionName = 'pb'
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
        Name = 'Enquiry'
      end
      item
        Name = 'Enq_Date'
      end
      item
        Name = 'Operator'
      end
      item
        Name = 'Contact'
      end
      item
        Name = 'Req_Date'
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_No'
      end
      item
        Name = 'Desc'
      end
      item
        Name = 'Rep'
      end
      item
        Name = 'Status'
      end
      item
        Name = 'Office_Contact'
      end
      item
        Name = 'Contact_no'
      end>
  end
  object GetCustRepSQL: TFDQuery
    ConnectionName = 'PB'
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
        Name = 'Customer'
        DataType = ftInteger
      end
      item
        Name = 'Branch_No'
        DataType = ftInteger
      end>
  end
  object CustRepSRC: TDataSource
    DataSet = GetCustRepSQL
    Left = 120
    Top = 136
  end
  object AddEnqLineSQL: TFDQuery
    ConnectionName = 'pb'
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
        Name = 'Enquiry'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Desc'
      end
      item
        Name = 'Parts'
      end
      item
        Name = 'NCR'
      end
      item
        Name = 'Depth'
      end
      item
        Name = 'D_Unit'
      end
      item
        Name = 'Width'
      end
      item
        Name = 'W_Unit'
      end
      item
        Name = 'Artwork'
      end
      item
        Name = 'Forms'
      end
      item
        Name = 'Plates'
      end
      item
        Name = 'Product'
      end
      item
        Name = 'Status'
      end
      item
        Name = 'Response'
      end
      item
        Name = 'Firm_Order'
      end
      item
        Name = 'Narrative'
      end
      item
        Name = 'Form_Reference'
        DataType = ftInteger
        Value = Null
      end>
  end
  object AddEnqLineQtySQL: TFDQuery
    ConnectionName = 'pb'
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
        Name = 'Enquiry'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Quantity'
      end
      item
        Name = 'Quotation_Price'
      end
      item
        Name = 'Price_Unit'
      end
      item
        Name = 'Supplier_Price'
      end
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_no'
      end>
  end
  object AddEnqSupplierSQL: TFDQuery
    ConnectionName = 'pb'
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
        Name = 'Enquiry'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch'
      end
      item
        Name = 'Printed_Enquiry'
      end
      item
        Name = 'Act_Response_Date'
      end
      item
        Name = 'Delivery_Comment'
      end
      item
        Name = 'Supplier_reference'
      end
      item
        Name = 'Contact_no'
        DataType = ftInteger
      end>
  end
  object AddEnqSuppQtySQL: TFDQuery
    ConnectionName = 'pb'
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
        Name = 'enquiry'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Quantity'
      end
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch'
      end
      item
        Name = 'Response_quantity'
      end
      item
        Name = 'Price_Selected'
      end
      item
        Name = 'Price_Unit'
      end
      item
        Name = 'Supplier_Price'
      end
      item
        Name = 'Marked_up_Price'
      end>
  end
  object AddEnqLinePartSQL: TFDQuery
    ConnectionName = 'pb'
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
        Name = 'enquiry'
      end
      item
        Name = 'line'
      end
      item
        Name = 'Part'
      end
      item
        Name = 'Heading'
        DataType = ftString
      end
      item
        Name = 'Same_as'
      end
      item
        Name = 'Brand'
        DataType = ftString
      end
      item
        Name = 'Material'
        DataType = ftString
      end
      item
        Name = 'Weight'
        DataType = ftString
      end
      item
        Name = 'Colour'
        DataType = ftString
      end
      item
        Name = 'Face'
        DataType = ftString
      end
      item
        Name = 'Reverse'
        DataType = ftString
      end
      item
        Name = 'L_Type'
        DataType = ftString
      end
      item
        Name = 'L_Width'
        DataType = ftString
      end
      item
        Name = 'R_Type'
        DataType = ftString
      end
      item
        Name = 'R_Width'
        DataType = ftString
      end
      item
        Name = 'Plates'
      end
      item
        Name = 'Part_Description'
      end>
  end
  object qrySelEnquiry: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select *'
      'From Enquiry'
      'Where Enquiry = :EnqNo;')
    Left = 32
    Top = 168
    ParamData = <
      item
        Name = 'EnqNo'
      end>
  end
  object qryInsEnquiry: TFDQuery
    ConnectionName = 'PB'
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
        Name = 'Enquiry'
      end
      item
        Name = 'Date_Point'
      end
      item
        Name = 'Operator'
      end
      item
        Name = 'Cust_Est_Contact'
      end
      item
        Name = 'Quote_Required_By'
        DataType = ftDateTime
      end
      item
        Name = 'Customer_Quote_Date'
        DataType = ftDateTime
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_No'
      end
      item
        Name = 'Rep'
        DataType = ftInteger
      end
      item
        Name = 'Description'
      end
      item
        Name = 'Enquiry_Status'
      end
      item
        Name = 'Enq_inactive'
      end
      item
        Name = 'Office_Contact'
        DataType = ftInteger
      end
      item
        Name = 'Contact_no'
      end
      item
        Name = 'Enquiry_Type'
      end>
  end
  object qryUpdEnquiry: TFDQuery
    ConnectionName = 'PB'
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
        Name = 'Date_Point'
      end
      item
        Name = 'Operator'
      end
      item
        Name = 'Cust_Est_Contact'
      end
      item
        Name = 'Quote_Required_By'
        DataType = ftDateTime
      end
      item
        Name = 'Customer_Quote_Date'
        DataType = ftDateTime
        ParamType = ptInput
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_No'
      end
      item
        Name = 'Rep'
        DataType = ftInteger
      end
      item
        Name = 'Description'
      end
      item
        Name = 'Enquiry_Status'
      end
      item
        Name = 'Enq_InActive'
      end
      item
        Name = 'Office_Contact'
        DataType = ftDateTime
      end
      item
        Name = 'Contact_No'
      end
      item
        Name = 'Enquiry_Type'
      end
      item
        Name = 'Enquiry'
      end>
  end
  object qrySelCustDetails: TFDQuery
    ConnectionName = 'PB'
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
        Name = 'Customer'
      end>
  end
  object qrySelCustBrnchDetails: TFDQuery
    ConnectionName = 'PB'
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
        Name = 'Customer'
      end
      item
        Name = 'Branch_No'
      end>
  end
  object qrySelContactDetails: TFDQuery
    ConnectionName = 'PB'
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
        Name = 'Customer'
      end
      item
        Name = 'Branch_No'
      end
      item
        Name = 'Contact_No'
      end>
  end
  object qrySelCustContactNo: TFDQuery
    ConnectionName = 'PB'
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
        Name = 'customer'
      end
      item
        Name = 'branch_no'
      end
      item
        Name = 'name'
      end>
  end
  object qrySelCustRepNo: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select * '
      'from Rep '
      'where Name = :Name;')
    Left = 120
    Top = 264
    ParamData = <
      item
        Name = 'Name'
      end>
  end
  object qrySelRepDtls: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from Rep '
      'where Rep = :rep;')
    Left = 200
    Top = 248
    ParamData = <
      item
        Name = 'rep'
      end>
  end
  object qrySelOperators: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from operator;')
    Left = 272
    Top = 184
  end
  object qrySelOperator: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from operator where operator = :operator;')
    Left = 272
    Top = 224
    ParamData = <
      item
        Name = 'operator'
      end>
  end
  object qrySelOperatorNo: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from operator where operator.name = :name;')
    Left = 272
    Top = 264
    ParamData = <
      item
        Name = 'name'
      end>
  end
  object qrySelEnqLine: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'select * from enquiryLine where enquiry = :enquiry and line = :l' +
        'ine;')
    Left = 120
    Top = 320
    ParamData = <
      item
        Name = 'enquiry'
      end
      item
        Name = 'line'
      end>
  end
  object qrySelNoOfEnqLines: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'select max(line) as MaxLine from EnquiryLine where enquiry = :en' +
        'quiry;')
    Left = 32
    Top = 304
    ParamData = <
      item
        Name = 'enquiry'
      end>
  end
  object qryInsEnqLine: TFDQuery
    ConnectionName = 'PB'
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
        Name = 'Enquiry'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Form_Description'
      end
      item
        Name = 'No_Of_Parts'
        DataType = ftInteger
      end
      item
        Name = 'NCR_OTC_Mix'
      end
      item
        Name = 'Depth'
      end
      item
        Name = 'Depth_Unit'
      end
      item
        Name = 'Width'
      end
      item
        Name = 'Width_Unit'
      end
      item
        Name = 'Artwork_Instructions'
      end
      item
        Name = 'Forms_per_box'
      end
      item
        Name = 'No_of_plates'
      end
      item
        Name = 'Ordered_Quantity'
      end
      item
        Name = 'Ordered_Price'
      end
      item
        Name = 'Price_Unit'
        DataType = ftInteger
      end
      item
        Name = 'Proof_Status'
        DataType = ftString
      end
      item
        Name = 'Proof_Date'
        DataType = ftDateTime
      end
      item
        Name = 'Product_Type'
      end
      item
        Name = 'Enquiry_Status'
      end
      item
        Name = 'Req_Response_Date'
      end
      item
        Name = 'SelectedSupplier'
        DataType = ftInteger
      end
      item
        Name = 'SelectedBranch_no'
        DataType = ftInteger
      end
      item
        Name = 'Printed_Quotation'
        DataType = ftString
      end
      item
        Name = 'Enq_InActive'
      end
      item
        Name = 'Enq_InActive_Date'
        DataType = ftDateTime
      end
      item
        Name = 'Enq_InActive_Reason'
        DataType = ftInteger
      end
      item
        Name = 'Firm_Order'
      end
      item
        Name = 'Narrative'
      end
      item
        Name = 'Form_Reference'
        DataType = ftInteger
      end
      item
        Name = 'Number_Instructions'
      end
      item
        Name = 'Run_On_Quantity'
      end
      item
        Name = 'Run_On_Price'
      end
      item
        Name = 'Run_On_Cost'
      end>
  end
  object qryUpdEnqLine: TFDQuery
    ConnectionName = 'PB'
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
        Name = 'Form_Description'
      end
      item
        Name = 'No_Of_Parts'
        DataType = ftInteger
      end
      item
        Name = 'NCR_OTC_Mix'
      end
      item
        Name = 'Depth'
      end
      item
        Name = 'Depth_Unit'
      end
      item
        Name = 'Width'
      end
      item
        Name = 'Width_Unit'
      end
      item
        Name = 'Artwork_Instructions'
      end
      item
        Name = 'Forms_per_box'
      end
      item
        Name = 'No_of_plates'
      end
      item
        Name = 'Ordered_Quantity'
      end
      item
        Name = 'Ordered_Price'
      end
      item
        Name = 'Price_Unit'
        DataType = ftInteger
      end
      item
        Name = 'Proof_Status'
        DataType = ftString
      end
      item
        Name = 'Proof_Date'
        DataType = ftDateTime
      end
      item
        Name = 'Product_Type'
      end
      item
        Name = 'Enquiry_Status'
      end
      item
        Name = 'Req_Response_Date'
      end
      item
        Name = 'SelectedSupplier'
        DataType = ftInteger
      end
      item
        Name = 'SelectedBranch_no'
        DataType = ftInteger
      end
      item
        Name = 'Printed_Quotation'
      end
      item
        Name = 'Enq_InActive'
      end
      item
        Name = 'Enq_InActive_Date'
        DataType = ftDateTime
      end
      item
        Name = 'Enq_InActive_Reason'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Firm_Order'
      end
      item
        Name = 'Narrative'
      end
      item
        Name = 'Form_Reference'
        DataType = ftInteger
      end
      item
        Name = 'Number_Instructions'
      end
      item
        Name = 'Run_On_Quantity'
      end
      item
        Name = 'Run_On_Price'
      end
      item
        Name = 'Run_On_Cost'
      end
      item
        Name = 'Enquiry'
      end
      item
        Name = 'Line'
      end>
  end
  object qrySelProdType: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from Product_type where product_type = :product_type;')
    Left = 32
    Top = 344
    ParamData = <
      item
        Name = 'product_type'
      end>
  end
  object qrySelFormRef: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'Select * from Form_Reference where Form_reference = :form_refere' +
        'nce;')
    Left = 32
    Top = 384
    ParamData = <
      item
        Name = 'form_reference'
      end>
  end
  object qrySelPart: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from EnquiryLinePart_Detail '
      
        'where Enquiry = :Enquiry and Line = :Line and Part_No = :Part_No' +
        ';')
    Left = 120
    Top = 440
    ParamData = <
      item
        Name = 'Enquiry'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Part_No'
      end>
  end
  object qrySelNoOfEnqParts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Part_No from EnquiryLinePart_Detail '
      'where enquiry = :enquiry and line = :line '
      'order by part_no; ')
    Left = 32
    Top = 424
    ParamData = <
      item
        Name = 'enquiry'
      end
      item
        Name = 'line'
      end>
  end
  object qryInsEnqLinePart: TFDQuery
    ConnectionName = 'PB'
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
        Name = 'enquiry'
      end
      item
        Name = 'line'
      end
      item
        Name = 'part_no'
      end
      item
        Name = 'heading'
      end
      item
        Name = 'same_as_part'
      end
      item
        Name = 'paper_brand'
      end
      item
        Name = 'paper_material'
      end
      item
        Name = 'paper_weight'
      end
      item
        Name = 'paper_colour'
      end
      item
        Name = 'face_inks'
      end
      item
        Name = 'reverse_inks'
      end
      item
        Name = 'left_margin_type'
      end
      item
        Name = 'left_margin_width'
      end
      item
        Name = 'right_margin_type'
      end
      item
        Name = 'right_margin_width'
      end
      item
        Name = 'no_of_plate_changes'
      end
      item
        Name = 'part_description'
      end>
  end
  object qryUpdEnqLinePart: TFDQuery
    ConnectionName = 'PB'
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
        Name = 'enquiry'
      end
      item
        Name = 'line'
      end
      item
        Name = 'part_no'
      end
      item
        Name = 'heading'
      end
      item
        Name = 'same_as_part'
      end
      item
        Name = 'paper_brand'
      end
      item
        Name = 'paper_material'
      end
      item
        Name = 'paper_weight'
      end
      item
        Name = 'paper_colour'
      end
      item
        Name = 'face_inks'
      end
      item
        Name = 'reverse_inks'
      end
      item
        Name = 'left_margin_type'
      end
      item
        Name = 'left_margin_width'
      end
      item
        Name = 'right_margin_type'
      end
      item
        Name = 'right_margin_width'
      end
      item
        Name = 'no_of_plate_changes'
      end
      item
        Name = 'part_desription'
      end>
  end
  object qryDelEnqLinePart: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from EnquirylinePart_details '
      'where enquiry = :enquiry and line = :line and part_no = :part;')
    Left = 200
    Top = 464
    ParamData = <
      item
        Name = 'enquiry'
      end
      item
        Name = 'line'
      end
      item
        Name = 'part'
      end>
  end
  object qryDelEnqLine: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'delete from enquiryline where enquiry = :enquiry and line = :lin' +
        'e;')
    Left = 200
    Top = 344
    ParamData = <
      item
        Name = 'enquiry'
      end
      item
        Name = 'line'
      end>
  end
  object qryDelEnq: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from enquiy where enquiry = :enquiry;')
    Left = 200
    Top = 120
    ParamData = <
      item
        Name = 'enquiry'
      end>
  end
  object qryDelEnqLineParts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from enquirylinepart_detail '
      'where enquiry = :enquiry and line = :line;')
    Left = 200
    Top = 424
    ParamData = <
      item
        Name = 'enquiry'
      end
      item
        Name = 'line'
      end>
  end
  object qryPaperDtls: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from paper;')
    Left = 200
    Top = 304
  end
  object qrySelDefCustRep: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select mainrep from customer_branch '
      'where customer = :customer and branch_no = :branch_no;')
    Left = 344
    Top = 248
    ParamData = <
      item
        Name = 'customer'
      end
      item
        Name = 'branch_no'
      end>
  end
  object qrySelProdTypeQs: TFDQuery
    ConnectionName = 'PB'
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
        Name = 'product_type'
      end
      item
        Name = 'question'
      end>
  end
  object qrySelNoOfProdTypeQs: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select question_category, question '
      'from product_typequestion '
      'where product_type = :product_type'
      'order by question_category, question;')
    Left = 272
    Top = 320
    ParamData = <
      item
        Name = 'product_type'
      end>
  end
  object qrySelProdTypeQList: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from product_typeQlist'
      'where product_type = :product_type  and question = :question'
      'order by question_list_no;')
    Left = 272
    Top = 360
    ParamData = <
      item
        Name = 'product_type'
      end
      item
        Name = 'question'
      end>
  end
  object qrySelEnqAnswer: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from enquiry_questions '
      'where enquiry = :enquiry and line = :line and '
      'product_type = :product_type and question = :question;')
    Left = 344
    Top = 344
    ParamData = <
      item
        Name = 'enquiry'
      end
      item
        Name = 'line'
      end
      item
        Name = 'product_type'
      end
      item
        Name = 'question'
      end>
  end
  object qrySelEnqLineQtys: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select quantity from enquiry_linequantity '
      'where enquiry = :enquiry and line = :line '
      'order by quantity;')
    Left = 272
    Top = 400
    ParamData = <
      item
        Name = 'enquiry'
      end
      item
        Name = 'line'
      end>
  end
  object qrySelEnqLineQty: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from enquiry_linequantity '
      
        'where enquiry = :enquiry and line = :line and quantity = :quanti' +
        'ty;')
    Left = 344
    Top = 384
    ParamData = <
      item
        Name = 'enquiry'
      end
      item
        Name = 'line'
      end
      item
        Name = 'quantity'
      end>
  end
  object qrySelPriceUnit: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from Price_Unit '
      'where price_unit = :price_unit;')
    Left = 272
    Top = 440
    ParamData = <
      item
        Name = 'price_unit'
      end>
  end
  object qrySelSupplier: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from supplier where supplier = :supplier;')
    Left = 344
    Top = 168
    ParamData = <
      item
        Name = 'supplier'
      end>
  end
  object qrySelSupplrBrnch: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'select * from supplier_branch where supplier = :supplier and bra' +
        'nch_no = :branch_no;')
    Left = 344
    Top = 208
    ParamData = <
      item
        Name = 'supplier'
      end
      item
        Name = 'branch_no'
      end>
  end
  object qrySelEnqQteSupls: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select supplier, branch_no '
      'from supplier_enquiry where'
      'enquiry = :enquiry and line = :line '
      'order by supplier, branch_no;')
    Left = 272
    Top = 480
    ParamData = <
      item
        Name = 'enquiry'
      end
      item
        Name = 'line'
      end>
  end
  object qrySelSuppEnqQtyPrice: TFDQuery
    ConnectionName = 'PB'
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
        Name = 'enquiry'
      end
      item
        Name = 'line'
      end
      item
        Name = 'quantity'
      end
      item
        Name = 'supplier'
      end
      item
        Name = 'branch_no'
      end>
  end
  object qrySelNarrative: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from narrative_line where narrative = :narrative '
      'order by narrative_line;')
    Left = 488
    ParamData = <
      item
        Name = 'narrative'
      end>
  end
  object qryDelNarrative: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from narrative_line where narrative = :narrative;')
    Left = 552
    ParamData = <
      item
        Name = 'narrative'
      end>
  end
  object qryInsNarrative: TFDQuery
    ConnectionName = 'PB'
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
        Name = 'narrative'
      end
      item
        Name = 'narrative_line'
      end
      item
        Name = 'narrative_text'
      end>
  end
  object qrySelMaxNarrative: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Max(Narrative) as MaxNarrative '
      'from Narrative_Line;')
    Left = 552
    Top = 40
  end
  object qrySelSuppRespns: TFDQuery
    ConnectionName = 'PB'
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
  object qryInsSuppRespns: TFDQuery
    ConnectionName = 'PB'
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
        Name = 'Supplier'
        DataType = ftInteger
      end
      item
        Name = 'Branch_No'
        DataType = ftInteger
      end
      item
        Name = 'Enquiry'
        DataType = ftInteger
      end
      item
        Name = 'Line'
        DataType = ftInteger
      end
      item
        Name = 'Act_Response_Date'
        DataType = ftDateTime
      end
      item
        Name = 'Delivery_Comment'
        DataType = ftString
      end
      item
        Name = 'Supplier_Reference'
        DataType = ftString
      end
      item
        Name = 'Printed_Enquiry'
        DataType = ftString
      end
      item
        Name = 'Is_Updated'
        DataType = ftString
      end
      item
        Name = 'Contact_No'
        DataType = ftInteger
      end
      item
        Name = 'Run_On_Quantity'
        DataType = ftFloat
      end
      item
        Name = 'Run_On_Price'
        DataType = ftCurrency
      end>
  end
  object qryDelSuppRespns: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from supplier_enquiry '
      
        'where enquiry = :enquiry and line = :line and supplier = :suppli' +
        'er and '
      'branch_no = :branch_no;')
    Left = 120
    Top = 520
    ParamData = <
      item
        Name = 'enquiry'
      end
      item
        Name = 'line'
      end
      item
        Name = 'supplier'
      end
      item
        Name = 'branch_no'
      end>
  end
  object qryUpdSuppRespns: TFDQuery
    ConnectionName = 'PB'
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
        Name = 'Act_Response_Date'
        DataType = ftDateTime
      end
      item
        Name = 'Delivery_Comment'
        DataType = ftString
      end
      item
        Name = 'Supplier_Reference'
        DataType = ftString
      end
      item
        Name = 'Printed_Enquiry'
        DataType = ftString
      end
      item
        Name = 'Is_Updated'
        DataType = ftString
      end
      item
        Name = 'Contact_No'
        DataType = ftInteger
      end
      item
        Name = 'Run_On_Quantity'
        DataType = ftFloat
      end
      item
        Name = 'Run_On_Price'
        DataType = ftCurrency
      end
      item
        Name = 'Supplier'
        DataType = ftInteger
      end
      item
        Name = 'Branch_No'
        DataType = ftInteger
      end
      item
        Name = 'Enquiry'
        DataType = ftInteger
      end
      item
        Name = 'Line'
        DataType = ftInteger
      end>
  end
  object qrySelPriceUnits: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from Price_Unit;')
    Left = 272
    Top = 520
  end
  object qrySelPriceUnitNo: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from Price_Unit '
      'where description = :description;')
    Left = 344
    Top = 504
    ParamData = <
      item
        Name = 'description'
      end>
  end
  object qryDelLineQty: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from enquiry_linequantity '
      
        'where enquiry = :enquiry and line = :line and quantity = :quanti' +
        'ty;')
    Left = 416
    Top = 104
    ParamData = <
      item
        Name = 'enquiry'
      end
      item
        Name = 'line'
      end
      item
        Name = 'quantity'
      end>
  end
  object qryInsLineQty: TFDQuery
    ConnectionName = 'PB'
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
        Name = 'enquiry'
        DataType = ftInteger
      end
      item
        Name = 'line'
        DataType = ftInteger
      end
      item
        Name = 'quantity'
        DataType = ftFloat
      end
      item
        Name = 'supplier_price'
        DataType = ftCurrency
      end
      item
        Name = 'quotation_price'
        DataType = ftCurrency
      end
      item
        Name = 'supplier'
        DataType = ftInteger
      end
      item
        Name = 'branch_no'
        DataType = ftInteger
      end
      item
        Name = 'price_unit'
        DataType = ftInteger
      end>
  end
  object qryUpdLineQty: TFDQuery
    ConnectionName = 'PB'
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
        Name = 'supplier_price'
        DataType = ftCurrency
      end
      item
        Name = 'quotation_price'
        DataType = ftCurrency
      end
      item
        Name = 'supplier'
        DataType = ftInteger
      end
      item
        Name = 'branch_no'
        DataType = ftInteger
      end
      item
        Name = 'price_unit'
        DataType = ftInteger
      end
      item
        Name = 'enquiry'
      end
      item
        Name = 'line'
      end
      item
        Name = 'quantity'
      end>
  end
  object qryInsSuppEnqQty: TFDQuery
    ConnectionName = 'PB'
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
        Name = 'Supplier'
      end
      item
        Name = 'Branch_no'
      end
      item
        Name = 'Enquiry'
      end
      item
        Name = 'line'
      end
      item
        Name = 'quantity'
      end
      item
        Name = 'supplier_price'
      end
      item
        Name = 'price_unit'
        DataType = ftInteger
      end
      item
        Name = 'response_quantity'
      end
      item
        Name = 'price_selected'
      end
      item
        Name = 'marked_up_price'
      end>
  end
  object qryUpdSuppEnqQty: TFDQuery
    ConnectionName = 'PB'
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
        Name = 'Supplier_Price'
      end
      item
        Name = 'Price_Unit'
        DataType = ftInteger
      end
      item
        Name = 'Response_Quantity'
      end
      item
        Name = 'Price_Selected'
      end
      item
        Name = 'Marked_Up_Price'
      end
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
      end
      item
        Name = 'Quantity'
      end>
  end
  object qryDelSuppEnqQty: TFDQuery
    ConnectionName = 'PB'
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
      end
      item
        Name = 'Quantity'
      end>
  end
  object qrySelNoOfCapbltys: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select Capability from Product_TypeCapability'
      'where product_type = :product_type;')
    Left = 416
    Top = 360
    ParamData = <
      item
        Name = 'product_type'
      end>
  end
  object qrySelCapability: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from product_typecapability '
      'where product_type = :product_type and capability = :capability;')
    Left = 416
    Top = 400
    ParamData = <
      item
        Name = 'product_type'
      end
      item
        Name = 'capability'
      end>
  end
  object qrySelEnqLineCpbltys: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from EnquiryLinPrdct_TypCpblty '
      'where enquiry = :enquiry and line = :line and '
      'product_type = :product_type and capability = :capability;')
    Left = 416
    Top = 448
    ParamData = <
      item
        Name = 'enquiry'
      end
      item
        Name = 'line'
      end
      item
        Name = 'product_type'
      end
      item
        Name = 'capability'
      end>
  end
  object qrydelEnqLineCpbltys: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from EnquiryLinPrdct_TypCpblty '
      'where enquiry = :enquiry and line = :line;')
    Left = 416
    Top = 488
    ParamData = <
      item
        Name = 'enquiry'
      end
      item
        Name = 'line'
      end>
  end
  object qryInsEnqLineCpblty: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'insert into EnquiryLinPrdct_TypCpblty (enquiry, line, product_ty' +
        'pe, capability) '
      'values '
      '(:enquiry, :line, :product_type, :capability);')
    Left = 416
    Top = 520
    ParamData = <
      item
        Name = 'enquiry'
      end
      item
        Name = 'line'
      end
      item
        Name = 'product_type'
      end
      item
        Name = 'capability'
      end>
  end
  object qryInsEnqAnswer: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert into Enquiry_Questions'
      '(Product_Type, Question, Enquiry, Line, Product_Answer)'
      'Values'
      '(:Product_Type, :Question, :Enquiry, :Line, :Product_Answer)')
    Left = 488
    Top = 80
    ParamData = <
      item
        Name = 'Product_Type'
      end
      item
        Name = 'Question'
      end
      item
        Name = 'Enquiry'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Product_Answer'
      end>
  end
  object qryUpdEnqAnswer: TFDQuery
    ConnectionName = 'PB'
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
        Name = 'Product_Answer'
      end
      item
        Name = 'Product_Type'
      end
      item
        Name = 'Question'
      end
      item
        Name = 'Enquiry'
      end
      item
        Name = 'Line'
      end>
  end
  object qryDelEnqAnswer: TFDQuery
    ConnectionName = 'PB'
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
        Name = 'Product_Type'
      end
      item
        Name = 'Question'
      end
      item
        Name = 'Enquiry'
      end
      item
        Name = 'Line'
      end>
  end
  object qrySelSuppBrnchConts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select * from Supplier_BranchContacts'
      'where Supplier = :Supplier and'
      'Branch_No = :Branch_No;')
    Left = 488
    Top = 208
    ParamData = <
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_No'
      end>
  end
  object qrySelEnqAddNts: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select * '
      'From EnquiryLineAdditionl_Dtls '
      'where Enquiry = :Enquiry and '
      'Line = :Line;')
    Left = 488
    Top = 248
    ParamData = <
      item
        Name = 'Enquiry'
      end
      item
        Name = 'Line'
      end>
  end
  object qrySelEnqAddNote: TFDQuery
    ConnectionName = 'PB'
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
        Name = 'Enquiry'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Additional_Details'
      end>
  end
  object qryDelEnqAddNote: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Delete From EnquiryLineAdditionl_Dtls '
      'Where Enquiry = :Enquiry and Line = :Line and '
      'Additional_Details = :Additional_Details;')
    Left = 488
    Top = 328
    ParamData = <
      item
        Name = 'Enquiry'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Additional_Details'
      end>
  end
  object qryInsEnqAddNote: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert into EnquiryLineAdditionl_Dtls '
      '(Enquiry, Line, Additional_Details, FAO_Flag, Details) '
      'values'
      '(:Enquiry, :Line, :Additional_Details, :FAO_Flag, :Details); ')
    Left = 488
    Top = 368
    ParamData = <
      item
        Name = 'Enquiry'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Additional_Details'
      end
      item
        Name = 'FAO_Flag'
      end
      item
        Name = 'Details'
      end>
  end
  object qryUpdEnqAddNote: TFDQuery
    ConnectionName = 'PB'
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
        Name = 'FAO_Flag'
      end
      item
        Name = 'Details'
      end
      item
        Name = 'Enquiry'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Additional_Details'
      end>
  end
  object qrySelSuppEnqAddChrg: TFDQuery
    ConnectionName = 'PB'
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
        Name = 'supplier'
      end
      item
        Name = 'branch_no'
      end
      item
        Name = 'enquiry'
      end
      item
        Name = 'line'
      end
      item
        Name = 'additional_charge'
      end>
  end
  object qrySelSuppEnqAddChrgs: TFDQuery
    ConnectionName = 'PB'
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
        Name = 'supplier'
      end
      item
        Name = 'branch_no'
      end
      item
        Name = 'enquiry'
      end
      item
        Name = 'line'
      end>
  end
  object qryDelSuppEnqAddChrg: TFDQuery
    ConnectionName = 'PB'
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
        Name = 'supplier'
      end
      item
        Name = 'branch_no'
      end
      item
        Name = 'enquiry'
      end
      item
        Name = 'line'
      end
      item
      end>
  end
  object qryInsSuppEnqAddChrg: TFDQuery
    ConnectionName = 'PB'
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
        Name = 'supplier'
      end
      item
        Name = 'branch_no'
      end
      item
        Name = 'enquiry'
      end
      item
        Name = 'line'
      end
      item
        Name = 'additional_charge'
      end
      item
        Name = 'details'
      end
      item
        Name = 'amount'
      end
      item
        Name = 'quotation_price'
      end>
  end
  object qryUpdSuppEnqAddChrg: TFDQuery
    ConnectionName = 'PB'
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
        Name = 'details'
      end
      item
        Name = 'amount'
      end
      item
        Name = 'quotation_price'
      end
      item
        Name = 'supplier'
      end
      item
        Name = 'branch_no'
      end
      item
        Name = 'enquiry'
      end
      item
        Name = 'line'
      end
      item
        Name = 'additional_charge'
      end>
  end
  object qryDelSuppEnqAddChrgs: TFDQuery
    ConnectionName = 'PB'
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
        Name = 'supplier'
      end
      item
        Name = 'branch_no'
      end
      item
        Name = 'enquiry'
      end
      item
        Name = 'line'
      end>
  end
  object dtsrcSuppBrnchConts: TDataSource
    DataSet = qrySelSuppBrnchConts
    Left = 200
    Top = 56
  end
  object qryInsQuote: TFDQuery
    ConnectionName = 'PB'
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
        Name = 'Enquiry'
      end
      item
        Name = 'Date_Point'
      end
      item
        Name = 'Operator'
      end
      item
        Name = 'Cust_Est_Contact'
      end
      item
        Name = 'Quote_Required_By'
        DataType = ftDateTime
      end
      item
        Name = 'Customer_Quote_Date'
        DataType = ftDateTime
      end
      item
        Name = 'Customer'
      end
      item
        Name = 'Branch_No'
      end
      item
        Name = 'Rep'
        DataType = ftInteger
      end
      item
        Name = 'Description'
      end
      item
        Name = 'Enquiry_Status'
      end
      item
        Name = 'Enq_inactive'
      end
      item
        Name = 'Office_Contact'
        DataType = ftInteger
      end
      item
        Name = 'Contact_no'
      end
      item
        Name = 'Enquiry_Type'
      end>
  end
  object qryReserveSlot: TFDQuery
    ConnectionName = 'PB'
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
        Name = 'GUID'
        DataType = ftString
        ParamType = ptInput
      end>
  end
  object qryGetReservedSlot: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT * FROM narrative_line '
      'WHERE narrative_Text = :GUID')
    Left = 552
    Top = 88
    ParamData = <
      item
        Name = 'GUID'
      end>
  end
  object qryDelSuppEnqQtys: TFDQuery
    ConnectionName = 'PB'
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
end
