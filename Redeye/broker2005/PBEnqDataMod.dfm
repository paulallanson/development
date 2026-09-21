object PBEnqDataModFrm: TPBEnqDataModFrm
  OnCreate = PBEnqDataModFrmCreate
  OnDestroy = PBEnqDataModFrmDestroy
  Height = 599
  Width = 926
  PixelsPerInch = 120
  object EnqHeadSQL: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select '#9'Enquiry.*,'
      '        Customer.Name as Customer_Name,'
      '        Customer_Branch.Name as Branch_Name,'
      '        Rep.Name as Rep_Name,'
      '        Operator.Name as Office_Name'
      'from Enquiry, Customer, Customer_Branch, Rep, Operator'
      'where'
      'enquiry = :enquiry AND'
      '(Enquiry.rep = rep.rep) AND'
      '(Enquiry.customer = customer.customer) AND'
      '(Enquiry.office_Contact = operator.operator) AND'
      '('
      '(Enquiry.customer = customer_Branch.customer) AND'
      '(Enquiry.Branch_no = customer_Branch.Branch_no)'
      ')'
      '')
    Left = 30
    Top = 10
    ParamData = <
      item
        Name = 'enquiry'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object EnqLineSQL: TFDQuery
    MasterSource = EnqHeadSRC
    ConnectionName = 'pb'
    SQL.Strings = (
      'select  EnquiryLine.*,'
      '        NCR_OTC_Mix.NCR_OTC_Descr,'
      '        Product_Type.Description,'
      '        Form_Reference.Form_Reference_ID,'
      '        Form_Reference.Form_Reference_Descr'
      'FROM Product_Type'
      '           INNER JOIN (NCR_OTC_Mix'
      '           INNER JOIN (Form_Reference RIGHT JOIN EnquiryLine'
      
        '           ON Form_Reference.Form_Reference = EnquiryLine.Form_R' +
        'eference)'
      '           ON NCR_OTC_Mix.NCR_OTC_Mix = EnquiryLine.NCR_OTC_Mix)'
      
        '           ON Product_Type.Product_Type = EnquiryLine.Product_Ty' +
        'pe'
      'where Enquiry = :Enquiry'
      'order by line'
      ' ')
    Left = 30
    Top = 70
    ParamData = <
      item
        Name = 'Enquiry'
        DataType = ftInteger
      end>
  end
  object EnqHeadSRC: TDataSource
    DataSet = EnqHeadSQL
    Left = 150
    Top = 10
  end
  object EnqLineQtySQL: TFDQuery
    MasterSource = EnqLineSRC
    ConnectionName = 'pb'
    SQL.Strings = (
      'select *'
      'from Enquiry_LineQuantity'
      'where (Enquiry = :Enquiry) AND'
      '(Line = :Line)')
    Left = 30
    Top = 130
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
  object EnqLineQSQL: TFDQuery
    MasterSource = EnqLineSRC
    ConnectionName = 'pb'
    SQL.Strings = (
      
        'select Enquiry_Questions.*, Question_Text, Product_TypeQuestion.' +
        'Prompt_Type'
      'from Enquiry_Questions, Product_TypeQuestion'
      'where '
      '('
      
        '(Enquiry_Questions.Product_Type = Product_TypeQuestion.Product_T' +
        'ype) AND'
      '(Enquiry_Questions.Question = Product_TypeQuestion.Question)'
      ') AND'
      '(Enquiry = :Enquiry) AND'
      '(Line = :Line)')
    Left = 30
    Top = 190
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
  object EnqLineAddSQL: TFDQuery
    MasterSource = EnqLineSRC
    ConnectionName = 'pb'
    SQL.Strings = (
      'select *'
      'from EnquiryLineAdditionl_Dtls'
      'where (enquiry = :enquiry) AND'
      '(Line = :Line)'
      'order by Additional_Details')
    Left = 30
    Top = 250
    ParamData = <
      item
        Name = 'enquiry'
      end
      item
        Name = 'Line'
        DataType = ftInteger
      end>
  end
  object EnqLinePartSQL: TFDQuery
    MasterSource = EnqLineSRC
    ConnectionName = 'pb'
    SQL.Strings = (
      'select *'
      'from EnquiryLinePart_Detail'
      'where (Enquiry = :Enquiry) AND'
      '(Line = :Line)')
    Left = 30
    Top = 310
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
  object EnqLineCapSQL: TFDQuery
    MasterSource = EnqLineSRC
    ConnectionName = 'pb'
    SQL.Strings = (
      'select EnquiryLinPrdct_TypCpblty.*, Description '
      'from EnquiryLinPrdct_TypCpblty, Product_TypeCapability'
      'where'
      '('
      
        '(EnquiryLinPrdct_TypCpblty.Product_Type = Product_TypeCapability' +
        '.Product_Type) AND'
      
        '(EnquiryLinPrdct_TypCpblty.Capability = Product_TypeCapability.C' +
        'apability)'
      ') AND'
      '(enquiry = :Enquiry) AND'
      '(Line = :Line)')
    Left = 30
    Top = 370
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
  object EnqLineSRC: TDataSource
    DataSet = EnqLineSQL
    Left = 150
    Top = 70
  end
  object EnqLineQtySRC: TDataSource
    DataSet = EnqLineQtySQL
    Left = 150
    Top = 130
  end
  object EnqLineQSRC: TDataSource
    DataSet = EnqLineQSQL
    Left = 150
    Top = 190
  end
  object EnqLineAddSRC: TDataSource
    DataSet = EnqLineAddSQL
    Left = 150
    Top = 250
  end
  object EnqLinePartSRC: TDataSource
    DataSet = EnqLinePartSQL
    Left = 150
    Top = 310
  end
  object EnqLineCapSRC: TDataSource
    DataSet = EnqLineCapSQL
    Left = 150
    Top = 370
  end
  object EnqLineSuppSQL: TFDQuery
    MasterSource = EnqLineSRC
    ConnectionName = 'pb'
    SQL.Strings = (
      'SELECT '#9'Supplier_Enquiry.Supplier, '
      #9'Supplier_Enquiry.Branch_no, '
      #9'Supplier_Enquiry.Enquiry, '
      #9'Supplier_Enquiry.Line, '
      #9'Supplier_Enquiry.Act_Response_Date, '
      #9'Supplier_Enquiry.Delivery_Comment, '
      #9'Supplier_Enquiry.Supplier_Reference, '
      #9'Supplier_Enquiry.Printed_Enquiry, '
      #9'Supplier_Enquiry.Is_Updated, '
      #9'Supplier_Enquiry.Contact_no, '
      #9'Supplier_BranchContacts.Name as Contact_name,'
      '  Supplier_BranchContacts.inactive as Contact_Inactive,'
      #9'Supplier.Name, '
      #9'Supplier_Branch.Name as Branch_Name,'
      '  Supplier.Acc_Active'
      'FROM ((Supplier_BranchContacts '
      
        #9'RIGHT JOIN Supplier_Enquiry ON (Supplier_BranchContacts.Contact' +
        '_no = Supplier_Enquiry.Contact_no) '
      
        #9'AND (Supplier_BranchContacts.Supplier = Supplier_Enquiry.Suppli' +
        'er) '
      
        #9'AND (Supplier_BranchContacts.Branch_no = Supplier_Enquiry.Branc' +
        'h_no)) '
      
        #9'INNER JOIN Supplier ON Supplier_Enquiry.Supplier = Supplier.Sup' +
        'plier) '
      
        #9'INNER JOIN Supplier_Branch ON (Supplier_Enquiry.Branch_no = Sup' +
        'plier_Branch.Branch_no) '
      #9'AND (Supplier_Enquiry.Supplier = Supplier_Branch.Supplier)'
      'WHERE'
      '(Enquiry = :Enquiry)'
      'AND'
      '(Line = :Line)'
      ''
      ' ')
    Left = 30
    Top = 430
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
  object EnqLineSuppSRC: TDataSource
    DataSet = EnqLineSuppSQL
    Left = 150
    Top = 430
  end
  object OldEnqLineSQL: TFDQuery
    MasterSource = EnqHeadSRC
    ConnectionName = 'pb'
    SQL.Strings = (
      'select  EnquiryLine.*,'
      '        NCR_OTC_Mix.NCR_OTC_Descr,'
      '        Product_Type.Description,'
      '        Form_Reference.Form_Reference_ID,'
      '        Form_Reference.Form_Reference_Descr'
      
        'from EnquiryLine left join Form_Reference on EnquiryLine.Form_Re' +
        'ference = Form_Reference.Form_Reference,'
      '     NCR_OTC_Mix, Product_Type'
      'where'
      '(Enquiry = :Enquiry) and'
      '(EnquiryLine.NCR_OTC_Mix = NCR_OTC_Mix.NCR_OTC_Mix) AND'
      '(EnquiryLine.Product_Type = Product_Type.Product_Type)'
      'order by line'
      ' '
      ' ')
    Left = 260
    Top = 10
    ParamData = <
      item
        Name = 'Enquiry'
        DataType = ftInteger
      end>
  end
  object EnqLineOptSQL: TFDQuery
    MasterSource = EnqLineSRC
    ConnectionName = 'pb'
    SQL.Strings = (
      'select EnquiryLineProduct_TypeOChg.*, Description '
      'from EnquiryLineProduct_TypeOChg, Product_TypeOChg'
      'where'
      '('
      
        '(EnquiryLineProduct_TypeOChg.Product_Type = Product_TypeOChg.Pro' +
        'duct_Type) AND'
      
        '(EnquiryLineProduct_TypeOChg.Optional_Charge = Product_TypeOChg.' +
        'Optional_Charge)'
      ') AND'
      '(enquiry = :Enquiry) AND'
      '(Line = :Line)')
    Left = 260
    Top = 370
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
  object DataSource1: TDataSource
    DataSet = EnqLineOptSQL
    Left = 330
    Top = 370
  end
  object qryDelEnqLineDocs: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from EnquiryLineDocs'
      'where enquiry = :enquiry')
    Left = 375
    Top = 15
    ParamData = <
      item
        Name = 'enquiry'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object qryInsEnqLineDoc: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'insert into EnquiryLineDocs'
      '(Enquiry, Line, Document_no, Document_Title, Document)'
      'values'
      '(:Enquiry, :Line, :Document_no, :Document_Title, :Document)')
    Left = 375
    Top = 70
    ParamData = <
      item
        Name = 'Enquiry'
      end
      item
        Name = 'Line'
      end
      item
        Name = 'Document_no'
      end
      item
        Name = 'Document_Title'
      end
      item
        Name = 'Document'
      end>
  end
  object qrySelEnqLineDocs: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from EnquiryLineDocs '
      'where enquiry = :enquiry and line = :line '
      'order by document_no')
    Left = 375
    Top = 125
    ParamData = <
      item
        Name = 'enquiry'
      end
      item
        Name = 'line'
      end>
  end
end
