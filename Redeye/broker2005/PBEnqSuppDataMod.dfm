object PBEnqSuppDataModFrm: TPBEnqSuppDataModFrm
  OnCreate = PBEnqSuppDataModFrmCreate
  OnDestroy = PBEnqSuppDataModFrmDestroy
  Height = 479
  Width = 741
  object EnqHeadSQL: TFDQuery
    ConnectionName = 'pb'
    SQL.Strings = (
      'select Enquiry.*,'
      '       Customer.Name as Customer_Name,'
      '       Customer_Branch.Name as Branch_Name,'
      '       Rep.Name as Rep_Name,'
      '       Customer_Contact.Name as Contact_Name,'
      '       Def_Markup_Perc'
      'from Enquiry, Customer, Customer_Branch, Rep, Customer_Contact'
      'where '
      '(enquiry = :enquiry) and'
      '(Enquiry.rep = rep.rep) AND'
      '(Enquiry.customer = customer.customer) AND'
      '('
      '(Enquiry.customer = customer_Branch.customer) AND'
      '(Enquiry.Branch_no = customer_Branch.Branch_no)'
      ') and'
      '('
      '(Enquiry.customer = Customer_Contact.customer) AND'
      '(Enquiry.Branch_no = Customer_Contact.Branch_no) AND'
      '(Enquiry.contact_no = Customer_Contact.Contact_no)'
      ')'
      '')
    Left = 32
    Top = 16
    ParamData = <
      item
        Name = 'enquiry'
        DataType = ftInteger
      end>
  end
  object EnqHeadSRC: TDataSource
    DataSet = EnqHeadSQL
    Left = 112
    Top = 16
  end
  object EnqLineSQL: TFDQuery
    MasterSource = EnqHeadSRC
    ConnectionName = 'pb'
    SQL.Strings = (
      
        'select EnquiryLine.*, NCR_OTC_Mix.NCR_OTC_Descr, Product_Type.De' +
        'scription'
      'from EnquiryLine, NCR_OTC_Mix, Product_Type'
      'where '
      '(Enquiry = :Enquiry) AND'
      '(EnquiryLine.NCR_OTC_Mix = NCR_OTC_Mix.NCR_OTC_Mix) AND'
      '(EnquiryLine.Product_Type = Product_Type.Product_Type)'
      'order by line')
    Left = 32
    Top = 64
    ParamData = <
      item
        Name = 'Enquiry'
        DataType = ftInteger
      end>
  end
  object EnqLineSRC: TDataSource
    DataSet = EnqLineSQL
    Left = 112
    Top = 64
  end
  object EnqSuppSQL: TFDQuery
    MasterSource = EnqLineSRC
    ConnectionName = 'pb'
    SQL.Strings = (
      'select Supplier_Enquiry.*, '
      '          Supplier.Name, '
      '          Supplier_Branch.Name,'
      '          Supplier_Branch.Phone,'
      '          (select sum(amount)'
      '                                from supp_Enq_Add_Charge'
      
        '                                where supp_Enq_Add_Charge.Enquir' +
        'y = Supplier_Enquiry.enquiry AND'
      
        '                                           supp_Enq_Add_Charge.L' +
        'ine = Supplier_Enquiry.line AND'
      
        '                                           supp_Enq_Add_Charge.S' +
        'upplier = Supplier_Enquiry.Supplier AND'
      
        '                                           supp_Enq_Add_Charge.B' +
        'ranch_no = Supplier_Enquiry.Branch_no) as amount'
      ''
      'from Supplier_Enquiry, Supplier, Supplier_Branch'
      'where'
      '(Enquiry = :Enquiry)'
      'AND'
      '(Line = :Line)'
      'AND'
      '(Supplier_Enquiry.Supplier = Supplier.Supplier) AND'
      '('
      '( Supplier_Enquiry.Supplier = Supplier_Branch.Supplier ) AND'
      '( Supplier_Enquiry.Branch_no = Supplier_Branch.Branch_No ) '
      ')')
    Left = 32
    Top = 120
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
  object EnqSuppSRC: TDataSource
    DataSet = EnqSuppSQL
    Left = 112
    Top = 120
  end
  object EnqSuppQtySQL: TFDQuery
    MasterSource = EnqSuppSRC
    ConnectionName = 'pb'
    SQL.Strings = (
      'select distinct '#9'Supplier,'
      #9#9#9#9#9#9'Branch_no,'
      '                 Enquiry,'
      '                 Line,'
      '                 Quantity,'
      '                 Supplier_EnquiryQty.Price_unit,'
      '                 Response_Quantity,'
      '                 Price_Selected,'
      '                 Marked_up_price,'
      '                 Supplier_Price,'
      #9#9#9#9#9#9'Price_Unit.Description as Price_Unit_Description,'
      #9#9#9#9#9#9'Price_Unit.Price_Unit_Factor'
      
        'from Price_Unit right join Supplier_EnquiryQty on Price_Unit.Pri' +
        'ce_Unit ='
      
        '                                                                ' +
        '            Supplier_EnquiryQty.Price_Unit'
      'where'
      '('
      '(enquiry = :Enquiry) AND'
      '(Line = :Line) AND'
      '(Supplier = :Supplier) AND'
      '(Branch_no = :Branch_no)'
      ')'
      'order by Quantity')
    Left = 32
    Top = 176
    ParamData = <
      item
        Name = 'Enquiry'
        DataType = ftInteger
      end
      item
        Name = 'Line'
        DataType = ftInteger
      end
      item
        Name = 'Supplier'
        DataType = ftInteger
      end
      item
        Name = 'Branch_no'
        DataType = ftInteger
      end>
  end
  object EnqSuppQtySRC: TDataSource
    DataSet = EnqSuppQtySQL
    Left = 112
    Top = 176
  end
  object EnqSuppChgsSQL: TFDQuery
    MasterSource = EnqSuppSRC
    ConnectionName = 'PB'
    SQL.Strings = (
      'select distinct '#9'Supplier,'
      #9#9#9#9#9#9'      Branch_no,'
      '                  Enquiry,'
      '                  Line,'
      '                  Additional_Charge,'
      '                  Details,'
      '                  Amount,'
      '                  Quotation_Price,'
      '                  Charge_type'
      'from Supp_Enq_Add_charge'
      'where'
      '('
      '(enquiry = :Enquiry) AND'
      '(Line = :Line) AND'
      '(Supplier = :Supplier) AND'
      '(Branch_no = :Branch_no)'
      ')'
      'order by Additional_Charge'
      ' ')
    Left = 32
    Top = 232
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
        Name = 'Branch_no'
      end>
  end
  object DelChargeSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'delete from Supp_Enq_Add_Charge'
      'where Supplier = :Supplier and'
      'Branch_no = :Branch_no and'
      'Enquiry = :Enquiry and'
      'Line = :Line')
    Left = 216
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
  object AddEnqSuppChgsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'insert into Supp_Enq_Add_Charge'
      '          (Supplier,'
      '          Branch_no,'
      '          Enquiry,'
      '          Line,'
      '          Additional_Charge,'
      '          Details,'
      '          Amount,'
      '          Quotation_Price,'
      '          Charge_type)'
      'values'
      '        (:Supplier,'
      '        :Branch_no,'
      '        :Enquiry,'
      '        :Line,'
      '        :Additional_Charge,'
      '        :Details,'
      '        :Amount,'
      '        :Quotation_Price,'
      '        :Charge_type)'
      ' ')
    Left = 216
    Top = 56
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
      end
      item
        Name = 'Additional_Charge'
      end
      item
        Name = 'Details'
      end
      item
        Name = 'Amount'
      end
      item
        Name = 'Quotation_Price'
      end
      item
        Name = 'Charge_type'
        DataType = ftString
      end>
  end
end
