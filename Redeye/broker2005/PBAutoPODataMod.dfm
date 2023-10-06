object PBAutoPODM: TPBAutoPODM
  Height = 479
  Width = 741
  object GetLinesNotPOedSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Enquiry_Status'
      'From EnquiryLine'
      'Where (Enquiry = :Enquiry) and'
      '      (Enquiry_Status < 90)')
    Left = 48
    Top = 8
    ParamData = <
      item
        Name = 'Enquiry'
      end>
  end
  object UpdEnqHeadSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update Enquiry'
      'Set Enquiry_Status = :Enquiry_Status'
      'Where (Enquiry = :Enquiry)')
    Left = 48
    Top = 56
    ParamData = <
      item
        Name = 'Enquiry_Status'
      end
      item
        Name = 'Enquiry'
      end>
  end
  object AddNotesSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Insert Into Int_Sel'
      '(Int_Sel_Code, Sel1, Sel2, Sel3, Sel4, Text100)'
      'Select'
      
        '( :Int_Sel_Code ) as ISL, ( :Sel1 ) as Sel1, Narrative_Line.Narr' +
        'ative_Line,'
      
        '               ( 0 ) As Sel3, ( 0 ) as Sel4, Narrative_Line.Narr' +
        'ative_Text'
      'From Narrative_Line'
      'Where (Narrative = :Narrative)'
      '')
    Left = 48
    Top = 104
    ParamData = <
      item
        Name = 'Int_Sel_Code'
      end
      item
        Name = 'Sel1'
      end
      item
        Name = 'Narrative'
      end>
  end
  object UpdEnqLineSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Update EnquiryLine'
      'Set Enquiry_Status = 90,'
      '    SelectedSupplier = :SelectedSupplier,'
      '    SelectedBranch_No = :SelectedBranch_No'
      'Where (Enquiry = :Enquiry) and'
      '      (Line = :Line)')
    Left = 48
    Top = 152
    ParamData = <
      item
        Name = 'SelectedSupplier'
      end
      item
        Name = 'SelectedBranch_No'
      end
      item
        Name = 'Enquiry'
      end
      item
        Name = 'Line'
      end>
  end
  object GetExtChgsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select *'
      'From Supp_Enq_Add_Charge'
      'Where (Enquiry = :Enquiry) and'
      '      (Line = :Line) and'
      '      (Supplier = :Supplier) and'
      '      (Branch_No = :Branch_No)'
      'Order By Additional_Charge'
      '')
    Left = 48
    Top = 202
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
        Name = 'Branch_No'
      end>
  end
  object GetQtysSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      
        'Select Supplier_EnquiryQty.Supplier_Price, Supplier_EnquiryQty.P' +
        'rice_Unit,'
      '      (select Description from Price_Unit'
      
        '       '#9#9'where Price_Unit.Price_Unit = Supplier_EnquiryQty.Price' +
        '_Unit) as Price_Unit_Descr,'
      '      (select Price_Unit_Factor from Price_Unit'
      
        '       '#9#9'where Price_Unit.Price_Unit = Supplier_EnquiryQty.Price' +
        '_Unit) as Price_Unit_factor,'
      
        '       Supplier_EnquiryQty.Response_Quantity, Supplier_EnquiryQt' +
        'y.Marked_Up_Price,'
      
        '       Supplier_EnquiryQty.Supplier, Supplier_EnquiryQty.Branch_' +
        'No,'
      '       Supplier_EnquiryQty.Quantity,'
      '       Supplier.Supplier, Supplier.Name as Supp_Name,'
      
        '       Supplier_Branch.Branch_No, Supplier_Branch.Name as Branch' +
        '_Name,'
      '       supplier_branch.Building_No_name,'
      '       supplier_branch.Street,'
      '       supplier_branch.Locale,'
      '       supplier_branch.Town,'
      '       supplier_branch.Postcode,'
      '       Supplier_Enquiry.Supplier_Reference,'
      '       Enquiry_LineQuantity.Price_Unit as Sell_Unit,'
      '       (select Description from Price_Unit'
      
        '         where Price_Unit.Price_Unit = Enquiry_LineQuantity.Pric' +
        'e_Unit) as Sell_Unit_Descr,'
      '       (select Price_Unit_Factor from Price_Unit'
      
        '         where Price_Unit.Price_Unit = Enquiry_LineQuantity.Pric' +
        'e_Unit) as Sell_Unit_Factor,'
      '       Supplier.Vat_Code_Def,'
      '       VAT_Code.Description as VAT_Description,'
      '       Supplier_Enquiry.Contact_no,'
      '       Supplier_Enquiry.Run_on_Quantity,'
      '       Supplier_Enquiry.Run_on_Price'
      'From Supplier_EnquiryQty'
      '     INNER JOIN (Enquiry_LineQuantity'
      '     INNER JOIN (Supplier_Enquiry'
      '     INNER JOIN (Supplier_Branch'
      '     INNER JOIN (Supplier LEFT JOIN Vat_Code'
      '       ON Supplier.Vat_Code_Def = Vat_code.Vat_Code)'
      '       ON Supplier_Branch.Supplier = Supplier.Supplier)'
      '       ON Supplier_Enquiry.Supplier = Supplier_Branch.Supplier'
      
        '       and Supplier_Enquiry.Branch_no = Supplier_Branch.Branch_n' +
        'o)'
      
        '       ON Enquiry_LineQuantity.Supplier = Supplier_Enquiry.Suppl' +
        'ier'
      
        '       and Enquiry_LineQuantity.Branch_no = Supplier_Enquiry.Bra' +
        'nch_no'
      
        '       and Enquiry_LineQuantity.Enquiry = Supplier_Enquiry.Enqui' +
        'ry'
      '       and Enquiry_LineQuantity.Line = Supplier_Enquiry.Line)'
      
        '       ON Supplier_EnquiryQty.Enquiry = Enquiry_LineQuantity.Enq' +
        'uiry'
      '       and Supplier_EnquiryQty.Line = Enquiry_LineQuantity.Line'
      
        '       and Supplier_EnquiryQty.Quantity = Enquiry_LineQuantity.Q' +
        'uantity'
      'Where   (Supplier_EnquiryQty.Enquiry = :Enquiry) and'
      '        (Supplier_EnquiryQty.Line = :Line) and'
      '        (Supplier_EnquiryQty.Price_Selected = '#39'Y'#39')'
      'Order By Supplier_EnquiryQty.Quantity'
      ''
      ' '
      ' '
      ' '
      ' ')
    Left = 132
    Top = 26
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
  object QtysSRC: TDataSource
    DataSet = GetQtysSQL
    Left = 132
    Top = 82
  end
  object GetProofStatSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Proof_Status, Description'
      'From Proof_Status'
      'Order By Proof_Status')
    Left = 132
    Top = 134
  end
  object ProofStatSRC: TDataSource
    DataSet = GetProofStatSQL
    Left = 132
    Top = 182
  end
  object GetContactSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from Supplier_BranchContacts'
      'where Supplier = :Supplier and'
      'Branch_no = :Branch_no and'
      '((inactive = NULL) or (inactive = '#39'N'#39'))'
      'Order by Name')
    Left = 198
    Top = 11
    ParamData = <
      item
        Name = 'Supplier'
        DataType = ftInteger
      end
      item
        Name = 'Branch_no'
        DataType = ftInteger
      end>
  end
  object ContactSRC: TDataSource
    DataSet = GetContactSQL
    Left = 198
    Top = 59
  end
  object GetVATSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select * From Vat_Code'
      'Order By Vat_Code')
    Left = 200
    Top = 172
  end
  object VATSRC: TDataSource
    DataSet = GetVATSQL
    Left = 200
    Top = 116
  end
  object InvMethSRC: TDataSource
    DataSet = GetInvMethSQL
    Left = 136
    Top = 284
  end
  object GetInvMethSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select *'
      'From Purch_Ord_Inv_Method'
      'Order By Description')
    Left = 136
    Top = 232
  end
  object GetEnqSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT EnquiryLine.Enquiry, EnquiryLine.Line,'
      '       Enquiry.Customer, Enquiry.Rep, Enquiry.Branch_no,'
      '       Enquiry.Contact_No,'
      '       EnquiryLine.Ordered_Quantity,'
      '       EnquiryLine.Ordered_Price,'
      '       EnquiryLine.Product_Type, EnquiryLine.Form_Description,'
      '       EnquiryLine.Price_Unit,'
      '       Customer.Name, EnquiryLine.Narrative,'
      '       Customer.VAT_Code_Def,'
      '       EnquiryLine.Forms_per_box,'
      '       Enquiry.Office_Contact,'
      '       EnquiryLine.Depth,'
      '       EnquiryLine.Depth_unit,'
      '       EnquiryLine.Width,'
      '       EnquiryLine.Width_Unit,'
      '       EnquiryLine.Artwork_Instructions,'
      '       EnquiryLine.NCR_OTC_Mix,'
      '       EnquiryLine.No_Of_Plates,'
      '       EnquiryLine.Form_Reference,'
      '       EnquiryLine.Run_on_Quantity,'
      '       EnquiryLine.Run_on_Price,'
      '       EnquiryLine.Run_on_Cost,'
      '       Customer.Invoice_Upfront,'
      '       EnquiryLine.job_type'
      'FROM Enquiry, EnquiryLine, Customer'
      'Where (EnquiryLine.Enquiry = :Enquiry) and'
      '      (EnquiryLine.Line = :Line) and'
      '      (Enquiry.Enquiry = EnquiryLine.Enquiry) and'
      '      (Enquiry.Customer = Customer.Customer) '
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 48
    Top = 248
    ParamData = <
      item
        Name = 'Enquiry'
      end
      item
        Name = 'Line'
      end>
  end
  object GetExistPOsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select Purchase_Order.Purchase_Order,'
      '       Purchase_Order.Supplier,'
      '       Purchase_Order.Branch_No,'
      '       Supplier.Name as Supp_Name,'
      '       Supplier.Supplier,'
      '       Supplier_Branch.Branch_no,'
      '       Supplier_Branch.Name as Branch_Name,'
      '       Purchase_Order.Date_Point,'
      '       Purchase_Order.Contact_No,'
      '       Purchase_Order.Purch_Ord_Inv_Method,'
      '       Purch_Ord_Head_Status.Description as Status_Descr,'
      '       Purch_Ord_Head_Status.Purch_Ord_Head_Status,'
      '       Purchase_Order.Office_Contact'
      
        'From  Purchase_Order, Supplier, Supplier_Branch, Purch_Ord_Head_' +
        'Status'
      'Where (Purchase_Order.Supplier = :Supplier) and'
      '      (Purchase_Order.Branch_No = :Branch_No) and'
      '      (Purchase_Order.Purch_Ord_Head_Status < 20) and'
      '      (Supplier.Supplier = Purchase_Order.Supplier) and'
      '      (Supplier_Branch.Supplier = Purchase_Order.Supplier) and'
      '      (Supplier_Branch.Branch_No = Purchase_Order.Branch_No) and'
      
        '      (Purch_Ord_Head_Status.Purch_Ord_Head_Status = Purchase_Or' +
        'der.Purch_Ord_Head_Status)'
      'Order By Purchase_Order.Purchase_Order desc')
    Left = 48
    Top = 304
    ParamData = <
      item
        Name = 'Supplier'
      end
      item
        Name = 'Branch_No'
      end>
  end
  object GetPartsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT * FROM EnquiryLinePart_Detail'
      'WHERE Enquiry = :Enquiry AND Line = :Line'
      'ORDER BY Part_No')
    Left = 212
    Top = 226
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
  object GetAddDetsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'SELECT * FROM EnquiryLineAdditionl_Dtls'
      'WHERE Enquiry = :Enquiry AND Line = :Line'
      'ORDER BY Additional_Details')
    Left = 220
    Top = 282
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
  object Old_GetQtysSQL: TFDQuery
    SQL.Strings = (
      
        'Select Supplier_EnquiryQty.Supplier_Price, Supplier_EnquiryQty.P' +
        'rice_Unit,'
      '       '#9#9'(select Description from Price_Unit'
      
        '       '#9#9'where Price_Unit.Price_Unit = Supplier_EnquiryQty.Price' +
        '_Unit) as Price_Unit_Descr,'
      
        '       Supplier_EnquiryQty.Response_Quantity, Supplier_EnquiryQt' +
        'y.Marked_Up_Price,'
      
        '       Supplier_EnquiryQty.Supplier, Supplier_EnquiryQty.Branch_' +
        'No,'
      '       Supplier_EnquiryQty.Quantity,'
      '       Supplier.Supplier, Supplier.Name as Supp_Name,'
      
        '       Supplier_Branch.Branch_No, Supplier_Branch.Name as Branch' +
        '_Name,'
      '       Supplier_Enquiry.Supplier_Reference,'
      '       Enquiry_LineQuantity.Price_Unit as Sell_Unit,'
      '       '#9#9'(select Description from Price_Unit'
      
        '       '#9#9'where Price_Unit.Price_Unit = Enquiry_LineQuantity.Pric' +
        'e_Unit) as Sell_Unit_Descr,'
      '       Supplier.Vat_Code_Def,'
      '       VAT_Code.Description as VAT_Description   '
      
        'From Supplier_EnquiryQty, Supplier, Supplier_Branch, Supplier_En' +
        'quiry, Enquiry_LineQuantity, VAT_Code'
      'Where   (Supplier_EnquiryQty.Enquiry = :Enquiry) and'
      '        (Supplier_EnquiryQty.Line = :Line) and'
      '        (Supplier_EnquiryQty.Price_Selected = '#39'Y'#39') and'
      '        (Supplier.Supplier = Supplier_EnquiryQty.Supplier) and'
      
        '        (Supplier_Branch.Supplier = Supplier_EnquiryQty.Supplier' +
        ') and'
      
        '        (Supplier_Branch.Branch_No = Supplier_EnquiryQty.Branch_' +
        'No) and'
      
        '        (Supplier_Enquiry.Supplier = Supplier_EnquiryQty.Supplie' +
        'r) and'
      
        '        (Supplier_Enquiry.Branch_No = Supplier_EnquiryQty.Branch' +
        '_No) and'
      
        '        (Supplier_Enquiry.Enquiry = Supplier_EnquiryQty.Enquiry)' +
        ' and'
      '        (Supplier_Enquiry.Line = Supplier_EnquiryQty.Line) and'
      
        '        (Enquiry_LineQuantity.Enquiry = Supplier_EnquiryQty.Enqu' +
        'iry) and'
      
        '        (Enquiry_LineQuantity.Line = Supplier_EnquiryQty.Line) a' +
        'nd'
      
        '        (Enquiry_LineQuantity.Quantity = Supplier_EnquiryQty.Qua' +
        'ntity) and'
      '        (Supplier.VAT_Code_Def *= VAT_Code.VAT_Code)'
      'Order By Supplier_EnquiryQty.Quantity')
    Left = 272
    Top = 32
    ParamData = <
      item
        Name = 'Enquiry'
      end
      item
        Name = 'Line'
      end>
  end
  object GetQuestionsSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select *'
      'From Product_TypeQuestion'
      'Where Product_Type = :Product_Type'
      'Order By Sequence_Reference')
    Left = 296
    Top = 96
    ParamData = <
      item
        Name = 'Product_Type'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object GetAnswersSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'Select *'
      'From Enquiry_Questions'
      'Where Enquiry = :Enquiry and'
      '      Line = :Line and'
      '      Product_Type = :Product_Type'
      ' '
      ' '
      ' ')
    Left = 296
    Top = 152
    ParamData = <
      item
        Name = 'Enquiry'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Line'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'Product_Type'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object GetPriceUnitSQL: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from Price_unit'
      'where Price_unit = :Price_Unit')
    Left = 296
    Top = 224
    ParamData = <
      item
        Name = 'Price_Unit'
      end>
  end
  object qrySelRep: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from rep where rep = :rep;')
    Left = 296
    Top = 280
    ParamData = <
      item
        Name = 'rep'
      end>
  end
  object qrySelCustAddress: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select customer.name,'
      '  customer_branch.name as branch_name,'
      '  customer_branch.Building_No_name,'
      '  customer_branch.Street,'
      '  customer_branch.Locale,'
      '  customer_branch.Town,'
      '  customer_branch.Postcode'
      'from customer inner join customer_branch on '
      '  customer.customer = customer_branch.customer'
      'where customer_branch.customer = :customer and'
      ' customer_branch.branch_no = :branch')
    Left = 280
    Top = 328
    ParamData = <
      item
        Name = 'customer'
      end
      item
        Name = 'branch'
      end>
  end
  object qrySelCompanyAddress: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from company')
    Left = 384
    Top = 16
  end
  object qryJobTypes: TFDQuery
    ConnectionName = 'PB'
    SQL.Strings = (
      'select * from job_type where job_type = :job_type;')
    Left = 384
    Top = 68
    ParamData = <
      item
        Name = 'job_type'
      end>
  end
end
